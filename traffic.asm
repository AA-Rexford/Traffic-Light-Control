section .data
    ; --- Data Section ---
    ; This section is used to declare initialized data or constants.
    ; This data does not change at runtime.

    ; Define the RED light message
    red_msg db 'RED light is ON. STOP!', 0xA, 0xD  ; 0xA is Newline (LF), 0xD is Carriage Return (CR)
    red_len equ $ - red_msg                      ; Calculate the length of the string dynamically

    ; Define the GREEN light message
    green_msg db 'GREEN light is ON. GO!', 0xA, 0xD
    green_len equ $ - green_msg

    ; Define the YELLOW light message
    yellow_msg db 'YELLOW light is ON. CAUTION!', 0xA, 0xD
    yellow_len equ $ - yellow_msg

    ; Prompt message asking the user for input
    prompt_msg db 'Press ENTER to change the light (or q to quit): '
    prompt_len equ $ - prompt_msg

    ; Define a newline character for clean formatting when exiting
    newline db 0xA, 0xD
    nl_len equ $ - newline

section .bss
    ; --- BSS Section ---
    ; This section is used for declaring uninitialized variables or buffers.

    input resb 2  ; Reserve 2 bytes for user input (1 byte for character, 1 byte for the ENTER key / newline)

section .text
    ; --- Text Section ---
    ; This section keeps the actual code (executable instructions).
    
    global _start ; 'global _start' tells the linker (ld) where the program execution begins.

_start:
    ; The program starts in the RED state.

red_state:
    ; --- STATE: RED ---
    ; Step 1: Print the RED message to the console
    mov rax, 1          ; System call number for sys_write (1 in 64-bit Linux)
    mov rdi, 1          ; File descriptor 1 = Standard Output (stdout)
    mov rsi, red_msg    ; Source Index (RSI) points to the memory address of our string
    mov rdx, red_len    ; Data Register (RDX) holds the length of the string in bytes
    syscall             ; Trigger the kernel to execute the system call

    ; Step 2: Wait for user input to change the light
    call wait_input     ; Call our custom subroutine to handle the prompt and input reading
    
    ; Step 3: Check if the user wants to quit
    cmp byte [input], 'q' ; Compare the first byte of our input buffer with the ASCII character 'q'
    je exit             ; Jump if Equal (je) to the 'exit' label if the user pressed 'q'

green_state:
    ; --- STATE: GREEN ---
    ; The flow reaches here if the user pressed ENTER (and not 'q')
    mov rax, 1          ; sys_write system call
    mov rdi, 1          ; stdout file descriptor
    mov rsi, green_msg  ; Address of the green message
    mov rdx, green_len  ; Length of the green message
    syscall             ; Execute sys_write

    call wait_input     ; Wait for user input
    cmp byte [input], 'q' ; Did the user press 'q'?
    je exit             ; If yes, jump to exit

yellow_state:
    ; --- STATE: YELLOW ---
    ; The flow reaches here if the user pressed ENTER (and not 'q')
    mov rax, 1          ; sys_write system call
    mov rdi, 1          ; stdout file descriptor
    mov rsi, yellow_msg ; Address of the yellow message
    mov rdx, yellow_len ; Length of the yellow message
    syscall             ; Execute sys_write

    call wait_input     ; Wait for user input
    cmp byte [input], 'q' ; Did the user press 'q'?
    je exit             ; If yes, jump to exit

    ; --- LOOP CYCLE ---
    jmp red_state       ; Unconditional jump back to the RED state. This creates an infinite loop.

wait_input:
    ; --- SUBROUTINE: WAIT INPUT ---
    ; This procedure prompts the user and reads their keyboard input.
    
    ; Step 1: Print the prompt message
    mov rax, 1          ; sys_write system call
    mov rdi, 1          ; stdout
    mov rsi, prompt_msg ; Address of the prompt message
    mov rdx, prompt_len ; Length of the prompt message
    syscall             ; Execute sys_write

    ; Step 2: Read keyboard input
    mov rax, 0          ; System call number for sys_read (0 in 64-bit Linux)
    mov rdi, 0          ; File descriptor 0 = Standard Input (stdin)
    mov rsi, input      ; Point RSI to our 'input' buffer in the .bss section
    mov rdx, 2          ; Read up to 2 bytes (the character typed + the ENTER key stroke)
    syscall             ; Execute sys_read, which pauses the program until input is received

    ret                 ; Return from the subroutine back to where 'call wait_input' was triggered

exit:
    ; --- GRACEFUL EXIT ---
    ; This block safely terminates the program and returns control to the operating system.
    
    ; Step 1: Print a final newline to make the terminal output look clean
    mov rax, 1          ; sys_write
    mov rdi, 1          ; stdout
    mov rsi, newline    ; Address of the newline string
    mov rdx, nl_len     ; Length of the newline string
    syscall             ; Execute sys_write

    ; Step 2: Exit the program
    mov rax, 60         ; System call number for sys_exit (60 in 64-bit Linux)
    mov rdi, 0          ; Exit code 0 (which means success / no errors)
    syscall             ; Execute sys_exit. The program terminates here.
