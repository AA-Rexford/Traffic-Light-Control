# Traffic Light Controller (64-bit Assembly)

This project is a 64-bit Linux Assembly program simulating a real-world **Traffic Light State Machine**. It demonstrates memory segmentation, system calls, subroutines, interactive standard I/O (Input/Output), and control flow.

## 🚦 Project Overview

The program executes a traffic light cycle: **RED -> YELLOW -> GREEN**. 

To make the presentation stunning, we designed **Massive ASCII Art Circles** using standard characters (`-`, `.`, `\`, `/`) to render huge, perfectly circular lights directly in the terminal! We also use 256-color ANSI codes to ensure the Yellow is incredibly bright and doesn't look brown. The yellow light also uses the Ghanaian style "GET READY!" prompt.

After completing a cycle, it pauses and waits for the user to press **ENTER** before running another cycle, ensuring the presenter has 100% control over the pace.

## 🛠️ Concepts & Technologies Used

This project utilizes raw low-level instructions to communicate directly with the Linux Kernel.

### 1. File Sections
* **`.data`**: Allocates memory for static variables (e.g., our printable strings like `"RED light is ON"`). We use the `equ` directive to dynamically calculate string lengths at compile time.
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
* **`call` and `ret`**: We created a modular subroutine (`do_delay`) to handle the redundant task of triggering the sleep timer. We `call` this between every state, and `ret` brings us back to the next step.
* **`cmp` and `je`**: Comparisons (Conditional Jumps). We check if the user inputted 'q'. If `je` (Jump if Equal) is true, we skip the loop and gracefully end the script. 
* **`jmp`**: Unconditional Jump. Used to loop back to the `RED` state when the user presses ENTER.

---

## 🚀 How to Run the Project

### Prerequisites
You need a Linux environment with the Netwide Assembler (**NASM**) and the GNU Linker (**ld**) installed:
```bash
sudo apt update && sudo apt install nasm binutils -y
```

### Build & Run
To download, compile, and run the project, just copy and paste this entire block into your terminal:

```bash
git clone https://github.com/AA-Rexford/Traffic-Light-Control.git
cd Traffic-Light-Control
chmod +x build.sh
./build.sh
./traffic
```

### Usage
- Press **ENTER** repeatedly to trigger a new traffic light cycle.
- Type **q** and hit **ENTER** to safely terminate the program.
