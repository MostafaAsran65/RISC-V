Vortex ASIC – Team Work Distribution

This README provides an organized overview of the work distribution for the Vortex GPGPU ASIC migration project, which aims to transition the design from FPGA to a 7nm ASIC.
The roles listed here map the functional responsibilities from the Vortex ASIC Notes to the actual RTL files inside the project repository.

🚀 Project Overview

The Vortex project consists of 130+ SystemVerilog modules covering the compute cores, cache hierarchy, tensor unit, memory interconnect, and top-level system.
To manage the migration to ASIC efficiently, the team is divided into three groups, each focusing on a major part of the design:

Infrastructure & Backend

Architecture & Logic

System & Integration

Each role is assigned a clear RTL scope and a specific technical mission.

📌 Group 1: Infrastructure & Backend
1. ASIC Flow & Toolchain Lead

Responsibilities:

Set up Synopsys environment (DC, ICC2)

Manage automation and design flow

Handle macro placement and SRAM integration

RTL Scope – Cache Subsystem:

VX_cache.sv
VX_cache_cluster.sv
VX_cache_bank.sv
VX_cache_data.sv
VX_cache_tags.sv
VX_cache_flush.sv
VX_cache_mshr.sv


Mission:
Replace behavioral FPGA memories (VX_sp_ram.sv, VX_dp_ram.sv) with SRAM macros from memory compilers and ensure timing correctness.

2. Physical Design Engineer

Responsibilities:

Floorplanning, timing closure, congestion

Signal integrity and physical optimization

RTL Scope – Execution Units:

VX_alu_unit.sv
VX_fpu_unit.sv
VX_lsu_unit.sv
VX_multiplier.sv
VX_divider.sv
VX_serial_mul.sv


Mission:
Optimize critical datapaths to achieve high-frequency timing on ASIC.

📌 Group 2: Architecture & Logic
3. Microarchitecture Designer

Responsibilities:

Pipeline structure tuning

Thread/warp scheduling improvements

RTL-level performance optimization

RTL Scope – Core Control Logic:

VX_schedule.sv
VX_issue.sv
VX_issue_slice.sv
VX_scoreboard.sv
VX_fetch.sv
VX_decode.sv


Mission:
Enhance IPC through smarter scheduling, hazard handling, and pipeline balancing.

4. Verification & QA Engineer

Responsibilities:

Create SystemVerilog/UVM testbenches

Validate complex arithmetic/tensor blocks

RTL Scope – Tensor Core Unit:

VX_tcu_*.sv
VX_tcu_fedp_*.sv


Mission:
Ensure full functional correctness of tensor and matrix operations prior to tape-out.

📌 Group 3: System & Integration
5. Performance & PPA Analyst

Responsibilities:

Benchmarking and profiling

Area, power, and performance analysis

RTL Scope – Monitoring & Backend:

VX_csr_unit.sv
VX_csr_data.sv
VX_commit.sv
VX_writeback.sv
VX_branch_ctl_if.sv


Mission:
Use CSR counters to analyze IPC, cache statistics, stalls, and energy-related events.

6. Integration & Reproducibility Engineer

Responsibilities:

Memory subsystem integration

AXI connectivity and dataflow validation

Documentation & CI/CD support

RTL Scope – Memory Interface:

VX_mem_scheduler.sv
VX_mem_coalescer.sv
VX_axi_adapter.sv
VX_mem_bank_adapter.sv


Mission:
Optimize DRAM bandwidth usage and ensure correct AXI protocol behavior.

7. Project Manager & Top-Level Integrator

Responsibilities:

Maintain hierarchical structure

Manage global configuration

Integrate all subsystems

RTL Scope – Top Level & Libraries:

Vortex.sv
VX_core.sv
VX_socket.sv
VX_cluster.sv
VX_gpu_pkg.sv
VX_define.vh
VX_stream_xbar.sv
VX_elastic_buffer.sv
VX_fifo_queue.sv


Mission:
Combine all components into the final Vortex.sv top-level and maintain unified configuration across the project.

📊 Summary Table
Member	Role	RTL Scope	Technical Mission
1	ASIC Flow Lead	Cache System	Replace FPGA RAMs with ASIC SRAM macros
2	Physical Design	Execution Units	Timing closure & datapath optimization
3	Microarchitecture	Core Control	Improve scheduling, pipeline, IPC
4	Verification	Tensor Core	Full functional verification
5	Performance Analyst	CSR & Commit	PPA analysis and benchmarking
6	Integration	Memory Interface	AXI/DRAM integration and correctness
7	Project Manager	Top-Level & Libs	System assembly and configuration
