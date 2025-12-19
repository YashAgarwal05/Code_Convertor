# Binary Code Converter (Verilog)

## Introduction

A **Code Converter** is a digital system that converts data from one numerical representation to another. Such converters are widely used in digital systems where different encoding schemes are required for processing, storage, or display.

In this project, a **binary code converter** is implemented using **Verilog HDL**. The design supports multiple code conversions selected through a control input and updates the output synchronously with the clock.

---

## Code Conversion Concept and Timing

The converter operates on an **8-bit input data** value. Based on the selected **mode**, the input data is converted into a different numerical representation.

The conversion result is produced as combinational logic and then registered on the **rising edge of the clock**, ensuring synchronous output updates. A reset signal is provided to clear the output state.

---

## Supported Conversion Modes

The converter supports multiple conversion operations controlled by a 3-bit `mode` input:

- **Mode 000**: Binary to Gray code  
- **Mode 001**: Gray to Binary code  
- **Mode 010**: Binary to BCD  
- **Mode 011**: BCD to Binary  
- **Mode 100**: Binary to Excess-3  
- **Mode 101**: Excess-3 to Binary  

For any other mode value, the output defaults to zero.

---

## Design Overview

The design is organized into a modular structure consisting of:

- **Top-Level Converter Module**
- **Control Block**
- **Individual Code Conversion Modules**
- **Output State Register**

The control block selects the appropriate conversion based on the mode input and updates the output state accordingly.

---

## Binary Code Converter Module

### Interface Signals

- **clk**  
  System clock input

- **reset**  
  Asynchronous active-high reset

- **data [7:0]**  
  8-bit input data

- **mode [2:0]**  
  Selects the type of code conversion

- **state [7:0]**  
  Registered output representing the converted value

- **nextstate [7:0]**  
  Combinational output before registration

---

## Control Block Operation

- The control block receives the input data and mode selection.
- All conversion modules operate in parallel.
- A `case` statement selects the appropriate converted value based on `mode`.
- The selected value is assigned to `nextstate`.
- On the rising edge of the clock:
  - `state` is updated with `nextstate`
  - If reset is asserted, `state` is cleared to zero

This approach separates combinational conversion logic from sequential storage.

---

## Conversion Modules

### Binary to Gray Code

- Uses XOR operation between the input and its right-shifted version
- Produces an 8-bit Gray code output

### Gray to Binary Code

- Uses an iterative XOR method
- Reconstructs the original binary value from Gray code

### Binary to BCD

- Splits the binary number into tens and ones
- Outputs packed BCD format

### BCD to Binary

- Extracts tens and ones digits
- Reconstructs the equivalent binary value

### Binary to Excess-3

- Adds a fixed value of 3 to the binary input

### Excess-3 to Binary

- Subtracts 3 from the Excess-3 encoded input

Each module performs a specific conversion independently.

---

## Testbench Overview

A Verilog testbench is used to verify the functionality of the binary code converter.

### Testbench Features

- Generates a periodic clock signal
- Applies reset at the beginning of simulation
- Provides test input data and mode selection
- Observes both `state` and `nextstate` outputs
- Confirms correct conversion behavior for selected modes

The testbench validates correct operation of the converter under different configurations.

---

## Overall System Operation

1. Reset initializes the output state to zero.
2. Input data and conversion mode are applied.
3. The control block selects the appropriate conversion result.
4. The converted value appears on `nextstate`.
5. On the next clock edge, the value is stored in `state`.

This ensures reliable and synchronized code conversion.

---

## Summary

This project demonstrates a **multi-mode binary code converter** implemented in Verilog. The design supports several common code conversions using a clean modular structure and synchronous output logic.

The approach makes the converter easy to extend, test, and integrate into larger digital systems.

<img width="1567" height="805" alt="image" src="https://github.com/user-attachments/assets/38cb170a-81dd-449f-b000-40f3416c43bf" />
