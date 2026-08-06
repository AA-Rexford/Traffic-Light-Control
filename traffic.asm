section .data
    ; =========================================================================
    ; DATA SEGMENT (INITIALIZED VARIABLES & CONSTANTS)
    ; This section holds memory that is defined before the program runs.
    ; =========================================================================

    ; --- TRAFFIC LIGHT GRAPHICS ---
    ; We use 'db' (Define Byte) to store raw text and color codes in memory.
    ; 0x1B triggers ANSI color formatting, and 0xA is a Newline to move down.
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
    ; 'equ' calculates the exact length of the drawing so the kernel knows how much to print
    red_frame_len equ $ - red_frame_msg

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
    ; calculate the exact length of the yellow light drawing
    yellow_frame_len equ $ - yellow_frame_msg

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
    ; calculate the exact length of the green light drawing
    green_frame_len equ $ - green_frame_msg

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
    ; calculate the exact length of the blank lights drawing
    all_off_frame_len equ $ - all_off_frame_msg

    ; --- CONTROL CODES AND MESSAGES ---
    ; This escape sequence tells the terminal to move the cursor UP exactly 35 lines.
    move_up db 0x1B, '[35A', 0x0D 
    move_up_len equ $ - move_up

    ; 0x07 is the ASCII Bell character. It tells the computer hardware to make a beep sound.
    beep_msg db 0x07 
    beep_len equ $ - beep_msg

    ; The pedestrian warning text to show on screen
    ped_alert db 0xA, 0x1B, '[1;36m', '>>> PEDESTRIAN BUTTON PRESSED! <<<', 0x1B, '[0m', 0xA
    ped_alert_len equ $ - ped_alert

    ; The interactive menu to ask the user what state to go to next
    prompt_msg db 0xA, 'Press ENTER (Cycle), n (Night Mode), p (Pedestrian), q (Quit): '
    prompt_len equ $ - prompt_msg

    ; A standard newline to format the output cleanly
    newline db 0xA 
    nl_len equ $ - newline

    ; A memory structure needed for the nanosleep system call
    timeval:
        tv_sec  dq 0    ; stores the number of seconds to sleep
        tv_nsec dq 0    ; stores the number of nanoseconds to sleep

section .bss
    ; =========================================================================
    ; BSS SEGMENT (UNINITIALIZED VARIABLES)
    ; This section reserves memory buffers for data we will receive during runtime.
    ; =========================================================================
    
    ; We use 'resb' to reserve 2 bytes of memory to hold the user's keyboard input
    input resb 2 

section .text
    global _start ; This tells the linker where the program begins

_start:
    ; Program entry point. We will fall through into our normal cycle.

    ; =========================================================================
    ; NORMAL TRAFFIC LIGHT CYCLE
    ; This block cycles the lights from Red -> Yellow -> Green automatically
    ; =========================================================================
cycle_start:
    ; Print a blank newline so the traffic light isn't glued to the top of the screen
    mov rax, 1             ; 1 = sys_write command
    mov rdi, 1             ; 1 = standard output (the terminal)
    mov rsi, newline       ; grab the newline string from memory
    mov rdx, nl_len        ; grab the exact length of the string
    syscall                ; execute the system call

    ; Print the RED light to the screen
    mov rax, 1             ; 1 = sys_write command
    mov rdi, 1             ; 1 = standard output
    mov rsi, red_frame_msg ; grab the red light drawing
    mov rdx, red_frame_len ; length of the drawing
    syscall                ; execute

    ; Pause the program for 2.2 seconds
    mov qword [tv_sec], 2          ; set the sleep seconds to 2
    mov qword [tv_nsec], 200000000 ; set the sleep nanoseconds
    call do_delay                  ; jump to our delay subroutine
    call do_move_up                ; jump to our move cursor subroutine

    ; Print the YELLOW light to the screen (it overwrites the old red one)
    mov rax, 1                ; 1 = sys_write command
    mov rdi, 1                ; 1 = standard output
    mov rsi, yellow_frame_msg ; grab the yellow drawing
    mov rdx, yellow_frame_len ; length of the drawing
    syscall                   ; execute

    ; Pause the program for 2.2 seconds
    mov qword [tv_sec], 2          ; set the sleep seconds to 2
    mov qword [tv_nsec], 200000000 ; set the sleep nanoseconds
    call do_delay                  ; jump to our delay subroutine
    call do_move_up                ; jump to our move cursor subroutine

    ; Print the GREEN light to the screen
    mov rax, 1               ; 1 = sys_write command
    mov rdi, 1               ; 1 = standard output
    mov rsi, green_frame_msg ; grab the green drawing
    mov rdx, green_frame_len ; length of the drawing
    syscall                  ; execute

    ; Pause the program for 3.0 seconds
    mov qword [tv_sec], 3    ; set the sleep seconds to 3
    mov qword [tv_nsec], 0   ; 0 nanoseconds
    call do_delay            ; jump to our delay subroutine


    ; =========================================================================
    ; INTERACTIVE STATE ROUTER
    ; This asks the user what to do next, and jumps to the correct subroutine
    ; =========================================================================
