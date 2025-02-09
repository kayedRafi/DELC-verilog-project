# Boolean Expression POS to Verilog Implementation

This project implements a 5-variable Boolean expression given in Product of Sum (POS) form, simplifies it using K-map, and provides Verilog implementations in gate-level, data flow, and behavioral modeling.

## Project Overview

The project takes a Boolean expression F(a,b,c,d,g) = Π(2,4,7,13,19,24,26) and:
1. Creates a truth table
2. Simplifies the expression using K-map
3. Implements the simplified expression in Verilog using three different modeling approaches
4. Provides test bench for verification

## Simplified Expression

The Boolean expression after K-map simplification:
```
F = (a'+b'+c+g) * (a'+b+c+d'+g') * (a+b+c+d'+g) * (a+b+c'+d'+g') * (a+b'+c'+d+g') * (a+b+c'+d+g)
```

## Implementation Details

The project includes three different Verilog implementations:
1. Gate Level Modeling - Uses basic logic gates (AND, OR, NOT)
2. Data Flow Modeling - Uses continuous assignments
3. Behavioral Modeling - Uses case statements

## Files Structure

- `gate_level.v` - Gate level implementation
- `data_flow.v` - Data flow implementation
- `behavioral.v` - Behavioral implementation
- `testbench.v` - Test bench for verification
- `docs/` - Project documentation and circuit diagrams

## Simulation Results

The simulation results show:
- Correct output values for all input combinations
- Proper timing behavior
- Verification of maxterms (positions 2,4,7,13,19,24,26 showing output F=0)



## Requirements

- Verilog HDL simulator
- Basic understanding of Boolean algebra and K-maps
- Knowledge of Verilog HDL

## Documentation

The project includes:
- Detailed truth table
- K-map simplification process
- Circuit diagrams
- Timing diagrams
- Simulation results

## Contributors

- Md. Kayed ibnet
- Project guided by:
  - Dr. Pallab Kumar Choudhury
  - Naymur Rahman

## Course Information

- Course: ECE-2104
- Institution: Khulna University of Engineering & Technology (KUET)
- Department: Electronics and Communication Engineering
