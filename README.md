# 🚀 MIPS Single-Cycle Processor (Verilog HDL)

This project implements a **single-cycle MIPS processor** using Verilog HDL. It models the core components of a simplified MIPS architecture including the datapath, control unit, instruction memory, data memory, ALU, and supporting logic. The processor is capable of executing a subset of MIPS instructions such as `add`, `sub`, `lw`, `sw`, and `beq`.

---

## 🧠 Key Features

- **Instruction Memory**: Stores and fetches 32-bit instructions.
- **Data Memory**: 4 KB memory space for read/write operations.
- **Register File**: 32 general-purpose 32-bit registers.
- **ALU**: Performs arithmetic and logical operations.
- **ALU Control**: Interprets R-type function codes.
- **Control Unit**: Decodes opcodes to generate control signals.
- **Program Counter (PC)**: Tracks instruction sequence.
- **Multiplexers (MUX)**: Selects input based on control signals.
- **Sign Extenders**: Extends 16-bit and 10-bit values for ALU and branch operations.
- **Branching Logic**: Implements conditional branches via `beq`.

---

## 🧪 Testbench

A comprehensive testbench (`MIPS_Testbench.v`) is included:

- Generates a clock signal
- Applies reset logic
- Simulates the processor through multiple clock cycles
- Monitors:
  - PC
  - Current instruction
  - Selected register values (e.g., `$t0`, `$t1`, `$t2`)
  - Sample memory values
