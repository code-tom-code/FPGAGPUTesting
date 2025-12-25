// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Sun Dec 21 18:03:51 2025
// Host        : TomTop3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/Tom/Documents/repos/FPGAGPUTesting/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_IndexBufferCache_0_0/MainDesign_IndexBufferCache_0_0_stub.v
// Design      : MainDesign_IndexBufferCache_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "MainDesign_IndexBufferCache_0_0,IndexBufferCache,{}" *) (* core_generation_info = "MainDesign_IndexBufferCache_0_0,IndexBufferCache,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=IndexBufferCache,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL}" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* ip_definition_source = "module_ref" *) (* x_core_info = "IndexBufferCache,Vivado 2025.2" *) 
module MainDesign_IndexBufferCache_0_0(clk, VBB_ReadEnable, VBB_ReadAddr, 
  VBB_ReadData, VBB_ReadReady, VBB_InvalidateIndexCache, IBCReadRequestsFIFO_full, 
  IBCReadRequestsFIFO_wr_data, IBCReadRequestsFIFO_wr_en, IBCReadResponsesFIFO_rd_data, 
  IBCReadResponsesFIFO_empty, IBCReadResponsesFIFO_almost_empty, 
  IBCReadResponsesFIFO_rd_en, DBG_State, DBG_IBCReadRequestsFIFO_full, 
  DBG_IBCReadResponsesFIFO_empty)
/* synthesis syn_black_box black_box_pad_pin="VBB_ReadEnable,VBB_ReadAddr[29:0],VBB_ReadData[31:0],VBB_ReadReady,VBB_InvalidateIndexCache,IBCReadRequestsFIFO_full,IBCReadRequestsFIFO_wr_data[29:0],IBCReadRequestsFIFO_wr_en,IBCReadResponsesFIFO_rd_data[255:0],IBCReadResponsesFIFO_empty,IBCReadResponsesFIFO_almost_empty,IBCReadResponsesFIFO_rd_en,DBG_State[1:0],DBG_IBCReadRequestsFIFO_full,DBG_IBCReadResponsesFIFO_empty" */
/* synthesis syn_force_seq_prim="clk" */;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk CLK" *) (* x_interface_mode = "slave clk" *) (* x_interface_parameter = "XIL_INTERFACENAME clk, FREQ_HZ 333250000, ASSOCIATED_BUSIF IBCacheReadRequests:IBCacheReadResponses, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0" *) input clk /* synthesis syn_isclock = 1 */;
  input VBB_ReadEnable;
  input [29:0]VBB_ReadAddr;
  output [31:0]VBB_ReadData;
  output VBB_ReadReady;
  input VBB_InvalidateIndexCache;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 IBCacheReadRequests FULL" *) (* x_interface_mode = "master IBCacheReadRequests" *) input IBCReadRequestsFIFO_full;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 IBCacheReadRequests WR_DATA" *) output [29:0]IBCReadRequestsFIFO_wr_data;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 IBCacheReadRequests WR_EN" *) output IBCReadRequestsFIFO_wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 IBCacheReadResponses RD_DATA" *) (* x_interface_mode = "master IBCacheReadResponses" *) input [255:0]IBCReadResponsesFIFO_rd_data;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 IBCacheReadResponses EMPTY" *) input IBCReadResponsesFIFO_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 IBCacheReadResponses ALMOST_EMPTY" *) input IBCReadResponsesFIFO_almost_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 IBCacheReadResponses RD_EN" *) output IBCReadResponsesFIFO_rd_en;
  output [1:0]DBG_State;
  output DBG_IBCReadRequestsFIFO_full;
  output DBG_IBCReadResponsesFIFO_empty;
endmodule
