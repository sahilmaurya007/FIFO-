# FIFO-

# FIFO Memory Implementation

## Overview
A parameterized FIFO (First-In-First-Out) memory implementation in Verilog with configurable depth and width.

## Features
- Parameterized design (Default: 8-depth, 4-bit width)
- Synchronous reset
- Read/Write operations
- Status flags:
  - Full: FIFO is full
  - Empty: FIFO is empty
  - Half: FIFO is half or more full
  - IDLE: No read/write operation
- Dual-mode output:
  - Data mode (status=1): Shows memory data
  - Flag mode (status=0): Shows status flags

## File Structure
```
FIFO_Project/
├── src/
│   ├── fifo_memory.v     # Main FIFO implementation
│   └── tb_fifo_memory.v  # Testbench
└── README.md
```

## Port Description
| Port     | Direction | Width  | Description                    |
|----------|-----------|--------|--------------------------------|
| clk      | input     | 1-bit  | Clock signal                  |
| reset    | input     | 1-bit  | Synchronous reset             |
| EN       | input     | 1-bit  | Enable signal                 |
| WR       | input     | 1-bit  | Write enable                  |
| RD       | input     | 1-bit  | Read enable                   |
| status   | input     | 1-bit  | Output mode select            |
| Data_in  | input     | 4-bit  | Input data                    |
| Data_out | output    | 4-bit  | Output data/flags             |
| Full     | output    | 1-bit  | FIFO full flag               |
| Empty    | output    | 1-bit  | FIFO empty flag              |
| IDLE     | output    | 1-bit  | No operation flag            |
| Half     | output    | 1-bit  | FIFO half full flag          |

## Usage
1. Clone the repository:
```bash
git clone https://github.com/YourUsername/FIFO.git
```

2. Open in Vivado:
   - Create new project
   - Add source files from src/
   - Set simulation properties
   - Run simulation

## Simulation
The testbench performs:
- Reset sequence
- Write 8 sequential values
- Read all values
- Check status flags

## Output Format
- Data mode (status=1):
  - Shows actual data values (0-8)
- Flag mode (status=0):
  - Shows {Full, Half, Empty, IDLE}

## Author
Your Name

## License
This project is licensed under the MIT License - see the LICENSE file for details
