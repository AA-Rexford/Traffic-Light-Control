section .data
    ; --- Huge ASCII Art Circular Light Messages ---
    ; Using ANSI escape codes [1;31m, [38;5;226m, [1;32m for EXTREMELY BRIGHT colors
    ; We manually draw large circles using ASCII hyphens, commas, and dots as requested.
    
    red_msg db 0x1B, '[1;31m'
            db '      .---------.      ', 0xA
            db '    ."           ".    ', 0xA
            db '   /     RED       \   ', 0xA
            db '  |     STOP!       |  ', 0xA
            db '   \               /   ', 0xA
            db '    ".           ."    ', 0xA
            db '      `---------`      ', 0xA
            db 0x1B, '[0m', 0xA
    red_len equ $ - red_msg

    yellow_msg db 0x1B, '[38;5;226m'
               db '      .---------.      ', 0xA
               db '    ."           ".    ', 0xA
               db '   /    YELLOW     \   ', 0xA
               db '  |   GET READY!    |  ', 0xA
               db '   \               /   ', 0xA
               db '    ".           ."    ', 0xA
               db '      `---------`      ', 0xA
               db 0x1B, '[0m', 0xA
    yellow_len equ $ - yellow_msg

    green_msg db 0x1B, '[1;32m'
              db '      .---------.      ', 0xA
              db '    ."           ".    ', 0xA
              db '   /    GREEN      \   ', 0xA
              db '  |       GO!       |  ', 0xA
              db '   \               /   ', 0xA
              db '    ".           ."    ', 0xA
              db '      `---------`      ', 0xA
              db 0x1B, '[0m', 0xA
    green_len equ $ - green_msg

    ; Prompt message
    prompt_msg db 0xA, 'Press ENTER to trigger cycle (or q to quit): '
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

    ; Wait 1.5 seconds (using 1 sec for simplicity in assembly loop)
    mov qword [tv_sec], 1
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

    ; Wait 1 second before showing prompt
    mov qword [tv_sec], 1
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

    ; Print a blank line before the next cycle starts
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
