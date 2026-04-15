#  16-bit Vedic Multiplier using Verilog

##  Overview

This project implements a **16-bit Vedic Multiplier** using the **Urdhva Tiryagbhyam (Vertical and Crosswise)** algorithm in Verilog HDL.

The design follows a **hierarchical approach**, where smaller multipliers are used to construct larger ones:

* 2×2 → 4×4 → 8×8 → 16×16

This modular structure improves **scalability, speed, and reusability** in digital design.

---

## Concept

The Vedic multiplication algorithm computes partial products in a **parallel and structured manner**, reducing delay compared to conventional multipliers.

The general formula used:

```
P = P0 + ((P1 + P2) << n) + (P3 << 2n)
```

Where:

* P0 = A_low × B_low
* P1 = A_high × B_low
* P2 = A_low × B_high
* P3 = A_high × B_high
* n = half the bit width

---

## Project Structure

```
vedic_multiplier/
│
├── vedic2x2.v        # Base multiplier (2-bit)
├── vedic4x4.v        # Uses 4 × 2x2 multipliers
├── vedic8x8.v        # Uses 4 × 4x4 multipliers
├── vedic16x16.v      # Uses 4 × 8x8 multipliers
└── vedic16x16_tb.v   # Testbench
```

---

##  Modules Description

###  vedic2x2.v

* Implements 2-bit multiplication using logic gates
* Forms the basic building block

### vedic4x4.v

* Uses four 2×2 multipliers
* Combines results using shifting and addition

### vedic8x8.v

* Uses four 4×4 multipliers
* Applies hierarchical Vedic logic

### vedic16x16.v

* Top-level module
* Uses four 8×8 multipliers to generate a 32-bit product

### vedic16x16_tb.v

* Provides test inputs
* Displays output using `$monitor`
* Generates waveform (`.vcd`) for GTKWave

---

## How to Run (Icarus Verilog)

### Step 1: Compile

```
iverilog -o vedic_sim vedic2x2.v vedic4x4.v vedic8x8.v vedic16x16.v vedic16x16_tb.v
```

### Step 2: Run

```
vvp vedic_sim
```

### Step 3: View Waveform (Optional)

```
gtkwave vedic16.vcd
```

---

## Sample Output

```
Time=0 | A=12 | B=5 | Product=60
Time=10 | A=255 | B=255 | Product=65025
Time=20 | A=1234 | B=4321 | Product=5332114
Time=30 | A=1000 | B=250 | Product=250000
Time=40 | A=65535 | B=2 | Product=131070
```

---

## Features

* ✔ Hierarchical and modular design
* ✔ Parallel computation of partial products
* ✔ Reduced propagation delay
* ✔ Scalable architecture
* ✔ Easy FPGA implementation

---

## 📊 Applications

* Digital Signal Processing (DSP)
* Arithmetic Logic Units (ALU)
* Embedded systems
* High-speed processors

---

## 🏁 Conclusion

The Vedic multiplier provides an efficient alternative to conventional multiplication techniques by leveraging **parallelism and structured computation**.

This project demonstrates how ancient mathematical principles can be effectively applied to modern digital hardware design using Verilog.

