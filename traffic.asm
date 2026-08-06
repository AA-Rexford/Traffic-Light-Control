section .data
    ; traffic light graphics
    red_frame_msg:
                  db 0x1B, '[1;37m', ' .===============================. ', 0xA
                  db 0x1B, '[1;37m', ' || .-------------------------. || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;31m', '      .---------.      ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;31m', '    ."           ".    ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;31m', '   /      RED      \   ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;31m', '  |      STOP!      |  ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;31m', '   \               /   ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;31m', '    ".           ."    ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;31m', '      `---------`      ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || |                         | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;30m', '      .---------.      ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;30m', '    ."           ".    ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;30m', '   /               \   ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;30m', '  |                 |  ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;30m', '   \               /   ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;30m', '    ".           ."    ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;30m', '      `---------`      ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || |                         | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;30m', '      .---------.      ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;30m', '    ."           ".    ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;30m', '   /               \   ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;30m', '  |                 |  ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;30m', '   \               /   ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;30m', '    ".           ."    ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;30m', '      `---------`      ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || `-------------------------` || ', 0xA
                  db 0x1B, '[1;37m', ' `===============================` ', 0xA
                  db 0x1B, '[1;37m', '            ||       ||            ', 0xA
                  db 0x1B, '[1;37m', '            ||       ||            ', 0xA
                  db 0x1B, '[1;37m', '            ||       ||            ', 0xA
                  db 0x1B, '[1;37m', '            ||       ||            ', 0xA
                  db 0x1B, '[1;37m', '            ||       ||            ', 0xA
                  db 0x1B, '[1;37m', '            ||       ||            ', 0xA
                  db 0x1B, '[1;37m', '           _||_______||_           ', 0xA
                  db 0x1B, '[1;37m', '          [_____________]          ', 0xA
                  db 0x1B, '[0m'
    red_frame_len equ $ - red_frame_msg ; calculate string length

    yellow_frame_msg:
                  db 0x1B, '[1;37m', ' .===============================. ', 0xA
                  db 0x1B, '[1;37m', ' || .-------------------------. || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;30m', '      .---------.      ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;30m', '    ."           ".    ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;30m', '   /               \   ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;30m', '  |                 |  ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;30m', '   \               /   ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;30m', '    ".           ."    ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;30m', '      `---------`      ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || |                         | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[38;5;226m', '      .---------.      ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[38;5;226m', '    ."           ".    ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[38;5;226m', '   /    YELLOW     \   ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[38;5;226m', '  |    GET READY    |  ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[38;5;226m', '   \               /   ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[38;5;226m', '    ".           ."    ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[38;5;226m', '      `---------`      ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || |                         | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;30m', '      .---------.      ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;30m', '    ."           ".    ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;30m', '   /               \   ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;30m', '  |                 |  ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;30m', '   \               /   ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;30m', '    ".           ."    ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;30m', '      `---------`      ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || `-------------------------` || ', 0xA
                  db 0x1B, '[1;37m', ' `===============================` ', 0xA
                  db 0x1B, '[1;37m', '            ||       ||            ', 0xA
                  db 0x1B, '[1;37m', '            ||       ||            ', 0xA
                  db 0x1B, '[1;37m', '            ||       ||            ', 0xA
                  db 0x1B, '[1;37m', '            ||       ||            ', 0xA
                  db 0x1B, '[1;37m', '            ||       ||            ', 0xA
                  db 0x1B, '[1;37m', '            ||       ||            ', 0xA
                  db 0x1B, '[1;37m', '           _||_______||_           ', 0xA
                  db 0x1B, '[1;37m', '          [_____________]          ', 0xA
                  db 0x1B, '[0m'
    yellow_frame_len equ $ - yellow_frame_msg ; calculate string length

    green_frame_msg:
                  db 0x1B, '[1;37m', ' .===============================. ', 0xA
                  db 0x1B, '[1;37m', ' || .-------------------------. || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;30m', '      .---------.      ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;30m', '    ."           ".    ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;30m', '   /               \   ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;30m', '  |                 |  ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;30m', '   \               /   ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;30m', '    ".           ."    ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;30m', '      `---------`      ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || |                         | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;30m', '      .---------.      ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;30m', '    ."           ".    ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;30m', '   /               \   ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;30m', '  |                 |  ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;30m', '   \               /   ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;30m', '    ".           ."    ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;30m', '      `---------`      ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || |                         | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;32m', '      .---------.      ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;32m', '    ."           ".    ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;32m', '   /     GREEN     \   ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;32m', '  |       GO!       |  ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;32m', '   \               /   ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;32m', '    ".           ."    ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;32m', '      `---------`      ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || `-------------------------` || ', 0xA
                  db 0x1B, '[1;37m', ' `===============================` ', 0xA
                  db 0x1B, '[1;37m', '            ||       ||            ', 0xA
                  db 0x1B, '[1;37m', '            ||       ||            ', 0xA
                  db 0x1B, '[1;37m', '            ||       ||            ', 0xA
                  db 0x1B, '[1;37m', '            ||       ||            ', 0xA
                  db 0x1B, '[1;37m', '            ||       ||            ', 0xA
                  db 0x1B, '[1;37m', '            ||       ||            ', 0xA
                  db 0x1B, '[1;37m', '           _||_______||_           ', 0xA
                  db 0x1B, '[1;37m', '          [_____________]          ', 0xA
                  db 0x1B, '[0m'
    green_frame_len equ $ - green_frame_msg ; calculate string length

    all_off_frame_msg:
                  db 0x1B, '[1;37m', ' .===============================. ', 0xA
                  db 0x1B, '[1;37m', ' || .-------------------------. || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;30m', '      .---------.      ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;30m', '    ."           ".    ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;30m', '   /               \   ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;30m', '  |                 |  ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;30m', '   \               /   ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;30m', '    ".           ."    ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;30m', '      `---------`      ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || |                         | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;30m', '      .---------.      ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;30m', '    ."           ".    ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;30m', '   /               \   ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;30m', '  |                 |  ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;30m', '   \               /   ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;30m', '    ".           ."    ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;30m', '      `---------`      ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || |                         | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;30m', '      .---------.      ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;30m', '    ."           ".    ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;30m', '   /               \   ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;30m', '  |                 |  ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;30m', '   \               /   ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;30m', '    ".           ."    ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || | ', 0x1B, '[1;30m', '      `---------`      ', 0x1B, '[1;37m', ' | || ', 0xA
                  db 0x1B, '[1;37m', ' || `-------------------------` || ', 0xA
                  db 0x1B, '[1;37m', ' `===============================` ', 0xA
                  db 0x1B, '[1;37m', '            ||       ||            ', 0xA
                  db 0x1B, '[1;37m', '            ||       ||            ', 0xA
                  db 0x1B, '[1;37m', '            ||       ||            ', 0xA
                  db 0x1B, '[1;37m', '            ||       ||            ', 0xA
                  db 0x1B, '[1;37m', '            ||       ||            ', 0xA
                  db 0x1B, '[1;37m', '            ||       ||            ', 0xA
                  db 0x1B, '[1;37m', '           _||_______||_           ', 0xA
                  db 0x1B, '[1;37m', '          [_____________]          ', 0xA
                  db 0x1B, '[0m'
    all_off_frame_len equ $ - all_off_frame_msg ; calculate string length

    ; move cursor up string
    move_up db 0x1B, '[35A', 0x0D ; escape sequence to move cursor up 35 lines
    move_up_len equ $ - move_up ; calculate string length

    ; beep sound string
    beep_msg db 0x07 ; 0x07 is the bell character
    beep_len equ $ - beep_msg ; calculate string length

    ; messages
    ped_alert db 0xA, 0x1B, '[1;36m', '>>> PEDESTRIAN BUTTON PRESSED! <<<', 0x1B, '[0m', 0xA ; alert text
    ped_alert_len equ $ - ped_alert ; calculate string length

    prompt_msg db 0xA, 'Press ENTER (Cycle), n (Night Mode), p (Pedestrian), q (Quit): ' ; menu text
    prompt_len equ $ - prompt_msg ; calculate string length

    newline db 0xA ; newline character
    nl_len equ $ - newline ; calculate string length

    ; timer values for sleep
    timeval:
        tv_sec  dq 0 ; seconds
        tv_nsec dq 0 ; nanoseconds

