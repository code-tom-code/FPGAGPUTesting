// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Tue Dec 16 23:51:21 2025
// Host        : Dragon3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_Rasterizer_0_0/MainDesign_Rasterizer_0_0_sim_netlist.v
// Design      : MainDesign_Rasterizer_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "MainDesign_Rasterizer_0_0,Rasterizer,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "module_ref" *) 
(* x_core_info = "Rasterizer,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module MainDesign_Rasterizer_0_0
   (clk,
    TRISETUP_newTriBegin,
    TRISETUP_readyForNewTri,
    TRISETUP_CurrentDrawEventID,
    TRISETUP_inMinX,
    TRISETUP_inMaxX,
    TRISETUP_inMinY,
    TRISETUP_inMaxY,
    TRISETUP_inInitialBarycentricRowResetA,
    TRISETUP_inInitialBarycentricRowResetB,
    TRISETUP_inInitialBarycentricRowResetC,
    TRISETUP_inIsTopLeftEdgeA,
    TRISETUP_inIsTopLeftEdgeB,
    TRISETUP_inIsTopLeftEdgeC,
    TRISETUP_inBarycentricXDeltaA,
    TRISETUP_inBarycentricXDeltaB,
    TRISETUP_inBarycentricXDeltaC,
    TRISETUP_inBarycentricYDeltaA,
    TRISETUP_inBarycentricYDeltaB,
    TRISETUP_inBarycentricYDeltaC,
    TRISETUP_inBarycentricInverse,
    TRISETUP_inZ0,
    TRISETUP_inZ10,
    TRISETUP_inZ20,
    TRISETUP_inInvW0,
    TRISETUP_inInvW10,
    TRISETUP_inInvW20,
    TRISETUP_inTX0,
    TRISETUP_inTY0,
    TRISETUP_inTX10,
    TRISETUP_inTY10,
    TRISETUP_inTX20,
    TRISETUP_inTY20,
    TRISETUP_inVertColor0,
    TRISETUP_inVertColor10,
    TRISETUP_inVertColor20,
    RASTOUT_FIFO_full,
    RASTOUT_FIFO_almost_full,
    RASTOUT_FIFO_wr_data,
    RASTOUT_FIFO_wr_en,
    TRICACHE_BarycentricInverse,
    TRICACHE_Z0,
    TRICACHE_Z10,
    TRICACHE_Z20,
    TRICACHE_InvW0,
    TRICACHE_InvW10,
    TRICACHE_InvW20,
    TRICACHE_TX0,
    TRICACHE_TX10,
    TRICACHE_TX20,
    TRICACHE_TY0,
    TRICACHE_TY10,
    TRICACHE_TY20,
    TRICACHE_VertColor0,
    TRICACHE_VertColor10,
    TRICACHE_VertColor20,
    TRICACHE_PushNewTriData,
    TRICACHE_IsFull,
    CMD_Rasterizer_Idle,
    STAT_CyclesIdle,
    STAT_CyclesSpentWorking,
    STAT_CyclesWaitingForOutput,
    STAT_CyclesWaitingForTriWorkCache,
    STAT_CurrentDrawEventID,
    DBG_Rasterizer_State,
    DBG_PixelXPos,
    DBG_PixelYPos,
    DBG_BarycentricA,
    DBG_BarycentricB,
    DBG_BarycentricC,
    DBG_MinX,
    DBG_MaxX,
    DBG_MinY,
    DBG_MaxY,
    DBG_Message,
    DBG_MessageData,
    DBG_NewMessage);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk CLK" *) (* x_interface_mode = "slave clk" *) (* x_interface_parameter = "XIL_INTERFACENAME clk, FREQ_HZ 333250000, ASSOCIATED_BUSIF RASTOUT_FIFO, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0" *) input clk;
  input TRISETUP_newTriBegin;
  output TRISETUP_readyForNewTri;
  input [15:0]TRISETUP_CurrentDrawEventID;
  input [15:0]TRISETUP_inMinX;
  input [15:0]TRISETUP_inMaxX;
  input [15:0]TRISETUP_inMinY;
  input [15:0]TRISETUP_inMaxY;
  input [31:0]TRISETUP_inInitialBarycentricRowResetA;
  input [31:0]TRISETUP_inInitialBarycentricRowResetB;
  input [31:0]TRISETUP_inInitialBarycentricRowResetC;
  input TRISETUP_inIsTopLeftEdgeA;
  input TRISETUP_inIsTopLeftEdgeB;
  input TRISETUP_inIsTopLeftEdgeC;
  input [15:0]TRISETUP_inBarycentricXDeltaA;
  input [15:0]TRISETUP_inBarycentricXDeltaB;
  input [15:0]TRISETUP_inBarycentricXDeltaC;
  input [15:0]TRISETUP_inBarycentricYDeltaA;
  input [15:0]TRISETUP_inBarycentricYDeltaB;
  input [15:0]TRISETUP_inBarycentricYDeltaC;
  input [31:0]TRISETUP_inBarycentricInverse;
  input [31:0]TRISETUP_inZ0;
  input [31:0]TRISETUP_inZ10;
  input [31:0]TRISETUP_inZ20;
  input [31:0]TRISETUP_inInvW0;
  input [31:0]TRISETUP_inInvW10;
  input [31:0]TRISETUP_inInvW20;
  input [31:0]TRISETUP_inTX0;
  input [31:0]TRISETUP_inTY0;
  input [31:0]TRISETUP_inTX10;
  input [31:0]TRISETUP_inTY10;
  input [31:0]TRISETUP_inTX20;
  input [31:0]TRISETUP_inTY20;
  input [127:0]TRISETUP_inVertColor0;
  input [127:0]TRISETUP_inVertColor10;
  input [127:0]TRISETUP_inVertColor20;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO FULL" *) (* x_interface_mode = "master RASTOUT_FIFO" *) input RASTOUT_FIFO_full;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO ALMOST_FULL" *) input RASTOUT_FIFO_almost_full;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) output [95:0]RASTOUT_FIFO_wr_data;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_EN" *) output RASTOUT_FIFO_wr_en;
  output [31:0]TRICACHE_BarycentricInverse;
  output [31:0]TRICACHE_Z0;
  output [31:0]TRICACHE_Z10;
  output [31:0]TRICACHE_Z20;
  output [31:0]TRICACHE_InvW0;
  output [31:0]TRICACHE_InvW10;
  output [31:0]TRICACHE_InvW20;
  output [31:0]TRICACHE_TX0;
  output [31:0]TRICACHE_TX10;
  output [31:0]TRICACHE_TX20;
  output [31:0]TRICACHE_TY0;
  output [31:0]TRICACHE_TY10;
  output [31:0]TRICACHE_TY20;
  output [127:0]TRICACHE_VertColor0;
  output [127:0]TRICACHE_VertColor10;
  output [127:0]TRICACHE_VertColor20;
  output TRICACHE_PushNewTriData;
  input TRICACHE_IsFull;
  output CMD_Rasterizer_Idle;
  output [31:0]STAT_CyclesIdle;
  output [31:0]STAT_CyclesSpentWorking;
  output [31:0]STAT_CyclesWaitingForOutput;
  output [31:0]STAT_CyclesWaitingForTriWorkCache;
  output [15:0]STAT_CurrentDrawEventID;
  output [3:0]DBG_Rasterizer_State;
  output [15:0]DBG_PixelXPos;
  output [15:0]DBG_PixelYPos;
  output [31:0]DBG_BarycentricA;
  output [31:0]DBG_BarycentricB;
  output [31:0]DBG_BarycentricC;
  output [15:0]DBG_MinX;
  output [15:0]DBG_MaxX;
  output [15:0]DBG_MinY;
  output [15:0]DBG_MaxY;
  output [15:0]DBG_Message;
  output [15:0]DBG_MessageData;
  output DBG_NewMessage;

  wire \<const0> ;
  wire CMD_Rasterizer_Idle;
  wire [31:0]DBG_BarycentricA;
  wire [31:0]DBG_BarycentricB;
  wire [31:0]DBG_BarycentricC;
  wire [15:0]DBG_MaxX;
  wire [15:0]DBG_MaxY;
  wire [15:0]DBG_Message;
  wire [15:0]DBG_MessageData;
  wire [15:0]DBG_MinX;
  wire [15:0]DBG_MinY;
  wire DBG_NewMessage;
  wire [15:0]DBG_PixelXPos;
  wire [15:0]DBG_PixelYPos;
  wire [2:0]\^DBG_Rasterizer_State ;
  wire RASTOUT_FIFO_almost_full;
  wire RASTOUT_FIFO_full;
  wire [63:0]\^RASTOUT_FIFO_wr_data ;
  wire [15:0]STAT_CurrentDrawEventID;
  wire [31:0]STAT_CyclesIdle;
  wire [31:0]STAT_CyclesSpentWorking;
  wire [31:0]STAT_CyclesWaitingForOutput;
  wire [31:0]STAT_CyclesWaitingForTriWorkCache;
  wire [31:0]TRICACHE_BarycentricInverse;
  wire [31:0]TRICACHE_InvW0;
  wire [31:0]TRICACHE_InvW10;
  wire [31:0]TRICACHE_InvW20;
  wire TRICACHE_IsFull;
  wire TRICACHE_PushNewTriData;
  wire [31:0]TRICACHE_TX0;
  wire [31:0]TRICACHE_TX10;
  wire [31:0]TRICACHE_TX20;
  wire [31:0]TRICACHE_TY0;
  wire [31:0]TRICACHE_TY10;
  wire [31:0]TRICACHE_TY20;
  wire [127:0]TRICACHE_VertColor0;
  wire [127:0]TRICACHE_VertColor10;
  wire [127:0]TRICACHE_VertColor20;
  wire [31:0]TRICACHE_Z0;
  wire [31:0]TRICACHE_Z10;
  wire [31:0]TRICACHE_Z20;
  wire [15:0]TRISETUP_CurrentDrawEventID;
  wire [31:0]TRISETUP_inBarycentricInverse;
  wire [15:0]TRISETUP_inBarycentricXDeltaA;
  wire [15:0]TRISETUP_inBarycentricXDeltaB;
  wire [15:0]TRISETUP_inBarycentricXDeltaC;
  wire [15:0]TRISETUP_inBarycentricYDeltaA;
  wire [15:0]TRISETUP_inBarycentricYDeltaB;
  wire [15:0]TRISETUP_inBarycentricYDeltaC;
  wire [31:0]TRISETUP_inInitialBarycentricRowResetA;
  wire [31:0]TRISETUP_inInitialBarycentricRowResetB;
  wire [31:0]TRISETUP_inInitialBarycentricRowResetC;
  wire [31:0]TRISETUP_inInvW0;
  wire [31:0]TRISETUP_inInvW10;
  wire [31:0]TRISETUP_inInvW20;
  wire TRISETUP_inIsTopLeftEdgeB;
  wire TRISETUP_inIsTopLeftEdgeC;
  wire [15:0]TRISETUP_inMaxX;
  wire [15:0]TRISETUP_inMaxY;
  wire [15:0]TRISETUP_inMinX;
  wire [15:0]TRISETUP_inMinY;
  wire [31:0]TRISETUP_inTX0;
  wire [31:0]TRISETUP_inTX10;
  wire [31:0]TRISETUP_inTX20;
  wire [31:0]TRISETUP_inTY0;
  wire [31:0]TRISETUP_inTY10;
  wire [31:0]TRISETUP_inTY20;
  wire [127:0]TRISETUP_inVertColor0;
  wire [127:0]TRISETUP_inVertColor10;
  wire [127:0]TRISETUP_inVertColor20;
  wire [31:0]TRISETUP_inZ0;
  wire [31:0]TRISETUP_inZ10;
  wire [31:0]TRISETUP_inZ20;
  wire TRISETUP_newTriBegin;
  wire TRISETUP_readyForNewTri;
  wire clk;

  assign DBG_Rasterizer_State[3] = \<const0> ;
  assign DBG_Rasterizer_State[2:0] = \^DBG_Rasterizer_State [2:0];
  assign RASTOUT_FIFO_wr_data[95:80] = DBG_MessageData;
  assign RASTOUT_FIFO_wr_data[79:64] = DBG_Message;
  assign RASTOUT_FIFO_wr_data[63:0] = \^RASTOUT_FIFO_wr_data [63:0];
  assign RASTOUT_FIFO_wr_en = DBG_NewMessage;
  GND GND
       (.G(\<const0> ));
  MainDesign_Rasterizer_0_0_Rasterizer U0
       (.CMD_Rasterizer_Idle(CMD_Rasterizer_Idle),
        .DBG_BarycentricA(DBG_BarycentricA),
        .DBG_BarycentricB(DBG_BarycentricB),
        .DBG_BarycentricC(DBG_BarycentricC),
        .DBG_MaxX(DBG_MaxX),
        .DBG_MaxY(DBG_MaxY),
        .DBG_MinX(DBG_MinX),
        .DBG_MinY(DBG_MinY),
        .DBG_NewMessage(DBG_NewMessage),
        .Q(DBG_PixelYPos),
        .RASTOUT_FIFO_almost_full(RASTOUT_FIFO_almost_full),
        .RASTOUT_FIFO_full(RASTOUT_FIFO_full),
        .RASTOUT_FIFO_wr_data({DBG_MessageData,DBG_Message,\^RASTOUT_FIFO_wr_data }),
        .STAT_CurrentDrawEventID(STAT_CurrentDrawEventID),
        .STAT_CyclesIdle(STAT_CyclesIdle),
        .STAT_CyclesSpentWorking(STAT_CyclesSpentWorking),
        .STAT_CyclesWaitingForOutput(STAT_CyclesWaitingForOutput),
        .STAT_CyclesWaitingForTriWorkCache(STAT_CyclesWaitingForTriWorkCache),
        .TRICACHE_BarycentricInverse(TRICACHE_BarycentricInverse),
        .TRICACHE_InvW0(TRICACHE_InvW0),
        .TRICACHE_InvW10(TRICACHE_InvW10),
        .TRICACHE_InvW20(TRICACHE_InvW20),
        .TRICACHE_IsFull(TRICACHE_IsFull),
        .TRICACHE_PushNewTriData(TRICACHE_PushNewTriData),
        .TRICACHE_TX0(TRICACHE_TX0),
        .TRICACHE_TX10(TRICACHE_TX10),
        .TRICACHE_TX20(TRICACHE_TX20),
        .TRICACHE_TY0(TRICACHE_TY0),
        .TRICACHE_TY10(TRICACHE_TY10),
        .TRICACHE_TY20(TRICACHE_TY20),
        .TRICACHE_VertColor0(TRICACHE_VertColor0),
        .TRICACHE_VertColor10(TRICACHE_VertColor10),
        .TRICACHE_VertColor20(TRICACHE_VertColor20),
        .TRICACHE_Z0(TRICACHE_Z0),
        .TRICACHE_Z10(TRICACHE_Z10),
        .TRICACHE_Z20(TRICACHE_Z20),
        .TRISETUP_CurrentDrawEventID(TRISETUP_CurrentDrawEventID),
        .TRISETUP_inBarycentricInverse(TRISETUP_inBarycentricInverse),
        .TRISETUP_inBarycentricXDeltaA(TRISETUP_inBarycentricXDeltaA),
        .TRISETUP_inBarycentricXDeltaB(TRISETUP_inBarycentricXDeltaB),
        .TRISETUP_inBarycentricXDeltaC(TRISETUP_inBarycentricXDeltaC),
        .TRISETUP_inBarycentricYDeltaA(TRISETUP_inBarycentricYDeltaA),
        .TRISETUP_inBarycentricYDeltaB(TRISETUP_inBarycentricYDeltaB),
        .TRISETUP_inBarycentricYDeltaC(TRISETUP_inBarycentricYDeltaC),
        .TRISETUP_inInitialBarycentricRowResetA(TRISETUP_inInitialBarycentricRowResetA),
        .TRISETUP_inInitialBarycentricRowResetB(TRISETUP_inInitialBarycentricRowResetB),
        .TRISETUP_inInitialBarycentricRowResetC(TRISETUP_inInitialBarycentricRowResetC),
        .TRISETUP_inInvW0(TRISETUP_inInvW0),
        .TRISETUP_inInvW10(TRISETUP_inInvW10),
        .TRISETUP_inInvW20(TRISETUP_inInvW20),
        .TRISETUP_inIsTopLeftEdgeB(TRISETUP_inIsTopLeftEdgeB),
        .TRISETUP_inIsTopLeftEdgeC(TRISETUP_inIsTopLeftEdgeC),
        .TRISETUP_inMaxX(TRISETUP_inMaxX),
        .TRISETUP_inMaxY(TRISETUP_inMaxY),
        .TRISETUP_inMinX(TRISETUP_inMinX),
        .TRISETUP_inMinY(TRISETUP_inMinY),
        .TRISETUP_inTX0(TRISETUP_inTX0),
        .TRISETUP_inTX10(TRISETUP_inTX10),
        .TRISETUP_inTX20(TRISETUP_inTX20),
        .TRISETUP_inTY0(TRISETUP_inTY0),
        .TRISETUP_inTY10(TRISETUP_inTY10),
        .TRISETUP_inTY20(TRISETUP_inTY20),
        .TRISETUP_inVertColor0(TRISETUP_inVertColor0),
        .TRISETUP_inVertColor10(TRISETUP_inVertColor10),
        .TRISETUP_inVertColor20(TRISETUP_inVertColor20),
        .TRISETUP_inZ0(TRISETUP_inZ0),
        .TRISETUP_inZ10(TRISETUP_inZ10),
        .TRISETUP_inZ20(TRISETUP_inZ20),
        .TRISETUP_newTriBegin(TRISETUP_newTriBegin),
        .TRISETUP_readyForNewTri(TRISETUP_readyForNewTri),
        .clk(clk),
        .\currentState_reg[2]__0_0 (\^DBG_Rasterizer_State ),
        .\pixelXPos_reg[15]_0 (DBG_PixelXPos));
endmodule

(* ORIG_REF_NAME = "Rasterizer" *) 
module MainDesign_Rasterizer_0_0_Rasterizer
   (DBG_BarycentricB,
    DBG_BarycentricC,
    DBG_BarycentricA,
    DBG_MaxY,
    Q,
    DBG_MaxX,
    DBG_MinX,
    \pixelXPos_reg[15]_0 ,
    TRISETUP_readyForNewTri,
    RASTOUT_FIFO_wr_data,
    TRICACHE_BarycentricInverse,
    TRICACHE_Z0,
    TRICACHE_Z10,
    TRICACHE_Z20,
    TRICACHE_InvW0,
    TRICACHE_InvW10,
    TRICACHE_InvW20,
    TRICACHE_TX0,
    TRICACHE_TX10,
    TRICACHE_TX20,
    TRICACHE_TY0,
    TRICACHE_TY10,
    TRICACHE_TY20,
    TRICACHE_VertColor0,
    TRICACHE_VertColor10,
    TRICACHE_VertColor20,
    TRICACHE_PushNewTriData,
    CMD_Rasterizer_Idle,
    STAT_CurrentDrawEventID,
    \currentState_reg[2]__0_0 ,
    DBG_MinY,
    STAT_CyclesSpentWorking,
    STAT_CyclesWaitingForTriWorkCache,
    STAT_CyclesIdle,
    STAT_CyclesWaitingForOutput,
    DBG_NewMessage,
    TRICACHE_IsFull,
    clk,
    TRISETUP_inBarycentricXDeltaB,
    TRISETUP_inBarycentricYDeltaB,
    TRISETUP_inBarycentricXDeltaC,
    TRISETUP_inBarycentricYDeltaC,
    TRISETUP_inBarycentricXDeltaA,
    TRISETUP_inBarycentricYDeltaA,
    TRISETUP_inMaxY,
    TRISETUP_inMaxX,
    TRISETUP_inMinX,
    TRISETUP_CurrentDrawEventID,
    TRISETUP_inIsTopLeftEdgeB,
    TRISETUP_inIsTopLeftEdgeC,
    RASTOUT_FIFO_almost_full,
    RASTOUT_FIFO_full,
    TRISETUP_inBarycentricInverse,
    TRISETUP_inZ0,
    TRISETUP_inZ10,
    TRISETUP_inZ20,
    TRISETUP_inInvW0,
    TRISETUP_inInvW10,
    TRISETUP_inInvW20,
    TRISETUP_inTX0,
    TRISETUP_inTX10,
    TRISETUP_inTX20,
    TRISETUP_inTY0,
    TRISETUP_inTY10,
    TRISETUP_inTY20,
    TRISETUP_inVertColor0,
    TRISETUP_inVertColor10,
    TRISETUP_inVertColor20,
    TRISETUP_inMinY,
    TRISETUP_newTriBegin,
    TRISETUP_inInitialBarycentricRowResetB,
    TRISETUP_inInitialBarycentricRowResetC,
    TRISETUP_inInitialBarycentricRowResetA);
  output [31:0]DBG_BarycentricB;
  output [31:0]DBG_BarycentricC;
  output [31:0]DBG_BarycentricA;
  output [15:0]DBG_MaxY;
  output [15:0]Q;
  output [15:0]DBG_MaxX;
  output [15:0]DBG_MinX;
  output [15:0]\pixelXPos_reg[15]_0 ;
  output TRISETUP_readyForNewTri;
  output [95:0]RASTOUT_FIFO_wr_data;
  output [31:0]TRICACHE_BarycentricInverse;
  output [31:0]TRICACHE_Z0;
  output [31:0]TRICACHE_Z10;
  output [31:0]TRICACHE_Z20;
  output [31:0]TRICACHE_InvW0;
  output [31:0]TRICACHE_InvW10;
  output [31:0]TRICACHE_InvW20;
  output [31:0]TRICACHE_TX0;
  output [31:0]TRICACHE_TX10;
  output [31:0]TRICACHE_TX20;
  output [31:0]TRICACHE_TY0;
  output [31:0]TRICACHE_TY10;
  output [31:0]TRICACHE_TY20;
  output [127:0]TRICACHE_VertColor0;
  output [127:0]TRICACHE_VertColor10;
  output [127:0]TRICACHE_VertColor20;
  output TRICACHE_PushNewTriData;
  output CMD_Rasterizer_Idle;
  output [15:0]STAT_CurrentDrawEventID;
  output [2:0]\currentState_reg[2]__0_0 ;
  output [15:0]DBG_MinY;
  output [31:0]STAT_CyclesSpentWorking;
  output [31:0]STAT_CyclesWaitingForTriWorkCache;
  output [31:0]STAT_CyclesIdle;
  output [31:0]STAT_CyclesWaitingForOutput;
  output DBG_NewMessage;
  input TRICACHE_IsFull;
  input clk;
  input [15:0]TRISETUP_inBarycentricXDeltaB;
  input [15:0]TRISETUP_inBarycentricYDeltaB;
  input [15:0]TRISETUP_inBarycentricXDeltaC;
  input [15:0]TRISETUP_inBarycentricYDeltaC;
  input [15:0]TRISETUP_inBarycentricXDeltaA;
  input [15:0]TRISETUP_inBarycentricYDeltaA;
  input [15:0]TRISETUP_inMaxY;
  input [15:0]TRISETUP_inMaxX;
  input [15:0]TRISETUP_inMinX;
  input [15:0]TRISETUP_CurrentDrawEventID;
  input TRISETUP_inIsTopLeftEdgeB;
  input TRISETUP_inIsTopLeftEdgeC;
  input RASTOUT_FIFO_almost_full;
  input RASTOUT_FIFO_full;
  input [31:0]TRISETUP_inBarycentricInverse;
  input [31:0]TRISETUP_inZ0;
  input [31:0]TRISETUP_inZ10;
  input [31:0]TRISETUP_inZ20;
  input [31:0]TRISETUP_inInvW0;
  input [31:0]TRISETUP_inInvW10;
  input [31:0]TRISETUP_inInvW20;
  input [31:0]TRISETUP_inTX0;
  input [31:0]TRISETUP_inTX10;
  input [31:0]TRISETUP_inTX20;
  input [31:0]TRISETUP_inTY0;
  input [31:0]TRISETUP_inTY10;
  input [31:0]TRISETUP_inTY20;
  input [127:0]TRISETUP_inVertColor0;
  input [127:0]TRISETUP_inVertColor10;
  input [127:0]TRISETUP_inVertColor20;
  input [15:0]TRISETUP_inMinY;
  input TRISETUP_newTriBegin;
  input [31:0]TRISETUP_inInitialBarycentricRowResetB;
  input [31:0]TRISETUP_inInitialBarycentricRowResetC;
  input [31:0]TRISETUP_inInitialBarycentricRowResetA;

  wire CMD_Rasterizer_Idle;
  wire CMD_Rasterizer_Idle0;
  wire [31:0]DBG_BarycentricA;
  wire [31:0]DBG_BarycentricB;
  wire [31:0]DBG_BarycentricC;
  wire [15:0]DBG_MaxX;
  wire [15:0]DBG_MaxY;
  wire [15:0]DBG_MinX;
  wire [15:0]DBG_MinY;
  wire DBG_NewMessage;
  wire [15:0]Q;
  wire RASTOUT_FIFO_almost_full;
  wire RASTOUT_FIFO_full;
  wire [95:0]RASTOUT_FIFO_wr_data;
  wire [15:0]STAT_CurrentDrawEventID;
  wire [31:0]STAT_CyclesIdle;
  wire [31:0]STAT_CyclesSpentWorking;
  wire [31:0]STAT_CyclesWaitingForOutput;
  wire [31:0]STAT_CyclesWaitingForTriWorkCache;
  wire [31:0]TRICACHE_BarycentricInverse;
  wire [31:0]TRICACHE_InvW0;
  wire [31:0]TRICACHE_InvW10;
  wire [31:0]TRICACHE_InvW20;
  wire TRICACHE_IsFull;
  wire TRICACHE_PushNewTriData;
  wire TRICACHE_PushNewTriData_i_1_n_0;
  wire [31:0]TRICACHE_TX0;
  wire [31:0]TRICACHE_TX10;
  wire [31:0]TRICACHE_TX20;
  wire [31:0]TRICACHE_TY0;
  wire [31:0]TRICACHE_TY10;
  wire [31:0]TRICACHE_TY20;
  wire [127:0]TRICACHE_VertColor0;
  wire [127:0]TRICACHE_VertColor10;
  wire [127:0]TRICACHE_VertColor20;
  wire [31:0]TRICACHE_Z0;
  wire [31:0]TRICACHE_Z10;
  wire [31:0]TRICACHE_Z20;
  wire [15:0]TRISETUP_CurrentDrawEventID;
  wire [31:0]TRISETUP_inBarycentricInverse;
  wire [15:0]TRISETUP_inBarycentricXDeltaA;
  wire [15:0]TRISETUP_inBarycentricXDeltaB;
  wire [15:0]TRISETUP_inBarycentricXDeltaC;
  wire [15:0]TRISETUP_inBarycentricYDeltaA;
  wire [15:0]TRISETUP_inBarycentricYDeltaB;
  wire [15:0]TRISETUP_inBarycentricYDeltaC;
  wire [31:0]TRISETUP_inInitialBarycentricRowResetA;
  wire [31:0]TRISETUP_inInitialBarycentricRowResetB;
  wire [31:0]TRISETUP_inInitialBarycentricRowResetC;
  wire [31:0]TRISETUP_inInvW0;
  wire [31:0]TRISETUP_inInvW10;
  wire [31:0]TRISETUP_inInvW20;
  wire TRISETUP_inIsTopLeftEdgeB;
  wire TRISETUP_inIsTopLeftEdgeC;
  wire [15:0]TRISETUP_inMaxX;
  wire [15:0]TRISETUP_inMaxY;
  wire [15:0]TRISETUP_inMinX;
  wire [15:0]TRISETUP_inMinY;
  wire [31:0]TRISETUP_inTX0;
  wire [31:0]TRISETUP_inTX10;
  wire [31:0]TRISETUP_inTX20;
  wire [31:0]TRISETUP_inTY0;
  wire [31:0]TRISETUP_inTY10;
  wire [31:0]TRISETUP_inTY20;
  wire [127:0]TRISETUP_inVertColor0;
  wire [127:0]TRISETUP_inVertColor10;
  wire [127:0]TRISETUP_inVertColor20;
  wire [31:0]TRISETUP_inZ0;
  wire [31:0]TRISETUP_inZ10;
  wire [31:0]TRISETUP_inZ20;
  wire TRISETUP_newTriBegin;
  wire TRISETUP_readyForNewTri;
  wire \_inferred__0/i__carry__0_n_0 ;
  wire \_inferred__0/i__carry__0_n_1 ;
  wire \_inferred__0/i__carry__0_n_2 ;
  wire \_inferred__0/i__carry__0_n_3 ;
  wire \_inferred__0/i__carry__0_n_4 ;
  wire \_inferred__0/i__carry__0_n_5 ;
  wire \_inferred__0/i__carry__0_n_6 ;
  wire \_inferred__0/i__carry__0_n_7 ;
  wire \_inferred__0/i__carry__1_n_0 ;
  wire \_inferred__0/i__carry__1_n_1 ;
  wire \_inferred__0/i__carry__1_n_2 ;
  wire \_inferred__0/i__carry__1_n_3 ;
  wire \_inferred__0/i__carry__1_n_4 ;
  wire \_inferred__0/i__carry__1_n_5 ;
  wire \_inferred__0/i__carry__1_n_6 ;
  wire \_inferred__0/i__carry__1_n_7 ;
  wire \_inferred__0/i__carry__2_n_1 ;
  wire \_inferred__0/i__carry__2_n_2 ;
  wire \_inferred__0/i__carry__2_n_3 ;
  wire \_inferred__0/i__carry__2_n_4 ;
  wire \_inferred__0/i__carry__2_n_5 ;
  wire \_inferred__0/i__carry__2_n_6 ;
  wire \_inferred__0/i__carry__2_n_7 ;
  wire \_inferred__0/i__carry_n_0 ;
  wire \_inferred__0/i__carry_n_1 ;
  wire \_inferred__0/i__carry_n_2 ;
  wire \_inferred__0/i__carry_n_3 ;
  wire \_inferred__0/i__carry_n_4 ;
  wire \_inferred__0/i__carry_n_5 ;
  wire \_inferred__0/i__carry_n_6 ;
  wire \_inferred__0/i__carry_n_7 ;
  wire \_inferred__1/i__carry__0_n_0 ;
  wire \_inferred__1/i__carry__0_n_1 ;
  wire \_inferred__1/i__carry__0_n_2 ;
  wire \_inferred__1/i__carry__0_n_3 ;
  wire \_inferred__1/i__carry__0_n_4 ;
  wire \_inferred__1/i__carry__0_n_5 ;
  wire \_inferred__1/i__carry__0_n_6 ;
  wire \_inferred__1/i__carry__0_n_7 ;
  wire \_inferred__1/i__carry__1_n_0 ;
  wire \_inferred__1/i__carry__1_n_1 ;
  wire \_inferred__1/i__carry__1_n_2 ;
  wire \_inferred__1/i__carry__1_n_3 ;
  wire \_inferred__1/i__carry__1_n_4 ;
  wire \_inferred__1/i__carry__1_n_5 ;
  wire \_inferred__1/i__carry__1_n_6 ;
  wire \_inferred__1/i__carry__1_n_7 ;
  wire \_inferred__1/i__carry__2_n_1 ;
  wire \_inferred__1/i__carry__2_n_2 ;
  wire \_inferred__1/i__carry__2_n_3 ;
  wire \_inferred__1/i__carry__2_n_4 ;
  wire \_inferred__1/i__carry__2_n_5 ;
  wire \_inferred__1/i__carry__2_n_6 ;
  wire \_inferred__1/i__carry__2_n_7 ;
  wire \_inferred__1/i__carry_n_0 ;
  wire \_inferred__1/i__carry_n_1 ;
  wire \_inferred__1/i__carry_n_2 ;
  wire \_inferred__1/i__carry_n_3 ;
  wire \_inferred__1/i__carry_n_4 ;
  wire \_inferred__1/i__carry_n_5 ;
  wire \_inferred__1/i__carry_n_6 ;
  wire \_inferred__1/i__carry_n_7 ;
  wire \_inferred__2/i__carry__0_n_0 ;
  wire \_inferred__2/i__carry__0_n_1 ;
  wire \_inferred__2/i__carry__0_n_2 ;
  wire \_inferred__2/i__carry__0_n_3 ;
  wire \_inferred__2/i__carry__0_n_4 ;
  wire \_inferred__2/i__carry__0_n_5 ;
  wire \_inferred__2/i__carry__0_n_6 ;
  wire \_inferred__2/i__carry__0_n_7 ;
  wire \_inferred__2/i__carry__1_n_0 ;
  wire \_inferred__2/i__carry__1_n_1 ;
  wire \_inferred__2/i__carry__1_n_2 ;
  wire \_inferred__2/i__carry__1_n_3 ;
  wire \_inferred__2/i__carry__1_n_4 ;
  wire \_inferred__2/i__carry__1_n_5 ;
  wire \_inferred__2/i__carry__1_n_6 ;
  wire \_inferred__2/i__carry__1_n_7 ;
  wire \_inferred__2/i__carry__2_n_1 ;
  wire \_inferred__2/i__carry__2_n_2 ;
  wire \_inferred__2/i__carry__2_n_3 ;
  wire \_inferred__2/i__carry__2_n_4 ;
  wire \_inferred__2/i__carry__2_n_5 ;
  wire \_inferred__2/i__carry__2_n_6 ;
  wire \_inferred__2/i__carry__2_n_7 ;
  wire \_inferred__2/i__carry_n_0 ;
  wire \_inferred__2/i__carry_n_1 ;
  wire \_inferred__2/i__carry_n_2 ;
  wire \_inferred__2/i__carry_n_3 ;
  wire \_inferred__2/i__carry_n_4 ;
  wire \_inferred__2/i__carry_n_5 ;
  wire \_inferred__2/i__carry_n_6 ;
  wire \_inferred__2/i__carry_n_7 ;
  wire [31:0]barycentricA;
  wire [31:0]barycentricB;
  wire [31:0]barycentricC;
  wire [31:0]barycentricInverse;
  wire [31:0]barycentricRowResetA;
  wire barycentricRowResetA0_carry__0_i_1_n_0;
  wire barycentricRowResetA0_carry__0_i_2_n_0;
  wire barycentricRowResetA0_carry__0_i_3_n_0;
  wire barycentricRowResetA0_carry__0_i_4_n_0;
  wire barycentricRowResetA0_carry__0_i_5_n_0;
  wire barycentricRowResetA0_carry__0_i_6_n_0;
  wire barycentricRowResetA0_carry__0_i_7_n_0;
  wire barycentricRowResetA0_carry__0_i_8_n_0;
  wire barycentricRowResetA0_carry__0_n_0;
  wire barycentricRowResetA0_carry__0_n_1;
  wire barycentricRowResetA0_carry__0_n_2;
  wire barycentricRowResetA0_carry__0_n_3;
  wire barycentricRowResetA0_carry__0_n_4;
  wire barycentricRowResetA0_carry__0_n_5;
  wire barycentricRowResetA0_carry__0_n_6;
  wire barycentricRowResetA0_carry__0_n_7;
  wire barycentricRowResetA0_carry__1_i_1_n_0;
  wire barycentricRowResetA0_carry__1_i_2_n_0;
  wire barycentricRowResetA0_carry__1_i_3_n_0;
  wire barycentricRowResetA0_carry__1_i_4_n_0;
  wire barycentricRowResetA0_carry__1_i_5_n_0;
  wire barycentricRowResetA0_carry__1_i_6_n_0;
  wire barycentricRowResetA0_carry__1_i_7_n_0;
  wire barycentricRowResetA0_carry__1_i_8_n_0;
  wire barycentricRowResetA0_carry__1_i_9_n_0;
  wire barycentricRowResetA0_carry__1_n_0;
  wire barycentricRowResetA0_carry__1_n_1;
  wire barycentricRowResetA0_carry__1_n_2;
  wire barycentricRowResetA0_carry__1_n_3;
  wire barycentricRowResetA0_carry__1_n_4;
  wire barycentricRowResetA0_carry__1_n_5;
  wire barycentricRowResetA0_carry__1_n_6;
  wire barycentricRowResetA0_carry__1_n_7;
  wire barycentricRowResetA0_carry__2_i_1_n_0;
  wire barycentricRowResetA0_carry__2_i_2_n_0;
  wire barycentricRowResetA0_carry__2_i_3_n_0;
  wire barycentricRowResetA0_carry__2_i_4_n_0;
  wire barycentricRowResetA0_carry__2_i_5_n_0;
  wire barycentricRowResetA0_carry__2_i_6_n_0;
  wire barycentricRowResetA0_carry__2_i_7_n_0;
  wire barycentricRowResetA0_carry__2_i_8_n_0;
  wire barycentricRowResetA0_carry__2_n_1;
  wire barycentricRowResetA0_carry__2_n_2;
  wire barycentricRowResetA0_carry__2_n_3;
  wire barycentricRowResetA0_carry__2_n_4;
  wire barycentricRowResetA0_carry__2_n_5;
  wire barycentricRowResetA0_carry__2_n_6;
  wire barycentricRowResetA0_carry__2_n_7;
  wire barycentricRowResetA0_carry_i_1_n_0;
  wire barycentricRowResetA0_carry_i_2_n_0;
  wire barycentricRowResetA0_carry_i_3_n_0;
  wire barycentricRowResetA0_carry_i_4_n_0;
  wire barycentricRowResetA0_carry_i_5_n_0;
  wire barycentricRowResetA0_carry_i_6_n_0;
  wire barycentricRowResetA0_carry_i_7_n_0;
  wire barycentricRowResetA0_carry_i_8_n_0;
  wire barycentricRowResetA0_carry_n_0;
  wire barycentricRowResetA0_carry_n_1;
  wire barycentricRowResetA0_carry_n_2;
  wire barycentricRowResetA0_carry_n_3;
  wire barycentricRowResetA0_carry_n_4;
  wire barycentricRowResetA0_carry_n_5;
  wire barycentricRowResetA0_carry_n_6;
  wire barycentricRowResetA0_carry_n_7;
  wire \barycentricRowResetA_reg_n_0_[0] ;
  wire \barycentricRowResetA_reg_n_0_[10] ;
  wire \barycentricRowResetA_reg_n_0_[11] ;
  wire \barycentricRowResetA_reg_n_0_[12] ;
  wire \barycentricRowResetA_reg_n_0_[13] ;
  wire \barycentricRowResetA_reg_n_0_[14] ;
  wire \barycentricRowResetA_reg_n_0_[15] ;
  wire \barycentricRowResetA_reg_n_0_[16] ;
  wire \barycentricRowResetA_reg_n_0_[17] ;
  wire \barycentricRowResetA_reg_n_0_[18] ;
  wire \barycentricRowResetA_reg_n_0_[19] ;
  wire \barycentricRowResetA_reg_n_0_[1] ;
  wire \barycentricRowResetA_reg_n_0_[20] ;
  wire \barycentricRowResetA_reg_n_0_[21] ;
  wire \barycentricRowResetA_reg_n_0_[22] ;
  wire \barycentricRowResetA_reg_n_0_[23] ;
  wire \barycentricRowResetA_reg_n_0_[24] ;
  wire \barycentricRowResetA_reg_n_0_[25] ;
  wire \barycentricRowResetA_reg_n_0_[26] ;
  wire \barycentricRowResetA_reg_n_0_[27] ;
  wire \barycentricRowResetA_reg_n_0_[28] ;
  wire \barycentricRowResetA_reg_n_0_[29] ;
  wire \barycentricRowResetA_reg_n_0_[2] ;
  wire \barycentricRowResetA_reg_n_0_[30] ;
  wire \barycentricRowResetA_reg_n_0_[31] ;
  wire \barycentricRowResetA_reg_n_0_[3] ;
  wire \barycentricRowResetA_reg_n_0_[4] ;
  wire \barycentricRowResetA_reg_n_0_[5] ;
  wire \barycentricRowResetA_reg_n_0_[6] ;
  wire \barycentricRowResetA_reg_n_0_[7] ;
  wire \barycentricRowResetA_reg_n_0_[8] ;
  wire \barycentricRowResetA_reg_n_0_[9] ;
  wire [31:0]barycentricRowResetB;
  wire barycentricRowResetB0_carry__0_i_1_n_0;
  wire barycentricRowResetB0_carry__0_i_2_n_0;
  wire barycentricRowResetB0_carry__0_i_3_n_0;
  wire barycentricRowResetB0_carry__0_i_4_n_0;
  wire barycentricRowResetB0_carry__0_i_5_n_0;
  wire barycentricRowResetB0_carry__0_i_6_n_0;
  wire barycentricRowResetB0_carry__0_i_7_n_0;
  wire barycentricRowResetB0_carry__0_i_8_n_0;
  wire barycentricRowResetB0_carry__0_n_0;
  wire barycentricRowResetB0_carry__0_n_1;
  wire barycentricRowResetB0_carry__0_n_2;
  wire barycentricRowResetB0_carry__0_n_3;
  wire barycentricRowResetB0_carry__0_n_4;
  wire barycentricRowResetB0_carry__0_n_5;
  wire barycentricRowResetB0_carry__0_n_6;
  wire barycentricRowResetB0_carry__0_n_7;
  wire barycentricRowResetB0_carry__1_i_1_n_0;
  wire barycentricRowResetB0_carry__1_i_2_n_0;
  wire barycentricRowResetB0_carry__1_i_3_n_0;
  wire barycentricRowResetB0_carry__1_i_4_n_0;
  wire barycentricRowResetB0_carry__1_i_5_n_0;
  wire barycentricRowResetB0_carry__1_i_6_n_0;
  wire barycentricRowResetB0_carry__1_i_7_n_0;
  wire barycentricRowResetB0_carry__1_i_8_n_0;
  wire barycentricRowResetB0_carry__1_i_9_n_0;
  wire barycentricRowResetB0_carry__1_n_0;
  wire barycentricRowResetB0_carry__1_n_1;
  wire barycentricRowResetB0_carry__1_n_2;
  wire barycentricRowResetB0_carry__1_n_3;
  wire barycentricRowResetB0_carry__1_n_4;
  wire barycentricRowResetB0_carry__1_n_5;
  wire barycentricRowResetB0_carry__1_n_6;
  wire barycentricRowResetB0_carry__1_n_7;
  wire barycentricRowResetB0_carry__2_i_1_n_0;
  wire barycentricRowResetB0_carry__2_i_2_n_0;
  wire barycentricRowResetB0_carry__2_i_3_n_0;
  wire barycentricRowResetB0_carry__2_i_4_n_0;
  wire barycentricRowResetB0_carry__2_i_5_n_0;
  wire barycentricRowResetB0_carry__2_i_6_n_0;
  wire barycentricRowResetB0_carry__2_i_7_n_0;
  wire barycentricRowResetB0_carry__2_i_8_n_0;
  wire barycentricRowResetB0_carry__2_n_1;
  wire barycentricRowResetB0_carry__2_n_2;
  wire barycentricRowResetB0_carry__2_n_3;
  wire barycentricRowResetB0_carry__2_n_4;
  wire barycentricRowResetB0_carry__2_n_5;
  wire barycentricRowResetB0_carry__2_n_6;
  wire barycentricRowResetB0_carry__2_n_7;
  wire barycentricRowResetB0_carry_i_1_n_0;
  wire barycentricRowResetB0_carry_i_2_n_0;
  wire barycentricRowResetB0_carry_i_3_n_0;
  wire barycentricRowResetB0_carry_i_4_n_0;
  wire barycentricRowResetB0_carry_i_5_n_0;
  wire barycentricRowResetB0_carry_i_6_n_0;
  wire barycentricRowResetB0_carry_i_7_n_0;
  wire barycentricRowResetB0_carry_i_8_n_0;
  wire barycentricRowResetB0_carry_n_0;
  wire barycentricRowResetB0_carry_n_1;
  wire barycentricRowResetB0_carry_n_2;
  wire barycentricRowResetB0_carry_n_3;
  wire barycentricRowResetB0_carry_n_4;
  wire barycentricRowResetB0_carry_n_5;
  wire barycentricRowResetB0_carry_n_6;
  wire barycentricRowResetB0_carry_n_7;
  wire \barycentricRowResetB_reg_n_0_[0] ;
  wire \barycentricRowResetB_reg_n_0_[10] ;
  wire \barycentricRowResetB_reg_n_0_[11] ;
  wire \barycentricRowResetB_reg_n_0_[12] ;
  wire \barycentricRowResetB_reg_n_0_[13] ;
  wire \barycentricRowResetB_reg_n_0_[14] ;
  wire \barycentricRowResetB_reg_n_0_[15] ;
  wire \barycentricRowResetB_reg_n_0_[16] ;
  wire \barycentricRowResetB_reg_n_0_[17] ;
  wire \barycentricRowResetB_reg_n_0_[18] ;
  wire \barycentricRowResetB_reg_n_0_[19] ;
  wire \barycentricRowResetB_reg_n_0_[1] ;
  wire \barycentricRowResetB_reg_n_0_[20] ;
  wire \barycentricRowResetB_reg_n_0_[21] ;
  wire \barycentricRowResetB_reg_n_0_[22] ;
  wire \barycentricRowResetB_reg_n_0_[23] ;
  wire \barycentricRowResetB_reg_n_0_[24] ;
  wire \barycentricRowResetB_reg_n_0_[25] ;
  wire \barycentricRowResetB_reg_n_0_[26] ;
  wire \barycentricRowResetB_reg_n_0_[27] ;
  wire \barycentricRowResetB_reg_n_0_[28] ;
  wire \barycentricRowResetB_reg_n_0_[29] ;
  wire \barycentricRowResetB_reg_n_0_[2] ;
  wire \barycentricRowResetB_reg_n_0_[30] ;
  wire \barycentricRowResetB_reg_n_0_[31] ;
  wire \barycentricRowResetB_reg_n_0_[3] ;
  wire \barycentricRowResetB_reg_n_0_[4] ;
  wire \barycentricRowResetB_reg_n_0_[5] ;
  wire \barycentricRowResetB_reg_n_0_[6] ;
  wire \barycentricRowResetB_reg_n_0_[7] ;
  wire \barycentricRowResetB_reg_n_0_[8] ;
  wire \barycentricRowResetB_reg_n_0_[9] ;
  wire [31:0]barycentricRowResetC;
  wire barycentricRowResetC0_carry__0_i_1_n_0;
  wire barycentricRowResetC0_carry__0_i_2_n_0;
  wire barycentricRowResetC0_carry__0_i_3_n_0;
  wire barycentricRowResetC0_carry__0_i_4_n_0;
  wire barycentricRowResetC0_carry__0_i_5_n_0;
  wire barycentricRowResetC0_carry__0_i_6_n_0;
  wire barycentricRowResetC0_carry__0_i_7_n_0;
  wire barycentricRowResetC0_carry__0_i_8_n_0;
  wire barycentricRowResetC0_carry__0_n_0;
  wire barycentricRowResetC0_carry__0_n_1;
  wire barycentricRowResetC0_carry__0_n_2;
  wire barycentricRowResetC0_carry__0_n_3;
  wire barycentricRowResetC0_carry__0_n_4;
  wire barycentricRowResetC0_carry__0_n_5;
  wire barycentricRowResetC0_carry__0_n_6;
  wire barycentricRowResetC0_carry__0_n_7;
  wire barycentricRowResetC0_carry__1_i_1_n_0;
  wire barycentricRowResetC0_carry__1_i_2_n_0;
  wire barycentricRowResetC0_carry__1_i_3_n_0;
  wire barycentricRowResetC0_carry__1_i_4_n_0;
  wire barycentricRowResetC0_carry__1_i_5_n_0;
  wire barycentricRowResetC0_carry__1_i_6_n_0;
  wire barycentricRowResetC0_carry__1_i_7_n_0;
  wire barycentricRowResetC0_carry__1_i_8_n_0;
  wire barycentricRowResetC0_carry__1_i_9_n_0;
  wire barycentricRowResetC0_carry__1_n_0;
  wire barycentricRowResetC0_carry__1_n_1;
  wire barycentricRowResetC0_carry__1_n_2;
  wire barycentricRowResetC0_carry__1_n_3;
  wire barycentricRowResetC0_carry__1_n_4;
  wire barycentricRowResetC0_carry__1_n_5;
  wire barycentricRowResetC0_carry__1_n_6;
  wire barycentricRowResetC0_carry__1_n_7;
  wire barycentricRowResetC0_carry__2_i_1_n_0;
  wire barycentricRowResetC0_carry__2_i_2_n_0;
  wire barycentricRowResetC0_carry__2_i_3_n_0;
  wire barycentricRowResetC0_carry__2_i_4_n_0;
  wire barycentricRowResetC0_carry__2_i_5_n_0;
  wire barycentricRowResetC0_carry__2_i_6_n_0;
  wire barycentricRowResetC0_carry__2_i_7_n_0;
  wire barycentricRowResetC0_carry__2_i_8_n_0;
  wire barycentricRowResetC0_carry__2_n_1;
  wire barycentricRowResetC0_carry__2_n_2;
  wire barycentricRowResetC0_carry__2_n_3;
  wire barycentricRowResetC0_carry__2_n_4;
  wire barycentricRowResetC0_carry__2_n_5;
  wire barycentricRowResetC0_carry__2_n_6;
  wire barycentricRowResetC0_carry__2_n_7;
  wire barycentricRowResetC0_carry_i_1_n_0;
  wire barycentricRowResetC0_carry_i_2_n_0;
  wire barycentricRowResetC0_carry_i_3_n_0;
  wire barycentricRowResetC0_carry_i_4_n_0;
  wire barycentricRowResetC0_carry_i_5_n_0;
  wire barycentricRowResetC0_carry_i_6_n_0;
  wire barycentricRowResetC0_carry_i_7_n_0;
  wire barycentricRowResetC0_carry_i_8_n_0;
  wire barycentricRowResetC0_carry_n_0;
  wire barycentricRowResetC0_carry_n_1;
  wire barycentricRowResetC0_carry_n_2;
  wire barycentricRowResetC0_carry_n_3;
  wire barycentricRowResetC0_carry_n_4;
  wire barycentricRowResetC0_carry_n_5;
  wire barycentricRowResetC0_carry_n_6;
  wire barycentricRowResetC0_carry_n_7;
  wire \barycentricRowResetC_reg_n_0_[0] ;
  wire \barycentricRowResetC_reg_n_0_[10] ;
  wire \barycentricRowResetC_reg_n_0_[11] ;
  wire \barycentricRowResetC_reg_n_0_[12] ;
  wire \barycentricRowResetC_reg_n_0_[13] ;
  wire \barycentricRowResetC_reg_n_0_[14] ;
  wire \barycentricRowResetC_reg_n_0_[15] ;
  wire \barycentricRowResetC_reg_n_0_[16] ;
  wire \barycentricRowResetC_reg_n_0_[17] ;
  wire \barycentricRowResetC_reg_n_0_[18] ;
  wire \barycentricRowResetC_reg_n_0_[19] ;
  wire \barycentricRowResetC_reg_n_0_[1] ;
  wire \barycentricRowResetC_reg_n_0_[20] ;
  wire \barycentricRowResetC_reg_n_0_[21] ;
  wire \barycentricRowResetC_reg_n_0_[22] ;
  wire \barycentricRowResetC_reg_n_0_[23] ;
  wire \barycentricRowResetC_reg_n_0_[24] ;
  wire \barycentricRowResetC_reg_n_0_[25] ;
  wire \barycentricRowResetC_reg_n_0_[26] ;
  wire \barycentricRowResetC_reg_n_0_[27] ;
  wire \barycentricRowResetC_reg_n_0_[28] ;
  wire \barycentricRowResetC_reg_n_0_[29] ;
  wire \barycentricRowResetC_reg_n_0_[2] ;
  wire \barycentricRowResetC_reg_n_0_[30] ;
  wire \barycentricRowResetC_reg_n_0_[31] ;
  wire \barycentricRowResetC_reg_n_0_[3] ;
  wire \barycentricRowResetC_reg_n_0_[4] ;
  wire \barycentricRowResetC_reg_n_0_[5] ;
  wire \barycentricRowResetC_reg_n_0_[6] ;
  wire \barycentricRowResetC_reg_n_0_[7] ;
  wire \barycentricRowResetC_reg_n_0_[8] ;
  wire \barycentricRowResetC_reg_n_0_[9] ;
  wire [15:0]barycentricXDeltaA;
  wire [15:0]barycentricXDeltaB;
  wire [15:0]barycentricXDeltaC;
  wire [15:0]barycentricYDeltaA;
  wire [15:0]barycentricYDeltaB;
  wire [15:0]barycentricYDeltaC;
  wire clk;
  wire [15:0]currentDrawEventID;
  wire [0:0]currentState;
  wire \currentState[0]__0_i_1_n_0 ;
  wire \currentState[0]__0_i_2_n_0 ;
  wire \currentState[0]__0_i_3_n_0 ;
  wire \currentState[0]__0_i_4_n_0 ;
  wire \currentState[0]__0_i_5_n_0 ;
  wire \currentState[0]__0_i_6_n_0 ;
  wire \currentState[1]__0_i_1_n_0 ;
  wire \currentState[2]__0_i_10_n_0 ;
  wire \currentState[2]__0_i_11_n_0 ;
  wire \currentState[2]__0_i_12_n_0 ;
  wire \currentState[2]__0_i_13_n_0 ;
  wire \currentState[2]__0_i_14_n_0 ;
  wire \currentState[2]__0_i_2_n_0 ;
  wire \currentState[2]__0_i_3_n_0 ;
  wire \currentState[2]__0_i_4_n_0 ;
  wire \currentState[2]__0_i_5_n_0 ;
  wire \currentState[2]__0_i_7_n_0 ;
  wire \currentState[2]__0_i_8_n_0 ;
  wire \currentState[2]__0_i_9_n_0 ;
  wire [2:0]currentState__0;
  wire [2:0]currentState__1;
  wire [2:0]\currentState_reg[2]__0_0 ;
  wire [95:79]fifoWriteData;
  wire [95:64]fifoWriteData0_in;
  wire \fifoWriteData[0]_i_1_n_0 ;
  wire \fifoWriteData[10]_i_1_n_0 ;
  wire \fifoWriteData[11]_i_1_n_0 ;
  wire \fifoWriteData[12]_i_1_n_0 ;
  wire \fifoWriteData[13]_i_1_n_0 ;
  wire \fifoWriteData[14]_i_1_n_0 ;
  wire \fifoWriteData[15]_i_1_n_0 ;
  wire \fifoWriteData[16]_i_1_n_0 ;
  wire \fifoWriteData[17]_i_1_n_0 ;
  wire \fifoWriteData[18]_i_1_n_0 ;
  wire \fifoWriteData[19]_i_1_n_0 ;
  wire \fifoWriteData[1]_i_1_n_0 ;
  wire \fifoWriteData[20]_i_1_n_0 ;
  wire \fifoWriteData[21]_i_1_n_0 ;
  wire \fifoWriteData[22]_i_1_n_0 ;
  wire \fifoWriteData[23]_i_1_n_0 ;
  wire \fifoWriteData[24]_i_1_n_0 ;
  wire \fifoWriteData[25]_i_1_n_0 ;
  wire \fifoWriteData[26]_i_1_n_0 ;
  wire \fifoWriteData[27]_i_1_n_0 ;
  wire \fifoWriteData[28]_i_1_n_0 ;
  wire \fifoWriteData[29]_i_1_n_0 ;
  wire \fifoWriteData[2]_i_1_n_0 ;
  wire \fifoWriteData[30]_i_1_n_0 ;
  wire \fifoWriteData[31]_i_1_n_0 ;
  wire \fifoWriteData[32]_i_1_n_0 ;
  wire \fifoWriteData[33]_i_1_n_0 ;
  wire \fifoWriteData[34]_i_1_n_0 ;
  wire \fifoWriteData[35]_i_1_n_0 ;
  wire \fifoWriteData[36]_i_1_n_0 ;
  wire \fifoWriteData[37]_i_1_n_0 ;
  wire \fifoWriteData[38]_i_1_n_0 ;
  wire \fifoWriteData[39]_i_1_n_0 ;
  wire \fifoWriteData[3]_i_1_n_0 ;
  wire \fifoWriteData[40]_i_1_n_0 ;
  wire \fifoWriteData[41]_i_1_n_0 ;
  wire \fifoWriteData[42]_i_1_n_0 ;
  wire \fifoWriteData[43]_i_1_n_0 ;
  wire \fifoWriteData[44]_i_1_n_0 ;
  wire \fifoWriteData[45]_i_1_n_0 ;
  wire \fifoWriteData[46]_i_1_n_0 ;
  wire \fifoWriteData[47]_i_1_n_0 ;
  wire \fifoWriteData[48]_i_1_n_0 ;
  wire \fifoWriteData[49]_i_1_n_0 ;
  wire \fifoWriteData[4]_i_1_n_0 ;
  wire \fifoWriteData[50]_i_1_n_0 ;
  wire \fifoWriteData[51]_i_1_n_0 ;
  wire \fifoWriteData[52]_i_1_n_0 ;
  wire \fifoWriteData[53]_i_1_n_0 ;
  wire \fifoWriteData[54]_i_1_n_0 ;
  wire \fifoWriteData[55]_i_1_n_0 ;
  wire \fifoWriteData[56]_i_1_n_0 ;
  wire \fifoWriteData[57]_i_1_n_0 ;
  wire \fifoWriteData[58]_i_1_n_0 ;
  wire \fifoWriteData[59]_i_1_n_0 ;
  wire \fifoWriteData[5]_i_1_n_0 ;
  wire \fifoWriteData[60]_i_1_n_0 ;
  wire \fifoWriteData[61]_i_1_n_0 ;
  wire \fifoWriteData[62]_i_1_n_0 ;
  wire \fifoWriteData[63]_i_1_n_0 ;
  wire \fifoWriteData[63]_i_2_n_0 ;
  wire \fifoWriteData[68]_i_1_n_0 ;
  wire \fifoWriteData[69]_i_1_n_0 ;
  wire \fifoWriteData[6]_i_1_n_0 ;
  wire \fifoWriteData[70]_i_1_n_0 ;
  wire \fifoWriteData[71]_i_1_n_0 ;
  wire \fifoWriteData[72]_i_1_n_0 ;
  wire \fifoWriteData[73]_i_1_n_0 ;
  wire \fifoWriteData[74]_i_1_n_0 ;
  wire \fifoWriteData[75]_i_1_n_0 ;
  wire \fifoWriteData[76]_i_1_n_0 ;
  wire \fifoWriteData[77]_i_1_n_0 ;
  wire \fifoWriteData[78]_i_1_n_0 ;
  wire \fifoWriteData[78]_i_3_n_0 ;
  wire \fifoWriteData[79]_i_1_n_0 ;
  wire \fifoWriteData[79]_i_2_n_0 ;
  wire \fifoWriteData[79]_i_3_n_0 ;
  wire \fifoWriteData[79]_i_4_n_0 ;
  wire \fifoWriteData[7]_i_1_n_0 ;
  wire \fifoWriteData[80]_i_2_n_0 ;
  wire \fifoWriteData[81]_i_2_n_0 ;
  wire \fifoWriteData[82]_i_2_n_0 ;
  wire \fifoWriteData[83]_i_2_n_0 ;
  wire \fifoWriteData[84]_i_2_n_0 ;
  wire \fifoWriteData[85]_i_2_n_0 ;
  wire \fifoWriteData[86]_i_2_n_0 ;
  wire \fifoWriteData[87]_i_2_n_0 ;
  wire \fifoWriteData[88]_i_2_n_0 ;
  wire \fifoWriteData[89]_i_2_n_0 ;
  wire \fifoWriteData[8]_i_1_n_0 ;
  wire \fifoWriteData[90]_i_2_n_0 ;
  wire \fifoWriteData[91]_i_2_n_0 ;
  wire \fifoWriteData[92]_i_2_n_0 ;
  wire \fifoWriteData[93]_i_2_n_0 ;
  wire \fifoWriteData[94]_i_2_n_0 ;
  wire \fifoWriteData[95]_i_3_n_0 ;
  wire \fifoWriteData[95]_i_4_n_0 ;
  wire \fifoWriteData[9]_i_1_n_0 ;
  wire fifoWriteEnable;
  wire fifoWriteEnable1__1;
  wire fifoWriteEnable2;
  wire fifoWriteEnable2_carry_i_10_n_0;
  wire fifoWriteEnable2_carry_i_11_n_0;
  wire fifoWriteEnable2_carry_i_12_n_0;
  wire fifoWriteEnable2_carry_i_13_n_0;
  wire fifoWriteEnable2_carry_i_14_n_0;
  wire fifoWriteEnable2_carry_i_15_n_0;
  wire fifoWriteEnable2_carry_i_16_n_0;
  wire fifoWriteEnable2_carry_i_1_n_0;
  wire fifoWriteEnable2_carry_i_2_n_0;
  wire fifoWriteEnable2_carry_i_3_n_0;
  wire fifoWriteEnable2_carry_i_4_n_0;
  wire fifoWriteEnable2_carry_i_5_n_0;
  wire fifoWriteEnable2_carry_i_6_n_0;
  wire fifoWriteEnable2_carry_i_7_n_0;
  wire fifoWriteEnable2_carry_i_8_n_0;
  wire fifoWriteEnable2_carry_i_9_n_0;
  wire fifoWriteEnable2_carry_n_1;
  wire fifoWriteEnable2_carry_n_2;
  wire fifoWriteEnable2_carry_n_3;
  wire fifoWriteEnable2_carry_n_4;
  wire fifoWriteEnable2_carry_n_5;
  wire fifoWriteEnable2_carry_n_6;
  wire fifoWriteEnable2_carry_n_7;
  wire fifoWriteEnable_i_1_n_0;
  wire fifoWriteEnable_i_3_n_0;
  wire fifoWriteEnable_i_4_n_0;
  wire hasWrittenPixelsForThisTriangle0__0;
  wire hasWrittenPixelsForThisTriangle_i_1_n_0;
  wire hasWrittenPixelsForThisTriangle_i_2_n_0;
  wire hasWrittenPixelsForThisTriangle_i_3_n_0;
  wire hasWrittenPixelsForThisTriangle_reg_n_0;
  wire i__carry__0_i_10__0_n_0;
  wire i__carry__0_i_10__1_n_0;
  wire i__carry__0_i_10_n_0;
  wire i__carry__0_i_11__0_n_0;
  wire i__carry__0_i_11__1_n_0;
  wire i__carry__0_i_11_n_0;
  wire i__carry__0_i_12__0_n_0;
  wire i__carry__0_i_12__1_n_0;
  wire i__carry__0_i_12_n_0;
  wire i__carry__0_i_13__0_n_0;
  wire i__carry__0_i_13__1_n_0;
  wire i__carry__0_i_13_n_0;
  wire i__carry__0_i_14__0_n_0;
  wire i__carry__0_i_14__1_n_0;
  wire i__carry__0_i_14_n_0;
  wire i__carry__0_i_15__0_n_0;
  wire i__carry__0_i_15__1_n_0;
  wire i__carry__0_i_15_n_0;
  wire i__carry__0_i_16__0_n_0;
  wire i__carry__0_i_16__1_n_0;
  wire i__carry__0_i_16_n_0;
  wire i__carry__0_i_1__0_n_0;
  wire i__carry__0_i_1__1_n_0;
  wire i__carry__0_i_2__0_n_0;
  wire i__carry__0_i_2__1_n_0;
  wire i__carry__0_i_3__0_n_0;
  wire i__carry__0_i_3__1_n_0;
  wire i__carry__0_i_4__0_n_0;
  wire i__carry__0_i_4__1_n_0;
  wire i__carry__0_i_5__0_n_0;
  wire i__carry__0_i_5__1_n_0;
  wire i__carry__0_i_6__0_n_0;
  wire i__carry__0_i_6__1_n_0;
  wire i__carry__0_i_7__0_n_0;
  wire i__carry__0_i_7__1_n_0;
  wire i__carry__0_i_8__0_n_0;
  wire i__carry__0_i_8__1_n_0;
  wire i__carry__0_i_9__0_n_0;
  wire i__carry__0_i_9__1_n_0;
  wire i__carry__0_i_9_n_0;
  wire i__carry__1_i_10__0_n_0;
  wire i__carry__1_i_10__1_n_0;
  wire i__carry__1_i_10_n_0;
  wire i__carry__1_i_11__0_n_0;
  wire i__carry__1_i_11__1_n_0;
  wire i__carry__1_i_11_n_0;
  wire i__carry__1_i_12__0_n_0;
  wire i__carry__1_i_12__1_n_0;
  wire i__carry__1_i_12_n_0;
  wire i__carry__1_i_13__0_n_0;
  wire i__carry__1_i_13__1_n_0;
  wire i__carry__1_i_13_n_0;
  wire i__carry__1_i_14__0_n_0;
  wire i__carry__1_i_14__1_n_0;
  wire i__carry__1_i_14_n_0;
  wire i__carry__1_i_15__0_n_0;
  wire i__carry__1_i_15__1_n_0;
  wire i__carry__1_i_15_n_0;
  wire i__carry__1_i_16__0_n_0;
  wire i__carry__1_i_16__1_n_0;
  wire i__carry__1_i_16_n_0;
  wire i__carry__1_i_1__0_n_0;
  wire i__carry__1_i_1__1_n_0;
  wire i__carry__1_i_2__0_n_0;
  wire i__carry__1_i_2__1_n_0;
  wire i__carry__1_i_3__0_n_0;
  wire i__carry__1_i_3__1_n_0;
  wire i__carry__1_i_4__0_n_0;
  wire i__carry__1_i_4__1_n_0;
  wire i__carry__1_i_5__0_n_0;
  wire i__carry__1_i_5__1_n_0;
  wire i__carry__1_i_6__0_n_0;
  wire i__carry__1_i_6__1_n_0;
  wire i__carry__1_i_7__0_n_0;
  wire i__carry__1_i_7__1_n_0;
  wire i__carry__1_i_8__0_n_0;
  wire i__carry__1_i_8__1_n_0;
  wire i__carry__1_i_9__0_n_0;
  wire i__carry__1_i_9__1_n_0;
  wire i__carry__1_i_9_n_0;
  wire i__carry__2_i_10__0_n_0;
  wire i__carry__2_i_10__1_n_0;
  wire i__carry__2_i_10_n_0;
  wire i__carry__2_i_11__0_n_0;
  wire i__carry__2_i_11__1_n_0;
  wire i__carry__2_i_11_n_0;
  wire i__carry__2_i_12__0_n_0;
  wire i__carry__2_i_12__1_n_0;
  wire i__carry__2_i_12_n_0;
  wire i__carry__2_i_13__0_n_0;
  wire i__carry__2_i_13__1_n_0;
  wire i__carry__2_i_13_n_0;
  wire i__carry__2_i_14__0_n_0;
  wire i__carry__2_i_14__1_n_0;
  wire i__carry__2_i_14_n_0;
  wire i__carry__2_i_15__0_n_0;
  wire i__carry__2_i_15__1_n_0;
  wire i__carry__2_i_15_n_0;
  wire i__carry__2_i_16__0_n_0;
  wire i__carry__2_i_16__1_n_0;
  wire i__carry__2_i_1__0_n_0;
  wire i__carry__2_i_1__1_n_0;
  wire i__carry__2_i_2__0_n_0;
  wire i__carry__2_i_2__1_n_0;
  wire i__carry__2_i_3__0_n_0;
  wire i__carry__2_i_3__1_n_0;
  wire i__carry__2_i_4__0_n_0;
  wire i__carry__2_i_4__1_n_0;
  wire i__carry__2_i_5__0_n_0;
  wire i__carry__2_i_5__1_n_0;
  wire i__carry__2_i_6__0_n_0;
  wire i__carry__2_i_6__1_n_0;
  wire i__carry__2_i_7__0_n_0;
  wire i__carry__2_i_7__1_n_0;
  wire i__carry__2_i_8__0_n_0;
  wire i__carry__2_i_8__1_n_0;
  wire i__carry__2_i_8_n_0;
  wire i__carry__2_i_9__0_n_0;
  wire i__carry__2_i_9__1_n_0;
  wire i__carry__2_i_9_n_0;
  wire i__carry_i_10__0_n_0;
  wire i__carry_i_10__1_n_0;
  wire i__carry_i_10_n_0;
  wire i__carry_i_11__0_n_0;
  wire i__carry_i_11__1_n_0;
  wire i__carry_i_11_n_0;
  wire i__carry_i_12__0_n_0;
  wire i__carry_i_12__1_n_0;
  wire i__carry_i_12_n_0;
  wire i__carry_i_13__0_n_0;
  wire i__carry_i_13__1_n_0;
  wire i__carry_i_13_n_0;
  wire i__carry_i_14__0_n_0;
  wire i__carry_i_14__1_n_0;
  wire i__carry_i_14_n_0;
  wire i__carry_i_15__0_n_0;
  wire i__carry_i_15__1_n_0;
  wire i__carry_i_15_n_0;
  wire i__carry_i_16__0_n_0;
  wire i__carry_i_16__1_n_0;
  wire i__carry_i_16_n_0;
  wire i__carry_i_1__0_n_0;
  wire i__carry_i_1__1_n_0;
  wire i__carry_i_2__0_n_0;
  wire i__carry_i_2__1_n_0;
  wire i__carry_i_3__0_n_0;
  wire i__carry_i_3__1_n_0;
  wire i__carry_i_4__0_n_0;
  wire i__carry_i_4__1_n_0;
  wire i__carry_i_5__0_n_0;
  wire i__carry_i_5__1_n_0;
  wire i__carry_i_6__0_n_0;
  wire i__carry_i_6__1_n_0;
  wire i__carry_i_7__0_n_0;
  wire i__carry_i_7__1_n_0;
  wire i__carry_i_8__0_n_0;
  wire i__carry_i_8__1_n_0;
  wire i__carry_i_9__0_n_0;
  wire i__carry_i_9__1_n_0;
  wire i__carry_i_9_n_0;
  wire [31:0]in22;
  wire [31:0]in24;
  wire [31:0]in26;
  wire isTopLeftEdgeB;
  wire isTopLeftEdgeC;
  wire [31:31]p_0_out;
  wire [30:0]p_0_out__0;
  wire [15:0]pixelXPos;
  wire pixelXPos1_carry_i_10_n_0;
  wire pixelXPos1_carry_i_11_n_0;
  wire pixelXPos1_carry_i_12_n_0;
  wire pixelXPos1_carry_i_13_n_0;
  wire pixelXPos1_carry_i_14_n_0;
  wire pixelXPos1_carry_i_15_n_0;
  wire pixelXPos1_carry_i_16_n_0;
  wire pixelXPos1_carry_i_1_n_0;
  wire pixelXPos1_carry_i_2_n_0;
  wire pixelXPos1_carry_i_3_n_0;
  wire pixelXPos1_carry_i_4_n_0;
  wire pixelXPos1_carry_i_5_n_0;
  wire pixelXPos1_carry_i_6_n_0;
  wire pixelXPos1_carry_i_7_n_0;
  wire pixelXPos1_carry_i_8_n_0;
  wire pixelXPos1_carry_i_9_n_0;
  wire pixelXPos1_carry_n_0;
  wire pixelXPos1_carry_n_1;
  wire pixelXPos1_carry_n_2;
  wire pixelXPos1_carry_n_3;
  wire pixelXPos1_carry_n_4;
  wire pixelXPos1_carry_n_5;
  wire pixelXPos1_carry_n_6;
  wire pixelXPos1_carry_n_7;
  wire \pixelXPos[10]_i_2_n_0 ;
  wire \pixelXPos[11]_i_2_n_0 ;
  wire \pixelXPos[12]_i_2_n_0 ;
  wire \pixelXPos[13]_i_2_n_0 ;
  wire \pixelXPos[14]_i_2_n_0 ;
  wire \pixelXPos[2]_i_2_n_0 ;
  wire \pixelXPos[3]_i_2_n_0 ;
  wire \pixelXPos[4]_i_2_n_0 ;
  wire \pixelXPos[5]_i_2_n_0 ;
  wire \pixelXPos[6]_i_2_n_0 ;
  wire \pixelXPos[7]_i_2_n_0 ;
  wire \pixelXPos[8]_i_2_n_0 ;
  wire \pixelXPos[9]_i_2_n_0 ;
  wire [0:0]pixelXPos_2;
  wire [15:0]\pixelXPos_reg[15]_0 ;
  wire [15:0]pixelYPos;
  wire \pixelYPos[10]_i_2_n_0 ;
  wire \pixelYPos[13]_i_2_n_0 ;
  wire \pixelYPos[15]_i_3_n_0 ;
  wire \pixelYPos[4]_i_2_n_0 ;
  wire \pixelYPos[5]_i_2_n_0 ;
  wire \pixelYPos[8]_i_2_n_0 ;
  wire \pixelYPos[9]_i_2_n_0 ;
  wire [0:0]pixelYPos_1;
  wire [15:15]plusOp;
  wire [15:0]previousDrawEventID;
  wire [0:0]previousDrawEventID_0;
  wire readyForNewTri_i_1_n_0;
  wire readyForNewTri_i_2_n_0;
  wire \statCyclesIdle[7]_i_2_n_0 ;
  wire \statCyclesIdle_reg[15]_i_1_n_0 ;
  wire \statCyclesIdle_reg[15]_i_1_n_1 ;
  wire \statCyclesIdle_reg[15]_i_1_n_10 ;
  wire \statCyclesIdle_reg[15]_i_1_n_11 ;
  wire \statCyclesIdle_reg[15]_i_1_n_12 ;
  wire \statCyclesIdle_reg[15]_i_1_n_13 ;
  wire \statCyclesIdle_reg[15]_i_1_n_14 ;
  wire \statCyclesIdle_reg[15]_i_1_n_15 ;
  wire \statCyclesIdle_reg[15]_i_1_n_2 ;
  wire \statCyclesIdle_reg[15]_i_1_n_3 ;
  wire \statCyclesIdle_reg[15]_i_1_n_4 ;
  wire \statCyclesIdle_reg[15]_i_1_n_5 ;
  wire \statCyclesIdle_reg[15]_i_1_n_6 ;
  wire \statCyclesIdle_reg[15]_i_1_n_7 ;
  wire \statCyclesIdle_reg[15]_i_1_n_8 ;
  wire \statCyclesIdle_reg[15]_i_1_n_9 ;
  wire \statCyclesIdle_reg[23]_i_1_n_0 ;
  wire \statCyclesIdle_reg[23]_i_1_n_1 ;
  wire \statCyclesIdle_reg[23]_i_1_n_10 ;
  wire \statCyclesIdle_reg[23]_i_1_n_11 ;
  wire \statCyclesIdle_reg[23]_i_1_n_12 ;
  wire \statCyclesIdle_reg[23]_i_1_n_13 ;
  wire \statCyclesIdle_reg[23]_i_1_n_14 ;
  wire \statCyclesIdle_reg[23]_i_1_n_15 ;
  wire \statCyclesIdle_reg[23]_i_1_n_2 ;
  wire \statCyclesIdle_reg[23]_i_1_n_3 ;
  wire \statCyclesIdle_reg[23]_i_1_n_4 ;
  wire \statCyclesIdle_reg[23]_i_1_n_5 ;
  wire \statCyclesIdle_reg[23]_i_1_n_6 ;
  wire \statCyclesIdle_reg[23]_i_1_n_7 ;
  wire \statCyclesIdle_reg[23]_i_1_n_8 ;
  wire \statCyclesIdle_reg[23]_i_1_n_9 ;
  wire \statCyclesIdle_reg[31]_i_1_n_1 ;
  wire \statCyclesIdle_reg[31]_i_1_n_10 ;
  wire \statCyclesIdle_reg[31]_i_1_n_11 ;
  wire \statCyclesIdle_reg[31]_i_1_n_12 ;
  wire \statCyclesIdle_reg[31]_i_1_n_13 ;
  wire \statCyclesIdle_reg[31]_i_1_n_14 ;
  wire \statCyclesIdle_reg[31]_i_1_n_15 ;
  wire \statCyclesIdle_reg[31]_i_1_n_2 ;
  wire \statCyclesIdle_reg[31]_i_1_n_3 ;
  wire \statCyclesIdle_reg[31]_i_1_n_4 ;
  wire \statCyclesIdle_reg[31]_i_1_n_5 ;
  wire \statCyclesIdle_reg[31]_i_1_n_6 ;
  wire \statCyclesIdle_reg[31]_i_1_n_7 ;
  wire \statCyclesIdle_reg[31]_i_1_n_8 ;
  wire \statCyclesIdle_reg[31]_i_1_n_9 ;
  wire \statCyclesIdle_reg[7]_i_1_n_0 ;
  wire \statCyclesIdle_reg[7]_i_1_n_1 ;
  wire \statCyclesIdle_reg[7]_i_1_n_10 ;
  wire \statCyclesIdle_reg[7]_i_1_n_11 ;
  wire \statCyclesIdle_reg[7]_i_1_n_12 ;
  wire \statCyclesIdle_reg[7]_i_1_n_13 ;
  wire \statCyclesIdle_reg[7]_i_1_n_14 ;
  wire \statCyclesIdle_reg[7]_i_1_n_15 ;
  wire \statCyclesIdle_reg[7]_i_1_n_2 ;
  wire \statCyclesIdle_reg[7]_i_1_n_3 ;
  wire \statCyclesIdle_reg[7]_i_1_n_4 ;
  wire \statCyclesIdle_reg[7]_i_1_n_5 ;
  wire \statCyclesIdle_reg[7]_i_1_n_6 ;
  wire \statCyclesIdle_reg[7]_i_1_n_7 ;
  wire \statCyclesIdle_reg[7]_i_1_n_8 ;
  wire \statCyclesIdle_reg[7]_i_1_n_9 ;
  wire [0:0]statCyclesWaitingForOutput;
  wire \statCyclesWaitingForOutput[7]_i_2_n_0 ;
  wire \statCyclesWaitingForOutput_reg[15]_i_1_n_0 ;
  wire \statCyclesWaitingForOutput_reg[15]_i_1_n_1 ;
  wire \statCyclesWaitingForOutput_reg[15]_i_1_n_10 ;
  wire \statCyclesWaitingForOutput_reg[15]_i_1_n_11 ;
  wire \statCyclesWaitingForOutput_reg[15]_i_1_n_12 ;
  wire \statCyclesWaitingForOutput_reg[15]_i_1_n_13 ;
  wire \statCyclesWaitingForOutput_reg[15]_i_1_n_14 ;
  wire \statCyclesWaitingForOutput_reg[15]_i_1_n_15 ;
  wire \statCyclesWaitingForOutput_reg[15]_i_1_n_2 ;
  wire \statCyclesWaitingForOutput_reg[15]_i_1_n_3 ;
  wire \statCyclesWaitingForOutput_reg[15]_i_1_n_4 ;
  wire \statCyclesWaitingForOutput_reg[15]_i_1_n_5 ;
  wire \statCyclesWaitingForOutput_reg[15]_i_1_n_6 ;
  wire \statCyclesWaitingForOutput_reg[15]_i_1_n_7 ;
  wire \statCyclesWaitingForOutput_reg[15]_i_1_n_8 ;
  wire \statCyclesWaitingForOutput_reg[15]_i_1_n_9 ;
  wire \statCyclesWaitingForOutput_reg[23]_i_1_n_0 ;
  wire \statCyclesWaitingForOutput_reg[23]_i_1_n_1 ;
  wire \statCyclesWaitingForOutput_reg[23]_i_1_n_10 ;
  wire \statCyclesWaitingForOutput_reg[23]_i_1_n_11 ;
  wire \statCyclesWaitingForOutput_reg[23]_i_1_n_12 ;
  wire \statCyclesWaitingForOutput_reg[23]_i_1_n_13 ;
  wire \statCyclesWaitingForOutput_reg[23]_i_1_n_14 ;
  wire \statCyclesWaitingForOutput_reg[23]_i_1_n_15 ;
  wire \statCyclesWaitingForOutput_reg[23]_i_1_n_2 ;
  wire \statCyclesWaitingForOutput_reg[23]_i_1_n_3 ;
  wire \statCyclesWaitingForOutput_reg[23]_i_1_n_4 ;
  wire \statCyclesWaitingForOutput_reg[23]_i_1_n_5 ;
  wire \statCyclesWaitingForOutput_reg[23]_i_1_n_6 ;
  wire \statCyclesWaitingForOutput_reg[23]_i_1_n_7 ;
  wire \statCyclesWaitingForOutput_reg[23]_i_1_n_8 ;
  wire \statCyclesWaitingForOutput_reg[23]_i_1_n_9 ;
  wire \statCyclesWaitingForOutput_reg[31]_i_2_n_1 ;
  wire \statCyclesWaitingForOutput_reg[31]_i_2_n_10 ;
  wire \statCyclesWaitingForOutput_reg[31]_i_2_n_11 ;
  wire \statCyclesWaitingForOutput_reg[31]_i_2_n_12 ;
  wire \statCyclesWaitingForOutput_reg[31]_i_2_n_13 ;
  wire \statCyclesWaitingForOutput_reg[31]_i_2_n_14 ;
  wire \statCyclesWaitingForOutput_reg[31]_i_2_n_15 ;
  wire \statCyclesWaitingForOutput_reg[31]_i_2_n_2 ;
  wire \statCyclesWaitingForOutput_reg[31]_i_2_n_3 ;
  wire \statCyclesWaitingForOutput_reg[31]_i_2_n_4 ;
  wire \statCyclesWaitingForOutput_reg[31]_i_2_n_5 ;
  wire \statCyclesWaitingForOutput_reg[31]_i_2_n_6 ;
  wire \statCyclesWaitingForOutput_reg[31]_i_2_n_7 ;
  wire \statCyclesWaitingForOutput_reg[31]_i_2_n_8 ;
  wire \statCyclesWaitingForOutput_reg[31]_i_2_n_9 ;
  wire \statCyclesWaitingForOutput_reg[7]_i_1_n_0 ;
  wire \statCyclesWaitingForOutput_reg[7]_i_1_n_1 ;
  wire \statCyclesWaitingForOutput_reg[7]_i_1_n_10 ;
  wire \statCyclesWaitingForOutput_reg[7]_i_1_n_11 ;
  wire \statCyclesWaitingForOutput_reg[7]_i_1_n_12 ;
  wire \statCyclesWaitingForOutput_reg[7]_i_1_n_13 ;
  wire \statCyclesWaitingForOutput_reg[7]_i_1_n_14 ;
  wire \statCyclesWaitingForOutput_reg[7]_i_1_n_15 ;
  wire \statCyclesWaitingForOutput_reg[7]_i_1_n_2 ;
  wire \statCyclesWaitingForOutput_reg[7]_i_1_n_3 ;
  wire \statCyclesWaitingForOutput_reg[7]_i_1_n_4 ;
  wire \statCyclesWaitingForOutput_reg[7]_i_1_n_5 ;
  wire \statCyclesWaitingForOutput_reg[7]_i_1_n_6 ;
  wire \statCyclesWaitingForOutput_reg[7]_i_1_n_7 ;
  wire \statCyclesWaitingForOutput_reg[7]_i_1_n_8 ;
  wire \statCyclesWaitingForOutput_reg[7]_i_1_n_9 ;
  wire \statCyclesWaitingForTriWorkCache[31]_i_1_n_0 ;
  wire \statCyclesWaitingForTriWorkCache[7]_i_2_n_0 ;
  wire \statCyclesWaitingForTriWorkCache_reg[15]_i_1_n_0 ;
  wire \statCyclesWaitingForTriWorkCache_reg[15]_i_1_n_1 ;
  wire \statCyclesWaitingForTriWorkCache_reg[15]_i_1_n_10 ;
  wire \statCyclesWaitingForTriWorkCache_reg[15]_i_1_n_11 ;
  wire \statCyclesWaitingForTriWorkCache_reg[15]_i_1_n_12 ;
  wire \statCyclesWaitingForTriWorkCache_reg[15]_i_1_n_13 ;
  wire \statCyclesWaitingForTriWorkCache_reg[15]_i_1_n_14 ;
  wire \statCyclesWaitingForTriWorkCache_reg[15]_i_1_n_15 ;
  wire \statCyclesWaitingForTriWorkCache_reg[15]_i_1_n_2 ;
  wire \statCyclesWaitingForTriWorkCache_reg[15]_i_1_n_3 ;
  wire \statCyclesWaitingForTriWorkCache_reg[15]_i_1_n_4 ;
  wire \statCyclesWaitingForTriWorkCache_reg[15]_i_1_n_5 ;
  wire \statCyclesWaitingForTriWorkCache_reg[15]_i_1_n_6 ;
  wire \statCyclesWaitingForTriWorkCache_reg[15]_i_1_n_7 ;
  wire \statCyclesWaitingForTriWorkCache_reg[15]_i_1_n_8 ;
  wire \statCyclesWaitingForTriWorkCache_reg[15]_i_1_n_9 ;
  wire \statCyclesWaitingForTriWorkCache_reg[23]_i_1_n_0 ;
  wire \statCyclesWaitingForTriWorkCache_reg[23]_i_1_n_1 ;
  wire \statCyclesWaitingForTriWorkCache_reg[23]_i_1_n_10 ;
  wire \statCyclesWaitingForTriWorkCache_reg[23]_i_1_n_11 ;
  wire \statCyclesWaitingForTriWorkCache_reg[23]_i_1_n_12 ;
  wire \statCyclesWaitingForTriWorkCache_reg[23]_i_1_n_13 ;
  wire \statCyclesWaitingForTriWorkCache_reg[23]_i_1_n_14 ;
  wire \statCyclesWaitingForTriWorkCache_reg[23]_i_1_n_15 ;
  wire \statCyclesWaitingForTriWorkCache_reg[23]_i_1_n_2 ;
  wire \statCyclesWaitingForTriWorkCache_reg[23]_i_1_n_3 ;
  wire \statCyclesWaitingForTriWorkCache_reg[23]_i_1_n_4 ;
  wire \statCyclesWaitingForTriWorkCache_reg[23]_i_1_n_5 ;
  wire \statCyclesWaitingForTriWorkCache_reg[23]_i_1_n_6 ;
  wire \statCyclesWaitingForTriWorkCache_reg[23]_i_1_n_7 ;
  wire \statCyclesWaitingForTriWorkCache_reg[23]_i_1_n_8 ;
  wire \statCyclesWaitingForTriWorkCache_reg[23]_i_1_n_9 ;
  wire \statCyclesWaitingForTriWorkCache_reg[31]_i_2_n_1 ;
  wire \statCyclesWaitingForTriWorkCache_reg[31]_i_2_n_10 ;
  wire \statCyclesWaitingForTriWorkCache_reg[31]_i_2_n_11 ;
  wire \statCyclesWaitingForTriWorkCache_reg[31]_i_2_n_12 ;
  wire \statCyclesWaitingForTriWorkCache_reg[31]_i_2_n_13 ;
  wire \statCyclesWaitingForTriWorkCache_reg[31]_i_2_n_14 ;
  wire \statCyclesWaitingForTriWorkCache_reg[31]_i_2_n_15 ;
  wire \statCyclesWaitingForTriWorkCache_reg[31]_i_2_n_2 ;
  wire \statCyclesWaitingForTriWorkCache_reg[31]_i_2_n_3 ;
  wire \statCyclesWaitingForTriWorkCache_reg[31]_i_2_n_4 ;
  wire \statCyclesWaitingForTriWorkCache_reg[31]_i_2_n_5 ;
  wire \statCyclesWaitingForTriWorkCache_reg[31]_i_2_n_6 ;
  wire \statCyclesWaitingForTriWorkCache_reg[31]_i_2_n_7 ;
  wire \statCyclesWaitingForTriWorkCache_reg[31]_i_2_n_8 ;
  wire \statCyclesWaitingForTriWorkCache_reg[31]_i_2_n_9 ;
  wire \statCyclesWaitingForTriWorkCache_reg[7]_i_1_n_0 ;
  wire \statCyclesWaitingForTriWorkCache_reg[7]_i_1_n_1 ;
  wire \statCyclesWaitingForTriWorkCache_reg[7]_i_1_n_10 ;
  wire \statCyclesWaitingForTriWorkCache_reg[7]_i_1_n_11 ;
  wire \statCyclesWaitingForTriWorkCache_reg[7]_i_1_n_12 ;
  wire \statCyclesWaitingForTriWorkCache_reg[7]_i_1_n_13 ;
  wire \statCyclesWaitingForTriWorkCache_reg[7]_i_1_n_14 ;
  wire \statCyclesWaitingForTriWorkCache_reg[7]_i_1_n_15 ;
  wire \statCyclesWaitingForTriWorkCache_reg[7]_i_1_n_2 ;
  wire \statCyclesWaitingForTriWorkCache_reg[7]_i_1_n_3 ;
  wire \statCyclesWaitingForTriWorkCache_reg[7]_i_1_n_4 ;
  wire \statCyclesWaitingForTriWorkCache_reg[7]_i_1_n_5 ;
  wire \statCyclesWaitingForTriWorkCache_reg[7]_i_1_n_6 ;
  wire \statCyclesWaitingForTriWorkCache_reg[7]_i_1_n_7 ;
  wire \statCyclesWaitingForTriWorkCache_reg[7]_i_1_n_8 ;
  wire \statCyclesWaitingForTriWorkCache_reg[7]_i_1_n_9 ;
  wire [0:0]statCyclesWorking;
  wire \statCyclesWorking[7]_i_2_n_0 ;
  wire \statCyclesWorking_reg[15]_i_1_n_0 ;
  wire \statCyclesWorking_reg[15]_i_1_n_1 ;
  wire \statCyclesWorking_reg[15]_i_1_n_10 ;
  wire \statCyclesWorking_reg[15]_i_1_n_11 ;
  wire \statCyclesWorking_reg[15]_i_1_n_12 ;
  wire \statCyclesWorking_reg[15]_i_1_n_13 ;
  wire \statCyclesWorking_reg[15]_i_1_n_14 ;
  wire \statCyclesWorking_reg[15]_i_1_n_15 ;
  wire \statCyclesWorking_reg[15]_i_1_n_2 ;
  wire \statCyclesWorking_reg[15]_i_1_n_3 ;
  wire \statCyclesWorking_reg[15]_i_1_n_4 ;
  wire \statCyclesWorking_reg[15]_i_1_n_5 ;
  wire \statCyclesWorking_reg[15]_i_1_n_6 ;
  wire \statCyclesWorking_reg[15]_i_1_n_7 ;
  wire \statCyclesWorking_reg[15]_i_1_n_8 ;
  wire \statCyclesWorking_reg[15]_i_1_n_9 ;
  wire \statCyclesWorking_reg[23]_i_1_n_0 ;
  wire \statCyclesWorking_reg[23]_i_1_n_1 ;
  wire \statCyclesWorking_reg[23]_i_1_n_10 ;
  wire \statCyclesWorking_reg[23]_i_1_n_11 ;
  wire \statCyclesWorking_reg[23]_i_1_n_12 ;
  wire \statCyclesWorking_reg[23]_i_1_n_13 ;
  wire \statCyclesWorking_reg[23]_i_1_n_14 ;
  wire \statCyclesWorking_reg[23]_i_1_n_15 ;
  wire \statCyclesWorking_reg[23]_i_1_n_2 ;
  wire \statCyclesWorking_reg[23]_i_1_n_3 ;
  wire \statCyclesWorking_reg[23]_i_1_n_4 ;
  wire \statCyclesWorking_reg[23]_i_1_n_5 ;
  wire \statCyclesWorking_reg[23]_i_1_n_6 ;
  wire \statCyclesWorking_reg[23]_i_1_n_7 ;
  wire \statCyclesWorking_reg[23]_i_1_n_8 ;
  wire \statCyclesWorking_reg[23]_i_1_n_9 ;
  wire \statCyclesWorking_reg[31]_i_2_n_1 ;
  wire \statCyclesWorking_reg[31]_i_2_n_10 ;
  wire \statCyclesWorking_reg[31]_i_2_n_11 ;
  wire \statCyclesWorking_reg[31]_i_2_n_12 ;
  wire \statCyclesWorking_reg[31]_i_2_n_13 ;
  wire \statCyclesWorking_reg[31]_i_2_n_14 ;
  wire \statCyclesWorking_reg[31]_i_2_n_15 ;
  wire \statCyclesWorking_reg[31]_i_2_n_2 ;
  wire \statCyclesWorking_reg[31]_i_2_n_3 ;
  wire \statCyclesWorking_reg[31]_i_2_n_4 ;
  wire \statCyclesWorking_reg[31]_i_2_n_5 ;
  wire \statCyclesWorking_reg[31]_i_2_n_6 ;
  wire \statCyclesWorking_reg[31]_i_2_n_7 ;
  wire \statCyclesWorking_reg[31]_i_2_n_8 ;
  wire \statCyclesWorking_reg[31]_i_2_n_9 ;
  wire \statCyclesWorking_reg[7]_i_1_n_0 ;
  wire \statCyclesWorking_reg[7]_i_1_n_1 ;
  wire \statCyclesWorking_reg[7]_i_1_n_10 ;
  wire \statCyclesWorking_reg[7]_i_1_n_11 ;
  wire \statCyclesWorking_reg[7]_i_1_n_12 ;
  wire \statCyclesWorking_reg[7]_i_1_n_13 ;
  wire \statCyclesWorking_reg[7]_i_1_n_14 ;
  wire \statCyclesWorking_reg[7]_i_1_n_15 ;
  wire \statCyclesWorking_reg[7]_i_1_n_2 ;
  wire \statCyclesWorking_reg[7]_i_1_n_3 ;
  wire \statCyclesWorking_reg[7]_i_1_n_4 ;
  wire \statCyclesWorking_reg[7]_i_1_n_5 ;
  wire \statCyclesWorking_reg[7]_i_1_n_6 ;
  wire \statCyclesWorking_reg[7]_i_1_n_7 ;
  wire \statCyclesWorking_reg[7]_i_1_n_8 ;
  wire \statCyclesWorking_reg[7]_i_1_n_9 ;
  wire [31:0]\vertDataA_reg[Z] ;
  wire [31:0]\vertDataA_reg[color][a] ;
  wire [31:0]\vertDataA_reg[color][b] ;
  wire [31:0]\vertDataA_reg[color][g] ;
  wire [31:0]\vertDataA_reg[color][r] ;
  wire [31:0]\vertDataA_reg[invW] ;
  wire [31:0]\vertDataA_reg[texcoord][tx] ;
  wire [31:0]\vertDataA_reg[texcoord][ty] ;
  wire [31:0]\vertDataB_reg[Z] ;
  wire [31:0]\vertDataB_reg[color][a] ;
  wire [31:0]\vertDataB_reg[color][b] ;
  wire [31:0]\vertDataB_reg[color][g] ;
  wire [31:0]\vertDataB_reg[color][r] ;
  wire [31:0]\vertDataB_reg[invW] ;
  wire [31:0]\vertDataB_reg[texcoord][tx] ;
  wire [31:0]\vertDataB_reg[texcoord][ty] ;
  wire [31:0]\vertDataC_reg[Z] ;
  wire [31:0]\vertDataC_reg[color][a] ;
  wire [31:0]\vertDataC_reg[color][b] ;
  wire [31:0]\vertDataC_reg[color][g] ;
  wire [31:0]\vertDataC_reg[color][r] ;
  wire [31:0]\vertDataC_reg[invW] ;
  wire [31:0]\vertDataC_reg[texcoord][tx] ;
  wire [31:0]\vertDataC_reg[texcoord][ty] ;
  wire [0:0]\writeOutPixelData[barycentricB] ;
  wire \writeOutPixelData[barycentricB][31]_i_3_n_0 ;
  wire \writeOutPixelData[barycentricB][7]_i_2_n_0 ;
  wire \writeOutPixelData[barycentricC][7]_i_2_n_0 ;
  wire [31:0]\writeOutPixelData_reg[barycentricB] ;
  wire \writeOutPixelData_reg[barycentricB][15]_i_1_n_0 ;
  wire \writeOutPixelData_reg[barycentricB][15]_i_1_n_1 ;
  wire \writeOutPixelData_reg[barycentricB][15]_i_1_n_10 ;
  wire \writeOutPixelData_reg[barycentricB][15]_i_1_n_11 ;
  wire \writeOutPixelData_reg[barycentricB][15]_i_1_n_12 ;
  wire \writeOutPixelData_reg[barycentricB][15]_i_1_n_13 ;
  wire \writeOutPixelData_reg[barycentricB][15]_i_1_n_14 ;
  wire \writeOutPixelData_reg[barycentricB][15]_i_1_n_15 ;
  wire \writeOutPixelData_reg[barycentricB][15]_i_1_n_2 ;
  wire \writeOutPixelData_reg[barycentricB][15]_i_1_n_3 ;
  wire \writeOutPixelData_reg[barycentricB][15]_i_1_n_4 ;
  wire \writeOutPixelData_reg[barycentricB][15]_i_1_n_5 ;
  wire \writeOutPixelData_reg[barycentricB][15]_i_1_n_6 ;
  wire \writeOutPixelData_reg[barycentricB][15]_i_1_n_7 ;
  wire \writeOutPixelData_reg[barycentricB][15]_i_1_n_8 ;
  wire \writeOutPixelData_reg[barycentricB][15]_i_1_n_9 ;
  wire \writeOutPixelData_reg[barycentricB][23]_i_1_n_0 ;
  wire \writeOutPixelData_reg[barycentricB][23]_i_1_n_1 ;
  wire \writeOutPixelData_reg[barycentricB][23]_i_1_n_10 ;
  wire \writeOutPixelData_reg[barycentricB][23]_i_1_n_11 ;
  wire \writeOutPixelData_reg[barycentricB][23]_i_1_n_12 ;
  wire \writeOutPixelData_reg[barycentricB][23]_i_1_n_13 ;
  wire \writeOutPixelData_reg[barycentricB][23]_i_1_n_14 ;
  wire \writeOutPixelData_reg[barycentricB][23]_i_1_n_15 ;
  wire \writeOutPixelData_reg[barycentricB][23]_i_1_n_2 ;
  wire \writeOutPixelData_reg[barycentricB][23]_i_1_n_3 ;
  wire \writeOutPixelData_reg[barycentricB][23]_i_1_n_4 ;
  wire \writeOutPixelData_reg[barycentricB][23]_i_1_n_5 ;
  wire \writeOutPixelData_reg[barycentricB][23]_i_1_n_6 ;
  wire \writeOutPixelData_reg[barycentricB][23]_i_1_n_7 ;
  wire \writeOutPixelData_reg[barycentricB][23]_i_1_n_8 ;
  wire \writeOutPixelData_reg[barycentricB][23]_i_1_n_9 ;
  wire \writeOutPixelData_reg[barycentricB][31]_i_2_n_1 ;
  wire \writeOutPixelData_reg[barycentricB][31]_i_2_n_10 ;
  wire \writeOutPixelData_reg[barycentricB][31]_i_2_n_11 ;
  wire \writeOutPixelData_reg[barycentricB][31]_i_2_n_12 ;
  wire \writeOutPixelData_reg[barycentricB][31]_i_2_n_13 ;
  wire \writeOutPixelData_reg[barycentricB][31]_i_2_n_14 ;
  wire \writeOutPixelData_reg[barycentricB][31]_i_2_n_15 ;
  wire \writeOutPixelData_reg[barycentricB][31]_i_2_n_2 ;
  wire \writeOutPixelData_reg[barycentricB][31]_i_2_n_3 ;
  wire \writeOutPixelData_reg[barycentricB][31]_i_2_n_4 ;
  wire \writeOutPixelData_reg[barycentricB][31]_i_2_n_5 ;
  wire \writeOutPixelData_reg[barycentricB][31]_i_2_n_6 ;
  wire \writeOutPixelData_reg[barycentricB][31]_i_2_n_7 ;
  wire \writeOutPixelData_reg[barycentricB][31]_i_2_n_8 ;
  wire \writeOutPixelData_reg[barycentricB][31]_i_2_n_9 ;
  wire \writeOutPixelData_reg[barycentricB][7]_i_1_n_0 ;
  wire \writeOutPixelData_reg[barycentricB][7]_i_1_n_1 ;
  wire \writeOutPixelData_reg[barycentricB][7]_i_1_n_10 ;
  wire \writeOutPixelData_reg[barycentricB][7]_i_1_n_11 ;
  wire \writeOutPixelData_reg[barycentricB][7]_i_1_n_12 ;
  wire \writeOutPixelData_reg[barycentricB][7]_i_1_n_13 ;
  wire \writeOutPixelData_reg[barycentricB][7]_i_1_n_14 ;
  wire \writeOutPixelData_reg[barycentricB][7]_i_1_n_15 ;
  wire \writeOutPixelData_reg[barycentricB][7]_i_1_n_2 ;
  wire \writeOutPixelData_reg[barycentricB][7]_i_1_n_3 ;
  wire \writeOutPixelData_reg[barycentricB][7]_i_1_n_4 ;
  wire \writeOutPixelData_reg[barycentricB][7]_i_1_n_5 ;
  wire \writeOutPixelData_reg[barycentricB][7]_i_1_n_6 ;
  wire \writeOutPixelData_reg[barycentricB][7]_i_1_n_7 ;
  wire \writeOutPixelData_reg[barycentricB][7]_i_1_n_8 ;
  wire \writeOutPixelData_reg[barycentricB][7]_i_1_n_9 ;
  wire [31:0]\writeOutPixelData_reg[barycentricC] ;
  wire \writeOutPixelData_reg[barycentricC][15]_i_1_n_0 ;
  wire \writeOutPixelData_reg[barycentricC][15]_i_1_n_1 ;
  wire \writeOutPixelData_reg[barycentricC][15]_i_1_n_10 ;
  wire \writeOutPixelData_reg[barycentricC][15]_i_1_n_11 ;
  wire \writeOutPixelData_reg[barycentricC][15]_i_1_n_12 ;
  wire \writeOutPixelData_reg[barycentricC][15]_i_1_n_13 ;
  wire \writeOutPixelData_reg[barycentricC][15]_i_1_n_14 ;
  wire \writeOutPixelData_reg[barycentricC][15]_i_1_n_15 ;
  wire \writeOutPixelData_reg[barycentricC][15]_i_1_n_2 ;
  wire \writeOutPixelData_reg[barycentricC][15]_i_1_n_3 ;
  wire \writeOutPixelData_reg[barycentricC][15]_i_1_n_4 ;
  wire \writeOutPixelData_reg[barycentricC][15]_i_1_n_5 ;
  wire \writeOutPixelData_reg[barycentricC][15]_i_1_n_6 ;
  wire \writeOutPixelData_reg[barycentricC][15]_i_1_n_7 ;
  wire \writeOutPixelData_reg[barycentricC][15]_i_1_n_8 ;
  wire \writeOutPixelData_reg[barycentricC][15]_i_1_n_9 ;
  wire \writeOutPixelData_reg[barycentricC][23]_i_1_n_0 ;
  wire \writeOutPixelData_reg[barycentricC][23]_i_1_n_1 ;
  wire \writeOutPixelData_reg[barycentricC][23]_i_1_n_10 ;
  wire \writeOutPixelData_reg[barycentricC][23]_i_1_n_11 ;
  wire \writeOutPixelData_reg[barycentricC][23]_i_1_n_12 ;
  wire \writeOutPixelData_reg[barycentricC][23]_i_1_n_13 ;
  wire \writeOutPixelData_reg[barycentricC][23]_i_1_n_14 ;
  wire \writeOutPixelData_reg[barycentricC][23]_i_1_n_15 ;
  wire \writeOutPixelData_reg[barycentricC][23]_i_1_n_2 ;
  wire \writeOutPixelData_reg[barycentricC][23]_i_1_n_3 ;
  wire \writeOutPixelData_reg[barycentricC][23]_i_1_n_4 ;
  wire \writeOutPixelData_reg[barycentricC][23]_i_1_n_5 ;
  wire \writeOutPixelData_reg[barycentricC][23]_i_1_n_6 ;
  wire \writeOutPixelData_reg[barycentricC][23]_i_1_n_7 ;
  wire \writeOutPixelData_reg[barycentricC][23]_i_1_n_8 ;
  wire \writeOutPixelData_reg[barycentricC][23]_i_1_n_9 ;
  wire \writeOutPixelData_reg[barycentricC][31]_i_1_n_1 ;
  wire \writeOutPixelData_reg[barycentricC][31]_i_1_n_10 ;
  wire \writeOutPixelData_reg[barycentricC][31]_i_1_n_11 ;
  wire \writeOutPixelData_reg[barycentricC][31]_i_1_n_12 ;
  wire \writeOutPixelData_reg[barycentricC][31]_i_1_n_13 ;
  wire \writeOutPixelData_reg[barycentricC][31]_i_1_n_14 ;
  wire \writeOutPixelData_reg[barycentricC][31]_i_1_n_15 ;
  wire \writeOutPixelData_reg[barycentricC][31]_i_1_n_2 ;
  wire \writeOutPixelData_reg[barycentricC][31]_i_1_n_3 ;
  wire \writeOutPixelData_reg[barycentricC][31]_i_1_n_4 ;
  wire \writeOutPixelData_reg[barycentricC][31]_i_1_n_5 ;
  wire \writeOutPixelData_reg[barycentricC][31]_i_1_n_6 ;
  wire \writeOutPixelData_reg[barycentricC][31]_i_1_n_7 ;
  wire \writeOutPixelData_reg[barycentricC][31]_i_1_n_8 ;
  wire \writeOutPixelData_reg[barycentricC][31]_i_1_n_9 ;
  wire \writeOutPixelData_reg[barycentricC][7]_i_1_n_0 ;
  wire \writeOutPixelData_reg[barycentricC][7]_i_1_n_1 ;
  wire \writeOutPixelData_reg[barycentricC][7]_i_1_n_10 ;
  wire \writeOutPixelData_reg[barycentricC][7]_i_1_n_11 ;
  wire \writeOutPixelData_reg[barycentricC][7]_i_1_n_12 ;
  wire \writeOutPixelData_reg[barycentricC][7]_i_1_n_13 ;
  wire \writeOutPixelData_reg[barycentricC][7]_i_1_n_14 ;
  wire \writeOutPixelData_reg[barycentricC][7]_i_1_n_15 ;
  wire \writeOutPixelData_reg[barycentricC][7]_i_1_n_2 ;
  wire \writeOutPixelData_reg[barycentricC][7]_i_1_n_3 ;
  wire \writeOutPixelData_reg[barycentricC][7]_i_1_n_4 ;
  wire \writeOutPixelData_reg[barycentricC][7]_i_1_n_5 ;
  wire \writeOutPixelData_reg[barycentricC][7]_i_1_n_6 ;
  wire \writeOutPixelData_reg[barycentricC][7]_i_1_n_7 ;
  wire \writeOutPixelData_reg[barycentricC][7]_i_1_n_8 ;
  wire \writeOutPixelData_reg[barycentricC][7]_i_1_n_9 ;
  wire [15:0]\writeOutPixelData_reg[pixelX] ;
  wire [15:0]\writeOutPixelData_reg[pixelY] ;
  wire [7:7]\NLW__inferred__0/i__carry__2_CO_UNCONNECTED ;
  wire [7:7]\NLW__inferred__1/i__carry__2_CO_UNCONNECTED ;
  wire [7:7]\NLW__inferred__2/i__carry__2_CO_UNCONNECTED ;
  wire [7:7]NLW_barycentricRowResetA0_carry__2_CO_UNCONNECTED;
  wire [7:7]NLW_barycentricRowResetB0_carry__2_CO_UNCONNECTED;
  wire [7:7]NLW_barycentricRowResetC0_carry__2_CO_UNCONNECTED;
  wire [7:0]NLW_fifoWriteEnable2_carry_O_UNCONNECTED;
  wire [7:0]NLW_pixelXPos1_carry_O_UNCONNECTED;
  wire [7:7]\NLW_statCyclesIdle_reg[31]_i_1_CO_UNCONNECTED ;
  wire [7:7]\NLW_statCyclesWaitingForOutput_reg[31]_i_2_CO_UNCONNECTED ;
  wire [7:7]\NLW_statCyclesWaitingForTriWorkCache_reg[31]_i_2_CO_UNCONNECTED ;
  wire [7:7]\NLW_statCyclesWorking_reg[31]_i_2_CO_UNCONNECTED ;
  wire [7:7]\NLW_writeOutPixelData_reg[barycentricB][31]_i_2_CO_UNCONNECTED ;
  wire [7:7]\NLW_writeOutPixelData_reg[barycentricC][31]_i_1_CO_UNCONNECTED ;

  LUT2 #(
    .INIT(4'h2)) 
    CMD_Rasterizer_Idle_i_1
       (.I0(TRISETUP_readyForNewTri),
        .I1(TRISETUP_newTriBegin),
        .O(CMD_Rasterizer_Idle0));
  FDRE #(
    .INIT(1'b0)) 
    CMD_Rasterizer_Idle_reg
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(CMD_Rasterizer_Idle0),
        .Q(CMD_Rasterizer_Idle),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \STAT_CurrentDrawEventID_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(currentDrawEventID[0]),
        .Q(STAT_CurrentDrawEventID[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \STAT_CurrentDrawEventID_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .D(currentDrawEventID[10]),
        .Q(STAT_CurrentDrawEventID[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \STAT_CurrentDrawEventID_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .D(currentDrawEventID[11]),
        .Q(STAT_CurrentDrawEventID[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \STAT_CurrentDrawEventID_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .D(currentDrawEventID[12]),
        .Q(STAT_CurrentDrawEventID[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \STAT_CurrentDrawEventID_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .D(currentDrawEventID[13]),
        .Q(STAT_CurrentDrawEventID[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \STAT_CurrentDrawEventID_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .D(currentDrawEventID[14]),
        .Q(STAT_CurrentDrawEventID[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \STAT_CurrentDrawEventID_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .D(currentDrawEventID[15]),
        .Q(STAT_CurrentDrawEventID[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \STAT_CurrentDrawEventID_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(currentDrawEventID[1]),
        .Q(STAT_CurrentDrawEventID[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \STAT_CurrentDrawEventID_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(currentDrawEventID[2]),
        .Q(STAT_CurrentDrawEventID[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \STAT_CurrentDrawEventID_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(currentDrawEventID[3]),
        .Q(STAT_CurrentDrawEventID[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \STAT_CurrentDrawEventID_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(currentDrawEventID[4]),
        .Q(STAT_CurrentDrawEventID[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \STAT_CurrentDrawEventID_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(currentDrawEventID[5]),
        .Q(STAT_CurrentDrawEventID[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \STAT_CurrentDrawEventID_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(currentDrawEventID[6]),
        .Q(STAT_CurrentDrawEventID[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \STAT_CurrentDrawEventID_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(currentDrawEventID[7]),
        .Q(STAT_CurrentDrawEventID[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \STAT_CurrentDrawEventID_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .D(currentDrawEventID[8]),
        .Q(STAT_CurrentDrawEventID[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \STAT_CurrentDrawEventID_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .D(currentDrawEventID[9]),
        .Q(STAT_CurrentDrawEventID[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_BarycentricInverse_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(barycentricInverse[0]),
        .Q(TRICACHE_BarycentricInverse[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_BarycentricInverse_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .D(barycentricInverse[10]),
        .Q(TRICACHE_BarycentricInverse[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_BarycentricInverse_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .D(barycentricInverse[11]),
        .Q(TRICACHE_BarycentricInverse[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_BarycentricInverse_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .D(barycentricInverse[12]),
        .Q(TRICACHE_BarycentricInverse[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_BarycentricInverse_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .D(barycentricInverse[13]),
        .Q(TRICACHE_BarycentricInverse[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_BarycentricInverse_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .D(barycentricInverse[14]),
        .Q(TRICACHE_BarycentricInverse[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_BarycentricInverse_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .D(barycentricInverse[15]),
        .Q(TRICACHE_BarycentricInverse[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_BarycentricInverse_reg[16] 
       (.C(clk),
        .CE(1'b1),
        .D(barycentricInverse[16]),
        .Q(TRICACHE_BarycentricInverse[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_BarycentricInverse_reg[17] 
       (.C(clk),
        .CE(1'b1),
        .D(barycentricInverse[17]),
        .Q(TRICACHE_BarycentricInverse[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_BarycentricInverse_reg[18] 
       (.C(clk),
        .CE(1'b1),
        .D(barycentricInverse[18]),
        .Q(TRICACHE_BarycentricInverse[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_BarycentricInverse_reg[19] 
       (.C(clk),
        .CE(1'b1),
        .D(barycentricInverse[19]),
        .Q(TRICACHE_BarycentricInverse[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_BarycentricInverse_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(barycentricInverse[1]),
        .Q(TRICACHE_BarycentricInverse[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_BarycentricInverse_reg[20] 
       (.C(clk),
        .CE(1'b1),
        .D(barycentricInverse[20]),
        .Q(TRICACHE_BarycentricInverse[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_BarycentricInverse_reg[21] 
       (.C(clk),
        .CE(1'b1),
        .D(barycentricInverse[21]),
        .Q(TRICACHE_BarycentricInverse[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_BarycentricInverse_reg[22] 
       (.C(clk),
        .CE(1'b1),
        .D(barycentricInverse[22]),
        .Q(TRICACHE_BarycentricInverse[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_BarycentricInverse_reg[23] 
       (.C(clk),
        .CE(1'b1),
        .D(barycentricInverse[23]),
        .Q(TRICACHE_BarycentricInverse[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_BarycentricInverse_reg[24] 
       (.C(clk),
        .CE(1'b1),
        .D(barycentricInverse[24]),
        .Q(TRICACHE_BarycentricInverse[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_BarycentricInverse_reg[25] 
       (.C(clk),
        .CE(1'b1),
        .D(barycentricInverse[25]),
        .Q(TRICACHE_BarycentricInverse[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_BarycentricInverse_reg[26] 
       (.C(clk),
        .CE(1'b1),
        .D(barycentricInverse[26]),
        .Q(TRICACHE_BarycentricInverse[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_BarycentricInverse_reg[27] 
       (.C(clk),
        .CE(1'b1),
        .D(barycentricInverse[27]),
        .Q(TRICACHE_BarycentricInverse[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_BarycentricInverse_reg[28] 
       (.C(clk),
        .CE(1'b1),
        .D(barycentricInverse[28]),
        .Q(TRICACHE_BarycentricInverse[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_BarycentricInverse_reg[29] 
       (.C(clk),
        .CE(1'b1),
        .D(barycentricInverse[29]),
        .Q(TRICACHE_BarycentricInverse[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_BarycentricInverse_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(barycentricInverse[2]),
        .Q(TRICACHE_BarycentricInverse[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_BarycentricInverse_reg[30] 
       (.C(clk),
        .CE(1'b1),
        .D(barycentricInverse[30]),
        .Q(TRICACHE_BarycentricInverse[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_BarycentricInverse_reg[31] 
       (.C(clk),
        .CE(1'b1),
        .D(barycentricInverse[31]),
        .Q(TRICACHE_BarycentricInverse[31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_BarycentricInverse_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(barycentricInverse[3]),
        .Q(TRICACHE_BarycentricInverse[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_BarycentricInverse_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(barycentricInverse[4]),
        .Q(TRICACHE_BarycentricInverse[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_BarycentricInverse_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(barycentricInverse[5]),
        .Q(TRICACHE_BarycentricInverse[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_BarycentricInverse_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(barycentricInverse[6]),
        .Q(TRICACHE_BarycentricInverse[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_BarycentricInverse_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(barycentricInverse[7]),
        .Q(TRICACHE_BarycentricInverse[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_BarycentricInverse_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .D(barycentricInverse[8]),
        .Q(TRICACHE_BarycentricInverse[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_BarycentricInverse_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .D(barycentricInverse[9]),
        .Q(TRICACHE_BarycentricInverse[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW0_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[invW] [0]),
        .Q(TRICACHE_InvW0[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW0_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[invW] [10]),
        .Q(TRICACHE_InvW0[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW0_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[invW] [11]),
        .Q(TRICACHE_InvW0[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW0_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[invW] [12]),
        .Q(TRICACHE_InvW0[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW0_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[invW] [13]),
        .Q(TRICACHE_InvW0[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW0_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[invW] [14]),
        .Q(TRICACHE_InvW0[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW0_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[invW] [15]),
        .Q(TRICACHE_InvW0[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW0_reg[16] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[invW] [16]),
        .Q(TRICACHE_InvW0[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW0_reg[17] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[invW] [17]),
        .Q(TRICACHE_InvW0[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW0_reg[18] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[invW] [18]),
        .Q(TRICACHE_InvW0[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW0_reg[19] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[invW] [19]),
        .Q(TRICACHE_InvW0[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW0_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[invW] [1]),
        .Q(TRICACHE_InvW0[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW0_reg[20] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[invW] [20]),
        .Q(TRICACHE_InvW0[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW0_reg[21] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[invW] [21]),
        .Q(TRICACHE_InvW0[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW0_reg[22] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[invW] [22]),
        .Q(TRICACHE_InvW0[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW0_reg[23] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[invW] [23]),
        .Q(TRICACHE_InvW0[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW0_reg[24] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[invW] [24]),
        .Q(TRICACHE_InvW0[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW0_reg[25] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[invW] [25]),
        .Q(TRICACHE_InvW0[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW0_reg[26] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[invW] [26]),
        .Q(TRICACHE_InvW0[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW0_reg[27] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[invW] [27]),
        .Q(TRICACHE_InvW0[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW0_reg[28] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[invW] [28]),
        .Q(TRICACHE_InvW0[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW0_reg[29] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[invW] [29]),
        .Q(TRICACHE_InvW0[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW0_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[invW] [2]),
        .Q(TRICACHE_InvW0[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW0_reg[30] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[invW] [30]),
        .Q(TRICACHE_InvW0[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW0_reg[31] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[invW] [31]),
        .Q(TRICACHE_InvW0[31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW0_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[invW] [3]),
        .Q(TRICACHE_InvW0[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW0_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[invW] [4]),
        .Q(TRICACHE_InvW0[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW0_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[invW] [5]),
        .Q(TRICACHE_InvW0[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW0_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[invW] [6]),
        .Q(TRICACHE_InvW0[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW0_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[invW] [7]),
        .Q(TRICACHE_InvW0[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW0_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[invW] [8]),
        .Q(TRICACHE_InvW0[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW0_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[invW] [9]),
        .Q(TRICACHE_InvW0[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW10_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[invW] [0]),
        .Q(TRICACHE_InvW10[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW10_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[invW] [10]),
        .Q(TRICACHE_InvW10[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW10_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[invW] [11]),
        .Q(TRICACHE_InvW10[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW10_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[invW] [12]),
        .Q(TRICACHE_InvW10[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW10_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[invW] [13]),
        .Q(TRICACHE_InvW10[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW10_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[invW] [14]),
        .Q(TRICACHE_InvW10[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW10_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[invW] [15]),
        .Q(TRICACHE_InvW10[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW10_reg[16] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[invW] [16]),
        .Q(TRICACHE_InvW10[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW10_reg[17] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[invW] [17]),
        .Q(TRICACHE_InvW10[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW10_reg[18] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[invW] [18]),
        .Q(TRICACHE_InvW10[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW10_reg[19] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[invW] [19]),
        .Q(TRICACHE_InvW10[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW10_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[invW] [1]),
        .Q(TRICACHE_InvW10[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW10_reg[20] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[invW] [20]),
        .Q(TRICACHE_InvW10[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW10_reg[21] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[invW] [21]),
        .Q(TRICACHE_InvW10[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW10_reg[22] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[invW] [22]),
        .Q(TRICACHE_InvW10[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW10_reg[23] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[invW] [23]),
        .Q(TRICACHE_InvW10[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW10_reg[24] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[invW] [24]),
        .Q(TRICACHE_InvW10[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW10_reg[25] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[invW] [25]),
        .Q(TRICACHE_InvW10[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW10_reg[26] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[invW] [26]),
        .Q(TRICACHE_InvW10[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW10_reg[27] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[invW] [27]),
        .Q(TRICACHE_InvW10[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW10_reg[28] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[invW] [28]),
        .Q(TRICACHE_InvW10[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW10_reg[29] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[invW] [29]),
        .Q(TRICACHE_InvW10[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW10_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[invW] [2]),
        .Q(TRICACHE_InvW10[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW10_reg[30] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[invW] [30]),
        .Q(TRICACHE_InvW10[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW10_reg[31] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[invW] [31]),
        .Q(TRICACHE_InvW10[31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW10_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[invW] [3]),
        .Q(TRICACHE_InvW10[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW10_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[invW] [4]),
        .Q(TRICACHE_InvW10[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW10_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[invW] [5]),
        .Q(TRICACHE_InvW10[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW10_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[invW] [6]),
        .Q(TRICACHE_InvW10[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW10_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[invW] [7]),
        .Q(TRICACHE_InvW10[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW10_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[invW] [8]),
        .Q(TRICACHE_InvW10[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW10_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[invW] [9]),
        .Q(TRICACHE_InvW10[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW20_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[invW] [0]),
        .Q(TRICACHE_InvW20[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW20_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[invW] [10]),
        .Q(TRICACHE_InvW20[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW20_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[invW] [11]),
        .Q(TRICACHE_InvW20[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW20_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[invW] [12]),
        .Q(TRICACHE_InvW20[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW20_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[invW] [13]),
        .Q(TRICACHE_InvW20[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW20_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[invW] [14]),
        .Q(TRICACHE_InvW20[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW20_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[invW] [15]),
        .Q(TRICACHE_InvW20[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW20_reg[16] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[invW] [16]),
        .Q(TRICACHE_InvW20[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW20_reg[17] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[invW] [17]),
        .Q(TRICACHE_InvW20[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW20_reg[18] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[invW] [18]),
        .Q(TRICACHE_InvW20[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW20_reg[19] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[invW] [19]),
        .Q(TRICACHE_InvW20[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW20_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[invW] [1]),
        .Q(TRICACHE_InvW20[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW20_reg[20] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[invW] [20]),
        .Q(TRICACHE_InvW20[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW20_reg[21] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[invW] [21]),
        .Q(TRICACHE_InvW20[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW20_reg[22] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[invW] [22]),
        .Q(TRICACHE_InvW20[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW20_reg[23] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[invW] [23]),
        .Q(TRICACHE_InvW20[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW20_reg[24] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[invW] [24]),
        .Q(TRICACHE_InvW20[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW20_reg[25] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[invW] [25]),
        .Q(TRICACHE_InvW20[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW20_reg[26] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[invW] [26]),
        .Q(TRICACHE_InvW20[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW20_reg[27] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[invW] [27]),
        .Q(TRICACHE_InvW20[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW20_reg[28] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[invW] [28]),
        .Q(TRICACHE_InvW20[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW20_reg[29] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[invW] [29]),
        .Q(TRICACHE_InvW20[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW20_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[invW] [2]),
        .Q(TRICACHE_InvW20[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW20_reg[30] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[invW] [30]),
        .Q(TRICACHE_InvW20[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW20_reg[31] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[invW] [31]),
        .Q(TRICACHE_InvW20[31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW20_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[invW] [3]),
        .Q(TRICACHE_InvW20[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW20_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[invW] [4]),
        .Q(TRICACHE_InvW20[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW20_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[invW] [5]),
        .Q(TRICACHE_InvW20[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW20_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[invW] [6]),
        .Q(TRICACHE_InvW20[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW20_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[invW] [7]),
        .Q(TRICACHE_InvW20[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW20_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[invW] [8]),
        .Q(TRICACHE_InvW20[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_InvW20_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[invW] [9]),
        .Q(TRICACHE_InvW20[9]),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0008)) 
    TRICACHE_PushNewTriData_i_1
       (.I0(currentState__0[1]),
        .I1(currentState__0[0]),
        .I2(TRICACHE_IsFull),
        .I3(currentState__0[2]),
        .O(TRICACHE_PushNewTriData_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    TRICACHE_PushNewTriData_reg
       (.C(clk),
        .CE(1'b1),
        .D(TRICACHE_PushNewTriData_i_1_n_0),
        .Q(TRICACHE_PushNewTriData),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX0_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[texcoord][tx] [0]),
        .Q(TRICACHE_TX0[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX0_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[texcoord][tx] [10]),
        .Q(TRICACHE_TX0[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX0_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[texcoord][tx] [11]),
        .Q(TRICACHE_TX0[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX0_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[texcoord][tx] [12]),
        .Q(TRICACHE_TX0[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX0_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[texcoord][tx] [13]),
        .Q(TRICACHE_TX0[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX0_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[texcoord][tx] [14]),
        .Q(TRICACHE_TX0[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX0_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[texcoord][tx] [15]),
        .Q(TRICACHE_TX0[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX0_reg[16] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[texcoord][tx] [16]),
        .Q(TRICACHE_TX0[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX0_reg[17] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[texcoord][tx] [17]),
        .Q(TRICACHE_TX0[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX0_reg[18] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[texcoord][tx] [18]),
        .Q(TRICACHE_TX0[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX0_reg[19] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[texcoord][tx] [19]),
        .Q(TRICACHE_TX0[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX0_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[texcoord][tx] [1]),
        .Q(TRICACHE_TX0[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX0_reg[20] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[texcoord][tx] [20]),
        .Q(TRICACHE_TX0[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX0_reg[21] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[texcoord][tx] [21]),
        .Q(TRICACHE_TX0[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX0_reg[22] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[texcoord][tx] [22]),
        .Q(TRICACHE_TX0[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX0_reg[23] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[texcoord][tx] [23]),
        .Q(TRICACHE_TX0[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX0_reg[24] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[texcoord][tx] [24]),
        .Q(TRICACHE_TX0[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX0_reg[25] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[texcoord][tx] [25]),
        .Q(TRICACHE_TX0[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX0_reg[26] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[texcoord][tx] [26]),
        .Q(TRICACHE_TX0[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX0_reg[27] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[texcoord][tx] [27]),
        .Q(TRICACHE_TX0[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX0_reg[28] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[texcoord][tx] [28]),
        .Q(TRICACHE_TX0[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX0_reg[29] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[texcoord][tx] [29]),
        .Q(TRICACHE_TX0[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX0_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[texcoord][tx] [2]),
        .Q(TRICACHE_TX0[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX0_reg[30] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[texcoord][tx] [30]),
        .Q(TRICACHE_TX0[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX0_reg[31] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[texcoord][tx] [31]),
        .Q(TRICACHE_TX0[31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX0_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[texcoord][tx] [3]),
        .Q(TRICACHE_TX0[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX0_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[texcoord][tx] [4]),
        .Q(TRICACHE_TX0[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX0_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[texcoord][tx] [5]),
        .Q(TRICACHE_TX0[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX0_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[texcoord][tx] [6]),
        .Q(TRICACHE_TX0[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX0_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[texcoord][tx] [7]),
        .Q(TRICACHE_TX0[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX0_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[texcoord][tx] [8]),
        .Q(TRICACHE_TX0[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX0_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[texcoord][tx] [9]),
        .Q(TRICACHE_TX0[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX10_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[texcoord][tx] [0]),
        .Q(TRICACHE_TX10[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX10_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[texcoord][tx] [10]),
        .Q(TRICACHE_TX10[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX10_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[texcoord][tx] [11]),
        .Q(TRICACHE_TX10[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX10_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[texcoord][tx] [12]),
        .Q(TRICACHE_TX10[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX10_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[texcoord][tx] [13]),
        .Q(TRICACHE_TX10[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX10_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[texcoord][tx] [14]),
        .Q(TRICACHE_TX10[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX10_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[texcoord][tx] [15]),
        .Q(TRICACHE_TX10[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX10_reg[16] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[texcoord][tx] [16]),
        .Q(TRICACHE_TX10[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX10_reg[17] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[texcoord][tx] [17]),
        .Q(TRICACHE_TX10[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX10_reg[18] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[texcoord][tx] [18]),
        .Q(TRICACHE_TX10[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX10_reg[19] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[texcoord][tx] [19]),
        .Q(TRICACHE_TX10[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX10_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[texcoord][tx] [1]),
        .Q(TRICACHE_TX10[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX10_reg[20] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[texcoord][tx] [20]),
        .Q(TRICACHE_TX10[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX10_reg[21] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[texcoord][tx] [21]),
        .Q(TRICACHE_TX10[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX10_reg[22] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[texcoord][tx] [22]),
        .Q(TRICACHE_TX10[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX10_reg[23] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[texcoord][tx] [23]),
        .Q(TRICACHE_TX10[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX10_reg[24] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[texcoord][tx] [24]),
        .Q(TRICACHE_TX10[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX10_reg[25] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[texcoord][tx] [25]),
        .Q(TRICACHE_TX10[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX10_reg[26] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[texcoord][tx] [26]),
        .Q(TRICACHE_TX10[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX10_reg[27] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[texcoord][tx] [27]),
        .Q(TRICACHE_TX10[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX10_reg[28] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[texcoord][tx] [28]),
        .Q(TRICACHE_TX10[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX10_reg[29] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[texcoord][tx] [29]),
        .Q(TRICACHE_TX10[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX10_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[texcoord][tx] [2]),
        .Q(TRICACHE_TX10[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX10_reg[30] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[texcoord][tx] [30]),
        .Q(TRICACHE_TX10[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX10_reg[31] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[texcoord][tx] [31]),
        .Q(TRICACHE_TX10[31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX10_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[texcoord][tx] [3]),
        .Q(TRICACHE_TX10[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX10_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[texcoord][tx] [4]),
        .Q(TRICACHE_TX10[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX10_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[texcoord][tx] [5]),
        .Q(TRICACHE_TX10[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX10_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[texcoord][tx] [6]),
        .Q(TRICACHE_TX10[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX10_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[texcoord][tx] [7]),
        .Q(TRICACHE_TX10[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX10_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[texcoord][tx] [8]),
        .Q(TRICACHE_TX10[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX10_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[texcoord][tx] [9]),
        .Q(TRICACHE_TX10[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX20_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[texcoord][tx] [0]),
        .Q(TRICACHE_TX20[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX20_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[texcoord][tx] [10]),
        .Q(TRICACHE_TX20[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX20_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[texcoord][tx] [11]),
        .Q(TRICACHE_TX20[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX20_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[texcoord][tx] [12]),
        .Q(TRICACHE_TX20[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX20_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[texcoord][tx] [13]),
        .Q(TRICACHE_TX20[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX20_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[texcoord][tx] [14]),
        .Q(TRICACHE_TX20[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX20_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[texcoord][tx] [15]),
        .Q(TRICACHE_TX20[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX20_reg[16] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[texcoord][tx] [16]),
        .Q(TRICACHE_TX20[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX20_reg[17] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[texcoord][tx] [17]),
        .Q(TRICACHE_TX20[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX20_reg[18] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[texcoord][tx] [18]),
        .Q(TRICACHE_TX20[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX20_reg[19] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[texcoord][tx] [19]),
        .Q(TRICACHE_TX20[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX20_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[texcoord][tx] [1]),
        .Q(TRICACHE_TX20[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX20_reg[20] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[texcoord][tx] [20]),
        .Q(TRICACHE_TX20[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX20_reg[21] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[texcoord][tx] [21]),
        .Q(TRICACHE_TX20[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX20_reg[22] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[texcoord][tx] [22]),
        .Q(TRICACHE_TX20[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX20_reg[23] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[texcoord][tx] [23]),
        .Q(TRICACHE_TX20[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX20_reg[24] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[texcoord][tx] [24]),
        .Q(TRICACHE_TX20[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX20_reg[25] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[texcoord][tx] [25]),
        .Q(TRICACHE_TX20[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX20_reg[26] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[texcoord][tx] [26]),
        .Q(TRICACHE_TX20[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX20_reg[27] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[texcoord][tx] [27]),
        .Q(TRICACHE_TX20[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX20_reg[28] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[texcoord][tx] [28]),
        .Q(TRICACHE_TX20[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX20_reg[29] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[texcoord][tx] [29]),
        .Q(TRICACHE_TX20[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX20_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[texcoord][tx] [2]),
        .Q(TRICACHE_TX20[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX20_reg[30] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[texcoord][tx] [30]),
        .Q(TRICACHE_TX20[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX20_reg[31] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[texcoord][tx] [31]),
        .Q(TRICACHE_TX20[31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX20_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[texcoord][tx] [3]),
        .Q(TRICACHE_TX20[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX20_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[texcoord][tx] [4]),
        .Q(TRICACHE_TX20[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX20_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[texcoord][tx] [5]),
        .Q(TRICACHE_TX20[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX20_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[texcoord][tx] [6]),
        .Q(TRICACHE_TX20[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX20_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[texcoord][tx] [7]),
        .Q(TRICACHE_TX20[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX20_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[texcoord][tx] [8]),
        .Q(TRICACHE_TX20[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TX20_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[texcoord][tx] [9]),
        .Q(TRICACHE_TX20[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY0_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[texcoord][ty] [0]),
        .Q(TRICACHE_TY0[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY0_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[texcoord][ty] [10]),
        .Q(TRICACHE_TY0[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY0_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[texcoord][ty] [11]),
        .Q(TRICACHE_TY0[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY0_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[texcoord][ty] [12]),
        .Q(TRICACHE_TY0[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY0_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[texcoord][ty] [13]),
        .Q(TRICACHE_TY0[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY0_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[texcoord][ty] [14]),
        .Q(TRICACHE_TY0[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY0_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[texcoord][ty] [15]),
        .Q(TRICACHE_TY0[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY0_reg[16] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[texcoord][ty] [16]),
        .Q(TRICACHE_TY0[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY0_reg[17] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[texcoord][ty] [17]),
        .Q(TRICACHE_TY0[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY0_reg[18] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[texcoord][ty] [18]),
        .Q(TRICACHE_TY0[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY0_reg[19] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[texcoord][ty] [19]),
        .Q(TRICACHE_TY0[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY0_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[texcoord][ty] [1]),
        .Q(TRICACHE_TY0[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY0_reg[20] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[texcoord][ty] [20]),
        .Q(TRICACHE_TY0[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY0_reg[21] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[texcoord][ty] [21]),
        .Q(TRICACHE_TY0[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY0_reg[22] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[texcoord][ty] [22]),
        .Q(TRICACHE_TY0[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY0_reg[23] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[texcoord][ty] [23]),
        .Q(TRICACHE_TY0[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY0_reg[24] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[texcoord][ty] [24]),
        .Q(TRICACHE_TY0[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY0_reg[25] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[texcoord][ty] [25]),
        .Q(TRICACHE_TY0[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY0_reg[26] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[texcoord][ty] [26]),
        .Q(TRICACHE_TY0[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY0_reg[27] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[texcoord][ty] [27]),
        .Q(TRICACHE_TY0[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY0_reg[28] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[texcoord][ty] [28]),
        .Q(TRICACHE_TY0[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY0_reg[29] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[texcoord][ty] [29]),
        .Q(TRICACHE_TY0[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY0_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[texcoord][ty] [2]),
        .Q(TRICACHE_TY0[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY0_reg[30] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[texcoord][ty] [30]),
        .Q(TRICACHE_TY0[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY0_reg[31] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[texcoord][ty] [31]),
        .Q(TRICACHE_TY0[31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY0_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[texcoord][ty] [3]),
        .Q(TRICACHE_TY0[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY0_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[texcoord][ty] [4]),
        .Q(TRICACHE_TY0[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY0_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[texcoord][ty] [5]),
        .Q(TRICACHE_TY0[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY0_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[texcoord][ty] [6]),
        .Q(TRICACHE_TY0[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY0_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[texcoord][ty] [7]),
        .Q(TRICACHE_TY0[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY0_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[texcoord][ty] [8]),
        .Q(TRICACHE_TY0[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY0_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[texcoord][ty] [9]),
        .Q(TRICACHE_TY0[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY10_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[texcoord][ty] [0]),
        .Q(TRICACHE_TY10[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY10_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[texcoord][ty] [10]),
        .Q(TRICACHE_TY10[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY10_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[texcoord][ty] [11]),
        .Q(TRICACHE_TY10[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY10_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[texcoord][ty] [12]),
        .Q(TRICACHE_TY10[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY10_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[texcoord][ty] [13]),
        .Q(TRICACHE_TY10[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY10_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[texcoord][ty] [14]),
        .Q(TRICACHE_TY10[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY10_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[texcoord][ty] [15]),
        .Q(TRICACHE_TY10[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY10_reg[16] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[texcoord][ty] [16]),
        .Q(TRICACHE_TY10[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY10_reg[17] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[texcoord][ty] [17]),
        .Q(TRICACHE_TY10[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY10_reg[18] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[texcoord][ty] [18]),
        .Q(TRICACHE_TY10[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY10_reg[19] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[texcoord][ty] [19]),
        .Q(TRICACHE_TY10[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY10_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[texcoord][ty] [1]),
        .Q(TRICACHE_TY10[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY10_reg[20] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[texcoord][ty] [20]),
        .Q(TRICACHE_TY10[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY10_reg[21] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[texcoord][ty] [21]),
        .Q(TRICACHE_TY10[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY10_reg[22] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[texcoord][ty] [22]),
        .Q(TRICACHE_TY10[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY10_reg[23] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[texcoord][ty] [23]),
        .Q(TRICACHE_TY10[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY10_reg[24] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[texcoord][ty] [24]),
        .Q(TRICACHE_TY10[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY10_reg[25] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[texcoord][ty] [25]),
        .Q(TRICACHE_TY10[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY10_reg[26] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[texcoord][ty] [26]),
        .Q(TRICACHE_TY10[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY10_reg[27] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[texcoord][ty] [27]),
        .Q(TRICACHE_TY10[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY10_reg[28] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[texcoord][ty] [28]),
        .Q(TRICACHE_TY10[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY10_reg[29] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[texcoord][ty] [29]),
        .Q(TRICACHE_TY10[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY10_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[texcoord][ty] [2]),
        .Q(TRICACHE_TY10[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY10_reg[30] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[texcoord][ty] [30]),
        .Q(TRICACHE_TY10[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY10_reg[31] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[texcoord][ty] [31]),
        .Q(TRICACHE_TY10[31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY10_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[texcoord][ty] [3]),
        .Q(TRICACHE_TY10[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY10_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[texcoord][ty] [4]),
        .Q(TRICACHE_TY10[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY10_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[texcoord][ty] [5]),
        .Q(TRICACHE_TY10[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY10_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[texcoord][ty] [6]),
        .Q(TRICACHE_TY10[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY10_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[texcoord][ty] [7]),
        .Q(TRICACHE_TY10[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY10_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[texcoord][ty] [8]),
        .Q(TRICACHE_TY10[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY10_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[texcoord][ty] [9]),
        .Q(TRICACHE_TY10[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY20_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[texcoord][ty] [0]),
        .Q(TRICACHE_TY20[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY20_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[texcoord][ty] [10]),
        .Q(TRICACHE_TY20[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY20_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[texcoord][ty] [11]),
        .Q(TRICACHE_TY20[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY20_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[texcoord][ty] [12]),
        .Q(TRICACHE_TY20[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY20_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[texcoord][ty] [13]),
        .Q(TRICACHE_TY20[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY20_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[texcoord][ty] [14]),
        .Q(TRICACHE_TY20[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY20_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[texcoord][ty] [15]),
        .Q(TRICACHE_TY20[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY20_reg[16] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[texcoord][ty] [16]),
        .Q(TRICACHE_TY20[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY20_reg[17] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[texcoord][ty] [17]),
        .Q(TRICACHE_TY20[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY20_reg[18] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[texcoord][ty] [18]),
        .Q(TRICACHE_TY20[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY20_reg[19] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[texcoord][ty] [19]),
        .Q(TRICACHE_TY20[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY20_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[texcoord][ty] [1]),
        .Q(TRICACHE_TY20[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY20_reg[20] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[texcoord][ty] [20]),
        .Q(TRICACHE_TY20[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY20_reg[21] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[texcoord][ty] [21]),
        .Q(TRICACHE_TY20[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY20_reg[22] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[texcoord][ty] [22]),
        .Q(TRICACHE_TY20[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY20_reg[23] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[texcoord][ty] [23]),
        .Q(TRICACHE_TY20[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY20_reg[24] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[texcoord][ty] [24]),
        .Q(TRICACHE_TY20[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY20_reg[25] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[texcoord][ty] [25]),
        .Q(TRICACHE_TY20[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY20_reg[26] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[texcoord][ty] [26]),
        .Q(TRICACHE_TY20[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY20_reg[27] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[texcoord][ty] [27]),
        .Q(TRICACHE_TY20[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY20_reg[28] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[texcoord][ty] [28]),
        .Q(TRICACHE_TY20[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY20_reg[29] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[texcoord][ty] [29]),
        .Q(TRICACHE_TY20[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY20_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[texcoord][ty] [2]),
        .Q(TRICACHE_TY20[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY20_reg[30] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[texcoord][ty] [30]),
        .Q(TRICACHE_TY20[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY20_reg[31] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[texcoord][ty] [31]),
        .Q(TRICACHE_TY20[31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY20_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[texcoord][ty] [3]),
        .Q(TRICACHE_TY20[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY20_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[texcoord][ty] [4]),
        .Q(TRICACHE_TY20[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY20_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[texcoord][ty] [5]),
        .Q(TRICACHE_TY20[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY20_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[texcoord][ty] [6]),
        .Q(TRICACHE_TY20[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY20_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[texcoord][ty] [7]),
        .Q(TRICACHE_TY20[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY20_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[texcoord][ty] [8]),
        .Q(TRICACHE_TY20[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_TY20_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[texcoord][ty] [9]),
        .Q(TRICACHE_TY20[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][r] [0]),
        .Q(TRICACHE_VertColor0[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[100] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][a] [4]),
        .Q(TRICACHE_VertColor0[100]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[101] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][a] [5]),
        .Q(TRICACHE_VertColor0[101]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[102] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][a] [6]),
        .Q(TRICACHE_VertColor0[102]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[103] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][a] [7]),
        .Q(TRICACHE_VertColor0[103]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[104] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][a] [8]),
        .Q(TRICACHE_VertColor0[104]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[105] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][a] [9]),
        .Q(TRICACHE_VertColor0[105]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[106] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][a] [10]),
        .Q(TRICACHE_VertColor0[106]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[107] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][a] [11]),
        .Q(TRICACHE_VertColor0[107]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[108] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][a] [12]),
        .Q(TRICACHE_VertColor0[108]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[109] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][a] [13]),
        .Q(TRICACHE_VertColor0[109]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][r] [10]),
        .Q(TRICACHE_VertColor0[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[110] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][a] [14]),
        .Q(TRICACHE_VertColor0[110]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[111] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][a] [15]),
        .Q(TRICACHE_VertColor0[111]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[112] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][a] [16]),
        .Q(TRICACHE_VertColor0[112]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[113] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][a] [17]),
        .Q(TRICACHE_VertColor0[113]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[114] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][a] [18]),
        .Q(TRICACHE_VertColor0[114]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[115] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][a] [19]),
        .Q(TRICACHE_VertColor0[115]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[116] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][a] [20]),
        .Q(TRICACHE_VertColor0[116]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[117] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][a] [21]),
        .Q(TRICACHE_VertColor0[117]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[118] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][a] [22]),
        .Q(TRICACHE_VertColor0[118]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[119] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][a] [23]),
        .Q(TRICACHE_VertColor0[119]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][r] [11]),
        .Q(TRICACHE_VertColor0[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[120] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][a] [24]),
        .Q(TRICACHE_VertColor0[120]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[121] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][a] [25]),
        .Q(TRICACHE_VertColor0[121]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[122] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][a] [26]),
        .Q(TRICACHE_VertColor0[122]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[123] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][a] [27]),
        .Q(TRICACHE_VertColor0[123]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[124] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][a] [28]),
        .Q(TRICACHE_VertColor0[124]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[125] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][a] [29]),
        .Q(TRICACHE_VertColor0[125]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[126] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][a] [30]),
        .Q(TRICACHE_VertColor0[126]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[127] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][a] [31]),
        .Q(TRICACHE_VertColor0[127]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][r] [12]),
        .Q(TRICACHE_VertColor0[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][r] [13]),
        .Q(TRICACHE_VertColor0[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][r] [14]),
        .Q(TRICACHE_VertColor0[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][r] [15]),
        .Q(TRICACHE_VertColor0[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[16] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][r] [16]),
        .Q(TRICACHE_VertColor0[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[17] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][r] [17]),
        .Q(TRICACHE_VertColor0[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[18] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][r] [18]),
        .Q(TRICACHE_VertColor0[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[19] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][r] [19]),
        .Q(TRICACHE_VertColor0[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][r] [1]),
        .Q(TRICACHE_VertColor0[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[20] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][r] [20]),
        .Q(TRICACHE_VertColor0[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[21] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][r] [21]),
        .Q(TRICACHE_VertColor0[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[22] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][r] [22]),
        .Q(TRICACHE_VertColor0[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[23] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][r] [23]),
        .Q(TRICACHE_VertColor0[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[24] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][r] [24]),
        .Q(TRICACHE_VertColor0[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[25] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][r] [25]),
        .Q(TRICACHE_VertColor0[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[26] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][r] [26]),
        .Q(TRICACHE_VertColor0[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[27] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][r] [27]),
        .Q(TRICACHE_VertColor0[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[28] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][r] [28]),
        .Q(TRICACHE_VertColor0[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[29] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][r] [29]),
        .Q(TRICACHE_VertColor0[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][r] [2]),
        .Q(TRICACHE_VertColor0[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[30] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][r] [30]),
        .Q(TRICACHE_VertColor0[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[31] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][r] [31]),
        .Q(TRICACHE_VertColor0[31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[32] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][g] [0]),
        .Q(TRICACHE_VertColor0[32]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[33] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][g] [1]),
        .Q(TRICACHE_VertColor0[33]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[34] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][g] [2]),
        .Q(TRICACHE_VertColor0[34]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[35] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][g] [3]),
        .Q(TRICACHE_VertColor0[35]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[36] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][g] [4]),
        .Q(TRICACHE_VertColor0[36]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[37] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][g] [5]),
        .Q(TRICACHE_VertColor0[37]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[38] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][g] [6]),
        .Q(TRICACHE_VertColor0[38]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[39] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][g] [7]),
        .Q(TRICACHE_VertColor0[39]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][r] [3]),
        .Q(TRICACHE_VertColor0[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[40] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][g] [8]),
        .Q(TRICACHE_VertColor0[40]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[41] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][g] [9]),
        .Q(TRICACHE_VertColor0[41]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[42] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][g] [10]),
        .Q(TRICACHE_VertColor0[42]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[43] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][g] [11]),
        .Q(TRICACHE_VertColor0[43]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[44] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][g] [12]),
        .Q(TRICACHE_VertColor0[44]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[45] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][g] [13]),
        .Q(TRICACHE_VertColor0[45]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[46] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][g] [14]),
        .Q(TRICACHE_VertColor0[46]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[47] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][g] [15]),
        .Q(TRICACHE_VertColor0[47]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[48] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][g] [16]),
        .Q(TRICACHE_VertColor0[48]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[49] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][g] [17]),
        .Q(TRICACHE_VertColor0[49]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][r] [4]),
        .Q(TRICACHE_VertColor0[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[50] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][g] [18]),
        .Q(TRICACHE_VertColor0[50]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[51] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][g] [19]),
        .Q(TRICACHE_VertColor0[51]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[52] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][g] [20]),
        .Q(TRICACHE_VertColor0[52]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[53] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][g] [21]),
        .Q(TRICACHE_VertColor0[53]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[54] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][g] [22]),
        .Q(TRICACHE_VertColor0[54]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[55] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][g] [23]),
        .Q(TRICACHE_VertColor0[55]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[56] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][g] [24]),
        .Q(TRICACHE_VertColor0[56]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[57] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][g] [25]),
        .Q(TRICACHE_VertColor0[57]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[58] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][g] [26]),
        .Q(TRICACHE_VertColor0[58]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[59] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][g] [27]),
        .Q(TRICACHE_VertColor0[59]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][r] [5]),
        .Q(TRICACHE_VertColor0[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[60] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][g] [28]),
        .Q(TRICACHE_VertColor0[60]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[61] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][g] [29]),
        .Q(TRICACHE_VertColor0[61]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[62] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][g] [30]),
        .Q(TRICACHE_VertColor0[62]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[63] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][g] [31]),
        .Q(TRICACHE_VertColor0[63]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[64] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][b] [0]),
        .Q(TRICACHE_VertColor0[64]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[65] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][b] [1]),
        .Q(TRICACHE_VertColor0[65]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[66] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][b] [2]),
        .Q(TRICACHE_VertColor0[66]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[67] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][b] [3]),
        .Q(TRICACHE_VertColor0[67]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[68] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][b] [4]),
        .Q(TRICACHE_VertColor0[68]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[69] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][b] [5]),
        .Q(TRICACHE_VertColor0[69]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][r] [6]),
        .Q(TRICACHE_VertColor0[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[70] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][b] [6]),
        .Q(TRICACHE_VertColor0[70]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[71] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][b] [7]),
        .Q(TRICACHE_VertColor0[71]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[72] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][b] [8]),
        .Q(TRICACHE_VertColor0[72]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[73] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][b] [9]),
        .Q(TRICACHE_VertColor0[73]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[74] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][b] [10]),
        .Q(TRICACHE_VertColor0[74]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[75] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][b] [11]),
        .Q(TRICACHE_VertColor0[75]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[76] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][b] [12]),
        .Q(TRICACHE_VertColor0[76]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[77] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][b] [13]),
        .Q(TRICACHE_VertColor0[77]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[78] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][b] [14]),
        .Q(TRICACHE_VertColor0[78]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[79] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][b] [15]),
        .Q(TRICACHE_VertColor0[79]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][r] [7]),
        .Q(TRICACHE_VertColor0[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[80] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][b] [16]),
        .Q(TRICACHE_VertColor0[80]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[81] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][b] [17]),
        .Q(TRICACHE_VertColor0[81]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[82] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][b] [18]),
        .Q(TRICACHE_VertColor0[82]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[83] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][b] [19]),
        .Q(TRICACHE_VertColor0[83]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[84] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][b] [20]),
        .Q(TRICACHE_VertColor0[84]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[85] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][b] [21]),
        .Q(TRICACHE_VertColor0[85]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[86] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][b] [22]),
        .Q(TRICACHE_VertColor0[86]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[87] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][b] [23]),
        .Q(TRICACHE_VertColor0[87]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[88] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][b] [24]),
        .Q(TRICACHE_VertColor0[88]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[89] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][b] [25]),
        .Q(TRICACHE_VertColor0[89]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][r] [8]),
        .Q(TRICACHE_VertColor0[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[90] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][b] [26]),
        .Q(TRICACHE_VertColor0[90]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[91] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][b] [27]),
        .Q(TRICACHE_VertColor0[91]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[92] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][b] [28]),
        .Q(TRICACHE_VertColor0[92]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[93] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][b] [29]),
        .Q(TRICACHE_VertColor0[93]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[94] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][b] [30]),
        .Q(TRICACHE_VertColor0[94]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[95] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][b] [31]),
        .Q(TRICACHE_VertColor0[95]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[96] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][a] [0]),
        .Q(TRICACHE_VertColor0[96]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[97] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][a] [1]),
        .Q(TRICACHE_VertColor0[97]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[98] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][a] [2]),
        .Q(TRICACHE_VertColor0[98]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[99] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][a] [3]),
        .Q(TRICACHE_VertColor0[99]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor0_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[color][r] [9]),
        .Q(TRICACHE_VertColor0[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][r] [0]),
        .Q(TRICACHE_VertColor10[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[100] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][a] [4]),
        .Q(TRICACHE_VertColor10[100]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[101] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][a] [5]),
        .Q(TRICACHE_VertColor10[101]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[102] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][a] [6]),
        .Q(TRICACHE_VertColor10[102]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[103] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][a] [7]),
        .Q(TRICACHE_VertColor10[103]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[104] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][a] [8]),
        .Q(TRICACHE_VertColor10[104]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[105] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][a] [9]),
        .Q(TRICACHE_VertColor10[105]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[106] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][a] [10]),
        .Q(TRICACHE_VertColor10[106]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[107] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][a] [11]),
        .Q(TRICACHE_VertColor10[107]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[108] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][a] [12]),
        .Q(TRICACHE_VertColor10[108]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[109] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][a] [13]),
        .Q(TRICACHE_VertColor10[109]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][r] [10]),
        .Q(TRICACHE_VertColor10[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[110] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][a] [14]),
        .Q(TRICACHE_VertColor10[110]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[111] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][a] [15]),
        .Q(TRICACHE_VertColor10[111]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[112] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][a] [16]),
        .Q(TRICACHE_VertColor10[112]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[113] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][a] [17]),
        .Q(TRICACHE_VertColor10[113]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[114] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][a] [18]),
        .Q(TRICACHE_VertColor10[114]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[115] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][a] [19]),
        .Q(TRICACHE_VertColor10[115]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[116] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][a] [20]),
        .Q(TRICACHE_VertColor10[116]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[117] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][a] [21]),
        .Q(TRICACHE_VertColor10[117]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[118] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][a] [22]),
        .Q(TRICACHE_VertColor10[118]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[119] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][a] [23]),
        .Q(TRICACHE_VertColor10[119]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][r] [11]),
        .Q(TRICACHE_VertColor10[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[120] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][a] [24]),
        .Q(TRICACHE_VertColor10[120]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[121] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][a] [25]),
        .Q(TRICACHE_VertColor10[121]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[122] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][a] [26]),
        .Q(TRICACHE_VertColor10[122]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[123] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][a] [27]),
        .Q(TRICACHE_VertColor10[123]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[124] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][a] [28]),
        .Q(TRICACHE_VertColor10[124]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[125] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][a] [29]),
        .Q(TRICACHE_VertColor10[125]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[126] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][a] [30]),
        .Q(TRICACHE_VertColor10[126]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[127] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][a] [31]),
        .Q(TRICACHE_VertColor10[127]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][r] [12]),
        .Q(TRICACHE_VertColor10[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][r] [13]),
        .Q(TRICACHE_VertColor10[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][r] [14]),
        .Q(TRICACHE_VertColor10[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][r] [15]),
        .Q(TRICACHE_VertColor10[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[16] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][r] [16]),
        .Q(TRICACHE_VertColor10[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[17] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][r] [17]),
        .Q(TRICACHE_VertColor10[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[18] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][r] [18]),
        .Q(TRICACHE_VertColor10[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[19] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][r] [19]),
        .Q(TRICACHE_VertColor10[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][r] [1]),
        .Q(TRICACHE_VertColor10[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[20] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][r] [20]),
        .Q(TRICACHE_VertColor10[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[21] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][r] [21]),
        .Q(TRICACHE_VertColor10[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[22] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][r] [22]),
        .Q(TRICACHE_VertColor10[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[23] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][r] [23]),
        .Q(TRICACHE_VertColor10[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[24] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][r] [24]),
        .Q(TRICACHE_VertColor10[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[25] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][r] [25]),
        .Q(TRICACHE_VertColor10[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[26] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][r] [26]),
        .Q(TRICACHE_VertColor10[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[27] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][r] [27]),
        .Q(TRICACHE_VertColor10[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[28] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][r] [28]),
        .Q(TRICACHE_VertColor10[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[29] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][r] [29]),
        .Q(TRICACHE_VertColor10[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][r] [2]),
        .Q(TRICACHE_VertColor10[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[30] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][r] [30]),
        .Q(TRICACHE_VertColor10[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[31] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][r] [31]),
        .Q(TRICACHE_VertColor10[31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[32] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][g] [0]),
        .Q(TRICACHE_VertColor10[32]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[33] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][g] [1]),
        .Q(TRICACHE_VertColor10[33]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[34] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][g] [2]),
        .Q(TRICACHE_VertColor10[34]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[35] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][g] [3]),
        .Q(TRICACHE_VertColor10[35]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[36] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][g] [4]),
        .Q(TRICACHE_VertColor10[36]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[37] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][g] [5]),
        .Q(TRICACHE_VertColor10[37]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[38] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][g] [6]),
        .Q(TRICACHE_VertColor10[38]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[39] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][g] [7]),
        .Q(TRICACHE_VertColor10[39]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][r] [3]),
        .Q(TRICACHE_VertColor10[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[40] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][g] [8]),
        .Q(TRICACHE_VertColor10[40]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[41] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][g] [9]),
        .Q(TRICACHE_VertColor10[41]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[42] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][g] [10]),
        .Q(TRICACHE_VertColor10[42]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[43] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][g] [11]),
        .Q(TRICACHE_VertColor10[43]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[44] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][g] [12]),
        .Q(TRICACHE_VertColor10[44]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[45] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][g] [13]),
        .Q(TRICACHE_VertColor10[45]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[46] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][g] [14]),
        .Q(TRICACHE_VertColor10[46]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[47] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][g] [15]),
        .Q(TRICACHE_VertColor10[47]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[48] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][g] [16]),
        .Q(TRICACHE_VertColor10[48]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[49] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][g] [17]),
        .Q(TRICACHE_VertColor10[49]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][r] [4]),
        .Q(TRICACHE_VertColor10[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[50] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][g] [18]),
        .Q(TRICACHE_VertColor10[50]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[51] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][g] [19]),
        .Q(TRICACHE_VertColor10[51]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[52] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][g] [20]),
        .Q(TRICACHE_VertColor10[52]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[53] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][g] [21]),
        .Q(TRICACHE_VertColor10[53]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[54] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][g] [22]),
        .Q(TRICACHE_VertColor10[54]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[55] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][g] [23]),
        .Q(TRICACHE_VertColor10[55]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[56] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][g] [24]),
        .Q(TRICACHE_VertColor10[56]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[57] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][g] [25]),
        .Q(TRICACHE_VertColor10[57]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[58] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][g] [26]),
        .Q(TRICACHE_VertColor10[58]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[59] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][g] [27]),
        .Q(TRICACHE_VertColor10[59]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][r] [5]),
        .Q(TRICACHE_VertColor10[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[60] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][g] [28]),
        .Q(TRICACHE_VertColor10[60]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[61] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][g] [29]),
        .Q(TRICACHE_VertColor10[61]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[62] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][g] [30]),
        .Q(TRICACHE_VertColor10[62]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[63] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][g] [31]),
        .Q(TRICACHE_VertColor10[63]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[64] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][b] [0]),
        .Q(TRICACHE_VertColor10[64]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[65] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][b] [1]),
        .Q(TRICACHE_VertColor10[65]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[66] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][b] [2]),
        .Q(TRICACHE_VertColor10[66]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[67] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][b] [3]),
        .Q(TRICACHE_VertColor10[67]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[68] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][b] [4]),
        .Q(TRICACHE_VertColor10[68]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[69] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][b] [5]),
        .Q(TRICACHE_VertColor10[69]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][r] [6]),
        .Q(TRICACHE_VertColor10[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[70] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][b] [6]),
        .Q(TRICACHE_VertColor10[70]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[71] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][b] [7]),
        .Q(TRICACHE_VertColor10[71]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[72] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][b] [8]),
        .Q(TRICACHE_VertColor10[72]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[73] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][b] [9]),
        .Q(TRICACHE_VertColor10[73]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[74] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][b] [10]),
        .Q(TRICACHE_VertColor10[74]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[75] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][b] [11]),
        .Q(TRICACHE_VertColor10[75]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[76] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][b] [12]),
        .Q(TRICACHE_VertColor10[76]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[77] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][b] [13]),
        .Q(TRICACHE_VertColor10[77]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[78] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][b] [14]),
        .Q(TRICACHE_VertColor10[78]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[79] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][b] [15]),
        .Q(TRICACHE_VertColor10[79]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][r] [7]),
        .Q(TRICACHE_VertColor10[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[80] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][b] [16]),
        .Q(TRICACHE_VertColor10[80]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[81] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][b] [17]),
        .Q(TRICACHE_VertColor10[81]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[82] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][b] [18]),
        .Q(TRICACHE_VertColor10[82]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[83] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][b] [19]),
        .Q(TRICACHE_VertColor10[83]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[84] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][b] [20]),
        .Q(TRICACHE_VertColor10[84]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[85] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][b] [21]),
        .Q(TRICACHE_VertColor10[85]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[86] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][b] [22]),
        .Q(TRICACHE_VertColor10[86]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[87] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][b] [23]),
        .Q(TRICACHE_VertColor10[87]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[88] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][b] [24]),
        .Q(TRICACHE_VertColor10[88]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[89] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][b] [25]),
        .Q(TRICACHE_VertColor10[89]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][r] [8]),
        .Q(TRICACHE_VertColor10[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[90] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][b] [26]),
        .Q(TRICACHE_VertColor10[90]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[91] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][b] [27]),
        .Q(TRICACHE_VertColor10[91]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[92] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][b] [28]),
        .Q(TRICACHE_VertColor10[92]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[93] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][b] [29]),
        .Q(TRICACHE_VertColor10[93]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[94] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][b] [30]),
        .Q(TRICACHE_VertColor10[94]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[95] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][b] [31]),
        .Q(TRICACHE_VertColor10[95]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[96] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][a] [0]),
        .Q(TRICACHE_VertColor10[96]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[97] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][a] [1]),
        .Q(TRICACHE_VertColor10[97]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[98] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][a] [2]),
        .Q(TRICACHE_VertColor10[98]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[99] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][a] [3]),
        .Q(TRICACHE_VertColor10[99]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor10_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[color][r] [9]),
        .Q(TRICACHE_VertColor10[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][r] [0]),
        .Q(TRICACHE_VertColor20[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[100] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][a] [4]),
        .Q(TRICACHE_VertColor20[100]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[101] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][a] [5]),
        .Q(TRICACHE_VertColor20[101]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[102] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][a] [6]),
        .Q(TRICACHE_VertColor20[102]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[103] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][a] [7]),
        .Q(TRICACHE_VertColor20[103]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[104] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][a] [8]),
        .Q(TRICACHE_VertColor20[104]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[105] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][a] [9]),
        .Q(TRICACHE_VertColor20[105]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[106] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][a] [10]),
        .Q(TRICACHE_VertColor20[106]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[107] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][a] [11]),
        .Q(TRICACHE_VertColor20[107]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[108] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][a] [12]),
        .Q(TRICACHE_VertColor20[108]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[109] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][a] [13]),
        .Q(TRICACHE_VertColor20[109]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][r] [10]),
        .Q(TRICACHE_VertColor20[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[110] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][a] [14]),
        .Q(TRICACHE_VertColor20[110]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[111] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][a] [15]),
        .Q(TRICACHE_VertColor20[111]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[112] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][a] [16]),
        .Q(TRICACHE_VertColor20[112]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[113] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][a] [17]),
        .Q(TRICACHE_VertColor20[113]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[114] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][a] [18]),
        .Q(TRICACHE_VertColor20[114]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[115] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][a] [19]),
        .Q(TRICACHE_VertColor20[115]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[116] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][a] [20]),
        .Q(TRICACHE_VertColor20[116]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[117] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][a] [21]),
        .Q(TRICACHE_VertColor20[117]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[118] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][a] [22]),
        .Q(TRICACHE_VertColor20[118]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[119] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][a] [23]),
        .Q(TRICACHE_VertColor20[119]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][r] [11]),
        .Q(TRICACHE_VertColor20[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[120] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][a] [24]),
        .Q(TRICACHE_VertColor20[120]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[121] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][a] [25]),
        .Q(TRICACHE_VertColor20[121]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[122] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][a] [26]),
        .Q(TRICACHE_VertColor20[122]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[123] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][a] [27]),
        .Q(TRICACHE_VertColor20[123]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[124] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][a] [28]),
        .Q(TRICACHE_VertColor20[124]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[125] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][a] [29]),
        .Q(TRICACHE_VertColor20[125]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[126] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][a] [30]),
        .Q(TRICACHE_VertColor20[126]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[127] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][a] [31]),
        .Q(TRICACHE_VertColor20[127]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][r] [12]),
        .Q(TRICACHE_VertColor20[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][r] [13]),
        .Q(TRICACHE_VertColor20[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][r] [14]),
        .Q(TRICACHE_VertColor20[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][r] [15]),
        .Q(TRICACHE_VertColor20[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[16] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][r] [16]),
        .Q(TRICACHE_VertColor20[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[17] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][r] [17]),
        .Q(TRICACHE_VertColor20[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[18] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][r] [18]),
        .Q(TRICACHE_VertColor20[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[19] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][r] [19]),
        .Q(TRICACHE_VertColor20[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][r] [1]),
        .Q(TRICACHE_VertColor20[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[20] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][r] [20]),
        .Q(TRICACHE_VertColor20[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[21] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][r] [21]),
        .Q(TRICACHE_VertColor20[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[22] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][r] [22]),
        .Q(TRICACHE_VertColor20[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[23] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][r] [23]),
        .Q(TRICACHE_VertColor20[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[24] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][r] [24]),
        .Q(TRICACHE_VertColor20[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[25] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][r] [25]),
        .Q(TRICACHE_VertColor20[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[26] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][r] [26]),
        .Q(TRICACHE_VertColor20[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[27] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][r] [27]),
        .Q(TRICACHE_VertColor20[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[28] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][r] [28]),
        .Q(TRICACHE_VertColor20[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[29] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][r] [29]),
        .Q(TRICACHE_VertColor20[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][r] [2]),
        .Q(TRICACHE_VertColor20[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[30] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][r] [30]),
        .Q(TRICACHE_VertColor20[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[31] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][r] [31]),
        .Q(TRICACHE_VertColor20[31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[32] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][g] [0]),
        .Q(TRICACHE_VertColor20[32]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[33] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][g] [1]),
        .Q(TRICACHE_VertColor20[33]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[34] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][g] [2]),
        .Q(TRICACHE_VertColor20[34]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[35] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][g] [3]),
        .Q(TRICACHE_VertColor20[35]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[36] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][g] [4]),
        .Q(TRICACHE_VertColor20[36]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[37] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][g] [5]),
        .Q(TRICACHE_VertColor20[37]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[38] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][g] [6]),
        .Q(TRICACHE_VertColor20[38]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[39] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][g] [7]),
        .Q(TRICACHE_VertColor20[39]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][r] [3]),
        .Q(TRICACHE_VertColor20[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[40] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][g] [8]),
        .Q(TRICACHE_VertColor20[40]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[41] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][g] [9]),
        .Q(TRICACHE_VertColor20[41]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[42] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][g] [10]),
        .Q(TRICACHE_VertColor20[42]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[43] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][g] [11]),
        .Q(TRICACHE_VertColor20[43]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[44] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][g] [12]),
        .Q(TRICACHE_VertColor20[44]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[45] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][g] [13]),
        .Q(TRICACHE_VertColor20[45]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[46] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][g] [14]),
        .Q(TRICACHE_VertColor20[46]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[47] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][g] [15]),
        .Q(TRICACHE_VertColor20[47]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[48] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][g] [16]),
        .Q(TRICACHE_VertColor20[48]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[49] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][g] [17]),
        .Q(TRICACHE_VertColor20[49]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][r] [4]),
        .Q(TRICACHE_VertColor20[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[50] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][g] [18]),
        .Q(TRICACHE_VertColor20[50]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[51] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][g] [19]),
        .Q(TRICACHE_VertColor20[51]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[52] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][g] [20]),
        .Q(TRICACHE_VertColor20[52]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[53] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][g] [21]),
        .Q(TRICACHE_VertColor20[53]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[54] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][g] [22]),
        .Q(TRICACHE_VertColor20[54]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[55] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][g] [23]),
        .Q(TRICACHE_VertColor20[55]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[56] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][g] [24]),
        .Q(TRICACHE_VertColor20[56]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[57] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][g] [25]),
        .Q(TRICACHE_VertColor20[57]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[58] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][g] [26]),
        .Q(TRICACHE_VertColor20[58]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[59] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][g] [27]),
        .Q(TRICACHE_VertColor20[59]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][r] [5]),
        .Q(TRICACHE_VertColor20[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[60] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][g] [28]),
        .Q(TRICACHE_VertColor20[60]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[61] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][g] [29]),
        .Q(TRICACHE_VertColor20[61]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[62] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][g] [30]),
        .Q(TRICACHE_VertColor20[62]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[63] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][g] [31]),
        .Q(TRICACHE_VertColor20[63]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[64] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][b] [0]),
        .Q(TRICACHE_VertColor20[64]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[65] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][b] [1]),
        .Q(TRICACHE_VertColor20[65]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[66] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][b] [2]),
        .Q(TRICACHE_VertColor20[66]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[67] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][b] [3]),
        .Q(TRICACHE_VertColor20[67]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[68] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][b] [4]),
        .Q(TRICACHE_VertColor20[68]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[69] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][b] [5]),
        .Q(TRICACHE_VertColor20[69]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][r] [6]),
        .Q(TRICACHE_VertColor20[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[70] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][b] [6]),
        .Q(TRICACHE_VertColor20[70]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[71] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][b] [7]),
        .Q(TRICACHE_VertColor20[71]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[72] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][b] [8]),
        .Q(TRICACHE_VertColor20[72]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[73] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][b] [9]),
        .Q(TRICACHE_VertColor20[73]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[74] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][b] [10]),
        .Q(TRICACHE_VertColor20[74]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[75] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][b] [11]),
        .Q(TRICACHE_VertColor20[75]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[76] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][b] [12]),
        .Q(TRICACHE_VertColor20[76]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[77] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][b] [13]),
        .Q(TRICACHE_VertColor20[77]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[78] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][b] [14]),
        .Q(TRICACHE_VertColor20[78]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[79] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][b] [15]),
        .Q(TRICACHE_VertColor20[79]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][r] [7]),
        .Q(TRICACHE_VertColor20[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[80] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][b] [16]),
        .Q(TRICACHE_VertColor20[80]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[81] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][b] [17]),
        .Q(TRICACHE_VertColor20[81]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[82] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][b] [18]),
        .Q(TRICACHE_VertColor20[82]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[83] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][b] [19]),
        .Q(TRICACHE_VertColor20[83]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[84] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][b] [20]),
        .Q(TRICACHE_VertColor20[84]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[85] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][b] [21]),
        .Q(TRICACHE_VertColor20[85]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[86] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][b] [22]),
        .Q(TRICACHE_VertColor20[86]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[87] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][b] [23]),
        .Q(TRICACHE_VertColor20[87]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[88] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][b] [24]),
        .Q(TRICACHE_VertColor20[88]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[89] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][b] [25]),
        .Q(TRICACHE_VertColor20[89]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][r] [8]),
        .Q(TRICACHE_VertColor20[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[90] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][b] [26]),
        .Q(TRICACHE_VertColor20[90]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[91] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][b] [27]),
        .Q(TRICACHE_VertColor20[91]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[92] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][b] [28]),
        .Q(TRICACHE_VertColor20[92]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[93] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][b] [29]),
        .Q(TRICACHE_VertColor20[93]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[94] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][b] [30]),
        .Q(TRICACHE_VertColor20[94]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[95] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][b] [31]),
        .Q(TRICACHE_VertColor20[95]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[96] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][a] [0]),
        .Q(TRICACHE_VertColor20[96]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[97] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][a] [1]),
        .Q(TRICACHE_VertColor20[97]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[98] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][a] [2]),
        .Q(TRICACHE_VertColor20[98]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[99] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][a] [3]),
        .Q(TRICACHE_VertColor20[99]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_VertColor20_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[color][r] [9]),
        .Q(TRICACHE_VertColor20[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z0_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[Z] [0]),
        .Q(TRICACHE_Z0[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z0_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[Z] [10]),
        .Q(TRICACHE_Z0[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z0_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[Z] [11]),
        .Q(TRICACHE_Z0[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z0_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[Z] [12]),
        .Q(TRICACHE_Z0[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z0_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[Z] [13]),
        .Q(TRICACHE_Z0[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z0_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[Z] [14]),
        .Q(TRICACHE_Z0[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z0_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[Z] [15]),
        .Q(TRICACHE_Z0[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z0_reg[16] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[Z] [16]),
        .Q(TRICACHE_Z0[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z0_reg[17] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[Z] [17]),
        .Q(TRICACHE_Z0[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z0_reg[18] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[Z] [18]),
        .Q(TRICACHE_Z0[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z0_reg[19] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[Z] [19]),
        .Q(TRICACHE_Z0[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z0_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[Z] [1]),
        .Q(TRICACHE_Z0[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z0_reg[20] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[Z] [20]),
        .Q(TRICACHE_Z0[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z0_reg[21] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[Z] [21]),
        .Q(TRICACHE_Z0[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z0_reg[22] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[Z] [22]),
        .Q(TRICACHE_Z0[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z0_reg[23] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[Z] [23]),
        .Q(TRICACHE_Z0[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z0_reg[24] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[Z] [24]),
        .Q(TRICACHE_Z0[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z0_reg[25] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[Z] [25]),
        .Q(TRICACHE_Z0[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z0_reg[26] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[Z] [26]),
        .Q(TRICACHE_Z0[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z0_reg[27] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[Z] [27]),
        .Q(TRICACHE_Z0[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z0_reg[28] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[Z] [28]),
        .Q(TRICACHE_Z0[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z0_reg[29] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[Z] [29]),
        .Q(TRICACHE_Z0[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z0_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[Z] [2]),
        .Q(TRICACHE_Z0[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z0_reg[30] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[Z] [30]),
        .Q(TRICACHE_Z0[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z0_reg[31] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[Z] [31]),
        .Q(TRICACHE_Z0[31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z0_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[Z] [3]),
        .Q(TRICACHE_Z0[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z0_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[Z] [4]),
        .Q(TRICACHE_Z0[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z0_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[Z] [5]),
        .Q(TRICACHE_Z0[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z0_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[Z] [6]),
        .Q(TRICACHE_Z0[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z0_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[Z] [7]),
        .Q(TRICACHE_Z0[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z0_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[Z] [8]),
        .Q(TRICACHE_Z0[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z0_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataA_reg[Z] [9]),
        .Q(TRICACHE_Z0[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z10_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[Z] [0]),
        .Q(TRICACHE_Z10[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z10_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[Z] [10]),
        .Q(TRICACHE_Z10[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z10_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[Z] [11]),
        .Q(TRICACHE_Z10[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z10_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[Z] [12]),
        .Q(TRICACHE_Z10[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z10_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[Z] [13]),
        .Q(TRICACHE_Z10[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z10_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[Z] [14]),
        .Q(TRICACHE_Z10[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z10_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[Z] [15]),
        .Q(TRICACHE_Z10[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z10_reg[16] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[Z] [16]),
        .Q(TRICACHE_Z10[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z10_reg[17] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[Z] [17]),
        .Q(TRICACHE_Z10[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z10_reg[18] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[Z] [18]),
        .Q(TRICACHE_Z10[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z10_reg[19] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[Z] [19]),
        .Q(TRICACHE_Z10[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z10_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[Z] [1]),
        .Q(TRICACHE_Z10[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z10_reg[20] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[Z] [20]),
        .Q(TRICACHE_Z10[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z10_reg[21] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[Z] [21]),
        .Q(TRICACHE_Z10[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z10_reg[22] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[Z] [22]),
        .Q(TRICACHE_Z10[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z10_reg[23] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[Z] [23]),
        .Q(TRICACHE_Z10[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z10_reg[24] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[Z] [24]),
        .Q(TRICACHE_Z10[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z10_reg[25] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[Z] [25]),
        .Q(TRICACHE_Z10[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z10_reg[26] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[Z] [26]),
        .Q(TRICACHE_Z10[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z10_reg[27] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[Z] [27]),
        .Q(TRICACHE_Z10[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z10_reg[28] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[Z] [28]),
        .Q(TRICACHE_Z10[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z10_reg[29] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[Z] [29]),
        .Q(TRICACHE_Z10[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z10_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[Z] [2]),
        .Q(TRICACHE_Z10[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z10_reg[30] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[Z] [30]),
        .Q(TRICACHE_Z10[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z10_reg[31] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[Z] [31]),
        .Q(TRICACHE_Z10[31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z10_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[Z] [3]),
        .Q(TRICACHE_Z10[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z10_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[Z] [4]),
        .Q(TRICACHE_Z10[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z10_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[Z] [5]),
        .Q(TRICACHE_Z10[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z10_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[Z] [6]),
        .Q(TRICACHE_Z10[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z10_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[Z] [7]),
        .Q(TRICACHE_Z10[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z10_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[Z] [8]),
        .Q(TRICACHE_Z10[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z10_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataB_reg[Z] [9]),
        .Q(TRICACHE_Z10[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z20_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[Z] [0]),
        .Q(TRICACHE_Z20[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z20_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[Z] [10]),
        .Q(TRICACHE_Z20[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z20_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[Z] [11]),
        .Q(TRICACHE_Z20[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z20_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[Z] [12]),
        .Q(TRICACHE_Z20[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z20_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[Z] [13]),
        .Q(TRICACHE_Z20[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z20_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[Z] [14]),
        .Q(TRICACHE_Z20[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z20_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[Z] [15]),
        .Q(TRICACHE_Z20[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z20_reg[16] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[Z] [16]),
        .Q(TRICACHE_Z20[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z20_reg[17] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[Z] [17]),
        .Q(TRICACHE_Z20[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z20_reg[18] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[Z] [18]),
        .Q(TRICACHE_Z20[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z20_reg[19] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[Z] [19]),
        .Q(TRICACHE_Z20[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z20_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[Z] [1]),
        .Q(TRICACHE_Z20[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z20_reg[20] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[Z] [20]),
        .Q(TRICACHE_Z20[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z20_reg[21] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[Z] [21]),
        .Q(TRICACHE_Z20[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z20_reg[22] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[Z] [22]),
        .Q(TRICACHE_Z20[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z20_reg[23] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[Z] [23]),
        .Q(TRICACHE_Z20[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z20_reg[24] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[Z] [24]),
        .Q(TRICACHE_Z20[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z20_reg[25] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[Z] [25]),
        .Q(TRICACHE_Z20[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z20_reg[26] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[Z] [26]),
        .Q(TRICACHE_Z20[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z20_reg[27] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[Z] [27]),
        .Q(TRICACHE_Z20[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z20_reg[28] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[Z] [28]),
        .Q(TRICACHE_Z20[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z20_reg[29] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[Z] [29]),
        .Q(TRICACHE_Z20[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z20_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[Z] [2]),
        .Q(TRICACHE_Z20[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z20_reg[30] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[Z] [30]),
        .Q(TRICACHE_Z20[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z20_reg[31] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[Z] [31]),
        .Q(TRICACHE_Z20[31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z20_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[Z] [3]),
        .Q(TRICACHE_Z20[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z20_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[Z] [4]),
        .Q(TRICACHE_Z20[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z20_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[Z] [5]),
        .Q(TRICACHE_Z20[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z20_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[Z] [6]),
        .Q(TRICACHE_Z20[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z20_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[Z] [7]),
        .Q(TRICACHE_Z20[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z20_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[Z] [8]),
        .Q(TRICACHE_Z20[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TRICACHE_Z20_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .D(\vertDataC_reg[Z] [9]),
        .Q(TRICACHE_Z20[9]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY8 \_inferred__0/i__carry 
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({\_inferred__0/i__carry_n_0 ,\_inferred__0/i__carry_n_1 ,\_inferred__0/i__carry_n_2 ,\_inferred__0/i__carry_n_3 ,\_inferred__0/i__carry_n_4 ,\_inferred__0/i__carry_n_5 ,\_inferred__0/i__carry_n_6 ,\_inferred__0/i__carry_n_7 }),
        .DI(p_0_out__0[7:0]),
        .O(barycentricB[7:0]),
        .S({i__carry_i_9_n_0,i__carry_i_10_n_0,i__carry_i_11_n_0,i__carry_i_12_n_0,i__carry_i_13_n_0,i__carry_i_14_n_0,i__carry_i_15_n_0,i__carry_i_16_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY8 \_inferred__0/i__carry__0 
       (.CI(\_inferred__0/i__carry_n_0 ),
        .CI_TOP(1'b0),
        .CO({\_inferred__0/i__carry__0_n_0 ,\_inferred__0/i__carry__0_n_1 ,\_inferred__0/i__carry__0_n_2 ,\_inferred__0/i__carry__0_n_3 ,\_inferred__0/i__carry__0_n_4 ,\_inferred__0/i__carry__0_n_5 ,\_inferred__0/i__carry__0_n_6 ,\_inferred__0/i__carry__0_n_7 }),
        .DI(p_0_out__0[15:8]),
        .O(barycentricB[15:8]),
        .S({i__carry__0_i_9_n_0,i__carry__0_i_10_n_0,i__carry__0_i_11_n_0,i__carry__0_i_12_n_0,i__carry__0_i_13_n_0,i__carry__0_i_14_n_0,i__carry__0_i_15_n_0,i__carry__0_i_16_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY8 \_inferred__0/i__carry__1 
       (.CI(\_inferred__0/i__carry__0_n_0 ),
        .CI_TOP(1'b0),
        .CO({\_inferred__0/i__carry__1_n_0 ,\_inferred__0/i__carry__1_n_1 ,\_inferred__0/i__carry__1_n_2 ,\_inferred__0/i__carry__1_n_3 ,\_inferred__0/i__carry__1_n_4 ,\_inferred__0/i__carry__1_n_5 ,\_inferred__0/i__carry__1_n_6 ,\_inferred__0/i__carry__1_n_7 }),
        .DI(p_0_out__0[23:16]),
        .O(barycentricB[23:16]),
        .S({i__carry__1_i_9_n_0,i__carry__1_i_10_n_0,i__carry__1_i_11_n_0,i__carry__1_i_12_n_0,i__carry__1_i_13_n_0,i__carry__1_i_14_n_0,i__carry__1_i_15_n_0,i__carry__1_i_16_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY8 \_inferred__0/i__carry__2 
       (.CI(\_inferred__0/i__carry__1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\NLW__inferred__0/i__carry__2_CO_UNCONNECTED [7],\_inferred__0/i__carry__2_n_1 ,\_inferred__0/i__carry__2_n_2 ,\_inferred__0/i__carry__2_n_3 ,\_inferred__0/i__carry__2_n_4 ,\_inferred__0/i__carry__2_n_5 ,\_inferred__0/i__carry__2_n_6 ,\_inferred__0/i__carry__2_n_7 }),
        .DI({1'b0,p_0_out__0[30:24]}),
        .O(barycentricB[31:24]),
        .S({i__carry__2_i_8_n_0,i__carry__2_i_9_n_0,i__carry__2_i_10_n_0,i__carry__2_i_11_n_0,i__carry__2_i_12_n_0,i__carry__2_i_13_n_0,i__carry__2_i_14_n_0,i__carry__2_i_15_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY8 \_inferred__1/i__carry 
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({\_inferred__1/i__carry_n_0 ,\_inferred__1/i__carry_n_1 ,\_inferred__1/i__carry_n_2 ,\_inferred__1/i__carry_n_3 ,\_inferred__1/i__carry_n_4 ,\_inferred__1/i__carry_n_5 ,\_inferred__1/i__carry_n_6 ,\_inferred__1/i__carry_n_7 }),
        .DI({i__carry_i_1__0_n_0,i__carry_i_2__0_n_0,i__carry_i_3__0_n_0,i__carry_i_4__0_n_0,i__carry_i_5__0_n_0,i__carry_i_6__0_n_0,i__carry_i_7__0_n_0,i__carry_i_8__0_n_0}),
        .O(barycentricC[7:0]),
        .S({i__carry_i_9__0_n_0,i__carry_i_10__0_n_0,i__carry_i_11__0_n_0,i__carry_i_12__0_n_0,i__carry_i_13__0_n_0,i__carry_i_14__0_n_0,i__carry_i_15__0_n_0,i__carry_i_16__0_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY8 \_inferred__1/i__carry__0 
       (.CI(\_inferred__1/i__carry_n_0 ),
        .CI_TOP(1'b0),
        .CO({\_inferred__1/i__carry__0_n_0 ,\_inferred__1/i__carry__0_n_1 ,\_inferred__1/i__carry__0_n_2 ,\_inferred__1/i__carry__0_n_3 ,\_inferred__1/i__carry__0_n_4 ,\_inferred__1/i__carry__0_n_5 ,\_inferred__1/i__carry__0_n_6 ,\_inferred__1/i__carry__0_n_7 }),
        .DI({i__carry__0_i_1__0_n_0,i__carry__0_i_2__0_n_0,i__carry__0_i_3__0_n_0,i__carry__0_i_4__0_n_0,i__carry__0_i_5__0_n_0,i__carry__0_i_6__0_n_0,i__carry__0_i_7__0_n_0,i__carry__0_i_8__0_n_0}),
        .O(barycentricC[15:8]),
        .S({i__carry__0_i_9__0_n_0,i__carry__0_i_10__0_n_0,i__carry__0_i_11__0_n_0,i__carry__0_i_12__0_n_0,i__carry__0_i_13__0_n_0,i__carry__0_i_14__0_n_0,i__carry__0_i_15__0_n_0,i__carry__0_i_16__0_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY8 \_inferred__1/i__carry__1 
       (.CI(\_inferred__1/i__carry__0_n_0 ),
        .CI_TOP(1'b0),
        .CO({\_inferred__1/i__carry__1_n_0 ,\_inferred__1/i__carry__1_n_1 ,\_inferred__1/i__carry__1_n_2 ,\_inferred__1/i__carry__1_n_3 ,\_inferred__1/i__carry__1_n_4 ,\_inferred__1/i__carry__1_n_5 ,\_inferred__1/i__carry__1_n_6 ,\_inferred__1/i__carry__1_n_7 }),
        .DI({i__carry__1_i_1__0_n_0,i__carry__1_i_2__0_n_0,i__carry__1_i_3__0_n_0,i__carry__1_i_4__0_n_0,i__carry__1_i_5__0_n_0,i__carry__1_i_6__0_n_0,i__carry__1_i_7__0_n_0,i__carry__1_i_8__0_n_0}),
        .O(barycentricC[23:16]),
        .S({i__carry__1_i_9__0_n_0,i__carry__1_i_10__0_n_0,i__carry__1_i_11__0_n_0,i__carry__1_i_12__0_n_0,i__carry__1_i_13__0_n_0,i__carry__1_i_14__0_n_0,i__carry__1_i_15__0_n_0,i__carry__1_i_16__0_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY8 \_inferred__1/i__carry__2 
       (.CI(\_inferred__1/i__carry__1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\NLW__inferred__1/i__carry__2_CO_UNCONNECTED [7],\_inferred__1/i__carry__2_n_1 ,\_inferred__1/i__carry__2_n_2 ,\_inferred__1/i__carry__2_n_3 ,\_inferred__1/i__carry__2_n_4 ,\_inferred__1/i__carry__2_n_5 ,\_inferred__1/i__carry__2_n_6 ,\_inferred__1/i__carry__2_n_7 }),
        .DI({1'b0,i__carry__2_i_1__0_n_0,i__carry__2_i_2__0_n_0,i__carry__2_i_3__0_n_0,i__carry__2_i_4__0_n_0,i__carry__2_i_5__0_n_0,i__carry__2_i_6__0_n_0,i__carry__2_i_7__0_n_0}),
        .O(barycentricC[31:24]),
        .S({i__carry__2_i_8__0_n_0,i__carry__2_i_9__0_n_0,i__carry__2_i_10__0_n_0,i__carry__2_i_11__0_n_0,i__carry__2_i_12__0_n_0,i__carry__2_i_13__0_n_0,i__carry__2_i_14__0_n_0,i__carry__2_i_15__0_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY8 \_inferred__2/i__carry 
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({\_inferred__2/i__carry_n_0 ,\_inferred__2/i__carry_n_1 ,\_inferred__2/i__carry_n_2 ,\_inferred__2/i__carry_n_3 ,\_inferred__2/i__carry_n_4 ,\_inferred__2/i__carry_n_5 ,\_inferred__2/i__carry_n_6 ,\_inferred__2/i__carry_n_7 }),
        .DI({i__carry_i_1__1_n_0,i__carry_i_2__1_n_0,i__carry_i_3__1_n_0,i__carry_i_4__1_n_0,i__carry_i_5__1_n_0,i__carry_i_6__1_n_0,i__carry_i_7__1_n_0,i__carry_i_8__1_n_0}),
        .O(barycentricA[7:0]),
        .S({i__carry_i_9__1_n_0,i__carry_i_10__1_n_0,i__carry_i_11__1_n_0,i__carry_i_12__1_n_0,i__carry_i_13__1_n_0,i__carry_i_14__1_n_0,i__carry_i_15__1_n_0,i__carry_i_16__1_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY8 \_inferred__2/i__carry__0 
       (.CI(\_inferred__2/i__carry_n_0 ),
        .CI_TOP(1'b0),
        .CO({\_inferred__2/i__carry__0_n_0 ,\_inferred__2/i__carry__0_n_1 ,\_inferred__2/i__carry__0_n_2 ,\_inferred__2/i__carry__0_n_3 ,\_inferred__2/i__carry__0_n_4 ,\_inferred__2/i__carry__0_n_5 ,\_inferred__2/i__carry__0_n_6 ,\_inferred__2/i__carry__0_n_7 }),
        .DI({i__carry__0_i_1__1_n_0,i__carry__0_i_2__1_n_0,i__carry__0_i_3__1_n_0,i__carry__0_i_4__1_n_0,i__carry__0_i_5__1_n_0,i__carry__0_i_6__1_n_0,i__carry__0_i_7__1_n_0,i__carry__0_i_8__1_n_0}),
        .O(barycentricA[15:8]),
        .S({i__carry__0_i_9__1_n_0,i__carry__0_i_10__1_n_0,i__carry__0_i_11__1_n_0,i__carry__0_i_12__1_n_0,i__carry__0_i_13__1_n_0,i__carry__0_i_14__1_n_0,i__carry__0_i_15__1_n_0,i__carry__0_i_16__1_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY8 \_inferred__2/i__carry__1 
       (.CI(\_inferred__2/i__carry__0_n_0 ),
        .CI_TOP(1'b0),
        .CO({\_inferred__2/i__carry__1_n_0 ,\_inferred__2/i__carry__1_n_1 ,\_inferred__2/i__carry__1_n_2 ,\_inferred__2/i__carry__1_n_3 ,\_inferred__2/i__carry__1_n_4 ,\_inferred__2/i__carry__1_n_5 ,\_inferred__2/i__carry__1_n_6 ,\_inferred__2/i__carry__1_n_7 }),
        .DI({i__carry__1_i_1__1_n_0,i__carry__1_i_2__1_n_0,i__carry__1_i_3__1_n_0,i__carry__1_i_4__1_n_0,i__carry__1_i_5__1_n_0,i__carry__1_i_6__1_n_0,i__carry__1_i_7__1_n_0,i__carry__1_i_8__1_n_0}),
        .O(barycentricA[23:16]),
        .S({i__carry__1_i_9__1_n_0,i__carry__1_i_10__1_n_0,i__carry__1_i_11__1_n_0,i__carry__1_i_12__1_n_0,i__carry__1_i_13__1_n_0,i__carry__1_i_14__1_n_0,i__carry__1_i_15__1_n_0,i__carry__1_i_16__1_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY8 \_inferred__2/i__carry__2 
       (.CI(\_inferred__2/i__carry__1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\NLW__inferred__2/i__carry__2_CO_UNCONNECTED [7],\_inferred__2/i__carry__2_n_1 ,\_inferred__2/i__carry__2_n_2 ,\_inferred__2/i__carry__2_n_3 ,\_inferred__2/i__carry__2_n_4 ,\_inferred__2/i__carry__2_n_5 ,\_inferred__2/i__carry__2_n_6 ,\_inferred__2/i__carry__2_n_7 }),
        .DI({1'b0,i__carry__2_i_1__1_n_0,i__carry__2_i_2__1_n_0,i__carry__2_i_3__1_n_0,i__carry__2_i_4__1_n_0,i__carry__2_i_5__1_n_0,i__carry__2_i_6__1_n_0,i__carry__2_i_7__1_n_0}),
        .O(barycentricA[31:24]),
        .S({i__carry__2_i_8__1_n_0,i__carry__2_i_9__1_n_0,i__carry__2_i_10__1_n_0,i__carry__2_i_11__1_n_0,i__carry__2_i_12__1_n_0,i__carry__2_i_13__1_n_0,i__carry__2_i_14__1_n_0,i__carry__2_i_15__1_n_0}));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricA_reg[0] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricA[0]),
        .Q(DBG_BarycentricA[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricA_reg[10] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricA[10]),
        .Q(DBG_BarycentricA[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricA_reg[11] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricA[11]),
        .Q(DBG_BarycentricA[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricA_reg[12] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricA[12]),
        .Q(DBG_BarycentricA[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricA_reg[13] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricA[13]),
        .Q(DBG_BarycentricA[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricA_reg[14] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricA[14]),
        .Q(DBG_BarycentricA[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricA_reg[15] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricA[15]),
        .Q(DBG_BarycentricA[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricA_reg[16] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricA[16]),
        .Q(DBG_BarycentricA[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricA_reg[17] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricA[17]),
        .Q(DBG_BarycentricA[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricA_reg[18] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricA[18]),
        .Q(DBG_BarycentricA[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricA_reg[19] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricA[19]),
        .Q(DBG_BarycentricA[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricA_reg[1] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricA[1]),
        .Q(DBG_BarycentricA[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricA_reg[20] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricA[20]),
        .Q(DBG_BarycentricA[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricA_reg[21] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricA[21]),
        .Q(DBG_BarycentricA[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricA_reg[22] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricA[22]),
        .Q(DBG_BarycentricA[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricA_reg[23] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricA[23]),
        .Q(DBG_BarycentricA[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricA_reg[24] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricA[24]),
        .Q(DBG_BarycentricA[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricA_reg[25] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricA[25]),
        .Q(DBG_BarycentricA[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricA_reg[26] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricA[26]),
        .Q(DBG_BarycentricA[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricA_reg[27] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricA[27]),
        .Q(DBG_BarycentricA[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricA_reg[28] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricA[28]),
        .Q(DBG_BarycentricA[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricA_reg[29] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricA[29]),
        .Q(DBG_BarycentricA[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricA_reg[2] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricA[2]),
        .Q(DBG_BarycentricA[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricA_reg[30] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricA[30]),
        .Q(DBG_BarycentricA[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricA_reg[31] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricA[31]),
        .Q(DBG_BarycentricA[31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricA_reg[3] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricA[3]),
        .Q(DBG_BarycentricA[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricA_reg[4] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricA[4]),
        .Q(DBG_BarycentricA[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricA_reg[5] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricA[5]),
        .Q(DBG_BarycentricA[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricA_reg[6] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricA[6]),
        .Q(DBG_BarycentricA[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricA_reg[7] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricA[7]),
        .Q(DBG_BarycentricA[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricA_reg[8] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricA[8]),
        .Q(DBG_BarycentricA[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricA_reg[9] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricA[9]),
        .Q(DBG_BarycentricA[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricB_reg[0] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricB[0]),
        .Q(DBG_BarycentricB[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricB_reg[10] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricB[10]),
        .Q(DBG_BarycentricB[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricB_reg[11] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricB[11]),
        .Q(DBG_BarycentricB[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricB_reg[12] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricB[12]),
        .Q(DBG_BarycentricB[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricB_reg[13] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricB[13]),
        .Q(DBG_BarycentricB[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricB_reg[14] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricB[14]),
        .Q(DBG_BarycentricB[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricB_reg[15] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricB[15]),
        .Q(DBG_BarycentricB[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricB_reg[16] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricB[16]),
        .Q(DBG_BarycentricB[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricB_reg[17] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricB[17]),
        .Q(DBG_BarycentricB[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricB_reg[18] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricB[18]),
        .Q(DBG_BarycentricB[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricB_reg[19] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricB[19]),
        .Q(DBG_BarycentricB[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricB_reg[1] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricB[1]),
        .Q(DBG_BarycentricB[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricB_reg[20] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricB[20]),
        .Q(DBG_BarycentricB[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricB_reg[21] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricB[21]),
        .Q(DBG_BarycentricB[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricB_reg[22] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricB[22]),
        .Q(DBG_BarycentricB[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricB_reg[23] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricB[23]),
        .Q(DBG_BarycentricB[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricB_reg[24] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricB[24]),
        .Q(DBG_BarycentricB[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricB_reg[25] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricB[25]),
        .Q(DBG_BarycentricB[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricB_reg[26] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricB[26]),
        .Q(DBG_BarycentricB[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricB_reg[27] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricB[27]),
        .Q(DBG_BarycentricB[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricB_reg[28] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricB[28]),
        .Q(DBG_BarycentricB[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricB_reg[29] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricB[29]),
        .Q(DBG_BarycentricB[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricB_reg[2] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricB[2]),
        .Q(DBG_BarycentricB[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricB_reg[30] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricB[30]),
        .Q(DBG_BarycentricB[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricB_reg[31] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricB[31]),
        .Q(DBG_BarycentricB[31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricB_reg[3] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricB[3]),
        .Q(DBG_BarycentricB[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricB_reg[4] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricB[4]),
        .Q(DBG_BarycentricB[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricB_reg[5] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricB[5]),
        .Q(DBG_BarycentricB[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricB_reg[6] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricB[6]),
        .Q(DBG_BarycentricB[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricB_reg[7] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricB[7]),
        .Q(DBG_BarycentricB[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricB_reg[8] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricB[8]),
        .Q(DBG_BarycentricB[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricB_reg[9] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricB[9]),
        .Q(DBG_BarycentricB[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricC_reg[0] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricC[0]),
        .Q(DBG_BarycentricC[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricC_reg[10] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricC[10]),
        .Q(DBG_BarycentricC[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricC_reg[11] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricC[11]),
        .Q(DBG_BarycentricC[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricC_reg[12] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricC[12]),
        .Q(DBG_BarycentricC[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricC_reg[13] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricC[13]),
        .Q(DBG_BarycentricC[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricC_reg[14] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricC[14]),
        .Q(DBG_BarycentricC[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricC_reg[15] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricC[15]),
        .Q(DBG_BarycentricC[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricC_reg[16] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricC[16]),
        .Q(DBG_BarycentricC[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricC_reg[17] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricC[17]),
        .Q(DBG_BarycentricC[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricC_reg[18] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricC[18]),
        .Q(DBG_BarycentricC[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricC_reg[19] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricC[19]),
        .Q(DBG_BarycentricC[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricC_reg[1] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricC[1]),
        .Q(DBG_BarycentricC[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricC_reg[20] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricC[20]),
        .Q(DBG_BarycentricC[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricC_reg[21] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricC[21]),
        .Q(DBG_BarycentricC[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricC_reg[22] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricC[22]),
        .Q(DBG_BarycentricC[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricC_reg[23] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricC[23]),
        .Q(DBG_BarycentricC[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricC_reg[24] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricC[24]),
        .Q(DBG_BarycentricC[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricC_reg[25] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricC[25]),
        .Q(DBG_BarycentricC[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricC_reg[26] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricC[26]),
        .Q(DBG_BarycentricC[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricC_reg[27] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricC[27]),
        .Q(DBG_BarycentricC[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricC_reg[28] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricC[28]),
        .Q(DBG_BarycentricC[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricC_reg[29] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricC[29]),
        .Q(DBG_BarycentricC[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricC_reg[2] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricC[2]),
        .Q(DBG_BarycentricC[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricC_reg[30] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricC[30]),
        .Q(DBG_BarycentricC[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricC_reg[31] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricC[31]),
        .Q(DBG_BarycentricC[31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricC_reg[3] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricC[3]),
        .Q(DBG_BarycentricC[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricC_reg[4] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricC[4]),
        .Q(DBG_BarycentricC[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricC_reg[5] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricC[5]),
        .Q(DBG_BarycentricC[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricC_reg[6] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricC[6]),
        .Q(DBG_BarycentricC[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricC_reg[7] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricC[7]),
        .Q(DBG_BarycentricC[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricC_reg[8] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricC[8]),
        .Q(DBG_BarycentricC[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricC_reg[9] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(barycentricC[9]),
        .Q(DBG_BarycentricC[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricInverse_reg[0] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricInverse[0]),
        .Q(barycentricInverse[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricInverse_reg[10] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricInverse[10]),
        .Q(barycentricInverse[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricInverse_reg[11] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricInverse[11]),
        .Q(barycentricInverse[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricInverse_reg[12] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricInverse[12]),
        .Q(barycentricInverse[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricInverse_reg[13] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricInverse[13]),
        .Q(barycentricInverse[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricInverse_reg[14] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricInverse[14]),
        .Q(barycentricInverse[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricInverse_reg[15] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricInverse[15]),
        .Q(barycentricInverse[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricInverse_reg[16] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricInverse[16]),
        .Q(barycentricInverse[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricInverse_reg[17] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricInverse[17]),
        .Q(barycentricInverse[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricInverse_reg[18] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricInverse[18]),
        .Q(barycentricInverse[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricInverse_reg[19] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricInverse[19]),
        .Q(barycentricInverse[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricInverse_reg[1] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricInverse[1]),
        .Q(barycentricInverse[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricInverse_reg[20] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricInverse[20]),
        .Q(barycentricInverse[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricInverse_reg[21] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricInverse[21]),
        .Q(barycentricInverse[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricInverse_reg[22] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricInverse[22]),
        .Q(barycentricInverse[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricInverse_reg[23] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricInverse[23]),
        .Q(barycentricInverse[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricInverse_reg[24] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricInverse[24]),
        .Q(barycentricInverse[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricInverse_reg[25] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricInverse[25]),
        .Q(barycentricInverse[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricInverse_reg[26] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricInverse[26]),
        .Q(barycentricInverse[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricInverse_reg[27] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricInverse[27]),
        .Q(barycentricInverse[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricInverse_reg[28] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricInverse[28]),
        .Q(barycentricInverse[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricInverse_reg[29] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricInverse[29]),
        .Q(barycentricInverse[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricInverse_reg[2] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricInverse[2]),
        .Q(barycentricInverse[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricInverse_reg[30] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricInverse[30]),
        .Q(barycentricInverse[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricInverse_reg[31] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricInverse[31]),
        .Q(barycentricInverse[31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricInverse_reg[3] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricInverse[3]),
        .Q(barycentricInverse[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricInverse_reg[4] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricInverse[4]),
        .Q(barycentricInverse[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricInverse_reg[5] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricInverse[5]),
        .Q(barycentricInverse[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricInverse_reg[6] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricInverse[6]),
        .Q(barycentricInverse[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricInverse_reg[7] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricInverse[7]),
        .Q(barycentricInverse[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricInverse_reg[8] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricInverse[8]),
        .Q(barycentricInverse[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricInverse_reg[9] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricInverse[9]),
        .Q(barycentricInverse[9]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY8 barycentricRowResetA0_carry
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({barycentricRowResetA0_carry_n_0,barycentricRowResetA0_carry_n_1,barycentricRowResetA0_carry_n_2,barycentricRowResetA0_carry_n_3,barycentricRowResetA0_carry_n_4,barycentricRowResetA0_carry_n_5,barycentricRowResetA0_carry_n_6,barycentricRowResetA0_carry_n_7}),
        .DI({\barycentricRowResetA_reg_n_0_[7] ,\barycentricRowResetA_reg_n_0_[6] ,\barycentricRowResetA_reg_n_0_[5] ,\barycentricRowResetA_reg_n_0_[4] ,\barycentricRowResetA_reg_n_0_[3] ,\barycentricRowResetA_reg_n_0_[2] ,\barycentricRowResetA_reg_n_0_[1] ,\barycentricRowResetA_reg_n_0_[0] }),
        .O(in26[7:0]),
        .S({barycentricRowResetA0_carry_i_1_n_0,barycentricRowResetA0_carry_i_2_n_0,barycentricRowResetA0_carry_i_3_n_0,barycentricRowResetA0_carry_i_4_n_0,barycentricRowResetA0_carry_i_5_n_0,barycentricRowResetA0_carry_i_6_n_0,barycentricRowResetA0_carry_i_7_n_0,barycentricRowResetA0_carry_i_8_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY8 barycentricRowResetA0_carry__0
       (.CI(barycentricRowResetA0_carry_n_0),
        .CI_TOP(1'b0),
        .CO({barycentricRowResetA0_carry__0_n_0,barycentricRowResetA0_carry__0_n_1,barycentricRowResetA0_carry__0_n_2,barycentricRowResetA0_carry__0_n_3,barycentricRowResetA0_carry__0_n_4,barycentricRowResetA0_carry__0_n_5,barycentricRowResetA0_carry__0_n_6,barycentricRowResetA0_carry__0_n_7}),
        .DI({barycentricYDeltaA[15],\barycentricRowResetA_reg_n_0_[14] ,\barycentricRowResetA_reg_n_0_[13] ,\barycentricRowResetA_reg_n_0_[12] ,\barycentricRowResetA_reg_n_0_[11] ,\barycentricRowResetA_reg_n_0_[10] ,\barycentricRowResetA_reg_n_0_[9] ,\barycentricRowResetA_reg_n_0_[8] }),
        .O(in26[15:8]),
        .S({barycentricRowResetA0_carry__0_i_1_n_0,barycentricRowResetA0_carry__0_i_2_n_0,barycentricRowResetA0_carry__0_i_3_n_0,barycentricRowResetA0_carry__0_i_4_n_0,barycentricRowResetA0_carry__0_i_5_n_0,barycentricRowResetA0_carry__0_i_6_n_0,barycentricRowResetA0_carry__0_i_7_n_0,barycentricRowResetA0_carry__0_i_8_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    barycentricRowResetA0_carry__0_i_1
       (.I0(barycentricYDeltaA[15]),
        .I1(\barycentricRowResetA_reg_n_0_[15] ),
        .O(barycentricRowResetA0_carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    barycentricRowResetA0_carry__0_i_2
       (.I0(\barycentricRowResetA_reg_n_0_[14] ),
        .I1(barycentricYDeltaA[14]),
        .O(barycentricRowResetA0_carry__0_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    barycentricRowResetA0_carry__0_i_3
       (.I0(\barycentricRowResetA_reg_n_0_[13] ),
        .I1(barycentricYDeltaA[13]),
        .O(barycentricRowResetA0_carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    barycentricRowResetA0_carry__0_i_4
       (.I0(\barycentricRowResetA_reg_n_0_[12] ),
        .I1(barycentricYDeltaA[12]),
        .O(barycentricRowResetA0_carry__0_i_4_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    barycentricRowResetA0_carry__0_i_5
       (.I0(\barycentricRowResetA_reg_n_0_[11] ),
        .I1(barycentricYDeltaA[11]),
        .O(barycentricRowResetA0_carry__0_i_5_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    barycentricRowResetA0_carry__0_i_6
       (.I0(\barycentricRowResetA_reg_n_0_[10] ),
        .I1(barycentricYDeltaA[10]),
        .O(barycentricRowResetA0_carry__0_i_6_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    barycentricRowResetA0_carry__0_i_7
       (.I0(\barycentricRowResetA_reg_n_0_[9] ),
        .I1(barycentricYDeltaA[9]),
        .O(barycentricRowResetA0_carry__0_i_7_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    barycentricRowResetA0_carry__0_i_8
       (.I0(\barycentricRowResetA_reg_n_0_[8] ),
        .I1(barycentricYDeltaA[8]),
        .O(barycentricRowResetA0_carry__0_i_8_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY8 barycentricRowResetA0_carry__1
       (.CI(barycentricRowResetA0_carry__0_n_0),
        .CI_TOP(1'b0),
        .CO({barycentricRowResetA0_carry__1_n_0,barycentricRowResetA0_carry__1_n_1,barycentricRowResetA0_carry__1_n_2,barycentricRowResetA0_carry__1_n_3,barycentricRowResetA0_carry__1_n_4,barycentricRowResetA0_carry__1_n_5,barycentricRowResetA0_carry__1_n_6,barycentricRowResetA0_carry__1_n_7}),
        .DI({\barycentricRowResetA_reg_n_0_[22] ,\barycentricRowResetA_reg_n_0_[21] ,\barycentricRowResetA_reg_n_0_[20] ,\barycentricRowResetA_reg_n_0_[19] ,\barycentricRowResetA_reg_n_0_[18] ,\barycentricRowResetA_reg_n_0_[17] ,\barycentricRowResetA_reg_n_0_[16] ,barycentricRowResetA0_carry__1_i_1_n_0}),
        .O(in26[23:16]),
        .S({barycentricRowResetA0_carry__1_i_2_n_0,barycentricRowResetA0_carry__1_i_3_n_0,barycentricRowResetA0_carry__1_i_4_n_0,barycentricRowResetA0_carry__1_i_5_n_0,barycentricRowResetA0_carry__1_i_6_n_0,barycentricRowResetA0_carry__1_i_7_n_0,barycentricRowResetA0_carry__1_i_8_n_0,barycentricRowResetA0_carry__1_i_9_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    barycentricRowResetA0_carry__1_i_1
       (.I0(barycentricYDeltaA[15]),
        .O(barycentricRowResetA0_carry__1_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    barycentricRowResetA0_carry__1_i_2
       (.I0(\barycentricRowResetA_reg_n_0_[22] ),
        .I1(\barycentricRowResetA_reg_n_0_[23] ),
        .O(barycentricRowResetA0_carry__1_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    barycentricRowResetA0_carry__1_i_3
       (.I0(\barycentricRowResetA_reg_n_0_[21] ),
        .I1(\barycentricRowResetA_reg_n_0_[22] ),
        .O(barycentricRowResetA0_carry__1_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    barycentricRowResetA0_carry__1_i_4
       (.I0(\barycentricRowResetA_reg_n_0_[20] ),
        .I1(\barycentricRowResetA_reg_n_0_[21] ),
        .O(barycentricRowResetA0_carry__1_i_4_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    barycentricRowResetA0_carry__1_i_5
       (.I0(\barycentricRowResetA_reg_n_0_[19] ),
        .I1(\barycentricRowResetA_reg_n_0_[20] ),
        .O(barycentricRowResetA0_carry__1_i_5_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    barycentricRowResetA0_carry__1_i_6
       (.I0(\barycentricRowResetA_reg_n_0_[18] ),
        .I1(\barycentricRowResetA_reg_n_0_[19] ),
        .O(barycentricRowResetA0_carry__1_i_6_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    barycentricRowResetA0_carry__1_i_7
       (.I0(\barycentricRowResetA_reg_n_0_[17] ),
        .I1(\barycentricRowResetA_reg_n_0_[18] ),
        .O(barycentricRowResetA0_carry__1_i_7_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    barycentricRowResetA0_carry__1_i_8
       (.I0(\barycentricRowResetA_reg_n_0_[16] ),
        .I1(\barycentricRowResetA_reg_n_0_[17] ),
        .O(barycentricRowResetA0_carry__1_i_8_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    barycentricRowResetA0_carry__1_i_9
       (.I0(barycentricYDeltaA[15]),
        .I1(\barycentricRowResetA_reg_n_0_[16] ),
        .O(barycentricRowResetA0_carry__1_i_9_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY8 barycentricRowResetA0_carry__2
       (.CI(barycentricRowResetA0_carry__1_n_0),
        .CI_TOP(1'b0),
        .CO({NLW_barycentricRowResetA0_carry__2_CO_UNCONNECTED[7],barycentricRowResetA0_carry__2_n_1,barycentricRowResetA0_carry__2_n_2,barycentricRowResetA0_carry__2_n_3,barycentricRowResetA0_carry__2_n_4,barycentricRowResetA0_carry__2_n_5,barycentricRowResetA0_carry__2_n_6,barycentricRowResetA0_carry__2_n_7}),
        .DI({1'b0,\barycentricRowResetA_reg_n_0_[29] ,\barycentricRowResetA_reg_n_0_[28] ,\barycentricRowResetA_reg_n_0_[27] ,\barycentricRowResetA_reg_n_0_[26] ,\barycentricRowResetA_reg_n_0_[25] ,\barycentricRowResetA_reg_n_0_[24] ,\barycentricRowResetA_reg_n_0_[23] }),
        .O(in26[31:24]),
        .S({barycentricRowResetA0_carry__2_i_1_n_0,barycentricRowResetA0_carry__2_i_2_n_0,barycentricRowResetA0_carry__2_i_3_n_0,barycentricRowResetA0_carry__2_i_4_n_0,barycentricRowResetA0_carry__2_i_5_n_0,barycentricRowResetA0_carry__2_i_6_n_0,barycentricRowResetA0_carry__2_i_7_n_0,barycentricRowResetA0_carry__2_i_8_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    barycentricRowResetA0_carry__2_i_1
       (.I0(\barycentricRowResetA_reg_n_0_[30] ),
        .I1(\barycentricRowResetA_reg_n_0_[31] ),
        .O(barycentricRowResetA0_carry__2_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    barycentricRowResetA0_carry__2_i_2
       (.I0(\barycentricRowResetA_reg_n_0_[29] ),
        .I1(\barycentricRowResetA_reg_n_0_[30] ),
        .O(barycentricRowResetA0_carry__2_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    barycentricRowResetA0_carry__2_i_3
       (.I0(\barycentricRowResetA_reg_n_0_[28] ),
        .I1(\barycentricRowResetA_reg_n_0_[29] ),
        .O(barycentricRowResetA0_carry__2_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    barycentricRowResetA0_carry__2_i_4
       (.I0(\barycentricRowResetA_reg_n_0_[27] ),
        .I1(\barycentricRowResetA_reg_n_0_[28] ),
        .O(barycentricRowResetA0_carry__2_i_4_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    barycentricRowResetA0_carry__2_i_5
       (.I0(\barycentricRowResetA_reg_n_0_[26] ),
        .I1(\barycentricRowResetA_reg_n_0_[27] ),
        .O(barycentricRowResetA0_carry__2_i_5_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    barycentricRowResetA0_carry__2_i_6
       (.I0(\barycentricRowResetA_reg_n_0_[25] ),
        .I1(\barycentricRowResetA_reg_n_0_[26] ),
        .O(barycentricRowResetA0_carry__2_i_6_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    barycentricRowResetA0_carry__2_i_7
       (.I0(\barycentricRowResetA_reg_n_0_[24] ),
        .I1(\barycentricRowResetA_reg_n_0_[25] ),
        .O(barycentricRowResetA0_carry__2_i_7_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    barycentricRowResetA0_carry__2_i_8
       (.I0(\barycentricRowResetA_reg_n_0_[23] ),
        .I1(\barycentricRowResetA_reg_n_0_[24] ),
        .O(barycentricRowResetA0_carry__2_i_8_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    barycentricRowResetA0_carry_i_1
       (.I0(\barycentricRowResetA_reg_n_0_[7] ),
        .I1(barycentricYDeltaA[7]),
        .O(barycentricRowResetA0_carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    barycentricRowResetA0_carry_i_2
       (.I0(\barycentricRowResetA_reg_n_0_[6] ),
        .I1(barycentricYDeltaA[6]),
        .O(barycentricRowResetA0_carry_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    barycentricRowResetA0_carry_i_3
       (.I0(\barycentricRowResetA_reg_n_0_[5] ),
        .I1(barycentricYDeltaA[5]),
        .O(barycentricRowResetA0_carry_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    barycentricRowResetA0_carry_i_4
       (.I0(\barycentricRowResetA_reg_n_0_[4] ),
        .I1(barycentricYDeltaA[4]),
        .O(barycentricRowResetA0_carry_i_4_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    barycentricRowResetA0_carry_i_5
       (.I0(\barycentricRowResetA_reg_n_0_[3] ),
        .I1(barycentricYDeltaA[3]),
        .O(barycentricRowResetA0_carry_i_5_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    barycentricRowResetA0_carry_i_6
       (.I0(\barycentricRowResetA_reg_n_0_[2] ),
        .I1(barycentricYDeltaA[2]),
        .O(barycentricRowResetA0_carry_i_6_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    barycentricRowResetA0_carry_i_7
       (.I0(\barycentricRowResetA_reg_n_0_[1] ),
        .I1(barycentricYDeltaA[1]),
        .O(barycentricRowResetA0_carry_i_7_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    barycentricRowResetA0_carry_i_8
       (.I0(\barycentricRowResetA_reg_n_0_[0] ),
        .I1(barycentricYDeltaA[0]),
        .O(barycentricRowResetA0_carry_i_8_n_0));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetA[0]_i_1 
       (.I0(in26[0]),
        .I1(TRISETUP_inInitialBarycentricRowResetA[0]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetA[0]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetA[10]_i_1 
       (.I0(in26[10]),
        .I1(TRISETUP_inInitialBarycentricRowResetA[10]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetA[10]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetA[11]_i_1 
       (.I0(in26[11]),
        .I1(TRISETUP_inInitialBarycentricRowResetA[11]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetA[11]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetA[12]_i_1 
       (.I0(in26[12]),
        .I1(TRISETUP_inInitialBarycentricRowResetA[12]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetA[12]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetA[13]_i_1 
       (.I0(in26[13]),
        .I1(TRISETUP_inInitialBarycentricRowResetA[13]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetA[13]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetA[14]_i_1 
       (.I0(in26[14]),
        .I1(TRISETUP_inInitialBarycentricRowResetA[14]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetA[14]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetA[15]_i_1 
       (.I0(in26[15]),
        .I1(TRISETUP_inInitialBarycentricRowResetA[15]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetA[15]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetA[16]_i_1 
       (.I0(in26[16]),
        .I1(TRISETUP_inInitialBarycentricRowResetA[16]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetA[16]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetA[17]_i_1 
       (.I0(in26[17]),
        .I1(TRISETUP_inInitialBarycentricRowResetA[17]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetA[17]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetA[18]_i_1 
       (.I0(in26[18]),
        .I1(TRISETUP_inInitialBarycentricRowResetA[18]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetA[18]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetA[19]_i_1 
       (.I0(in26[19]),
        .I1(TRISETUP_inInitialBarycentricRowResetA[19]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetA[19]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetA[1]_i_1 
       (.I0(in26[1]),
        .I1(TRISETUP_inInitialBarycentricRowResetA[1]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetA[1]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetA[20]_i_1 
       (.I0(in26[20]),
        .I1(TRISETUP_inInitialBarycentricRowResetA[20]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetA[20]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetA[21]_i_1 
       (.I0(in26[21]),
        .I1(TRISETUP_inInitialBarycentricRowResetA[21]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetA[21]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetA[22]_i_1 
       (.I0(in26[22]),
        .I1(TRISETUP_inInitialBarycentricRowResetA[22]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetA[22]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetA[23]_i_1 
       (.I0(in26[23]),
        .I1(TRISETUP_inInitialBarycentricRowResetA[23]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetA[23]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetA[24]_i_1 
       (.I0(in26[24]),
        .I1(TRISETUP_inInitialBarycentricRowResetA[24]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetA[24]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetA[25]_i_1 
       (.I0(in26[25]),
        .I1(TRISETUP_inInitialBarycentricRowResetA[25]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetA[25]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetA[26]_i_1 
       (.I0(in26[26]),
        .I1(TRISETUP_inInitialBarycentricRowResetA[26]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetA[26]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetA[27]_i_1 
       (.I0(in26[27]),
        .I1(TRISETUP_inInitialBarycentricRowResetA[27]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetA[27]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetA[28]_i_1 
       (.I0(in26[28]),
        .I1(TRISETUP_inInitialBarycentricRowResetA[28]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetA[28]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetA[29]_i_1 
       (.I0(in26[29]),
        .I1(TRISETUP_inInitialBarycentricRowResetA[29]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetA[29]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetA[2]_i_1 
       (.I0(in26[2]),
        .I1(TRISETUP_inInitialBarycentricRowResetA[2]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetA[2]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetA[30]_i_1 
       (.I0(in26[30]),
        .I1(TRISETUP_inInitialBarycentricRowResetA[30]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetA[30]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetA[31]_i_1 
       (.I0(in26[31]),
        .I1(TRISETUP_inInitialBarycentricRowResetA[31]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetA[31]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetA[3]_i_1 
       (.I0(in26[3]),
        .I1(TRISETUP_inInitialBarycentricRowResetA[3]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetA[3]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetA[4]_i_1 
       (.I0(in26[4]),
        .I1(TRISETUP_inInitialBarycentricRowResetA[4]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetA[4]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetA[5]_i_1 
       (.I0(in26[5]),
        .I1(TRISETUP_inInitialBarycentricRowResetA[5]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetA[5]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetA[6]_i_1 
       (.I0(in26[6]),
        .I1(TRISETUP_inInitialBarycentricRowResetA[6]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetA[6]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetA[7]_i_1 
       (.I0(in26[7]),
        .I1(TRISETUP_inInitialBarycentricRowResetA[7]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetA[7]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetA[8]_i_1 
       (.I0(in26[8]),
        .I1(TRISETUP_inInitialBarycentricRowResetA[8]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetA[8]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetA[9]_i_1 
       (.I0(in26[9]),
        .I1(TRISETUP_inInitialBarycentricRowResetA[9]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetA[9]));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetA_reg[0] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetA[0]),
        .Q(\barycentricRowResetA_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetA_reg[10] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetA[10]),
        .Q(\barycentricRowResetA_reg_n_0_[10] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetA_reg[11] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetA[11]),
        .Q(\barycentricRowResetA_reg_n_0_[11] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetA_reg[12] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetA[12]),
        .Q(\barycentricRowResetA_reg_n_0_[12] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetA_reg[13] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetA[13]),
        .Q(\barycentricRowResetA_reg_n_0_[13] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetA_reg[14] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetA[14]),
        .Q(\barycentricRowResetA_reg_n_0_[14] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetA_reg[15] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetA[15]),
        .Q(\barycentricRowResetA_reg_n_0_[15] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetA_reg[16] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetA[16]),
        .Q(\barycentricRowResetA_reg_n_0_[16] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetA_reg[17] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetA[17]),
        .Q(\barycentricRowResetA_reg_n_0_[17] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetA_reg[18] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetA[18]),
        .Q(\barycentricRowResetA_reg_n_0_[18] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetA_reg[19] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetA[19]),
        .Q(\barycentricRowResetA_reg_n_0_[19] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetA_reg[1] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetA[1]),
        .Q(\barycentricRowResetA_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetA_reg[20] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetA[20]),
        .Q(\barycentricRowResetA_reg_n_0_[20] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetA_reg[21] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetA[21]),
        .Q(\barycentricRowResetA_reg_n_0_[21] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetA_reg[22] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetA[22]),
        .Q(\barycentricRowResetA_reg_n_0_[22] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetA_reg[23] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetA[23]),
        .Q(\barycentricRowResetA_reg_n_0_[23] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetA_reg[24] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetA[24]),
        .Q(\barycentricRowResetA_reg_n_0_[24] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetA_reg[25] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetA[25]),
        .Q(\barycentricRowResetA_reg_n_0_[25] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetA_reg[26] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetA[26]),
        .Q(\barycentricRowResetA_reg_n_0_[26] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetA_reg[27] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetA[27]),
        .Q(\barycentricRowResetA_reg_n_0_[27] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetA_reg[28] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetA[28]),
        .Q(\barycentricRowResetA_reg_n_0_[28] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetA_reg[29] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetA[29]),
        .Q(\barycentricRowResetA_reg_n_0_[29] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetA_reg[2] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetA[2]),
        .Q(\barycentricRowResetA_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetA_reg[30] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetA[30]),
        .Q(\barycentricRowResetA_reg_n_0_[30] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetA_reg[31] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetA[31]),
        .Q(\barycentricRowResetA_reg_n_0_[31] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetA_reg[3] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetA[3]),
        .Q(\barycentricRowResetA_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetA_reg[4] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetA[4]),
        .Q(\barycentricRowResetA_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetA_reg[5] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetA[5]),
        .Q(\barycentricRowResetA_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetA_reg[6] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetA[6]),
        .Q(\barycentricRowResetA_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetA_reg[7] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetA[7]),
        .Q(\barycentricRowResetA_reg_n_0_[7] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetA_reg[8] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetA[8]),
        .Q(\barycentricRowResetA_reg_n_0_[8] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetA_reg[9] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetA[9]),
        .Q(\barycentricRowResetA_reg_n_0_[9] ),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 barycentricRowResetB0_carry
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({barycentricRowResetB0_carry_n_0,barycentricRowResetB0_carry_n_1,barycentricRowResetB0_carry_n_2,barycentricRowResetB0_carry_n_3,barycentricRowResetB0_carry_n_4,barycentricRowResetB0_carry_n_5,barycentricRowResetB0_carry_n_6,barycentricRowResetB0_carry_n_7}),
        .DI({\barycentricRowResetB_reg_n_0_[7] ,\barycentricRowResetB_reg_n_0_[6] ,\barycentricRowResetB_reg_n_0_[5] ,\barycentricRowResetB_reg_n_0_[4] ,\barycentricRowResetB_reg_n_0_[3] ,\barycentricRowResetB_reg_n_0_[2] ,\barycentricRowResetB_reg_n_0_[1] ,\barycentricRowResetB_reg_n_0_[0] }),
        .O(in24[7:0]),
        .S({barycentricRowResetB0_carry_i_1_n_0,barycentricRowResetB0_carry_i_2_n_0,barycentricRowResetB0_carry_i_3_n_0,barycentricRowResetB0_carry_i_4_n_0,barycentricRowResetB0_carry_i_5_n_0,barycentricRowResetB0_carry_i_6_n_0,barycentricRowResetB0_carry_i_7_n_0,barycentricRowResetB0_carry_i_8_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 barycentricRowResetB0_carry__0
       (.CI(barycentricRowResetB0_carry_n_0),
        .CI_TOP(1'b0),
        .CO({barycentricRowResetB0_carry__0_n_0,barycentricRowResetB0_carry__0_n_1,barycentricRowResetB0_carry__0_n_2,barycentricRowResetB0_carry__0_n_3,barycentricRowResetB0_carry__0_n_4,barycentricRowResetB0_carry__0_n_5,barycentricRowResetB0_carry__0_n_6,barycentricRowResetB0_carry__0_n_7}),
        .DI({barycentricYDeltaB[15],\barycentricRowResetB_reg_n_0_[14] ,\barycentricRowResetB_reg_n_0_[13] ,\barycentricRowResetB_reg_n_0_[12] ,\barycentricRowResetB_reg_n_0_[11] ,\barycentricRowResetB_reg_n_0_[10] ,\barycentricRowResetB_reg_n_0_[9] ,\barycentricRowResetB_reg_n_0_[8] }),
        .O(in24[15:8]),
        .S({barycentricRowResetB0_carry__0_i_1_n_0,barycentricRowResetB0_carry__0_i_2_n_0,barycentricRowResetB0_carry__0_i_3_n_0,barycentricRowResetB0_carry__0_i_4_n_0,barycentricRowResetB0_carry__0_i_5_n_0,barycentricRowResetB0_carry__0_i_6_n_0,barycentricRowResetB0_carry__0_i_7_n_0,barycentricRowResetB0_carry__0_i_8_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    barycentricRowResetB0_carry__0_i_1
       (.I0(barycentricYDeltaB[15]),
        .I1(\barycentricRowResetB_reg_n_0_[15] ),
        .O(barycentricRowResetB0_carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    barycentricRowResetB0_carry__0_i_2
       (.I0(\barycentricRowResetB_reg_n_0_[14] ),
        .I1(barycentricYDeltaB[14]),
        .O(barycentricRowResetB0_carry__0_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    barycentricRowResetB0_carry__0_i_3
       (.I0(\barycentricRowResetB_reg_n_0_[13] ),
        .I1(barycentricYDeltaB[13]),
        .O(barycentricRowResetB0_carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    barycentricRowResetB0_carry__0_i_4
       (.I0(\barycentricRowResetB_reg_n_0_[12] ),
        .I1(barycentricYDeltaB[12]),
        .O(barycentricRowResetB0_carry__0_i_4_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    barycentricRowResetB0_carry__0_i_5
       (.I0(\barycentricRowResetB_reg_n_0_[11] ),
        .I1(barycentricYDeltaB[11]),
        .O(barycentricRowResetB0_carry__0_i_5_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    barycentricRowResetB0_carry__0_i_6
       (.I0(\barycentricRowResetB_reg_n_0_[10] ),
        .I1(barycentricYDeltaB[10]),
        .O(barycentricRowResetB0_carry__0_i_6_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    barycentricRowResetB0_carry__0_i_7
       (.I0(\barycentricRowResetB_reg_n_0_[9] ),
        .I1(barycentricYDeltaB[9]),
        .O(barycentricRowResetB0_carry__0_i_7_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    barycentricRowResetB0_carry__0_i_8
       (.I0(\barycentricRowResetB_reg_n_0_[8] ),
        .I1(barycentricYDeltaB[8]),
        .O(barycentricRowResetB0_carry__0_i_8_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 barycentricRowResetB0_carry__1
       (.CI(barycentricRowResetB0_carry__0_n_0),
        .CI_TOP(1'b0),
        .CO({barycentricRowResetB0_carry__1_n_0,barycentricRowResetB0_carry__1_n_1,barycentricRowResetB0_carry__1_n_2,barycentricRowResetB0_carry__1_n_3,barycentricRowResetB0_carry__1_n_4,barycentricRowResetB0_carry__1_n_5,barycentricRowResetB0_carry__1_n_6,barycentricRowResetB0_carry__1_n_7}),
        .DI({\barycentricRowResetB_reg_n_0_[22] ,\barycentricRowResetB_reg_n_0_[21] ,\barycentricRowResetB_reg_n_0_[20] ,\barycentricRowResetB_reg_n_0_[19] ,\barycentricRowResetB_reg_n_0_[18] ,\barycentricRowResetB_reg_n_0_[17] ,\barycentricRowResetB_reg_n_0_[16] ,barycentricRowResetB0_carry__1_i_1_n_0}),
        .O(in24[23:16]),
        .S({barycentricRowResetB0_carry__1_i_2_n_0,barycentricRowResetB0_carry__1_i_3_n_0,barycentricRowResetB0_carry__1_i_4_n_0,barycentricRowResetB0_carry__1_i_5_n_0,barycentricRowResetB0_carry__1_i_6_n_0,barycentricRowResetB0_carry__1_i_7_n_0,barycentricRowResetB0_carry__1_i_8_n_0,barycentricRowResetB0_carry__1_i_9_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    barycentricRowResetB0_carry__1_i_1
       (.I0(barycentricYDeltaB[15]),
        .O(barycentricRowResetB0_carry__1_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    barycentricRowResetB0_carry__1_i_2
       (.I0(\barycentricRowResetB_reg_n_0_[22] ),
        .I1(\barycentricRowResetB_reg_n_0_[23] ),
        .O(barycentricRowResetB0_carry__1_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    barycentricRowResetB0_carry__1_i_3
       (.I0(\barycentricRowResetB_reg_n_0_[21] ),
        .I1(\barycentricRowResetB_reg_n_0_[22] ),
        .O(barycentricRowResetB0_carry__1_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    barycentricRowResetB0_carry__1_i_4
       (.I0(\barycentricRowResetB_reg_n_0_[20] ),
        .I1(\barycentricRowResetB_reg_n_0_[21] ),
        .O(barycentricRowResetB0_carry__1_i_4_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    barycentricRowResetB0_carry__1_i_5
       (.I0(\barycentricRowResetB_reg_n_0_[19] ),
        .I1(\barycentricRowResetB_reg_n_0_[20] ),
        .O(barycentricRowResetB0_carry__1_i_5_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    barycentricRowResetB0_carry__1_i_6
       (.I0(\barycentricRowResetB_reg_n_0_[18] ),
        .I1(\barycentricRowResetB_reg_n_0_[19] ),
        .O(barycentricRowResetB0_carry__1_i_6_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    barycentricRowResetB0_carry__1_i_7
       (.I0(\barycentricRowResetB_reg_n_0_[17] ),
        .I1(\barycentricRowResetB_reg_n_0_[18] ),
        .O(barycentricRowResetB0_carry__1_i_7_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    barycentricRowResetB0_carry__1_i_8
       (.I0(\barycentricRowResetB_reg_n_0_[16] ),
        .I1(\barycentricRowResetB_reg_n_0_[17] ),
        .O(barycentricRowResetB0_carry__1_i_8_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    barycentricRowResetB0_carry__1_i_9
       (.I0(barycentricYDeltaB[15]),
        .I1(\barycentricRowResetB_reg_n_0_[16] ),
        .O(barycentricRowResetB0_carry__1_i_9_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 barycentricRowResetB0_carry__2
       (.CI(barycentricRowResetB0_carry__1_n_0),
        .CI_TOP(1'b0),
        .CO({NLW_barycentricRowResetB0_carry__2_CO_UNCONNECTED[7],barycentricRowResetB0_carry__2_n_1,barycentricRowResetB0_carry__2_n_2,barycentricRowResetB0_carry__2_n_3,barycentricRowResetB0_carry__2_n_4,barycentricRowResetB0_carry__2_n_5,barycentricRowResetB0_carry__2_n_6,barycentricRowResetB0_carry__2_n_7}),
        .DI({1'b0,\barycentricRowResetB_reg_n_0_[29] ,\barycentricRowResetB_reg_n_0_[28] ,\barycentricRowResetB_reg_n_0_[27] ,\barycentricRowResetB_reg_n_0_[26] ,\barycentricRowResetB_reg_n_0_[25] ,\barycentricRowResetB_reg_n_0_[24] ,\barycentricRowResetB_reg_n_0_[23] }),
        .O(in24[31:24]),
        .S({barycentricRowResetB0_carry__2_i_1_n_0,barycentricRowResetB0_carry__2_i_2_n_0,barycentricRowResetB0_carry__2_i_3_n_0,barycentricRowResetB0_carry__2_i_4_n_0,barycentricRowResetB0_carry__2_i_5_n_0,barycentricRowResetB0_carry__2_i_6_n_0,barycentricRowResetB0_carry__2_i_7_n_0,barycentricRowResetB0_carry__2_i_8_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    barycentricRowResetB0_carry__2_i_1
       (.I0(\barycentricRowResetB_reg_n_0_[30] ),
        .I1(\barycentricRowResetB_reg_n_0_[31] ),
        .O(barycentricRowResetB0_carry__2_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    barycentricRowResetB0_carry__2_i_2
       (.I0(\barycentricRowResetB_reg_n_0_[29] ),
        .I1(\barycentricRowResetB_reg_n_0_[30] ),
        .O(barycentricRowResetB0_carry__2_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    barycentricRowResetB0_carry__2_i_3
       (.I0(\barycentricRowResetB_reg_n_0_[28] ),
        .I1(\barycentricRowResetB_reg_n_0_[29] ),
        .O(barycentricRowResetB0_carry__2_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    barycentricRowResetB0_carry__2_i_4
       (.I0(\barycentricRowResetB_reg_n_0_[27] ),
        .I1(\barycentricRowResetB_reg_n_0_[28] ),
        .O(barycentricRowResetB0_carry__2_i_4_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    barycentricRowResetB0_carry__2_i_5
       (.I0(\barycentricRowResetB_reg_n_0_[26] ),
        .I1(\barycentricRowResetB_reg_n_0_[27] ),
        .O(barycentricRowResetB0_carry__2_i_5_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    barycentricRowResetB0_carry__2_i_6
       (.I0(\barycentricRowResetB_reg_n_0_[25] ),
        .I1(\barycentricRowResetB_reg_n_0_[26] ),
        .O(barycentricRowResetB0_carry__2_i_6_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    barycentricRowResetB0_carry__2_i_7
       (.I0(\barycentricRowResetB_reg_n_0_[24] ),
        .I1(\barycentricRowResetB_reg_n_0_[25] ),
        .O(barycentricRowResetB0_carry__2_i_7_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    barycentricRowResetB0_carry__2_i_8
       (.I0(\barycentricRowResetB_reg_n_0_[23] ),
        .I1(\barycentricRowResetB_reg_n_0_[24] ),
        .O(barycentricRowResetB0_carry__2_i_8_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    barycentricRowResetB0_carry_i_1
       (.I0(\barycentricRowResetB_reg_n_0_[7] ),
        .I1(barycentricYDeltaB[7]),
        .O(barycentricRowResetB0_carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    barycentricRowResetB0_carry_i_2
       (.I0(\barycentricRowResetB_reg_n_0_[6] ),
        .I1(barycentricYDeltaB[6]),
        .O(barycentricRowResetB0_carry_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    barycentricRowResetB0_carry_i_3
       (.I0(\barycentricRowResetB_reg_n_0_[5] ),
        .I1(barycentricYDeltaB[5]),
        .O(barycentricRowResetB0_carry_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    barycentricRowResetB0_carry_i_4
       (.I0(\barycentricRowResetB_reg_n_0_[4] ),
        .I1(barycentricYDeltaB[4]),
        .O(barycentricRowResetB0_carry_i_4_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    barycentricRowResetB0_carry_i_5
       (.I0(\barycentricRowResetB_reg_n_0_[3] ),
        .I1(barycentricYDeltaB[3]),
        .O(barycentricRowResetB0_carry_i_5_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    barycentricRowResetB0_carry_i_6
       (.I0(\barycentricRowResetB_reg_n_0_[2] ),
        .I1(barycentricYDeltaB[2]),
        .O(barycentricRowResetB0_carry_i_6_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    barycentricRowResetB0_carry_i_7
       (.I0(\barycentricRowResetB_reg_n_0_[1] ),
        .I1(barycentricYDeltaB[1]),
        .O(barycentricRowResetB0_carry_i_7_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    barycentricRowResetB0_carry_i_8
       (.I0(\barycentricRowResetB_reg_n_0_[0] ),
        .I1(barycentricYDeltaB[0]),
        .O(barycentricRowResetB0_carry_i_8_n_0));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetB[0]_i_1 
       (.I0(in24[0]),
        .I1(TRISETUP_inInitialBarycentricRowResetB[0]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetB[0]));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetB[10]_i_1 
       (.I0(in24[10]),
        .I1(TRISETUP_inInitialBarycentricRowResetB[10]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetB[10]));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetB[11]_i_1 
       (.I0(in24[11]),
        .I1(TRISETUP_inInitialBarycentricRowResetB[11]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetB[11]));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetB[12]_i_1 
       (.I0(in24[12]),
        .I1(TRISETUP_inInitialBarycentricRowResetB[12]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetB[12]));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetB[13]_i_1 
       (.I0(in24[13]),
        .I1(TRISETUP_inInitialBarycentricRowResetB[13]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetB[13]));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetB[14]_i_1 
       (.I0(in24[14]),
        .I1(TRISETUP_inInitialBarycentricRowResetB[14]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetB[14]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetB[15]_i_1 
       (.I0(in24[15]),
        .I1(TRISETUP_inInitialBarycentricRowResetB[15]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetB[15]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetB[16]_i_1 
       (.I0(in24[16]),
        .I1(TRISETUP_inInitialBarycentricRowResetB[16]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetB[16]));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetB[17]_i_1 
       (.I0(in24[17]),
        .I1(TRISETUP_inInitialBarycentricRowResetB[17]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetB[17]));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetB[18]_i_1 
       (.I0(in24[18]),
        .I1(TRISETUP_inInitialBarycentricRowResetB[18]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetB[18]));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetB[19]_i_1 
       (.I0(in24[19]),
        .I1(TRISETUP_inInitialBarycentricRowResetB[19]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetB[19]));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetB[1]_i_1 
       (.I0(in24[1]),
        .I1(TRISETUP_inInitialBarycentricRowResetB[1]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetB[1]));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetB[20]_i_1 
       (.I0(in24[20]),
        .I1(TRISETUP_inInitialBarycentricRowResetB[20]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetB[20]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetB[21]_i_1 
       (.I0(in24[21]),
        .I1(TRISETUP_inInitialBarycentricRowResetB[21]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetB[21]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetB[22]_i_1 
       (.I0(in24[22]),
        .I1(TRISETUP_inInitialBarycentricRowResetB[22]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetB[22]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetB[23]_i_1 
       (.I0(in24[23]),
        .I1(TRISETUP_inInitialBarycentricRowResetB[23]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetB[23]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetB[24]_i_1 
       (.I0(in24[24]),
        .I1(TRISETUP_inInitialBarycentricRowResetB[24]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetB[24]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetB[25]_i_1 
       (.I0(in24[25]),
        .I1(TRISETUP_inInitialBarycentricRowResetB[25]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetB[25]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetB[26]_i_1 
       (.I0(in24[26]),
        .I1(TRISETUP_inInitialBarycentricRowResetB[26]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetB[26]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetB[27]_i_1 
       (.I0(in24[27]),
        .I1(TRISETUP_inInitialBarycentricRowResetB[27]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetB[27]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetB[28]_i_1 
       (.I0(in24[28]),
        .I1(TRISETUP_inInitialBarycentricRowResetB[28]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetB[28]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetB[29]_i_1 
       (.I0(in24[29]),
        .I1(TRISETUP_inInitialBarycentricRowResetB[29]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetB[29]));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetB[2]_i_1 
       (.I0(in24[2]),
        .I1(TRISETUP_inInitialBarycentricRowResetB[2]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetB[2]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetB[30]_i_1 
       (.I0(in24[30]),
        .I1(TRISETUP_inInitialBarycentricRowResetB[30]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetB[30]));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetB[31]_i_1 
       (.I0(in24[31]),
        .I1(TRISETUP_inInitialBarycentricRowResetB[31]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetB[31]));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetB[3]_i_1 
       (.I0(in24[3]),
        .I1(TRISETUP_inInitialBarycentricRowResetB[3]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetB[3]));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetB[4]_i_1 
       (.I0(in24[4]),
        .I1(TRISETUP_inInitialBarycentricRowResetB[4]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetB[4]));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetB[5]_i_1 
       (.I0(in24[5]),
        .I1(TRISETUP_inInitialBarycentricRowResetB[5]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetB[5]));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetB[6]_i_1 
       (.I0(in24[6]),
        .I1(TRISETUP_inInitialBarycentricRowResetB[6]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetB[6]));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetB[7]_i_1 
       (.I0(in24[7]),
        .I1(TRISETUP_inInitialBarycentricRowResetB[7]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetB[7]));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetB[8]_i_1 
       (.I0(in24[8]),
        .I1(TRISETUP_inInitialBarycentricRowResetB[8]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetB[8]));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetB[9]_i_1 
       (.I0(in24[9]),
        .I1(TRISETUP_inInitialBarycentricRowResetB[9]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetB[9]));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetB_reg[0] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetB[0]),
        .Q(\barycentricRowResetB_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetB_reg[10] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetB[10]),
        .Q(\barycentricRowResetB_reg_n_0_[10] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetB_reg[11] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetB[11]),
        .Q(\barycentricRowResetB_reg_n_0_[11] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetB_reg[12] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetB[12]),
        .Q(\barycentricRowResetB_reg_n_0_[12] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetB_reg[13] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetB[13]),
        .Q(\barycentricRowResetB_reg_n_0_[13] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetB_reg[14] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetB[14]),
        .Q(\barycentricRowResetB_reg_n_0_[14] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetB_reg[15] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetB[15]),
        .Q(\barycentricRowResetB_reg_n_0_[15] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetB_reg[16] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetB[16]),
        .Q(\barycentricRowResetB_reg_n_0_[16] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetB_reg[17] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetB[17]),
        .Q(\barycentricRowResetB_reg_n_0_[17] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetB_reg[18] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetB[18]),
        .Q(\barycentricRowResetB_reg_n_0_[18] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetB_reg[19] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetB[19]),
        .Q(\barycentricRowResetB_reg_n_0_[19] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetB_reg[1] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetB[1]),
        .Q(\barycentricRowResetB_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetB_reg[20] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetB[20]),
        .Q(\barycentricRowResetB_reg_n_0_[20] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetB_reg[21] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetB[21]),
        .Q(\barycentricRowResetB_reg_n_0_[21] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetB_reg[22] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetB[22]),
        .Q(\barycentricRowResetB_reg_n_0_[22] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetB_reg[23] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetB[23]),
        .Q(\barycentricRowResetB_reg_n_0_[23] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetB_reg[24] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetB[24]),
        .Q(\barycentricRowResetB_reg_n_0_[24] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetB_reg[25] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetB[25]),
        .Q(\barycentricRowResetB_reg_n_0_[25] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetB_reg[26] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetB[26]),
        .Q(\barycentricRowResetB_reg_n_0_[26] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetB_reg[27] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetB[27]),
        .Q(\barycentricRowResetB_reg_n_0_[27] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetB_reg[28] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetB[28]),
        .Q(\barycentricRowResetB_reg_n_0_[28] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetB_reg[29] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetB[29]),
        .Q(\barycentricRowResetB_reg_n_0_[29] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetB_reg[2] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetB[2]),
        .Q(\barycentricRowResetB_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetB_reg[30] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetB[30]),
        .Q(\barycentricRowResetB_reg_n_0_[30] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetB_reg[31] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetB[31]),
        .Q(\barycentricRowResetB_reg_n_0_[31] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetB_reg[3] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetB[3]),
        .Q(\barycentricRowResetB_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetB_reg[4] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetB[4]),
        .Q(\barycentricRowResetB_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetB_reg[5] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetB[5]),
        .Q(\barycentricRowResetB_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetB_reg[6] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetB[6]),
        .Q(\barycentricRowResetB_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetB_reg[7] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetB[7]),
        .Q(\barycentricRowResetB_reg_n_0_[7] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetB_reg[8] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetB[8]),
        .Q(\barycentricRowResetB_reg_n_0_[8] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetB_reg[9] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetB[9]),
        .Q(\barycentricRowResetB_reg_n_0_[9] ),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY8 barycentricRowResetC0_carry
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({barycentricRowResetC0_carry_n_0,barycentricRowResetC0_carry_n_1,barycentricRowResetC0_carry_n_2,barycentricRowResetC0_carry_n_3,barycentricRowResetC0_carry_n_4,barycentricRowResetC0_carry_n_5,barycentricRowResetC0_carry_n_6,barycentricRowResetC0_carry_n_7}),
        .DI({\barycentricRowResetC_reg_n_0_[7] ,\barycentricRowResetC_reg_n_0_[6] ,\barycentricRowResetC_reg_n_0_[5] ,\barycentricRowResetC_reg_n_0_[4] ,\barycentricRowResetC_reg_n_0_[3] ,\barycentricRowResetC_reg_n_0_[2] ,\barycentricRowResetC_reg_n_0_[1] ,\barycentricRowResetC_reg_n_0_[0] }),
        .O(in22[7:0]),
        .S({barycentricRowResetC0_carry_i_1_n_0,barycentricRowResetC0_carry_i_2_n_0,barycentricRowResetC0_carry_i_3_n_0,barycentricRowResetC0_carry_i_4_n_0,barycentricRowResetC0_carry_i_5_n_0,barycentricRowResetC0_carry_i_6_n_0,barycentricRowResetC0_carry_i_7_n_0,barycentricRowResetC0_carry_i_8_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY8 barycentricRowResetC0_carry__0
       (.CI(barycentricRowResetC0_carry_n_0),
        .CI_TOP(1'b0),
        .CO({barycentricRowResetC0_carry__0_n_0,barycentricRowResetC0_carry__0_n_1,barycentricRowResetC0_carry__0_n_2,barycentricRowResetC0_carry__0_n_3,barycentricRowResetC0_carry__0_n_4,barycentricRowResetC0_carry__0_n_5,barycentricRowResetC0_carry__0_n_6,barycentricRowResetC0_carry__0_n_7}),
        .DI({barycentricYDeltaC[15],\barycentricRowResetC_reg_n_0_[14] ,\barycentricRowResetC_reg_n_0_[13] ,\barycentricRowResetC_reg_n_0_[12] ,\barycentricRowResetC_reg_n_0_[11] ,\barycentricRowResetC_reg_n_0_[10] ,\barycentricRowResetC_reg_n_0_[9] ,\barycentricRowResetC_reg_n_0_[8] }),
        .O(in22[15:8]),
        .S({barycentricRowResetC0_carry__0_i_1_n_0,barycentricRowResetC0_carry__0_i_2_n_0,barycentricRowResetC0_carry__0_i_3_n_0,barycentricRowResetC0_carry__0_i_4_n_0,barycentricRowResetC0_carry__0_i_5_n_0,barycentricRowResetC0_carry__0_i_6_n_0,barycentricRowResetC0_carry__0_i_7_n_0,barycentricRowResetC0_carry__0_i_8_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    barycentricRowResetC0_carry__0_i_1
       (.I0(barycentricYDeltaC[15]),
        .I1(\barycentricRowResetC_reg_n_0_[15] ),
        .O(barycentricRowResetC0_carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    barycentricRowResetC0_carry__0_i_2
       (.I0(\barycentricRowResetC_reg_n_0_[14] ),
        .I1(barycentricYDeltaC[14]),
        .O(barycentricRowResetC0_carry__0_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    barycentricRowResetC0_carry__0_i_3
       (.I0(\barycentricRowResetC_reg_n_0_[13] ),
        .I1(barycentricYDeltaC[13]),
        .O(barycentricRowResetC0_carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    barycentricRowResetC0_carry__0_i_4
       (.I0(\barycentricRowResetC_reg_n_0_[12] ),
        .I1(barycentricYDeltaC[12]),
        .O(barycentricRowResetC0_carry__0_i_4_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    barycentricRowResetC0_carry__0_i_5
       (.I0(\barycentricRowResetC_reg_n_0_[11] ),
        .I1(barycentricYDeltaC[11]),
        .O(barycentricRowResetC0_carry__0_i_5_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    barycentricRowResetC0_carry__0_i_6
       (.I0(\barycentricRowResetC_reg_n_0_[10] ),
        .I1(barycentricYDeltaC[10]),
        .O(barycentricRowResetC0_carry__0_i_6_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    barycentricRowResetC0_carry__0_i_7
       (.I0(\barycentricRowResetC_reg_n_0_[9] ),
        .I1(barycentricYDeltaC[9]),
        .O(barycentricRowResetC0_carry__0_i_7_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    barycentricRowResetC0_carry__0_i_8
       (.I0(\barycentricRowResetC_reg_n_0_[8] ),
        .I1(barycentricYDeltaC[8]),
        .O(barycentricRowResetC0_carry__0_i_8_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY8 barycentricRowResetC0_carry__1
       (.CI(barycentricRowResetC0_carry__0_n_0),
        .CI_TOP(1'b0),
        .CO({barycentricRowResetC0_carry__1_n_0,barycentricRowResetC0_carry__1_n_1,barycentricRowResetC0_carry__1_n_2,barycentricRowResetC0_carry__1_n_3,barycentricRowResetC0_carry__1_n_4,barycentricRowResetC0_carry__1_n_5,barycentricRowResetC0_carry__1_n_6,barycentricRowResetC0_carry__1_n_7}),
        .DI({\barycentricRowResetC_reg_n_0_[22] ,\barycentricRowResetC_reg_n_0_[21] ,\barycentricRowResetC_reg_n_0_[20] ,\barycentricRowResetC_reg_n_0_[19] ,\barycentricRowResetC_reg_n_0_[18] ,\barycentricRowResetC_reg_n_0_[17] ,\barycentricRowResetC_reg_n_0_[16] ,barycentricRowResetC0_carry__1_i_1_n_0}),
        .O(in22[23:16]),
        .S({barycentricRowResetC0_carry__1_i_2_n_0,barycentricRowResetC0_carry__1_i_3_n_0,barycentricRowResetC0_carry__1_i_4_n_0,barycentricRowResetC0_carry__1_i_5_n_0,barycentricRowResetC0_carry__1_i_6_n_0,barycentricRowResetC0_carry__1_i_7_n_0,barycentricRowResetC0_carry__1_i_8_n_0,barycentricRowResetC0_carry__1_i_9_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    barycentricRowResetC0_carry__1_i_1
       (.I0(barycentricYDeltaC[15]),
        .O(barycentricRowResetC0_carry__1_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    barycentricRowResetC0_carry__1_i_2
       (.I0(\barycentricRowResetC_reg_n_0_[22] ),
        .I1(\barycentricRowResetC_reg_n_0_[23] ),
        .O(barycentricRowResetC0_carry__1_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    barycentricRowResetC0_carry__1_i_3
       (.I0(\barycentricRowResetC_reg_n_0_[21] ),
        .I1(\barycentricRowResetC_reg_n_0_[22] ),
        .O(barycentricRowResetC0_carry__1_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    barycentricRowResetC0_carry__1_i_4
       (.I0(\barycentricRowResetC_reg_n_0_[20] ),
        .I1(\barycentricRowResetC_reg_n_0_[21] ),
        .O(barycentricRowResetC0_carry__1_i_4_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    barycentricRowResetC0_carry__1_i_5
       (.I0(\barycentricRowResetC_reg_n_0_[19] ),
        .I1(\barycentricRowResetC_reg_n_0_[20] ),
        .O(barycentricRowResetC0_carry__1_i_5_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    barycentricRowResetC0_carry__1_i_6
       (.I0(\barycentricRowResetC_reg_n_0_[18] ),
        .I1(\barycentricRowResetC_reg_n_0_[19] ),
        .O(barycentricRowResetC0_carry__1_i_6_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    barycentricRowResetC0_carry__1_i_7
       (.I0(\barycentricRowResetC_reg_n_0_[17] ),
        .I1(\barycentricRowResetC_reg_n_0_[18] ),
        .O(barycentricRowResetC0_carry__1_i_7_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    barycentricRowResetC0_carry__1_i_8
       (.I0(\barycentricRowResetC_reg_n_0_[16] ),
        .I1(\barycentricRowResetC_reg_n_0_[17] ),
        .O(barycentricRowResetC0_carry__1_i_8_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    barycentricRowResetC0_carry__1_i_9
       (.I0(barycentricYDeltaC[15]),
        .I1(\barycentricRowResetC_reg_n_0_[16] ),
        .O(barycentricRowResetC0_carry__1_i_9_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY8 barycentricRowResetC0_carry__2
       (.CI(barycentricRowResetC0_carry__1_n_0),
        .CI_TOP(1'b0),
        .CO({NLW_barycentricRowResetC0_carry__2_CO_UNCONNECTED[7],barycentricRowResetC0_carry__2_n_1,barycentricRowResetC0_carry__2_n_2,barycentricRowResetC0_carry__2_n_3,barycentricRowResetC0_carry__2_n_4,barycentricRowResetC0_carry__2_n_5,barycentricRowResetC0_carry__2_n_6,barycentricRowResetC0_carry__2_n_7}),
        .DI({1'b0,\barycentricRowResetC_reg_n_0_[29] ,\barycentricRowResetC_reg_n_0_[28] ,\barycentricRowResetC_reg_n_0_[27] ,\barycentricRowResetC_reg_n_0_[26] ,\barycentricRowResetC_reg_n_0_[25] ,\barycentricRowResetC_reg_n_0_[24] ,\barycentricRowResetC_reg_n_0_[23] }),
        .O(in22[31:24]),
        .S({barycentricRowResetC0_carry__2_i_1_n_0,barycentricRowResetC0_carry__2_i_2_n_0,barycentricRowResetC0_carry__2_i_3_n_0,barycentricRowResetC0_carry__2_i_4_n_0,barycentricRowResetC0_carry__2_i_5_n_0,barycentricRowResetC0_carry__2_i_6_n_0,barycentricRowResetC0_carry__2_i_7_n_0,barycentricRowResetC0_carry__2_i_8_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    barycentricRowResetC0_carry__2_i_1
       (.I0(\barycentricRowResetC_reg_n_0_[30] ),
        .I1(\barycentricRowResetC_reg_n_0_[31] ),
        .O(barycentricRowResetC0_carry__2_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    barycentricRowResetC0_carry__2_i_2
       (.I0(\barycentricRowResetC_reg_n_0_[29] ),
        .I1(\barycentricRowResetC_reg_n_0_[30] ),
        .O(barycentricRowResetC0_carry__2_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    barycentricRowResetC0_carry__2_i_3
       (.I0(\barycentricRowResetC_reg_n_0_[28] ),
        .I1(\barycentricRowResetC_reg_n_0_[29] ),
        .O(barycentricRowResetC0_carry__2_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    barycentricRowResetC0_carry__2_i_4
       (.I0(\barycentricRowResetC_reg_n_0_[27] ),
        .I1(\barycentricRowResetC_reg_n_0_[28] ),
        .O(barycentricRowResetC0_carry__2_i_4_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    barycentricRowResetC0_carry__2_i_5
       (.I0(\barycentricRowResetC_reg_n_0_[26] ),
        .I1(\barycentricRowResetC_reg_n_0_[27] ),
        .O(barycentricRowResetC0_carry__2_i_5_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    barycentricRowResetC0_carry__2_i_6
       (.I0(\barycentricRowResetC_reg_n_0_[25] ),
        .I1(\barycentricRowResetC_reg_n_0_[26] ),
        .O(barycentricRowResetC0_carry__2_i_6_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    barycentricRowResetC0_carry__2_i_7
       (.I0(\barycentricRowResetC_reg_n_0_[24] ),
        .I1(\barycentricRowResetC_reg_n_0_[25] ),
        .O(barycentricRowResetC0_carry__2_i_7_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    barycentricRowResetC0_carry__2_i_8
       (.I0(\barycentricRowResetC_reg_n_0_[23] ),
        .I1(\barycentricRowResetC_reg_n_0_[24] ),
        .O(barycentricRowResetC0_carry__2_i_8_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    barycentricRowResetC0_carry_i_1
       (.I0(\barycentricRowResetC_reg_n_0_[7] ),
        .I1(barycentricYDeltaC[7]),
        .O(barycentricRowResetC0_carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    barycentricRowResetC0_carry_i_2
       (.I0(\barycentricRowResetC_reg_n_0_[6] ),
        .I1(barycentricYDeltaC[6]),
        .O(barycentricRowResetC0_carry_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    barycentricRowResetC0_carry_i_3
       (.I0(\barycentricRowResetC_reg_n_0_[5] ),
        .I1(barycentricYDeltaC[5]),
        .O(barycentricRowResetC0_carry_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    barycentricRowResetC0_carry_i_4
       (.I0(\barycentricRowResetC_reg_n_0_[4] ),
        .I1(barycentricYDeltaC[4]),
        .O(barycentricRowResetC0_carry_i_4_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    barycentricRowResetC0_carry_i_5
       (.I0(\barycentricRowResetC_reg_n_0_[3] ),
        .I1(barycentricYDeltaC[3]),
        .O(barycentricRowResetC0_carry_i_5_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    barycentricRowResetC0_carry_i_6
       (.I0(\barycentricRowResetC_reg_n_0_[2] ),
        .I1(barycentricYDeltaC[2]),
        .O(barycentricRowResetC0_carry_i_6_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    barycentricRowResetC0_carry_i_7
       (.I0(\barycentricRowResetC_reg_n_0_[1] ),
        .I1(barycentricYDeltaC[1]),
        .O(barycentricRowResetC0_carry_i_7_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    barycentricRowResetC0_carry_i_8
       (.I0(\barycentricRowResetC_reg_n_0_[0] ),
        .I1(barycentricYDeltaC[0]),
        .O(barycentricRowResetC0_carry_i_8_n_0));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetC[0]_i_1 
       (.I0(in22[0]),
        .I1(TRISETUP_inInitialBarycentricRowResetC[0]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetC[0]));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetC[10]_i_1 
       (.I0(in22[10]),
        .I1(TRISETUP_inInitialBarycentricRowResetC[10]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetC[10]));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetC[11]_i_1 
       (.I0(in22[11]),
        .I1(TRISETUP_inInitialBarycentricRowResetC[11]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetC[11]));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetC[12]_i_1 
       (.I0(in22[12]),
        .I1(TRISETUP_inInitialBarycentricRowResetC[12]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetC[12]));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetC[13]_i_1 
       (.I0(in22[13]),
        .I1(TRISETUP_inInitialBarycentricRowResetC[13]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetC[13]));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetC[14]_i_1 
       (.I0(in22[14]),
        .I1(TRISETUP_inInitialBarycentricRowResetC[14]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetC[14]));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetC[15]_i_1 
       (.I0(in22[15]),
        .I1(TRISETUP_inInitialBarycentricRowResetC[15]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetC[15]));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetC[16]_i_1 
       (.I0(in22[16]),
        .I1(TRISETUP_inInitialBarycentricRowResetC[16]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetC[16]));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetC[17]_i_1 
       (.I0(in22[17]),
        .I1(TRISETUP_inInitialBarycentricRowResetC[17]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetC[17]));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetC[18]_i_1 
       (.I0(in22[18]),
        .I1(TRISETUP_inInitialBarycentricRowResetC[18]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetC[18]));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetC[19]_i_1 
       (.I0(in22[19]),
        .I1(TRISETUP_inInitialBarycentricRowResetC[19]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetC[19]));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetC[1]_i_1 
       (.I0(in22[1]),
        .I1(TRISETUP_inInitialBarycentricRowResetC[1]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetC[1]));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetC[20]_i_1 
       (.I0(in22[20]),
        .I1(TRISETUP_inInitialBarycentricRowResetC[20]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetC[20]));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetC[21]_i_1 
       (.I0(in22[21]),
        .I1(TRISETUP_inInitialBarycentricRowResetC[21]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetC[21]));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetC[22]_i_1 
       (.I0(in22[22]),
        .I1(TRISETUP_inInitialBarycentricRowResetC[22]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetC[22]));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetC[23]_i_1 
       (.I0(in22[23]),
        .I1(TRISETUP_inInitialBarycentricRowResetC[23]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetC[23]));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetC[24]_i_1 
       (.I0(in22[24]),
        .I1(TRISETUP_inInitialBarycentricRowResetC[24]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetC[24]));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetC[25]_i_1 
       (.I0(in22[25]),
        .I1(TRISETUP_inInitialBarycentricRowResetC[25]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetC[25]));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetC[26]_i_1 
       (.I0(in22[26]),
        .I1(TRISETUP_inInitialBarycentricRowResetC[26]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetC[26]));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetC[27]_i_1 
       (.I0(in22[27]),
        .I1(TRISETUP_inInitialBarycentricRowResetC[27]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetC[27]));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetC[28]_i_1 
       (.I0(in22[28]),
        .I1(TRISETUP_inInitialBarycentricRowResetC[28]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetC[28]));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetC[29]_i_1 
       (.I0(in22[29]),
        .I1(TRISETUP_inInitialBarycentricRowResetC[29]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetC[29]));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetC[2]_i_1 
       (.I0(in22[2]),
        .I1(TRISETUP_inInitialBarycentricRowResetC[2]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetC[2]));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetC[30]_i_1 
       (.I0(in22[30]),
        .I1(TRISETUP_inInitialBarycentricRowResetC[30]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetC[30]));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetC[31]_i_1 
       (.I0(in22[31]),
        .I1(TRISETUP_inInitialBarycentricRowResetC[31]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetC[31]));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetC[3]_i_1 
       (.I0(in22[3]),
        .I1(TRISETUP_inInitialBarycentricRowResetC[3]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetC[3]));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetC[4]_i_1 
       (.I0(in22[4]),
        .I1(TRISETUP_inInitialBarycentricRowResetC[4]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetC[4]));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetC[5]_i_1 
       (.I0(in22[5]),
        .I1(TRISETUP_inInitialBarycentricRowResetC[5]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetC[5]));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetC[6]_i_1 
       (.I0(in22[6]),
        .I1(TRISETUP_inInitialBarycentricRowResetC[6]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetC[6]));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetC[7]_i_1 
       (.I0(in22[7]),
        .I1(TRISETUP_inInitialBarycentricRowResetC[7]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetC[7]));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetC[8]_i_1 
       (.I0(in22[8]),
        .I1(TRISETUP_inInitialBarycentricRowResetC[8]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetC[8]));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \barycentricRowResetC[9]_i_1 
       (.I0(in22[9]),
        .I1(TRISETUP_inInitialBarycentricRowResetC[9]),
        .I2(currentState__0[0]),
        .O(barycentricRowResetC[9]));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetC_reg[0] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetC[0]),
        .Q(\barycentricRowResetC_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetC_reg[10] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetC[10]),
        .Q(\barycentricRowResetC_reg_n_0_[10] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetC_reg[11] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetC[11]),
        .Q(\barycentricRowResetC_reg_n_0_[11] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetC_reg[12] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetC[12]),
        .Q(\barycentricRowResetC_reg_n_0_[12] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetC_reg[13] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetC[13]),
        .Q(\barycentricRowResetC_reg_n_0_[13] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetC_reg[14] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetC[14]),
        .Q(\barycentricRowResetC_reg_n_0_[14] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetC_reg[15] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetC[15]),
        .Q(\barycentricRowResetC_reg_n_0_[15] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetC_reg[16] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetC[16]),
        .Q(\barycentricRowResetC_reg_n_0_[16] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetC_reg[17] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetC[17]),
        .Q(\barycentricRowResetC_reg_n_0_[17] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetC_reg[18] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetC[18]),
        .Q(\barycentricRowResetC_reg_n_0_[18] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetC_reg[19] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetC[19]),
        .Q(\barycentricRowResetC_reg_n_0_[19] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetC_reg[1] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetC[1]),
        .Q(\barycentricRowResetC_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetC_reg[20] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetC[20]),
        .Q(\barycentricRowResetC_reg_n_0_[20] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetC_reg[21] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetC[21]),
        .Q(\barycentricRowResetC_reg_n_0_[21] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetC_reg[22] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetC[22]),
        .Q(\barycentricRowResetC_reg_n_0_[22] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetC_reg[23] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetC[23]),
        .Q(\barycentricRowResetC_reg_n_0_[23] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetC_reg[24] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetC[24]),
        .Q(\barycentricRowResetC_reg_n_0_[24] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetC_reg[25] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetC[25]),
        .Q(\barycentricRowResetC_reg_n_0_[25] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetC_reg[26] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetC[26]),
        .Q(\barycentricRowResetC_reg_n_0_[26] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetC_reg[27] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetC[27]),
        .Q(\barycentricRowResetC_reg_n_0_[27] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetC_reg[28] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetC[28]),
        .Q(\barycentricRowResetC_reg_n_0_[28] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetC_reg[29] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetC[29]),
        .Q(\barycentricRowResetC_reg_n_0_[29] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetC_reg[2] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetC[2]),
        .Q(\barycentricRowResetC_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetC_reg[30] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetC[30]),
        .Q(\barycentricRowResetC_reg_n_0_[30] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetC_reg[31] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetC[31]),
        .Q(\barycentricRowResetC_reg_n_0_[31] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetC_reg[3] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetC[3]),
        .Q(\barycentricRowResetC_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetC_reg[4] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetC[4]),
        .Q(\barycentricRowResetC_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetC_reg[5] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetC[5]),
        .Q(\barycentricRowResetC_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetC_reg[6] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetC[6]),
        .Q(\barycentricRowResetC_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetC_reg[7] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetC[7]),
        .Q(\barycentricRowResetC_reg_n_0_[7] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetC_reg[8] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetC[8]),
        .Q(\barycentricRowResetC_reg_n_0_[8] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricRowResetC_reg[9] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(barycentricRowResetC[9]),
        .Q(\barycentricRowResetC_reg_n_0_[9] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricXDeltaA_reg[0] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricXDeltaA[0]),
        .Q(barycentricXDeltaA[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricXDeltaA_reg[10] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricXDeltaA[10]),
        .Q(barycentricXDeltaA[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricXDeltaA_reg[11] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricXDeltaA[11]),
        .Q(barycentricXDeltaA[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricXDeltaA_reg[12] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricXDeltaA[12]),
        .Q(barycentricXDeltaA[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricXDeltaA_reg[13] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricXDeltaA[13]),
        .Q(barycentricXDeltaA[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricXDeltaA_reg[14] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricXDeltaA[14]),
        .Q(barycentricXDeltaA[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricXDeltaA_reg[15] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricXDeltaA[15]),
        .Q(barycentricXDeltaA[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricXDeltaA_reg[1] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricXDeltaA[1]),
        .Q(barycentricXDeltaA[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricXDeltaA_reg[2] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricXDeltaA[2]),
        .Q(barycentricXDeltaA[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricXDeltaA_reg[3] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricXDeltaA[3]),
        .Q(barycentricXDeltaA[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricXDeltaA_reg[4] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricXDeltaA[4]),
        .Q(barycentricXDeltaA[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricXDeltaA_reg[5] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricXDeltaA[5]),
        .Q(barycentricXDeltaA[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricXDeltaA_reg[6] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricXDeltaA[6]),
        .Q(barycentricXDeltaA[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricXDeltaA_reg[7] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricXDeltaA[7]),
        .Q(barycentricXDeltaA[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricXDeltaA_reg[8] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricXDeltaA[8]),
        .Q(barycentricXDeltaA[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricXDeltaA_reg[9] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricXDeltaA[9]),
        .Q(barycentricXDeltaA[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricXDeltaB_reg[0] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricXDeltaB[0]),
        .Q(barycentricXDeltaB[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricXDeltaB_reg[10] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricXDeltaB[10]),
        .Q(barycentricXDeltaB[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricXDeltaB_reg[11] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricXDeltaB[11]),
        .Q(barycentricXDeltaB[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricXDeltaB_reg[12] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricXDeltaB[12]),
        .Q(barycentricXDeltaB[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricXDeltaB_reg[13] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricXDeltaB[13]),
        .Q(barycentricXDeltaB[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricXDeltaB_reg[14] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricXDeltaB[14]),
        .Q(barycentricXDeltaB[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricXDeltaB_reg[15] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricXDeltaB[15]),
        .Q(barycentricXDeltaB[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricXDeltaB_reg[1] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricXDeltaB[1]),
        .Q(barycentricXDeltaB[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricXDeltaB_reg[2] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricXDeltaB[2]),
        .Q(barycentricXDeltaB[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricXDeltaB_reg[3] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricXDeltaB[3]),
        .Q(barycentricXDeltaB[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricXDeltaB_reg[4] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricXDeltaB[4]),
        .Q(barycentricXDeltaB[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricXDeltaB_reg[5] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricXDeltaB[5]),
        .Q(barycentricXDeltaB[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricXDeltaB_reg[6] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricXDeltaB[6]),
        .Q(barycentricXDeltaB[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricXDeltaB_reg[7] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricXDeltaB[7]),
        .Q(barycentricXDeltaB[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricXDeltaB_reg[8] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricXDeltaB[8]),
        .Q(barycentricXDeltaB[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricXDeltaB_reg[9] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricXDeltaB[9]),
        .Q(barycentricXDeltaB[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricXDeltaC_reg[0] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricXDeltaC[0]),
        .Q(barycentricXDeltaC[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricXDeltaC_reg[10] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricXDeltaC[10]),
        .Q(barycentricXDeltaC[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricXDeltaC_reg[11] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricXDeltaC[11]),
        .Q(barycentricXDeltaC[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricXDeltaC_reg[12] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricXDeltaC[12]),
        .Q(barycentricXDeltaC[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricXDeltaC_reg[13] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricXDeltaC[13]),
        .Q(barycentricXDeltaC[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricXDeltaC_reg[14] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricXDeltaC[14]),
        .Q(barycentricXDeltaC[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricXDeltaC_reg[15] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricXDeltaC[15]),
        .Q(barycentricXDeltaC[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricXDeltaC_reg[1] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricXDeltaC[1]),
        .Q(barycentricXDeltaC[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricXDeltaC_reg[2] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricXDeltaC[2]),
        .Q(barycentricXDeltaC[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricXDeltaC_reg[3] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricXDeltaC[3]),
        .Q(barycentricXDeltaC[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricXDeltaC_reg[4] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricXDeltaC[4]),
        .Q(barycentricXDeltaC[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricXDeltaC_reg[5] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricXDeltaC[5]),
        .Q(barycentricXDeltaC[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricXDeltaC_reg[6] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricXDeltaC[6]),
        .Q(barycentricXDeltaC[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricXDeltaC_reg[7] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricXDeltaC[7]),
        .Q(barycentricXDeltaC[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricXDeltaC_reg[8] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricXDeltaC[8]),
        .Q(barycentricXDeltaC[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricXDeltaC_reg[9] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricXDeltaC[9]),
        .Q(barycentricXDeltaC[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricYDeltaA_reg[0] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricYDeltaA[0]),
        .Q(barycentricYDeltaA[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricYDeltaA_reg[10] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricYDeltaA[10]),
        .Q(barycentricYDeltaA[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricYDeltaA_reg[11] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricYDeltaA[11]),
        .Q(barycentricYDeltaA[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricYDeltaA_reg[12] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricYDeltaA[12]),
        .Q(barycentricYDeltaA[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricYDeltaA_reg[13] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricYDeltaA[13]),
        .Q(barycentricYDeltaA[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricYDeltaA_reg[14] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricYDeltaA[14]),
        .Q(barycentricYDeltaA[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricYDeltaA_reg[15] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricYDeltaA[15]),
        .Q(barycentricYDeltaA[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricYDeltaA_reg[1] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricYDeltaA[1]),
        .Q(barycentricYDeltaA[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricYDeltaA_reg[2] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricYDeltaA[2]),
        .Q(barycentricYDeltaA[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricYDeltaA_reg[3] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricYDeltaA[3]),
        .Q(barycentricYDeltaA[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricYDeltaA_reg[4] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricYDeltaA[4]),
        .Q(barycentricYDeltaA[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricYDeltaA_reg[5] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricYDeltaA[5]),
        .Q(barycentricYDeltaA[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricYDeltaA_reg[6] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricYDeltaA[6]),
        .Q(barycentricYDeltaA[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricYDeltaA_reg[7] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricYDeltaA[7]),
        .Q(barycentricYDeltaA[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricYDeltaA_reg[8] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricYDeltaA[8]),
        .Q(barycentricYDeltaA[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricYDeltaA_reg[9] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricYDeltaA[9]),
        .Q(barycentricYDeltaA[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricYDeltaB_reg[0] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricYDeltaB[0]),
        .Q(barycentricYDeltaB[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricYDeltaB_reg[10] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricYDeltaB[10]),
        .Q(barycentricYDeltaB[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricYDeltaB_reg[11] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricYDeltaB[11]),
        .Q(barycentricYDeltaB[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricYDeltaB_reg[12] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricYDeltaB[12]),
        .Q(barycentricYDeltaB[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricYDeltaB_reg[13] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricYDeltaB[13]),
        .Q(barycentricYDeltaB[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricYDeltaB_reg[14] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricYDeltaB[14]),
        .Q(barycentricYDeltaB[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricYDeltaB_reg[15] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricYDeltaB[15]),
        .Q(barycentricYDeltaB[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricYDeltaB_reg[1] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricYDeltaB[1]),
        .Q(barycentricYDeltaB[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricYDeltaB_reg[2] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricYDeltaB[2]),
        .Q(barycentricYDeltaB[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricYDeltaB_reg[3] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricYDeltaB[3]),
        .Q(barycentricYDeltaB[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricYDeltaB_reg[4] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricYDeltaB[4]),
        .Q(barycentricYDeltaB[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricYDeltaB_reg[5] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricYDeltaB[5]),
        .Q(barycentricYDeltaB[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricYDeltaB_reg[6] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricYDeltaB[6]),
        .Q(barycentricYDeltaB[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricYDeltaB_reg[7] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricYDeltaB[7]),
        .Q(barycentricYDeltaB[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricYDeltaB_reg[8] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricYDeltaB[8]),
        .Q(barycentricYDeltaB[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricYDeltaB_reg[9] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricYDeltaB[9]),
        .Q(barycentricYDeltaB[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricYDeltaC_reg[0] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricYDeltaC[0]),
        .Q(barycentricYDeltaC[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricYDeltaC_reg[10] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricYDeltaC[10]),
        .Q(barycentricYDeltaC[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricYDeltaC_reg[11] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricYDeltaC[11]),
        .Q(barycentricYDeltaC[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricYDeltaC_reg[12] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricYDeltaC[12]),
        .Q(barycentricYDeltaC[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricYDeltaC_reg[13] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricYDeltaC[13]),
        .Q(barycentricYDeltaC[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricYDeltaC_reg[14] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricYDeltaC[14]),
        .Q(barycentricYDeltaC[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricYDeltaC_reg[15] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricYDeltaC[15]),
        .Q(barycentricYDeltaC[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricYDeltaC_reg[1] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricYDeltaC[1]),
        .Q(barycentricYDeltaC[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricYDeltaC_reg[2] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricYDeltaC[2]),
        .Q(barycentricYDeltaC[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricYDeltaC_reg[3] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricYDeltaC[3]),
        .Q(barycentricYDeltaC[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricYDeltaC_reg[4] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricYDeltaC[4]),
        .Q(barycentricYDeltaC[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricYDeltaC_reg[5] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricYDeltaC[5]),
        .Q(barycentricYDeltaC[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricYDeltaC_reg[6] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricYDeltaC[6]),
        .Q(barycentricYDeltaC[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricYDeltaC_reg[7] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricYDeltaC[7]),
        .Q(barycentricYDeltaC[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricYDeltaC_reg[8] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricYDeltaC[8]),
        .Q(barycentricYDeltaC[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \barycentricYDeltaC_reg[9] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inBarycentricYDeltaC[9]),
        .Q(barycentricYDeltaC[9]),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h00001000)) 
    \currentDrawEventID[15]_i_1 
       (.I0(currentState__0[0]),
        .I1(currentState__0[2]),
        .I2(TRISETUP_newTriBegin),
        .I3(TRISETUP_readyForNewTri),
        .I4(currentState__0[1]),
        .O(previousDrawEventID_0));
  FDRE #(
    .INIT(1'b0)) 
    \currentDrawEventID_reg[0] 
       (.C(clk),
        .CE(previousDrawEventID_0),
        .D(TRISETUP_CurrentDrawEventID[0]),
        .Q(currentDrawEventID[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentDrawEventID_reg[10] 
       (.C(clk),
        .CE(previousDrawEventID_0),
        .D(TRISETUP_CurrentDrawEventID[10]),
        .Q(currentDrawEventID[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentDrawEventID_reg[11] 
       (.C(clk),
        .CE(previousDrawEventID_0),
        .D(TRISETUP_CurrentDrawEventID[11]),
        .Q(currentDrawEventID[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentDrawEventID_reg[12] 
       (.C(clk),
        .CE(previousDrawEventID_0),
        .D(TRISETUP_CurrentDrawEventID[12]),
        .Q(currentDrawEventID[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentDrawEventID_reg[13] 
       (.C(clk),
        .CE(previousDrawEventID_0),
        .D(TRISETUP_CurrentDrawEventID[13]),
        .Q(currentDrawEventID[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentDrawEventID_reg[14] 
       (.C(clk),
        .CE(previousDrawEventID_0),
        .D(TRISETUP_CurrentDrawEventID[14]),
        .Q(currentDrawEventID[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentDrawEventID_reg[15] 
       (.C(clk),
        .CE(previousDrawEventID_0),
        .D(TRISETUP_CurrentDrawEventID[15]),
        .Q(currentDrawEventID[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentDrawEventID_reg[1] 
       (.C(clk),
        .CE(previousDrawEventID_0),
        .D(TRISETUP_CurrentDrawEventID[1]),
        .Q(currentDrawEventID[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentDrawEventID_reg[2] 
       (.C(clk),
        .CE(previousDrawEventID_0),
        .D(TRISETUP_CurrentDrawEventID[2]),
        .Q(currentDrawEventID[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentDrawEventID_reg[3] 
       (.C(clk),
        .CE(previousDrawEventID_0),
        .D(TRISETUP_CurrentDrawEventID[3]),
        .Q(currentDrawEventID[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentDrawEventID_reg[4] 
       (.C(clk),
        .CE(previousDrawEventID_0),
        .D(TRISETUP_CurrentDrawEventID[4]),
        .Q(currentDrawEventID[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentDrawEventID_reg[5] 
       (.C(clk),
        .CE(previousDrawEventID_0),
        .D(TRISETUP_CurrentDrawEventID[5]),
        .Q(currentDrawEventID[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentDrawEventID_reg[6] 
       (.C(clk),
        .CE(previousDrawEventID_0),
        .D(TRISETUP_CurrentDrawEventID[6]),
        .Q(currentDrawEventID[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentDrawEventID_reg[7] 
       (.C(clk),
        .CE(previousDrawEventID_0),
        .D(TRISETUP_CurrentDrawEventID[7]),
        .Q(currentDrawEventID[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentDrawEventID_reg[8] 
       (.C(clk),
        .CE(previousDrawEventID_0),
        .D(TRISETUP_CurrentDrawEventID[8]),
        .Q(currentDrawEventID[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentDrawEventID_reg[9] 
       (.C(clk),
        .CE(previousDrawEventID_0),
        .D(TRISETUP_CurrentDrawEventID[9]),
        .Q(currentDrawEventID[9]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFF0F006FFF0F0060)) 
    \currentState[0]__0_i_1 
       (.I0(hasWrittenPixelsForThisTriangle_reg_n_0),
        .I1(\currentState[2]__0_i_4_n_0 ),
        .I2(\currentState_reg[2]__0_0 [0]),
        .I3(\currentState_reg[2]__0_0 [2]),
        .I4(\currentState_reg[2]__0_0 [1]),
        .I5(\currentState[0]__0_i_2_n_0 ),
        .O(\currentState[0]__0_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hEA)) 
    \currentState[0]__0_i_2 
       (.I0(\currentState[2]__0_i_5_n_0 ),
        .I1(\currentState[0]__0_i_3_n_0 ),
        .I2(\currentState[0]__0_i_4_n_0 ),
        .O(\currentState[0]__0_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00000001)) 
    \currentState[0]__0_i_3 
       (.I0(currentDrawEventID[12]),
        .I1(currentDrawEventID[13]),
        .I2(currentDrawEventID[15]),
        .I3(currentDrawEventID[14]),
        .I4(\currentState[0]__0_i_5_n_0 ),
        .O(\currentState[0]__0_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h00000001)) 
    \currentState[0]__0_i_4 
       (.I0(currentDrawEventID[4]),
        .I1(currentDrawEventID[5]),
        .I2(currentDrawEventID[6]),
        .I3(currentDrawEventID[7]),
        .I4(\currentState[0]__0_i_6_n_0 ),
        .O(\currentState[0]__0_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \currentState[0]__0_i_5 
       (.I0(currentDrawEventID[9]),
        .I1(currentDrawEventID[8]),
        .I2(currentDrawEventID[11]),
        .I3(currentDrawEventID[10]),
        .O(\currentState[0]__0_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \currentState[0]__0_i_6 
       (.I0(currentDrawEventID[1]),
        .I1(currentDrawEventID[0]),
        .I2(currentDrawEventID[3]),
        .I3(currentDrawEventID[2]),
        .O(\currentState[0]__0_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFF0F006FFF0F0060)) 
    \currentState[0]_i_1 
       (.I0(hasWrittenPixelsForThisTriangle_reg_n_0),
        .I1(\currentState[2]__0_i_4_n_0 ),
        .I2(currentState__0[0]),
        .I3(currentState__0[2]),
        .I4(currentState__0[1]),
        .I5(\currentState[0]__0_i_2_n_0 ),
        .O(currentState__1[0]));
  LUT6 #(
    .INIT(64'h0F000F000F400F4F)) 
    \currentState[1]__0_i_1 
       (.I0(pixelXPos1_carry_n_0),
        .I1(fifoWriteEnable2),
        .I2(\currentState_reg[2]__0_0 [0]),
        .I3(\currentState_reg[2]__0_0 [2]),
        .I4(\currentState[2]__0_i_5_n_0 ),
        .I5(\currentState_reg[2]__0_0 [1]),
        .O(\currentState[1]__0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0F000F000F400F4F)) 
    \currentState[1]_i_1 
       (.I0(pixelXPos1_carry_n_0),
        .I1(fifoWriteEnable2),
        .I2(currentState__0[0]),
        .I3(currentState__0[2]),
        .I4(\currentState[2]__0_i_5_n_0 ),
        .I5(currentState__0[1]),
        .O(currentState__1[1]));
  LUT6 #(
    .INIT(64'hFFDFFFCCCCDCCCCC)) 
    \currentState[2]__0_i_1 
       (.I0(TRICACHE_IsFull),
        .I1(\currentState[2]__0_i_3_n_0 ),
        .I2(currentState__0[0]),
        .I3(currentState__0[2]),
        .I4(currentState__0[1]),
        .I5(fifoWriteEnable_i_4_n_0),
        .O(currentState));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \currentState[2]__0_i_10 
       (.I0(currentDrawEventID[3]),
        .I1(TRISETUP_CurrentDrawEventID[3]),
        .I2(TRISETUP_CurrentDrawEventID[5]),
        .I3(currentDrawEventID[5]),
        .I4(TRISETUP_CurrentDrawEventID[4]),
        .I5(currentDrawEventID[4]),
        .O(\currentState[2]__0_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \currentState[2]__0_i_11 
       (.I0(currentDrawEventID[0]),
        .I1(TRISETUP_CurrentDrawEventID[0]),
        .I2(TRISETUP_CurrentDrawEventID[2]),
        .I3(currentDrawEventID[2]),
        .I4(TRISETUP_CurrentDrawEventID[1]),
        .I5(currentDrawEventID[1]),
        .O(\currentState[2]__0_i_11_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \currentState[2]__0_i_12 
       (.I0(currentDrawEventID[9]),
        .I1(TRISETUP_CurrentDrawEventID[9]),
        .I2(TRISETUP_CurrentDrawEventID[11]),
        .I3(currentDrawEventID[11]),
        .I4(TRISETUP_CurrentDrawEventID[10]),
        .I5(currentDrawEventID[10]),
        .O(\currentState[2]__0_i_12_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \currentState[2]__0_i_13 
       (.I0(currentDrawEventID[6]),
        .I1(TRISETUP_CurrentDrawEventID[6]),
        .I2(TRISETUP_CurrentDrawEventID[8]),
        .I3(currentDrawEventID[8]),
        .I4(TRISETUP_CurrentDrawEventID[7]),
        .I5(currentDrawEventID[7]),
        .O(\currentState[2]__0_i_13_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \currentState[2]__0_i_14 
       (.I0(TRISETUP_CurrentDrawEventID[15]),
        .I1(currentDrawEventID[15]),
        .O(\currentState[2]__0_i_14_n_0 ));
  LUT6 #(
    .INIT(64'h0F00F0200F00F02F)) 
    \currentState[2]__0_i_2 
       (.I0(hasWrittenPixelsForThisTriangle_reg_n_0),
        .I1(\currentState[2]__0_i_4_n_0 ),
        .I2(\currentState_reg[2]__0_0 [0]),
        .I3(\currentState_reg[2]__0_0 [1]),
        .I4(\currentState_reg[2]__0_0 [2]),
        .I5(\currentState[2]__0_i_5_n_0 ),
        .O(\currentState[2]__0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hE0E0E0E0E0202020)) 
    \currentState[2]__0_i_3 
       (.I0(hasWrittenPixelsForThisTriangle0__0),
        .I1(currentState__0[0]),
        .I2(\currentState[2]__0_i_7_n_0 ),
        .I3(\currentState[2]__0_i_8_n_0 ),
        .I4(fifoWriteEnable2),
        .I5(pixelXPos1_carry_n_0),
        .O(\currentState[2]__0_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \currentState[2]__0_i_4 
       (.I0(fifoWriteEnable2),
        .I1(pixelXPos1_carry_n_0),
        .O(\currentState[2]__0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \currentState[2]__0_i_5 
       (.I0(\currentState[2]__0_i_9_n_0 ),
        .I1(\currentState[2]__0_i_10_n_0 ),
        .I2(\currentState[2]__0_i_11_n_0 ),
        .I3(\currentState[2]__0_i_12_n_0 ),
        .I4(\currentState[2]__0_i_13_n_0 ),
        .I5(\currentState[2]__0_i_14_n_0 ),
        .O(\currentState[2]__0_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair106" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \currentState[2]__0_i_6 
       (.I0(TRISETUP_newTriBegin),
        .I1(TRISETUP_readyForNewTri),
        .O(hasWrittenPixelsForThisTriangle0__0));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \currentState[2]__0_i_7 
       (.I0(currentState__0[1]),
        .I1(currentState__0[2]),
        .O(\currentState[2]__0_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'hA8AA)) 
    \currentState[2]__0_i_8 
       (.I0(fifoWriteEnable1__1),
        .I1(RASTOUT_FIFO_full),
        .I2(RASTOUT_FIFO_almost_full),
        .I3(hasWrittenPixelsForThisTriangle_reg_n_0),
        .O(\currentState[2]__0_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \currentState[2]__0_i_9 
       (.I0(currentDrawEventID[12]),
        .I1(TRISETUP_CurrentDrawEventID[12]),
        .I2(TRISETUP_CurrentDrawEventID[14]),
        .I3(currentDrawEventID[14]),
        .I4(TRISETUP_CurrentDrawEventID[13]),
        .I5(currentDrawEventID[13]),
        .O(\currentState[2]__0_i_9_n_0 ));
  LUT6 #(
    .INIT(64'h0F00F0200F00F02F)) 
    \currentState[2]_i_1 
       (.I0(hasWrittenPixelsForThisTriangle_reg_n_0),
        .I1(\currentState[2]__0_i_4_n_0 ),
        .I2(currentState__0[0]),
        .I3(currentState__0[1]),
        .I4(currentState__0[2]),
        .I5(\currentState[2]__0_i_5_n_0 ),
        .O(currentState__1[2]));
  (* FSM_ENCODED_STATES = "trirasterize_sendsetnewtrislotcommand:100,trirasterize_mainloop:001,trirasterize_sendfinishdraweventcommand:110,trirasterize_waitforwritecomplete:010,trirasterize_allocatenewtricacheslot:011,trirasterize_waitfortridata:000,trirasterize_sendfinishtricommand:101,trirasterize_sendsetnewdraweventcommand:111" *) 
  FDRE #(
    .INIT(1'b0)) 
    \currentState_reg[0] 
       (.C(clk),
        .CE(currentState),
        .D(currentState__1[0]),
        .Q(currentState__0[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentState_reg[0]__0 
       (.C(clk),
        .CE(currentState),
        .D(\currentState[0]__0_i_1_n_0 ),
        .Q(\currentState_reg[2]__0_0 [0]),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "trirasterize_sendsetnewtrislotcommand:100,trirasterize_mainloop:001,trirasterize_sendfinishdraweventcommand:110,trirasterize_waitforwritecomplete:010,trirasterize_allocatenewtricacheslot:011,trirasterize_waitfortridata:000,trirasterize_sendfinishtricommand:101,trirasterize_sendsetnewdraweventcommand:111" *) 
  FDRE #(
    .INIT(1'b0)) 
    \currentState_reg[1] 
       (.C(clk),
        .CE(currentState),
        .D(currentState__1[1]),
        .Q(currentState__0[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentState_reg[1]__0 
       (.C(clk),
        .CE(currentState),
        .D(\currentState[1]__0_i_1_n_0 ),
        .Q(\currentState_reg[2]__0_0 [1]),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "trirasterize_sendsetnewtrislotcommand:100,trirasterize_mainloop:001,trirasterize_sendfinishdraweventcommand:110,trirasterize_waitforwritecomplete:010,trirasterize_allocatenewtricacheslot:011,trirasterize_waitfortridata:000,trirasterize_sendfinishtricommand:101,trirasterize_sendsetnewdraweventcommand:111" *) 
  FDRE #(
    .INIT(1'b0)) 
    \currentState_reg[2] 
       (.C(clk),
        .CE(currentState),
        .D(currentState__1[2]),
        .Q(currentState__0[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentState_reg[2]__0 
       (.C(clk),
        .CE(currentState),
        .D(\currentState[2]__0_i_2_n_0 ),
        .Q(\currentState_reg[2]__0_0 [2]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[0]_i_1 
       (.I0(\writeOutPixelData_reg[barycentricB] [0]),
        .I1(currentState__0[1]),
        .I2(\writeOutPixelData_reg[barycentricB][7]_i_1_n_15 ),
        .O(\fifoWriteData[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[10]_i_1 
       (.I0(\writeOutPixelData_reg[barycentricB] [10]),
        .I1(currentState__0[1]),
        .I2(\writeOutPixelData_reg[barycentricB][15]_i_1_n_13 ),
        .O(\fifoWriteData[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[11]_i_1 
       (.I0(\writeOutPixelData_reg[barycentricB] [11]),
        .I1(currentState__0[1]),
        .I2(\writeOutPixelData_reg[barycentricB][15]_i_1_n_12 ),
        .O(\fifoWriteData[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[12]_i_1 
       (.I0(\writeOutPixelData_reg[barycentricB] [12]),
        .I1(currentState__0[1]),
        .I2(\writeOutPixelData_reg[barycentricB][15]_i_1_n_11 ),
        .O(\fifoWriteData[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[13]_i_1 
       (.I0(\writeOutPixelData_reg[barycentricB] [13]),
        .I1(currentState__0[1]),
        .I2(\writeOutPixelData_reg[barycentricB][15]_i_1_n_10 ),
        .O(\fifoWriteData[13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[14]_i_1 
       (.I0(\writeOutPixelData_reg[barycentricB] [14]),
        .I1(currentState__0[1]),
        .I2(\writeOutPixelData_reg[barycentricB][15]_i_1_n_9 ),
        .O(\fifoWriteData[14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[15]_i_1 
       (.I0(\writeOutPixelData_reg[barycentricB] [15]),
        .I1(currentState__0[1]),
        .I2(\writeOutPixelData_reg[barycentricB][15]_i_1_n_8 ),
        .O(\fifoWriteData[15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[16]_i_1 
       (.I0(\writeOutPixelData_reg[barycentricB] [16]),
        .I1(currentState__0[1]),
        .I2(\writeOutPixelData_reg[barycentricB][23]_i_1_n_15 ),
        .O(\fifoWriteData[16]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[17]_i_1 
       (.I0(\writeOutPixelData_reg[barycentricB] [17]),
        .I1(currentState__0[1]),
        .I2(\writeOutPixelData_reg[barycentricB][23]_i_1_n_14 ),
        .O(\fifoWriteData[17]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[18]_i_1 
       (.I0(\writeOutPixelData_reg[barycentricB] [18]),
        .I1(currentState__0[1]),
        .I2(\writeOutPixelData_reg[barycentricB][23]_i_1_n_13 ),
        .O(\fifoWriteData[18]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[19]_i_1 
       (.I0(\writeOutPixelData_reg[barycentricB] [19]),
        .I1(currentState__0[1]),
        .I2(\writeOutPixelData_reg[barycentricB][23]_i_1_n_12 ),
        .O(\fifoWriteData[19]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[1]_i_1 
       (.I0(\writeOutPixelData_reg[barycentricB] [1]),
        .I1(currentState__0[1]),
        .I2(\writeOutPixelData_reg[barycentricB][7]_i_1_n_14 ),
        .O(\fifoWriteData[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[20]_i_1 
       (.I0(\writeOutPixelData_reg[barycentricB] [20]),
        .I1(currentState__0[1]),
        .I2(\writeOutPixelData_reg[barycentricB][23]_i_1_n_11 ),
        .O(\fifoWriteData[20]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[21]_i_1 
       (.I0(\writeOutPixelData_reg[barycentricB] [21]),
        .I1(currentState__0[1]),
        .I2(\writeOutPixelData_reg[barycentricB][23]_i_1_n_10 ),
        .O(\fifoWriteData[21]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[22]_i_1 
       (.I0(\writeOutPixelData_reg[barycentricB] [22]),
        .I1(currentState__0[1]),
        .I2(\writeOutPixelData_reg[barycentricB][23]_i_1_n_9 ),
        .O(\fifoWriteData[22]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[23]_i_1 
       (.I0(\writeOutPixelData_reg[barycentricB] [23]),
        .I1(currentState__0[1]),
        .I2(\writeOutPixelData_reg[barycentricB][23]_i_1_n_8 ),
        .O(\fifoWriteData[23]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[24]_i_1 
       (.I0(\writeOutPixelData_reg[barycentricB] [24]),
        .I1(currentState__0[1]),
        .I2(\writeOutPixelData_reg[barycentricB][31]_i_2_n_15 ),
        .O(\fifoWriteData[24]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[25]_i_1 
       (.I0(\writeOutPixelData_reg[barycentricB] [25]),
        .I1(currentState__0[1]),
        .I2(\writeOutPixelData_reg[barycentricB][31]_i_2_n_14 ),
        .O(\fifoWriteData[25]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[26]_i_1 
       (.I0(\writeOutPixelData_reg[barycentricB] [26]),
        .I1(currentState__0[1]),
        .I2(\writeOutPixelData_reg[barycentricB][31]_i_2_n_13 ),
        .O(\fifoWriteData[26]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[27]_i_1 
       (.I0(\writeOutPixelData_reg[barycentricB] [27]),
        .I1(currentState__0[1]),
        .I2(\writeOutPixelData_reg[barycentricB][31]_i_2_n_12 ),
        .O(\fifoWriteData[27]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[28]_i_1 
       (.I0(\writeOutPixelData_reg[barycentricB] [28]),
        .I1(currentState__0[1]),
        .I2(\writeOutPixelData_reg[barycentricB][31]_i_2_n_11 ),
        .O(\fifoWriteData[28]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[29]_i_1 
       (.I0(\writeOutPixelData_reg[barycentricB] [29]),
        .I1(currentState__0[1]),
        .I2(\writeOutPixelData_reg[barycentricB][31]_i_2_n_10 ),
        .O(\fifoWriteData[29]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[2]_i_1 
       (.I0(\writeOutPixelData_reg[barycentricB] [2]),
        .I1(currentState__0[1]),
        .I2(\writeOutPixelData_reg[barycentricB][7]_i_1_n_13 ),
        .O(\fifoWriteData[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[30]_i_1 
       (.I0(\writeOutPixelData_reg[barycentricB] [30]),
        .I1(currentState__0[1]),
        .I2(\writeOutPixelData_reg[barycentricB][31]_i_2_n_9 ),
        .O(\fifoWriteData[30]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[31]_i_1 
       (.I0(\writeOutPixelData_reg[barycentricB] [31]),
        .I1(currentState__0[1]),
        .I2(\writeOutPixelData_reg[barycentricB][31]_i_2_n_8 ),
        .O(\fifoWriteData[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[32]_i_1 
       (.I0(\writeOutPixelData_reg[barycentricC] [0]),
        .I1(currentState__0[1]),
        .I2(\writeOutPixelData_reg[barycentricC][7]_i_1_n_15 ),
        .O(\fifoWriteData[32]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[33]_i_1 
       (.I0(\writeOutPixelData_reg[barycentricC] [1]),
        .I1(currentState__0[1]),
        .I2(\writeOutPixelData_reg[barycentricC][7]_i_1_n_14 ),
        .O(\fifoWriteData[33]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[34]_i_1 
       (.I0(\writeOutPixelData_reg[barycentricC] [2]),
        .I1(currentState__0[1]),
        .I2(\writeOutPixelData_reg[barycentricC][7]_i_1_n_13 ),
        .O(\fifoWriteData[34]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[35]_i_1 
       (.I0(\writeOutPixelData_reg[barycentricC] [3]),
        .I1(currentState__0[1]),
        .I2(\writeOutPixelData_reg[barycentricC][7]_i_1_n_12 ),
        .O(\fifoWriteData[35]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[36]_i_1 
       (.I0(\writeOutPixelData_reg[barycentricC] [4]),
        .I1(currentState__0[1]),
        .I2(\writeOutPixelData_reg[barycentricC][7]_i_1_n_11 ),
        .O(\fifoWriteData[36]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[37]_i_1 
       (.I0(\writeOutPixelData_reg[barycentricC] [5]),
        .I1(currentState__0[1]),
        .I2(\writeOutPixelData_reg[barycentricC][7]_i_1_n_10 ),
        .O(\fifoWriteData[37]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[38]_i_1 
       (.I0(\writeOutPixelData_reg[barycentricC] [6]),
        .I1(currentState__0[1]),
        .I2(\writeOutPixelData_reg[barycentricC][7]_i_1_n_9 ),
        .O(\fifoWriteData[38]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[39]_i_1 
       (.I0(\writeOutPixelData_reg[barycentricC] [7]),
        .I1(currentState__0[1]),
        .I2(\writeOutPixelData_reg[barycentricC][7]_i_1_n_8 ),
        .O(\fifoWriteData[39]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[3]_i_1 
       (.I0(\writeOutPixelData_reg[barycentricB] [3]),
        .I1(currentState__0[1]),
        .I2(\writeOutPixelData_reg[barycentricB][7]_i_1_n_12 ),
        .O(\fifoWriteData[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[40]_i_1 
       (.I0(\writeOutPixelData_reg[barycentricC] [8]),
        .I1(currentState__0[1]),
        .I2(\writeOutPixelData_reg[barycentricC][15]_i_1_n_15 ),
        .O(\fifoWriteData[40]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[41]_i_1 
       (.I0(\writeOutPixelData_reg[barycentricC] [9]),
        .I1(currentState__0[1]),
        .I2(\writeOutPixelData_reg[barycentricC][15]_i_1_n_14 ),
        .O(\fifoWriteData[41]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair81" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[42]_i_1 
       (.I0(\writeOutPixelData_reg[barycentricC] [10]),
        .I1(currentState__0[1]),
        .I2(\writeOutPixelData_reg[barycentricC][15]_i_1_n_13 ),
        .O(\fifoWriteData[42]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair81" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[43]_i_1 
       (.I0(\writeOutPixelData_reg[barycentricC] [11]),
        .I1(currentState__0[1]),
        .I2(\writeOutPixelData_reg[barycentricC][15]_i_1_n_12 ),
        .O(\fifoWriteData[43]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair82" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[44]_i_1 
       (.I0(\writeOutPixelData_reg[barycentricC] [12]),
        .I1(currentState__0[1]),
        .I2(\writeOutPixelData_reg[barycentricC][15]_i_1_n_11 ),
        .O(\fifoWriteData[44]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair82" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[45]_i_1 
       (.I0(\writeOutPixelData_reg[barycentricC] [13]),
        .I1(currentState__0[1]),
        .I2(\writeOutPixelData_reg[barycentricC][15]_i_1_n_10 ),
        .O(\fifoWriteData[45]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[46]_i_1 
       (.I0(\writeOutPixelData_reg[barycentricC] [14]),
        .I1(currentState__0[1]),
        .I2(\writeOutPixelData_reg[barycentricC][15]_i_1_n_9 ),
        .O(\fifoWriteData[46]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[47]_i_1 
       (.I0(\writeOutPixelData_reg[barycentricC] [15]),
        .I1(currentState__0[1]),
        .I2(\writeOutPixelData_reg[barycentricC][15]_i_1_n_8 ),
        .O(\fifoWriteData[47]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[48]_i_1 
       (.I0(\writeOutPixelData_reg[barycentricC] [16]),
        .I1(currentState__0[1]),
        .I2(\writeOutPixelData_reg[barycentricC][23]_i_1_n_15 ),
        .O(\fifoWriteData[48]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[49]_i_1 
       (.I0(\writeOutPixelData_reg[barycentricC] [17]),
        .I1(currentState__0[1]),
        .I2(\writeOutPixelData_reg[barycentricC][23]_i_1_n_14 ),
        .O(\fifoWriteData[49]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[4]_i_1 
       (.I0(\writeOutPixelData_reg[barycentricB] [4]),
        .I1(currentState__0[1]),
        .I2(\writeOutPixelData_reg[barycentricB][7]_i_1_n_11 ),
        .O(\fifoWriteData[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair85" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[50]_i_1 
       (.I0(\writeOutPixelData_reg[barycentricC] [18]),
        .I1(currentState__0[1]),
        .I2(\writeOutPixelData_reg[barycentricC][23]_i_1_n_13 ),
        .O(\fifoWriteData[50]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair85" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[51]_i_1 
       (.I0(\writeOutPixelData_reg[barycentricC] [19]),
        .I1(currentState__0[1]),
        .I2(\writeOutPixelData_reg[barycentricC][23]_i_1_n_12 ),
        .O(\fifoWriteData[51]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair86" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[52]_i_1 
       (.I0(\writeOutPixelData_reg[barycentricC] [20]),
        .I1(currentState__0[1]),
        .I2(\writeOutPixelData_reg[barycentricC][23]_i_1_n_11 ),
        .O(\fifoWriteData[52]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair86" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[53]_i_1 
       (.I0(\writeOutPixelData_reg[barycentricC] [21]),
        .I1(currentState__0[1]),
        .I2(\writeOutPixelData_reg[barycentricC][23]_i_1_n_10 ),
        .O(\fifoWriteData[53]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair87" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[54]_i_1 
       (.I0(\writeOutPixelData_reg[barycentricC] [22]),
        .I1(currentState__0[1]),
        .I2(\writeOutPixelData_reg[barycentricC][23]_i_1_n_9 ),
        .O(\fifoWriteData[54]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair87" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[55]_i_1 
       (.I0(\writeOutPixelData_reg[barycentricC] [23]),
        .I1(currentState__0[1]),
        .I2(\writeOutPixelData_reg[barycentricC][23]_i_1_n_8 ),
        .O(\fifoWriteData[55]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair88" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[56]_i_1 
       (.I0(\writeOutPixelData_reg[barycentricC] [24]),
        .I1(currentState__0[1]),
        .I2(\writeOutPixelData_reg[barycentricC][31]_i_1_n_15 ),
        .O(\fifoWriteData[56]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair88" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[57]_i_1 
       (.I0(\writeOutPixelData_reg[barycentricC] [25]),
        .I1(currentState__0[1]),
        .I2(\writeOutPixelData_reg[barycentricC][31]_i_1_n_14 ),
        .O(\fifoWriteData[57]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair89" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[58]_i_1 
       (.I0(\writeOutPixelData_reg[barycentricC] [26]),
        .I1(currentState__0[1]),
        .I2(\writeOutPixelData_reg[barycentricC][31]_i_1_n_13 ),
        .O(\fifoWriteData[58]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair89" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[59]_i_1 
       (.I0(\writeOutPixelData_reg[barycentricC] [27]),
        .I1(currentState__0[1]),
        .I2(\writeOutPixelData_reg[barycentricC][31]_i_1_n_12 ),
        .O(\fifoWriteData[59]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[5]_i_1 
       (.I0(\writeOutPixelData_reg[barycentricB] [5]),
        .I1(currentState__0[1]),
        .I2(\writeOutPixelData_reg[barycentricB][7]_i_1_n_10 ),
        .O(\fifoWriteData[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair90" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[60]_i_1 
       (.I0(\writeOutPixelData_reg[barycentricC] [28]),
        .I1(currentState__0[1]),
        .I2(\writeOutPixelData_reg[barycentricC][31]_i_1_n_11 ),
        .O(\fifoWriteData[60]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair90" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[61]_i_1 
       (.I0(\writeOutPixelData_reg[barycentricC] [29]),
        .I1(currentState__0[1]),
        .I2(\writeOutPixelData_reg[barycentricC][31]_i_1_n_10 ),
        .O(\fifoWriteData[61]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair91" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[62]_i_1 
       (.I0(\writeOutPixelData_reg[barycentricC] [30]),
        .I1(currentState__0[1]),
        .I2(\writeOutPixelData_reg[barycentricC][31]_i_1_n_9 ),
        .O(\fifoWriteData[62]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0200)) 
    \fifoWriteData[63]_i_1 
       (.I0(currentState__0[1]),
        .I1(RASTOUT_FIFO_almost_full),
        .I2(RASTOUT_FIFO_full),
        .I3(currentState__0[2]),
        .O(\fifoWriteData[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair91" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[63]_i_2 
       (.I0(\writeOutPixelData_reg[barycentricC] [31]),
        .I1(currentState__0[1]),
        .I2(\writeOutPixelData_reg[barycentricC][31]_i_1_n_8 ),
        .O(\fifoWriteData[63]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h30773055)) 
    \fifoWriteData[64]_i_1 
       (.I0(currentState__0[0]),
        .I1(currentState__0[2]),
        .I2(\writeOutPixelData_reg[pixelX] [0]),
        .I3(currentState__0[1]),
        .I4(\pixelXPos_reg[15]_0 [0]),
        .O(fifoWriteData0_in[64]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h0030CCB8)) 
    \fifoWriteData[65]_i_1 
       (.I0(\pixelXPos_reg[15]_0 [1]),
        .I1(currentState__0[0]),
        .I2(\writeOutPixelData_reg[pixelX] [1]),
        .I3(currentState__0[2]),
        .I4(currentState__0[1]),
        .O(fifoWriteData0_in[65]));
  LUT5 #(
    .INIT(32'hBA33BA00)) 
    \fifoWriteData[66]_i_1 
       (.I0(currentState__0[0]),
        .I1(currentState__0[2]),
        .I2(\writeOutPixelData_reg[pixelX] [2]),
        .I3(currentState__0[1]),
        .I4(\pixelXPos_reg[15]_0 [2]),
        .O(fifoWriteData0_in[66]));
  LUT5 #(
    .INIT(32'h0FCA00C0)) 
    \fifoWriteData[67]_i_1 
       (.I0(\writeOutPixelData_reg[pixelX] [3]),
        .I1(\pixelXPos_reg[15]_0 [3]),
        .I2(currentState__0[0]),
        .I3(currentState__0[2]),
        .I4(currentState__0[1]),
        .O(fifoWriteData0_in[67]));
  (* SOFT_HLUTNM = "soft_lutpair92" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[68]_i_1 
       (.I0(\writeOutPixelData_reg[pixelX] [4]),
        .I1(currentState__0[1]),
        .I2(\pixelXPos_reg[15]_0 [4]),
        .O(\fifoWriteData[68]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair92" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[69]_i_1 
       (.I0(\writeOutPixelData_reg[pixelX] [5]),
        .I1(currentState__0[1]),
        .I2(\pixelXPos_reg[15]_0 [5]),
        .O(\fifoWriteData[69]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[6]_i_1 
       (.I0(\writeOutPixelData_reg[barycentricB] [6]),
        .I1(currentState__0[1]),
        .I2(\writeOutPixelData_reg[barycentricB][7]_i_1_n_9 ),
        .O(\fifoWriteData[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair93" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[70]_i_1 
       (.I0(\writeOutPixelData_reg[pixelX] [6]),
        .I1(currentState__0[1]),
        .I2(\pixelXPos_reg[15]_0 [6]),
        .O(\fifoWriteData[70]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair93" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[71]_i_1 
       (.I0(\writeOutPixelData_reg[pixelX] [7]),
        .I1(currentState__0[1]),
        .I2(\pixelXPos_reg[15]_0 [7]),
        .O(\fifoWriteData[71]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair94" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[72]_i_1 
       (.I0(\writeOutPixelData_reg[pixelX] [8]),
        .I1(currentState__0[1]),
        .I2(\pixelXPos_reg[15]_0 [8]),
        .O(\fifoWriteData[72]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair94" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[73]_i_1 
       (.I0(\writeOutPixelData_reg[pixelX] [9]),
        .I1(currentState__0[1]),
        .I2(\pixelXPos_reg[15]_0 [9]),
        .O(\fifoWriteData[73]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair95" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[74]_i_1 
       (.I0(\writeOutPixelData_reg[pixelX] [10]),
        .I1(currentState__0[1]),
        .I2(\pixelXPos_reg[15]_0 [10]),
        .O(\fifoWriteData[74]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair95" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[75]_i_1 
       (.I0(\writeOutPixelData_reg[pixelX] [11]),
        .I1(currentState__0[1]),
        .I2(\pixelXPos_reg[15]_0 [11]),
        .O(\fifoWriteData[75]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair96" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[76]_i_1 
       (.I0(\writeOutPixelData_reg[pixelX] [12]),
        .I1(currentState__0[1]),
        .I2(\pixelXPos_reg[15]_0 [12]),
        .O(\fifoWriteData[76]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair96" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[77]_i_1 
       (.I0(\writeOutPixelData_reg[pixelX] [13]),
        .I1(currentState__0[1]),
        .I2(\pixelXPos_reg[15]_0 [13]),
        .O(\fifoWriteData[77]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h10)) 
    \fifoWriteData[78]_i_1 
       (.I0(RASTOUT_FIFO_almost_full),
        .I1(RASTOUT_FIFO_full),
        .I2(currentState__0[2]),
        .O(\fifoWriteData[78]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0257030202020302)) 
    \fifoWriteData[78]_i_2 
       (.I0(currentState__0[2]),
        .I1(RASTOUT_FIFO_full),
        .I2(RASTOUT_FIFO_almost_full),
        .I3(currentState__0[1]),
        .I4(currentState__0[0]),
        .I5(\fifoWriteData[95]_i_3_n_0 ),
        .O(fifoWriteData[79]));
  (* SOFT_HLUTNM = "soft_lutpair97" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[78]_i_3 
       (.I0(\writeOutPixelData_reg[pixelX] [14]),
        .I1(currentState__0[1]),
        .I2(\pixelXPos_reg[15]_0 [14]),
        .O(\fifoWriteData[78]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAAAFCCCCAAAFAAAA)) 
    \fifoWriteData[79]_i_1 
       (.I0(RASTOUT_FIFO_wr_data[79]),
        .I1(\fifoWriteData[79]_i_2_n_0 ),
        .I2(RASTOUT_FIFO_almost_full),
        .I3(RASTOUT_FIFO_full),
        .I4(currentState__0[2]),
        .I5(\fifoWriteData[79]_i_3_n_0 ),
        .O(\fifoWriteData[79]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair97" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[79]_i_2 
       (.I0(\writeOutPixelData_reg[pixelX] [15]),
        .I1(currentState__0[1]),
        .I2(\pixelXPos_reg[15]_0 [15]),
        .O(\fifoWriteData[79]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0808080838080808)) 
    \fifoWriteData[79]_i_3 
       (.I0(fifoWriteEnable_i_4_n_0),
        .I1(currentState__0[1]),
        .I2(currentState__0[0]),
        .I3(\fifoWriteData[79]_i_4_n_0 ),
        .I4(fifoWriteEnable2),
        .I5(pixelXPos1_carry_n_0),
        .O(\fifoWriteData[79]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h0008)) 
    \fifoWriteData[79]_i_4 
       (.I0(fifoWriteEnable1__1),
        .I1(hasWrittenPixelsForThisTriangle_reg_n_0),
        .I2(RASTOUT_FIFO_almost_full),
        .I3(RASTOUT_FIFO_full),
        .O(\fifoWriteData[79]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[7]_i_1 
       (.I0(\writeOutPixelData_reg[barycentricB] [7]),
        .I1(currentState__0[1]),
        .I2(\writeOutPixelData_reg[barycentricB][7]_i_1_n_8 ),
        .O(\fifoWriteData[7]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \fifoWriteData[80]_i_1 
       (.I0(currentDrawEventID[0]),
        .I1(currentState__0[0]),
        .I2(previousDrawEventID[0]),
        .I3(currentState__0[2]),
        .I4(\fifoWriteData[80]_i_2_n_0 ),
        .O(fifoWriteData0_in[80]));
  (* SOFT_HLUTNM = "soft_lutpair98" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[80]_i_2 
       (.I0(\writeOutPixelData_reg[pixelY] [0]),
        .I1(currentState__0[1]),
        .I2(Q[0]),
        .O(\fifoWriteData[80]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \fifoWriteData[81]_i_1 
       (.I0(currentDrawEventID[1]),
        .I1(currentState__0[0]),
        .I2(previousDrawEventID[1]),
        .I3(currentState__0[2]),
        .I4(\fifoWriteData[81]_i_2_n_0 ),
        .O(fifoWriteData0_in[81]));
  (* SOFT_HLUTNM = "soft_lutpair98" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[81]_i_2 
       (.I0(\writeOutPixelData_reg[pixelY] [1]),
        .I1(currentState__0[1]),
        .I2(Q[1]),
        .O(\fifoWriteData[81]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \fifoWriteData[82]_i_1 
       (.I0(currentDrawEventID[2]),
        .I1(currentState__0[0]),
        .I2(previousDrawEventID[2]),
        .I3(currentState__0[2]),
        .I4(\fifoWriteData[82]_i_2_n_0 ),
        .O(fifoWriteData0_in[82]));
  (* SOFT_HLUTNM = "soft_lutpair99" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[82]_i_2 
       (.I0(\writeOutPixelData_reg[pixelY] [2]),
        .I1(currentState__0[1]),
        .I2(Q[2]),
        .O(\fifoWriteData[82]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \fifoWriteData[83]_i_1 
       (.I0(currentDrawEventID[3]),
        .I1(currentState__0[0]),
        .I2(previousDrawEventID[3]),
        .I3(currentState__0[2]),
        .I4(\fifoWriteData[83]_i_2_n_0 ),
        .O(fifoWriteData0_in[83]));
  (* SOFT_HLUTNM = "soft_lutpair99" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[83]_i_2 
       (.I0(\writeOutPixelData_reg[pixelY] [3]),
        .I1(currentState__0[1]),
        .I2(Q[3]),
        .O(\fifoWriteData[83]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \fifoWriteData[84]_i_1 
       (.I0(currentDrawEventID[4]),
        .I1(currentState__0[0]),
        .I2(previousDrawEventID[4]),
        .I3(currentState__0[2]),
        .I4(\fifoWriteData[84]_i_2_n_0 ),
        .O(fifoWriteData0_in[84]));
  (* SOFT_HLUTNM = "soft_lutpair100" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[84]_i_2 
       (.I0(\writeOutPixelData_reg[pixelY] [4]),
        .I1(currentState__0[1]),
        .I2(Q[4]),
        .O(\fifoWriteData[84]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \fifoWriteData[85]_i_1 
       (.I0(currentDrawEventID[5]),
        .I1(currentState__0[0]),
        .I2(previousDrawEventID[5]),
        .I3(currentState__0[2]),
        .I4(\fifoWriteData[85]_i_2_n_0 ),
        .O(fifoWriteData0_in[85]));
  (* SOFT_HLUTNM = "soft_lutpair100" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[85]_i_2 
       (.I0(\writeOutPixelData_reg[pixelY] [5]),
        .I1(currentState__0[1]),
        .I2(Q[5]),
        .O(\fifoWriteData[85]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \fifoWriteData[86]_i_1 
       (.I0(currentDrawEventID[6]),
        .I1(currentState__0[0]),
        .I2(previousDrawEventID[6]),
        .I3(currentState__0[2]),
        .I4(\fifoWriteData[86]_i_2_n_0 ),
        .O(fifoWriteData0_in[86]));
  (* SOFT_HLUTNM = "soft_lutpair101" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[86]_i_2 
       (.I0(\writeOutPixelData_reg[pixelY] [6]),
        .I1(currentState__0[1]),
        .I2(Q[6]),
        .O(\fifoWriteData[86]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \fifoWriteData[87]_i_1 
       (.I0(currentDrawEventID[7]),
        .I1(currentState__0[0]),
        .I2(previousDrawEventID[7]),
        .I3(currentState__0[2]),
        .I4(\fifoWriteData[87]_i_2_n_0 ),
        .O(fifoWriteData0_in[87]));
  (* SOFT_HLUTNM = "soft_lutpair101" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[87]_i_2 
       (.I0(\writeOutPixelData_reg[pixelY] [7]),
        .I1(currentState__0[1]),
        .I2(Q[7]),
        .O(\fifoWriteData[87]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \fifoWriteData[88]_i_1 
       (.I0(currentDrawEventID[8]),
        .I1(currentState__0[0]),
        .I2(previousDrawEventID[8]),
        .I3(currentState__0[2]),
        .I4(\fifoWriteData[88]_i_2_n_0 ),
        .O(fifoWriteData0_in[88]));
  (* SOFT_HLUTNM = "soft_lutpair102" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[88]_i_2 
       (.I0(\writeOutPixelData_reg[pixelY] [8]),
        .I1(currentState__0[1]),
        .I2(Q[8]),
        .O(\fifoWriteData[88]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \fifoWriteData[89]_i_1 
       (.I0(currentDrawEventID[9]),
        .I1(currentState__0[0]),
        .I2(previousDrawEventID[9]),
        .I3(currentState__0[2]),
        .I4(\fifoWriteData[89]_i_2_n_0 ),
        .O(fifoWriteData0_in[89]));
  (* SOFT_HLUTNM = "soft_lutpair102" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[89]_i_2 
       (.I0(\writeOutPixelData_reg[pixelY] [9]),
        .I1(currentState__0[1]),
        .I2(Q[9]),
        .O(\fifoWriteData[89]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[8]_i_1 
       (.I0(\writeOutPixelData_reg[barycentricB] [8]),
        .I1(currentState__0[1]),
        .I2(\writeOutPixelData_reg[barycentricB][15]_i_1_n_15 ),
        .O(\fifoWriteData[8]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \fifoWriteData[90]_i_1 
       (.I0(currentDrawEventID[10]),
        .I1(currentState__0[0]),
        .I2(previousDrawEventID[10]),
        .I3(currentState__0[2]),
        .I4(\fifoWriteData[90]_i_2_n_0 ),
        .O(fifoWriteData0_in[90]));
  (* SOFT_HLUTNM = "soft_lutpair103" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[90]_i_2 
       (.I0(\writeOutPixelData_reg[pixelY] [10]),
        .I1(currentState__0[1]),
        .I2(Q[10]),
        .O(\fifoWriteData[90]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \fifoWriteData[91]_i_1 
       (.I0(currentDrawEventID[11]),
        .I1(currentState__0[0]),
        .I2(previousDrawEventID[11]),
        .I3(currentState__0[2]),
        .I4(\fifoWriteData[91]_i_2_n_0 ),
        .O(fifoWriteData0_in[91]));
  (* SOFT_HLUTNM = "soft_lutpair103" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[91]_i_2 
       (.I0(\writeOutPixelData_reg[pixelY] [11]),
        .I1(currentState__0[1]),
        .I2(Q[11]),
        .O(\fifoWriteData[91]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \fifoWriteData[92]_i_1 
       (.I0(currentDrawEventID[12]),
        .I1(currentState__0[0]),
        .I2(previousDrawEventID[12]),
        .I3(currentState__0[2]),
        .I4(\fifoWriteData[92]_i_2_n_0 ),
        .O(fifoWriteData0_in[92]));
  (* SOFT_HLUTNM = "soft_lutpair104" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[92]_i_2 
       (.I0(\writeOutPixelData_reg[pixelY] [12]),
        .I1(currentState__0[1]),
        .I2(Q[12]),
        .O(\fifoWriteData[92]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \fifoWriteData[93]_i_1 
       (.I0(currentDrawEventID[13]),
        .I1(currentState__0[0]),
        .I2(previousDrawEventID[13]),
        .I3(currentState__0[2]),
        .I4(\fifoWriteData[93]_i_2_n_0 ),
        .O(fifoWriteData0_in[93]));
  (* SOFT_HLUTNM = "soft_lutpair104" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[93]_i_2 
       (.I0(\writeOutPixelData_reg[pixelY] [13]),
        .I1(currentState__0[1]),
        .I2(Q[13]),
        .O(\fifoWriteData[93]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \fifoWriteData[94]_i_1 
       (.I0(currentDrawEventID[14]),
        .I1(currentState__0[0]),
        .I2(previousDrawEventID[14]),
        .I3(currentState__0[2]),
        .I4(\fifoWriteData[94]_i_2_n_0 ),
        .O(fifoWriteData0_in[94]));
  (* SOFT_HLUTNM = "soft_lutpair105" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[94]_i_2 
       (.I0(\writeOutPixelData_reg[pixelY] [14]),
        .I1(currentState__0[1]),
        .I2(Q[14]),
        .O(\fifoWriteData[94]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0255030002000300)) 
    \fifoWriteData[95]_i_1 
       (.I0(currentState__0[2]),
        .I1(RASTOUT_FIFO_full),
        .I2(RASTOUT_FIFO_almost_full),
        .I3(currentState__0[1]),
        .I4(currentState__0[0]),
        .I5(\fifoWriteData[95]_i_3_n_0 ),
        .O(fifoWriteData[95]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \fifoWriteData[95]_i_2 
       (.I0(currentDrawEventID[15]),
        .I1(currentState__0[0]),
        .I2(previousDrawEventID[15]),
        .I3(currentState__0[2]),
        .I4(\fifoWriteData[95]_i_4_n_0 ),
        .O(fifoWriteData0_in[95]));
  LUT6 #(
    .INIT(64'h0004000000000000)) 
    \fifoWriteData[95]_i_3 
       (.I0(pixelXPos1_carry_n_0),
        .I1(fifoWriteEnable2),
        .I2(RASTOUT_FIFO_full),
        .I3(RASTOUT_FIFO_almost_full),
        .I4(hasWrittenPixelsForThisTriangle_reg_n_0),
        .I5(fifoWriteEnable1__1),
        .O(\fifoWriteData[95]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair105" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[95]_i_4 
       (.I0(\writeOutPixelData_reg[pixelY] [15]),
        .I1(currentState__0[1]),
        .I2(Q[15]),
        .O(\fifoWriteData[95]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifoWriteData[9]_i_1 
       (.I0(\writeOutPixelData_reg[barycentricB] [9]),
        .I1(currentState__0[1]),
        .I2(\writeOutPixelData_reg[barycentricB][15]_i_1_n_14 ),
        .O(\fifoWriteData[9]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[0] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(\fifoWriteData[0]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[0]),
        .R(\fifoWriteData[63]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[10] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(\fifoWriteData[10]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[10]),
        .R(\fifoWriteData[63]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[11] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(\fifoWriteData[11]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[11]),
        .R(\fifoWriteData[63]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[12] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(\fifoWriteData[12]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[12]),
        .R(\fifoWriteData[63]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[13] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(\fifoWriteData[13]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[13]),
        .R(\fifoWriteData[63]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[14] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(\fifoWriteData[14]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[14]),
        .R(\fifoWriteData[63]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[15] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(\fifoWriteData[15]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[15]),
        .R(\fifoWriteData[63]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[16] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(\fifoWriteData[16]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[16]),
        .R(\fifoWriteData[63]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[17] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(\fifoWriteData[17]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[17]),
        .R(\fifoWriteData[63]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[18] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(\fifoWriteData[18]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[18]),
        .R(\fifoWriteData[63]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[19] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(\fifoWriteData[19]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[19]),
        .R(\fifoWriteData[63]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[1] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(\fifoWriteData[1]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[1]),
        .R(\fifoWriteData[63]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[20] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(\fifoWriteData[20]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[20]),
        .R(\fifoWriteData[63]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[21] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(\fifoWriteData[21]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[21]),
        .R(\fifoWriteData[63]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[22] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(\fifoWriteData[22]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[22]),
        .R(\fifoWriteData[63]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[23] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(\fifoWriteData[23]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[23]),
        .R(\fifoWriteData[63]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[24] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(\fifoWriteData[24]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[24]),
        .R(\fifoWriteData[63]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[25] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(\fifoWriteData[25]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[25]),
        .R(\fifoWriteData[63]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[26] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(\fifoWriteData[26]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[26]),
        .R(\fifoWriteData[63]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[27] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(\fifoWriteData[27]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[27]),
        .R(\fifoWriteData[63]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[28] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(\fifoWriteData[28]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[28]),
        .R(\fifoWriteData[63]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[29] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(\fifoWriteData[29]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[29]),
        .R(\fifoWriteData[63]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[2] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(\fifoWriteData[2]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[2]),
        .R(\fifoWriteData[63]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[30] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(\fifoWriteData[30]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[30]),
        .R(\fifoWriteData[63]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[31] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(\fifoWriteData[31]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[31]),
        .R(\fifoWriteData[63]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[32] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(\fifoWriteData[32]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[32]),
        .R(\fifoWriteData[63]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[33] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(\fifoWriteData[33]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[33]),
        .R(\fifoWriteData[63]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[34] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(\fifoWriteData[34]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[34]),
        .R(\fifoWriteData[63]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[35] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(\fifoWriteData[35]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[35]),
        .R(\fifoWriteData[63]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[36] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(\fifoWriteData[36]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[36]),
        .R(\fifoWriteData[63]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[37] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(\fifoWriteData[37]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[37]),
        .R(\fifoWriteData[63]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[38] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(\fifoWriteData[38]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[38]),
        .R(\fifoWriteData[63]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[39] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(\fifoWriteData[39]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[39]),
        .R(\fifoWriteData[63]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[3] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(\fifoWriteData[3]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[3]),
        .R(\fifoWriteData[63]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[40] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(\fifoWriteData[40]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[40]),
        .R(\fifoWriteData[63]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[41] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(\fifoWriteData[41]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[41]),
        .R(\fifoWriteData[63]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[42] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(\fifoWriteData[42]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[42]),
        .R(\fifoWriteData[63]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[43] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(\fifoWriteData[43]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[43]),
        .R(\fifoWriteData[63]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[44] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(\fifoWriteData[44]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[44]),
        .R(\fifoWriteData[63]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[45] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(\fifoWriteData[45]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[45]),
        .R(\fifoWriteData[63]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[46] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(\fifoWriteData[46]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[46]),
        .R(\fifoWriteData[63]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[47] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(\fifoWriteData[47]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[47]),
        .R(\fifoWriteData[63]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[48] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(\fifoWriteData[48]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[48]),
        .R(\fifoWriteData[63]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[49] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(\fifoWriteData[49]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[49]),
        .R(\fifoWriteData[63]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[4] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(\fifoWriteData[4]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[4]),
        .R(\fifoWriteData[63]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[50] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(\fifoWriteData[50]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[50]),
        .R(\fifoWriteData[63]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[51] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(\fifoWriteData[51]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[51]),
        .R(\fifoWriteData[63]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[52] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(\fifoWriteData[52]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[52]),
        .R(\fifoWriteData[63]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[53] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(\fifoWriteData[53]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[53]),
        .R(\fifoWriteData[63]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[54] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(\fifoWriteData[54]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[54]),
        .R(\fifoWriteData[63]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[55] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(\fifoWriteData[55]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[55]),
        .R(\fifoWriteData[63]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[56] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(\fifoWriteData[56]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[56]),
        .R(\fifoWriteData[63]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[57] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(\fifoWriteData[57]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[57]),
        .R(\fifoWriteData[63]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[58] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(\fifoWriteData[58]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[58]),
        .R(\fifoWriteData[63]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[59] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(\fifoWriteData[59]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[59]),
        .R(\fifoWriteData[63]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[5] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(\fifoWriteData[5]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[5]),
        .R(\fifoWriteData[63]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[60] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(\fifoWriteData[60]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[60]),
        .R(\fifoWriteData[63]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[61] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(\fifoWriteData[61]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[61]),
        .R(\fifoWriteData[63]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[62] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(\fifoWriteData[62]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[62]),
        .R(\fifoWriteData[63]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[63] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(\fifoWriteData[63]_i_2_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[63]),
        .R(\fifoWriteData[63]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[64] 
       (.C(clk),
        .CE(fifoWriteData[79]),
        .D(fifoWriteData0_in[64]),
        .Q(RASTOUT_FIFO_wr_data[64]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[65] 
       (.C(clk),
        .CE(fifoWriteData[79]),
        .D(fifoWriteData0_in[65]),
        .Q(RASTOUT_FIFO_wr_data[65]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[66] 
       (.C(clk),
        .CE(fifoWriteData[79]),
        .D(fifoWriteData0_in[66]),
        .Q(RASTOUT_FIFO_wr_data[66]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[67] 
       (.C(clk),
        .CE(fifoWriteData[79]),
        .D(fifoWriteData0_in[67]),
        .Q(RASTOUT_FIFO_wr_data[67]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[68] 
       (.C(clk),
        .CE(fifoWriteData[79]),
        .D(\fifoWriteData[68]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[68]),
        .R(\fifoWriteData[78]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[69] 
       (.C(clk),
        .CE(fifoWriteData[79]),
        .D(\fifoWriteData[69]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[69]),
        .R(\fifoWriteData[78]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[6] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(\fifoWriteData[6]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[6]),
        .R(\fifoWriteData[63]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[70] 
       (.C(clk),
        .CE(fifoWriteData[79]),
        .D(\fifoWriteData[70]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[70]),
        .R(\fifoWriteData[78]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[71] 
       (.C(clk),
        .CE(fifoWriteData[79]),
        .D(\fifoWriteData[71]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[71]),
        .R(\fifoWriteData[78]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[72] 
       (.C(clk),
        .CE(fifoWriteData[79]),
        .D(\fifoWriteData[72]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[72]),
        .R(\fifoWriteData[78]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[73] 
       (.C(clk),
        .CE(fifoWriteData[79]),
        .D(\fifoWriteData[73]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[73]),
        .R(\fifoWriteData[78]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[74] 
       (.C(clk),
        .CE(fifoWriteData[79]),
        .D(\fifoWriteData[74]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[74]),
        .R(\fifoWriteData[78]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[75] 
       (.C(clk),
        .CE(fifoWriteData[79]),
        .D(\fifoWriteData[75]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[75]),
        .R(\fifoWriteData[78]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[76] 
       (.C(clk),
        .CE(fifoWriteData[79]),
        .D(\fifoWriteData[76]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[76]),
        .R(\fifoWriteData[78]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[77] 
       (.C(clk),
        .CE(fifoWriteData[79]),
        .D(\fifoWriteData[77]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[77]),
        .R(\fifoWriteData[78]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[78] 
       (.C(clk),
        .CE(fifoWriteData[79]),
        .D(\fifoWriteData[78]_i_3_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[78]),
        .R(\fifoWriteData[78]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[79] 
       (.C(clk),
        .CE(1'b1),
        .D(\fifoWriteData[79]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[79]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[7] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(\fifoWriteData[7]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[7]),
        .R(\fifoWriteData[63]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[80] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(fifoWriteData0_in[80]),
        .Q(RASTOUT_FIFO_wr_data[80]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[81] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(fifoWriteData0_in[81]),
        .Q(RASTOUT_FIFO_wr_data[81]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[82] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(fifoWriteData0_in[82]),
        .Q(RASTOUT_FIFO_wr_data[82]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[83] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(fifoWriteData0_in[83]),
        .Q(RASTOUT_FIFO_wr_data[83]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[84] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(fifoWriteData0_in[84]),
        .Q(RASTOUT_FIFO_wr_data[84]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[85] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(fifoWriteData0_in[85]),
        .Q(RASTOUT_FIFO_wr_data[85]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[86] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(fifoWriteData0_in[86]),
        .Q(RASTOUT_FIFO_wr_data[86]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[87] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(fifoWriteData0_in[87]),
        .Q(RASTOUT_FIFO_wr_data[87]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[88] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(fifoWriteData0_in[88]),
        .Q(RASTOUT_FIFO_wr_data[88]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[89] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(fifoWriteData0_in[89]),
        .Q(RASTOUT_FIFO_wr_data[89]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[8] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(\fifoWriteData[8]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[8]),
        .R(\fifoWriteData[63]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[90] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(fifoWriteData0_in[90]),
        .Q(RASTOUT_FIFO_wr_data[90]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[91] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(fifoWriteData0_in[91]),
        .Q(RASTOUT_FIFO_wr_data[91]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[92] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(fifoWriteData0_in[92]),
        .Q(RASTOUT_FIFO_wr_data[92]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[93] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(fifoWriteData0_in[93]),
        .Q(RASTOUT_FIFO_wr_data[93]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[94] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(fifoWriteData0_in[94]),
        .Q(RASTOUT_FIFO_wr_data[94]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[95] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(fifoWriteData0_in[95]),
        .Q(RASTOUT_FIFO_wr_data[95]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fifoWriteData_reg[9] 
       (.C(clk),
        .CE(fifoWriteData[95]),
        .D(\fifoWriteData[9]_i_1_n_0 ),
        .Q(RASTOUT_FIFO_wr_data[9]),
        .R(\fifoWriteData[63]_i_1_n_0 ));
  (* COMPARATOR_THRESHOLD = "11" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY8 fifoWriteEnable2_carry
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({fifoWriteEnable2,fifoWriteEnable2_carry_n_1,fifoWriteEnable2_carry_n_2,fifoWriteEnable2_carry_n_3,fifoWriteEnable2_carry_n_4,fifoWriteEnable2_carry_n_5,fifoWriteEnable2_carry_n_6,fifoWriteEnable2_carry_n_7}),
        .DI({fifoWriteEnable2_carry_i_1_n_0,fifoWriteEnable2_carry_i_2_n_0,fifoWriteEnable2_carry_i_3_n_0,fifoWriteEnable2_carry_i_4_n_0,fifoWriteEnable2_carry_i_5_n_0,fifoWriteEnable2_carry_i_6_n_0,fifoWriteEnable2_carry_i_7_n_0,fifoWriteEnable2_carry_i_8_n_0}),
        .O(NLW_fifoWriteEnable2_carry_O_UNCONNECTED[7:0]),
        .S({fifoWriteEnable2_carry_i_9_n_0,fifoWriteEnable2_carry_i_10_n_0,fifoWriteEnable2_carry_i_11_n_0,fifoWriteEnable2_carry_i_12_n_0,fifoWriteEnable2_carry_i_13_n_0,fifoWriteEnable2_carry_i_14_n_0,fifoWriteEnable2_carry_i_15_n_0,fifoWriteEnable2_carry_i_16_n_0}));
  LUT4 #(
    .INIT(16'h2F02)) 
    fifoWriteEnable2_carry_i_1
       (.I0(DBG_MaxX[14]),
        .I1(\pixelXPos_reg[15]_0 [14]),
        .I2(\pixelXPos_reg[15]_0 [15]),
        .I3(DBG_MaxX[15]),
        .O(fifoWriteEnable2_carry_i_1_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    fifoWriteEnable2_carry_i_10
       (.I0(DBG_MaxX[12]),
        .I1(\pixelXPos_reg[15]_0 [12]),
        .I2(DBG_MaxX[13]),
        .I3(\pixelXPos_reg[15]_0 [13]),
        .O(fifoWriteEnable2_carry_i_10_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    fifoWriteEnable2_carry_i_11
       (.I0(DBG_MaxX[10]),
        .I1(\pixelXPos_reg[15]_0 [10]),
        .I2(DBG_MaxX[11]),
        .I3(\pixelXPos_reg[15]_0 [11]),
        .O(fifoWriteEnable2_carry_i_11_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    fifoWriteEnable2_carry_i_12
       (.I0(DBG_MaxX[8]),
        .I1(\pixelXPos_reg[15]_0 [8]),
        .I2(DBG_MaxX[9]),
        .I3(\pixelXPos_reg[15]_0 [9]),
        .O(fifoWriteEnable2_carry_i_12_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    fifoWriteEnable2_carry_i_13
       (.I0(DBG_MaxX[6]),
        .I1(\pixelXPos_reg[15]_0 [6]),
        .I2(DBG_MaxX[7]),
        .I3(\pixelXPos_reg[15]_0 [7]),
        .O(fifoWriteEnable2_carry_i_13_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    fifoWriteEnable2_carry_i_14
       (.I0(DBG_MaxX[4]),
        .I1(\pixelXPos_reg[15]_0 [4]),
        .I2(DBG_MaxX[5]),
        .I3(\pixelXPos_reg[15]_0 [5]),
        .O(fifoWriteEnable2_carry_i_14_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    fifoWriteEnable2_carry_i_15
       (.I0(DBG_MaxX[2]),
        .I1(\pixelXPos_reg[15]_0 [2]),
        .I2(DBG_MaxX[3]),
        .I3(\pixelXPos_reg[15]_0 [3]),
        .O(fifoWriteEnable2_carry_i_15_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    fifoWriteEnable2_carry_i_16
       (.I0(DBG_MaxX[0]),
        .I1(\pixelXPos_reg[15]_0 [0]),
        .I2(DBG_MaxX[1]),
        .I3(\pixelXPos_reg[15]_0 [1]),
        .O(fifoWriteEnable2_carry_i_16_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    fifoWriteEnable2_carry_i_2
       (.I0(DBG_MaxX[12]),
        .I1(\pixelXPos_reg[15]_0 [12]),
        .I2(\pixelXPos_reg[15]_0 [13]),
        .I3(DBG_MaxX[13]),
        .O(fifoWriteEnable2_carry_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    fifoWriteEnable2_carry_i_3
       (.I0(DBG_MaxX[10]),
        .I1(\pixelXPos_reg[15]_0 [10]),
        .I2(\pixelXPos_reg[15]_0 [11]),
        .I3(DBG_MaxX[11]),
        .O(fifoWriteEnable2_carry_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    fifoWriteEnable2_carry_i_4
       (.I0(DBG_MaxX[8]),
        .I1(\pixelXPos_reg[15]_0 [8]),
        .I2(\pixelXPos_reg[15]_0 [9]),
        .I3(DBG_MaxX[9]),
        .O(fifoWriteEnable2_carry_i_4_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    fifoWriteEnable2_carry_i_5
       (.I0(DBG_MaxX[6]),
        .I1(\pixelXPos_reg[15]_0 [6]),
        .I2(\pixelXPos_reg[15]_0 [7]),
        .I3(DBG_MaxX[7]),
        .O(fifoWriteEnable2_carry_i_5_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    fifoWriteEnable2_carry_i_6
       (.I0(DBG_MaxX[4]),
        .I1(\pixelXPos_reg[15]_0 [4]),
        .I2(\pixelXPos_reg[15]_0 [5]),
        .I3(DBG_MaxX[5]),
        .O(fifoWriteEnable2_carry_i_6_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    fifoWriteEnable2_carry_i_7
       (.I0(DBG_MaxX[2]),
        .I1(\pixelXPos_reg[15]_0 [2]),
        .I2(\pixelXPos_reg[15]_0 [3]),
        .I3(DBG_MaxX[3]),
        .O(fifoWriteEnable2_carry_i_7_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    fifoWriteEnable2_carry_i_8
       (.I0(DBG_MaxX[0]),
        .I1(\pixelXPos_reg[15]_0 [0]),
        .I2(\pixelXPos_reg[15]_0 [1]),
        .I3(DBG_MaxX[1]),
        .O(fifoWriteEnable2_carry_i_8_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    fifoWriteEnable2_carry_i_9
       (.I0(DBG_MaxX[14]),
        .I1(\pixelXPos_reg[15]_0 [14]),
        .I2(DBG_MaxX[15]),
        .I3(\pixelXPos_reg[15]_0 [15]),
        .O(fifoWriteEnable2_carry_i_9_n_0));
  LUT6 #(
    .INIT(64'h00000000EEE2E2E2)) 
    fifoWriteEnable_i_1
       (.I0(DBG_NewMessage),
        .I1(fifoWriteEnable),
        .I2(fifoWriteEnable_i_3_n_0),
        .I3(currentState__0[1]),
        .I4(fifoWriteEnable_i_4_n_0),
        .I5(readyForNewTri_i_1_n_0),
        .O(fifoWriteEnable_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hBE)) 
    fifoWriteEnable_i_2
       (.I0(currentState__0[2]),
        .I1(currentState__0[1]),
        .I2(currentState__0[0]),
        .O(fifoWriteEnable));
  LUT6 #(
    .INIT(64'h88888888B8888888)) 
    fifoWriteEnable_i_3
       (.I0(fifoWriteEnable_i_4_n_0),
        .I1(currentState__0[2]),
        .I2(currentState__0[0]),
        .I3(\fifoWriteData[79]_i_4_n_0 ),
        .I4(fifoWriteEnable2),
        .I5(pixelXPos1_carry_n_0),
        .O(fifoWriteEnable_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h1)) 
    fifoWriteEnable_i_4
       (.I0(RASTOUT_FIFO_almost_full),
        .I1(RASTOUT_FIFO_full),
        .O(fifoWriteEnable_i_4_n_0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_EN" *) 
  FDRE #(
    .INIT(1'b0)) 
    fifoWriteEnable_reg
       (.C(clk),
        .CE(1'b1),
        .D(fifoWriteEnable_i_1_n_0),
        .Q(DBG_NewMessage),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFFC8FF0000C000)) 
    hasWrittenPixelsForThisTriangle_i_1
       (.I0(currentState__0[0]),
        .I1(fifoWriteEnable_i_4_n_0),
        .I2(currentState__0[1]),
        .I3(hasWrittenPixelsForThisTriangle_i_2_n_0),
        .I4(currentState__0[2]),
        .I5(hasWrittenPixelsForThisTriangle_reg_n_0),
        .O(hasWrittenPixelsForThisTriangle_i_1_n_0));
  LUT6 #(
    .INIT(64'h0008FFFF00080000)) 
    hasWrittenPixelsForThisTriangle_i_2
       (.I0(\fifoWriteData[79]_i_4_n_0 ),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(currentState__0[1]),
        .I4(currentState__0[0]),
        .I5(hasWrittenPixelsForThisTriangle_i_3_n_0),
        .O(hasWrittenPixelsForThisTriangle_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h1F101010)) 
    hasWrittenPixelsForThisTriangle_i_3
       (.I0(RASTOUT_FIFO_almost_full),
        .I1(RASTOUT_FIFO_full),
        .I2(currentState__0[1]),
        .I3(TRISETUP_newTriBegin),
        .I4(TRISETUP_readyForNewTri),
        .O(hasWrittenPixelsForThisTriangle_i_3_n_0));
  FDRE #(
    .INIT(1'b0)) 
    hasWrittenPixelsForThisTriangle_reg
       (.C(clk),
        .CE(1'b1),
        .D(hasWrittenPixelsForThisTriangle_i_1_n_0),
        .Q(hasWrittenPixelsForThisTriangle_reg_n_0),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__0_i_1
       (.I0(DBG_BarycentricB[15]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in24[15]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaB[15]),
        .O(p_0_out__0[15]));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__0_i_10
       (.I0(p_0_out__0[14]),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetB[14]),
        .I3(barycentricXDeltaB[14]),
        .O(i__carry__0_i_10_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__0_i_10__0
       (.I0(i__carry__0_i_2__0_n_0),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetC[14]),
        .I3(barycentricXDeltaC[14]),
        .O(i__carry__0_i_10__0_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__0_i_10__1
       (.I0(i__carry__0_i_2__1_n_0),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetA[14]),
        .I3(barycentricXDeltaA[14]),
        .O(i__carry__0_i_10__1_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__0_i_11
       (.I0(p_0_out__0[13]),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetB[13]),
        .I3(barycentricXDeltaB[13]),
        .O(i__carry__0_i_11_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__0_i_11__0
       (.I0(i__carry__0_i_3__0_n_0),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetC[13]),
        .I3(barycentricXDeltaC[13]),
        .O(i__carry__0_i_11__0_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__0_i_11__1
       (.I0(i__carry__0_i_3__1_n_0),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetA[13]),
        .I3(barycentricXDeltaA[13]),
        .O(i__carry__0_i_11__1_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__0_i_12
       (.I0(p_0_out__0[12]),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetB[12]),
        .I3(barycentricXDeltaB[12]),
        .O(i__carry__0_i_12_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__0_i_12__0
       (.I0(i__carry__0_i_4__0_n_0),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetC[12]),
        .I3(barycentricXDeltaC[12]),
        .O(i__carry__0_i_12__0_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__0_i_12__1
       (.I0(i__carry__0_i_4__1_n_0),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetA[12]),
        .I3(barycentricXDeltaA[12]),
        .O(i__carry__0_i_12__1_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__0_i_13
       (.I0(p_0_out__0[11]),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetB[11]),
        .I3(barycentricXDeltaB[11]),
        .O(i__carry__0_i_13_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__0_i_13__0
       (.I0(i__carry__0_i_5__0_n_0),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetC[11]),
        .I3(barycentricXDeltaC[11]),
        .O(i__carry__0_i_13__0_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__0_i_13__1
       (.I0(i__carry__0_i_5__1_n_0),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetA[11]),
        .I3(barycentricXDeltaA[11]),
        .O(i__carry__0_i_13__1_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__0_i_14
       (.I0(p_0_out__0[10]),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetB[10]),
        .I3(barycentricXDeltaB[10]),
        .O(i__carry__0_i_14_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__0_i_14__0
       (.I0(i__carry__0_i_6__0_n_0),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetC[10]),
        .I3(barycentricXDeltaC[10]),
        .O(i__carry__0_i_14__0_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__0_i_14__1
       (.I0(i__carry__0_i_6__1_n_0),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetA[10]),
        .I3(barycentricXDeltaA[10]),
        .O(i__carry__0_i_14__1_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__0_i_15
       (.I0(p_0_out__0[9]),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetB[9]),
        .I3(barycentricXDeltaB[9]),
        .O(i__carry__0_i_15_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__0_i_15__0
       (.I0(i__carry__0_i_7__0_n_0),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetC[9]),
        .I3(barycentricXDeltaC[9]),
        .O(i__carry__0_i_15__0_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__0_i_15__1
       (.I0(i__carry__0_i_7__1_n_0),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetA[9]),
        .I3(barycentricXDeltaA[9]),
        .O(i__carry__0_i_15__1_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__0_i_16
       (.I0(p_0_out__0[8]),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetB[8]),
        .I3(barycentricXDeltaB[8]),
        .O(i__carry__0_i_16_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__0_i_16__0
       (.I0(i__carry__0_i_8__0_n_0),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetC[8]),
        .I3(barycentricXDeltaC[8]),
        .O(i__carry__0_i_16__0_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__0_i_16__1
       (.I0(i__carry__0_i_8__1_n_0),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetA[8]),
        .I3(barycentricXDeltaA[8]),
        .O(i__carry__0_i_16__1_n_0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__0_i_1__0
       (.I0(DBG_BarycentricC[15]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in22[15]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaC[15]),
        .O(i__carry__0_i_1__0_n_0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__0_i_1__1
       (.I0(DBG_BarycentricA[15]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in26[15]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaA[15]),
        .O(i__carry__0_i_1__1_n_0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__0_i_2
       (.I0(DBG_BarycentricB[14]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in24[14]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaB[14]),
        .O(p_0_out__0[14]));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__0_i_2__0
       (.I0(DBG_BarycentricC[14]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in22[14]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaC[14]),
        .O(i__carry__0_i_2__0_n_0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__0_i_2__1
       (.I0(DBG_BarycentricA[14]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in26[14]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaA[14]),
        .O(i__carry__0_i_2__1_n_0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__0_i_3
       (.I0(DBG_BarycentricB[13]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in24[13]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaB[13]),
        .O(p_0_out__0[13]));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__0_i_3__0
       (.I0(DBG_BarycentricC[13]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in22[13]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaC[13]),
        .O(i__carry__0_i_3__0_n_0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__0_i_3__1
       (.I0(DBG_BarycentricA[13]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in26[13]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaA[13]),
        .O(i__carry__0_i_3__1_n_0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__0_i_4
       (.I0(DBG_BarycentricB[12]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in24[12]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaB[12]),
        .O(p_0_out__0[12]));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__0_i_4__0
       (.I0(DBG_BarycentricC[12]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in22[12]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaC[12]),
        .O(i__carry__0_i_4__0_n_0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__0_i_4__1
       (.I0(DBG_BarycentricA[12]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in26[12]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaA[12]),
        .O(i__carry__0_i_4__1_n_0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__0_i_5
       (.I0(DBG_BarycentricB[11]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in24[11]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaB[11]),
        .O(p_0_out__0[11]));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__0_i_5__0
       (.I0(DBG_BarycentricC[11]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in22[11]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaC[11]),
        .O(i__carry__0_i_5__0_n_0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__0_i_5__1
       (.I0(DBG_BarycentricA[11]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in26[11]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaA[11]),
        .O(i__carry__0_i_5__1_n_0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__0_i_6
       (.I0(DBG_BarycentricB[10]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in24[10]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaB[10]),
        .O(p_0_out__0[10]));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__0_i_6__0
       (.I0(DBG_BarycentricC[10]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in22[10]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaC[10]),
        .O(i__carry__0_i_6__0_n_0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__0_i_6__1
       (.I0(DBG_BarycentricA[10]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in26[10]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaA[10]),
        .O(i__carry__0_i_6__1_n_0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__0_i_7
       (.I0(DBG_BarycentricB[9]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in24[9]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaB[9]),
        .O(p_0_out__0[9]));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__0_i_7__0
       (.I0(DBG_BarycentricC[9]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in22[9]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaC[9]),
        .O(i__carry__0_i_7__0_n_0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__0_i_7__1
       (.I0(DBG_BarycentricA[9]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in26[9]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaA[9]),
        .O(i__carry__0_i_7__1_n_0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__0_i_8
       (.I0(DBG_BarycentricB[8]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in24[8]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaB[8]),
        .O(p_0_out__0[8]));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__0_i_8__0
       (.I0(DBG_BarycentricC[8]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in22[8]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaC[8]),
        .O(i__carry__0_i_8__0_n_0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__0_i_8__1
       (.I0(DBG_BarycentricA[8]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in26[8]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaA[8]),
        .O(i__carry__0_i_8__1_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__0_i_9
       (.I0(p_0_out__0[15]),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetB[15]),
        .I3(barycentricXDeltaB[15]),
        .O(i__carry__0_i_9_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__0_i_9__0
       (.I0(i__carry__0_i_1__0_n_0),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetC[15]),
        .I3(barycentricXDeltaC[15]),
        .O(i__carry__0_i_9__0_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__0_i_9__1
       (.I0(i__carry__0_i_1__1_n_0),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetA[15]),
        .I3(barycentricXDeltaA[15]),
        .O(i__carry__0_i_9__1_n_0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__1_i_1
       (.I0(DBG_BarycentricB[23]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in24[23]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaB[15]),
        .O(p_0_out__0[23]));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__1_i_10
       (.I0(p_0_out__0[22]),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetB[22]),
        .I3(barycentricXDeltaB[15]),
        .O(i__carry__1_i_10_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__1_i_10__0
       (.I0(i__carry__1_i_2__0_n_0),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetC[22]),
        .I3(barycentricXDeltaC[15]),
        .O(i__carry__1_i_10__0_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__1_i_10__1
       (.I0(i__carry__1_i_2__1_n_0),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetA[22]),
        .I3(barycentricXDeltaA[15]),
        .O(i__carry__1_i_10__1_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__1_i_11
       (.I0(p_0_out__0[21]),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetB[21]),
        .I3(barycentricXDeltaB[15]),
        .O(i__carry__1_i_11_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__1_i_11__0
       (.I0(i__carry__1_i_3__0_n_0),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetC[21]),
        .I3(barycentricXDeltaC[15]),
        .O(i__carry__1_i_11__0_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__1_i_11__1
       (.I0(i__carry__1_i_3__1_n_0),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetA[21]),
        .I3(barycentricXDeltaA[15]),
        .O(i__carry__1_i_11__1_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__1_i_12
       (.I0(p_0_out__0[20]),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetB[20]),
        .I3(barycentricXDeltaB[15]),
        .O(i__carry__1_i_12_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__1_i_12__0
       (.I0(i__carry__1_i_4__0_n_0),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetC[20]),
        .I3(barycentricXDeltaC[15]),
        .O(i__carry__1_i_12__0_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__1_i_12__1
       (.I0(i__carry__1_i_4__1_n_0),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetA[20]),
        .I3(barycentricXDeltaA[15]),
        .O(i__carry__1_i_12__1_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__1_i_13
       (.I0(p_0_out__0[19]),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetB[19]),
        .I3(barycentricXDeltaB[15]),
        .O(i__carry__1_i_13_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__1_i_13__0
       (.I0(i__carry__1_i_5__0_n_0),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetC[19]),
        .I3(barycentricXDeltaC[15]),
        .O(i__carry__1_i_13__0_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__1_i_13__1
       (.I0(i__carry__1_i_5__1_n_0),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetA[19]),
        .I3(barycentricXDeltaA[15]),
        .O(i__carry__1_i_13__1_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__1_i_14
       (.I0(p_0_out__0[18]),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetB[18]),
        .I3(barycentricXDeltaB[15]),
        .O(i__carry__1_i_14_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__1_i_14__0
       (.I0(i__carry__1_i_6__0_n_0),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetC[18]),
        .I3(barycentricXDeltaC[15]),
        .O(i__carry__1_i_14__0_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__1_i_14__1
       (.I0(i__carry__1_i_6__1_n_0),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetA[18]),
        .I3(barycentricXDeltaA[15]),
        .O(i__carry__1_i_14__1_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__1_i_15
       (.I0(p_0_out__0[17]),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetB[17]),
        .I3(barycentricXDeltaB[15]),
        .O(i__carry__1_i_15_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__1_i_15__0
       (.I0(i__carry__1_i_7__0_n_0),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetC[17]),
        .I3(barycentricXDeltaC[15]),
        .O(i__carry__1_i_15__0_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__1_i_15__1
       (.I0(i__carry__1_i_7__1_n_0),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetA[17]),
        .I3(barycentricXDeltaA[15]),
        .O(i__carry__1_i_15__1_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__1_i_16
       (.I0(p_0_out__0[16]),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetB[16]),
        .I3(barycentricXDeltaB[15]),
        .O(i__carry__1_i_16_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__1_i_16__0
       (.I0(i__carry__1_i_8__0_n_0),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetC[16]),
        .I3(barycentricXDeltaC[15]),
        .O(i__carry__1_i_16__0_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__1_i_16__1
       (.I0(i__carry__1_i_8__1_n_0),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetA[16]),
        .I3(barycentricXDeltaA[15]),
        .O(i__carry__1_i_16__1_n_0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__1_i_1__0
       (.I0(DBG_BarycentricC[23]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in22[23]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaC[15]),
        .O(i__carry__1_i_1__0_n_0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__1_i_1__1
       (.I0(DBG_BarycentricA[23]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in26[23]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaA[15]),
        .O(i__carry__1_i_1__1_n_0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__1_i_2
       (.I0(DBG_BarycentricB[22]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in24[22]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaB[15]),
        .O(p_0_out__0[22]));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__1_i_2__0
       (.I0(DBG_BarycentricC[22]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in22[22]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaC[15]),
        .O(i__carry__1_i_2__0_n_0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__1_i_2__1
       (.I0(DBG_BarycentricA[22]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in26[22]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaA[15]),
        .O(i__carry__1_i_2__1_n_0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__1_i_3
       (.I0(DBG_BarycentricB[21]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in24[21]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaB[15]),
        .O(p_0_out__0[21]));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__1_i_3__0
       (.I0(DBG_BarycentricC[21]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in22[21]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaC[15]),
        .O(i__carry__1_i_3__0_n_0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__1_i_3__1
       (.I0(DBG_BarycentricA[21]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in26[21]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaA[15]),
        .O(i__carry__1_i_3__1_n_0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__1_i_4
       (.I0(DBG_BarycentricB[20]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in24[20]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaB[15]),
        .O(p_0_out__0[20]));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__1_i_4__0
       (.I0(DBG_BarycentricC[20]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in22[20]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaC[15]),
        .O(i__carry__1_i_4__0_n_0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__1_i_4__1
       (.I0(DBG_BarycentricA[20]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in26[20]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaA[15]),
        .O(i__carry__1_i_4__1_n_0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__1_i_5
       (.I0(DBG_BarycentricB[19]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in24[19]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaB[15]),
        .O(p_0_out__0[19]));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__1_i_5__0
       (.I0(DBG_BarycentricC[19]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in22[19]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaC[15]),
        .O(i__carry__1_i_5__0_n_0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__1_i_5__1
       (.I0(DBG_BarycentricA[19]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in26[19]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaA[15]),
        .O(i__carry__1_i_5__1_n_0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__1_i_6
       (.I0(DBG_BarycentricB[18]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in24[18]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaB[15]),
        .O(p_0_out__0[18]));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__1_i_6__0
       (.I0(DBG_BarycentricC[18]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in22[18]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaC[15]),
        .O(i__carry__1_i_6__0_n_0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__1_i_6__1
       (.I0(DBG_BarycentricA[18]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in26[18]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaA[15]),
        .O(i__carry__1_i_6__1_n_0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__1_i_7
       (.I0(DBG_BarycentricB[17]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in24[17]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaB[15]),
        .O(p_0_out__0[17]));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__1_i_7__0
       (.I0(DBG_BarycentricC[17]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in22[17]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaC[15]),
        .O(i__carry__1_i_7__0_n_0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__1_i_7__1
       (.I0(DBG_BarycentricA[17]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in26[17]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaA[15]),
        .O(i__carry__1_i_7__1_n_0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__1_i_8
       (.I0(DBG_BarycentricB[16]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in24[16]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaB[15]),
        .O(p_0_out__0[16]));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__1_i_8__0
       (.I0(DBG_BarycentricC[16]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in22[16]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaC[15]),
        .O(i__carry__1_i_8__0_n_0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__1_i_8__1
       (.I0(DBG_BarycentricA[16]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in26[16]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaA[15]),
        .O(i__carry__1_i_8__1_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__1_i_9
       (.I0(p_0_out__0[23]),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetB[23]),
        .I3(barycentricXDeltaB[15]),
        .O(i__carry__1_i_9_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__1_i_9__0
       (.I0(i__carry__1_i_1__0_n_0),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetC[23]),
        .I3(barycentricXDeltaC[15]),
        .O(i__carry__1_i_9__0_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__1_i_9__1
       (.I0(i__carry__1_i_1__1_n_0),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetA[23]),
        .I3(barycentricXDeltaA[15]),
        .O(i__carry__1_i_9__1_n_0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__2_i_1
       (.I0(DBG_BarycentricB[30]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in24[30]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaB[15]),
        .O(p_0_out__0[30]));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__2_i_10
       (.I0(p_0_out__0[29]),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetB[29]),
        .I3(barycentricXDeltaB[15]),
        .O(i__carry__2_i_10_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__2_i_10__0
       (.I0(i__carry__2_i_2__0_n_0),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetC[29]),
        .I3(barycentricXDeltaC[15]),
        .O(i__carry__2_i_10__0_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__2_i_10__1
       (.I0(i__carry__2_i_2__1_n_0),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetA[29]),
        .I3(barycentricXDeltaA[15]),
        .O(i__carry__2_i_10__1_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__2_i_11
       (.I0(p_0_out__0[28]),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetB[28]),
        .I3(barycentricXDeltaB[15]),
        .O(i__carry__2_i_11_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__2_i_11__0
       (.I0(i__carry__2_i_3__0_n_0),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetC[28]),
        .I3(barycentricXDeltaC[15]),
        .O(i__carry__2_i_11__0_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__2_i_11__1
       (.I0(i__carry__2_i_3__1_n_0),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetA[28]),
        .I3(barycentricXDeltaA[15]),
        .O(i__carry__2_i_11__1_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__2_i_12
       (.I0(p_0_out__0[27]),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetB[27]),
        .I3(barycentricXDeltaB[15]),
        .O(i__carry__2_i_12_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__2_i_12__0
       (.I0(i__carry__2_i_4__0_n_0),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetC[27]),
        .I3(barycentricXDeltaC[15]),
        .O(i__carry__2_i_12__0_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__2_i_12__1
       (.I0(i__carry__2_i_4__1_n_0),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetA[27]),
        .I3(barycentricXDeltaA[15]),
        .O(i__carry__2_i_12__1_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__2_i_13
       (.I0(p_0_out__0[26]),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetB[26]),
        .I3(barycentricXDeltaB[15]),
        .O(i__carry__2_i_13_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__2_i_13__0
       (.I0(i__carry__2_i_5__0_n_0),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetC[26]),
        .I3(barycentricXDeltaC[15]),
        .O(i__carry__2_i_13__0_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__2_i_13__1
       (.I0(i__carry__2_i_5__1_n_0),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetA[26]),
        .I3(barycentricXDeltaA[15]),
        .O(i__carry__2_i_13__1_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__2_i_14
       (.I0(p_0_out__0[25]),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetB[25]),
        .I3(barycentricXDeltaB[15]),
        .O(i__carry__2_i_14_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__2_i_14__0
       (.I0(i__carry__2_i_6__0_n_0),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetC[25]),
        .I3(barycentricXDeltaC[15]),
        .O(i__carry__2_i_14__0_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__2_i_14__1
       (.I0(i__carry__2_i_6__1_n_0),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetA[25]),
        .I3(barycentricXDeltaA[15]),
        .O(i__carry__2_i_14__1_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__2_i_15
       (.I0(p_0_out__0[24]),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetB[24]),
        .I3(barycentricXDeltaB[15]),
        .O(i__carry__2_i_15_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__2_i_15__0
       (.I0(i__carry__2_i_7__0_n_0),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetC[24]),
        .I3(barycentricXDeltaC[15]),
        .O(i__carry__2_i_15__0_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__2_i_15__1
       (.I0(i__carry__2_i_7__1_n_0),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetA[24]),
        .I3(barycentricXDeltaA[15]),
        .O(i__carry__2_i_15__1_n_0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__2_i_16
       (.I0(DBG_BarycentricB[31]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in24[31]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaB[15]),
        .O(p_0_out));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__2_i_16__0
       (.I0(DBG_BarycentricC[31]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in22[31]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaC[15]),
        .O(i__carry__2_i_16__0_n_0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__2_i_16__1
       (.I0(DBG_BarycentricA[31]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in26[31]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaA[15]),
        .O(i__carry__2_i_16__1_n_0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__2_i_1__0
       (.I0(DBG_BarycentricC[30]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in22[30]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaC[15]),
        .O(i__carry__2_i_1__0_n_0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__2_i_1__1
       (.I0(DBG_BarycentricA[30]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in26[30]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaA[15]),
        .O(i__carry__2_i_1__1_n_0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__2_i_2
       (.I0(DBG_BarycentricB[29]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in24[29]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaB[15]),
        .O(p_0_out__0[29]));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__2_i_2__0
       (.I0(DBG_BarycentricC[29]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in22[29]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaC[15]),
        .O(i__carry__2_i_2__0_n_0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__2_i_2__1
       (.I0(DBG_BarycentricA[29]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in26[29]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaA[15]),
        .O(i__carry__2_i_2__1_n_0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__2_i_3
       (.I0(DBG_BarycentricB[28]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in24[28]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaB[15]),
        .O(p_0_out__0[28]));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__2_i_3__0
       (.I0(DBG_BarycentricC[28]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in22[28]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaC[15]),
        .O(i__carry__2_i_3__0_n_0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__2_i_3__1
       (.I0(DBG_BarycentricA[28]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in26[28]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaA[15]),
        .O(i__carry__2_i_3__1_n_0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__2_i_4
       (.I0(DBG_BarycentricB[27]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in24[27]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaB[15]),
        .O(p_0_out__0[27]));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__2_i_4__0
       (.I0(DBG_BarycentricC[27]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in22[27]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaC[15]),
        .O(i__carry__2_i_4__0_n_0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__2_i_4__1
       (.I0(DBG_BarycentricA[27]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in26[27]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaA[15]),
        .O(i__carry__2_i_4__1_n_0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__2_i_5
       (.I0(DBG_BarycentricB[26]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in24[26]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaB[15]),
        .O(p_0_out__0[26]));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__2_i_5__0
       (.I0(DBG_BarycentricC[26]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in22[26]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaC[15]),
        .O(i__carry__2_i_5__0_n_0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__2_i_5__1
       (.I0(DBG_BarycentricA[26]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in26[26]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaA[15]),
        .O(i__carry__2_i_5__1_n_0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__2_i_6
       (.I0(DBG_BarycentricB[25]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in24[25]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaB[15]),
        .O(p_0_out__0[25]));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__2_i_6__0
       (.I0(DBG_BarycentricC[25]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in22[25]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaC[15]),
        .O(i__carry__2_i_6__0_n_0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__2_i_6__1
       (.I0(DBG_BarycentricA[25]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in26[25]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaA[15]),
        .O(i__carry__2_i_6__1_n_0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__2_i_7
       (.I0(DBG_BarycentricB[24]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in24[24]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaB[15]),
        .O(p_0_out__0[24]));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__2_i_7__0
       (.I0(DBG_BarycentricC[24]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in22[24]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaC[15]),
        .O(i__carry__2_i_7__0_n_0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry__2_i_7__1
       (.I0(DBG_BarycentricA[24]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in26[24]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaA[15]),
        .O(i__carry__2_i_7__1_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__2_i_8
       (.I0(p_0_out),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetB[31]),
        .I3(barycentricXDeltaB[15]),
        .O(i__carry__2_i_8_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__2_i_8__0
       (.I0(i__carry__2_i_16__0_n_0),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetC[31]),
        .I3(barycentricXDeltaC[15]),
        .O(i__carry__2_i_8__0_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__2_i_8__1
       (.I0(i__carry__2_i_16__1_n_0),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetA[31]),
        .I3(barycentricXDeltaA[15]),
        .O(i__carry__2_i_8__1_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__2_i_9
       (.I0(p_0_out__0[30]),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetB[30]),
        .I3(barycentricXDeltaB[15]),
        .O(i__carry__2_i_9_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__2_i_9__0
       (.I0(i__carry__2_i_1__0_n_0),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetC[30]),
        .I3(barycentricXDeltaC[15]),
        .O(i__carry__2_i_9__0_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry__2_i_9__1
       (.I0(i__carry__2_i_1__1_n_0),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetA[30]),
        .I3(barycentricXDeltaA[15]),
        .O(i__carry__2_i_9__1_n_0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry_i_1
       (.I0(DBG_BarycentricB[7]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in24[7]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaB[7]),
        .O(p_0_out__0[7]));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry_i_10
       (.I0(p_0_out__0[6]),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetB[6]),
        .I3(barycentricXDeltaB[6]),
        .O(i__carry_i_10_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry_i_10__0
       (.I0(i__carry_i_2__0_n_0),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetC[6]),
        .I3(barycentricXDeltaC[6]),
        .O(i__carry_i_10__0_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry_i_10__1
       (.I0(i__carry_i_2__1_n_0),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetA[6]),
        .I3(barycentricXDeltaA[6]),
        .O(i__carry_i_10__1_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry_i_11
       (.I0(p_0_out__0[5]),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetB[5]),
        .I3(barycentricXDeltaB[5]),
        .O(i__carry_i_11_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry_i_11__0
       (.I0(i__carry_i_3__0_n_0),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetC[5]),
        .I3(barycentricXDeltaC[5]),
        .O(i__carry_i_11__0_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry_i_11__1
       (.I0(i__carry_i_3__1_n_0),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetA[5]),
        .I3(barycentricXDeltaA[5]),
        .O(i__carry_i_11__1_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry_i_12
       (.I0(p_0_out__0[4]),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetB[4]),
        .I3(barycentricXDeltaB[4]),
        .O(i__carry_i_12_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry_i_12__0
       (.I0(i__carry_i_4__0_n_0),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetC[4]),
        .I3(barycentricXDeltaC[4]),
        .O(i__carry_i_12__0_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry_i_12__1
       (.I0(i__carry_i_4__1_n_0),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetA[4]),
        .I3(barycentricXDeltaA[4]),
        .O(i__carry_i_12__1_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry_i_13
       (.I0(p_0_out__0[3]),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetB[3]),
        .I3(barycentricXDeltaB[3]),
        .O(i__carry_i_13_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry_i_13__0
       (.I0(i__carry_i_5__0_n_0),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetC[3]),
        .I3(barycentricXDeltaC[3]),
        .O(i__carry_i_13__0_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry_i_13__1
       (.I0(i__carry_i_5__1_n_0),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetA[3]),
        .I3(barycentricXDeltaA[3]),
        .O(i__carry_i_13__1_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry_i_14
       (.I0(p_0_out__0[2]),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetB[2]),
        .I3(barycentricXDeltaB[2]),
        .O(i__carry_i_14_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry_i_14__0
       (.I0(i__carry_i_6__0_n_0),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetC[2]),
        .I3(barycentricXDeltaC[2]),
        .O(i__carry_i_14__0_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry_i_14__1
       (.I0(i__carry_i_6__1_n_0),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetA[2]),
        .I3(barycentricXDeltaA[2]),
        .O(i__carry_i_14__1_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry_i_15
       (.I0(p_0_out__0[1]),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetB[1]),
        .I3(barycentricXDeltaB[1]),
        .O(i__carry_i_15_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry_i_15__0
       (.I0(i__carry_i_7__0_n_0),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetC[1]),
        .I3(barycentricXDeltaC[1]),
        .O(i__carry_i_15__0_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry_i_15__1
       (.I0(i__carry_i_7__1_n_0),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetA[1]),
        .I3(barycentricXDeltaA[1]),
        .O(i__carry_i_15__1_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry_i_16
       (.I0(p_0_out__0[0]),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetB[0]),
        .I3(barycentricXDeltaB[0]),
        .O(i__carry_i_16_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry_i_16__0
       (.I0(i__carry_i_8__0_n_0),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetC[0]),
        .I3(barycentricXDeltaC[0]),
        .O(i__carry_i_16__0_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry_i_16__1
       (.I0(i__carry_i_8__1_n_0),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetA[0]),
        .I3(barycentricXDeltaA[0]),
        .O(i__carry_i_16__1_n_0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry_i_1__0
       (.I0(DBG_BarycentricC[7]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in22[7]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaC[7]),
        .O(i__carry_i_1__0_n_0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry_i_1__1
       (.I0(DBG_BarycentricA[7]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in26[7]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaA[7]),
        .O(i__carry_i_1__1_n_0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry_i_2
       (.I0(DBG_BarycentricB[6]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in24[6]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaB[6]),
        .O(p_0_out__0[6]));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry_i_2__0
       (.I0(DBG_BarycentricC[6]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in22[6]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaC[6]),
        .O(i__carry_i_2__0_n_0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry_i_2__1
       (.I0(DBG_BarycentricA[6]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in26[6]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaA[6]),
        .O(i__carry_i_2__1_n_0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry_i_3
       (.I0(DBG_BarycentricB[5]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in24[5]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaB[5]),
        .O(p_0_out__0[5]));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry_i_3__0
       (.I0(DBG_BarycentricC[5]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in22[5]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaC[5]),
        .O(i__carry_i_3__0_n_0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry_i_3__1
       (.I0(DBG_BarycentricA[5]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in26[5]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaA[5]),
        .O(i__carry_i_3__1_n_0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry_i_4
       (.I0(DBG_BarycentricB[4]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in24[4]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaB[4]),
        .O(p_0_out__0[4]));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry_i_4__0
       (.I0(DBG_BarycentricC[4]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in22[4]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaC[4]),
        .O(i__carry_i_4__0_n_0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry_i_4__1
       (.I0(DBG_BarycentricA[4]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in26[4]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaA[4]),
        .O(i__carry_i_4__1_n_0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry_i_5
       (.I0(DBG_BarycentricB[3]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in24[3]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaB[3]),
        .O(p_0_out__0[3]));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry_i_5__0
       (.I0(DBG_BarycentricC[3]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in22[3]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaC[3]),
        .O(i__carry_i_5__0_n_0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry_i_5__1
       (.I0(DBG_BarycentricA[3]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in26[3]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaA[3]),
        .O(i__carry_i_5__1_n_0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry_i_6
       (.I0(DBG_BarycentricB[2]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in24[2]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaB[2]),
        .O(p_0_out__0[2]));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry_i_6__0
       (.I0(DBG_BarycentricC[2]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in22[2]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaC[2]),
        .O(i__carry_i_6__0_n_0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry_i_6__1
       (.I0(DBG_BarycentricA[2]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in26[2]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaA[2]),
        .O(i__carry_i_6__1_n_0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry_i_7
       (.I0(DBG_BarycentricB[1]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in24[1]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaB[1]),
        .O(p_0_out__0[1]));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry_i_7__0
       (.I0(DBG_BarycentricC[1]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in22[1]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaC[1]),
        .O(i__carry_i_7__0_n_0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry_i_7__1
       (.I0(DBG_BarycentricA[1]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in26[1]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaA[1]),
        .O(i__carry_i_7__1_n_0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry_i_8
       (.I0(DBG_BarycentricB[0]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in24[0]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaB[0]),
        .O(p_0_out__0[0]));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry_i_8__0
       (.I0(DBG_BarycentricC[0]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in22[0]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaC[0]),
        .O(i__carry_i_8__0_n_0));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    i__carry_i_8__1
       (.I0(DBG_BarycentricA[0]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(in26[0]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inBarycentricXDeltaA[0]),
        .O(i__carry_i_8__1_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry_i_9
       (.I0(p_0_out__0[7]),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetB[7]),
        .I3(barycentricXDeltaB[7]),
        .O(i__carry_i_9_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry_i_9__0
       (.I0(i__carry_i_1__0_n_0),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetC[7]),
        .I3(barycentricXDeltaC[7]),
        .O(i__carry_i_9__0_n_0));
  LUT4 #(
    .INIT(16'h569A)) 
    i__carry_i_9__1
       (.I0(i__carry_i_1__1_n_0),
        .I1(currentState__0[0]),
        .I2(TRISETUP_inInitialBarycentricRowResetA[7]),
        .I3(barycentricXDeltaA[7]),
        .O(i__carry_i_9__1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    isTopLeftEdgeB_reg
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inIsTopLeftEdgeB),
        .Q(isTopLeftEdgeB),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    isTopLeftEdgeC_reg
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inIsTopLeftEdgeC),
        .Q(isTopLeftEdgeC),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \maxX_reg[0] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inMaxX[0]),
        .Q(DBG_MaxX[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \maxX_reg[10] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inMaxX[10]),
        .Q(DBG_MaxX[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \maxX_reg[11] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inMaxX[11]),
        .Q(DBG_MaxX[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \maxX_reg[12] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inMaxX[12]),
        .Q(DBG_MaxX[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \maxX_reg[13] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inMaxX[13]),
        .Q(DBG_MaxX[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \maxX_reg[14] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inMaxX[14]),
        .Q(DBG_MaxX[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \maxX_reg[15] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inMaxX[15]),
        .Q(DBG_MaxX[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \maxX_reg[1] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inMaxX[1]),
        .Q(DBG_MaxX[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \maxX_reg[2] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inMaxX[2]),
        .Q(DBG_MaxX[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \maxX_reg[3] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inMaxX[3]),
        .Q(DBG_MaxX[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \maxX_reg[4] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inMaxX[4]),
        .Q(DBG_MaxX[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \maxX_reg[5] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inMaxX[5]),
        .Q(DBG_MaxX[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \maxX_reg[6] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inMaxX[6]),
        .Q(DBG_MaxX[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \maxX_reg[7] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inMaxX[7]),
        .Q(DBG_MaxX[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \maxX_reg[8] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inMaxX[8]),
        .Q(DBG_MaxX[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \maxX_reg[9] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inMaxX[9]),
        .Q(DBG_MaxX[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \maxY_reg[0] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inMaxY[0]),
        .Q(DBG_MaxY[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \maxY_reg[10] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inMaxY[10]),
        .Q(DBG_MaxY[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \maxY_reg[11] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inMaxY[11]),
        .Q(DBG_MaxY[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \maxY_reg[12] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inMaxY[12]),
        .Q(DBG_MaxY[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \maxY_reg[13] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inMaxY[13]),
        .Q(DBG_MaxY[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \maxY_reg[14] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inMaxY[14]),
        .Q(DBG_MaxY[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \maxY_reg[15] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inMaxY[15]),
        .Q(DBG_MaxY[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \maxY_reg[1] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inMaxY[1]),
        .Q(DBG_MaxY[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \maxY_reg[2] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inMaxY[2]),
        .Q(DBG_MaxY[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \maxY_reg[3] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inMaxY[3]),
        .Q(DBG_MaxY[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \maxY_reg[4] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inMaxY[4]),
        .Q(DBG_MaxY[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \maxY_reg[5] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inMaxY[5]),
        .Q(DBG_MaxY[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \maxY_reg[6] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inMaxY[6]),
        .Q(DBG_MaxY[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \maxY_reg[7] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inMaxY[7]),
        .Q(DBG_MaxY[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \maxY_reg[8] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inMaxY[8]),
        .Q(DBG_MaxY[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \maxY_reg[9] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inMaxY[9]),
        .Q(DBG_MaxY[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \minX_reg[0] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inMinX[0]),
        .Q(DBG_MinX[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \minX_reg[10] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inMinX[10]),
        .Q(DBG_MinX[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \minX_reg[11] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inMinX[11]),
        .Q(DBG_MinX[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \minX_reg[12] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inMinX[12]),
        .Q(DBG_MinX[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \minX_reg[13] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inMinX[13]),
        .Q(DBG_MinX[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \minX_reg[14] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inMinX[14]),
        .Q(DBG_MinX[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \minX_reg[15] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inMinX[15]),
        .Q(DBG_MinX[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \minX_reg[1] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inMinX[1]),
        .Q(DBG_MinX[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \minX_reg[2] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inMinX[2]),
        .Q(DBG_MinX[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \minX_reg[3] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inMinX[3]),
        .Q(DBG_MinX[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \minX_reg[4] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inMinX[4]),
        .Q(DBG_MinX[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \minX_reg[5] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inMinX[5]),
        .Q(DBG_MinX[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \minX_reg[6] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inMinX[6]),
        .Q(DBG_MinX[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \minX_reg[7] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inMinX[7]),
        .Q(DBG_MinX[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \minX_reg[8] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inMinX[8]),
        .Q(DBG_MinX[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \minX_reg[9] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inMinX[9]),
        .Q(DBG_MinX[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \minY_reg[0] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inMinY[0]),
        .Q(DBG_MinY[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \minY_reg[10] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inMinY[10]),
        .Q(DBG_MinY[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \minY_reg[11] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inMinY[11]),
        .Q(DBG_MinY[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \minY_reg[12] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inMinY[12]),
        .Q(DBG_MinY[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \minY_reg[13] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inMinY[13]),
        .Q(DBG_MinY[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \minY_reg[14] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inMinY[14]),
        .Q(DBG_MinY[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \minY_reg[15] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inMinY[15]),
        .Q(DBG_MinY[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \minY_reg[1] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inMinY[1]),
        .Q(DBG_MinY[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \minY_reg[2] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inMinY[2]),
        .Q(DBG_MinY[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \minY_reg[3] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inMinY[3]),
        .Q(DBG_MinY[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \minY_reg[4] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inMinY[4]),
        .Q(DBG_MinY[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \minY_reg[5] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inMinY[5]),
        .Q(DBG_MinY[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \minY_reg[6] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inMinY[6]),
        .Q(DBG_MinY[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \minY_reg[7] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inMinY[7]),
        .Q(DBG_MinY[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \minY_reg[8] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inMinY[8]),
        .Q(DBG_MinY[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \minY_reg[9] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inMinY[9]),
        .Q(DBG_MinY[9]),
        .R(1'b0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY8 pixelXPos1_carry
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({pixelXPos1_carry_n_0,pixelXPos1_carry_n_1,pixelXPos1_carry_n_2,pixelXPos1_carry_n_3,pixelXPos1_carry_n_4,pixelXPos1_carry_n_5,pixelXPos1_carry_n_6,pixelXPos1_carry_n_7}),
        .DI({pixelXPos1_carry_i_1_n_0,pixelXPos1_carry_i_2_n_0,pixelXPos1_carry_i_3_n_0,pixelXPos1_carry_i_4_n_0,pixelXPos1_carry_i_5_n_0,pixelXPos1_carry_i_6_n_0,pixelXPos1_carry_i_7_n_0,pixelXPos1_carry_i_8_n_0}),
        .O(NLW_pixelXPos1_carry_O_UNCONNECTED[7:0]),
        .S({pixelXPos1_carry_i_9_n_0,pixelXPos1_carry_i_10_n_0,pixelXPos1_carry_i_11_n_0,pixelXPos1_carry_i_12_n_0,pixelXPos1_carry_i_13_n_0,pixelXPos1_carry_i_14_n_0,pixelXPos1_carry_i_15_n_0,pixelXPos1_carry_i_16_n_0}));
  LUT4 #(
    .INIT(16'h2F02)) 
    pixelXPos1_carry_i_1
       (.I0(Q[14]),
        .I1(DBG_MaxY[14]),
        .I2(DBG_MaxY[15]),
        .I3(Q[15]),
        .O(pixelXPos1_carry_i_1_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pixelXPos1_carry_i_10
       (.I0(Q[12]),
        .I1(DBG_MaxY[12]),
        .I2(Q[13]),
        .I3(DBG_MaxY[13]),
        .O(pixelXPos1_carry_i_10_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pixelXPos1_carry_i_11
       (.I0(Q[10]),
        .I1(DBG_MaxY[10]),
        .I2(Q[11]),
        .I3(DBG_MaxY[11]),
        .O(pixelXPos1_carry_i_11_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pixelXPos1_carry_i_12
       (.I0(Q[8]),
        .I1(DBG_MaxY[8]),
        .I2(Q[9]),
        .I3(DBG_MaxY[9]),
        .O(pixelXPos1_carry_i_12_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pixelXPos1_carry_i_13
       (.I0(Q[6]),
        .I1(DBG_MaxY[6]),
        .I2(Q[7]),
        .I3(DBG_MaxY[7]),
        .O(pixelXPos1_carry_i_13_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pixelXPos1_carry_i_14
       (.I0(Q[4]),
        .I1(DBG_MaxY[4]),
        .I2(Q[5]),
        .I3(DBG_MaxY[5]),
        .O(pixelXPos1_carry_i_14_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pixelXPos1_carry_i_15
       (.I0(Q[2]),
        .I1(DBG_MaxY[2]),
        .I2(Q[3]),
        .I3(DBG_MaxY[3]),
        .O(pixelXPos1_carry_i_15_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pixelXPos1_carry_i_16
       (.I0(Q[0]),
        .I1(DBG_MaxY[0]),
        .I2(Q[1]),
        .I3(DBG_MaxY[1]),
        .O(pixelXPos1_carry_i_16_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pixelXPos1_carry_i_2
       (.I0(Q[12]),
        .I1(DBG_MaxY[12]),
        .I2(DBG_MaxY[13]),
        .I3(Q[13]),
        .O(pixelXPos1_carry_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pixelXPos1_carry_i_3
       (.I0(Q[10]),
        .I1(DBG_MaxY[10]),
        .I2(DBG_MaxY[11]),
        .I3(Q[11]),
        .O(pixelXPos1_carry_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pixelXPos1_carry_i_4
       (.I0(Q[8]),
        .I1(DBG_MaxY[8]),
        .I2(DBG_MaxY[9]),
        .I3(Q[9]),
        .O(pixelXPos1_carry_i_4_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pixelXPos1_carry_i_5
       (.I0(Q[6]),
        .I1(DBG_MaxY[6]),
        .I2(DBG_MaxY[7]),
        .I3(Q[7]),
        .O(pixelXPos1_carry_i_5_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pixelXPos1_carry_i_6
       (.I0(Q[4]),
        .I1(DBG_MaxY[4]),
        .I2(DBG_MaxY[5]),
        .I3(Q[5]),
        .O(pixelXPos1_carry_i_6_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pixelXPos1_carry_i_7
       (.I0(Q[2]),
        .I1(DBG_MaxY[2]),
        .I2(DBG_MaxY[3]),
        .I3(Q[3]),
        .O(pixelXPos1_carry_i_7_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pixelXPos1_carry_i_8
       (.I0(Q[0]),
        .I1(DBG_MaxY[0]),
        .I2(DBG_MaxY[1]),
        .I3(Q[1]),
        .O(pixelXPos1_carry_i_8_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pixelXPos1_carry_i_9
       (.I0(Q[14]),
        .I1(DBG_MaxY[14]),
        .I2(Q[15]),
        .I3(DBG_MaxY[15]),
        .O(pixelXPos1_carry_i_9_n_0));
  LUT6 #(
    .INIT(64'hF704FFFFF7040000)) 
    \pixelXPos[0]_i_1 
       (.I0(\pixelXPos_reg[15]_0 [0]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(DBG_MinX[0]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inMinX[0]),
        .O(pixelXPos[0]));
  LUT6 #(
    .INIT(64'h6F60FFFF6F600000)) 
    \pixelXPos[10]_i_1 
       (.I0(\pixelXPos[10]_i_2_n_0 ),
        .I1(\pixelXPos_reg[15]_0 [10]),
        .I2(\currentState[2]__0_i_4_n_0 ),
        .I3(DBG_MinX[10]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inMinX[10]),
        .O(pixelXPos[10]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \pixelXPos[10]_i_2 
       (.I0(\pixelXPos_reg[15]_0 [9]),
        .I1(\pixelXPos_reg[15]_0 [7]),
        .I2(\pixelXPos[6]_i_2_n_0 ),
        .I3(\pixelXPos_reg[15]_0 [6]),
        .I4(\pixelXPos_reg[15]_0 [8]),
        .O(\pixelXPos[10]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h6F60FFFF6F600000)) 
    \pixelXPos[11]_i_1 
       (.I0(\pixelXPos[11]_i_2_n_0 ),
        .I1(\pixelXPos_reg[15]_0 [11]),
        .I2(\currentState[2]__0_i_4_n_0 ),
        .I3(DBG_MinX[11]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inMinX[11]),
        .O(pixelXPos[11]));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \pixelXPos[11]_i_2 
       (.I0(\pixelXPos_reg[15]_0 [10]),
        .I1(\pixelXPos_reg[15]_0 [8]),
        .I2(\pixelXPos_reg[15]_0 [6]),
        .I3(\pixelXPos[6]_i_2_n_0 ),
        .I4(\pixelXPos_reg[15]_0 [7]),
        .I5(\pixelXPos_reg[15]_0 [9]),
        .O(\pixelXPos[11]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h6F60FFFF6F600000)) 
    \pixelXPos[12]_i_1 
       (.I0(\pixelXPos[12]_i_2_n_0 ),
        .I1(\pixelXPos_reg[15]_0 [12]),
        .I2(\currentState[2]__0_i_4_n_0 ),
        .I3(DBG_MinX[12]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inMinX[12]),
        .O(pixelXPos[12]));
  LUT2 #(
    .INIT(4'h8)) 
    \pixelXPos[12]_i_2 
       (.I0(\pixelXPos_reg[15]_0 [11]),
        .I1(\pixelXPos[11]_i_2_n_0 ),
        .O(\pixelXPos[12]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h6F60FFFF6F600000)) 
    \pixelXPos[13]_i_1 
       (.I0(\pixelXPos[13]_i_2_n_0 ),
        .I1(\pixelXPos_reg[15]_0 [13]),
        .I2(\currentState[2]__0_i_4_n_0 ),
        .I3(DBG_MinX[13]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inMinX[13]),
        .O(pixelXPos[13]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \pixelXPos[13]_i_2 
       (.I0(\pixelXPos_reg[15]_0 [12]),
        .I1(\pixelXPos[11]_i_2_n_0 ),
        .I2(\pixelXPos_reg[15]_0 [11]),
        .O(\pixelXPos[13]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h6F60FFFF6F600000)) 
    \pixelXPos[14]_i_1 
       (.I0(\pixelXPos[14]_i_2_n_0 ),
        .I1(\pixelXPos_reg[15]_0 [14]),
        .I2(\currentState[2]__0_i_4_n_0 ),
        .I3(DBG_MinX[14]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inMinX[14]),
        .O(pixelXPos[14]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \pixelXPos[14]_i_2 
       (.I0(\pixelXPos_reg[15]_0 [13]),
        .I1(\pixelXPos_reg[15]_0 [11]),
        .I2(\pixelXPos[11]_i_2_n_0 ),
        .I3(\pixelXPos_reg[15]_0 [12]),
        .O(\pixelXPos[14]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h0007)) 
    \pixelXPos[15]_i_1 
       (.I0(currentState__0[0]),
        .I1(pixelXPos1_carry_n_0),
        .I2(currentState__0[2]),
        .I3(currentState__0[1]),
        .O(pixelXPos_2));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    \pixelXPos[15]_i_2 
       (.I0(plusOp),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(DBG_MinX[15]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inMinX[15]),
        .O(pixelXPos[15]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \pixelXPos[15]_i_3 
       (.I0(\pixelXPos_reg[15]_0 [13]),
        .I1(\pixelXPos_reg[15]_0 [11]),
        .I2(\pixelXPos[11]_i_2_n_0 ),
        .I3(\pixelXPos_reg[15]_0 [12]),
        .I4(\pixelXPos_reg[15]_0 [14]),
        .I5(\pixelXPos_reg[15]_0 [15]),
        .O(plusOp));
  LUT6 #(
    .INIT(64'h6F60FFFF6F600000)) 
    \pixelXPos[1]_i_1 
       (.I0(\pixelXPos_reg[15]_0 [0]),
        .I1(\pixelXPos_reg[15]_0 [1]),
        .I2(\currentState[2]__0_i_4_n_0 ),
        .I3(DBG_MinX[1]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inMinX[1]),
        .O(pixelXPos[1]));
  LUT6 #(
    .INIT(64'h6F60FFFF6F600000)) 
    \pixelXPos[2]_i_1 
       (.I0(\pixelXPos[2]_i_2_n_0 ),
        .I1(\pixelXPos_reg[15]_0 [2]),
        .I2(\currentState[2]__0_i_4_n_0 ),
        .I3(DBG_MinX[2]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inMinX[2]),
        .O(pixelXPos[2]));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \pixelXPos[2]_i_2 
       (.I0(\pixelXPos_reg[15]_0 [1]),
        .I1(\pixelXPos_reg[15]_0 [0]),
        .O(\pixelXPos[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h6F60FFFF6F600000)) 
    \pixelXPos[3]_i_1 
       (.I0(\pixelXPos[3]_i_2_n_0 ),
        .I1(\pixelXPos_reg[15]_0 [3]),
        .I2(\currentState[2]__0_i_4_n_0 ),
        .I3(DBG_MinX[3]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inMinX[3]),
        .O(pixelXPos[3]));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \pixelXPos[3]_i_2 
       (.I0(\pixelXPos_reg[15]_0 [2]),
        .I1(\pixelXPos_reg[15]_0 [0]),
        .I2(\pixelXPos_reg[15]_0 [1]),
        .O(\pixelXPos[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h6F60FFFF6F600000)) 
    \pixelXPos[4]_i_1 
       (.I0(\pixelXPos[4]_i_2_n_0 ),
        .I1(\pixelXPos_reg[15]_0 [4]),
        .I2(\currentState[2]__0_i_4_n_0 ),
        .I3(DBG_MinX[4]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inMinX[4]),
        .O(pixelXPos[4]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \pixelXPos[4]_i_2 
       (.I0(\pixelXPos_reg[15]_0 [3]),
        .I1(\pixelXPos_reg[15]_0 [1]),
        .I2(\pixelXPos_reg[15]_0 [0]),
        .I3(\pixelXPos_reg[15]_0 [2]),
        .O(\pixelXPos[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h6F60FFFF6F600000)) 
    \pixelXPos[5]_i_1 
       (.I0(\pixelXPos[5]_i_2_n_0 ),
        .I1(\pixelXPos_reg[15]_0 [5]),
        .I2(\currentState[2]__0_i_4_n_0 ),
        .I3(DBG_MinX[5]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inMinX[5]),
        .O(pixelXPos[5]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \pixelXPos[5]_i_2 
       (.I0(\pixelXPos_reg[15]_0 [4]),
        .I1(\pixelXPos_reg[15]_0 [2]),
        .I2(\pixelXPos_reg[15]_0 [0]),
        .I3(\pixelXPos_reg[15]_0 [1]),
        .I4(\pixelXPos_reg[15]_0 [3]),
        .O(\pixelXPos[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h6F60FFFF6F600000)) 
    \pixelXPos[6]_i_1 
       (.I0(\pixelXPos[6]_i_2_n_0 ),
        .I1(\pixelXPos_reg[15]_0 [6]),
        .I2(\currentState[2]__0_i_4_n_0 ),
        .I3(DBG_MinX[6]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inMinX[6]),
        .O(pixelXPos[6]));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \pixelXPos[6]_i_2 
       (.I0(\pixelXPos_reg[15]_0 [5]),
        .I1(\pixelXPos_reg[15]_0 [3]),
        .I2(\pixelXPos_reg[15]_0 [1]),
        .I3(\pixelXPos_reg[15]_0 [0]),
        .I4(\pixelXPos_reg[15]_0 [2]),
        .I5(\pixelXPos_reg[15]_0 [4]),
        .O(\pixelXPos[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h6F60FFFF6F600000)) 
    \pixelXPos[7]_i_1 
       (.I0(\pixelXPos[7]_i_2_n_0 ),
        .I1(\pixelXPos_reg[15]_0 [7]),
        .I2(\currentState[2]__0_i_4_n_0 ),
        .I3(DBG_MinX[7]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inMinX[7]),
        .O(pixelXPos[7]));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \pixelXPos[7]_i_2 
       (.I0(\pixelXPos_reg[15]_0 [6]),
        .I1(\pixelXPos[6]_i_2_n_0 ),
        .O(\pixelXPos[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h6F60FFFF6F600000)) 
    \pixelXPos[8]_i_1 
       (.I0(\pixelXPos[8]_i_2_n_0 ),
        .I1(\pixelXPos_reg[15]_0 [8]),
        .I2(\currentState[2]__0_i_4_n_0 ),
        .I3(DBG_MinX[8]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inMinX[8]),
        .O(pixelXPos[8]));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \pixelXPos[8]_i_2 
       (.I0(\pixelXPos_reg[15]_0 [7]),
        .I1(\pixelXPos[6]_i_2_n_0 ),
        .I2(\pixelXPos_reg[15]_0 [6]),
        .O(\pixelXPos[8]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h6F60FFFF6F600000)) 
    \pixelXPos[9]_i_1 
       (.I0(\pixelXPos[9]_i_2_n_0 ),
        .I1(\pixelXPos_reg[15]_0 [9]),
        .I2(\currentState[2]__0_i_4_n_0 ),
        .I3(DBG_MinX[9]),
        .I4(currentState__0[0]),
        .I5(TRISETUP_inMinX[9]),
        .O(pixelXPos[9]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \pixelXPos[9]_i_2 
       (.I0(\pixelXPos_reg[15]_0 [8]),
        .I1(\pixelXPos_reg[15]_0 [6]),
        .I2(\pixelXPos[6]_i_2_n_0 ),
        .I3(\pixelXPos_reg[15]_0 [7]),
        .O(\pixelXPos[9]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \pixelXPos_reg[0] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(pixelXPos[0]),
        .Q(\pixelXPos_reg[15]_0 [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelXPos_reg[10] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(pixelXPos[10]),
        .Q(\pixelXPos_reg[15]_0 [10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelXPos_reg[11] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(pixelXPos[11]),
        .Q(\pixelXPos_reg[15]_0 [11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelXPos_reg[12] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(pixelXPos[12]),
        .Q(\pixelXPos_reg[15]_0 [12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelXPos_reg[13] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(pixelXPos[13]),
        .Q(\pixelXPos_reg[15]_0 [13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelXPos_reg[14] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(pixelXPos[14]),
        .Q(\pixelXPos_reg[15]_0 [14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelXPos_reg[15] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(pixelXPos[15]),
        .Q(\pixelXPos_reg[15]_0 [15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelXPos_reg[1] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(pixelXPos[1]),
        .Q(\pixelXPos_reg[15]_0 [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelXPos_reg[2] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(pixelXPos[2]),
        .Q(\pixelXPos_reg[15]_0 [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelXPos_reg[3] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(pixelXPos[3]),
        .Q(\pixelXPos_reg[15]_0 [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelXPos_reg[4] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(pixelXPos[4]),
        .Q(\pixelXPos_reg[15]_0 [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelXPos_reg[5] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(pixelXPos[5]),
        .Q(\pixelXPos_reg[15]_0 [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelXPos_reg[6] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(pixelXPos[6]),
        .Q(\pixelXPos_reg[15]_0 [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelXPos_reg[7] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(pixelXPos[7]),
        .Q(\pixelXPos_reg[15]_0 [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelXPos_reg[8] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(pixelXPos[8]),
        .Q(\pixelXPos_reg[15]_0 [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelXPos_reg[9] 
       (.C(clk),
        .CE(pixelXPos_2),
        .D(pixelXPos[9]),
        .Q(\pixelXPos_reg[15]_0 [9]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'h5C)) 
    \pixelYPos[0]_i_1 
       (.I0(Q[0]),
        .I1(TRISETUP_inMinY[0]),
        .I2(currentState__0[0]),
        .O(pixelYPos[0]));
  LUT4 #(
    .INIT(16'h66F0)) 
    \pixelYPos[10]_i_1 
       (.I0(\pixelYPos[10]_i_2_n_0 ),
        .I1(Q[10]),
        .I2(TRISETUP_inMinY[10]),
        .I3(currentState__0[0]),
        .O(pixelYPos[10]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \pixelYPos[10]_i_2 
       (.I0(Q[9]),
        .I1(Q[7]),
        .I2(\pixelYPos[8]_i_2_n_0 ),
        .I3(Q[6]),
        .I4(Q[8]),
        .O(\pixelYPos[10]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h66F0)) 
    \pixelYPos[11]_i_1 
       (.I0(\pixelYPos[13]_i_2_n_0 ),
        .I1(Q[11]),
        .I2(TRISETUP_inMinY[11]),
        .I3(currentState__0[0]),
        .O(pixelYPos[11]));
  LUT5 #(
    .INIT(32'h7878FF00)) 
    \pixelYPos[12]_i_1 
       (.I0(\pixelYPos[13]_i_2_n_0 ),
        .I1(Q[11]),
        .I2(Q[12]),
        .I3(TRISETUP_inMinY[12]),
        .I4(currentState__0[0]),
        .O(pixelYPos[12]));
  LUT6 #(
    .INIT(64'h7F807F80FFFF0000)) 
    \pixelYPos[13]_i_1 
       (.I0(Q[11]),
        .I1(\pixelYPos[13]_i_2_n_0 ),
        .I2(Q[12]),
        .I3(Q[13]),
        .I4(TRISETUP_inMinY[13]),
        .I5(currentState__0[0]),
        .O(pixelYPos[13]));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \pixelYPos[13]_i_2 
       (.I0(Q[10]),
        .I1(Q[8]),
        .I2(Q[6]),
        .I3(\pixelYPos[8]_i_2_n_0 ),
        .I4(Q[7]),
        .I5(Q[9]),
        .O(\pixelYPos[13]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h66F0)) 
    \pixelYPos[14]_i_1 
       (.I0(\pixelYPos[15]_i_3_n_0 ),
        .I1(Q[14]),
        .I2(TRISETUP_inMinY[14]),
        .I3(currentState__0[0]),
        .O(pixelYPos[14]));
  LUT5 #(
    .INIT(32'h00000057)) 
    \pixelYPos[15]_i_1 
       (.I0(currentState__0[0]),
        .I1(fifoWriteEnable2),
        .I2(pixelXPos1_carry_n_0),
        .I3(currentState__0[2]),
        .I4(currentState__0[1]),
        .O(pixelYPos_1));
  LUT5 #(
    .INIT(32'h7878FF00)) 
    \pixelYPos[15]_i_2 
       (.I0(\pixelYPos[15]_i_3_n_0 ),
        .I1(Q[14]),
        .I2(Q[15]),
        .I3(TRISETUP_inMinY[15]),
        .I4(currentState__0[0]),
        .O(pixelYPos[15]));
  LUT4 #(
    .INIT(16'h8000)) 
    \pixelYPos[15]_i_3 
       (.I0(Q[13]),
        .I1(Q[11]),
        .I2(\pixelYPos[13]_i_2_n_0 ),
        .I3(Q[12]),
        .O(\pixelYPos[15]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h66F0)) 
    \pixelYPos[1]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(TRISETUP_inMinY[1]),
        .I3(currentState__0[0]),
        .O(pixelYPos[1]));
  LUT5 #(
    .INIT(32'h7878FF00)) 
    \pixelYPos[2]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[2]),
        .I3(TRISETUP_inMinY[2]),
        .I4(currentState__0[0]),
        .O(pixelYPos[2]));
  LUT6 #(
    .INIT(64'h7F807F80FFFF0000)) 
    \pixelYPos[3]_i_1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(Q[3]),
        .I4(TRISETUP_inMinY[3]),
        .I5(currentState__0[0]),
        .O(pixelYPos[3]));
  LUT4 #(
    .INIT(16'h66F0)) 
    \pixelYPos[4]_i_1 
       (.I0(\pixelYPos[4]_i_2_n_0 ),
        .I1(Q[4]),
        .I2(TRISETUP_inMinY[4]),
        .I3(currentState__0[0]),
        .O(pixelYPos[4]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \pixelYPos[4]_i_2 
       (.I0(Q[3]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(Q[2]),
        .O(\pixelYPos[4]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h66F0)) 
    \pixelYPos[5]_i_1 
       (.I0(\pixelYPos[5]_i_2_n_0 ),
        .I1(Q[5]),
        .I2(TRISETUP_inMinY[5]),
        .I3(currentState__0[0]),
        .O(pixelYPos[5]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \pixelYPos[5]_i_2 
       (.I0(Q[4]),
        .I1(Q[2]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(Q[3]),
        .O(\pixelYPos[5]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h66F0)) 
    \pixelYPos[6]_i_1 
       (.I0(\pixelYPos[8]_i_2_n_0 ),
        .I1(Q[6]),
        .I2(TRISETUP_inMinY[6]),
        .I3(currentState__0[0]),
        .O(pixelYPos[6]));
  LUT5 #(
    .INIT(32'h7878FF00)) 
    \pixelYPos[7]_i_1 
       (.I0(\pixelYPos[8]_i_2_n_0 ),
        .I1(Q[6]),
        .I2(Q[7]),
        .I3(TRISETUP_inMinY[7]),
        .I4(currentState__0[0]),
        .O(pixelYPos[7]));
  LUT6 #(
    .INIT(64'h7F807F80FFFF0000)) 
    \pixelYPos[8]_i_1 
       (.I0(Q[6]),
        .I1(\pixelYPos[8]_i_2_n_0 ),
        .I2(Q[7]),
        .I3(Q[8]),
        .I4(TRISETUP_inMinY[8]),
        .I5(currentState__0[0]),
        .O(pixelYPos[8]));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \pixelYPos[8]_i_2 
       (.I0(Q[5]),
        .I1(Q[3]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(Q[2]),
        .I5(Q[4]),
        .O(\pixelYPos[8]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h66F0)) 
    \pixelYPos[9]_i_1 
       (.I0(\pixelYPos[9]_i_2_n_0 ),
        .I1(Q[9]),
        .I2(TRISETUP_inMinY[9]),
        .I3(currentState__0[0]),
        .O(pixelYPos[9]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \pixelYPos[9]_i_2 
       (.I0(Q[8]),
        .I1(Q[6]),
        .I2(\pixelYPos[8]_i_2_n_0 ),
        .I3(Q[7]),
        .O(\pixelYPos[9]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \pixelYPos_reg[0] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(pixelYPos[0]),
        .Q(Q[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelYPos_reg[10] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(pixelYPos[10]),
        .Q(Q[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelYPos_reg[11] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(pixelYPos[11]),
        .Q(Q[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelYPos_reg[12] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(pixelYPos[12]),
        .Q(Q[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelYPos_reg[13] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(pixelYPos[13]),
        .Q(Q[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelYPos_reg[14] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(pixelYPos[14]),
        .Q(Q[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelYPos_reg[15] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(pixelYPos[15]),
        .Q(Q[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelYPos_reg[1] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(pixelYPos[1]),
        .Q(Q[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelYPos_reg[2] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(pixelYPos[2]),
        .Q(Q[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelYPos_reg[3] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(pixelYPos[3]),
        .Q(Q[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelYPos_reg[4] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(pixelYPos[4]),
        .Q(Q[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelYPos_reg[5] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(pixelYPos[5]),
        .Q(Q[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelYPos_reg[6] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(pixelYPos[6]),
        .Q(Q[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelYPos_reg[7] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(pixelYPos[7]),
        .Q(Q[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelYPos_reg[8] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(pixelYPos[8]),
        .Q(Q[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelYPos_reg[9] 
       (.C(clk),
        .CE(pixelYPos_1),
        .D(pixelYPos[9]),
        .Q(Q[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \previousDrawEventID_reg[0] 
       (.C(clk),
        .CE(previousDrawEventID_0),
        .D(currentDrawEventID[0]),
        .Q(previousDrawEventID[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \previousDrawEventID_reg[10] 
       (.C(clk),
        .CE(previousDrawEventID_0),
        .D(currentDrawEventID[10]),
        .Q(previousDrawEventID[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \previousDrawEventID_reg[11] 
       (.C(clk),
        .CE(previousDrawEventID_0),
        .D(currentDrawEventID[11]),
        .Q(previousDrawEventID[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \previousDrawEventID_reg[12] 
       (.C(clk),
        .CE(previousDrawEventID_0),
        .D(currentDrawEventID[12]),
        .Q(previousDrawEventID[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \previousDrawEventID_reg[13] 
       (.C(clk),
        .CE(previousDrawEventID_0),
        .D(currentDrawEventID[13]),
        .Q(previousDrawEventID[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \previousDrawEventID_reg[14] 
       (.C(clk),
        .CE(previousDrawEventID_0),
        .D(currentDrawEventID[14]),
        .Q(previousDrawEventID[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \previousDrawEventID_reg[15] 
       (.C(clk),
        .CE(previousDrawEventID_0),
        .D(currentDrawEventID[15]),
        .Q(previousDrawEventID[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \previousDrawEventID_reg[1] 
       (.C(clk),
        .CE(previousDrawEventID_0),
        .D(currentDrawEventID[1]),
        .Q(previousDrawEventID[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \previousDrawEventID_reg[2] 
       (.C(clk),
        .CE(previousDrawEventID_0),
        .D(currentDrawEventID[2]),
        .Q(previousDrawEventID[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \previousDrawEventID_reg[3] 
       (.C(clk),
        .CE(previousDrawEventID_0),
        .D(currentDrawEventID[3]),
        .Q(previousDrawEventID[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \previousDrawEventID_reg[4] 
       (.C(clk),
        .CE(previousDrawEventID_0),
        .D(currentDrawEventID[4]),
        .Q(previousDrawEventID[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \previousDrawEventID_reg[5] 
       (.C(clk),
        .CE(previousDrawEventID_0),
        .D(currentDrawEventID[5]),
        .Q(previousDrawEventID[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \previousDrawEventID_reg[6] 
       (.C(clk),
        .CE(previousDrawEventID_0),
        .D(currentDrawEventID[6]),
        .Q(previousDrawEventID[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \previousDrawEventID_reg[7] 
       (.C(clk),
        .CE(previousDrawEventID_0),
        .D(currentDrawEventID[7]),
        .Q(previousDrawEventID[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \previousDrawEventID_reg[8] 
       (.C(clk),
        .CE(previousDrawEventID_0),
        .D(currentDrawEventID[8]),
        .Q(previousDrawEventID[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \previousDrawEventID_reg[9] 
       (.C(clk),
        .CE(previousDrawEventID_0),
        .D(currentDrawEventID[9]),
        .Q(previousDrawEventID[9]),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h01)) 
    readyForNewTri_i_1
       (.I0(currentState__0[1]),
        .I1(currentState__0[0]),
        .I2(currentState__0[2]),
        .O(readyForNewTri_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair106" *) 
  LUT2 #(
    .INIT(4'h7)) 
    readyForNewTri_i_2
       (.I0(TRISETUP_readyForNewTri),
        .I1(TRISETUP_newTriBegin),
        .O(readyForNewTri_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    readyForNewTri_reg
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(readyForNewTri_i_2_n_0),
        .Q(TRISETUP_readyForNewTri),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \statCyclesIdle[7]_i_2 
       (.I0(STAT_CyclesIdle[0]),
        .O(\statCyclesIdle[7]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesIdle_reg[0] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(\statCyclesIdle_reg[7]_i_1_n_15 ),
        .Q(STAT_CyclesIdle[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesIdle_reg[10] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(\statCyclesIdle_reg[15]_i_1_n_13 ),
        .Q(STAT_CyclesIdle[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesIdle_reg[11] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(\statCyclesIdle_reg[15]_i_1_n_12 ),
        .Q(STAT_CyclesIdle[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesIdle_reg[12] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(\statCyclesIdle_reg[15]_i_1_n_11 ),
        .Q(STAT_CyclesIdle[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesIdle_reg[13] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(\statCyclesIdle_reg[15]_i_1_n_10 ),
        .Q(STAT_CyclesIdle[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesIdle_reg[14] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(\statCyclesIdle_reg[15]_i_1_n_9 ),
        .Q(STAT_CyclesIdle[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesIdle_reg[15] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(\statCyclesIdle_reg[15]_i_1_n_8 ),
        .Q(STAT_CyclesIdle[15]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY8 \statCyclesIdle_reg[15]_i_1 
       (.CI(\statCyclesIdle_reg[7]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\statCyclesIdle_reg[15]_i_1_n_0 ,\statCyclesIdle_reg[15]_i_1_n_1 ,\statCyclesIdle_reg[15]_i_1_n_2 ,\statCyclesIdle_reg[15]_i_1_n_3 ,\statCyclesIdle_reg[15]_i_1_n_4 ,\statCyclesIdle_reg[15]_i_1_n_5 ,\statCyclesIdle_reg[15]_i_1_n_6 ,\statCyclesIdle_reg[15]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\statCyclesIdle_reg[15]_i_1_n_8 ,\statCyclesIdle_reg[15]_i_1_n_9 ,\statCyclesIdle_reg[15]_i_1_n_10 ,\statCyclesIdle_reg[15]_i_1_n_11 ,\statCyclesIdle_reg[15]_i_1_n_12 ,\statCyclesIdle_reg[15]_i_1_n_13 ,\statCyclesIdle_reg[15]_i_1_n_14 ,\statCyclesIdle_reg[15]_i_1_n_15 }),
        .S(STAT_CyclesIdle[15:8]));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesIdle_reg[16] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(\statCyclesIdle_reg[23]_i_1_n_15 ),
        .Q(STAT_CyclesIdle[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesIdle_reg[17] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(\statCyclesIdle_reg[23]_i_1_n_14 ),
        .Q(STAT_CyclesIdle[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesIdle_reg[18] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(\statCyclesIdle_reg[23]_i_1_n_13 ),
        .Q(STAT_CyclesIdle[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesIdle_reg[19] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(\statCyclesIdle_reg[23]_i_1_n_12 ),
        .Q(STAT_CyclesIdle[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesIdle_reg[1] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(\statCyclesIdle_reg[7]_i_1_n_14 ),
        .Q(STAT_CyclesIdle[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesIdle_reg[20] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(\statCyclesIdle_reg[23]_i_1_n_11 ),
        .Q(STAT_CyclesIdle[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesIdle_reg[21] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(\statCyclesIdle_reg[23]_i_1_n_10 ),
        .Q(STAT_CyclesIdle[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesIdle_reg[22] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(\statCyclesIdle_reg[23]_i_1_n_9 ),
        .Q(STAT_CyclesIdle[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesIdle_reg[23] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(\statCyclesIdle_reg[23]_i_1_n_8 ),
        .Q(STAT_CyclesIdle[23]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY8 \statCyclesIdle_reg[23]_i_1 
       (.CI(\statCyclesIdle_reg[15]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\statCyclesIdle_reg[23]_i_1_n_0 ,\statCyclesIdle_reg[23]_i_1_n_1 ,\statCyclesIdle_reg[23]_i_1_n_2 ,\statCyclesIdle_reg[23]_i_1_n_3 ,\statCyclesIdle_reg[23]_i_1_n_4 ,\statCyclesIdle_reg[23]_i_1_n_5 ,\statCyclesIdle_reg[23]_i_1_n_6 ,\statCyclesIdle_reg[23]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\statCyclesIdle_reg[23]_i_1_n_8 ,\statCyclesIdle_reg[23]_i_1_n_9 ,\statCyclesIdle_reg[23]_i_1_n_10 ,\statCyclesIdle_reg[23]_i_1_n_11 ,\statCyclesIdle_reg[23]_i_1_n_12 ,\statCyclesIdle_reg[23]_i_1_n_13 ,\statCyclesIdle_reg[23]_i_1_n_14 ,\statCyclesIdle_reg[23]_i_1_n_15 }),
        .S(STAT_CyclesIdle[23:16]));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesIdle_reg[24] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(\statCyclesIdle_reg[31]_i_1_n_15 ),
        .Q(STAT_CyclesIdle[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesIdle_reg[25] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(\statCyclesIdle_reg[31]_i_1_n_14 ),
        .Q(STAT_CyclesIdle[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesIdle_reg[26] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(\statCyclesIdle_reg[31]_i_1_n_13 ),
        .Q(STAT_CyclesIdle[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesIdle_reg[27] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(\statCyclesIdle_reg[31]_i_1_n_12 ),
        .Q(STAT_CyclesIdle[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesIdle_reg[28] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(\statCyclesIdle_reg[31]_i_1_n_11 ),
        .Q(STAT_CyclesIdle[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesIdle_reg[29] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(\statCyclesIdle_reg[31]_i_1_n_10 ),
        .Q(STAT_CyclesIdle[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesIdle_reg[2] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(\statCyclesIdle_reg[7]_i_1_n_13 ),
        .Q(STAT_CyclesIdle[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesIdle_reg[30] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(\statCyclesIdle_reg[31]_i_1_n_9 ),
        .Q(STAT_CyclesIdle[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesIdle_reg[31] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(\statCyclesIdle_reg[31]_i_1_n_8 ),
        .Q(STAT_CyclesIdle[31]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY8 \statCyclesIdle_reg[31]_i_1 
       (.CI(\statCyclesIdle_reg[23]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\NLW_statCyclesIdle_reg[31]_i_1_CO_UNCONNECTED [7],\statCyclesIdle_reg[31]_i_1_n_1 ,\statCyclesIdle_reg[31]_i_1_n_2 ,\statCyclesIdle_reg[31]_i_1_n_3 ,\statCyclesIdle_reg[31]_i_1_n_4 ,\statCyclesIdle_reg[31]_i_1_n_5 ,\statCyclesIdle_reg[31]_i_1_n_6 ,\statCyclesIdle_reg[31]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\statCyclesIdle_reg[31]_i_1_n_8 ,\statCyclesIdle_reg[31]_i_1_n_9 ,\statCyclesIdle_reg[31]_i_1_n_10 ,\statCyclesIdle_reg[31]_i_1_n_11 ,\statCyclesIdle_reg[31]_i_1_n_12 ,\statCyclesIdle_reg[31]_i_1_n_13 ,\statCyclesIdle_reg[31]_i_1_n_14 ,\statCyclesIdle_reg[31]_i_1_n_15 }),
        .S(STAT_CyclesIdle[31:24]));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesIdle_reg[3] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(\statCyclesIdle_reg[7]_i_1_n_12 ),
        .Q(STAT_CyclesIdle[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesIdle_reg[4] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(\statCyclesIdle_reg[7]_i_1_n_11 ),
        .Q(STAT_CyclesIdle[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesIdle_reg[5] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(\statCyclesIdle_reg[7]_i_1_n_10 ),
        .Q(STAT_CyclesIdle[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesIdle_reg[6] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(\statCyclesIdle_reg[7]_i_1_n_9 ),
        .Q(STAT_CyclesIdle[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesIdle_reg[7] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(\statCyclesIdle_reg[7]_i_1_n_8 ),
        .Q(STAT_CyclesIdle[7]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY8 \statCyclesIdle_reg[7]_i_1 
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({\statCyclesIdle_reg[7]_i_1_n_0 ,\statCyclesIdle_reg[7]_i_1_n_1 ,\statCyclesIdle_reg[7]_i_1_n_2 ,\statCyclesIdle_reg[7]_i_1_n_3 ,\statCyclesIdle_reg[7]_i_1_n_4 ,\statCyclesIdle_reg[7]_i_1_n_5 ,\statCyclesIdle_reg[7]_i_1_n_6 ,\statCyclesIdle_reg[7]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1}),
        .O({\statCyclesIdle_reg[7]_i_1_n_8 ,\statCyclesIdle_reg[7]_i_1_n_9 ,\statCyclesIdle_reg[7]_i_1_n_10 ,\statCyclesIdle_reg[7]_i_1_n_11 ,\statCyclesIdle_reg[7]_i_1_n_12 ,\statCyclesIdle_reg[7]_i_1_n_13 ,\statCyclesIdle_reg[7]_i_1_n_14 ,\statCyclesIdle_reg[7]_i_1_n_15 }),
        .S({STAT_CyclesIdle[7:1],\statCyclesIdle[7]_i_2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesIdle_reg[8] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(\statCyclesIdle_reg[15]_i_1_n_15 ),
        .Q(STAT_CyclesIdle[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesIdle_reg[9] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(\statCyclesIdle_reg[15]_i_1_n_14 ),
        .Q(STAT_CyclesIdle[9]),
        .R(1'b0));
  LUT3 #(
    .INIT(8'hBA)) 
    \statCyclesWaitingForOutput[31]_i_1 
       (.I0(currentState__0[2]),
        .I1(currentState__0[0]),
        .I2(currentState__0[1]),
        .O(statCyclesWaitingForOutput));
  LUT1 #(
    .INIT(2'h1)) 
    \statCyclesWaitingForOutput[7]_i_2 
       (.I0(STAT_CyclesWaitingForOutput[0]),
        .O(\statCyclesWaitingForOutput[7]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWaitingForOutput_reg[0] 
       (.C(clk),
        .CE(statCyclesWaitingForOutput),
        .D(\statCyclesWaitingForOutput_reg[7]_i_1_n_15 ),
        .Q(STAT_CyclesWaitingForOutput[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWaitingForOutput_reg[10] 
       (.C(clk),
        .CE(statCyclesWaitingForOutput),
        .D(\statCyclesWaitingForOutput_reg[15]_i_1_n_13 ),
        .Q(STAT_CyclesWaitingForOutput[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWaitingForOutput_reg[11] 
       (.C(clk),
        .CE(statCyclesWaitingForOutput),
        .D(\statCyclesWaitingForOutput_reg[15]_i_1_n_12 ),
        .Q(STAT_CyclesWaitingForOutput[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWaitingForOutput_reg[12] 
       (.C(clk),
        .CE(statCyclesWaitingForOutput),
        .D(\statCyclesWaitingForOutput_reg[15]_i_1_n_11 ),
        .Q(STAT_CyclesWaitingForOutput[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWaitingForOutput_reg[13] 
       (.C(clk),
        .CE(statCyclesWaitingForOutput),
        .D(\statCyclesWaitingForOutput_reg[15]_i_1_n_10 ),
        .Q(STAT_CyclesWaitingForOutput[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWaitingForOutput_reg[14] 
       (.C(clk),
        .CE(statCyclesWaitingForOutput),
        .D(\statCyclesWaitingForOutput_reg[15]_i_1_n_9 ),
        .Q(STAT_CyclesWaitingForOutput[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWaitingForOutput_reg[15] 
       (.C(clk),
        .CE(statCyclesWaitingForOutput),
        .D(\statCyclesWaitingForOutput_reg[15]_i_1_n_8 ),
        .Q(STAT_CyclesWaitingForOutput[15]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY8 \statCyclesWaitingForOutput_reg[15]_i_1 
       (.CI(\statCyclesWaitingForOutput_reg[7]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\statCyclesWaitingForOutput_reg[15]_i_1_n_0 ,\statCyclesWaitingForOutput_reg[15]_i_1_n_1 ,\statCyclesWaitingForOutput_reg[15]_i_1_n_2 ,\statCyclesWaitingForOutput_reg[15]_i_1_n_3 ,\statCyclesWaitingForOutput_reg[15]_i_1_n_4 ,\statCyclesWaitingForOutput_reg[15]_i_1_n_5 ,\statCyclesWaitingForOutput_reg[15]_i_1_n_6 ,\statCyclesWaitingForOutput_reg[15]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\statCyclesWaitingForOutput_reg[15]_i_1_n_8 ,\statCyclesWaitingForOutput_reg[15]_i_1_n_9 ,\statCyclesWaitingForOutput_reg[15]_i_1_n_10 ,\statCyclesWaitingForOutput_reg[15]_i_1_n_11 ,\statCyclesWaitingForOutput_reg[15]_i_1_n_12 ,\statCyclesWaitingForOutput_reg[15]_i_1_n_13 ,\statCyclesWaitingForOutput_reg[15]_i_1_n_14 ,\statCyclesWaitingForOutput_reg[15]_i_1_n_15 }),
        .S(STAT_CyclesWaitingForOutput[15:8]));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWaitingForOutput_reg[16] 
       (.C(clk),
        .CE(statCyclesWaitingForOutput),
        .D(\statCyclesWaitingForOutput_reg[23]_i_1_n_15 ),
        .Q(STAT_CyclesWaitingForOutput[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWaitingForOutput_reg[17] 
       (.C(clk),
        .CE(statCyclesWaitingForOutput),
        .D(\statCyclesWaitingForOutput_reg[23]_i_1_n_14 ),
        .Q(STAT_CyclesWaitingForOutput[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWaitingForOutput_reg[18] 
       (.C(clk),
        .CE(statCyclesWaitingForOutput),
        .D(\statCyclesWaitingForOutput_reg[23]_i_1_n_13 ),
        .Q(STAT_CyclesWaitingForOutput[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWaitingForOutput_reg[19] 
       (.C(clk),
        .CE(statCyclesWaitingForOutput),
        .D(\statCyclesWaitingForOutput_reg[23]_i_1_n_12 ),
        .Q(STAT_CyclesWaitingForOutput[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWaitingForOutput_reg[1] 
       (.C(clk),
        .CE(statCyclesWaitingForOutput),
        .D(\statCyclesWaitingForOutput_reg[7]_i_1_n_14 ),
        .Q(STAT_CyclesWaitingForOutput[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWaitingForOutput_reg[20] 
       (.C(clk),
        .CE(statCyclesWaitingForOutput),
        .D(\statCyclesWaitingForOutput_reg[23]_i_1_n_11 ),
        .Q(STAT_CyclesWaitingForOutput[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWaitingForOutput_reg[21] 
       (.C(clk),
        .CE(statCyclesWaitingForOutput),
        .D(\statCyclesWaitingForOutput_reg[23]_i_1_n_10 ),
        .Q(STAT_CyclesWaitingForOutput[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWaitingForOutput_reg[22] 
       (.C(clk),
        .CE(statCyclesWaitingForOutput),
        .D(\statCyclesWaitingForOutput_reg[23]_i_1_n_9 ),
        .Q(STAT_CyclesWaitingForOutput[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWaitingForOutput_reg[23] 
       (.C(clk),
        .CE(statCyclesWaitingForOutput),
        .D(\statCyclesWaitingForOutput_reg[23]_i_1_n_8 ),
        .Q(STAT_CyclesWaitingForOutput[23]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY8 \statCyclesWaitingForOutput_reg[23]_i_1 
       (.CI(\statCyclesWaitingForOutput_reg[15]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\statCyclesWaitingForOutput_reg[23]_i_1_n_0 ,\statCyclesWaitingForOutput_reg[23]_i_1_n_1 ,\statCyclesWaitingForOutput_reg[23]_i_1_n_2 ,\statCyclesWaitingForOutput_reg[23]_i_1_n_3 ,\statCyclesWaitingForOutput_reg[23]_i_1_n_4 ,\statCyclesWaitingForOutput_reg[23]_i_1_n_5 ,\statCyclesWaitingForOutput_reg[23]_i_1_n_6 ,\statCyclesWaitingForOutput_reg[23]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\statCyclesWaitingForOutput_reg[23]_i_1_n_8 ,\statCyclesWaitingForOutput_reg[23]_i_1_n_9 ,\statCyclesWaitingForOutput_reg[23]_i_1_n_10 ,\statCyclesWaitingForOutput_reg[23]_i_1_n_11 ,\statCyclesWaitingForOutput_reg[23]_i_1_n_12 ,\statCyclesWaitingForOutput_reg[23]_i_1_n_13 ,\statCyclesWaitingForOutput_reg[23]_i_1_n_14 ,\statCyclesWaitingForOutput_reg[23]_i_1_n_15 }),
        .S(STAT_CyclesWaitingForOutput[23:16]));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWaitingForOutput_reg[24] 
       (.C(clk),
        .CE(statCyclesWaitingForOutput),
        .D(\statCyclesWaitingForOutput_reg[31]_i_2_n_15 ),
        .Q(STAT_CyclesWaitingForOutput[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWaitingForOutput_reg[25] 
       (.C(clk),
        .CE(statCyclesWaitingForOutput),
        .D(\statCyclesWaitingForOutput_reg[31]_i_2_n_14 ),
        .Q(STAT_CyclesWaitingForOutput[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWaitingForOutput_reg[26] 
       (.C(clk),
        .CE(statCyclesWaitingForOutput),
        .D(\statCyclesWaitingForOutput_reg[31]_i_2_n_13 ),
        .Q(STAT_CyclesWaitingForOutput[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWaitingForOutput_reg[27] 
       (.C(clk),
        .CE(statCyclesWaitingForOutput),
        .D(\statCyclesWaitingForOutput_reg[31]_i_2_n_12 ),
        .Q(STAT_CyclesWaitingForOutput[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWaitingForOutput_reg[28] 
       (.C(clk),
        .CE(statCyclesWaitingForOutput),
        .D(\statCyclesWaitingForOutput_reg[31]_i_2_n_11 ),
        .Q(STAT_CyclesWaitingForOutput[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWaitingForOutput_reg[29] 
       (.C(clk),
        .CE(statCyclesWaitingForOutput),
        .D(\statCyclesWaitingForOutput_reg[31]_i_2_n_10 ),
        .Q(STAT_CyclesWaitingForOutput[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWaitingForOutput_reg[2] 
       (.C(clk),
        .CE(statCyclesWaitingForOutput),
        .D(\statCyclesWaitingForOutput_reg[7]_i_1_n_13 ),
        .Q(STAT_CyclesWaitingForOutput[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWaitingForOutput_reg[30] 
       (.C(clk),
        .CE(statCyclesWaitingForOutput),
        .D(\statCyclesWaitingForOutput_reg[31]_i_2_n_9 ),
        .Q(STAT_CyclesWaitingForOutput[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWaitingForOutput_reg[31] 
       (.C(clk),
        .CE(statCyclesWaitingForOutput),
        .D(\statCyclesWaitingForOutput_reg[31]_i_2_n_8 ),
        .Q(STAT_CyclesWaitingForOutput[31]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY8 \statCyclesWaitingForOutput_reg[31]_i_2 
       (.CI(\statCyclesWaitingForOutput_reg[23]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\NLW_statCyclesWaitingForOutput_reg[31]_i_2_CO_UNCONNECTED [7],\statCyclesWaitingForOutput_reg[31]_i_2_n_1 ,\statCyclesWaitingForOutput_reg[31]_i_2_n_2 ,\statCyclesWaitingForOutput_reg[31]_i_2_n_3 ,\statCyclesWaitingForOutput_reg[31]_i_2_n_4 ,\statCyclesWaitingForOutput_reg[31]_i_2_n_5 ,\statCyclesWaitingForOutput_reg[31]_i_2_n_6 ,\statCyclesWaitingForOutput_reg[31]_i_2_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\statCyclesWaitingForOutput_reg[31]_i_2_n_8 ,\statCyclesWaitingForOutput_reg[31]_i_2_n_9 ,\statCyclesWaitingForOutput_reg[31]_i_2_n_10 ,\statCyclesWaitingForOutput_reg[31]_i_2_n_11 ,\statCyclesWaitingForOutput_reg[31]_i_2_n_12 ,\statCyclesWaitingForOutput_reg[31]_i_2_n_13 ,\statCyclesWaitingForOutput_reg[31]_i_2_n_14 ,\statCyclesWaitingForOutput_reg[31]_i_2_n_15 }),
        .S(STAT_CyclesWaitingForOutput[31:24]));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWaitingForOutput_reg[3] 
       (.C(clk),
        .CE(statCyclesWaitingForOutput),
        .D(\statCyclesWaitingForOutput_reg[7]_i_1_n_12 ),
        .Q(STAT_CyclesWaitingForOutput[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWaitingForOutput_reg[4] 
       (.C(clk),
        .CE(statCyclesWaitingForOutput),
        .D(\statCyclesWaitingForOutput_reg[7]_i_1_n_11 ),
        .Q(STAT_CyclesWaitingForOutput[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWaitingForOutput_reg[5] 
       (.C(clk),
        .CE(statCyclesWaitingForOutput),
        .D(\statCyclesWaitingForOutput_reg[7]_i_1_n_10 ),
        .Q(STAT_CyclesWaitingForOutput[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWaitingForOutput_reg[6] 
       (.C(clk),
        .CE(statCyclesWaitingForOutput),
        .D(\statCyclesWaitingForOutput_reg[7]_i_1_n_9 ),
        .Q(STAT_CyclesWaitingForOutput[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWaitingForOutput_reg[7] 
       (.C(clk),
        .CE(statCyclesWaitingForOutput),
        .D(\statCyclesWaitingForOutput_reg[7]_i_1_n_8 ),
        .Q(STAT_CyclesWaitingForOutput[7]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY8 \statCyclesWaitingForOutput_reg[7]_i_1 
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({\statCyclesWaitingForOutput_reg[7]_i_1_n_0 ,\statCyclesWaitingForOutput_reg[7]_i_1_n_1 ,\statCyclesWaitingForOutput_reg[7]_i_1_n_2 ,\statCyclesWaitingForOutput_reg[7]_i_1_n_3 ,\statCyclesWaitingForOutput_reg[7]_i_1_n_4 ,\statCyclesWaitingForOutput_reg[7]_i_1_n_5 ,\statCyclesWaitingForOutput_reg[7]_i_1_n_6 ,\statCyclesWaitingForOutput_reg[7]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1}),
        .O({\statCyclesWaitingForOutput_reg[7]_i_1_n_8 ,\statCyclesWaitingForOutput_reg[7]_i_1_n_9 ,\statCyclesWaitingForOutput_reg[7]_i_1_n_10 ,\statCyclesWaitingForOutput_reg[7]_i_1_n_11 ,\statCyclesWaitingForOutput_reg[7]_i_1_n_12 ,\statCyclesWaitingForOutput_reg[7]_i_1_n_13 ,\statCyclesWaitingForOutput_reg[7]_i_1_n_14 ,\statCyclesWaitingForOutput_reg[7]_i_1_n_15 }),
        .S({STAT_CyclesWaitingForOutput[7:1],\statCyclesWaitingForOutput[7]_i_2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWaitingForOutput_reg[8] 
       (.C(clk),
        .CE(statCyclesWaitingForOutput),
        .D(\statCyclesWaitingForOutput_reg[15]_i_1_n_15 ),
        .Q(STAT_CyclesWaitingForOutput[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWaitingForOutput_reg[9] 
       (.C(clk),
        .CE(statCyclesWaitingForOutput),
        .D(\statCyclesWaitingForOutput_reg[15]_i_1_n_14 ),
        .Q(STAT_CyclesWaitingForOutput[9]),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h08)) 
    \statCyclesWaitingForTriWorkCache[31]_i_1 
       (.I0(currentState__0[1]),
        .I1(currentState__0[0]),
        .I2(currentState__0[2]),
        .O(\statCyclesWaitingForTriWorkCache[31]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \statCyclesWaitingForTriWorkCache[7]_i_2 
       (.I0(STAT_CyclesWaitingForTriWorkCache[0]),
        .O(\statCyclesWaitingForTriWorkCache[7]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWaitingForTriWorkCache_reg[0] 
       (.C(clk),
        .CE(\statCyclesWaitingForTriWorkCache[31]_i_1_n_0 ),
        .D(\statCyclesWaitingForTriWorkCache_reg[7]_i_1_n_15 ),
        .Q(STAT_CyclesWaitingForTriWorkCache[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWaitingForTriWorkCache_reg[10] 
       (.C(clk),
        .CE(\statCyclesWaitingForTriWorkCache[31]_i_1_n_0 ),
        .D(\statCyclesWaitingForTriWorkCache_reg[15]_i_1_n_13 ),
        .Q(STAT_CyclesWaitingForTriWorkCache[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWaitingForTriWorkCache_reg[11] 
       (.C(clk),
        .CE(\statCyclesWaitingForTriWorkCache[31]_i_1_n_0 ),
        .D(\statCyclesWaitingForTriWorkCache_reg[15]_i_1_n_12 ),
        .Q(STAT_CyclesWaitingForTriWorkCache[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWaitingForTriWorkCache_reg[12] 
       (.C(clk),
        .CE(\statCyclesWaitingForTriWorkCache[31]_i_1_n_0 ),
        .D(\statCyclesWaitingForTriWorkCache_reg[15]_i_1_n_11 ),
        .Q(STAT_CyclesWaitingForTriWorkCache[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWaitingForTriWorkCache_reg[13] 
       (.C(clk),
        .CE(\statCyclesWaitingForTriWorkCache[31]_i_1_n_0 ),
        .D(\statCyclesWaitingForTriWorkCache_reg[15]_i_1_n_10 ),
        .Q(STAT_CyclesWaitingForTriWorkCache[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWaitingForTriWorkCache_reg[14] 
       (.C(clk),
        .CE(\statCyclesWaitingForTriWorkCache[31]_i_1_n_0 ),
        .D(\statCyclesWaitingForTriWorkCache_reg[15]_i_1_n_9 ),
        .Q(STAT_CyclesWaitingForTriWorkCache[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWaitingForTriWorkCache_reg[15] 
       (.C(clk),
        .CE(\statCyclesWaitingForTriWorkCache[31]_i_1_n_0 ),
        .D(\statCyclesWaitingForTriWorkCache_reg[15]_i_1_n_8 ),
        .Q(STAT_CyclesWaitingForTriWorkCache[15]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \statCyclesWaitingForTriWorkCache_reg[15]_i_1 
       (.CI(\statCyclesWaitingForTriWorkCache_reg[7]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\statCyclesWaitingForTriWorkCache_reg[15]_i_1_n_0 ,\statCyclesWaitingForTriWorkCache_reg[15]_i_1_n_1 ,\statCyclesWaitingForTriWorkCache_reg[15]_i_1_n_2 ,\statCyclesWaitingForTriWorkCache_reg[15]_i_1_n_3 ,\statCyclesWaitingForTriWorkCache_reg[15]_i_1_n_4 ,\statCyclesWaitingForTriWorkCache_reg[15]_i_1_n_5 ,\statCyclesWaitingForTriWorkCache_reg[15]_i_1_n_6 ,\statCyclesWaitingForTriWorkCache_reg[15]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\statCyclesWaitingForTriWorkCache_reg[15]_i_1_n_8 ,\statCyclesWaitingForTriWorkCache_reg[15]_i_1_n_9 ,\statCyclesWaitingForTriWorkCache_reg[15]_i_1_n_10 ,\statCyclesWaitingForTriWorkCache_reg[15]_i_1_n_11 ,\statCyclesWaitingForTriWorkCache_reg[15]_i_1_n_12 ,\statCyclesWaitingForTriWorkCache_reg[15]_i_1_n_13 ,\statCyclesWaitingForTriWorkCache_reg[15]_i_1_n_14 ,\statCyclesWaitingForTriWorkCache_reg[15]_i_1_n_15 }),
        .S(STAT_CyclesWaitingForTriWorkCache[15:8]));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWaitingForTriWorkCache_reg[16] 
       (.C(clk),
        .CE(\statCyclesWaitingForTriWorkCache[31]_i_1_n_0 ),
        .D(\statCyclesWaitingForTriWorkCache_reg[23]_i_1_n_15 ),
        .Q(STAT_CyclesWaitingForTriWorkCache[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWaitingForTriWorkCache_reg[17] 
       (.C(clk),
        .CE(\statCyclesWaitingForTriWorkCache[31]_i_1_n_0 ),
        .D(\statCyclesWaitingForTriWorkCache_reg[23]_i_1_n_14 ),
        .Q(STAT_CyclesWaitingForTriWorkCache[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWaitingForTriWorkCache_reg[18] 
       (.C(clk),
        .CE(\statCyclesWaitingForTriWorkCache[31]_i_1_n_0 ),
        .D(\statCyclesWaitingForTriWorkCache_reg[23]_i_1_n_13 ),
        .Q(STAT_CyclesWaitingForTriWorkCache[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWaitingForTriWorkCache_reg[19] 
       (.C(clk),
        .CE(\statCyclesWaitingForTriWorkCache[31]_i_1_n_0 ),
        .D(\statCyclesWaitingForTriWorkCache_reg[23]_i_1_n_12 ),
        .Q(STAT_CyclesWaitingForTriWorkCache[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWaitingForTriWorkCache_reg[1] 
       (.C(clk),
        .CE(\statCyclesWaitingForTriWorkCache[31]_i_1_n_0 ),
        .D(\statCyclesWaitingForTriWorkCache_reg[7]_i_1_n_14 ),
        .Q(STAT_CyclesWaitingForTriWorkCache[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWaitingForTriWorkCache_reg[20] 
       (.C(clk),
        .CE(\statCyclesWaitingForTriWorkCache[31]_i_1_n_0 ),
        .D(\statCyclesWaitingForTriWorkCache_reg[23]_i_1_n_11 ),
        .Q(STAT_CyclesWaitingForTriWorkCache[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWaitingForTriWorkCache_reg[21] 
       (.C(clk),
        .CE(\statCyclesWaitingForTriWorkCache[31]_i_1_n_0 ),
        .D(\statCyclesWaitingForTriWorkCache_reg[23]_i_1_n_10 ),
        .Q(STAT_CyclesWaitingForTriWorkCache[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWaitingForTriWorkCache_reg[22] 
       (.C(clk),
        .CE(\statCyclesWaitingForTriWorkCache[31]_i_1_n_0 ),
        .D(\statCyclesWaitingForTriWorkCache_reg[23]_i_1_n_9 ),
        .Q(STAT_CyclesWaitingForTriWorkCache[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWaitingForTriWorkCache_reg[23] 
       (.C(clk),
        .CE(\statCyclesWaitingForTriWorkCache[31]_i_1_n_0 ),
        .D(\statCyclesWaitingForTriWorkCache_reg[23]_i_1_n_8 ),
        .Q(STAT_CyclesWaitingForTriWorkCache[23]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \statCyclesWaitingForTriWorkCache_reg[23]_i_1 
       (.CI(\statCyclesWaitingForTriWorkCache_reg[15]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\statCyclesWaitingForTriWorkCache_reg[23]_i_1_n_0 ,\statCyclesWaitingForTriWorkCache_reg[23]_i_1_n_1 ,\statCyclesWaitingForTriWorkCache_reg[23]_i_1_n_2 ,\statCyclesWaitingForTriWorkCache_reg[23]_i_1_n_3 ,\statCyclesWaitingForTriWorkCache_reg[23]_i_1_n_4 ,\statCyclesWaitingForTriWorkCache_reg[23]_i_1_n_5 ,\statCyclesWaitingForTriWorkCache_reg[23]_i_1_n_6 ,\statCyclesWaitingForTriWorkCache_reg[23]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\statCyclesWaitingForTriWorkCache_reg[23]_i_1_n_8 ,\statCyclesWaitingForTriWorkCache_reg[23]_i_1_n_9 ,\statCyclesWaitingForTriWorkCache_reg[23]_i_1_n_10 ,\statCyclesWaitingForTriWorkCache_reg[23]_i_1_n_11 ,\statCyclesWaitingForTriWorkCache_reg[23]_i_1_n_12 ,\statCyclesWaitingForTriWorkCache_reg[23]_i_1_n_13 ,\statCyclesWaitingForTriWorkCache_reg[23]_i_1_n_14 ,\statCyclesWaitingForTriWorkCache_reg[23]_i_1_n_15 }),
        .S(STAT_CyclesWaitingForTriWorkCache[23:16]));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWaitingForTriWorkCache_reg[24] 
       (.C(clk),
        .CE(\statCyclesWaitingForTriWorkCache[31]_i_1_n_0 ),
        .D(\statCyclesWaitingForTriWorkCache_reg[31]_i_2_n_15 ),
        .Q(STAT_CyclesWaitingForTriWorkCache[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWaitingForTriWorkCache_reg[25] 
       (.C(clk),
        .CE(\statCyclesWaitingForTriWorkCache[31]_i_1_n_0 ),
        .D(\statCyclesWaitingForTriWorkCache_reg[31]_i_2_n_14 ),
        .Q(STAT_CyclesWaitingForTriWorkCache[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWaitingForTriWorkCache_reg[26] 
       (.C(clk),
        .CE(\statCyclesWaitingForTriWorkCache[31]_i_1_n_0 ),
        .D(\statCyclesWaitingForTriWorkCache_reg[31]_i_2_n_13 ),
        .Q(STAT_CyclesWaitingForTriWorkCache[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWaitingForTriWorkCache_reg[27] 
       (.C(clk),
        .CE(\statCyclesWaitingForTriWorkCache[31]_i_1_n_0 ),
        .D(\statCyclesWaitingForTriWorkCache_reg[31]_i_2_n_12 ),
        .Q(STAT_CyclesWaitingForTriWorkCache[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWaitingForTriWorkCache_reg[28] 
       (.C(clk),
        .CE(\statCyclesWaitingForTriWorkCache[31]_i_1_n_0 ),
        .D(\statCyclesWaitingForTriWorkCache_reg[31]_i_2_n_11 ),
        .Q(STAT_CyclesWaitingForTriWorkCache[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWaitingForTriWorkCache_reg[29] 
       (.C(clk),
        .CE(\statCyclesWaitingForTriWorkCache[31]_i_1_n_0 ),
        .D(\statCyclesWaitingForTriWorkCache_reg[31]_i_2_n_10 ),
        .Q(STAT_CyclesWaitingForTriWorkCache[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWaitingForTriWorkCache_reg[2] 
       (.C(clk),
        .CE(\statCyclesWaitingForTriWorkCache[31]_i_1_n_0 ),
        .D(\statCyclesWaitingForTriWorkCache_reg[7]_i_1_n_13 ),
        .Q(STAT_CyclesWaitingForTriWorkCache[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWaitingForTriWorkCache_reg[30] 
       (.C(clk),
        .CE(\statCyclesWaitingForTriWorkCache[31]_i_1_n_0 ),
        .D(\statCyclesWaitingForTriWorkCache_reg[31]_i_2_n_9 ),
        .Q(STAT_CyclesWaitingForTriWorkCache[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWaitingForTriWorkCache_reg[31] 
       (.C(clk),
        .CE(\statCyclesWaitingForTriWorkCache[31]_i_1_n_0 ),
        .D(\statCyclesWaitingForTriWorkCache_reg[31]_i_2_n_8 ),
        .Q(STAT_CyclesWaitingForTriWorkCache[31]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \statCyclesWaitingForTriWorkCache_reg[31]_i_2 
       (.CI(\statCyclesWaitingForTriWorkCache_reg[23]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\NLW_statCyclesWaitingForTriWorkCache_reg[31]_i_2_CO_UNCONNECTED [7],\statCyclesWaitingForTriWorkCache_reg[31]_i_2_n_1 ,\statCyclesWaitingForTriWorkCache_reg[31]_i_2_n_2 ,\statCyclesWaitingForTriWorkCache_reg[31]_i_2_n_3 ,\statCyclesWaitingForTriWorkCache_reg[31]_i_2_n_4 ,\statCyclesWaitingForTriWorkCache_reg[31]_i_2_n_5 ,\statCyclesWaitingForTriWorkCache_reg[31]_i_2_n_6 ,\statCyclesWaitingForTriWorkCache_reg[31]_i_2_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\statCyclesWaitingForTriWorkCache_reg[31]_i_2_n_8 ,\statCyclesWaitingForTriWorkCache_reg[31]_i_2_n_9 ,\statCyclesWaitingForTriWorkCache_reg[31]_i_2_n_10 ,\statCyclesWaitingForTriWorkCache_reg[31]_i_2_n_11 ,\statCyclesWaitingForTriWorkCache_reg[31]_i_2_n_12 ,\statCyclesWaitingForTriWorkCache_reg[31]_i_2_n_13 ,\statCyclesWaitingForTriWorkCache_reg[31]_i_2_n_14 ,\statCyclesWaitingForTriWorkCache_reg[31]_i_2_n_15 }),
        .S(STAT_CyclesWaitingForTriWorkCache[31:24]));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWaitingForTriWorkCache_reg[3] 
       (.C(clk),
        .CE(\statCyclesWaitingForTriWorkCache[31]_i_1_n_0 ),
        .D(\statCyclesWaitingForTriWorkCache_reg[7]_i_1_n_12 ),
        .Q(STAT_CyclesWaitingForTriWorkCache[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWaitingForTriWorkCache_reg[4] 
       (.C(clk),
        .CE(\statCyclesWaitingForTriWorkCache[31]_i_1_n_0 ),
        .D(\statCyclesWaitingForTriWorkCache_reg[7]_i_1_n_11 ),
        .Q(STAT_CyclesWaitingForTriWorkCache[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWaitingForTriWorkCache_reg[5] 
       (.C(clk),
        .CE(\statCyclesWaitingForTriWorkCache[31]_i_1_n_0 ),
        .D(\statCyclesWaitingForTriWorkCache_reg[7]_i_1_n_10 ),
        .Q(STAT_CyclesWaitingForTriWorkCache[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWaitingForTriWorkCache_reg[6] 
       (.C(clk),
        .CE(\statCyclesWaitingForTriWorkCache[31]_i_1_n_0 ),
        .D(\statCyclesWaitingForTriWorkCache_reg[7]_i_1_n_9 ),
        .Q(STAT_CyclesWaitingForTriWorkCache[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWaitingForTriWorkCache_reg[7] 
       (.C(clk),
        .CE(\statCyclesWaitingForTriWorkCache[31]_i_1_n_0 ),
        .D(\statCyclesWaitingForTriWorkCache_reg[7]_i_1_n_8 ),
        .Q(STAT_CyclesWaitingForTriWorkCache[7]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \statCyclesWaitingForTriWorkCache_reg[7]_i_1 
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({\statCyclesWaitingForTriWorkCache_reg[7]_i_1_n_0 ,\statCyclesWaitingForTriWorkCache_reg[7]_i_1_n_1 ,\statCyclesWaitingForTriWorkCache_reg[7]_i_1_n_2 ,\statCyclesWaitingForTriWorkCache_reg[7]_i_1_n_3 ,\statCyclesWaitingForTriWorkCache_reg[7]_i_1_n_4 ,\statCyclesWaitingForTriWorkCache_reg[7]_i_1_n_5 ,\statCyclesWaitingForTriWorkCache_reg[7]_i_1_n_6 ,\statCyclesWaitingForTriWorkCache_reg[7]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1}),
        .O({\statCyclesWaitingForTriWorkCache_reg[7]_i_1_n_8 ,\statCyclesWaitingForTriWorkCache_reg[7]_i_1_n_9 ,\statCyclesWaitingForTriWorkCache_reg[7]_i_1_n_10 ,\statCyclesWaitingForTriWorkCache_reg[7]_i_1_n_11 ,\statCyclesWaitingForTriWorkCache_reg[7]_i_1_n_12 ,\statCyclesWaitingForTriWorkCache_reg[7]_i_1_n_13 ,\statCyclesWaitingForTriWorkCache_reg[7]_i_1_n_14 ,\statCyclesWaitingForTriWorkCache_reg[7]_i_1_n_15 }),
        .S({STAT_CyclesWaitingForTriWorkCache[7:1],\statCyclesWaitingForTriWorkCache[7]_i_2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWaitingForTriWorkCache_reg[8] 
       (.C(clk),
        .CE(\statCyclesWaitingForTriWorkCache[31]_i_1_n_0 ),
        .D(\statCyclesWaitingForTriWorkCache_reg[15]_i_1_n_15 ),
        .Q(STAT_CyclesWaitingForTriWorkCache[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWaitingForTriWorkCache_reg[9] 
       (.C(clk),
        .CE(\statCyclesWaitingForTriWorkCache[31]_i_1_n_0 ),
        .D(\statCyclesWaitingForTriWorkCache_reg[15]_i_1_n_14 ),
        .Q(STAT_CyclesWaitingForTriWorkCache[9]),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h02)) 
    \statCyclesWorking[31]_i_1 
       (.I0(currentState__0[0]),
        .I1(currentState__0[2]),
        .I2(currentState__0[1]),
        .O(statCyclesWorking));
  LUT1 #(
    .INIT(2'h1)) 
    \statCyclesWorking[7]_i_2 
       (.I0(STAT_CyclesSpentWorking[0]),
        .O(\statCyclesWorking[7]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWorking_reg[0] 
       (.C(clk),
        .CE(statCyclesWorking),
        .D(\statCyclesWorking_reg[7]_i_1_n_15 ),
        .Q(STAT_CyclesSpentWorking[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWorking_reg[10] 
       (.C(clk),
        .CE(statCyclesWorking),
        .D(\statCyclesWorking_reg[15]_i_1_n_13 ),
        .Q(STAT_CyclesSpentWorking[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWorking_reg[11] 
       (.C(clk),
        .CE(statCyclesWorking),
        .D(\statCyclesWorking_reg[15]_i_1_n_12 ),
        .Q(STAT_CyclesSpentWorking[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWorking_reg[12] 
       (.C(clk),
        .CE(statCyclesWorking),
        .D(\statCyclesWorking_reg[15]_i_1_n_11 ),
        .Q(STAT_CyclesSpentWorking[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWorking_reg[13] 
       (.C(clk),
        .CE(statCyclesWorking),
        .D(\statCyclesWorking_reg[15]_i_1_n_10 ),
        .Q(STAT_CyclesSpentWorking[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWorking_reg[14] 
       (.C(clk),
        .CE(statCyclesWorking),
        .D(\statCyclesWorking_reg[15]_i_1_n_9 ),
        .Q(STAT_CyclesSpentWorking[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWorking_reg[15] 
       (.C(clk),
        .CE(statCyclesWorking),
        .D(\statCyclesWorking_reg[15]_i_1_n_8 ),
        .Q(STAT_CyclesSpentWorking[15]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \statCyclesWorking_reg[15]_i_1 
       (.CI(\statCyclesWorking_reg[7]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\statCyclesWorking_reg[15]_i_1_n_0 ,\statCyclesWorking_reg[15]_i_1_n_1 ,\statCyclesWorking_reg[15]_i_1_n_2 ,\statCyclesWorking_reg[15]_i_1_n_3 ,\statCyclesWorking_reg[15]_i_1_n_4 ,\statCyclesWorking_reg[15]_i_1_n_5 ,\statCyclesWorking_reg[15]_i_1_n_6 ,\statCyclesWorking_reg[15]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\statCyclesWorking_reg[15]_i_1_n_8 ,\statCyclesWorking_reg[15]_i_1_n_9 ,\statCyclesWorking_reg[15]_i_1_n_10 ,\statCyclesWorking_reg[15]_i_1_n_11 ,\statCyclesWorking_reg[15]_i_1_n_12 ,\statCyclesWorking_reg[15]_i_1_n_13 ,\statCyclesWorking_reg[15]_i_1_n_14 ,\statCyclesWorking_reg[15]_i_1_n_15 }),
        .S(STAT_CyclesSpentWorking[15:8]));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWorking_reg[16] 
       (.C(clk),
        .CE(statCyclesWorking),
        .D(\statCyclesWorking_reg[23]_i_1_n_15 ),
        .Q(STAT_CyclesSpentWorking[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWorking_reg[17] 
       (.C(clk),
        .CE(statCyclesWorking),
        .D(\statCyclesWorking_reg[23]_i_1_n_14 ),
        .Q(STAT_CyclesSpentWorking[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWorking_reg[18] 
       (.C(clk),
        .CE(statCyclesWorking),
        .D(\statCyclesWorking_reg[23]_i_1_n_13 ),
        .Q(STAT_CyclesSpentWorking[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWorking_reg[19] 
       (.C(clk),
        .CE(statCyclesWorking),
        .D(\statCyclesWorking_reg[23]_i_1_n_12 ),
        .Q(STAT_CyclesSpentWorking[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWorking_reg[1] 
       (.C(clk),
        .CE(statCyclesWorking),
        .D(\statCyclesWorking_reg[7]_i_1_n_14 ),
        .Q(STAT_CyclesSpentWorking[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWorking_reg[20] 
       (.C(clk),
        .CE(statCyclesWorking),
        .D(\statCyclesWorking_reg[23]_i_1_n_11 ),
        .Q(STAT_CyclesSpentWorking[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWorking_reg[21] 
       (.C(clk),
        .CE(statCyclesWorking),
        .D(\statCyclesWorking_reg[23]_i_1_n_10 ),
        .Q(STAT_CyclesSpentWorking[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWorking_reg[22] 
       (.C(clk),
        .CE(statCyclesWorking),
        .D(\statCyclesWorking_reg[23]_i_1_n_9 ),
        .Q(STAT_CyclesSpentWorking[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWorking_reg[23] 
       (.C(clk),
        .CE(statCyclesWorking),
        .D(\statCyclesWorking_reg[23]_i_1_n_8 ),
        .Q(STAT_CyclesSpentWorking[23]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \statCyclesWorking_reg[23]_i_1 
       (.CI(\statCyclesWorking_reg[15]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\statCyclesWorking_reg[23]_i_1_n_0 ,\statCyclesWorking_reg[23]_i_1_n_1 ,\statCyclesWorking_reg[23]_i_1_n_2 ,\statCyclesWorking_reg[23]_i_1_n_3 ,\statCyclesWorking_reg[23]_i_1_n_4 ,\statCyclesWorking_reg[23]_i_1_n_5 ,\statCyclesWorking_reg[23]_i_1_n_6 ,\statCyclesWorking_reg[23]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\statCyclesWorking_reg[23]_i_1_n_8 ,\statCyclesWorking_reg[23]_i_1_n_9 ,\statCyclesWorking_reg[23]_i_1_n_10 ,\statCyclesWorking_reg[23]_i_1_n_11 ,\statCyclesWorking_reg[23]_i_1_n_12 ,\statCyclesWorking_reg[23]_i_1_n_13 ,\statCyclesWorking_reg[23]_i_1_n_14 ,\statCyclesWorking_reg[23]_i_1_n_15 }),
        .S(STAT_CyclesSpentWorking[23:16]));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWorking_reg[24] 
       (.C(clk),
        .CE(statCyclesWorking),
        .D(\statCyclesWorking_reg[31]_i_2_n_15 ),
        .Q(STAT_CyclesSpentWorking[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWorking_reg[25] 
       (.C(clk),
        .CE(statCyclesWorking),
        .D(\statCyclesWorking_reg[31]_i_2_n_14 ),
        .Q(STAT_CyclesSpentWorking[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWorking_reg[26] 
       (.C(clk),
        .CE(statCyclesWorking),
        .D(\statCyclesWorking_reg[31]_i_2_n_13 ),
        .Q(STAT_CyclesSpentWorking[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWorking_reg[27] 
       (.C(clk),
        .CE(statCyclesWorking),
        .D(\statCyclesWorking_reg[31]_i_2_n_12 ),
        .Q(STAT_CyclesSpentWorking[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWorking_reg[28] 
       (.C(clk),
        .CE(statCyclesWorking),
        .D(\statCyclesWorking_reg[31]_i_2_n_11 ),
        .Q(STAT_CyclesSpentWorking[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWorking_reg[29] 
       (.C(clk),
        .CE(statCyclesWorking),
        .D(\statCyclesWorking_reg[31]_i_2_n_10 ),
        .Q(STAT_CyclesSpentWorking[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWorking_reg[2] 
       (.C(clk),
        .CE(statCyclesWorking),
        .D(\statCyclesWorking_reg[7]_i_1_n_13 ),
        .Q(STAT_CyclesSpentWorking[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWorking_reg[30] 
       (.C(clk),
        .CE(statCyclesWorking),
        .D(\statCyclesWorking_reg[31]_i_2_n_9 ),
        .Q(STAT_CyclesSpentWorking[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWorking_reg[31] 
       (.C(clk),
        .CE(statCyclesWorking),
        .D(\statCyclesWorking_reg[31]_i_2_n_8 ),
        .Q(STAT_CyclesSpentWorking[31]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \statCyclesWorking_reg[31]_i_2 
       (.CI(\statCyclesWorking_reg[23]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\NLW_statCyclesWorking_reg[31]_i_2_CO_UNCONNECTED [7],\statCyclesWorking_reg[31]_i_2_n_1 ,\statCyclesWorking_reg[31]_i_2_n_2 ,\statCyclesWorking_reg[31]_i_2_n_3 ,\statCyclesWorking_reg[31]_i_2_n_4 ,\statCyclesWorking_reg[31]_i_2_n_5 ,\statCyclesWorking_reg[31]_i_2_n_6 ,\statCyclesWorking_reg[31]_i_2_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\statCyclesWorking_reg[31]_i_2_n_8 ,\statCyclesWorking_reg[31]_i_2_n_9 ,\statCyclesWorking_reg[31]_i_2_n_10 ,\statCyclesWorking_reg[31]_i_2_n_11 ,\statCyclesWorking_reg[31]_i_2_n_12 ,\statCyclesWorking_reg[31]_i_2_n_13 ,\statCyclesWorking_reg[31]_i_2_n_14 ,\statCyclesWorking_reg[31]_i_2_n_15 }),
        .S(STAT_CyclesSpentWorking[31:24]));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWorking_reg[3] 
       (.C(clk),
        .CE(statCyclesWorking),
        .D(\statCyclesWorking_reg[7]_i_1_n_12 ),
        .Q(STAT_CyclesSpentWorking[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWorking_reg[4] 
       (.C(clk),
        .CE(statCyclesWorking),
        .D(\statCyclesWorking_reg[7]_i_1_n_11 ),
        .Q(STAT_CyclesSpentWorking[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWorking_reg[5] 
       (.C(clk),
        .CE(statCyclesWorking),
        .D(\statCyclesWorking_reg[7]_i_1_n_10 ),
        .Q(STAT_CyclesSpentWorking[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWorking_reg[6] 
       (.C(clk),
        .CE(statCyclesWorking),
        .D(\statCyclesWorking_reg[7]_i_1_n_9 ),
        .Q(STAT_CyclesSpentWorking[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWorking_reg[7] 
       (.C(clk),
        .CE(statCyclesWorking),
        .D(\statCyclesWorking_reg[7]_i_1_n_8 ),
        .Q(STAT_CyclesSpentWorking[7]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \statCyclesWorking_reg[7]_i_1 
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({\statCyclesWorking_reg[7]_i_1_n_0 ,\statCyclesWorking_reg[7]_i_1_n_1 ,\statCyclesWorking_reg[7]_i_1_n_2 ,\statCyclesWorking_reg[7]_i_1_n_3 ,\statCyclesWorking_reg[7]_i_1_n_4 ,\statCyclesWorking_reg[7]_i_1_n_5 ,\statCyclesWorking_reg[7]_i_1_n_6 ,\statCyclesWorking_reg[7]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1}),
        .O({\statCyclesWorking_reg[7]_i_1_n_8 ,\statCyclesWorking_reg[7]_i_1_n_9 ,\statCyclesWorking_reg[7]_i_1_n_10 ,\statCyclesWorking_reg[7]_i_1_n_11 ,\statCyclesWorking_reg[7]_i_1_n_12 ,\statCyclesWorking_reg[7]_i_1_n_13 ,\statCyclesWorking_reg[7]_i_1_n_14 ,\statCyclesWorking_reg[7]_i_1_n_15 }),
        .S({STAT_CyclesSpentWorking[7:1],\statCyclesWorking[7]_i_2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWorking_reg[8] 
       (.C(clk),
        .CE(statCyclesWorking),
        .D(\statCyclesWorking_reg[15]_i_1_n_15 ),
        .Q(STAT_CyclesSpentWorking[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \statCyclesWorking_reg[9] 
       (.C(clk),
        .CE(statCyclesWorking),
        .D(\statCyclesWorking_reg[15]_i_1_n_14 ),
        .Q(STAT_CyclesSpentWorking[9]),
        .R(1'b0));
  FDRE \vertDataA_reg[Z][0] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ0[0]),
        .Q(\vertDataA_reg[Z] [0]),
        .R(1'b0));
  FDRE \vertDataA_reg[Z][10] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ0[10]),
        .Q(\vertDataA_reg[Z] [10]),
        .R(1'b0));
  FDRE \vertDataA_reg[Z][11] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ0[11]),
        .Q(\vertDataA_reg[Z] [11]),
        .R(1'b0));
  FDRE \vertDataA_reg[Z][12] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ0[12]),
        .Q(\vertDataA_reg[Z] [12]),
        .R(1'b0));
  FDRE \vertDataA_reg[Z][13] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ0[13]),
        .Q(\vertDataA_reg[Z] [13]),
        .R(1'b0));
  FDRE \vertDataA_reg[Z][14] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ0[14]),
        .Q(\vertDataA_reg[Z] [14]),
        .R(1'b0));
  FDRE \vertDataA_reg[Z][15] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ0[15]),
        .Q(\vertDataA_reg[Z] [15]),
        .R(1'b0));
  FDRE \vertDataA_reg[Z][16] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ0[16]),
        .Q(\vertDataA_reg[Z] [16]),
        .R(1'b0));
  FDRE \vertDataA_reg[Z][17] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ0[17]),
        .Q(\vertDataA_reg[Z] [17]),
        .R(1'b0));
  FDRE \vertDataA_reg[Z][18] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ0[18]),
        .Q(\vertDataA_reg[Z] [18]),
        .R(1'b0));
  FDRE \vertDataA_reg[Z][19] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ0[19]),
        .Q(\vertDataA_reg[Z] [19]),
        .R(1'b0));
  FDRE \vertDataA_reg[Z][1] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ0[1]),
        .Q(\vertDataA_reg[Z] [1]),
        .R(1'b0));
  FDRE \vertDataA_reg[Z][20] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ0[20]),
        .Q(\vertDataA_reg[Z] [20]),
        .R(1'b0));
  FDRE \vertDataA_reg[Z][21] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ0[21]),
        .Q(\vertDataA_reg[Z] [21]),
        .R(1'b0));
  FDRE \vertDataA_reg[Z][22] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ0[22]),
        .Q(\vertDataA_reg[Z] [22]),
        .R(1'b0));
  FDRE \vertDataA_reg[Z][23] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ0[23]),
        .Q(\vertDataA_reg[Z] [23]),
        .R(1'b0));
  FDRE \vertDataA_reg[Z][24] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ0[24]),
        .Q(\vertDataA_reg[Z] [24]),
        .R(1'b0));
  FDRE \vertDataA_reg[Z][25] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ0[25]),
        .Q(\vertDataA_reg[Z] [25]),
        .R(1'b0));
  FDRE \vertDataA_reg[Z][26] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ0[26]),
        .Q(\vertDataA_reg[Z] [26]),
        .R(1'b0));
  FDRE \vertDataA_reg[Z][27] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ0[27]),
        .Q(\vertDataA_reg[Z] [27]),
        .R(1'b0));
  FDRE \vertDataA_reg[Z][28] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ0[28]),
        .Q(\vertDataA_reg[Z] [28]),
        .R(1'b0));
  FDRE \vertDataA_reg[Z][29] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ0[29]),
        .Q(\vertDataA_reg[Z] [29]),
        .R(1'b0));
  FDRE \vertDataA_reg[Z][2] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ0[2]),
        .Q(\vertDataA_reg[Z] [2]),
        .R(1'b0));
  FDRE \vertDataA_reg[Z][30] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ0[30]),
        .Q(\vertDataA_reg[Z] [30]),
        .R(1'b0));
  FDRE \vertDataA_reg[Z][31] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ0[31]),
        .Q(\vertDataA_reg[Z] [31]),
        .R(1'b0));
  FDRE \vertDataA_reg[Z][3] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ0[3]),
        .Q(\vertDataA_reg[Z] [3]),
        .R(1'b0));
  FDRE \vertDataA_reg[Z][4] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ0[4]),
        .Q(\vertDataA_reg[Z] [4]),
        .R(1'b0));
  FDRE \vertDataA_reg[Z][5] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ0[5]),
        .Q(\vertDataA_reg[Z] [5]),
        .R(1'b0));
  FDRE \vertDataA_reg[Z][6] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ0[6]),
        .Q(\vertDataA_reg[Z] [6]),
        .R(1'b0));
  FDRE \vertDataA_reg[Z][7] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ0[7]),
        .Q(\vertDataA_reg[Z] [7]),
        .R(1'b0));
  FDRE \vertDataA_reg[Z][8] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ0[8]),
        .Q(\vertDataA_reg[Z] [8]),
        .R(1'b0));
  FDRE \vertDataA_reg[Z][9] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ0[9]),
        .Q(\vertDataA_reg[Z] [9]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][a][0] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[96]),
        .Q(\vertDataA_reg[color][a] [0]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][a][10] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[106]),
        .Q(\vertDataA_reg[color][a] [10]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][a][11] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[107]),
        .Q(\vertDataA_reg[color][a] [11]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][a][12] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[108]),
        .Q(\vertDataA_reg[color][a] [12]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][a][13] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[109]),
        .Q(\vertDataA_reg[color][a] [13]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][a][14] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[110]),
        .Q(\vertDataA_reg[color][a] [14]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][a][15] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[111]),
        .Q(\vertDataA_reg[color][a] [15]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][a][16] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[112]),
        .Q(\vertDataA_reg[color][a] [16]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][a][17] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[113]),
        .Q(\vertDataA_reg[color][a] [17]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][a][18] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[114]),
        .Q(\vertDataA_reg[color][a] [18]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][a][19] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[115]),
        .Q(\vertDataA_reg[color][a] [19]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][a][1] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[97]),
        .Q(\vertDataA_reg[color][a] [1]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][a][20] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[116]),
        .Q(\vertDataA_reg[color][a] [20]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][a][21] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[117]),
        .Q(\vertDataA_reg[color][a] [21]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][a][22] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[118]),
        .Q(\vertDataA_reg[color][a] [22]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][a][23] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[119]),
        .Q(\vertDataA_reg[color][a] [23]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][a][24] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[120]),
        .Q(\vertDataA_reg[color][a] [24]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][a][25] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[121]),
        .Q(\vertDataA_reg[color][a] [25]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][a][26] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[122]),
        .Q(\vertDataA_reg[color][a] [26]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][a][27] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[123]),
        .Q(\vertDataA_reg[color][a] [27]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][a][28] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[124]),
        .Q(\vertDataA_reg[color][a] [28]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][a][29] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[125]),
        .Q(\vertDataA_reg[color][a] [29]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][a][2] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[98]),
        .Q(\vertDataA_reg[color][a] [2]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][a][30] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[126]),
        .Q(\vertDataA_reg[color][a] [30]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][a][31] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[127]),
        .Q(\vertDataA_reg[color][a] [31]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][a][3] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[99]),
        .Q(\vertDataA_reg[color][a] [3]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][a][4] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[100]),
        .Q(\vertDataA_reg[color][a] [4]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][a][5] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[101]),
        .Q(\vertDataA_reg[color][a] [5]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][a][6] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[102]),
        .Q(\vertDataA_reg[color][a] [6]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][a][7] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[103]),
        .Q(\vertDataA_reg[color][a] [7]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][a][8] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[104]),
        .Q(\vertDataA_reg[color][a] [8]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][a][9] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[105]),
        .Q(\vertDataA_reg[color][a] [9]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][b][0] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[64]),
        .Q(\vertDataA_reg[color][b] [0]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][b][10] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[74]),
        .Q(\vertDataA_reg[color][b] [10]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][b][11] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[75]),
        .Q(\vertDataA_reg[color][b] [11]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][b][12] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[76]),
        .Q(\vertDataA_reg[color][b] [12]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][b][13] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[77]),
        .Q(\vertDataA_reg[color][b] [13]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][b][14] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[78]),
        .Q(\vertDataA_reg[color][b] [14]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][b][15] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[79]),
        .Q(\vertDataA_reg[color][b] [15]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][b][16] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[80]),
        .Q(\vertDataA_reg[color][b] [16]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][b][17] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[81]),
        .Q(\vertDataA_reg[color][b] [17]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][b][18] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[82]),
        .Q(\vertDataA_reg[color][b] [18]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][b][19] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[83]),
        .Q(\vertDataA_reg[color][b] [19]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][b][1] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[65]),
        .Q(\vertDataA_reg[color][b] [1]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][b][20] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[84]),
        .Q(\vertDataA_reg[color][b] [20]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][b][21] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[85]),
        .Q(\vertDataA_reg[color][b] [21]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][b][22] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[86]),
        .Q(\vertDataA_reg[color][b] [22]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][b][23] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[87]),
        .Q(\vertDataA_reg[color][b] [23]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][b][24] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[88]),
        .Q(\vertDataA_reg[color][b] [24]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][b][25] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[89]),
        .Q(\vertDataA_reg[color][b] [25]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][b][26] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[90]),
        .Q(\vertDataA_reg[color][b] [26]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][b][27] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[91]),
        .Q(\vertDataA_reg[color][b] [27]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][b][28] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[92]),
        .Q(\vertDataA_reg[color][b] [28]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][b][29] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[93]),
        .Q(\vertDataA_reg[color][b] [29]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][b][2] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[66]),
        .Q(\vertDataA_reg[color][b] [2]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][b][30] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[94]),
        .Q(\vertDataA_reg[color][b] [30]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][b][31] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[95]),
        .Q(\vertDataA_reg[color][b] [31]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][b][3] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[67]),
        .Q(\vertDataA_reg[color][b] [3]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][b][4] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[68]),
        .Q(\vertDataA_reg[color][b] [4]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][b][5] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[69]),
        .Q(\vertDataA_reg[color][b] [5]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][b][6] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[70]),
        .Q(\vertDataA_reg[color][b] [6]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][b][7] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[71]),
        .Q(\vertDataA_reg[color][b] [7]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][b][8] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[72]),
        .Q(\vertDataA_reg[color][b] [8]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][b][9] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[73]),
        .Q(\vertDataA_reg[color][b] [9]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][g][0] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[32]),
        .Q(\vertDataA_reg[color][g] [0]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][g][10] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[42]),
        .Q(\vertDataA_reg[color][g] [10]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][g][11] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[43]),
        .Q(\vertDataA_reg[color][g] [11]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][g][12] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[44]),
        .Q(\vertDataA_reg[color][g] [12]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][g][13] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[45]),
        .Q(\vertDataA_reg[color][g] [13]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][g][14] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[46]),
        .Q(\vertDataA_reg[color][g] [14]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][g][15] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[47]),
        .Q(\vertDataA_reg[color][g] [15]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][g][16] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[48]),
        .Q(\vertDataA_reg[color][g] [16]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][g][17] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[49]),
        .Q(\vertDataA_reg[color][g] [17]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][g][18] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[50]),
        .Q(\vertDataA_reg[color][g] [18]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][g][19] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[51]),
        .Q(\vertDataA_reg[color][g] [19]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][g][1] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[33]),
        .Q(\vertDataA_reg[color][g] [1]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][g][20] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[52]),
        .Q(\vertDataA_reg[color][g] [20]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][g][21] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[53]),
        .Q(\vertDataA_reg[color][g] [21]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][g][22] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[54]),
        .Q(\vertDataA_reg[color][g] [22]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][g][23] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[55]),
        .Q(\vertDataA_reg[color][g] [23]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][g][24] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[56]),
        .Q(\vertDataA_reg[color][g] [24]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][g][25] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[57]),
        .Q(\vertDataA_reg[color][g] [25]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][g][26] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[58]),
        .Q(\vertDataA_reg[color][g] [26]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][g][27] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[59]),
        .Q(\vertDataA_reg[color][g] [27]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][g][28] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[60]),
        .Q(\vertDataA_reg[color][g] [28]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][g][29] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[61]),
        .Q(\vertDataA_reg[color][g] [29]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][g][2] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[34]),
        .Q(\vertDataA_reg[color][g] [2]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][g][30] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[62]),
        .Q(\vertDataA_reg[color][g] [30]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][g][31] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[63]),
        .Q(\vertDataA_reg[color][g] [31]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][g][3] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[35]),
        .Q(\vertDataA_reg[color][g] [3]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][g][4] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[36]),
        .Q(\vertDataA_reg[color][g] [4]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][g][5] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[37]),
        .Q(\vertDataA_reg[color][g] [5]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][g][6] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[38]),
        .Q(\vertDataA_reg[color][g] [6]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][g][7] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[39]),
        .Q(\vertDataA_reg[color][g] [7]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][g][8] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[40]),
        .Q(\vertDataA_reg[color][g] [8]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][g][9] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[41]),
        .Q(\vertDataA_reg[color][g] [9]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][r][0] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[0]),
        .Q(\vertDataA_reg[color][r] [0]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][r][10] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[10]),
        .Q(\vertDataA_reg[color][r] [10]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][r][11] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[11]),
        .Q(\vertDataA_reg[color][r] [11]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][r][12] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[12]),
        .Q(\vertDataA_reg[color][r] [12]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][r][13] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[13]),
        .Q(\vertDataA_reg[color][r] [13]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][r][14] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[14]),
        .Q(\vertDataA_reg[color][r] [14]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][r][15] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[15]),
        .Q(\vertDataA_reg[color][r] [15]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][r][16] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[16]),
        .Q(\vertDataA_reg[color][r] [16]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][r][17] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[17]),
        .Q(\vertDataA_reg[color][r] [17]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][r][18] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[18]),
        .Q(\vertDataA_reg[color][r] [18]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][r][19] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[19]),
        .Q(\vertDataA_reg[color][r] [19]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][r][1] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[1]),
        .Q(\vertDataA_reg[color][r] [1]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][r][20] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[20]),
        .Q(\vertDataA_reg[color][r] [20]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][r][21] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[21]),
        .Q(\vertDataA_reg[color][r] [21]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][r][22] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[22]),
        .Q(\vertDataA_reg[color][r] [22]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][r][23] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[23]),
        .Q(\vertDataA_reg[color][r] [23]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][r][24] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[24]),
        .Q(\vertDataA_reg[color][r] [24]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][r][25] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[25]),
        .Q(\vertDataA_reg[color][r] [25]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][r][26] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[26]),
        .Q(\vertDataA_reg[color][r] [26]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][r][27] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[27]),
        .Q(\vertDataA_reg[color][r] [27]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][r][28] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[28]),
        .Q(\vertDataA_reg[color][r] [28]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][r][29] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[29]),
        .Q(\vertDataA_reg[color][r] [29]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][r][2] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[2]),
        .Q(\vertDataA_reg[color][r] [2]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][r][30] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[30]),
        .Q(\vertDataA_reg[color][r] [30]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][r][31] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[31]),
        .Q(\vertDataA_reg[color][r] [31]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][r][3] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[3]),
        .Q(\vertDataA_reg[color][r] [3]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][r][4] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[4]),
        .Q(\vertDataA_reg[color][r] [4]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][r][5] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[5]),
        .Q(\vertDataA_reg[color][r] [5]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][r][6] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[6]),
        .Q(\vertDataA_reg[color][r] [6]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][r][7] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[7]),
        .Q(\vertDataA_reg[color][r] [7]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][r][8] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[8]),
        .Q(\vertDataA_reg[color][r] [8]),
        .R(1'b0));
  FDRE \vertDataA_reg[color][r][9] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor0[9]),
        .Q(\vertDataA_reg[color][r] [9]),
        .R(1'b0));
  FDRE \vertDataA_reg[invW][0] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW0[0]),
        .Q(\vertDataA_reg[invW] [0]),
        .R(1'b0));
  FDRE \vertDataA_reg[invW][10] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW0[10]),
        .Q(\vertDataA_reg[invW] [10]),
        .R(1'b0));
  FDRE \vertDataA_reg[invW][11] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW0[11]),
        .Q(\vertDataA_reg[invW] [11]),
        .R(1'b0));
  FDRE \vertDataA_reg[invW][12] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW0[12]),
        .Q(\vertDataA_reg[invW] [12]),
        .R(1'b0));
  FDRE \vertDataA_reg[invW][13] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW0[13]),
        .Q(\vertDataA_reg[invW] [13]),
        .R(1'b0));
  FDRE \vertDataA_reg[invW][14] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW0[14]),
        .Q(\vertDataA_reg[invW] [14]),
        .R(1'b0));
  FDRE \vertDataA_reg[invW][15] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW0[15]),
        .Q(\vertDataA_reg[invW] [15]),
        .R(1'b0));
  FDRE \vertDataA_reg[invW][16] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW0[16]),
        .Q(\vertDataA_reg[invW] [16]),
        .R(1'b0));
  FDRE \vertDataA_reg[invW][17] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW0[17]),
        .Q(\vertDataA_reg[invW] [17]),
        .R(1'b0));
  FDRE \vertDataA_reg[invW][18] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW0[18]),
        .Q(\vertDataA_reg[invW] [18]),
        .R(1'b0));
  FDRE \vertDataA_reg[invW][19] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW0[19]),
        .Q(\vertDataA_reg[invW] [19]),
        .R(1'b0));
  FDRE \vertDataA_reg[invW][1] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW0[1]),
        .Q(\vertDataA_reg[invW] [1]),
        .R(1'b0));
  FDRE \vertDataA_reg[invW][20] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW0[20]),
        .Q(\vertDataA_reg[invW] [20]),
        .R(1'b0));
  FDRE \vertDataA_reg[invW][21] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW0[21]),
        .Q(\vertDataA_reg[invW] [21]),
        .R(1'b0));
  FDRE \vertDataA_reg[invW][22] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW0[22]),
        .Q(\vertDataA_reg[invW] [22]),
        .R(1'b0));
  FDRE \vertDataA_reg[invW][23] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW0[23]),
        .Q(\vertDataA_reg[invW] [23]),
        .R(1'b0));
  FDRE \vertDataA_reg[invW][24] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW0[24]),
        .Q(\vertDataA_reg[invW] [24]),
        .R(1'b0));
  FDRE \vertDataA_reg[invW][25] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW0[25]),
        .Q(\vertDataA_reg[invW] [25]),
        .R(1'b0));
  FDRE \vertDataA_reg[invW][26] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW0[26]),
        .Q(\vertDataA_reg[invW] [26]),
        .R(1'b0));
  FDRE \vertDataA_reg[invW][27] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW0[27]),
        .Q(\vertDataA_reg[invW] [27]),
        .R(1'b0));
  FDRE \vertDataA_reg[invW][28] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW0[28]),
        .Q(\vertDataA_reg[invW] [28]),
        .R(1'b0));
  FDRE \vertDataA_reg[invW][29] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW0[29]),
        .Q(\vertDataA_reg[invW] [29]),
        .R(1'b0));
  FDRE \vertDataA_reg[invW][2] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW0[2]),
        .Q(\vertDataA_reg[invW] [2]),
        .R(1'b0));
  FDRE \vertDataA_reg[invW][30] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW0[30]),
        .Q(\vertDataA_reg[invW] [30]),
        .R(1'b0));
  FDRE \vertDataA_reg[invW][31] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW0[31]),
        .Q(\vertDataA_reg[invW] [31]),
        .R(1'b0));
  FDRE \vertDataA_reg[invW][3] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW0[3]),
        .Q(\vertDataA_reg[invW] [3]),
        .R(1'b0));
  FDRE \vertDataA_reg[invW][4] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW0[4]),
        .Q(\vertDataA_reg[invW] [4]),
        .R(1'b0));
  FDRE \vertDataA_reg[invW][5] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW0[5]),
        .Q(\vertDataA_reg[invW] [5]),
        .R(1'b0));
  FDRE \vertDataA_reg[invW][6] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW0[6]),
        .Q(\vertDataA_reg[invW] [6]),
        .R(1'b0));
  FDRE \vertDataA_reg[invW][7] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW0[7]),
        .Q(\vertDataA_reg[invW] [7]),
        .R(1'b0));
  FDRE \vertDataA_reg[invW][8] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW0[8]),
        .Q(\vertDataA_reg[invW] [8]),
        .R(1'b0));
  FDRE \vertDataA_reg[invW][9] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW0[9]),
        .Q(\vertDataA_reg[invW] [9]),
        .R(1'b0));
  FDRE \vertDataA_reg[texcoord][tx][0] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX0[0]),
        .Q(\vertDataA_reg[texcoord][tx] [0]),
        .R(1'b0));
  FDRE \vertDataA_reg[texcoord][tx][10] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX0[10]),
        .Q(\vertDataA_reg[texcoord][tx] [10]),
        .R(1'b0));
  FDRE \vertDataA_reg[texcoord][tx][11] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX0[11]),
        .Q(\vertDataA_reg[texcoord][tx] [11]),
        .R(1'b0));
  FDRE \vertDataA_reg[texcoord][tx][12] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX0[12]),
        .Q(\vertDataA_reg[texcoord][tx] [12]),
        .R(1'b0));
  FDRE \vertDataA_reg[texcoord][tx][13] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX0[13]),
        .Q(\vertDataA_reg[texcoord][tx] [13]),
        .R(1'b0));
  FDRE \vertDataA_reg[texcoord][tx][14] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX0[14]),
        .Q(\vertDataA_reg[texcoord][tx] [14]),
        .R(1'b0));
  FDRE \vertDataA_reg[texcoord][tx][15] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX0[15]),
        .Q(\vertDataA_reg[texcoord][tx] [15]),
        .R(1'b0));
  FDRE \vertDataA_reg[texcoord][tx][16] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX0[16]),
        .Q(\vertDataA_reg[texcoord][tx] [16]),
        .R(1'b0));
  FDRE \vertDataA_reg[texcoord][tx][17] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX0[17]),
        .Q(\vertDataA_reg[texcoord][tx] [17]),
        .R(1'b0));
  FDRE \vertDataA_reg[texcoord][tx][18] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX0[18]),
        .Q(\vertDataA_reg[texcoord][tx] [18]),
        .R(1'b0));
  FDRE \vertDataA_reg[texcoord][tx][19] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX0[19]),
        .Q(\vertDataA_reg[texcoord][tx] [19]),
        .R(1'b0));
  FDRE \vertDataA_reg[texcoord][tx][1] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX0[1]),
        .Q(\vertDataA_reg[texcoord][tx] [1]),
        .R(1'b0));
  FDRE \vertDataA_reg[texcoord][tx][20] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX0[20]),
        .Q(\vertDataA_reg[texcoord][tx] [20]),
        .R(1'b0));
  FDRE \vertDataA_reg[texcoord][tx][21] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX0[21]),
        .Q(\vertDataA_reg[texcoord][tx] [21]),
        .R(1'b0));
  FDRE \vertDataA_reg[texcoord][tx][22] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX0[22]),
        .Q(\vertDataA_reg[texcoord][tx] [22]),
        .R(1'b0));
  FDRE \vertDataA_reg[texcoord][tx][23] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX0[23]),
        .Q(\vertDataA_reg[texcoord][tx] [23]),
        .R(1'b0));
  FDRE \vertDataA_reg[texcoord][tx][24] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX0[24]),
        .Q(\vertDataA_reg[texcoord][tx] [24]),
        .R(1'b0));
  FDRE \vertDataA_reg[texcoord][tx][25] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX0[25]),
        .Q(\vertDataA_reg[texcoord][tx] [25]),
        .R(1'b0));
  FDRE \vertDataA_reg[texcoord][tx][26] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX0[26]),
        .Q(\vertDataA_reg[texcoord][tx] [26]),
        .R(1'b0));
  FDRE \vertDataA_reg[texcoord][tx][27] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX0[27]),
        .Q(\vertDataA_reg[texcoord][tx] [27]),
        .R(1'b0));
  FDRE \vertDataA_reg[texcoord][tx][28] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX0[28]),
        .Q(\vertDataA_reg[texcoord][tx] [28]),
        .R(1'b0));
  FDRE \vertDataA_reg[texcoord][tx][29] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX0[29]),
        .Q(\vertDataA_reg[texcoord][tx] [29]),
        .R(1'b0));
  FDRE \vertDataA_reg[texcoord][tx][2] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX0[2]),
        .Q(\vertDataA_reg[texcoord][tx] [2]),
        .R(1'b0));
  FDRE \vertDataA_reg[texcoord][tx][30] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX0[30]),
        .Q(\vertDataA_reg[texcoord][tx] [30]),
        .R(1'b0));
  FDRE \vertDataA_reg[texcoord][tx][31] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX0[31]),
        .Q(\vertDataA_reg[texcoord][tx] [31]),
        .R(1'b0));
  FDRE \vertDataA_reg[texcoord][tx][3] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX0[3]),
        .Q(\vertDataA_reg[texcoord][tx] [3]),
        .R(1'b0));
  FDRE \vertDataA_reg[texcoord][tx][4] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX0[4]),
        .Q(\vertDataA_reg[texcoord][tx] [4]),
        .R(1'b0));
  FDRE \vertDataA_reg[texcoord][tx][5] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX0[5]),
        .Q(\vertDataA_reg[texcoord][tx] [5]),
        .R(1'b0));
  FDRE \vertDataA_reg[texcoord][tx][6] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX0[6]),
        .Q(\vertDataA_reg[texcoord][tx] [6]),
        .R(1'b0));
  FDRE \vertDataA_reg[texcoord][tx][7] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX0[7]),
        .Q(\vertDataA_reg[texcoord][tx] [7]),
        .R(1'b0));
  FDRE \vertDataA_reg[texcoord][tx][8] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX0[8]),
        .Q(\vertDataA_reg[texcoord][tx] [8]),
        .R(1'b0));
  FDRE \vertDataA_reg[texcoord][tx][9] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX0[9]),
        .Q(\vertDataA_reg[texcoord][tx] [9]),
        .R(1'b0));
  FDRE \vertDataA_reg[texcoord][ty][0] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY0[0]),
        .Q(\vertDataA_reg[texcoord][ty] [0]),
        .R(1'b0));
  FDRE \vertDataA_reg[texcoord][ty][10] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY0[10]),
        .Q(\vertDataA_reg[texcoord][ty] [10]),
        .R(1'b0));
  FDRE \vertDataA_reg[texcoord][ty][11] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY0[11]),
        .Q(\vertDataA_reg[texcoord][ty] [11]),
        .R(1'b0));
  FDRE \vertDataA_reg[texcoord][ty][12] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY0[12]),
        .Q(\vertDataA_reg[texcoord][ty] [12]),
        .R(1'b0));
  FDRE \vertDataA_reg[texcoord][ty][13] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY0[13]),
        .Q(\vertDataA_reg[texcoord][ty] [13]),
        .R(1'b0));
  FDRE \vertDataA_reg[texcoord][ty][14] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY0[14]),
        .Q(\vertDataA_reg[texcoord][ty] [14]),
        .R(1'b0));
  FDRE \vertDataA_reg[texcoord][ty][15] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY0[15]),
        .Q(\vertDataA_reg[texcoord][ty] [15]),
        .R(1'b0));
  FDRE \vertDataA_reg[texcoord][ty][16] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY0[16]),
        .Q(\vertDataA_reg[texcoord][ty] [16]),
        .R(1'b0));
  FDRE \vertDataA_reg[texcoord][ty][17] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY0[17]),
        .Q(\vertDataA_reg[texcoord][ty] [17]),
        .R(1'b0));
  FDRE \vertDataA_reg[texcoord][ty][18] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY0[18]),
        .Q(\vertDataA_reg[texcoord][ty] [18]),
        .R(1'b0));
  FDRE \vertDataA_reg[texcoord][ty][19] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY0[19]),
        .Q(\vertDataA_reg[texcoord][ty] [19]),
        .R(1'b0));
  FDRE \vertDataA_reg[texcoord][ty][1] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY0[1]),
        .Q(\vertDataA_reg[texcoord][ty] [1]),
        .R(1'b0));
  FDRE \vertDataA_reg[texcoord][ty][20] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY0[20]),
        .Q(\vertDataA_reg[texcoord][ty] [20]),
        .R(1'b0));
  FDRE \vertDataA_reg[texcoord][ty][21] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY0[21]),
        .Q(\vertDataA_reg[texcoord][ty] [21]),
        .R(1'b0));
  FDRE \vertDataA_reg[texcoord][ty][22] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY0[22]),
        .Q(\vertDataA_reg[texcoord][ty] [22]),
        .R(1'b0));
  FDRE \vertDataA_reg[texcoord][ty][23] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY0[23]),
        .Q(\vertDataA_reg[texcoord][ty] [23]),
        .R(1'b0));
  FDRE \vertDataA_reg[texcoord][ty][24] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY0[24]),
        .Q(\vertDataA_reg[texcoord][ty] [24]),
        .R(1'b0));
  FDRE \vertDataA_reg[texcoord][ty][25] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY0[25]),
        .Q(\vertDataA_reg[texcoord][ty] [25]),
        .R(1'b0));
  FDRE \vertDataA_reg[texcoord][ty][26] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY0[26]),
        .Q(\vertDataA_reg[texcoord][ty] [26]),
        .R(1'b0));
  FDRE \vertDataA_reg[texcoord][ty][27] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY0[27]),
        .Q(\vertDataA_reg[texcoord][ty] [27]),
        .R(1'b0));
  FDRE \vertDataA_reg[texcoord][ty][28] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY0[28]),
        .Q(\vertDataA_reg[texcoord][ty] [28]),
        .R(1'b0));
  FDRE \vertDataA_reg[texcoord][ty][29] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY0[29]),
        .Q(\vertDataA_reg[texcoord][ty] [29]),
        .R(1'b0));
  FDRE \vertDataA_reg[texcoord][ty][2] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY0[2]),
        .Q(\vertDataA_reg[texcoord][ty] [2]),
        .R(1'b0));
  FDRE \vertDataA_reg[texcoord][ty][30] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY0[30]),
        .Q(\vertDataA_reg[texcoord][ty] [30]),
        .R(1'b0));
  FDRE \vertDataA_reg[texcoord][ty][31] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY0[31]),
        .Q(\vertDataA_reg[texcoord][ty] [31]),
        .R(1'b0));
  FDRE \vertDataA_reg[texcoord][ty][3] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY0[3]),
        .Q(\vertDataA_reg[texcoord][ty] [3]),
        .R(1'b0));
  FDRE \vertDataA_reg[texcoord][ty][4] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY0[4]),
        .Q(\vertDataA_reg[texcoord][ty] [4]),
        .R(1'b0));
  FDRE \vertDataA_reg[texcoord][ty][5] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY0[5]),
        .Q(\vertDataA_reg[texcoord][ty] [5]),
        .R(1'b0));
  FDRE \vertDataA_reg[texcoord][ty][6] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY0[6]),
        .Q(\vertDataA_reg[texcoord][ty] [6]),
        .R(1'b0));
  FDRE \vertDataA_reg[texcoord][ty][7] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY0[7]),
        .Q(\vertDataA_reg[texcoord][ty] [7]),
        .R(1'b0));
  FDRE \vertDataA_reg[texcoord][ty][8] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY0[8]),
        .Q(\vertDataA_reg[texcoord][ty] [8]),
        .R(1'b0));
  FDRE \vertDataA_reg[texcoord][ty][9] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY0[9]),
        .Q(\vertDataA_reg[texcoord][ty] [9]),
        .R(1'b0));
  FDRE \vertDataB_reg[Z][0] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ10[0]),
        .Q(\vertDataB_reg[Z] [0]),
        .R(1'b0));
  FDRE \vertDataB_reg[Z][10] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ10[10]),
        .Q(\vertDataB_reg[Z] [10]),
        .R(1'b0));
  FDRE \vertDataB_reg[Z][11] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ10[11]),
        .Q(\vertDataB_reg[Z] [11]),
        .R(1'b0));
  FDRE \vertDataB_reg[Z][12] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ10[12]),
        .Q(\vertDataB_reg[Z] [12]),
        .R(1'b0));
  FDRE \vertDataB_reg[Z][13] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ10[13]),
        .Q(\vertDataB_reg[Z] [13]),
        .R(1'b0));
  FDRE \vertDataB_reg[Z][14] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ10[14]),
        .Q(\vertDataB_reg[Z] [14]),
        .R(1'b0));
  FDRE \vertDataB_reg[Z][15] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ10[15]),
        .Q(\vertDataB_reg[Z] [15]),
        .R(1'b0));
  FDRE \vertDataB_reg[Z][16] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ10[16]),
        .Q(\vertDataB_reg[Z] [16]),
        .R(1'b0));
  FDRE \vertDataB_reg[Z][17] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ10[17]),
        .Q(\vertDataB_reg[Z] [17]),
        .R(1'b0));
  FDRE \vertDataB_reg[Z][18] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ10[18]),
        .Q(\vertDataB_reg[Z] [18]),
        .R(1'b0));
  FDRE \vertDataB_reg[Z][19] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ10[19]),
        .Q(\vertDataB_reg[Z] [19]),
        .R(1'b0));
  FDRE \vertDataB_reg[Z][1] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ10[1]),
        .Q(\vertDataB_reg[Z] [1]),
        .R(1'b0));
  FDRE \vertDataB_reg[Z][20] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ10[20]),
        .Q(\vertDataB_reg[Z] [20]),
        .R(1'b0));
  FDRE \vertDataB_reg[Z][21] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ10[21]),
        .Q(\vertDataB_reg[Z] [21]),
        .R(1'b0));
  FDRE \vertDataB_reg[Z][22] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ10[22]),
        .Q(\vertDataB_reg[Z] [22]),
        .R(1'b0));
  FDRE \vertDataB_reg[Z][23] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ10[23]),
        .Q(\vertDataB_reg[Z] [23]),
        .R(1'b0));
  FDRE \vertDataB_reg[Z][24] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ10[24]),
        .Q(\vertDataB_reg[Z] [24]),
        .R(1'b0));
  FDRE \vertDataB_reg[Z][25] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ10[25]),
        .Q(\vertDataB_reg[Z] [25]),
        .R(1'b0));
  FDRE \vertDataB_reg[Z][26] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ10[26]),
        .Q(\vertDataB_reg[Z] [26]),
        .R(1'b0));
  FDRE \vertDataB_reg[Z][27] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ10[27]),
        .Q(\vertDataB_reg[Z] [27]),
        .R(1'b0));
  FDRE \vertDataB_reg[Z][28] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ10[28]),
        .Q(\vertDataB_reg[Z] [28]),
        .R(1'b0));
  FDRE \vertDataB_reg[Z][29] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ10[29]),
        .Q(\vertDataB_reg[Z] [29]),
        .R(1'b0));
  FDRE \vertDataB_reg[Z][2] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ10[2]),
        .Q(\vertDataB_reg[Z] [2]),
        .R(1'b0));
  FDRE \vertDataB_reg[Z][30] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ10[30]),
        .Q(\vertDataB_reg[Z] [30]),
        .R(1'b0));
  FDRE \vertDataB_reg[Z][31] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ10[31]),
        .Q(\vertDataB_reg[Z] [31]),
        .R(1'b0));
  FDRE \vertDataB_reg[Z][3] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ10[3]),
        .Q(\vertDataB_reg[Z] [3]),
        .R(1'b0));
  FDRE \vertDataB_reg[Z][4] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ10[4]),
        .Q(\vertDataB_reg[Z] [4]),
        .R(1'b0));
  FDRE \vertDataB_reg[Z][5] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ10[5]),
        .Q(\vertDataB_reg[Z] [5]),
        .R(1'b0));
  FDRE \vertDataB_reg[Z][6] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ10[6]),
        .Q(\vertDataB_reg[Z] [6]),
        .R(1'b0));
  FDRE \vertDataB_reg[Z][7] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ10[7]),
        .Q(\vertDataB_reg[Z] [7]),
        .R(1'b0));
  FDRE \vertDataB_reg[Z][8] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ10[8]),
        .Q(\vertDataB_reg[Z] [8]),
        .R(1'b0));
  FDRE \vertDataB_reg[Z][9] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ10[9]),
        .Q(\vertDataB_reg[Z] [9]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][a][0] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[96]),
        .Q(\vertDataB_reg[color][a] [0]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][a][10] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[106]),
        .Q(\vertDataB_reg[color][a] [10]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][a][11] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[107]),
        .Q(\vertDataB_reg[color][a] [11]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][a][12] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[108]),
        .Q(\vertDataB_reg[color][a] [12]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][a][13] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[109]),
        .Q(\vertDataB_reg[color][a] [13]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][a][14] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[110]),
        .Q(\vertDataB_reg[color][a] [14]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][a][15] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[111]),
        .Q(\vertDataB_reg[color][a] [15]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][a][16] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[112]),
        .Q(\vertDataB_reg[color][a] [16]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][a][17] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[113]),
        .Q(\vertDataB_reg[color][a] [17]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][a][18] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[114]),
        .Q(\vertDataB_reg[color][a] [18]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][a][19] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[115]),
        .Q(\vertDataB_reg[color][a] [19]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][a][1] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[97]),
        .Q(\vertDataB_reg[color][a] [1]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][a][20] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[116]),
        .Q(\vertDataB_reg[color][a] [20]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][a][21] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[117]),
        .Q(\vertDataB_reg[color][a] [21]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][a][22] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[118]),
        .Q(\vertDataB_reg[color][a] [22]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][a][23] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[119]),
        .Q(\vertDataB_reg[color][a] [23]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][a][24] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[120]),
        .Q(\vertDataB_reg[color][a] [24]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][a][25] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[121]),
        .Q(\vertDataB_reg[color][a] [25]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][a][26] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[122]),
        .Q(\vertDataB_reg[color][a] [26]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][a][27] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[123]),
        .Q(\vertDataB_reg[color][a] [27]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][a][28] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[124]),
        .Q(\vertDataB_reg[color][a] [28]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][a][29] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[125]),
        .Q(\vertDataB_reg[color][a] [29]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][a][2] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[98]),
        .Q(\vertDataB_reg[color][a] [2]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][a][30] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[126]),
        .Q(\vertDataB_reg[color][a] [30]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][a][31] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[127]),
        .Q(\vertDataB_reg[color][a] [31]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][a][3] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[99]),
        .Q(\vertDataB_reg[color][a] [3]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][a][4] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[100]),
        .Q(\vertDataB_reg[color][a] [4]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][a][5] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[101]),
        .Q(\vertDataB_reg[color][a] [5]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][a][6] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[102]),
        .Q(\vertDataB_reg[color][a] [6]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][a][7] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[103]),
        .Q(\vertDataB_reg[color][a] [7]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][a][8] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[104]),
        .Q(\vertDataB_reg[color][a] [8]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][a][9] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[105]),
        .Q(\vertDataB_reg[color][a] [9]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][b][0] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[64]),
        .Q(\vertDataB_reg[color][b] [0]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][b][10] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[74]),
        .Q(\vertDataB_reg[color][b] [10]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][b][11] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[75]),
        .Q(\vertDataB_reg[color][b] [11]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][b][12] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[76]),
        .Q(\vertDataB_reg[color][b] [12]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][b][13] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[77]),
        .Q(\vertDataB_reg[color][b] [13]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][b][14] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[78]),
        .Q(\vertDataB_reg[color][b] [14]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][b][15] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[79]),
        .Q(\vertDataB_reg[color][b] [15]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][b][16] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[80]),
        .Q(\vertDataB_reg[color][b] [16]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][b][17] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[81]),
        .Q(\vertDataB_reg[color][b] [17]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][b][18] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[82]),
        .Q(\vertDataB_reg[color][b] [18]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][b][19] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[83]),
        .Q(\vertDataB_reg[color][b] [19]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][b][1] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[65]),
        .Q(\vertDataB_reg[color][b] [1]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][b][20] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[84]),
        .Q(\vertDataB_reg[color][b] [20]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][b][21] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[85]),
        .Q(\vertDataB_reg[color][b] [21]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][b][22] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[86]),
        .Q(\vertDataB_reg[color][b] [22]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][b][23] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[87]),
        .Q(\vertDataB_reg[color][b] [23]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][b][24] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[88]),
        .Q(\vertDataB_reg[color][b] [24]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][b][25] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[89]),
        .Q(\vertDataB_reg[color][b] [25]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][b][26] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[90]),
        .Q(\vertDataB_reg[color][b] [26]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][b][27] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[91]),
        .Q(\vertDataB_reg[color][b] [27]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][b][28] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[92]),
        .Q(\vertDataB_reg[color][b] [28]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][b][29] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[93]),
        .Q(\vertDataB_reg[color][b] [29]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][b][2] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[66]),
        .Q(\vertDataB_reg[color][b] [2]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][b][30] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[94]),
        .Q(\vertDataB_reg[color][b] [30]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][b][31] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[95]),
        .Q(\vertDataB_reg[color][b] [31]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][b][3] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[67]),
        .Q(\vertDataB_reg[color][b] [3]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][b][4] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[68]),
        .Q(\vertDataB_reg[color][b] [4]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][b][5] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[69]),
        .Q(\vertDataB_reg[color][b] [5]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][b][6] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[70]),
        .Q(\vertDataB_reg[color][b] [6]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][b][7] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[71]),
        .Q(\vertDataB_reg[color][b] [7]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][b][8] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[72]),
        .Q(\vertDataB_reg[color][b] [8]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][b][9] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[73]),
        .Q(\vertDataB_reg[color][b] [9]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][g][0] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[32]),
        .Q(\vertDataB_reg[color][g] [0]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][g][10] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[42]),
        .Q(\vertDataB_reg[color][g] [10]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][g][11] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[43]),
        .Q(\vertDataB_reg[color][g] [11]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][g][12] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[44]),
        .Q(\vertDataB_reg[color][g] [12]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][g][13] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[45]),
        .Q(\vertDataB_reg[color][g] [13]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][g][14] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[46]),
        .Q(\vertDataB_reg[color][g] [14]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][g][15] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[47]),
        .Q(\vertDataB_reg[color][g] [15]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][g][16] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[48]),
        .Q(\vertDataB_reg[color][g] [16]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][g][17] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[49]),
        .Q(\vertDataB_reg[color][g] [17]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][g][18] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[50]),
        .Q(\vertDataB_reg[color][g] [18]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][g][19] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[51]),
        .Q(\vertDataB_reg[color][g] [19]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][g][1] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[33]),
        .Q(\vertDataB_reg[color][g] [1]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][g][20] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[52]),
        .Q(\vertDataB_reg[color][g] [20]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][g][21] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[53]),
        .Q(\vertDataB_reg[color][g] [21]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][g][22] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[54]),
        .Q(\vertDataB_reg[color][g] [22]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][g][23] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[55]),
        .Q(\vertDataB_reg[color][g] [23]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][g][24] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[56]),
        .Q(\vertDataB_reg[color][g] [24]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][g][25] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[57]),
        .Q(\vertDataB_reg[color][g] [25]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][g][26] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[58]),
        .Q(\vertDataB_reg[color][g] [26]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][g][27] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[59]),
        .Q(\vertDataB_reg[color][g] [27]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][g][28] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[60]),
        .Q(\vertDataB_reg[color][g] [28]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][g][29] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[61]),
        .Q(\vertDataB_reg[color][g] [29]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][g][2] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[34]),
        .Q(\vertDataB_reg[color][g] [2]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][g][30] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[62]),
        .Q(\vertDataB_reg[color][g] [30]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][g][31] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[63]),
        .Q(\vertDataB_reg[color][g] [31]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][g][3] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[35]),
        .Q(\vertDataB_reg[color][g] [3]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][g][4] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[36]),
        .Q(\vertDataB_reg[color][g] [4]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][g][5] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[37]),
        .Q(\vertDataB_reg[color][g] [5]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][g][6] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[38]),
        .Q(\vertDataB_reg[color][g] [6]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][g][7] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[39]),
        .Q(\vertDataB_reg[color][g] [7]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][g][8] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[40]),
        .Q(\vertDataB_reg[color][g] [8]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][g][9] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[41]),
        .Q(\vertDataB_reg[color][g] [9]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][r][0] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[0]),
        .Q(\vertDataB_reg[color][r] [0]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][r][10] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[10]),
        .Q(\vertDataB_reg[color][r] [10]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][r][11] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[11]),
        .Q(\vertDataB_reg[color][r] [11]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][r][12] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[12]),
        .Q(\vertDataB_reg[color][r] [12]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][r][13] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[13]),
        .Q(\vertDataB_reg[color][r] [13]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][r][14] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[14]),
        .Q(\vertDataB_reg[color][r] [14]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][r][15] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[15]),
        .Q(\vertDataB_reg[color][r] [15]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][r][16] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[16]),
        .Q(\vertDataB_reg[color][r] [16]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][r][17] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[17]),
        .Q(\vertDataB_reg[color][r] [17]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][r][18] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[18]),
        .Q(\vertDataB_reg[color][r] [18]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][r][19] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[19]),
        .Q(\vertDataB_reg[color][r] [19]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][r][1] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[1]),
        .Q(\vertDataB_reg[color][r] [1]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][r][20] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[20]),
        .Q(\vertDataB_reg[color][r] [20]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][r][21] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[21]),
        .Q(\vertDataB_reg[color][r] [21]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][r][22] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[22]),
        .Q(\vertDataB_reg[color][r] [22]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][r][23] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[23]),
        .Q(\vertDataB_reg[color][r] [23]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][r][24] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[24]),
        .Q(\vertDataB_reg[color][r] [24]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][r][25] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[25]),
        .Q(\vertDataB_reg[color][r] [25]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][r][26] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[26]),
        .Q(\vertDataB_reg[color][r] [26]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][r][27] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[27]),
        .Q(\vertDataB_reg[color][r] [27]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][r][28] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[28]),
        .Q(\vertDataB_reg[color][r] [28]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][r][29] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[29]),
        .Q(\vertDataB_reg[color][r] [29]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][r][2] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[2]),
        .Q(\vertDataB_reg[color][r] [2]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][r][30] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[30]),
        .Q(\vertDataB_reg[color][r] [30]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][r][31] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[31]),
        .Q(\vertDataB_reg[color][r] [31]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][r][3] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[3]),
        .Q(\vertDataB_reg[color][r] [3]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][r][4] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[4]),
        .Q(\vertDataB_reg[color][r] [4]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][r][5] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[5]),
        .Q(\vertDataB_reg[color][r] [5]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][r][6] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[6]),
        .Q(\vertDataB_reg[color][r] [6]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][r][7] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[7]),
        .Q(\vertDataB_reg[color][r] [7]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][r][8] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[8]),
        .Q(\vertDataB_reg[color][r] [8]),
        .R(1'b0));
  FDRE \vertDataB_reg[color][r][9] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor10[9]),
        .Q(\vertDataB_reg[color][r] [9]),
        .R(1'b0));
  FDRE \vertDataB_reg[invW][0] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW10[0]),
        .Q(\vertDataB_reg[invW] [0]),
        .R(1'b0));
  FDRE \vertDataB_reg[invW][10] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW10[10]),
        .Q(\vertDataB_reg[invW] [10]),
        .R(1'b0));
  FDRE \vertDataB_reg[invW][11] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW10[11]),
        .Q(\vertDataB_reg[invW] [11]),
        .R(1'b0));
  FDRE \vertDataB_reg[invW][12] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW10[12]),
        .Q(\vertDataB_reg[invW] [12]),
        .R(1'b0));
  FDRE \vertDataB_reg[invW][13] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW10[13]),
        .Q(\vertDataB_reg[invW] [13]),
        .R(1'b0));
  FDRE \vertDataB_reg[invW][14] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW10[14]),
        .Q(\vertDataB_reg[invW] [14]),
        .R(1'b0));
  FDRE \vertDataB_reg[invW][15] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW10[15]),
        .Q(\vertDataB_reg[invW] [15]),
        .R(1'b0));
  FDRE \vertDataB_reg[invW][16] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW10[16]),
        .Q(\vertDataB_reg[invW] [16]),
        .R(1'b0));
  FDRE \vertDataB_reg[invW][17] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW10[17]),
        .Q(\vertDataB_reg[invW] [17]),
        .R(1'b0));
  FDRE \vertDataB_reg[invW][18] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW10[18]),
        .Q(\vertDataB_reg[invW] [18]),
        .R(1'b0));
  FDRE \vertDataB_reg[invW][19] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW10[19]),
        .Q(\vertDataB_reg[invW] [19]),
        .R(1'b0));
  FDRE \vertDataB_reg[invW][1] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW10[1]),
        .Q(\vertDataB_reg[invW] [1]),
        .R(1'b0));
  FDRE \vertDataB_reg[invW][20] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW10[20]),
        .Q(\vertDataB_reg[invW] [20]),
        .R(1'b0));
  FDRE \vertDataB_reg[invW][21] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW10[21]),
        .Q(\vertDataB_reg[invW] [21]),
        .R(1'b0));
  FDRE \vertDataB_reg[invW][22] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW10[22]),
        .Q(\vertDataB_reg[invW] [22]),
        .R(1'b0));
  FDRE \vertDataB_reg[invW][23] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW10[23]),
        .Q(\vertDataB_reg[invW] [23]),
        .R(1'b0));
  FDRE \vertDataB_reg[invW][24] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW10[24]),
        .Q(\vertDataB_reg[invW] [24]),
        .R(1'b0));
  FDRE \vertDataB_reg[invW][25] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW10[25]),
        .Q(\vertDataB_reg[invW] [25]),
        .R(1'b0));
  FDRE \vertDataB_reg[invW][26] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW10[26]),
        .Q(\vertDataB_reg[invW] [26]),
        .R(1'b0));
  FDRE \vertDataB_reg[invW][27] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW10[27]),
        .Q(\vertDataB_reg[invW] [27]),
        .R(1'b0));
  FDRE \vertDataB_reg[invW][28] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW10[28]),
        .Q(\vertDataB_reg[invW] [28]),
        .R(1'b0));
  FDRE \vertDataB_reg[invW][29] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW10[29]),
        .Q(\vertDataB_reg[invW] [29]),
        .R(1'b0));
  FDRE \vertDataB_reg[invW][2] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW10[2]),
        .Q(\vertDataB_reg[invW] [2]),
        .R(1'b0));
  FDRE \vertDataB_reg[invW][30] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW10[30]),
        .Q(\vertDataB_reg[invW] [30]),
        .R(1'b0));
  FDRE \vertDataB_reg[invW][31] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW10[31]),
        .Q(\vertDataB_reg[invW] [31]),
        .R(1'b0));
  FDRE \vertDataB_reg[invW][3] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW10[3]),
        .Q(\vertDataB_reg[invW] [3]),
        .R(1'b0));
  FDRE \vertDataB_reg[invW][4] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW10[4]),
        .Q(\vertDataB_reg[invW] [4]),
        .R(1'b0));
  FDRE \vertDataB_reg[invW][5] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW10[5]),
        .Q(\vertDataB_reg[invW] [5]),
        .R(1'b0));
  FDRE \vertDataB_reg[invW][6] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW10[6]),
        .Q(\vertDataB_reg[invW] [6]),
        .R(1'b0));
  FDRE \vertDataB_reg[invW][7] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW10[7]),
        .Q(\vertDataB_reg[invW] [7]),
        .R(1'b0));
  FDRE \vertDataB_reg[invW][8] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW10[8]),
        .Q(\vertDataB_reg[invW] [8]),
        .R(1'b0));
  FDRE \vertDataB_reg[invW][9] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW10[9]),
        .Q(\vertDataB_reg[invW] [9]),
        .R(1'b0));
  FDRE \vertDataB_reg[texcoord][tx][0] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX10[0]),
        .Q(\vertDataB_reg[texcoord][tx] [0]),
        .R(1'b0));
  FDRE \vertDataB_reg[texcoord][tx][10] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX10[10]),
        .Q(\vertDataB_reg[texcoord][tx] [10]),
        .R(1'b0));
  FDRE \vertDataB_reg[texcoord][tx][11] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX10[11]),
        .Q(\vertDataB_reg[texcoord][tx] [11]),
        .R(1'b0));
  FDRE \vertDataB_reg[texcoord][tx][12] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX10[12]),
        .Q(\vertDataB_reg[texcoord][tx] [12]),
        .R(1'b0));
  FDRE \vertDataB_reg[texcoord][tx][13] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX10[13]),
        .Q(\vertDataB_reg[texcoord][tx] [13]),
        .R(1'b0));
  FDRE \vertDataB_reg[texcoord][tx][14] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX10[14]),
        .Q(\vertDataB_reg[texcoord][tx] [14]),
        .R(1'b0));
  FDRE \vertDataB_reg[texcoord][tx][15] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX10[15]),
        .Q(\vertDataB_reg[texcoord][tx] [15]),
        .R(1'b0));
  FDRE \vertDataB_reg[texcoord][tx][16] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX10[16]),
        .Q(\vertDataB_reg[texcoord][tx] [16]),
        .R(1'b0));
  FDRE \vertDataB_reg[texcoord][tx][17] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX10[17]),
        .Q(\vertDataB_reg[texcoord][tx] [17]),
        .R(1'b0));
  FDRE \vertDataB_reg[texcoord][tx][18] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX10[18]),
        .Q(\vertDataB_reg[texcoord][tx] [18]),
        .R(1'b0));
  FDRE \vertDataB_reg[texcoord][tx][19] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX10[19]),
        .Q(\vertDataB_reg[texcoord][tx] [19]),
        .R(1'b0));
  FDRE \vertDataB_reg[texcoord][tx][1] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX10[1]),
        .Q(\vertDataB_reg[texcoord][tx] [1]),
        .R(1'b0));
  FDRE \vertDataB_reg[texcoord][tx][20] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX10[20]),
        .Q(\vertDataB_reg[texcoord][tx] [20]),
        .R(1'b0));
  FDRE \vertDataB_reg[texcoord][tx][21] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX10[21]),
        .Q(\vertDataB_reg[texcoord][tx] [21]),
        .R(1'b0));
  FDRE \vertDataB_reg[texcoord][tx][22] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX10[22]),
        .Q(\vertDataB_reg[texcoord][tx] [22]),
        .R(1'b0));
  FDRE \vertDataB_reg[texcoord][tx][23] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX10[23]),
        .Q(\vertDataB_reg[texcoord][tx] [23]),
        .R(1'b0));
  FDRE \vertDataB_reg[texcoord][tx][24] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX10[24]),
        .Q(\vertDataB_reg[texcoord][tx] [24]),
        .R(1'b0));
  FDRE \vertDataB_reg[texcoord][tx][25] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX10[25]),
        .Q(\vertDataB_reg[texcoord][tx] [25]),
        .R(1'b0));
  FDRE \vertDataB_reg[texcoord][tx][26] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX10[26]),
        .Q(\vertDataB_reg[texcoord][tx] [26]),
        .R(1'b0));
  FDRE \vertDataB_reg[texcoord][tx][27] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX10[27]),
        .Q(\vertDataB_reg[texcoord][tx] [27]),
        .R(1'b0));
  FDRE \vertDataB_reg[texcoord][tx][28] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX10[28]),
        .Q(\vertDataB_reg[texcoord][tx] [28]),
        .R(1'b0));
  FDRE \vertDataB_reg[texcoord][tx][29] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX10[29]),
        .Q(\vertDataB_reg[texcoord][tx] [29]),
        .R(1'b0));
  FDRE \vertDataB_reg[texcoord][tx][2] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX10[2]),
        .Q(\vertDataB_reg[texcoord][tx] [2]),
        .R(1'b0));
  FDRE \vertDataB_reg[texcoord][tx][30] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX10[30]),
        .Q(\vertDataB_reg[texcoord][tx] [30]),
        .R(1'b0));
  FDRE \vertDataB_reg[texcoord][tx][31] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX10[31]),
        .Q(\vertDataB_reg[texcoord][tx] [31]),
        .R(1'b0));
  FDRE \vertDataB_reg[texcoord][tx][3] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX10[3]),
        .Q(\vertDataB_reg[texcoord][tx] [3]),
        .R(1'b0));
  FDRE \vertDataB_reg[texcoord][tx][4] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX10[4]),
        .Q(\vertDataB_reg[texcoord][tx] [4]),
        .R(1'b0));
  FDRE \vertDataB_reg[texcoord][tx][5] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX10[5]),
        .Q(\vertDataB_reg[texcoord][tx] [5]),
        .R(1'b0));
  FDRE \vertDataB_reg[texcoord][tx][6] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX10[6]),
        .Q(\vertDataB_reg[texcoord][tx] [6]),
        .R(1'b0));
  FDRE \vertDataB_reg[texcoord][tx][7] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX10[7]),
        .Q(\vertDataB_reg[texcoord][tx] [7]),
        .R(1'b0));
  FDRE \vertDataB_reg[texcoord][tx][8] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX10[8]),
        .Q(\vertDataB_reg[texcoord][tx] [8]),
        .R(1'b0));
  FDRE \vertDataB_reg[texcoord][tx][9] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX10[9]),
        .Q(\vertDataB_reg[texcoord][tx] [9]),
        .R(1'b0));
  FDRE \vertDataB_reg[texcoord][ty][0] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY10[0]),
        .Q(\vertDataB_reg[texcoord][ty] [0]),
        .R(1'b0));
  FDRE \vertDataB_reg[texcoord][ty][10] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY10[10]),
        .Q(\vertDataB_reg[texcoord][ty] [10]),
        .R(1'b0));
  FDRE \vertDataB_reg[texcoord][ty][11] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY10[11]),
        .Q(\vertDataB_reg[texcoord][ty] [11]),
        .R(1'b0));
  FDRE \vertDataB_reg[texcoord][ty][12] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY10[12]),
        .Q(\vertDataB_reg[texcoord][ty] [12]),
        .R(1'b0));
  FDRE \vertDataB_reg[texcoord][ty][13] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY10[13]),
        .Q(\vertDataB_reg[texcoord][ty] [13]),
        .R(1'b0));
  FDRE \vertDataB_reg[texcoord][ty][14] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY10[14]),
        .Q(\vertDataB_reg[texcoord][ty] [14]),
        .R(1'b0));
  FDRE \vertDataB_reg[texcoord][ty][15] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY10[15]),
        .Q(\vertDataB_reg[texcoord][ty] [15]),
        .R(1'b0));
  FDRE \vertDataB_reg[texcoord][ty][16] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY10[16]),
        .Q(\vertDataB_reg[texcoord][ty] [16]),
        .R(1'b0));
  FDRE \vertDataB_reg[texcoord][ty][17] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY10[17]),
        .Q(\vertDataB_reg[texcoord][ty] [17]),
        .R(1'b0));
  FDRE \vertDataB_reg[texcoord][ty][18] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY10[18]),
        .Q(\vertDataB_reg[texcoord][ty] [18]),
        .R(1'b0));
  FDRE \vertDataB_reg[texcoord][ty][19] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY10[19]),
        .Q(\vertDataB_reg[texcoord][ty] [19]),
        .R(1'b0));
  FDRE \vertDataB_reg[texcoord][ty][1] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY10[1]),
        .Q(\vertDataB_reg[texcoord][ty] [1]),
        .R(1'b0));
  FDRE \vertDataB_reg[texcoord][ty][20] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY10[20]),
        .Q(\vertDataB_reg[texcoord][ty] [20]),
        .R(1'b0));
  FDRE \vertDataB_reg[texcoord][ty][21] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY10[21]),
        .Q(\vertDataB_reg[texcoord][ty] [21]),
        .R(1'b0));
  FDRE \vertDataB_reg[texcoord][ty][22] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY10[22]),
        .Q(\vertDataB_reg[texcoord][ty] [22]),
        .R(1'b0));
  FDRE \vertDataB_reg[texcoord][ty][23] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY10[23]),
        .Q(\vertDataB_reg[texcoord][ty] [23]),
        .R(1'b0));
  FDRE \vertDataB_reg[texcoord][ty][24] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY10[24]),
        .Q(\vertDataB_reg[texcoord][ty] [24]),
        .R(1'b0));
  FDRE \vertDataB_reg[texcoord][ty][25] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY10[25]),
        .Q(\vertDataB_reg[texcoord][ty] [25]),
        .R(1'b0));
  FDRE \vertDataB_reg[texcoord][ty][26] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY10[26]),
        .Q(\vertDataB_reg[texcoord][ty] [26]),
        .R(1'b0));
  FDRE \vertDataB_reg[texcoord][ty][27] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY10[27]),
        .Q(\vertDataB_reg[texcoord][ty] [27]),
        .R(1'b0));
  FDRE \vertDataB_reg[texcoord][ty][28] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY10[28]),
        .Q(\vertDataB_reg[texcoord][ty] [28]),
        .R(1'b0));
  FDRE \vertDataB_reg[texcoord][ty][29] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY10[29]),
        .Q(\vertDataB_reg[texcoord][ty] [29]),
        .R(1'b0));
  FDRE \vertDataB_reg[texcoord][ty][2] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY10[2]),
        .Q(\vertDataB_reg[texcoord][ty] [2]),
        .R(1'b0));
  FDRE \vertDataB_reg[texcoord][ty][30] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY10[30]),
        .Q(\vertDataB_reg[texcoord][ty] [30]),
        .R(1'b0));
  FDRE \vertDataB_reg[texcoord][ty][31] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY10[31]),
        .Q(\vertDataB_reg[texcoord][ty] [31]),
        .R(1'b0));
  FDRE \vertDataB_reg[texcoord][ty][3] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY10[3]),
        .Q(\vertDataB_reg[texcoord][ty] [3]),
        .R(1'b0));
  FDRE \vertDataB_reg[texcoord][ty][4] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY10[4]),
        .Q(\vertDataB_reg[texcoord][ty] [4]),
        .R(1'b0));
  FDRE \vertDataB_reg[texcoord][ty][5] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY10[5]),
        .Q(\vertDataB_reg[texcoord][ty] [5]),
        .R(1'b0));
  FDRE \vertDataB_reg[texcoord][ty][6] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY10[6]),
        .Q(\vertDataB_reg[texcoord][ty] [6]),
        .R(1'b0));
  FDRE \vertDataB_reg[texcoord][ty][7] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY10[7]),
        .Q(\vertDataB_reg[texcoord][ty] [7]),
        .R(1'b0));
  FDRE \vertDataB_reg[texcoord][ty][8] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY10[8]),
        .Q(\vertDataB_reg[texcoord][ty] [8]),
        .R(1'b0));
  FDRE \vertDataB_reg[texcoord][ty][9] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY10[9]),
        .Q(\vertDataB_reg[texcoord][ty] [9]),
        .R(1'b0));
  FDRE \vertDataC_reg[Z][0] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ20[0]),
        .Q(\vertDataC_reg[Z] [0]),
        .R(1'b0));
  FDRE \vertDataC_reg[Z][10] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ20[10]),
        .Q(\vertDataC_reg[Z] [10]),
        .R(1'b0));
  FDRE \vertDataC_reg[Z][11] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ20[11]),
        .Q(\vertDataC_reg[Z] [11]),
        .R(1'b0));
  FDRE \vertDataC_reg[Z][12] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ20[12]),
        .Q(\vertDataC_reg[Z] [12]),
        .R(1'b0));
  FDRE \vertDataC_reg[Z][13] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ20[13]),
        .Q(\vertDataC_reg[Z] [13]),
        .R(1'b0));
  FDRE \vertDataC_reg[Z][14] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ20[14]),
        .Q(\vertDataC_reg[Z] [14]),
        .R(1'b0));
  FDRE \vertDataC_reg[Z][15] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ20[15]),
        .Q(\vertDataC_reg[Z] [15]),
        .R(1'b0));
  FDRE \vertDataC_reg[Z][16] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ20[16]),
        .Q(\vertDataC_reg[Z] [16]),
        .R(1'b0));
  FDRE \vertDataC_reg[Z][17] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ20[17]),
        .Q(\vertDataC_reg[Z] [17]),
        .R(1'b0));
  FDRE \vertDataC_reg[Z][18] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ20[18]),
        .Q(\vertDataC_reg[Z] [18]),
        .R(1'b0));
  FDRE \vertDataC_reg[Z][19] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ20[19]),
        .Q(\vertDataC_reg[Z] [19]),
        .R(1'b0));
  FDRE \vertDataC_reg[Z][1] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ20[1]),
        .Q(\vertDataC_reg[Z] [1]),
        .R(1'b0));
  FDRE \vertDataC_reg[Z][20] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ20[20]),
        .Q(\vertDataC_reg[Z] [20]),
        .R(1'b0));
  FDRE \vertDataC_reg[Z][21] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ20[21]),
        .Q(\vertDataC_reg[Z] [21]),
        .R(1'b0));
  FDRE \vertDataC_reg[Z][22] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ20[22]),
        .Q(\vertDataC_reg[Z] [22]),
        .R(1'b0));
  FDRE \vertDataC_reg[Z][23] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ20[23]),
        .Q(\vertDataC_reg[Z] [23]),
        .R(1'b0));
  FDRE \vertDataC_reg[Z][24] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ20[24]),
        .Q(\vertDataC_reg[Z] [24]),
        .R(1'b0));
  FDRE \vertDataC_reg[Z][25] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ20[25]),
        .Q(\vertDataC_reg[Z] [25]),
        .R(1'b0));
  FDRE \vertDataC_reg[Z][26] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ20[26]),
        .Q(\vertDataC_reg[Z] [26]),
        .R(1'b0));
  FDRE \vertDataC_reg[Z][27] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ20[27]),
        .Q(\vertDataC_reg[Z] [27]),
        .R(1'b0));
  FDRE \vertDataC_reg[Z][28] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ20[28]),
        .Q(\vertDataC_reg[Z] [28]),
        .R(1'b0));
  FDRE \vertDataC_reg[Z][29] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ20[29]),
        .Q(\vertDataC_reg[Z] [29]),
        .R(1'b0));
  FDRE \vertDataC_reg[Z][2] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ20[2]),
        .Q(\vertDataC_reg[Z] [2]),
        .R(1'b0));
  FDRE \vertDataC_reg[Z][30] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ20[30]),
        .Q(\vertDataC_reg[Z] [30]),
        .R(1'b0));
  FDRE \vertDataC_reg[Z][31] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ20[31]),
        .Q(\vertDataC_reg[Z] [31]),
        .R(1'b0));
  FDRE \vertDataC_reg[Z][3] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ20[3]),
        .Q(\vertDataC_reg[Z] [3]),
        .R(1'b0));
  FDRE \vertDataC_reg[Z][4] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ20[4]),
        .Q(\vertDataC_reg[Z] [4]),
        .R(1'b0));
  FDRE \vertDataC_reg[Z][5] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ20[5]),
        .Q(\vertDataC_reg[Z] [5]),
        .R(1'b0));
  FDRE \vertDataC_reg[Z][6] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ20[6]),
        .Q(\vertDataC_reg[Z] [6]),
        .R(1'b0));
  FDRE \vertDataC_reg[Z][7] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ20[7]),
        .Q(\vertDataC_reg[Z] [7]),
        .R(1'b0));
  FDRE \vertDataC_reg[Z][8] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ20[8]),
        .Q(\vertDataC_reg[Z] [8]),
        .R(1'b0));
  FDRE \vertDataC_reg[Z][9] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inZ20[9]),
        .Q(\vertDataC_reg[Z] [9]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][a][0] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[96]),
        .Q(\vertDataC_reg[color][a] [0]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][a][10] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[106]),
        .Q(\vertDataC_reg[color][a] [10]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][a][11] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[107]),
        .Q(\vertDataC_reg[color][a] [11]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][a][12] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[108]),
        .Q(\vertDataC_reg[color][a] [12]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][a][13] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[109]),
        .Q(\vertDataC_reg[color][a] [13]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][a][14] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[110]),
        .Q(\vertDataC_reg[color][a] [14]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][a][15] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[111]),
        .Q(\vertDataC_reg[color][a] [15]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][a][16] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[112]),
        .Q(\vertDataC_reg[color][a] [16]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][a][17] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[113]),
        .Q(\vertDataC_reg[color][a] [17]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][a][18] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[114]),
        .Q(\vertDataC_reg[color][a] [18]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][a][19] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[115]),
        .Q(\vertDataC_reg[color][a] [19]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][a][1] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[97]),
        .Q(\vertDataC_reg[color][a] [1]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][a][20] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[116]),
        .Q(\vertDataC_reg[color][a] [20]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][a][21] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[117]),
        .Q(\vertDataC_reg[color][a] [21]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][a][22] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[118]),
        .Q(\vertDataC_reg[color][a] [22]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][a][23] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[119]),
        .Q(\vertDataC_reg[color][a] [23]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][a][24] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[120]),
        .Q(\vertDataC_reg[color][a] [24]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][a][25] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[121]),
        .Q(\vertDataC_reg[color][a] [25]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][a][26] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[122]),
        .Q(\vertDataC_reg[color][a] [26]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][a][27] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[123]),
        .Q(\vertDataC_reg[color][a] [27]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][a][28] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[124]),
        .Q(\vertDataC_reg[color][a] [28]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][a][29] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[125]),
        .Q(\vertDataC_reg[color][a] [29]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][a][2] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[98]),
        .Q(\vertDataC_reg[color][a] [2]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][a][30] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[126]),
        .Q(\vertDataC_reg[color][a] [30]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][a][31] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[127]),
        .Q(\vertDataC_reg[color][a] [31]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][a][3] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[99]),
        .Q(\vertDataC_reg[color][a] [3]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][a][4] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[100]),
        .Q(\vertDataC_reg[color][a] [4]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][a][5] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[101]),
        .Q(\vertDataC_reg[color][a] [5]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][a][6] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[102]),
        .Q(\vertDataC_reg[color][a] [6]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][a][7] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[103]),
        .Q(\vertDataC_reg[color][a] [7]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][a][8] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[104]),
        .Q(\vertDataC_reg[color][a] [8]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][a][9] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[105]),
        .Q(\vertDataC_reg[color][a] [9]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][b][0] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[64]),
        .Q(\vertDataC_reg[color][b] [0]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][b][10] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[74]),
        .Q(\vertDataC_reg[color][b] [10]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][b][11] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[75]),
        .Q(\vertDataC_reg[color][b] [11]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][b][12] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[76]),
        .Q(\vertDataC_reg[color][b] [12]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][b][13] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[77]),
        .Q(\vertDataC_reg[color][b] [13]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][b][14] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[78]),
        .Q(\vertDataC_reg[color][b] [14]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][b][15] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[79]),
        .Q(\vertDataC_reg[color][b] [15]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][b][16] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[80]),
        .Q(\vertDataC_reg[color][b] [16]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][b][17] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[81]),
        .Q(\vertDataC_reg[color][b] [17]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][b][18] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[82]),
        .Q(\vertDataC_reg[color][b] [18]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][b][19] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[83]),
        .Q(\vertDataC_reg[color][b] [19]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][b][1] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[65]),
        .Q(\vertDataC_reg[color][b] [1]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][b][20] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[84]),
        .Q(\vertDataC_reg[color][b] [20]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][b][21] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[85]),
        .Q(\vertDataC_reg[color][b] [21]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][b][22] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[86]),
        .Q(\vertDataC_reg[color][b] [22]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][b][23] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[87]),
        .Q(\vertDataC_reg[color][b] [23]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][b][24] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[88]),
        .Q(\vertDataC_reg[color][b] [24]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][b][25] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[89]),
        .Q(\vertDataC_reg[color][b] [25]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][b][26] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[90]),
        .Q(\vertDataC_reg[color][b] [26]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][b][27] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[91]),
        .Q(\vertDataC_reg[color][b] [27]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][b][28] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[92]),
        .Q(\vertDataC_reg[color][b] [28]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][b][29] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[93]),
        .Q(\vertDataC_reg[color][b] [29]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][b][2] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[66]),
        .Q(\vertDataC_reg[color][b] [2]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][b][30] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[94]),
        .Q(\vertDataC_reg[color][b] [30]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][b][31] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[95]),
        .Q(\vertDataC_reg[color][b] [31]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][b][3] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[67]),
        .Q(\vertDataC_reg[color][b] [3]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][b][4] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[68]),
        .Q(\vertDataC_reg[color][b] [4]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][b][5] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[69]),
        .Q(\vertDataC_reg[color][b] [5]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][b][6] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[70]),
        .Q(\vertDataC_reg[color][b] [6]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][b][7] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[71]),
        .Q(\vertDataC_reg[color][b] [7]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][b][8] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[72]),
        .Q(\vertDataC_reg[color][b] [8]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][b][9] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[73]),
        .Q(\vertDataC_reg[color][b] [9]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][g][0] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[32]),
        .Q(\vertDataC_reg[color][g] [0]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][g][10] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[42]),
        .Q(\vertDataC_reg[color][g] [10]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][g][11] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[43]),
        .Q(\vertDataC_reg[color][g] [11]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][g][12] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[44]),
        .Q(\vertDataC_reg[color][g] [12]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][g][13] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[45]),
        .Q(\vertDataC_reg[color][g] [13]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][g][14] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[46]),
        .Q(\vertDataC_reg[color][g] [14]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][g][15] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[47]),
        .Q(\vertDataC_reg[color][g] [15]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][g][16] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[48]),
        .Q(\vertDataC_reg[color][g] [16]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][g][17] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[49]),
        .Q(\vertDataC_reg[color][g] [17]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][g][18] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[50]),
        .Q(\vertDataC_reg[color][g] [18]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][g][19] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[51]),
        .Q(\vertDataC_reg[color][g] [19]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][g][1] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[33]),
        .Q(\vertDataC_reg[color][g] [1]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][g][20] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[52]),
        .Q(\vertDataC_reg[color][g] [20]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][g][21] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[53]),
        .Q(\vertDataC_reg[color][g] [21]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][g][22] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[54]),
        .Q(\vertDataC_reg[color][g] [22]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][g][23] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[55]),
        .Q(\vertDataC_reg[color][g] [23]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][g][24] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[56]),
        .Q(\vertDataC_reg[color][g] [24]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][g][25] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[57]),
        .Q(\vertDataC_reg[color][g] [25]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][g][26] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[58]),
        .Q(\vertDataC_reg[color][g] [26]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][g][27] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[59]),
        .Q(\vertDataC_reg[color][g] [27]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][g][28] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[60]),
        .Q(\vertDataC_reg[color][g] [28]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][g][29] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[61]),
        .Q(\vertDataC_reg[color][g] [29]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][g][2] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[34]),
        .Q(\vertDataC_reg[color][g] [2]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][g][30] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[62]),
        .Q(\vertDataC_reg[color][g] [30]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][g][31] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[63]),
        .Q(\vertDataC_reg[color][g] [31]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][g][3] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[35]),
        .Q(\vertDataC_reg[color][g] [3]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][g][4] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[36]),
        .Q(\vertDataC_reg[color][g] [4]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][g][5] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[37]),
        .Q(\vertDataC_reg[color][g] [5]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][g][6] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[38]),
        .Q(\vertDataC_reg[color][g] [6]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][g][7] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[39]),
        .Q(\vertDataC_reg[color][g] [7]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][g][8] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[40]),
        .Q(\vertDataC_reg[color][g] [8]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][g][9] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[41]),
        .Q(\vertDataC_reg[color][g] [9]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][r][0] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[0]),
        .Q(\vertDataC_reg[color][r] [0]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][r][10] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[10]),
        .Q(\vertDataC_reg[color][r] [10]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][r][11] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[11]),
        .Q(\vertDataC_reg[color][r] [11]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][r][12] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[12]),
        .Q(\vertDataC_reg[color][r] [12]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][r][13] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[13]),
        .Q(\vertDataC_reg[color][r] [13]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][r][14] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[14]),
        .Q(\vertDataC_reg[color][r] [14]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][r][15] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[15]),
        .Q(\vertDataC_reg[color][r] [15]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][r][16] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[16]),
        .Q(\vertDataC_reg[color][r] [16]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][r][17] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[17]),
        .Q(\vertDataC_reg[color][r] [17]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][r][18] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[18]),
        .Q(\vertDataC_reg[color][r] [18]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][r][19] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[19]),
        .Q(\vertDataC_reg[color][r] [19]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][r][1] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[1]),
        .Q(\vertDataC_reg[color][r] [1]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][r][20] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[20]),
        .Q(\vertDataC_reg[color][r] [20]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][r][21] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[21]),
        .Q(\vertDataC_reg[color][r] [21]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][r][22] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[22]),
        .Q(\vertDataC_reg[color][r] [22]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][r][23] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[23]),
        .Q(\vertDataC_reg[color][r] [23]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][r][24] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[24]),
        .Q(\vertDataC_reg[color][r] [24]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][r][25] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[25]),
        .Q(\vertDataC_reg[color][r] [25]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][r][26] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[26]),
        .Q(\vertDataC_reg[color][r] [26]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][r][27] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[27]),
        .Q(\vertDataC_reg[color][r] [27]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][r][28] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[28]),
        .Q(\vertDataC_reg[color][r] [28]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][r][29] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[29]),
        .Q(\vertDataC_reg[color][r] [29]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][r][2] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[2]),
        .Q(\vertDataC_reg[color][r] [2]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][r][30] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[30]),
        .Q(\vertDataC_reg[color][r] [30]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][r][31] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[31]),
        .Q(\vertDataC_reg[color][r] [31]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][r][3] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[3]),
        .Q(\vertDataC_reg[color][r] [3]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][r][4] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[4]),
        .Q(\vertDataC_reg[color][r] [4]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][r][5] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[5]),
        .Q(\vertDataC_reg[color][r] [5]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][r][6] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[6]),
        .Q(\vertDataC_reg[color][r] [6]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][r][7] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[7]),
        .Q(\vertDataC_reg[color][r] [7]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][r][8] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[8]),
        .Q(\vertDataC_reg[color][r] [8]),
        .R(1'b0));
  FDRE \vertDataC_reg[color][r][9] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inVertColor20[9]),
        .Q(\vertDataC_reg[color][r] [9]),
        .R(1'b0));
  FDRE \vertDataC_reg[invW][0] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW20[0]),
        .Q(\vertDataC_reg[invW] [0]),
        .R(1'b0));
  FDRE \vertDataC_reg[invW][10] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW20[10]),
        .Q(\vertDataC_reg[invW] [10]),
        .R(1'b0));
  FDRE \vertDataC_reg[invW][11] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW20[11]),
        .Q(\vertDataC_reg[invW] [11]),
        .R(1'b0));
  FDRE \vertDataC_reg[invW][12] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW20[12]),
        .Q(\vertDataC_reg[invW] [12]),
        .R(1'b0));
  FDRE \vertDataC_reg[invW][13] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW20[13]),
        .Q(\vertDataC_reg[invW] [13]),
        .R(1'b0));
  FDRE \vertDataC_reg[invW][14] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW20[14]),
        .Q(\vertDataC_reg[invW] [14]),
        .R(1'b0));
  FDRE \vertDataC_reg[invW][15] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW20[15]),
        .Q(\vertDataC_reg[invW] [15]),
        .R(1'b0));
  FDRE \vertDataC_reg[invW][16] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW20[16]),
        .Q(\vertDataC_reg[invW] [16]),
        .R(1'b0));
  FDRE \vertDataC_reg[invW][17] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW20[17]),
        .Q(\vertDataC_reg[invW] [17]),
        .R(1'b0));
  FDRE \vertDataC_reg[invW][18] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW20[18]),
        .Q(\vertDataC_reg[invW] [18]),
        .R(1'b0));
  FDRE \vertDataC_reg[invW][19] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW20[19]),
        .Q(\vertDataC_reg[invW] [19]),
        .R(1'b0));
  FDRE \vertDataC_reg[invW][1] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW20[1]),
        .Q(\vertDataC_reg[invW] [1]),
        .R(1'b0));
  FDRE \vertDataC_reg[invW][20] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW20[20]),
        .Q(\vertDataC_reg[invW] [20]),
        .R(1'b0));
  FDRE \vertDataC_reg[invW][21] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW20[21]),
        .Q(\vertDataC_reg[invW] [21]),
        .R(1'b0));
  FDRE \vertDataC_reg[invW][22] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW20[22]),
        .Q(\vertDataC_reg[invW] [22]),
        .R(1'b0));
  FDRE \vertDataC_reg[invW][23] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW20[23]),
        .Q(\vertDataC_reg[invW] [23]),
        .R(1'b0));
  FDRE \vertDataC_reg[invW][24] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW20[24]),
        .Q(\vertDataC_reg[invW] [24]),
        .R(1'b0));
  FDRE \vertDataC_reg[invW][25] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW20[25]),
        .Q(\vertDataC_reg[invW] [25]),
        .R(1'b0));
  FDRE \vertDataC_reg[invW][26] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW20[26]),
        .Q(\vertDataC_reg[invW] [26]),
        .R(1'b0));
  FDRE \vertDataC_reg[invW][27] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW20[27]),
        .Q(\vertDataC_reg[invW] [27]),
        .R(1'b0));
  FDRE \vertDataC_reg[invW][28] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW20[28]),
        .Q(\vertDataC_reg[invW] [28]),
        .R(1'b0));
  FDRE \vertDataC_reg[invW][29] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW20[29]),
        .Q(\vertDataC_reg[invW] [29]),
        .R(1'b0));
  FDRE \vertDataC_reg[invW][2] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW20[2]),
        .Q(\vertDataC_reg[invW] [2]),
        .R(1'b0));
  FDRE \vertDataC_reg[invW][30] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW20[30]),
        .Q(\vertDataC_reg[invW] [30]),
        .R(1'b0));
  FDRE \vertDataC_reg[invW][31] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW20[31]),
        .Q(\vertDataC_reg[invW] [31]),
        .R(1'b0));
  FDRE \vertDataC_reg[invW][3] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW20[3]),
        .Q(\vertDataC_reg[invW] [3]),
        .R(1'b0));
  FDRE \vertDataC_reg[invW][4] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW20[4]),
        .Q(\vertDataC_reg[invW] [4]),
        .R(1'b0));
  FDRE \vertDataC_reg[invW][5] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW20[5]),
        .Q(\vertDataC_reg[invW] [5]),
        .R(1'b0));
  FDRE \vertDataC_reg[invW][6] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW20[6]),
        .Q(\vertDataC_reg[invW] [6]),
        .R(1'b0));
  FDRE \vertDataC_reg[invW][7] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW20[7]),
        .Q(\vertDataC_reg[invW] [7]),
        .R(1'b0));
  FDRE \vertDataC_reg[invW][8] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW20[8]),
        .Q(\vertDataC_reg[invW] [8]),
        .R(1'b0));
  FDRE \vertDataC_reg[invW][9] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inInvW20[9]),
        .Q(\vertDataC_reg[invW] [9]),
        .R(1'b0));
  FDRE \vertDataC_reg[texcoord][tx][0] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX20[0]),
        .Q(\vertDataC_reg[texcoord][tx] [0]),
        .R(1'b0));
  FDRE \vertDataC_reg[texcoord][tx][10] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX20[10]),
        .Q(\vertDataC_reg[texcoord][tx] [10]),
        .R(1'b0));
  FDRE \vertDataC_reg[texcoord][tx][11] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX20[11]),
        .Q(\vertDataC_reg[texcoord][tx] [11]),
        .R(1'b0));
  FDRE \vertDataC_reg[texcoord][tx][12] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX20[12]),
        .Q(\vertDataC_reg[texcoord][tx] [12]),
        .R(1'b0));
  FDRE \vertDataC_reg[texcoord][tx][13] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX20[13]),
        .Q(\vertDataC_reg[texcoord][tx] [13]),
        .R(1'b0));
  FDRE \vertDataC_reg[texcoord][tx][14] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX20[14]),
        .Q(\vertDataC_reg[texcoord][tx] [14]),
        .R(1'b0));
  FDRE \vertDataC_reg[texcoord][tx][15] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX20[15]),
        .Q(\vertDataC_reg[texcoord][tx] [15]),
        .R(1'b0));
  FDRE \vertDataC_reg[texcoord][tx][16] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX20[16]),
        .Q(\vertDataC_reg[texcoord][tx] [16]),
        .R(1'b0));
  FDRE \vertDataC_reg[texcoord][tx][17] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX20[17]),
        .Q(\vertDataC_reg[texcoord][tx] [17]),
        .R(1'b0));
  FDRE \vertDataC_reg[texcoord][tx][18] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX20[18]),
        .Q(\vertDataC_reg[texcoord][tx] [18]),
        .R(1'b0));
  FDRE \vertDataC_reg[texcoord][tx][19] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX20[19]),
        .Q(\vertDataC_reg[texcoord][tx] [19]),
        .R(1'b0));
  FDRE \vertDataC_reg[texcoord][tx][1] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX20[1]),
        .Q(\vertDataC_reg[texcoord][tx] [1]),
        .R(1'b0));
  FDRE \vertDataC_reg[texcoord][tx][20] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX20[20]),
        .Q(\vertDataC_reg[texcoord][tx] [20]),
        .R(1'b0));
  FDRE \vertDataC_reg[texcoord][tx][21] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX20[21]),
        .Q(\vertDataC_reg[texcoord][tx] [21]),
        .R(1'b0));
  FDRE \vertDataC_reg[texcoord][tx][22] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX20[22]),
        .Q(\vertDataC_reg[texcoord][tx] [22]),
        .R(1'b0));
  FDRE \vertDataC_reg[texcoord][tx][23] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX20[23]),
        .Q(\vertDataC_reg[texcoord][tx] [23]),
        .R(1'b0));
  FDRE \vertDataC_reg[texcoord][tx][24] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX20[24]),
        .Q(\vertDataC_reg[texcoord][tx] [24]),
        .R(1'b0));
  FDRE \vertDataC_reg[texcoord][tx][25] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX20[25]),
        .Q(\vertDataC_reg[texcoord][tx] [25]),
        .R(1'b0));
  FDRE \vertDataC_reg[texcoord][tx][26] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX20[26]),
        .Q(\vertDataC_reg[texcoord][tx] [26]),
        .R(1'b0));
  FDRE \vertDataC_reg[texcoord][tx][27] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX20[27]),
        .Q(\vertDataC_reg[texcoord][tx] [27]),
        .R(1'b0));
  FDRE \vertDataC_reg[texcoord][tx][28] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX20[28]),
        .Q(\vertDataC_reg[texcoord][tx] [28]),
        .R(1'b0));
  FDRE \vertDataC_reg[texcoord][tx][29] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX20[29]),
        .Q(\vertDataC_reg[texcoord][tx] [29]),
        .R(1'b0));
  FDRE \vertDataC_reg[texcoord][tx][2] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX20[2]),
        .Q(\vertDataC_reg[texcoord][tx] [2]),
        .R(1'b0));
  FDRE \vertDataC_reg[texcoord][tx][30] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX20[30]),
        .Q(\vertDataC_reg[texcoord][tx] [30]),
        .R(1'b0));
  FDRE \vertDataC_reg[texcoord][tx][31] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX20[31]),
        .Q(\vertDataC_reg[texcoord][tx] [31]),
        .R(1'b0));
  FDRE \vertDataC_reg[texcoord][tx][3] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX20[3]),
        .Q(\vertDataC_reg[texcoord][tx] [3]),
        .R(1'b0));
  FDRE \vertDataC_reg[texcoord][tx][4] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX20[4]),
        .Q(\vertDataC_reg[texcoord][tx] [4]),
        .R(1'b0));
  FDRE \vertDataC_reg[texcoord][tx][5] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX20[5]),
        .Q(\vertDataC_reg[texcoord][tx] [5]),
        .R(1'b0));
  FDRE \vertDataC_reg[texcoord][tx][6] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX20[6]),
        .Q(\vertDataC_reg[texcoord][tx] [6]),
        .R(1'b0));
  FDRE \vertDataC_reg[texcoord][tx][7] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX20[7]),
        .Q(\vertDataC_reg[texcoord][tx] [7]),
        .R(1'b0));
  FDRE \vertDataC_reg[texcoord][tx][8] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX20[8]),
        .Q(\vertDataC_reg[texcoord][tx] [8]),
        .R(1'b0));
  FDRE \vertDataC_reg[texcoord][tx][9] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTX20[9]),
        .Q(\vertDataC_reg[texcoord][tx] [9]),
        .R(1'b0));
  FDRE \vertDataC_reg[texcoord][ty][0] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY20[0]),
        .Q(\vertDataC_reg[texcoord][ty] [0]),
        .R(1'b0));
  FDRE \vertDataC_reg[texcoord][ty][10] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY20[10]),
        .Q(\vertDataC_reg[texcoord][ty] [10]),
        .R(1'b0));
  FDRE \vertDataC_reg[texcoord][ty][11] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY20[11]),
        .Q(\vertDataC_reg[texcoord][ty] [11]),
        .R(1'b0));
  FDRE \vertDataC_reg[texcoord][ty][12] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY20[12]),
        .Q(\vertDataC_reg[texcoord][ty] [12]),
        .R(1'b0));
  FDRE \vertDataC_reg[texcoord][ty][13] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY20[13]),
        .Q(\vertDataC_reg[texcoord][ty] [13]),
        .R(1'b0));
  FDRE \vertDataC_reg[texcoord][ty][14] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY20[14]),
        .Q(\vertDataC_reg[texcoord][ty] [14]),
        .R(1'b0));
  FDRE \vertDataC_reg[texcoord][ty][15] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY20[15]),
        .Q(\vertDataC_reg[texcoord][ty] [15]),
        .R(1'b0));
  FDRE \vertDataC_reg[texcoord][ty][16] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY20[16]),
        .Q(\vertDataC_reg[texcoord][ty] [16]),
        .R(1'b0));
  FDRE \vertDataC_reg[texcoord][ty][17] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY20[17]),
        .Q(\vertDataC_reg[texcoord][ty] [17]),
        .R(1'b0));
  FDRE \vertDataC_reg[texcoord][ty][18] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY20[18]),
        .Q(\vertDataC_reg[texcoord][ty] [18]),
        .R(1'b0));
  FDRE \vertDataC_reg[texcoord][ty][19] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY20[19]),
        .Q(\vertDataC_reg[texcoord][ty] [19]),
        .R(1'b0));
  FDRE \vertDataC_reg[texcoord][ty][1] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY20[1]),
        .Q(\vertDataC_reg[texcoord][ty] [1]),
        .R(1'b0));
  FDRE \vertDataC_reg[texcoord][ty][20] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY20[20]),
        .Q(\vertDataC_reg[texcoord][ty] [20]),
        .R(1'b0));
  FDRE \vertDataC_reg[texcoord][ty][21] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY20[21]),
        .Q(\vertDataC_reg[texcoord][ty] [21]),
        .R(1'b0));
  FDRE \vertDataC_reg[texcoord][ty][22] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY20[22]),
        .Q(\vertDataC_reg[texcoord][ty] [22]),
        .R(1'b0));
  FDRE \vertDataC_reg[texcoord][ty][23] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY20[23]),
        .Q(\vertDataC_reg[texcoord][ty] [23]),
        .R(1'b0));
  FDRE \vertDataC_reg[texcoord][ty][24] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY20[24]),
        .Q(\vertDataC_reg[texcoord][ty] [24]),
        .R(1'b0));
  FDRE \vertDataC_reg[texcoord][ty][25] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY20[25]),
        .Q(\vertDataC_reg[texcoord][ty] [25]),
        .R(1'b0));
  FDRE \vertDataC_reg[texcoord][ty][26] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY20[26]),
        .Q(\vertDataC_reg[texcoord][ty] [26]),
        .R(1'b0));
  FDRE \vertDataC_reg[texcoord][ty][27] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY20[27]),
        .Q(\vertDataC_reg[texcoord][ty] [27]),
        .R(1'b0));
  FDRE \vertDataC_reg[texcoord][ty][28] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY20[28]),
        .Q(\vertDataC_reg[texcoord][ty] [28]),
        .R(1'b0));
  FDRE \vertDataC_reg[texcoord][ty][29] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY20[29]),
        .Q(\vertDataC_reg[texcoord][ty] [29]),
        .R(1'b0));
  FDRE \vertDataC_reg[texcoord][ty][2] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY20[2]),
        .Q(\vertDataC_reg[texcoord][ty] [2]),
        .R(1'b0));
  FDRE \vertDataC_reg[texcoord][ty][30] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY20[30]),
        .Q(\vertDataC_reg[texcoord][ty] [30]),
        .R(1'b0));
  FDRE \vertDataC_reg[texcoord][ty][31] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY20[31]),
        .Q(\vertDataC_reg[texcoord][ty] [31]),
        .R(1'b0));
  FDRE \vertDataC_reg[texcoord][ty][3] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY20[3]),
        .Q(\vertDataC_reg[texcoord][ty] [3]),
        .R(1'b0));
  FDRE \vertDataC_reg[texcoord][ty][4] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY20[4]),
        .Q(\vertDataC_reg[texcoord][ty] [4]),
        .R(1'b0));
  FDRE \vertDataC_reg[texcoord][ty][5] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY20[5]),
        .Q(\vertDataC_reg[texcoord][ty] [5]),
        .R(1'b0));
  FDRE \vertDataC_reg[texcoord][ty][6] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY20[6]),
        .Q(\vertDataC_reg[texcoord][ty] [6]),
        .R(1'b0));
  FDRE \vertDataC_reg[texcoord][ty][7] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY20[7]),
        .Q(\vertDataC_reg[texcoord][ty] [7]),
        .R(1'b0));
  FDRE \vertDataC_reg[texcoord][ty][8] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY20[8]),
        .Q(\vertDataC_reg[texcoord][ty] [8]),
        .R(1'b0));
  FDRE \vertDataC_reg[texcoord][ty][9] 
       (.C(clk),
        .CE(readyForNewTri_i_1_n_0),
        .D(TRISETUP_inTY20[9]),
        .Q(\vertDataC_reg[texcoord][ty] [9]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0000100000000000)) 
    \writeOutPixelData[barycentricB][31]_i_1 
       (.I0(currentState__0[1]),
        .I1(currentState__0[2]),
        .I2(currentState__0[0]),
        .I3(\currentState[2]__0_i_4_n_0 ),
        .I4(\writeOutPixelData[barycentricB][31]_i_3_n_0 ),
        .I5(fifoWriteEnable1__1),
        .O(\writeOutPixelData[barycentricB] ));
  LUT3 #(
    .INIT(8'h10)) 
    \writeOutPixelData[barycentricB][31]_i_3 
       (.I0(RASTOUT_FIFO_full),
        .I1(RASTOUT_FIFO_almost_full),
        .I2(hasWrittenPixelsForThisTriangle_reg_n_0),
        .O(\writeOutPixelData[barycentricB][31]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h01)) 
    \writeOutPixelData[barycentricB][31]_i_4 
       (.I0(DBG_BarycentricA[31]),
        .I1(DBG_BarycentricB[31]),
        .I2(DBG_BarycentricC[31]),
        .O(fifoWriteEnable1__1));
  LUT2 #(
    .INIT(4'h9)) 
    \writeOutPixelData[barycentricB][7]_i_2 
       (.I0(isTopLeftEdgeB),
        .I1(DBG_BarycentricB[0]),
        .O(\writeOutPixelData[barycentricB][7]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \writeOutPixelData[barycentricC][7]_i_2 
       (.I0(isTopLeftEdgeC),
        .I1(DBG_BarycentricC[0]),
        .O(\writeOutPixelData[barycentricC][7]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[barycentricB][0] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\writeOutPixelData_reg[barycentricB][7]_i_1_n_15 ),
        .Q(\writeOutPixelData_reg[barycentricB] [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[barycentricB][10] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\writeOutPixelData_reg[barycentricB][15]_i_1_n_13 ),
        .Q(\writeOutPixelData_reg[barycentricB] [10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[barycentricB][11] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\writeOutPixelData_reg[barycentricB][15]_i_1_n_12 ),
        .Q(\writeOutPixelData_reg[barycentricB] [11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[barycentricB][12] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\writeOutPixelData_reg[barycentricB][15]_i_1_n_11 ),
        .Q(\writeOutPixelData_reg[barycentricB] [12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[barycentricB][13] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\writeOutPixelData_reg[barycentricB][15]_i_1_n_10 ),
        .Q(\writeOutPixelData_reg[barycentricB] [13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[barycentricB][14] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\writeOutPixelData_reg[barycentricB][15]_i_1_n_9 ),
        .Q(\writeOutPixelData_reg[barycentricB] [14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[barycentricB][15] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\writeOutPixelData_reg[barycentricB][15]_i_1_n_8 ),
        .Q(\writeOutPixelData_reg[barycentricB] [15]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY8 \writeOutPixelData_reg[barycentricB][15]_i_1 
       (.CI(\writeOutPixelData_reg[barycentricB][7]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\writeOutPixelData_reg[barycentricB][15]_i_1_n_0 ,\writeOutPixelData_reg[barycentricB][15]_i_1_n_1 ,\writeOutPixelData_reg[barycentricB][15]_i_1_n_2 ,\writeOutPixelData_reg[barycentricB][15]_i_1_n_3 ,\writeOutPixelData_reg[barycentricB][15]_i_1_n_4 ,\writeOutPixelData_reg[barycentricB][15]_i_1_n_5 ,\writeOutPixelData_reg[barycentricB][15]_i_1_n_6 ,\writeOutPixelData_reg[barycentricB][15]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\writeOutPixelData_reg[barycentricB][15]_i_1_n_8 ,\writeOutPixelData_reg[barycentricB][15]_i_1_n_9 ,\writeOutPixelData_reg[barycentricB][15]_i_1_n_10 ,\writeOutPixelData_reg[barycentricB][15]_i_1_n_11 ,\writeOutPixelData_reg[barycentricB][15]_i_1_n_12 ,\writeOutPixelData_reg[barycentricB][15]_i_1_n_13 ,\writeOutPixelData_reg[barycentricB][15]_i_1_n_14 ,\writeOutPixelData_reg[barycentricB][15]_i_1_n_15 }),
        .S(DBG_BarycentricB[15:8]));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[barycentricB][16] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\writeOutPixelData_reg[barycentricB][23]_i_1_n_15 ),
        .Q(\writeOutPixelData_reg[barycentricB] [16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[barycentricB][17] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\writeOutPixelData_reg[barycentricB][23]_i_1_n_14 ),
        .Q(\writeOutPixelData_reg[barycentricB] [17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[barycentricB][18] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\writeOutPixelData_reg[barycentricB][23]_i_1_n_13 ),
        .Q(\writeOutPixelData_reg[barycentricB] [18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[barycentricB][19] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\writeOutPixelData_reg[barycentricB][23]_i_1_n_12 ),
        .Q(\writeOutPixelData_reg[barycentricB] [19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[barycentricB][1] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\writeOutPixelData_reg[barycentricB][7]_i_1_n_14 ),
        .Q(\writeOutPixelData_reg[barycentricB] [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[barycentricB][20] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\writeOutPixelData_reg[barycentricB][23]_i_1_n_11 ),
        .Q(\writeOutPixelData_reg[barycentricB] [20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[barycentricB][21] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\writeOutPixelData_reg[barycentricB][23]_i_1_n_10 ),
        .Q(\writeOutPixelData_reg[barycentricB] [21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[barycentricB][22] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\writeOutPixelData_reg[barycentricB][23]_i_1_n_9 ),
        .Q(\writeOutPixelData_reg[barycentricB] [22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[barycentricB][23] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\writeOutPixelData_reg[barycentricB][23]_i_1_n_8 ),
        .Q(\writeOutPixelData_reg[barycentricB] [23]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY8 \writeOutPixelData_reg[barycentricB][23]_i_1 
       (.CI(\writeOutPixelData_reg[barycentricB][15]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\writeOutPixelData_reg[barycentricB][23]_i_1_n_0 ,\writeOutPixelData_reg[barycentricB][23]_i_1_n_1 ,\writeOutPixelData_reg[barycentricB][23]_i_1_n_2 ,\writeOutPixelData_reg[barycentricB][23]_i_1_n_3 ,\writeOutPixelData_reg[barycentricB][23]_i_1_n_4 ,\writeOutPixelData_reg[barycentricB][23]_i_1_n_5 ,\writeOutPixelData_reg[barycentricB][23]_i_1_n_6 ,\writeOutPixelData_reg[barycentricB][23]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\writeOutPixelData_reg[barycentricB][23]_i_1_n_8 ,\writeOutPixelData_reg[barycentricB][23]_i_1_n_9 ,\writeOutPixelData_reg[barycentricB][23]_i_1_n_10 ,\writeOutPixelData_reg[barycentricB][23]_i_1_n_11 ,\writeOutPixelData_reg[barycentricB][23]_i_1_n_12 ,\writeOutPixelData_reg[barycentricB][23]_i_1_n_13 ,\writeOutPixelData_reg[barycentricB][23]_i_1_n_14 ,\writeOutPixelData_reg[barycentricB][23]_i_1_n_15 }),
        .S(DBG_BarycentricB[23:16]));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[barycentricB][24] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\writeOutPixelData_reg[barycentricB][31]_i_2_n_15 ),
        .Q(\writeOutPixelData_reg[barycentricB] [24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[barycentricB][25] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\writeOutPixelData_reg[barycentricB][31]_i_2_n_14 ),
        .Q(\writeOutPixelData_reg[barycentricB] [25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[barycentricB][26] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\writeOutPixelData_reg[barycentricB][31]_i_2_n_13 ),
        .Q(\writeOutPixelData_reg[barycentricB] [26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[barycentricB][27] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\writeOutPixelData_reg[barycentricB][31]_i_2_n_12 ),
        .Q(\writeOutPixelData_reg[barycentricB] [27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[barycentricB][28] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\writeOutPixelData_reg[barycentricB][31]_i_2_n_11 ),
        .Q(\writeOutPixelData_reg[barycentricB] [28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[barycentricB][29] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\writeOutPixelData_reg[barycentricB][31]_i_2_n_10 ),
        .Q(\writeOutPixelData_reg[barycentricB] [29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[barycentricB][2] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\writeOutPixelData_reg[barycentricB][7]_i_1_n_13 ),
        .Q(\writeOutPixelData_reg[barycentricB] [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[barycentricB][30] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\writeOutPixelData_reg[barycentricB][31]_i_2_n_9 ),
        .Q(\writeOutPixelData_reg[barycentricB] [30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[barycentricB][31] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\writeOutPixelData_reg[barycentricB][31]_i_2_n_8 ),
        .Q(\writeOutPixelData_reg[barycentricB] [31]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY8 \writeOutPixelData_reg[barycentricB][31]_i_2 
       (.CI(\writeOutPixelData_reg[barycentricB][23]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\NLW_writeOutPixelData_reg[barycentricB][31]_i_2_CO_UNCONNECTED [7],\writeOutPixelData_reg[barycentricB][31]_i_2_n_1 ,\writeOutPixelData_reg[barycentricB][31]_i_2_n_2 ,\writeOutPixelData_reg[barycentricB][31]_i_2_n_3 ,\writeOutPixelData_reg[barycentricB][31]_i_2_n_4 ,\writeOutPixelData_reg[barycentricB][31]_i_2_n_5 ,\writeOutPixelData_reg[barycentricB][31]_i_2_n_6 ,\writeOutPixelData_reg[barycentricB][31]_i_2_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\writeOutPixelData_reg[barycentricB][31]_i_2_n_8 ,\writeOutPixelData_reg[barycentricB][31]_i_2_n_9 ,\writeOutPixelData_reg[barycentricB][31]_i_2_n_10 ,\writeOutPixelData_reg[barycentricB][31]_i_2_n_11 ,\writeOutPixelData_reg[barycentricB][31]_i_2_n_12 ,\writeOutPixelData_reg[barycentricB][31]_i_2_n_13 ,\writeOutPixelData_reg[barycentricB][31]_i_2_n_14 ,\writeOutPixelData_reg[barycentricB][31]_i_2_n_15 }),
        .S(DBG_BarycentricB[31:24]));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[barycentricB][3] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\writeOutPixelData_reg[barycentricB][7]_i_1_n_12 ),
        .Q(\writeOutPixelData_reg[barycentricB] [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[barycentricB][4] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\writeOutPixelData_reg[barycentricB][7]_i_1_n_11 ),
        .Q(\writeOutPixelData_reg[barycentricB] [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[barycentricB][5] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\writeOutPixelData_reg[barycentricB][7]_i_1_n_10 ),
        .Q(\writeOutPixelData_reg[barycentricB] [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[barycentricB][6] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\writeOutPixelData_reg[barycentricB][7]_i_1_n_9 ),
        .Q(\writeOutPixelData_reg[barycentricB] [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[barycentricB][7] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\writeOutPixelData_reg[barycentricB][7]_i_1_n_8 ),
        .Q(\writeOutPixelData_reg[barycentricB] [7]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY8 \writeOutPixelData_reg[barycentricB][7]_i_1 
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({\writeOutPixelData_reg[barycentricB][7]_i_1_n_0 ,\writeOutPixelData_reg[barycentricB][7]_i_1_n_1 ,\writeOutPixelData_reg[barycentricB][7]_i_1_n_2 ,\writeOutPixelData_reg[barycentricB][7]_i_1_n_3 ,\writeOutPixelData_reg[barycentricB][7]_i_1_n_4 ,\writeOutPixelData_reg[barycentricB][7]_i_1_n_5 ,\writeOutPixelData_reg[barycentricB][7]_i_1_n_6 ,\writeOutPixelData_reg[barycentricB][7]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,DBG_BarycentricB[0]}),
        .O({\writeOutPixelData_reg[barycentricB][7]_i_1_n_8 ,\writeOutPixelData_reg[barycentricB][7]_i_1_n_9 ,\writeOutPixelData_reg[barycentricB][7]_i_1_n_10 ,\writeOutPixelData_reg[barycentricB][7]_i_1_n_11 ,\writeOutPixelData_reg[barycentricB][7]_i_1_n_12 ,\writeOutPixelData_reg[barycentricB][7]_i_1_n_13 ,\writeOutPixelData_reg[barycentricB][7]_i_1_n_14 ,\writeOutPixelData_reg[barycentricB][7]_i_1_n_15 }),
        .S({DBG_BarycentricB[7:1],\writeOutPixelData[barycentricB][7]_i_2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[barycentricB][8] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\writeOutPixelData_reg[barycentricB][15]_i_1_n_15 ),
        .Q(\writeOutPixelData_reg[barycentricB] [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[barycentricB][9] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\writeOutPixelData_reg[barycentricB][15]_i_1_n_14 ),
        .Q(\writeOutPixelData_reg[barycentricB] [9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[barycentricC][0] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\writeOutPixelData_reg[barycentricC][7]_i_1_n_15 ),
        .Q(\writeOutPixelData_reg[barycentricC] [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[barycentricC][10] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\writeOutPixelData_reg[barycentricC][15]_i_1_n_13 ),
        .Q(\writeOutPixelData_reg[barycentricC] [10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[barycentricC][11] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\writeOutPixelData_reg[barycentricC][15]_i_1_n_12 ),
        .Q(\writeOutPixelData_reg[barycentricC] [11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[barycentricC][12] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\writeOutPixelData_reg[barycentricC][15]_i_1_n_11 ),
        .Q(\writeOutPixelData_reg[barycentricC] [12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[barycentricC][13] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\writeOutPixelData_reg[barycentricC][15]_i_1_n_10 ),
        .Q(\writeOutPixelData_reg[barycentricC] [13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[barycentricC][14] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\writeOutPixelData_reg[barycentricC][15]_i_1_n_9 ),
        .Q(\writeOutPixelData_reg[barycentricC] [14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[barycentricC][15] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\writeOutPixelData_reg[barycentricC][15]_i_1_n_8 ),
        .Q(\writeOutPixelData_reg[barycentricC] [15]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY8 \writeOutPixelData_reg[barycentricC][15]_i_1 
       (.CI(\writeOutPixelData_reg[barycentricC][7]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\writeOutPixelData_reg[barycentricC][15]_i_1_n_0 ,\writeOutPixelData_reg[barycentricC][15]_i_1_n_1 ,\writeOutPixelData_reg[barycentricC][15]_i_1_n_2 ,\writeOutPixelData_reg[barycentricC][15]_i_1_n_3 ,\writeOutPixelData_reg[barycentricC][15]_i_1_n_4 ,\writeOutPixelData_reg[barycentricC][15]_i_1_n_5 ,\writeOutPixelData_reg[barycentricC][15]_i_1_n_6 ,\writeOutPixelData_reg[barycentricC][15]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\writeOutPixelData_reg[barycentricC][15]_i_1_n_8 ,\writeOutPixelData_reg[barycentricC][15]_i_1_n_9 ,\writeOutPixelData_reg[barycentricC][15]_i_1_n_10 ,\writeOutPixelData_reg[barycentricC][15]_i_1_n_11 ,\writeOutPixelData_reg[barycentricC][15]_i_1_n_12 ,\writeOutPixelData_reg[barycentricC][15]_i_1_n_13 ,\writeOutPixelData_reg[barycentricC][15]_i_1_n_14 ,\writeOutPixelData_reg[barycentricC][15]_i_1_n_15 }),
        .S(DBG_BarycentricC[15:8]));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[barycentricC][16] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\writeOutPixelData_reg[barycentricC][23]_i_1_n_15 ),
        .Q(\writeOutPixelData_reg[barycentricC] [16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[barycentricC][17] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\writeOutPixelData_reg[barycentricC][23]_i_1_n_14 ),
        .Q(\writeOutPixelData_reg[barycentricC] [17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[barycentricC][18] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\writeOutPixelData_reg[barycentricC][23]_i_1_n_13 ),
        .Q(\writeOutPixelData_reg[barycentricC] [18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[barycentricC][19] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\writeOutPixelData_reg[barycentricC][23]_i_1_n_12 ),
        .Q(\writeOutPixelData_reg[barycentricC] [19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[barycentricC][1] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\writeOutPixelData_reg[barycentricC][7]_i_1_n_14 ),
        .Q(\writeOutPixelData_reg[barycentricC] [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[barycentricC][20] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\writeOutPixelData_reg[barycentricC][23]_i_1_n_11 ),
        .Q(\writeOutPixelData_reg[barycentricC] [20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[barycentricC][21] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\writeOutPixelData_reg[barycentricC][23]_i_1_n_10 ),
        .Q(\writeOutPixelData_reg[barycentricC] [21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[barycentricC][22] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\writeOutPixelData_reg[barycentricC][23]_i_1_n_9 ),
        .Q(\writeOutPixelData_reg[barycentricC] [22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[barycentricC][23] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\writeOutPixelData_reg[barycentricC][23]_i_1_n_8 ),
        .Q(\writeOutPixelData_reg[barycentricC] [23]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY8 \writeOutPixelData_reg[barycentricC][23]_i_1 
       (.CI(\writeOutPixelData_reg[barycentricC][15]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\writeOutPixelData_reg[barycentricC][23]_i_1_n_0 ,\writeOutPixelData_reg[barycentricC][23]_i_1_n_1 ,\writeOutPixelData_reg[barycentricC][23]_i_1_n_2 ,\writeOutPixelData_reg[barycentricC][23]_i_1_n_3 ,\writeOutPixelData_reg[barycentricC][23]_i_1_n_4 ,\writeOutPixelData_reg[barycentricC][23]_i_1_n_5 ,\writeOutPixelData_reg[barycentricC][23]_i_1_n_6 ,\writeOutPixelData_reg[barycentricC][23]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\writeOutPixelData_reg[barycentricC][23]_i_1_n_8 ,\writeOutPixelData_reg[barycentricC][23]_i_1_n_9 ,\writeOutPixelData_reg[barycentricC][23]_i_1_n_10 ,\writeOutPixelData_reg[barycentricC][23]_i_1_n_11 ,\writeOutPixelData_reg[barycentricC][23]_i_1_n_12 ,\writeOutPixelData_reg[barycentricC][23]_i_1_n_13 ,\writeOutPixelData_reg[barycentricC][23]_i_1_n_14 ,\writeOutPixelData_reg[barycentricC][23]_i_1_n_15 }),
        .S(DBG_BarycentricC[23:16]));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[barycentricC][24] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\writeOutPixelData_reg[barycentricC][31]_i_1_n_15 ),
        .Q(\writeOutPixelData_reg[barycentricC] [24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[barycentricC][25] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\writeOutPixelData_reg[barycentricC][31]_i_1_n_14 ),
        .Q(\writeOutPixelData_reg[barycentricC] [25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[barycentricC][26] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\writeOutPixelData_reg[barycentricC][31]_i_1_n_13 ),
        .Q(\writeOutPixelData_reg[barycentricC] [26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[barycentricC][27] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\writeOutPixelData_reg[barycentricC][31]_i_1_n_12 ),
        .Q(\writeOutPixelData_reg[barycentricC] [27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[barycentricC][28] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\writeOutPixelData_reg[barycentricC][31]_i_1_n_11 ),
        .Q(\writeOutPixelData_reg[barycentricC] [28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[barycentricC][29] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\writeOutPixelData_reg[barycentricC][31]_i_1_n_10 ),
        .Q(\writeOutPixelData_reg[barycentricC] [29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[barycentricC][2] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\writeOutPixelData_reg[barycentricC][7]_i_1_n_13 ),
        .Q(\writeOutPixelData_reg[barycentricC] [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[barycentricC][30] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\writeOutPixelData_reg[barycentricC][31]_i_1_n_9 ),
        .Q(\writeOutPixelData_reg[barycentricC] [30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[barycentricC][31] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\writeOutPixelData_reg[barycentricC][31]_i_1_n_8 ),
        .Q(\writeOutPixelData_reg[barycentricC] [31]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY8 \writeOutPixelData_reg[barycentricC][31]_i_1 
       (.CI(\writeOutPixelData_reg[barycentricC][23]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\NLW_writeOutPixelData_reg[barycentricC][31]_i_1_CO_UNCONNECTED [7],\writeOutPixelData_reg[barycentricC][31]_i_1_n_1 ,\writeOutPixelData_reg[barycentricC][31]_i_1_n_2 ,\writeOutPixelData_reg[barycentricC][31]_i_1_n_3 ,\writeOutPixelData_reg[barycentricC][31]_i_1_n_4 ,\writeOutPixelData_reg[barycentricC][31]_i_1_n_5 ,\writeOutPixelData_reg[barycentricC][31]_i_1_n_6 ,\writeOutPixelData_reg[barycentricC][31]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\writeOutPixelData_reg[barycentricC][31]_i_1_n_8 ,\writeOutPixelData_reg[barycentricC][31]_i_1_n_9 ,\writeOutPixelData_reg[barycentricC][31]_i_1_n_10 ,\writeOutPixelData_reg[barycentricC][31]_i_1_n_11 ,\writeOutPixelData_reg[barycentricC][31]_i_1_n_12 ,\writeOutPixelData_reg[barycentricC][31]_i_1_n_13 ,\writeOutPixelData_reg[barycentricC][31]_i_1_n_14 ,\writeOutPixelData_reg[barycentricC][31]_i_1_n_15 }),
        .S(DBG_BarycentricC[31:24]));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[barycentricC][3] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\writeOutPixelData_reg[barycentricC][7]_i_1_n_12 ),
        .Q(\writeOutPixelData_reg[barycentricC] [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[barycentricC][4] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\writeOutPixelData_reg[barycentricC][7]_i_1_n_11 ),
        .Q(\writeOutPixelData_reg[barycentricC] [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[barycentricC][5] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\writeOutPixelData_reg[barycentricC][7]_i_1_n_10 ),
        .Q(\writeOutPixelData_reg[barycentricC] [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[barycentricC][6] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\writeOutPixelData_reg[barycentricC][7]_i_1_n_9 ),
        .Q(\writeOutPixelData_reg[barycentricC] [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[barycentricC][7] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\writeOutPixelData_reg[barycentricC][7]_i_1_n_8 ),
        .Q(\writeOutPixelData_reg[barycentricC] [7]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY8 \writeOutPixelData_reg[barycentricC][7]_i_1 
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({\writeOutPixelData_reg[barycentricC][7]_i_1_n_0 ,\writeOutPixelData_reg[barycentricC][7]_i_1_n_1 ,\writeOutPixelData_reg[barycentricC][7]_i_1_n_2 ,\writeOutPixelData_reg[barycentricC][7]_i_1_n_3 ,\writeOutPixelData_reg[barycentricC][7]_i_1_n_4 ,\writeOutPixelData_reg[barycentricC][7]_i_1_n_5 ,\writeOutPixelData_reg[barycentricC][7]_i_1_n_6 ,\writeOutPixelData_reg[barycentricC][7]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,DBG_BarycentricC[0]}),
        .O({\writeOutPixelData_reg[barycentricC][7]_i_1_n_8 ,\writeOutPixelData_reg[barycentricC][7]_i_1_n_9 ,\writeOutPixelData_reg[barycentricC][7]_i_1_n_10 ,\writeOutPixelData_reg[barycentricC][7]_i_1_n_11 ,\writeOutPixelData_reg[barycentricC][7]_i_1_n_12 ,\writeOutPixelData_reg[barycentricC][7]_i_1_n_13 ,\writeOutPixelData_reg[barycentricC][7]_i_1_n_14 ,\writeOutPixelData_reg[barycentricC][7]_i_1_n_15 }),
        .S({DBG_BarycentricC[7:1],\writeOutPixelData[barycentricC][7]_i_2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[barycentricC][8] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\writeOutPixelData_reg[barycentricC][15]_i_1_n_15 ),
        .Q(\writeOutPixelData_reg[barycentricC] [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[barycentricC][9] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\writeOutPixelData_reg[barycentricC][15]_i_1_n_14 ),
        .Q(\writeOutPixelData_reg[barycentricC] [9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[pixelX][0] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\pixelXPos_reg[15]_0 [0]),
        .Q(\writeOutPixelData_reg[pixelX] [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[pixelX][10] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\pixelXPos_reg[15]_0 [10]),
        .Q(\writeOutPixelData_reg[pixelX] [10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[pixelX][11] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\pixelXPos_reg[15]_0 [11]),
        .Q(\writeOutPixelData_reg[pixelX] [11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[pixelX][12] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\pixelXPos_reg[15]_0 [12]),
        .Q(\writeOutPixelData_reg[pixelX] [12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[pixelX][13] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\pixelXPos_reg[15]_0 [13]),
        .Q(\writeOutPixelData_reg[pixelX] [13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[pixelX][14] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\pixelXPos_reg[15]_0 [14]),
        .Q(\writeOutPixelData_reg[pixelX] [14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[pixelX][15] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\pixelXPos_reg[15]_0 [15]),
        .Q(\writeOutPixelData_reg[pixelX] [15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[pixelX][1] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\pixelXPos_reg[15]_0 [1]),
        .Q(\writeOutPixelData_reg[pixelX] [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[pixelX][2] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\pixelXPos_reg[15]_0 [2]),
        .Q(\writeOutPixelData_reg[pixelX] [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[pixelX][3] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\pixelXPos_reg[15]_0 [3]),
        .Q(\writeOutPixelData_reg[pixelX] [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[pixelX][4] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\pixelXPos_reg[15]_0 [4]),
        .Q(\writeOutPixelData_reg[pixelX] [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[pixelX][5] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\pixelXPos_reg[15]_0 [5]),
        .Q(\writeOutPixelData_reg[pixelX] [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[pixelX][6] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\pixelXPos_reg[15]_0 [6]),
        .Q(\writeOutPixelData_reg[pixelX] [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[pixelX][7] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\pixelXPos_reg[15]_0 [7]),
        .Q(\writeOutPixelData_reg[pixelX] [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[pixelX][8] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\pixelXPos_reg[15]_0 [8]),
        .Q(\writeOutPixelData_reg[pixelX] [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[pixelX][9] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(\pixelXPos_reg[15]_0 [9]),
        .Q(\writeOutPixelData_reg[pixelX] [9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[pixelY][0] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(Q[0]),
        .Q(\writeOutPixelData_reg[pixelY] [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[pixelY][10] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(Q[10]),
        .Q(\writeOutPixelData_reg[pixelY] [10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[pixelY][11] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(Q[11]),
        .Q(\writeOutPixelData_reg[pixelY] [11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[pixelY][12] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(Q[12]),
        .Q(\writeOutPixelData_reg[pixelY] [12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[pixelY][13] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(Q[13]),
        .Q(\writeOutPixelData_reg[pixelY] [13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[pixelY][14] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(Q[14]),
        .Q(\writeOutPixelData_reg[pixelY] [14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[pixelY][15] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(Q[15]),
        .Q(\writeOutPixelData_reg[pixelY] [15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[pixelY][1] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(Q[1]),
        .Q(\writeOutPixelData_reg[pixelY] [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[pixelY][2] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(Q[2]),
        .Q(\writeOutPixelData_reg[pixelY] [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[pixelY][3] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(Q[3]),
        .Q(\writeOutPixelData_reg[pixelY] [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[pixelY][4] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(Q[4]),
        .Q(\writeOutPixelData_reg[pixelY] [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[pixelY][5] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(Q[5]),
        .Q(\writeOutPixelData_reg[pixelY] [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[pixelY][6] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(Q[6]),
        .Q(\writeOutPixelData_reg[pixelY] [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[pixelY][7] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(Q[7]),
        .Q(\writeOutPixelData_reg[pixelY] [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[pixelY][8] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(Q[8]),
        .Q(\writeOutPixelData_reg[pixelY] [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeOutPixelData_reg[pixelY][9] 
       (.C(clk),
        .CE(\writeOutPixelData[barycentricB] ),
        .D(Q[9]),
        .Q(\writeOutPixelData_reg[pixelY] [9]),
        .R(1'b0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
