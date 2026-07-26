section .data
    ; --- Huge ASCII Art Circular Light Messages ---
    ; Using ANSI escape codes [1;31m, [38;5;226m, [1;32m for EXTREMELY BRIGHT colors
    ; Mathematical perfectly symmetrical 23-character lines.
    
    red_msg db 0x1B, '[1;31m'
            db '      .---------.      ', 0xA
            db '    ."           ".    ', 0xA
            db '   /      RED      \   ', 0xA
            db '  |      STOP!      |  ', 0xA
            db '   \               /   ', 0xA
            db '    ".           ."    ', 0xA
            db '      `---------`      ', 0xA
            db 0x1B, '[0m', 0xA
    red_len equ $ - red_msg

    yellow_msg db 0x1B, '[38;5;226m'
               db '      .---------.      ', 0xA
               db '    ."           ".    ', 0xA
               db '   /    YELLOW     \   ', 0xA
               db '  |    GET READY    |  ', 0xA
               db '   \               /   ', 0xA
               db '    ".           ."    ', 0xA
               db '      `---------`      ', 0xA
               db 0x1B, '[0m', 0xA
    yellow_len equ $ - yellow_msg

    green_msg db 0x1B, '[1;32m'
              db '      .---------.      ', 0xA
              db '    ."           ".    ', 0xA
              db '   /     GREEN     \   ', 0xA
              db '  |       GO!       |  ', 0xA
              db '   \               /   ', 0xA
              db '    ".           ."    ', 0xA
              db '      `---------`      ', 0xA
              db 0x1B, '[0m', 0xA
    green_len equ $ - green_msg

    ; Blank circle for Night Mode flashing
    blank_msg db 0x1B, '[1;30m'  ; Dark gray for OFF state
              db '      .---------.      ', 0xA
              db '    ."           ".    ', 0xA
              db '   /               \   ', 0xA
              db '  |                 |  ', 0xA
              db '   \               /   ', 0xA
              db '    ".           ."    ', 0xA
              db '      `---------`      ', 0xA
              db 0x1B, '[0m', 0xA
    blank_len equ $ - blank_msg

    ; --- Cursor Control ---
    ; Moves terminal cursor UP 8 lines and resets to column 1
    move_up db 0x1B, '[8A', 0x0D
    move_up_len equ $ - move_up

    ; --- Sound Control ---
    ; Raw ASCII Bell byte for accessibility
    beep_msg db 0x07
    beep_len equ $ - beep_msg

    ; --- Alerts and Prompts ---
    ped_alert db 0xA, 0x1B, '[1;36m', '>>> PEDESTRIAN BUTTON PRESSED! <<<', 0x1B, '[0m', 0xA
    ped_alert_len equ $ - ped_alert

    prompt_msg db 0xA, 'Press ENTER (Cycle), n (Night Mode), p (Pedestrian), q (Quit): '
    prompt_len equ $ - prompt_msg

    newline db 0xA
    nl_len equ $ - newline

    ; --- Timer Struct (sys_nanosleep) ---
    timeval:
        tv_sec  dq 0
        tv_nsec dq 0

section .bss
    input resb 2

section .text
    global _start

_start:

cycle_start:
    ; Print a blank line to separate from the prompt
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, nl_len
    syscall

    ; --- STATE 1: RED ---
    mov rax, 1
    mov rdi, 1
    mov rsi, red_msg
    mov rdx, red_len
    syscall

    ; Wait 2.2 seconds
    mov qword [tv_sec], 2
    mov qword [tv_nsec], 200000000
    call do_delay

    ; Move cursor up to overwrite the circle IN-PLACE
    call do_move_up

    ; --- STATE 2: YELLOW ---
    mov rax, 1
    mov rdi, 1
    mov rsi, yellow_msg
    mov rdx, yellow_len
    syscall

    ; Wait 2.2 seconds
    mov qword [tv_sec], 2
    mov qword [tv_nsec], 200000000
    call do_delay

    ; Move cursor up to overwrite IN-PLACE
    call do_move_up

    ; --- STATE 3: GREEN ---
    mov rax, 1
    mov rdi, 1
    mov rsi, green_msg
    mov rdx, green_len
    syscall

    ; Wait 3.0 seconds
    mov qword [tv_sec], 3
    mov qword [tv_nsec], 0
    call do_delay

prompt_loop:
    ; --- INTERACTIVE MENU ---
    mov rax, 1
    mov rdi, 1
    mov rsi, prompt_msg
    mov rdx, prompt_len
    syscall

    ; Read user input
    mov rax, 0
    mov rdi, 0
    mov rsi, input
    mov rdx, 2
    syscall

    ; Branching logic for the Interactive State Machine
    cmp byte [input], 'q'
    je exit
    cmp byte [input], 'n'
    je night_mode
    cmp byte [input], 'p'
    je ped_mode
    
    ; Default: Cycle Again
    jmp cycle_start

ped_mode:
    ; Alert banner
    mov rax, 1
    mov rdi, 1
    mov rsi, ped_alert
    mov rdx, ped_alert_len
    syscall

    ; GREEN for cars initially
    mov rax, 1
    mov rdi, 1
    mov rsi, green_msg
    mov rdx, green_len
    syscall
    
    mov qword [tv_sec], 2
    mov qword [tv_nsec], 0
    call do_delay

    call do_move_up

    ; YELLOW slowing down
    mov rax, 1
    mov rdi, 1
    mov rsi, yellow_msg
    mov rdx, yellow_len
    syscall

    mov qword [tv_sec], 1
    mov qword [tv_nsec], 500000000
    call do_delay

    call do_move_up

    ; RED for cars (Pedestrians can cross safely)
    mov rax, 1
    mov rdi, 1
    mov rsi, red_msg
    mov rdx, red_len
    syscall

    ; Beep 4 times over 4 seconds for Visually Impaired Accessibility
    mov r12, 4
.ped_beep_loop:
    ; trigger beep
    mov rax, 1
    mov rdi, 1
    mov rsi, beep_msg
    mov rdx, beep_len
    syscall

    ; sleep 1s
    mov qword [tv_sec], 1
    mov qword [tv_nsec], 0
    call do_delay
    
    dec r12
    jnz .ped_beep_loop

    jmp prompt_loop

night_mode:
    ; Print blank line first
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, nl_len
    syscall

    mov r12, 5   ; Flash 5 times
.night_loop:
    ; Print YELLOW
    mov rax, 1
    mov rdi, 1
    mov rsi, yellow_msg
    mov rdx, yellow_len
    syscall

    ; sleep 0.5s
    mov qword [tv_sec], 0
    mov qword [tv_nsec], 500000000
    call do_delay

    call do_move_up

    ; Print BLANK circle
    mov rax, 1
    mov rdi, 1
    mov rsi, blank_msg
    mov rdx, blank_len
    syscall

    ; sleep 0.5s
    mov qword [tv_sec], 0
    mov qword [tv_nsec], 500000000
    call do_delay

    dec r12
    jz .night_end

    ; Move up for next flash
    call do_move_up
    jmp .night_loop

.night_end:
    jmp prompt_loop

; --- Subroutine: Move Cursor Up ---
do_move_up:
    mov rax, 1
    mov rdi, 1
    mov rsi, move_up
    mov rdx, move_up_len
    syscall
    ret

; --- Subroutine: Delay ---
do_delay:
    mov rax, 35             ; sys_nanosleep (35 in 64-bit Linux kernel)
    mov rdi, timeval
    xor rsi, rsi
    syscall
    ret

; --- Graceful Exit ---
exit:
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, nl_len
    syscall

    mov rax, 60
    mov rdi, 0
    syscall