section .bss
    input resb 2 ; reserve 2 bytes for the user input

section .text
    global _start ; entry point for the linker

_start:
    ; start the program

cycle_start:
    ; normal traffic cycle
    
    ; print a blank line
    mov rax, 1          ; sys_write
    mov rdi, 1          ; standard output
    mov rsi, newline    ; load newline character
    mov rdx, nl_len     ; length
    syscall             ; execute

    ; show red light
    mov rax, 1          ; sys_write
    mov rdi, 1          ; standard output
    mov rsi, red_frame_msg ; load red light frame
    mov rdx, red_frame_len ; length
    syscall             ; execute

    ; sleep 2.2 seconds
    mov qword [tv_sec], 2 ; set seconds to 2
    mov qword [tv_nsec], 200000000 ; set nanoseconds to 200,000,000
    call do_delay       ; call sleep function
    call do_move_up     ; move cursor up

    ; show yellow light
    mov rax, 1          ; sys_write
    mov rdi, 1          ; standard output
    mov rsi, yellow_frame_msg ; load yellow light frame
    mov rdx, yellow_frame_len ; length
    syscall             ; execute

    ; sleep 2.2 seconds
    mov qword [tv_sec], 2 ; set seconds to 2
    mov qword [tv_nsec], 200000000 ; set nanoseconds to 200,000,000
    call do_delay       ; call sleep function
    call do_move_up     ; move cursor up

    ; show green light
    mov rax, 1          ; sys_write
    mov rdi, 1          ; standard output
    mov rsi, green_frame_msg ; load green light frame
    mov rdx, green_frame_len ; length
    syscall             ; execute

    ; sleep 3 seconds
    mov qword [tv_sec], 3 ; set seconds to 3
    mov qword [tv_nsec], 0 ; set nanoseconds to 0
    call do_delay       ; call sleep function

