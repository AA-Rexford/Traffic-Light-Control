# Traffic Light Controller (64-bit Assembly)

This project is a 64-bit Linux Assembly program simulating a real-world **Traffic Light State Machine**. It demonstrates memory segmentation, system calls, subroutines, interactive standard I/O (Input/Output), and control flow.

## 🚦 Project Overview

The program executes a traffic light cycle: **RED -> YELLOW -> GREEN**. 

To make the presentation stunning, we designed **Massive ASCII Art Circles** using standard characters (`-`, `.`, `\`, `/`) to render huge, perfectly circular lights directly in the terminal! We also use 256-color ANSI codes to ensure the Yellow is incredibly bright and doesn't look brown. The yellow light also uses the Ghanaian style "GET READY!" prompt.

After completing a cycle, it pauses and waits for the user to press **ENTER** before running another cycle, ensuring the presenter has 100% control over the pace.

## 🛠️ Concepts & Technologies Used

This project utilizes raw low-level instructions to communicate directly with the Linux Kernel.

### 1. File Sections
* **`.data`**: Allocates memory for static variables (e.g., our massive ASCII art string variables like `red_msg`). We use the `equ` directive to dynamically calculate string lengths at compile time. We also define our `timespec` struct here for the sleep timers.
* **`.bss`**: Reserves memory (buffers) for variables that will be modified at runtime. We use this to hold the user's keyboard input.
* **`.text`**: The main execution block containing our operational opcodes. Begins at `global _start`.

### 2. 64-bit Registers
The program uses 64-bit general-purpose registers to pass arguments into system calls:
* **`rax`** - Accumulator: Used to pass the specific System Call ID.
* **`rdi`** - Destination Index: Used to pass the File Descriptor (0 for stdin, 1 for stdout).
* **`rsi`** - Source Index: Used as a pointer to the memory location (buffer) of our strings.
* **`rdx`** - Data Register: Used to specify the length/size of the data we are reading or writing.

### 3. Linux System Calls (`syscall`)
* **`sys_write` (ID 1):** Commands the kernel to print our predefined string buffers out to the console terminal.
* **`sys_read` (ID 0):** Commands the kernel to pause execution and read keystrokes from the terminal. 
* **`sys_nanosleep` (ID 35):** Commands the kernel to sleep for a precise duration between state transitions.
* **`sys_exit` (ID 60):** Tells the kernel to terminate the program cleanly with exit code 0.

### 4. Control Flow & Subroutines
* **`call` and `ret`**: We created modular subroutines (`do_delay` and `do_move_up`) to handle redundant tasks like triggering the sleep timer and manipulating the terminal cursor.
* **`cmp` and `je`**: Comparisons (Conditional Jumps). We check if the user inputted 'q', 'n', or 'p'. The `je` (Jump if Equal) dynamically routes the program to different state machines (Quit, Night Mode, Pedestrian Mode).
* **`jmp`**: Unconditional Jump. Used to loop back to the `prompt_loop`.

---

## 🌟 Innovation & Creativity Features

To push the boundaries of standard Assembly projects, this program includes advanced real-world features:

1. **Realistic 3D Double-Frame Housing & Pole**
   The UI now draws an entire real-world traffic light box, including a double-layered, rounded housing frame and a physical stand at the bottom! All 3 lights are constantly visible inside this 3D frame, stacked vertically. The active light is painted in bright, vibrant colors, while the inactive lights are rendered as empty, dark-gray outlines to perfectly simulate a physical traffic light with its bulbs turned off.
2. **In-Place Hologram Animation (ANSI Cursor Control)**
   Instead of endlessly scrolling down the terminal, the traffic light tower **stays locked in a single spot**. When a light changes, the Assembly code sends a raw ANSI escape sequence (`\033[35A`) to the Linux kernel to move the terminal cursor UP 35 lines. It then perfectly overwrites the previous tower in-place.
3. **Accessibility Beep (Visually Impaired Mode)**
   Real pedestrian traffic lights emit an audible sound when it is safe to cross. We implemented this by injecting the raw ASCII Bell byte (`0x07`) into the Pedestrian Mode sequence, causing the computer to physically beep to assist visually impaired pedestrians.
4. **Interactive State Machine (Night Mode & Pedestrians)**
   The interactive prompt acts as a complex state machine router:
   - **Night Mode (`n`)**: Triggers an isolated loop that rapidly flashes a Yellow circle and a dark gray Blank circle, simulating an intersection at 2:00 AM.
   - **Pedestrian Mode (`p`)**: Simulates a pedestrian hitting the crosswalk button. It cuts the Green light short, transitions to Yellow, and then holds on Red while continuously beeping.

---

## 📚 Course Concepts Applied (Presentation Notes)

This project heavily utilizes the core concepts taught in class:

### 1. Memory Segments
- **`.data`**: Used to store our initialized constants (the massive ASCII art frames like `red_frame_msg`) and prompt strings.
- **`.bss`**: Used to reserve uninitialized memory buffers (`input resb 2`) to capture user keystrokes dynamically at runtime.
- **`.text`**: Stores our executable instructions and subroutines.

### 2. General Purpose Registers & Addressing Modes
- **Accumulator (`rax`)**: Used extensively to hold the System Call ID (e.g., `1` for `sys_write`, `60` for `sys_exit`).
- **Data Register (`rdx`)**: Used to hold the length of our string buffers before executing `sys_write`.
- **Immediate Addressing**: e.g., `mov rax, 1` (moving the constant 1 directly into the register).
- **Register Addressing**: e.g., `dec r12` (decrementing the value stored in the `r12` register directly).
- **Direct Addressing**: e.g., `cmp byte [input], 'q'` (accessing the specific memory location of the `input` buffer).

### 3. Control Flow & Flags
- We implemented an interactive router using **Comparisons (`cmp`)** and **Conditional Jumps (`je`)**. When `cmp` compares the user input against 'q', it updates the **Zero Flag (ZF)**. The `je` (Jump if Equal) instruction then checks this flag to divert the control flow.
- We also use **Unconditional Jumps (`jmp`)** to create infinite loops (like the Night Mode flashing cycle).

### 4. 64-bit Architecture vs 32-bit
- While many standard tutorials use 32-bit `int 0x80` interrupts, this masterpiece is fully optimized for **Modern 64-bit x86_64 Architecture**, utilizing `syscall` instructions and 64-bit registers (`rax`, `rdi`, `rsi`).

---

## 🚀 How to Run the Project

### Prerequisites
You need a Linux environment with the Netwide Assembler (**NASM**) and the GNU Linker (**ld**) installed:
```bash
sudo apt update && sudo apt install nasm binutils -y
```

### Build & Run

To download the code, compile the assembly, and start the simulation, simply copy and paste this entire block into your terminal:

```bash
# 1. Download the project
git clone https://github.com/AA-Rexford/Traffic-Light-Control.git

# 2. Enter the directory
cd Traffic-Light-Control

# 3. Make the script executable and compile
chmod +x build.sh
./build.sh

# 4. Run the masterpiece!
./traffic
```

### Usage
- Press **ENTER** repeatedly to trigger a new traffic light cycle.
- Type **q** and hit **ENTER** to safely terminate the program.