prompt_loop:
    ; Print the interactive menu to the screen
    mov rax, 1          ; 1 = sys_write command
    mov rdi, 1          ; 1 = standard output
    mov rsi, prompt_msg ; grab the menu string
    mov rdx, prompt_len ; length of the menu
    syscall             ; execute

    ; Stop and wait for the user to type something on their keyboard
    mov rax, 0          ; 0 = sys_read command
    mov rdi, 0          ; 0 = standard input (keyboard)
    mov rsi, input      ; save what they type into our 'input' memory buffer
    mov rdx, 2          ; read exactly 2 bytes (the key they pressed + the enter key)
    syscall             ; execute

    ; Compare what they typed to decide where to go
    cmp byte [input], 'q' ; Did they type 'q'?
    je exit               ; Jump to the 'exit' label if they did
    
    cmp byte [input], 'n' ; Did they type 'n'?
    je night_mode         ; Jump to 'night_mode' if they did
    
    cmp byte [input], 'p' ; Did they type 'p'?
    je ped_mode           ; Jump to 'ped_mode' if they did
    
    jmp cycle_start       ; If they hit enter or anything else, just loop back to normal cycle


    ; =========================================================================
    ; PEDESTRIAN CROSSING MODE
    ; Safely stops traffic (Green -> Yellow -> Red) and beeps so people can cross
    ; =========================================================================
ped_mode:
    ; Print the "Button Pressed" warning
    mov rax, 1             ; 1 = sys_write command
    mov rdi, 1             ; 1 = standard output
    mov rsi, ped_alert     ; grab the alert string
    mov rdx, ped_alert_len ; length of the alert
    syscall                ; execute

    ; Leave the GREEN light on for a moment
    mov rax, 1               ; 1 = sys_write command
    mov rdi, 1               ; 1 = standard output
    mov rsi, green_frame_msg ; grab green drawing
    mov rdx, green_frame_len ; length
    syscall                  ; execute
    
    ; Pause for 2 seconds
    mov qword [tv_sec], 2  ; 2 seconds
    mov qword [tv_nsec], 0 ; 0 nanoseconds
    call do_delay          ; sleep
    call do_move_up        ; reset cursor position

    ; Switch safely to YELLOW light
    mov rax, 1                ; 1 = sys_write command
    mov rdi, 1                ; 1 = standard output
    mov rsi, yellow_frame_msg ; grab yellow drawing
    mov rdx, yellow_frame_len ; length
    syscall                   ; execute

    ; Pause for 1.5 seconds
    mov qword [tv_sec], 1          ; 1 second
    mov qword [tv_nsec], 500000000 ; half a second
    call do_delay                  ; sleep
    call do_move_up                ; reset cursor position

    ; Switch safely to RED light so cars stop
    mov rax, 1             ; 1 = sys_write command
    mov rdi, 1             ; 1 = standard output
    mov rsi, red_frame_msg ; grab red drawing
    mov rdx, red_frame_len ; length
    syscall                ; execute

    ; Beep 4 times so the pedestrian knows it is safe to cross
    mov r12, 4             ; set a counter to loop 4 times
