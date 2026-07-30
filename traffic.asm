section .data
    ; =============================================================
    ; [DATA SEGMENT]
    ; The .data section is used for declaring initialized data or constants.
    ; This data does not change at runtime. (e.g. DB for bytes, EQU for constants)
    ; =============================================================
    ; --- 3D Decorative Traffic Light Tower ---
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
    ; 'equ' defines an Assembly Constant (like a #define in C)
    ; '$' refers to the current memory address. By subtracting the start address, we calculate the exact length of the string at compile time!
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
    all_off_frame_len equ $ - all_off_frame_msg



    ; Cursor Control (Move up exactly 35 lines)
    ; 'db' means Define Byte. We define raw bytes of data.
    ; 0x1B is the hexadecimal ASCII code for "ESCAPE", which tells the terminal to expect an ANSI command.
    move_up db 0x1B, '[35A', 0x0D
    move_up_len equ $ - move_up

    ; Sound Control
    ; 0x07 is the hexadecimal ASCII code for the "Bell" character, which triggers the system's hardware beep!
    beep_msg db 0x07
    beep_len equ $ - beep_msg

    ; Alerts and Prompts
    ; 0xA is the hexadecimal ASCII code for Line Feed (Newline), which pushes output to the next line.
    ped_alert db 0xA, 0x1B, '[1;36m', '>>> PEDESTRIAN BUTTON PRESSED! <<<', 0x1B, '[0m', 0xA
    ped_alert_len equ $ - ped_alert

    prompt_msg db 0xA, 'Press ENTER (Cycle), n (Night Mode), p (Pedestrian), q (Quit): '
    prompt_len equ $ - prompt_msg

    newline db 0xA
    nl_len equ $ - newline

    ; Timer Struct
    timeval:
        tv_sec  dq 0
        tv_nsec dq 0

section .bss
    ; =============================================================
    ; [BSS SEGMENT]
    ; The .bss section is a static memory section for uninitialized variables.
    ; It reserves space in memory that will be used later.
    ; =============================================================
    
    ; 'resb' stands for Reserve Byte. We are reserving 2 bytes of memory to hold the user's keystroke.
    input resb 2

section .text
    global _start

_start:
    ; Program entry point. We jump straight into the traffic light cycle.

cycle_start:
    ; -------------------------------------------------------------
    ; [STATE MACHINE: NORMAL CYCLE]
    ; Cycles through Red, Yellow, Green automatically.
    ; -------------------------------------------------------------
    
    ; System Call: sys_write (ID 1)
    ; Purpose: Prints a blank newline to the terminal to give the UI padding.
    mov rax, 1          ; System call number for sys_write
    mov rdi, 1          ; File descriptor 1 = Standard Output (terminal)
    mov rsi, newline    ; Pointer to the string to print
    mov rdx, nl_len     ; Length of the string
    syscall             ; Ask the Linux Kernel to execute the system call

    ; --- STATE 1: RED ---
    ; Print the Red Traffic Light Frame
    mov rax, 1
    mov rdi, 1
    mov rsi, red_frame_msg
    mov rdx, red_frame_len
    syscall

    ; Setup our timespec struct to sleep for 2.2 seconds (2 sec, 200,000,000 nanosec)
    mov qword [tv_sec], 2
    mov qword [tv_nsec], 200000000
    call do_delay       ; Jump to our delay subroutine
    
    ; After waking up, move the terminal cursor back up 35 lines to overwrite in-place!
    call do_move_up

    ; --- STATE 2: YELLOW ---
    mov rax, 1
    mov rdi, 1
    mov rsi, yellow_frame_msg
    mov rdx, yellow_frame_len
    syscall

    mov qword [tv_sec], 2
    mov qword [tv_nsec], 200000000
    call do_delay
    call do_move_up

    ; --- STATE 3: GREEN ---
    mov rax, 1
    mov rdi, 1
    mov rsi, green_frame_msg
    mov rdx, green_frame_len
    syscall

    ; Green stays on slightly longer (3.0 seconds)
    mov qword [tv_sec], 3
    mov qword [tv_nsec], 0
    call do_delay

prompt_loop:
    ; -------------------------------------------------------------
    ; [INTERACTIVE ROUTER]
    ; Pauses and waits for the user to select the next state.
    ; -------------------------------------------------------------
    
    ; Print the interactive prompt asking for input
    mov rax, 1
    mov rdi, 1
    mov rsi, prompt_msg
    mov rdx, prompt_len
    syscall

    ; System Call: sys_read (ID 0)
    ; Purpose: Pauses execution and waits for the user to type on the keyboard.
    mov rax, 0          ; System call number for sys_read
    mov rdi, 0          ; File descriptor 0 = Standard Input (keyboard)
    mov rsi, input      ; Pointer to our buffer to store the keystroke
    mov rdx, 2          ; Read 2 bytes (the character + the ENTER key newline)
    syscall

    ; Compare the first byte of the user's input against specific ASCII characters
    cmp byte [input], 'q'
    je exit             ; If 'q', Jump if Equal to the 'exit' routine
    
    cmp byte [input], 'n'
    je night_mode       ; If 'n', Jump to Night Mode
    
    cmp byte [input], 'p'
    je ped_mode         ; If 'p', Jump to Pedestrian Mode
    
    ; If they just pressed ENTER (or any other key), loop back to start the normal cycle
    jmp cycle_start

ped_mode:
    ; -------------------------------------------------------------
    ; [STATE MACHINE: PEDESTRIAN CROSSING]
    ; Safely stops cars (Green -> Yellow -> Red) then activates beep.
    ; -------------------------------------------------------------
    
    ; Print the Pedestrian Alert Banner
    mov rax, 1
    mov rdi, 1
    mov rsi, ped_alert
    mov rdx, ped_alert_len
    syscall

    ; Step 1: Force Green Light (cars still moving)
    mov rax, 1
    mov rdi, 1
    mov rsi, green_frame_msg
    mov rdx, green_frame_len
    syscall
    
    mov qword [tv_sec], 2
    mov qword [tv_nsec], 0
    call do_delay
    call do_move_up

    ; Step 2: Transition to Yellow (cars slowing down)
    mov rax, 1
    mov rdi, 1
    mov rsi, yellow_frame_msg
    mov rdx, yellow_frame_len
    syscall

    mov qword [tv_sec], 1
    mov qword [tv_nsec], 500000000
    call do_delay
    call do_move_up

    ; Step 3: Transition to Red (cars stopped, safe to cross!)
    mov rax, 1
    mov rdi, 1
    mov rsi, red_frame_msg
    mov rdx, red_frame_len
    syscall

    ; Start the accessibility beeping loop
    mov r12, 4          ; Set loop counter (r12) to beep 4 times
.ped_beep_loop:
    ; Print the ASCII Bell character (0x07) which triggers a hardware beep
    mov rax, 1
    mov rdi, 1
    mov rsi, beep_msg
    mov rdx, beep_len
    syscall

    ; Wait 1 second between beeps
    mov qword [tv_sec], 1
    mov qword [tv_nsec], 0
    call do_delay
    
    dec r12             ; Decrement the loop counter
    jnz .ped_beep_loop  ; Jump Not Zero: If counter != 0, loop back and beep again!

    jmp prompt_loop     ; Return to the main menu when finished

night_mode:
    ; -------------------------------------------------------------
    ; [STATE MACHINE: NIGHT MODE]
    ; Flashes Yellow continuously for late-night low-traffic scenarios.
    ; -------------------------------------------------------------
    
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, nl_len
    syscall

    mov r12, 5          ; Set loop counter to flash 5 times
.night_loop:
    ; Show the Yellow light
    mov rax, 1
    mov rdi, 1
    mov rsi, yellow_frame_msg
    mov rdx, yellow_frame_len
    syscall

    ; Fast delay (0.5 seconds)
    mov qword [tv_sec], 0
    mov qword [tv_nsec], 500000000
    call do_delay
    call do_move_up

    ; Turn all lights OFF (Blank frame)
    mov rax, 1
    mov rdi, 1
    mov rsi, all_off_frame_msg
    mov rdx, all_off_frame_len
    syscall

    mov qword [tv_sec], 0
    mov qword [tv_nsec], 500000000
    call do_delay

    dec r12
    jz .night_end       ; If counter hits 0, Jump if Zero to the end

    ; Otherwise, move cursor up and loop again
    call do_move_up
    jmp .night_loop

.night_end:
    jmp prompt_loop

; =================================================================
; SUBROUTINES
; Modular code blocks that can be called repeatedly to save space.
; =================================================================

do_move_up:
    ; Prints our ANSI escape code `\033[35A` to move cursor up 35 lines
    mov rax, 1
    mov rdi, 1
    mov rsi, move_up
    mov rdx, move_up_len
    syscall
    ret                 ; Return to wherever `call do_move_up` was executed

do_delay:
    ; System Call: sys_nanosleep (ID 35)
    ; Purpose: Suspends execution for the time specified in the `timeval` struct.
    mov rax, 35         ; System call number for sys_nanosleep
    mov rdi, timeval    ; Pointer to our timespec struct (seconds, nanoseconds)
    xor rsi, rsi        ; Zero out rsi (we don't care about remaining time if interrupted)
    syscall
    ret

exit:
    ; Print a final newline for a clean terminal exit
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, nl_len
    syscall
    
    ; System Call: sys_exit (ID 60)
    ; Purpose: Safely terminate the program and return control to Linux.
    mov rax, 60         ; System call number for sys_exit
    mov rdi, 0          ; Exit code 0 (Success)
    syscall
