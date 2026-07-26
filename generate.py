import sys

WHT = "1;37"
GRY = "1;30"
RED = "1;31"
YEL = "38;5;226"
GRN = "1;32"
RST = "0"

def draw_top():
    s = f"                  db 0x1B, '[{WHT}m', ' .===============================. ', 0xA\n"
    s += f"                  db 0x1B, '[{WHT}m', ' || .-------------------------. || ', 0xA\n"
    return s

def draw_bot():
    s = f"                  db 0x1B, '[{WHT}m', ' || `-------------------------` || ', 0xA\n"
    s += f"                  db 0x1B, '[{WHT}m', ' `===============================` ', 0xA\n"
    s += f"                  db 0x1B, '[{WHT}m', '            ||       ||            ', 0xA\n"
    s += f"                  db 0x1B, '[{WHT}m', '            ||       ||            ', 0xA\n"
    s += f"                  db 0x1B, '[{WHT}m', '            ||       ||            ', 0xA\n"
    s += f"                  db 0x1B, '[{WHT}m', '            ||       ||            ', 0xA\n"
    s += f"                  db 0x1B, '[{WHT}m', '            ||       ||            ', 0xA\n"
    s += f"                  db 0x1B, '[{WHT}m', '            ||       ||            ', 0xA\n"
    s += f"                  db 0x1B, '[{WHT}m', '           _||_______||_           ', 0xA\n"
    s += f"                  db 0x1B, '[{WHT}m', '          [_____________]          ', 0xA\n"
    return s

def colored_line(border_color, inner_color, text):
    return f"                  db 0x1B, '[{border_color}m', ' || | ', 0x1B, '[{inner_color}m', '{text}', 0x1B, '[{border_color}m', ' | || ', 0xA\n"

def empty_padding():
    return f"                  db 0x1B, '[{WHT}m', ' || |                         | || ', 0xA\n"

red_c = [
    '      .---------.      ',
    '    ."           ".    ',
    '   /      RED      \\   ',
    '  |      STOP!      |  ',
    '   \\               /   ',
    '    ".           ."    ',
    '      `---------`      '
]
yel_c = [
    '      .---------.      ',
    '    ."           ".    ',
    '   /    YELLOW     \\   ',
    '  |    GET READY    |  ',
    '   \\               /   ',
    '    ".           ."    ',
    '      `---------`      '
]
grn_c = [
    '      .---------.      ',
    '    ."           ".    ',
    '   /     GREEN     \\   ',
    '  |       GO!       |  ',
    '   \\               /   ',
    '    ".           ."    ',
    '      `---------`      '
]
off_c = [
    '      .---------.      ',
    '    ."           ".    ',
    '   /               \\   ',
    '  |                 |  ',
    '   \\               /   ',
    '    ".           ."    ',
    '      `---------`      '
]

def make_frame(name, top_c, mid_c, bot_c, top_color, mid_color, bot_color):
    s = f"    {name}_msg:\n"
    s += draw_top()
    for line in top_c: s += colored_line(WHT, top_color, line)
    s += empty_padding()
    for line in mid_c: s += colored_line(WHT, mid_color, line)
    s += empty_padding()
    for line in bot_c: s += colored_line(WHT, bot_color, line)
    s += draw_bot()
    s += f"                  db 0x1B, '[0m'\n"
    s += f"    {name}_len equ $ - {name}_msg\n\n"
    return s

asm = f"""section .data
    ; --- 3D Decorative Traffic Light Tower ---
{make_frame('red_frame', red_c, off_c, off_c, RED, GRY, GRY)}
{make_frame('yellow_frame', off_c, yel_c, off_c, GRY, YEL, GRY)}
{make_frame('green_frame', off_c, off_c, grn_c, GRY, GRY, GRN)}
{make_frame('all_off_frame', off_c, off_c, off_c, GRY, GRY, GRY)}

    ; Cursor Control (Move up exactly 35 lines)
    move_up db 0x1B, '[35A', 0x0D
    move_up_len equ $ - move_up

    ; Sound Control
    beep_msg db 0x07
    beep_len equ $ - beep_msg

    ; Alerts and Prompts
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
    input resb 2

section .text
    global _start

_start:

cycle_start:
    ; Print a blank line
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, nl_len
    syscall

    ; --- STATE 1: RED ---
    mov rax, 1
    mov rdi, 1
    mov rsi, red_frame_msg
    mov rdx, red_frame_len
    syscall

    mov qword [tv_sec], 2
    mov qword [tv_nsec], 200000000
    call do_delay
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

    mov qword [tv_sec], 3
    mov qword [tv_nsec], 0
    call do_delay

prompt_loop:
    mov rax, 1
    mov rdi, 1
    mov rsi, prompt_msg
    mov rdx, prompt_len
    syscall

    mov rax, 0
    mov rdi, 0
    mov rsi, input
    mov rdx, 2
    syscall

    cmp byte [input], 'q'
    je exit
    cmp byte [input], 'n'
    je night_mode
    cmp byte [input], 'p'
    je ped_mode
    
    jmp cycle_start

ped_mode:
    mov rax, 1
    mov rdi, 1
    mov rsi, ped_alert
    mov rdx, ped_alert_len
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, green_frame_msg
    mov rdx, green_frame_len
    syscall
    
    mov qword [tv_sec], 2
    mov qword [tv_nsec], 0
    call do_delay
    call do_move_up

    mov rax, 1
    mov rdi, 1
    mov rsi, yellow_frame_msg
    mov rdx, yellow_frame_len
    syscall

    mov qword [tv_sec], 1
    mov qword [tv_nsec], 500000000
    call do_delay
    call do_move_up

    mov rax, 1
    mov rdi, 1
    mov rsi, red_frame_msg
    mov rdx, red_frame_len
    syscall

    mov r12, 4
.ped_beep_loop:
    mov rax, 1
    mov rdi, 1
    mov rsi, beep_msg
    mov rdx, beep_len
    syscall

    mov qword [tv_sec], 1
    mov qword [tv_nsec], 0
    call do_delay
    
    dec r12
    jnz .ped_beep_loop

    jmp prompt_loop

night_mode:
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, nl_len
    syscall

    mov r12, 5
.night_loop:
    mov rax, 1
    mov rdi, 1
    mov rsi, yellow_frame_msg
    mov rdx, yellow_frame_len
    syscall

    mov qword [tv_sec], 0
    mov qword [tv_nsec], 500000000
    call do_delay
    call do_move_up

    mov rax, 1
    mov rdi, 1
    mov rsi, all_off_frame_msg
    mov rdx, all_off_frame_len
    syscall

    mov qword [tv_sec], 0
    mov qword [tv_nsec], 500000000
    call do_delay

    dec r12
    jz .night_end

    call do_move_up
    jmp .night_loop

.night_end:
    jmp prompt_loop

do_move_up:
    mov rax, 1
    mov rdi, 1
    mov rsi, move_up
    mov rdx, move_up_len
    syscall
    ret

do_delay:
    mov rax, 35
    mov rdi, timeval
    xor rsi, rsi
    syscall
    ret

exit:
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, nl_len
    syscall
    mov rax, 60
    mov rdi, 0
    syscall
"""

with open('traffic.asm', 'w') as f:
    f.write(asm)
