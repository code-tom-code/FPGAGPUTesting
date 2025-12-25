// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Sun Dec 21 18:04:24 2025
// Host        : TomTop3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/Tom/Documents/repos/FPGAGPUTesting/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_VertexStreamCache_0_0/MainDesign_VertexStreamCache_0_0_stub.v
// Design      : MainDesign_VertexStreamCache_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "MainDesign_VertexStreamCache_0_0,VertexStreamCache,{}" *) (* core_generation_info = "MainDesign_VertexStreamCache_0_0,VertexStreamCache,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=VertexStreamCache,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL}" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* ip_definition_source = "module_ref" *) (* x_core_info = "VertexStreamCache,Vivado 2025.2" *) 
module MainDesign_VertexStreamCache_0_0(clk, VSC_ReadEnable, VSC_ReadStreamIndex, 
  VSC_ReadDWORDAddr, VSC_ReadData, VSC_ReadReady, VSC_SetStreamVBAddress, VSC_StreamIndex, 
  VSC_StreamVBAddress, VSC_InvalidateCache, VertexCache_clk, VertexCache_addra, 
  VertexCache_dina, VertexCache_douta, VertexCache_ena, VertexCache_wea, 
  VSCReadRequestsFIFO_full, VSCReadRequestsFIFO_wr_data, VSCReadRequestsFIFO_wr_en, 
  VSCReadResponsesFIFO_rd_data, VSCReadResponsesFIFO_empty, 
  VSCReadResponsesFIFO_almost_empty, VSCReadResponsesFIFO_rd_en, DBG_State, 
  DBG_CacheSetIndex, DBG_CacheElementIndex)
/* synthesis syn_black_box black_box_pad_pin="VSC_ReadEnable,VSC_ReadStreamIndex[2:0],VSC_ReadDWORDAddr[21:0],VSC_ReadData[31:0],VSC_ReadReady,VSC_SetStreamVBAddress,VSC_StreamIndex[2:0],VSC_StreamVBAddress[29:0],VSC_InvalidateCache,VertexCache_addra[9:0],VertexCache_dina[31:0],VertexCache_douta[31:0],VertexCache_ena,VertexCache_wea[0:0],VSCReadRequestsFIFO_full,VSCReadRequestsFIFO_wr_data[29:0],VSCReadRequestsFIFO_wr_en,VSCReadResponsesFIFO_rd_data[255:0],VSCReadResponsesFIFO_empty,VSCReadResponsesFIFO_almost_empty,VSCReadResponsesFIFO_rd_en,DBG_State[3:0],DBG_CacheSetIndex[4:0],DBG_CacheElementIndex[1:0]" */
/* synthesis syn_force_seq_prim="clk" */
/* synthesis syn_force_seq_prim="VertexCache_clk" */;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk CLK" *) (* x_interface_mode = "slave clk" *) (* x_interface_parameter = "XIL_INTERFACENAME clk, FREQ_HZ 333250000, ASSOCIATED_BUSIF VBCache:VBCacheReadRequests:VBCacheReadResponses, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0" *) input clk /* synthesis syn_isclock = 1 */;
  input VSC_ReadEnable;
  input [2:0]VSC_ReadStreamIndex;
  input [21:0]VSC_ReadDWORDAddr;
  output [31:0]VSC_ReadData;
  output VSC_ReadReady;
  input VSC_SetStreamVBAddress;
  input [2:0]VSC_StreamIndex;
  input [29:0]VSC_StreamVBAddress;
  input VSC_InvalidateCache;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 VBCache CLK" *) (* x_interface_mode = "master VBCache" *) (* x_interface_parameter = "XIL_INTERFACENAME VBCache, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) output VertexCache_clk /* synthesis syn_isclock = 1 */;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 VBCache ADDR" *) output [9:0]VertexCache_addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 VBCache DIN" *) output [31:0]VertexCache_dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 VBCache DOUT" *) input [31:0]VertexCache_douta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 VBCache EN" *) output VertexCache_ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 VBCache WE" *) output [0:0]VertexCache_wea;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 VBCacheReadRequests FULL" *) (* x_interface_mode = "master VBCacheReadRequests" *) input VSCReadRequestsFIFO_full;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 VBCacheReadRequests WR_DATA" *) output [29:0]VSCReadRequestsFIFO_wr_data;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 VBCacheReadRequests WR_EN" *) output VSCReadRequestsFIFO_wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 VBCacheReadResponses RD_DATA" *) (* x_interface_mode = "master VBCacheReadResponses" *) input [255:0]VSCReadResponsesFIFO_rd_data;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 VBCacheReadResponses EMPTY" *) input VSCReadResponsesFIFO_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 VBCacheReadResponses ALMOST_EMPTY" *) input VSCReadResponsesFIFO_almost_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 VBCacheReadResponses RD_EN" *) output VSCReadResponsesFIFO_rd_en;
  output [3:0]DBG_State;
  output [4:0]DBG_CacheSetIndex;
  output [1:0]DBG_CacheElementIndex;
endmodule