.ped_beep_loop:
    ; Send the bell character to make the computer beep
    mov rax, 1             ; 1 = sys_write command
    mov rdi, 1             ; 1 = standard output
    mov rsi, beep_msg      ; grab the bell character
    mov rdx, beep_len      ; length
    syscall                ; execute

    ; Pause 1 second between each beep
    mov qword [tv_sec], 1  ; 1 second
    mov qword [tv_nsec], 0 ; 0 nanoseconds
    call do_delay          ; sleep
    
    dec r12                ; decrease our counter by 1
    jnz .ped_beep_loop     ; if the counter isn't zero yet, jump back and beep again

    jmp prompt_loop        ; Finished! Go back to the main menu


    ; =========================================================================
    ; NIGHT MODE
    ; Blinks a yellow light to tell drivers to proceed with caution
    ; =========================================================================
night_mode:
    ; Print a blank line for formatting
    mov rax, 1             ; 1 = sys_write command
    mov rdi, 1             ; 1 = standard output
    mov rsi, newline       ; grab the newline character
    mov rdx, nl_len        ; length
    syscall                ; execute

    mov r12, 5             ; set a counter to flash the light 5 times
.night_loop:
    ; Turn the YELLOW light ON
    mov rax, 1                ; 1 = sys_write command
    mov rdi, 1                ; 1 = standard output
    mov rsi, yellow_frame_msg ; grab yellow drawing
    mov rdx, yellow_frame_len ; length
    syscall                   ; execute

    ; Keep it on for 0.5 seconds
    mov qword [tv_sec], 0          ; 0 seconds
    mov qword [tv_nsec], 500000000 ; half a second
    call do_delay                  ; sleep
    call do_move_up                ; reset cursor position

    ; Turn ALL lights OFF
    mov rax, 1                 ; 1 = sys_write command
    mov rdi, 1                 ; 1 = standard output
    mov rsi, all_off_frame_msg ; grab the blank frame
    mov rdx, all_off_frame_len ; length
    syscall                    ; execute

    ; Keep them off for 0.5 seconds
    mov qword [tv_sec], 0          ; 0 seconds
    mov qword [tv_nsec], 500000000 ; half a second
    call do_delay                  ; sleep

    dec r12                ; decrease our flash counter
    jz .night_end          ; if it hit zero, jump to the end

    call do_move_up        ; reset cursor position
    jmp .night_loop        ; loop back to turn it on again

.night_end:
    jmp prompt_loop        ; Finished! Go back to the main menu


    ; =========================================================================
    ; SUBROUTINES (HELPER FUNCTIONS)
    ; We put repeating code here so we don't have to copy/paste it everywhere
    ; =========================================================================
do_move_up:
    ; Moves the cursor up to overwrite the previous light
    mov rax, 1             ; 1 = sys_write command
    mov rdi, 1             ; 1 = standard output
    mov rsi, move_up       ; grab the ANSI escape sequence
    mov rdx, move_up_len   ; length
    syscall                ; execute
    ret                    ; return to where this subroutine was called from

do_delay:
    ; Uses the nanosleep system call to pause the program
    mov rax, 35            ; 35 = sys_nanosleep command
    mov rdi, timeval       ; give the kernel our time values
    xor rsi, rsi           ; set the second argument to 0
    syscall                ; execute
    ret                    ; return to where this subroutine was called from

exit:
    ; Cleanly ends the program
    mov rax, 1             ; 1 = sys_write command
    mov rdi, 1             ; 1 = standard output
    mov rsi, newline       ; grab a newline character
    mov rdx, nl_len        ; length
    syscall                ; execute
    
    mov rax, 60            ; 60 = sys_exit command
    mov rdi, 0             ; exit status 0 (no errors)
    syscall                ; execute
