section .data
    ; --- Terminal Control Codes ---
    ; Escape sequence to clear the screen and move cursor to top left
    clear_screen db 0x1B, '[2J', 0x1B, '[H'
    clear_len equ $ - clear_screen

    ; --- Colored Light Messages ---
    ; We use ANSI escape codes to add real colors to the terminal!
    
    red_msg db 0x1B, '[31m'   ; Set text to RED
            db '   ===================   ', 0xA
            db '  |     [ RED ]       |  ', 0xA
            db '  |      STOP!        |  ', 0xA
            db '   ===================   ', 0xA
            db 0x1B, '[0m'     ; Reset color back to normal
    red_len equ $ - red_msg

    green_msg db 0x1B, '[32m' ; Set text to GREEN
              db '   ===================   ', 0xA
              db '  |    [ GREEN ]      |  ', 0xA
              db '  |       GO!         |  ', 0xA
              db '   ===================   ', 0xA
              db 0x1B, '[0m'   ; Reset color
    green_len equ $ - green_msg

    yellow_msg db 0x1B, '[33m'; Set text to YELLOW
               db '   ===================   ', 0xA
               db '  |   [ YELLOW ]      |  ', 0xA
               db '  |    CAUTION!       |  ', 0xA
               db '   ===================   ', 0xA
               db 0x1B, '[0m'  ; Reset color
    yellow_len equ $ - yellow_msg

    ; --- Timer Struct (sys_nanosleep) ---
    ; This struct requires two 64-bit integers: seconds and nanoseconds.
    timeval:
        tv_sec  dq 0          ; Seconds (will be updated dynamically before calling)
        tv_nsec dq 0          ; Nanoseconds (kept at 0)

section .text
    global _start

_start:
    ; Infinite loop for the traffic light

red_state:
    ; 1. Clear Screen
    call do_clear

    ; 2. Print RED light
    mov rax, 1              ; sys_write
    mov rdi, 1              ; stdout
    mov rsi, red_msg        ; Memory address of our RED message
    mov rdx, red_len        ; Length of the message
    syscall

    ; 3. Wait 3 seconds
    mov qword [tv_sec], 3   ; Dynamically set the delay struct to 3 seconds
    call do_delay

green_state:
    ; 1. Clear Screen
    call do_clear

    ; 2. Print GREEN light
    mov rax, 1
    mov rdi, 1
    mov rsi, green_msg
    mov rdx, green_len
    syscall

    ; 3. Wait 4 seconds
    mov qword [tv_sec], 4   ; Set delay to 4 seconds
    call do_delay

yellow_state:
    ; 1. Clear Screen
    call do_clear

    ; 2. Print YELLOW light
    mov rax, 1
    mov rdi, 1
    mov rsi, yellow_msg
    mov rdx, yellow_len
    syscall

    ; 3. Wait 1.5 seconds (we'll just do 1 second for simplicity)
    mov qword [tv_sec], 1   ; Set delay to 1 second
    call do_delay

    ; Loop back to beginning, simulating a continuous traffic light
    jmp red_state

; --- Subroutine: Clear Screen ---
do_clear:
    mov rax, 1              ; sys_write
    mov rdi, 1              ; stdout
    mov rsi, clear_screen   ; Address of the ANSI clear screen sequence
    mov rdx, clear_len
    syscall
    ret

; --- Subroutine: Delay ---
do_delay:
    mov rax, 35             ; sys_nanosleep (35 in 64-bit Linux kernel)
    mov rdi, timeval        ; Pass the memory address of our 'timeval' struct
    xor rsi, rsi            ; Set RSI to 0 (NULL). We don't care about remaining time if interrupted.
    syscall
    ret