prompt_loop:
    ; prompt the user for input
    mov rax, 1          ; sys_write
    mov rdi, 1          ; standard output
    mov rsi, prompt_msg ; load prompt message
    mov rdx, prompt_len ; length
    syscall             ; execute

    ; read user input
    mov rax, 0          ; sys_read
    mov rdi, 0          ; standard input
    mov rsi, input      ; load input buffer
    mov rdx, 2          ; read 2 bytes
    syscall             ; execute

    ; check input
    cmp byte [input], 'q' ; check if 'q'
    je exit             ; if 'q', go to exit
    
    cmp byte [input], 'n' ; check if 'n'
    je night_mode       ; if 'n', go to night mode
    
    cmp byte [input], 'p' ; check if 'p'
    je ped_mode         ; if 'p', go to pedestrian mode
    
    jmp cycle_start     ; otherwise loop the normal cycle

ped_mode:
    ; pedestrian crossing logic
    mov rax, 1          ; sys_write
    mov rdi, 1          ; standard output
    mov rsi, ped_alert  ; load alert text
    mov rdx, ped_alert_len ; length
    syscall             ; execute

    ; show green light
    mov rax, 1          ; sys_write
    mov rdi, 1          ; standard output
    mov rsi, green_frame_msg ; load green light frame
    mov rdx, green_frame_len ; length
    syscall             ; execute
    
    ; sleep 2 seconds
    mov qword [tv_sec], 2 ; set seconds to 2
    mov qword [tv_nsec], 0 ; set nanoseconds to 0
    call do_delay       ; call sleep function
    call do_move_up     ; move cursor up

    ; show yellow light
    mov rax, 1          ; sys_write
    mov rdi, 1          ; standard output
    mov rsi, yellow_frame_msg ; load yellow light frame
    mov rdx, yellow_frame_len ; length
    syscall             ; execute

    ; sleep 1.5 seconds
    mov qword [tv_sec], 1 ; set seconds to 1
    mov qword [tv_nsec], 500000000 ; set nanoseconds to 500,000,000
    call do_delay       ; call sleep function
    call do_move_up     ; move cursor up

    ; show red light
    mov rax, 1          ; sys_write
    mov rdi, 1          ; standard output
    mov rsi, red_frame_msg ; load red light frame
    mov rdx, red_frame_len ; length
    syscall             ; execute

    ; beep 4 times
    mov r12, 4          ; loop counter
