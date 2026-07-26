# Traffic Light Controller (64-bit Assembly)

This project is a 64-bit Linux Assembly program simulating a real-world **Traffic Light State Machine**. It demonstrates memory segmentation, system calls, subroutines, interactive standard I/O (Input/Output), and control flow.

## 🚦 Project Overview

The program initializes in a `RED` light state, and sequentially transitions through `GREEN` and `YELLOW` states, eventually looping back to `RED`. 

This is a **fully automated** simulation. It uses the kernel's `sys_nanosleep` system call to accurately time the light transitions. It also utilizes **ANSI terminal escape codes** to clear the screen before every transition and print the traffic lights in their actual colors (Red, Green, Yellow), creating a beautiful, real-time presentation piece.

## 🛠️ Concepts & Technologies Used

This project utilizes raw low-level instructions to communicate directly with the Linux Kernel.

### 1. File Sections
* **`.data`**: Allocates memory for static variables (e.g., our colored strings). We use the `equ` directive to dynamically calculate string lengths at compile time. We also define our `timespec` struct here for the sleep timer.
* **`.text`**: The main execution block containing our operational opcodes. Begins at `global _start`.

### 2. 64-bit Registers
The program uses 64-bit general-purpose registers to pass arguments into system calls:
* **`rax`** - Accumulator: Used to pass the specific System Call ID.
* **`rdi`** - Destination Index: Used to pass the File Descriptor (0 for stdin, 1 for stdout) or struct pointers.
* **`rsi`** - Source Index: Used as a pointer to the memory location of our strings.
* **`rdx`** - Data Register: Used to specify the length/size of the data we are reading or writing.

### 3. Linux System Calls (`syscall`)
* **`sys_write` (ID 1):** Commands the kernel to print our predefined string buffers (and color codes) out to the console terminal.
* **`sys_nanosleep` (ID 35):** Commands the kernel to pause execution for a highly precise duration based on our `timespec` struct.

### 4. Control Flow & Subroutines
* **`call` and `ret`**: We created modular subroutines (`do_clear` and `do_delay`) to handle the redundant tasks of clearing the terminal and triggering the sleep timer. We `call` these between every state, and `ret` brings us back to the next step.
* **`jmp`**: Unconditional Jump. Used at the end of the `YELLOW` state to force the code pointer back to the `RED` state, creating our infinite automated sequence.

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
- The traffic light will automatically run and cycle through its states with built-in timers.
- To exit the simulation, press `Ctrl+C` in your terminal.
