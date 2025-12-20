// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Mon Dec  8 18:21:01 2025
// Host        : Dragon3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_StatsDataSampler_0_0/MainDesign_StatsDataSampler_0_0_stub.v
// Design      : MainDesign_StatsDataSampler_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "MainDesign_StatsDataSampler_0_0,StatsDataSampler,{}" *) (* core_generation_info = "MainDesign_StatsDataSampler_0_0,StatsDataSampler,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=StatsDataSampler,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL,DataBitWidth=32,BRAMAddrBitWidth=10}" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* ip_definition_source = "module_ref" *) (* x_core_info = "StatsDataSampler,Vivado 2025.2" *) 
module MainDesign_StatsDataSampler_0_0(clk, SamplingCache_clk, SamplingCache_addra, 
  SamplingCache_dina, SamplingCache_wea, STAT_SamplingIntervalCycles, STAT_SampleData, 
  STAT_CurrentWriteIndex, STAT_Reset)
/* synthesis syn_black_box black_box_pad_pin="SamplingCache_addra[9:0],SamplingCache_dina[31:0],SamplingCache_wea[0:0],STAT_SamplingIntervalCycles[31:0],STAT_SampleData[31:0],STAT_CurrentWriteIndex[9:0],STAT_Reset" */
/* synthesis syn_force_seq_prim="clk" */
/* synthesis syn_force_seq_prim="SamplingCache_clk" */;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk CLK" *) (* x_interface_mode = "slave clk" *) (* x_interface_parameter = "XIL_INTERFACENAME clk, FREQ_HZ 333250000, ASSOCIATED_BUSIF SamplingCache, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0" *) input clk /* synthesis syn_isclock = 1 */;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SamplingCache CLK" *) (* x_interface_mode = "master SamplingCache" *) (* x_interface_parameter = "XIL_INTERFACENAME SamplingCache, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) output SamplingCache_clk /* synthesis syn_isclock = 1 */;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SamplingCache ADDR" *) output [9:0]SamplingCache_addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SamplingCache DIN" *) output [31:0]SamplingCache_dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SamplingCache WE" *) output [0:0]SamplingCache_wea;
  input [31:0]STAT_SamplingIntervalCycles;
  input [31:0]STAT_SampleData;
  output [9:0]STAT_CurrentWriteIndex;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 STAT_Reset RST" *) (* x_interface_mode = "slave STAT_Reset" *) (* x_interface_parameter = "XIL_INTERFACENAME STAT_Reset, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input STAT_Reset;
endmodule
