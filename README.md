# Synchronous FIFO Memory Implementation

## Repository
[FIFO Memory Project](https://github.com/sahilmaurya007/FIFO-)

## Overview
A parameterized FIFO (First-In-First-Out) memory implementation in Verilog with configurable depth and width, featuring dual-mode output functionality.

## Features
### Core Functionality
- Parameterized design:
  - Default depth: 8 words
  - Default width: 4 bits
- Synchronous clock operation
- Configurable read/write operations
- Dual output modes

### Control Signals
- Enable (EN): Global FIFO control
- Write (WR): Write operation enable
- Read (RD): Read operation enable
- Status: Mode selection
  - Status = 1: Data mode
  - Status = 0: Flag mode

### Status Flags
- Full: FIFO buffer is full
- Empty: FIFO buffer is empty
- Half: FIFO is half or more full
- IDLE: No active read/write operation

## Interface Description
| Signal    | Width  | Direction | Description                    |
|-----------|--------|-----------|--------------------------------|
| clk       | 1-bit  | Input     | System clock                  |
| reset     | 1-bit  | Input     | Synchronous reset             |
| EN        | 1-bit  | Input     | FIFO enable                   |
| WR        | 1-bit  | Input     | Write enable                  |
| RD        | 1-bit  | Input     | Read enable                   |
| status    | 1-bit  | Input     | Mode select                   |
| Data_in   | 4-bit  | Input     | Input data bus               |
| Data_out  | 4-bit  | Output    | Output data/flags bus        |
| Full      | 1-bit  | Output    | Full flag                    |
| Empty     | 1-bit  | Output    | Empty flag                   |
| IDLE      | 1-bit  | Output    | Idle status                  |
| Half      | 1-bit  | Output    | Half-full flag              |

## Operation Modes
### Data Mode (status = 1)
- Data_out shows memory contents during read
- Sequential read/write operations
- First-in-first-out data flow

### Flag Mode (status = 0)
Data_out format: {Full, Half, Empty, IDLE}
- Bit 3: Full flag
- Bit 2: Half flag
- Bit 1: Empty flag
- Bit 0: IDLE flag

## Project Structure
```
FIFO_Project/
├── rtl/
│   └── fifo_memory.v    # Main FIFO implementation
├── tb/
│   └── tb_fifo_memory.v # Testbench file
├── sim/
│   └── fifo_in.txt      # Test input data
└── README.md
```

## Simulation
### Test Sequence
1. Reset initialization
2. Write sequence (8 values)
3. Read sequence (8 values)
4. Flag verification

### Expected Output
- Data Mode:
  - Sequential values (1-8)
- Flag Mode:
  - Final state: 0011 (Empty=1, IDLE=1)

## Usage Instructions
1. Clone the repository:
```bash
git clone https://github.com/sahilmaurya007/FIFO-.git
cd FIFO-
```

2. Create project structure:
```bash
mkdir rtl tb sim
```

3. Copy source files to respective directories
4. Run in Vivado:
```tcl
create_project fifo_proj ./fifo_proj -part xc7a35tcpg236-1
add_files {./rtl/fifo_memory.v ./tb/tb_fifo_memory.v}
set_property top tb_fifo_memory [get_filesets sim_1]
launch_simulation
```

## Author
Sahil Maurya
- GitHub: [sahilmaurya007](https://github.com/sahilmaurya007)
- Repository: [FIFO-](https://github.com/sahilmaurya007/FIFO-)

## License
MIT License
