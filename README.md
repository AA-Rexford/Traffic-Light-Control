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

1. **In-Place Hologram Animation (ANSI Cursor Control)**
   Instead of constantly scrolling the terminal down, we inject raw ANSI escape codes (`\033[8A`) directly to the Linux kernel to move the cursor UP 8 lines before printing the next state. The traffic light **stays locked in one spot** and morphs colors *in-place* like a modern UI dashboard!
2. **Accessibility Beep (Visually Impaired Mode)**
   Real pedestrian traffic lights emit an audible sound when it is safe to cross. We implemented this by injecting the raw ASCII Bell byte (`0x07`) into the Pedestrian Mode sequence, causing the computer to physically beep to assist visually impaired pedestrians.
3. **Interactive State Machine (Night Mode & Pedestrians)**
   The interactive prompt acts as a complex state machine router:
   - **Night Mode (`n`)**: Triggers an isolated loop that rapidly flashes a Yellow circle and a dark gray Blank circle, simulating an intersection at 2:00 AM.
   - **Pedestrian Mode (`p`)**: Simulates a pedestrian hitting the crosswalk button. It cuts the Green light short, transitions to Yellow, and then holds on Red while continuously beeping.

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
