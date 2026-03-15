# 8-Bit Microprocessor Design in Verilog

This project implements a **simple 8-bit microprocessor** designed using **Verilog HDL** and simulated using **Xilinx Vivado**.  
The processor supports arithmetic operations, logical operations, register operations, and memory access using a small instruction set architecture.

The goal of this project is to demonstrate the **basic architecture of a CPU**, including instruction fetch, decode, execution, and memory interaction.

---

# Features

## Arithmetic Operations
- ADD (Addition)
- SUB (Subtraction)
- INC (Increment)
- DEC (Decrement)
- CMP (Comparison operation)
- ADC (Add with Carry)

## Logical Operations
- AND
- OR
- XOR
- NOR
- SHL (Shift Left)
- SHR (Shift Right)

## Additional Microprocessor Features
- Program Counter (PC) for sequential instruction execution
- Status Flag Register (Zero, Carry, Sign)
- Conditional Branch Instructions (JZ, JC)
- Immediate Operand Support
- 8-bit Register File (R0–R7)
- Memory Interface for ROM (Program) and RAM (Data)

---

# CPU Architecture

The processor consists of the following components:

Program Counter (PC)  
↓  
Instruction Memory (ROM)  
↓  
Instruction Decoder  
↓  
Register File (R0–R7)  
↓  
Arithmetic Logic Unit (ALU)  
↓  
Flag Register  
↓  
Data Memory (RAM)

### Components

**Program Counter**
- Holds address of next instruction
- Increments every clock cycle

**Instruction Memory**
- Stores program instructions
- Addressed using PC

**Register File**
- 8 general purpose registers
- Each register is 8 bits

**ALU**
- Performs arithmetic and logical operations

**Flag Register**
- Stores processor status flags
  - Zero
  - Carry
  - Sign

**Data Memory (RAM)**
- Used for load/store operations

---

# Instruction Format

Each instruction is **16 bits**.

| Bits | Field |
|-----|------|
|15-12| Opcode |
|11-9 | Destination Register (rd) |
|8-6  | Source Register 1 (rs1) |
|5-3  | Source Register 2 (rs2) |
|2-0  | Unused |

Example:

1298 (Hex)

Binary:

0001 001 010 011

Decoded instruction:

opcode = 0001 → ADD  
rd = 001 → R1  
rs1 = 010 → R2  
rs2 = 011 → R3  

Operation executed:

R1 = R2 + R3

---

# Example Execution

Initial register values:

R2 = 4  
R3 = 5  

Instruction:

ADD R1, R2, R3

Execution result:

R1 = 9

---

# Project Directory Structure

8bit-microprocessor-verilog

README.md  
LICENSE  
.gitignore  

src  
cpu_top.v  
program_counter.v  
instruction_memory.v  
register_file.v  
alu.v  
flag_register.v  
data_memory.v  

tb  
cpu_tb.v  

docs  
architecture.png  
waveform.png  

vivado_project  

---

# Simulation

Simulation was performed using **Vivado Behavioral Simulation**.

Important signals observed:

- clock
- program counter (pc)
- instruction
- register values
- ALU result
- status flags

Example execution flow:

PC → fetch instruction → decode → execute → write result.

---

# Tools Used

- Verilog HDL
- Xilinx Vivado 2024.2
- GitHub

---

# Applications

This project demonstrates key concepts in:

- Computer Architecture
- Digital System Design
- Processor Design
- Instruction Execution
- Register Operations
- Memory Interfacing

---

# Author

Shamil K  
B.Tech Electronics and Communication Engineering  
NSS College Palakkad
