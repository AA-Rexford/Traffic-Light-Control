section .data
    red_msg db 'RED light is ON. STOP!', 0xA, 0xD
    red_len equ $ - red_msg

    green_msg db 'GREEN light is ON. GO!', 0xA, 0xD
    green_len equ $ - green_msg

    yellow_msg db 'YELLOW light is ON. CAUTION!', 0xA, 0xD
    yellow_len equ $ - yellow_msg

    prompt_msg db 'Press ENTER to change the light (or q to quit): '
    prompt_len equ $ - prompt_msg

    newline db 0xA, 0xD
    nl_len equ $ - newline

section .bss
    input resb 2  ; buffer for input + newline

section .text
    global _start

_start:
red_state:
    ; Print RED message
    mov rax, 1
    mov rdi, 1
    mov rsi, red_msg
    mov rdx, red_len
    syscall

    call wait_input
    cmp byte [input], 'q'
    je exit

green_state:
    ; Print GREEN message
    mov rax, 1
    mov rdi, 1
    mov rsi, green_msg
    mov rdx, green_len
    syscall

    call wait_input
    cmp byte [input], 'q'
    je exit

yellow_state:
    ; Print YELLOW message
    mov rax, 1
    mov rdi, 1
    mov rsi, yellow_msg
    mov rdx, yellow_len
    syscall

    call wait_input
    cmp byte [input], 'q'
    je exit

    jmp red_state  ; Loop back to RED

wait_input:
    ; Print prompt
    mov rax, 1
    mov rdi, 1
    mov rsi, prompt_msg
    mov rdx, prompt_len
    syscall

    ; Read input
    mov rax, 0
    mov rdi, 0
    mov rsi, input
    mov rdx, 2
    syscall

    ; In case user types more than 1 character, we should ideally flush stdin, 
    ; but for a simple assignment, reading 2 bytes (char + newline) is sufficient 
    ; assuming the user only presses ENTER or 'q'+ENTER.
    ret

exit:
    ; Print newline for clean exit
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, nl_len
    syscall

    ; sys_exit
    mov rax, 60
    mov rdi, 0
    syscall
