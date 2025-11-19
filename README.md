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
   ```
 ## 4. Verification & QA Engineer
   Responsibilities:
   
   Build SystemVerilog/UVM testbenches.
   
   Validate tensor operations and math units.
   
   🎯 Mission: Verify correctness of complex matrix/tensor operations before fabrication.
   
   📂 RTL Ownership:
   
   ```text
   
   VX_tcu_top.sv
   VX_tcu_unit.sv
   VX_tcu_fp.sv
   VX_tcu_int.sv
   VX_tcu_pkg.sv
   VX_tcu_fedp_bhf.sv
   VX_tcu_fedp_dsp.sv
   ```
## 🔗 Group 3: System & Integration
 ## 5. Performance & PPA Analyst
   Responsibilities:
   
   Benchmarking (MLPerf, Rodinia).
   
   Power, Area, and Frequency analysis.
   
   🎯 Mission: Extract IPC, stalls, cache stats, and energy indicators using CSR counters.
   
   📂 RTL Ownership:
   
   ```text
   
   VX_csr_unit.sv
   VX_csr_data.sv
   VX_commit.sv
   VX_writeback.sv
   VX_branch_ctl_if.sv
   VX_sched_csr_if.sv
   ```
 ## 6. Integration & Reproducibility Engineer
   Responsibilities:
   
   Memory subsystem integration.
   
   AXI interface correctness.
   
   Documentation & CI/CD consistency.
   
   🎯 Mission: Ensure high-bandwidth dataflow and correct DRAM communication.
   
   📂 RTL Ownership:
   
   ```text
   VX_mem_scheduler.sv
   VX_mem_coalescer.sv
   VX_axi_adapter.sv
   VX_mem_bank_adapter.sv
   vortex_afu.sv
   ccip_std_afu.sv
   ```
 ## 7. Project Manager & Top-Level Integrator
   Responsibilities:
   
   Maintain project hierarchy and file structure.
   
   System-wide configuration management.
   
   Integrate all subsystems (Clusters, Sockets, Cores).
   
   🎯 Mission: Assemble all components in the top-level design and maintain unified configurations.
   
   📂 RTL Ownership:
   
   ```text
   Vortex.sv
   VX_core.sv
   VX_socket.sv
   VX_cluster.sv
   VX_gpu_pkg.sv
   VX_define.vh
   VX_config.vh
   VX_stream_xbar.sv
   VX_elastic_buffer.sv
   VX_fifo_queue.sv
   ```
   ---
   
 ## 📊 Summary Table
   
   | # | Role | RTL Scope | Technical Mission |
   | :---: | :--- | :--- | :--- |
   | **1** | **ASIC Flow Lead** | Cache System | SRAM macro integration |
   | **2** | **Physical Design** | Execution Units | Timing closure & datapath optimization |
   | **3** | **Microarchitecture** | Core Control | IPC & scheduling improvement |
   | **4** | **Verification Eng.** | Tensor Core | Full functional verification |
   | **5** | **Performance Analyst** | CSR & Commit | PPA reports and profiling |
   | **6** | **Integration Eng.** | Memory Interface | AXI/DRAM dataflow optimization |
   | **7** | **Project Manager** | Top-Level System | Full-chip integration & configs |
