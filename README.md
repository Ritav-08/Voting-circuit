# 📘 4-bit Majority Voting Circuit – Verilog

## 🔹 Overview

This project implements a **4-bit Majority Voting Circuit** in Verilog along with its testbench.
The circuit determines whether the majority of inputs are `1` and also detects a **tie condition**.

---

## 🔹 Features

* 4 input bits (`a_i[3:0]`)
* Majority detection output
* Tie detection output
* Efficient implementation using **bit counting**
* Fully combinational logic

---

## 🔹 Module Description

### 📌 Inputs

* `a_i [3:0]` → 4-bit input data

### 📌 Outputs

* `y_o` → Majority output
* `t_o` → Tie indicator

---

## 🔹 Working Principle

### 🔸 Bit Counting Method

* Counts number of `1s`:

  ```
  count = a_i[3] + a_i[2] + a_i[1] + a_i[0]
  ```

### 🔸 Majority Logic

* Majority exists when:

  ```
  count ≥ 3
  ```
* Output:

  ```
  y_o = 1 (majority of 1s)
  ```

### 🔸 Tie Condition

* Tie occurs when:

  ```
  count = 2
  ```
* Output:

  ```
  t_o = 1
  ```

---

## 🔹 Truth Table Summary

| Inputs | # of 1s | Majority (y_o) | Tie (t_o) |
| ------ | ------- | -------------- | --------- |
| 0000   | 0       | 0              | 0         |
| 0001   | 1       | 0              | 0         |
| 0011   | 2       | 0              | 1         |
| 0111   | 3       | 1              | 0         |
| 1111   | 4       | 1              | 0         |

---

## 🔹 Alternative Design (Commented)

* Uses **boolean expression for majority logic**
* Tie detection using parity:

  ```
  t_o = ~(^a_i)   // even number of 1s
  ```

⚠️ Less scalable and harder to maintain compared to counting approach.

---

## 🔹 Testbench Details

The testbench (`tb_mVoting`) verifies:

### 🔸 Test Coverage

* Iterates through all input combinations (0–15)
* Displays:

  * Input pattern
  * Majority result
  * Tie condition

---

## 🔹 Simulation

### ▶️ Tools

* ModelSim / QuestaSim
* Xilinx Vivado
* Icarus Verilog + GTKWave

### ▶️ Run (Icarus Verilog Example)

```bash id="mv_run"
iverilog -o mVoting.vvp mVoting.v tb_mVoting.v
vvp mVoting.vvp
gtkwave mVoting.vcd
```

---

## 🔹 Output

* Console output using `$monitor`
* Waveform dump file:

  ```
  mVoting.vcd
  ```

---

## 🔹 Sample Output Format

```id="mv_sample"
Time: 10 | Inputs: 0111 | Majority: 1 | Tie: 0
```

---

## 🔹 Applications

* Voting systems in fault-tolerant designs
* Redundant system decision logic
* Error correction schemes
* Digital consensus circuits

---

## 🔹 Design Insights

* Bit counting approach is scalable and readable
* Avoids complex boolean expressions
* Easily extendable to higher bit-width voting systems

---

## 🔹 File Structure

```id="mv_struct"
├── mVoting.v        # Majority Voting Design
├── tb_mVoting.v     # Testbench
├── mVoting.vcd      # Waveform output (generated)
└── README.txt       # Documentation
```
