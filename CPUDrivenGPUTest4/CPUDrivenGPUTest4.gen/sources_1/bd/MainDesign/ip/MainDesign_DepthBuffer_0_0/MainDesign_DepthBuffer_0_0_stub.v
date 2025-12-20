// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Mon Dec  8 18:20:25 2025
// Host        : Dragon3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_DepthBuffer_0_0/MainDesign_DepthBuffer_0_0_stub.v
// Design      : MainDesign_DepthBuffer_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "MainDesign_DepthBuffer_0_0,DepthBuffer,{}" *) (* core_generation_info = "MainDesign_DepthBuffer_0_0,DepthBuffer,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=DepthBuffer,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL,NUM_PIPELINE_STAGES=4}" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* ip_definition_source = "module_ref" *) (* x_core_info = "DepthBuffer,Vivado 2025.2" *) 
module MainDesign_DepthBuffer_0_0(clk, RAST_PixelReady, RAST_PosX, RAST_PosY, 
  RAST_InPixelDepth, RAST_SetDepthParams, RAST_DepthWriteEnable, RAST_DepthFunction, 
  RAST_DepthIsIdle, RAST_StencilWriteEnable, RAST_StencilRefVal, RAST_StencilReadMask, 
  RAST_StencilWriteMask, RAST_StencilCmpFunc, RAST_StencilFailOp, RAST_StencilZFailOp, 
  RAST_StencilPassOp, RAST_PixelPassedDepthStencilTest, RAST_PixelFailedDepthTest, 
  RAST_PixelFailedStencilTest, URAM_addra, URAM_clka, URAM_dina, URAM_ena, URAM_wea, 
  URAM_addrb, URAM_clkb, URAM_doutb, URAM_enb, CMD_ClearDepthBuffer, CMD_ClearStencilBuffer, 
  CMD_ClearDepthValue, CMD_ClearStencilValue, CMD_DepthIsIdle, 
  STAT_PixelsPassedDepthStencilTest, STAT_PixelsFailedDepthTest, 
  STAT_PixelsFailedStencilTest)
/* synthesis syn_black_box black_box_pad_pin="RAST_PixelReady,RAST_PosX[9:0],RAST_PosY[9:0],RAST_InPixelDepth[23:0],RAST_SetDepthParams,RAST_DepthWriteEnable,RAST_DepthFunction[2:0],RAST_DepthIsIdle,RAST_StencilWriteEnable,RAST_StencilRefVal[7:0],RAST_StencilReadMask[7:0],RAST_StencilWriteMask[7:0],RAST_StencilCmpFunc[2:0],RAST_StencilFailOp[2:0],RAST_StencilZFailOp[2:0],RAST_StencilPassOp[2:0],RAST_PixelPassedDepthStencilTest,RAST_PixelFailedDepthTest,RAST_PixelFailedStencilTest,URAM_addra[17:0],URAM_dina[63:0],URAM_ena,URAM_wea[7:0],URAM_addrb[17:0],URAM_doutb[63:0],URAM_enb,CMD_ClearDepthBuffer,CMD_ClearStencilBuffer,CMD_ClearDepthValue[23:0],CMD_ClearStencilValue[7:0],CMD_DepthIsIdle,STAT_PixelsPassedDepthStencilTest[31:0],STAT_PixelsFailedDepthTest[31:0],STAT_PixelsFailedStencilTest[31:0]" */
/* synthesis syn_force_seq_prim="clk" */
/* synthesis syn_force_seq_prim="URAM_clka" */
/* synthesis syn_force_seq_prim="URAM_clkb" */;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk CLK" *) (* x_interface_mode = "slave clk" *) (* x_interface_parameter = "XIL_INTERFACENAME clk, FREQ_HZ 333250000, ASSOCIATED_BUSIF DBufferRAMW:DBufferRAMR, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0" *) input clk /* synthesis syn_isclock = 1 */;
  input RAST_PixelReady;
  input [9:0]RAST_PosX;
  input [9:0]RAST_PosY;
  input [23:0]RAST_InPixelDepth;
  input RAST_SetDepthParams;
  input RAST_DepthWriteEnable;
  input [2:0]RAST_DepthFunction;
  output RAST_DepthIsIdle;
  input RAST_StencilWriteEnable;
  input [7:0]RAST_StencilRefVal;
  input [7:0]RAST_StencilReadMask;
  input [7:0]RAST_StencilWriteMask;
  input [2:0]RAST_StencilCmpFunc;
  input [2:0]RAST_StencilFailOp;
  input [2:0]RAST_StencilZFailOp;
  input [2:0]RAST_StencilPassOp;
  output RAST_PixelPassedDepthStencilTest;
  output RAST_PixelFailedDepthTest;
  output RAST_PixelFailedStencilTest;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMW ADDR" *) (* x_interface_mode = "master DBufferRAMW" *) (* x_interface_parameter = "XIL_INTERFACENAME DBufferRAMW, FREQ_HZ 333250000, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) output [17:0]URAM_addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMW CLK" *) output URAM_clka /* synthesis syn_isclock = 1 */;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMW DIN" *) output [63:0]URAM_dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMW EN" *) output URAM_ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMW WE" *) output [7:0]URAM_wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMR ADDR" *) (* x_interface_mode = "master DBufferRAMR" *) (* x_interface_parameter = "XIL_INTERFACENAME DBufferRAMR, FREQ_HZ 333250000, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) output [17:0]URAM_addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMR CLK" *) output URAM_clkb /* synthesis syn_isclock = 1 */;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMR DOUT" *) (* x_interface_mode = "master" *) input [63:0]URAM_doutb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMR EN" *) output URAM_enb;
  input CMD_ClearDepthBuffer;
  input CMD_ClearStencilBuffer;
  input [23:0]CMD_ClearDepthValue;
  input [7:0]CMD_ClearStencilValue;
  output CMD_DepthIsIdle;
  output [31:0]STAT_PixelsPassedDepthStencilTest;
  output [31:0]STAT_PixelsFailedDepthTest;
  output [31:0]STAT_PixelsFailedStencilTest;
endmodule