.ped_beep_loop:
    mov rax, 1          ; sys_write
    mov rdi, 1          ; standard output
    mov rsi, beep_msg   ; load beep sound
    mov rdx, beep_len   ; length
    syscall             ; execute

    ; wait 1 second
    mov qword [tv_sec], 1 ; set seconds to 1
    mov qword [tv_nsec], 0 ; set nanoseconds to 0
    call do_delay       ; call sleep function
    
    dec r12             ; decrease loop counter
    jnz .ped_beep_loop  ; repeat until zero

    jmp prompt_loop     ; return to prompt

night_mode:
    ; night mode flashing yellow logic
    mov rax, 1          ; sys_write
    mov rdi, 1          ; standard output
    mov rsi, newline    ; load newline
    mov rdx, nl_len     ; length
    syscall             ; execute

    mov r12, 5          ; loop counter for 5 flashes
.night_loop:
    ; show yellow light
    mov rax, 1          ; sys_write
    mov rdi, 1          ; standard output
    mov rsi, yellow_frame_msg ; load yellow light frame
    mov rdx, yellow_frame_len ; length
    syscall             ; execute

    ; sleep 0.5 seconds
    mov qword [tv_sec], 0 ; set seconds to 0
    mov qword [tv_nsec], 500000000 ; set nanoseconds to 500,000,000
    call do_delay       ; call sleep function
    call do_move_up     ; move cursor up

    ; show all off frame
    mov rax, 1          ; sys_write
    mov rdi, 1          ; standard output
    mov rsi, all_off_frame_msg ; load all off frame
    mov rdx, all_off_frame_len ; length
    syscall             ; execute

    ; sleep 0.5 seconds
    mov qword [tv_sec], 0 ; set seconds to 0
    mov qword [tv_nsec], 500000000 ; set nanoseconds to 500,000,000
    call do_delay       ; call sleep function

    dec r12             ; decrease loop counter
    jz .night_end       ; finish if zero

    call do_move_up     ; move cursor up
    jmp .night_loop     ; loop again

.night_end:
    jmp prompt_loop     ; return to prompt

do_move_up:
    ; suboutine to move cursor up
    mov rax, 1          ; sys_write
    mov rdi, 1          ; standard output
    mov rsi, move_up    ; load escape sequence
    mov rdx, move_up_len ; length
    syscall             ; execute
    ret                 ; return

do_delay:
    ; subroutine to pause execution
    mov rax, 35         ; sys_nanosleep
    mov rdi, timeval    ; load timer data
    xor rsi, rsi        ; set to 0
    syscall             ; execute
    ret                 ; return

exit:
    ; subroutine to exit program
    mov rax, 1          ; sys_write
    mov rdi, 1          ; standard output
    mov rsi, newline    ; load newline
    mov rdx, nl_len     ; length
    syscall             ; execute
    
    mov rax, 60         ; sys_exit
    mov rdi, 0          ; exit code 0
    syscall             ; execute
