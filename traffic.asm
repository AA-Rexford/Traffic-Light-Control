section .data
    ; --- Bright Colored Light Messages ---
    ; We use ANSI escape codes [1;31m, [1;33m, [1;32m to make the colors EXTREMELY BRIGHT and BOLD
    
    red_msg db 0x1B, '[1;31m', '[ RED ]    STOP!', 0x1B, '[0m', 0xA
    red_len equ $ - red_msg

    yellow_msg db 0x1B, '[1;33m', '[ YELLOW ] CAUTION!', 0x1B, '[0m', 0xA
    yellow_len equ $ - yellow_msg

    green_msg db 0x1B, '[1;32m', '[ GREEN ]  GO!', 0x1B, '[0m', 0xA
    green_len equ $ - green_msg

    ; Prompt message
    prompt_msg db 0xA, 'Press ENTER to repeat cycle (or q to quit): '
    prompt_len equ $ - prompt_msg

    ; Newline
    newline db 0xA
    nl_len equ $ - newline

    ; --- Timer Struct (sys_nanosleep) ---
    timeval:
        tv_sec  dq 0          ; Seconds (will be updated dynamically)
        tv_nsec dq 0          ; Nanoseconds

section .bss
    ; Buffer to capture the ENTER key or 'q'
    input resb 2

section .text
    global _start

_start:

cycle_start:
    ; --- STATE 1: RED ---
    mov rax, 1              ; sys_write
    mov rdi, 1              ; stdout
    mov rsi, red_msg
    mov rdx, red_len
    syscall

    ; Wait 2 seconds
    mov qword [tv_sec], 2
    call do_delay

    ; --- STATE 2: YELLOW ---
    mov rax, 1
    mov rdi, 1
    mov rsi, yellow_msg
    mov rdx, yellow_len
    syscall

    ; Wait 1 second
    mov qword [tv_sec], 1
    call do_delay

    ; --- STATE 3: GREEN ---
    mov rax, 1
    mov rdi, 1
    mov rsi, green_msg
    mov rdx, green_len
    syscall

    ; Wait 2 seconds before showing prompt
    mov qword [tv_sec], 2
    call do_delay

    ; --- PROMPT FOR NEXT CYCLE ---
    mov rax, 1
    mov rdi, 1
    mov rsi, prompt_msg
    mov rdx, prompt_len
    syscall

    ; Read user input
    mov rax, 0              ; sys_read
    mov rdi, 0              ; stdin
    mov rsi, input
    mov rdx, 2
    syscall

    ; Check if user pressed 'q'
    cmp byte [input], 'q'
    je exit

    ; Print a blank line before the next cycle starts for readability
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, nl_len
    syscall

    ; Repeat the cycle
    jmp cycle_start

; --- Subroutine: Delay ---
do_delay:
    mov rax, 35             ; sys_nanosleep (35 in 64-bit Linux kernel)
    mov rdi, timeval        ; Pass the memory address of our 'timeval' struct
    xor rsi, rsi            ; Set RSI to 0 (NULL). We don't care about remaining time.
    syscall
    ret

; --- Graceful Exit ---
exit:
    mov rax, 1              ; Print final newline
    mov rdi, 1
    mov rsi, newline
    mov rdx, nl_len
    syscall

    mov rax, 60             ; sys_exit
    mov rdi, 0              ; Exit code 0
    syscall
