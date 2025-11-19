<div align="center">

# Vortex ASIC – Team Work Distribution

### A structured overview of the work distribution for the Vortex GPGPU ASIC migration project.

**Mapping each role to its RTL ownership and technical responsibilities.**

</div>

---

## Project Overview
The project involves migrating the Vortex architecture from FPGA to a **7nm ASIC process**, covering over **130+ SystemVerilog files**.

To manage the workload effectively, the team is divided into three functional groups:

1.  **Infrastructure & Backend**
2.  **Architecture & Logic**
3.  **System & Integration**

---

## 🏗️ Group 1: Infrastructure & Backend

### 1. ASIC Flow & Toolchain Lead
* **Responsibilities:**
    * Set up Synopsys toolchain (DC, ICC2).
    * Manage automation scripts and macros.
    * Integrate SRAM compilers.
* **Mission:** Replace behavioral FPGA memories with ASIC SRAM macros and ensure timing integrity.

**RTL Ownership:**
```text
VX_cache.sv
VX_cache_cluster.sv
VX_cache_bank.sv
VX_cache_data.sv
VX_cache_tags.sv
VX_cache_flush.sv
VX_cache_mshr.sv

2. Physical Design EngineerResponsibilities:Floorplanning & timing closure.Congestion analysis + signal integrity checks.Mission: Optimize critical datapaths to reach target ASIC frequencies.RTL Ownership:PlaintextVX_alu_unit.sv
VX_fpu_unit.sv
VX_lsu_unit.sv
VX_multiplier.sv
VX_divider.sv
VX_serial_mul.sv
🧠 Group 2: Architecture & Logic3. Microarchitecture DesignerResponsibilities:Pipeline tuning and optimization.Thread/Warp scheduling logic.General RTL logic optimization.Mission: Enhance IPC (Instructions Per Cycle) by improving scheduling, hazard handling, and pipeline behavior.RTL Ownership:PlaintextVX_schedule.sv
VX_issue.sv
VX_issue_slice.sv
VX_scoreboard.sv
VX_fetch.sv
VX_decode.sv
4. Verification & QA EngineerResponsibilities:Build SystemVerilog/UVM testbenches.Validate tensor operations and math units.Mission: Verify correctness of complex matrix/tensor operations before fabrication.RTL Ownership:PlaintextVX_tcu_*.sv
VX_tcu_fedp_*.sv
🔗 Group 3: System & Integration5. Performance & PPA AnalystResponsibilities:Benchmarking (MLPerf, Rodinia).Power, Area, and Frequency analysis.Mission: Extract IPC, stalls, cache stats, and energy indicators using CSR counters.RTL Ownership:PlaintextVX_csr_unit.sv
VX_csr_data.sv
VX_commit.sv
VX_writeback.sv
VX_branch_ctl_if.sv
6. Integration & Reproducibility EngineerResponsibilities:Memory subsystem integration.AXI interface correctness.Documentation & CI/CD consistency.Mission: Ensure high-bandwidth dataflow and correct DRAM communication.RTL Ownership:PlaintextVX_mem_scheduler.sv
VX_mem_coalescer.sv
VX_axi_adapter.sv
VX_mem_bank_adapter.sv
7. Project Manager & Top-Level IntegratorResponsibilities:Maintain project hierarchy and file structure.System-wide configuration management.Integrate all subsystems (Clusters, Sockets, Cores).Mission: Assemble all components in the top-level design and maintain unified configurations.RTL Ownership:PlaintextVortex.sv
VX_core.sv
VX_socket.sv
VX_cluster.sv
VX_gpu_pkg.sv
VX_define.vh
VX_stream_xbar.sv
VX_elastic_buffer.sv
VX_fifo_queue.sv
📊 Summary Table#RoleRTL ScopeTechnical Mission1ASIC Flow LeadCache SystemSRAM macro integration2Physical DesignExecution UnitsTiming closure & datapath optimization3MicroarchitectureCore ControlIPC & scheduling improvement4Verification Eng.Tensor CoreFull functional verification5Performance AnalystCSR & CommitPPA reports and profiling6Integration Eng.Memory InterfaceAXI/DRAM dataflow optimization7Project ManagerTop-Level SystemFull-chip integration & config
