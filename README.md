
# MIPS Single-Cycle Architecture with Integrated DSP Unit

## Overview

This project enhances a traditional **single-cycle MIPS processor** by integrating a **Digital Signal Processing (DSP) unit** to enable real-time signal filtering. The design was implemented using **Vivado 2020.1** and **SystemVerilog**. A custom `dsp` instruction was added to the MIPS instruction set to offload FIR filtering operations from the ALU, making the processor suitable for mixed workloads involving signal processing.

## Key Features

- MIPS single-cycle architecture supporting R, I, and J-type instructions:
  - Arithmetic: `add`, `or`
  - Memory: `lw`, `sw`
  - Branch: `beq`
  - Jump: `j`
- Integrated **DSP unit** using a 3rd-order **FIR (Finite Impulse Response)** filter.
- **Custom R-type DSP instruction** that:
  - Reads input from a register
  - Processes it using the DSP block
  - Stores the filtered result in another register
- **Signal generation via Python** (NumPy): simulates noisy sine wave inputs.
- **Fully functional testbenches**:
  - `dsp_tb`: verifies the DSP block in isolation
  - `top_tb`: tests the complete system and instruction execution

## Architecture Components

- **Program Counter (PC)**
- **Instruction Memory (4KB)**
- **Data Memory (4KB)**
- **Register File (32 registers, 32-bit)**
- **ALU** supporting `add`, `sub`, `and`, `or`, `slt`
- **Control Unit** with:
  - Main decoder
  - ALU/DSP decoder
- **DSP Unit** with:
  - 4-tap moving average FIR filter
  - Coefficients: 0.25 scaled as fixed-point (`b = 32`)
  - Normalization: right shift by 7 (division by 128)
- **Modified datapath** and **MUX logic** to select between ALU and DSP outputs

## DSP Signal Input

Noisy sine wave signals were generated using Python:

```python
import numpy as np

samples = 64
amplitude = 32767
noise_amplitude = 1000

for i in range(samples):
    angle = 2 * np.pi * i / samples
    sine_val = int(amplitude * np.sin(angle))
    noise = int(np.random.normal(0, noise_amplitude))
    total = sine_val + noise
    print(f"#10 sample_in = 16'sd{total};")
```

These samples were directly fed to the DSP unit via the `dsp_tb` testbench.

## Simulation & Testing

### 🧪 DSP Module (Standalone)
- Input: Noisy sine wave
- Output: Smoothed sine wave (verified in waveform)
- Controlled via `dspcontrol` signal:
  - `3'b000`, `3'b001`: normal operation
  - `3'b010`: flush/reset

### 🧪 Full System Simulation
- Registers preloaded with noisy samples
- DSP instruction sequence stored in `memfile.dat`
- Simulation run time extended to `8000 ns` to complete all 32 DSP instructions
- Output observed in `sample_out` and data memory

### ✅ Results
- DSP unit **accurately filtered noise** and produced smooth sine output
- DSP instruction **executed correctly** by modified control and datapath
- Architecture **remained compatible** with original MIPS instruction formats

## How to Use

1. Launch Vivado 2020.1
2. Add all `.v` and `.sv` source files to the project
3. Set `top_tb` or `dsp_tb` as your simulation top module
4. Run behavioral simulation
5. Observe waveform outputs for `sample_in`, `sample_out`, and key registers

## Contributors

- Mohamed Dewidar
- Jaser Kasim
- Karim Fawzy
- Mohamed Tamer
- Youssef Mansy

**Supervisor:** Dr. Ahmed Soltan  
**Course:** ECEN438 – Advanced Computer Architecture  
**Date:** June 2025


## License
This project is for academic and educational use only.
