<div align="center">

# 🌪️ Vortex ASIC – Team Work Distribution

### A structured overview of the work distribution for the Vortex GPGPU ASIC migration project.

**Mapping each role to its RTL ownership and technical responsibilities.**

</div>

---

## ⚡ Project Overview
The project involves migrating the Vortex architecture from FPGA to a **7nm ASIC process**, covering over **130+ SystemVerilog files**.

To manage the workload effectively, the team is divided into three functional groups:

1.  **🏗️ Infrastructure & Backend**
2.  **🧠 Architecture & Logic**
3.  **🔗 System & Integration**

---

## 🏗️ Group 1: Infrastructure & Backend

### 1. ASIC Flow & Toolchain Lead
* **Responsibilities:**
    * Set up Synopsys toolchain (DC, ICC2).
    * Manage automation scripts and macros.
    * Integrate SRAM compilers.
* **🎯 Mission:** Replace behavioral FPGA memories with ASIC SRAM macros and ensure timing integrity.

**📂 RTL Ownership:**
```text
VX_cache.sv
VX_cache_cluster.sv
VX_cache_bank.sv
VX_cache_data.sv
VX_cache_tags.sv
VX_cache_flush.sv
VX_cache_mshr.sv
```

---

## 🧠 Group 2: Architecture & Logic

### 3. Microarchitecture Designer
* **Responsibilities:**
    * Pipeline tuning and optimization.
    * Thread/Warp scheduling logic.
    * General RTL logic optimization.
* **🎯 Mission:** Enhance IPC (Instructions Per Cycle) by improving scheduling, hazard handling, and pipeline behavior.

**📂 RTL Ownership:**
```text
VX_schedule.sv
VX_issue.sv
VX_issue_slice.sv
VX_scoreboard.sv
VX_fetch.sv
VX_decode.sv
VX_wctl_unit.sv
VX_split_join.sv
