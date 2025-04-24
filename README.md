# OFDM System Project – 64-QAM (MATLAB) & 16-QAM (Vivado Model Composer)

This project explores **Orthogonal Frequency Division Multiplexing (OFDM)** using both **64-QAM modulation (MATLAB)** and **16-QAM (Vivado Model Composer)**. It aims to simulate, analyze, and eventually implement a robust digital communication system.

---

## Project Overview

- **Primary Implementation**: MATLAB-based OFDM system using **64-QAM**
- **Secondary Implementation**: 16-QAM based system using **Vivado Model Composer**
- **Documentation**: A detailed **report** is included, covering all data, plots, analysis, and outcomes

---

## MATLAB – 64-QAM OFDM System

- **Features**:
  - Hermitian symmetry for real output
  - Cyclic prefix (CP) addition and removal
  - Pilot insertion and tracking
  - Constellation mapping using 64-QAM
  - Bitstream randomization
  - Enable/disable flags for plot generation

- **Current Status**:
  - **Bit Error Rate (BER)** stays around **0.5** regardless of Signal-to-Noise and Distortion Ratio (SNDR)
  - However, **QAM constellation responds correctly** to increasing SNDR
  - Indicates **bit reconstruction issue at receiver end**
  - Debugging in progress to resolve incorrect demodulated bit mapping

---

## Vivado Model Composer – 16-QAM System

- **Folder**: `vivado_model_composer_16qam/`
- Developed and simulated using **Xilinx Vivado Model Composer**
- Uses 16-QAM modulation
- Shares foundational structure with the MATLAB implementation

---

## Technologies and Tools Gained

- **MATLAB & Simulink**
- **Xilinx Vivado & Model Composer**
- **Digital Communication Concepts**
- **QAM Modulation/Demodulation**
- **OFDM Block Design**
- **Bitstream Mapping and Reconstruction**
- **Pilot Tracking and Channel Effects Simulation**

---

## Output Snapshots

Flags available in MATLAB code can toggle these visualizations:
- Time-domain and frequency-domain OFDM signal
- 64-QAM constellation plots (pre and post transmission)
- BER vs. SNDR curves (currently under evaluation)

---

## Next Steps

- Fix bit reconstruction issue in the receiver
- Cross-verify demodulated bits with transmitted bitstream
- Extend implementation to include error-correcting codes
