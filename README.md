# Traffic Light Controller (64-bit Assembly)

This project is a 64-bit Linux Assembly program simulating a real-world **Traffic Light State Machine**. It demonstrates memory segmentation, system calls, subroutines, interactive standard I/O (Input/Output), and control flow.

## 🚦 Project Overview

The program initializes in a `RED` light state, and sequentially transitions through `GREEN` and `YELLOW` states, eventually looping back to `RED`. 

Unlike a time-based program, this program is **interactive**. It waits for the user to manually advance the state by pressing `ENTER`, allowing students and presenters to clearly observe and explain the state changes step-by-step. Pressing `q` will gracefully terminate the loop and exit the program.

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
* **`sys_exit` (ID 60):** Tells the kernel to terminate the program cleanly with exit code 0.

### 4. Control Flow & Subroutines
* **`call` and `ret`**: We created a modular subroutine (`wait_input`) to handle the redundant task of prompting the user and executing `sys_read`. We `call` this after every state, and `ret` brings us back to the next step.
* **`cmp` and `je`**: Comparisons (Conditional Jumps). We check if the user inputted 'q'. If `je` (Jump if Equal) is true, we skip the loop and gracefully end the script. 
* **`jmp`**: Unconditional Jump. Used at the end of the `YELLOW` state to force the code pointer back to the `RED` state, creating our infinite sequence.

---

## 🚀 How to Run the Project

### Prerequisites
You need a Linux environment with the Netwide Assembler (**NASM**) and the GNU Linker (**ld**) installed.

```bash
sudo apt update
sudo apt install nasm binutils
```

### Building the Project
We have provided an automated `build.sh` script to compile the assembly file into machine code and link it into an executable.

1. Clone or download this repository.
2. Open your terminal in the directory.
3. Make the build script executable (only needed once):
   ```bash
   chmod +x build.sh
   ```
4. Run the build script:
   ```bash
   ./build.sh
   ```

### Executing
After a successful build, a `traffic` executable binary will be generated. Run it by typing:

```bash
./traffic
```

### Usage
- Press **ENTER** repeatedly to cycle the traffic light states.
- Type **q** and hit **ENTER** to safely terminate the program.
