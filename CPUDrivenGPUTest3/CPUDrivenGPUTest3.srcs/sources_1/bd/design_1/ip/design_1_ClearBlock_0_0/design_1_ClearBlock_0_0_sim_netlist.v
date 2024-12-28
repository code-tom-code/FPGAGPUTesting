// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Thu Oct 10 00:23:03 2024
// Host        : Dragon2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_ClearBlock_0_0/design_1_ClearBlock_0_0_sim_netlist.v
// Design      : design_1_ClearBlock_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_ClearBlock_0_0,ClearBlock,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "ClearBlock,Vivado 2018.1_AR73068" *) 
(* NotValidForBitStream *)
module design_1_ClearBlock_0_0
   (clk,
    CMD_ClearBlockIsIdle,
    CMD_ClearBlockBeginSignal,
    CMD_BaseRenderTargetAddr,
    CMD_ClearColorRGBA,
    CMD_ClearDRAMLineCount,
    MEM_ClearBlockWriteRequestsFIFO_wr_data,
    MEM_ClearBlockWriteRequestsFIFO_full,
    MEM_ClearBlockWriteRequestsFIFO_wr_en,
    DBG_ClearBlock_State,
    DBG_LastWrittenClearData);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk, FREQ_HZ 333250000, PHASE 0.00, CLK_DOMAIN design_1_ddr4_0_1_c0_ddr4_ui_clk" *) input clk;
  output CMD_ClearBlockIsIdle;
  input CMD_ClearBlockBeginSignal;
  input [29:0]CMD_BaseRenderTargetAddr;
  input [31:0]CMD_ClearColorRGBA;
  input [15:0]CMD_ClearDRAMLineCount;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA" *) output [293:0]MEM_ClearBlockWriteRequestsFIFO_wr_data;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO FULL" *) input MEM_ClearBlockWriteRequestsFIFO_full;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_EN" *) output MEM_ClearBlockWriteRequestsFIFO_wr_en;
  output [3:0]DBG_ClearBlock_State;
  output [293:0]DBG_LastWrittenClearData;

  wire \<const0> ;
  wire \<const1> ;
  wire [29:0]CMD_BaseRenderTargetAddr;
  wire CMD_ClearBlockBeginSignal;
  wire CMD_ClearBlockIsIdle;
  wire [31:0]CMD_ClearColorRGBA;
  wire [15:0]CMD_ClearDRAMLineCount;
  wire [0:0]\^DBG_ClearBlock_State ;
  wire [293:8]\^DBG_LastWrittenClearData ;
  wire MEM_ClearBlockWriteRequestsFIFO_full;
  wire MEM_ClearBlockWriteRequestsFIFO_wr_en;
  wire clk;

  assign DBG_ClearBlock_State[3] = \<const0> ;
  assign DBG_ClearBlock_State[2] = \<const0> ;
  assign DBG_ClearBlock_State[1] = \<const0> ;
  assign DBG_ClearBlock_State[0] = \^DBG_ClearBlock_State [0];
  assign DBG_LastWrittenClearData[293:264] = \^DBG_LastWrittenClearData [293:264];
  assign DBG_LastWrittenClearData[263:232] = \^DBG_LastWrittenClearData [39:8];
  assign DBG_LastWrittenClearData[231:200] = \^DBG_LastWrittenClearData [39:8];
  assign DBG_LastWrittenClearData[199:168] = \^DBG_LastWrittenClearData [39:8];
  assign DBG_LastWrittenClearData[167:136] = \^DBG_LastWrittenClearData [39:8];
  assign DBG_LastWrittenClearData[135:104] = \^DBG_LastWrittenClearData [39:8];
  assign DBG_LastWrittenClearData[103:72] = \^DBG_LastWrittenClearData [39:8];
  assign DBG_LastWrittenClearData[71:40] = \^DBG_LastWrittenClearData [39:8];
  assign DBG_LastWrittenClearData[39:8] = \^DBG_LastWrittenClearData [39:8];
  assign DBG_LastWrittenClearData[7] = \<const1> ;
  assign DBG_LastWrittenClearData[6] = \<const1> ;
  assign DBG_LastWrittenClearData[5] = \<const1> ;
  assign DBG_LastWrittenClearData[4] = \<const1> ;
  assign DBG_LastWrittenClearData[3] = \<const1> ;
  assign DBG_LastWrittenClearData[2] = \<const1> ;
  assign DBG_LastWrittenClearData[1] = \<const1> ;
  assign DBG_LastWrittenClearData[0] = \<const1> ;
  assign MEM_ClearBlockWriteRequestsFIFO_wr_data[293:264] = \^DBG_LastWrittenClearData [293:264];
  assign MEM_ClearBlockWriteRequestsFIFO_wr_data[263:232] = \^DBG_LastWrittenClearData [39:8];
  assign MEM_ClearBlockWriteRequestsFIFO_wr_data[231:200] = \^DBG_LastWrittenClearData [39:8];
  assign MEM_ClearBlockWriteRequestsFIFO_wr_data[199:168] = \^DBG_LastWrittenClearData [39:8];
  assign MEM_ClearBlockWriteRequestsFIFO_wr_data[167:136] = \^DBG_LastWrittenClearData [39:8];
  assign MEM_ClearBlockWriteRequestsFIFO_wr_data[135:104] = \^DBG_LastWrittenClearData [39:8];
  assign MEM_ClearBlockWriteRequestsFIFO_wr_data[103:72] = \^DBG_LastWrittenClearData [39:8];
  assign MEM_ClearBlockWriteRequestsFIFO_wr_data[71:40] = \^DBG_LastWrittenClearData [39:8];
  assign MEM_ClearBlockWriteRequestsFIFO_wr_data[39:8] = \^DBG_LastWrittenClearData [39:8];
  assign MEM_ClearBlockWriteRequestsFIFO_wr_data[7] = \<const1> ;
  assign MEM_ClearBlockWriteRequestsFIFO_wr_data[6] = \<const1> ;
  assign MEM_ClearBlockWriteRequestsFIFO_wr_data[5] = \<const1> ;
  assign MEM_ClearBlockWriteRequestsFIFO_wr_data[4] = \<const1> ;
  assign MEM_ClearBlockWriteRequestsFIFO_wr_data[3] = \<const1> ;
  assign MEM_ClearBlockWriteRequestsFIFO_wr_data[2] = \<const1> ;
  assign MEM_ClearBlockWriteRequestsFIFO_wr_data[1] = \<const1> ;
  assign MEM_ClearBlockWriteRequestsFIFO_wr_data[0] = \<const1> ;
  GND GND
       (.G(\<const0> ));
  design_1_ClearBlock_0_0_ClearBlock U0
       (.CMD_BaseRenderTargetAddr(CMD_BaseRenderTargetAddr),
        .CMD_ClearBlockBeginSignal(CMD_ClearBlockBeginSignal),
        .CMD_ClearBlockIsIdle(CMD_ClearBlockIsIdle),
        .CMD_ClearColorRGBA(CMD_ClearColorRGBA),
        .CMD_ClearDRAMLineCount(CMD_ClearDRAMLineCount),
        .\DBG_ClearBlock_State[0] (\^DBG_ClearBlock_State ),
        .DBG_LastWrittenClearData({\^DBG_LastWrittenClearData [293:264],\^DBG_LastWrittenClearData [39:8]}),
        .MEM_ClearBlockWriteRequestsFIFO_full(MEM_ClearBlockWriteRequestsFIFO_full),
        .MEM_ClearBlockWriteRequestsFIFO_wr_en(MEM_ClearBlockWriteRequestsFIFO_wr_en),
        .clk(clk));
  VCC VCC
       (.P(\<const1> ));
endmodule

(* ORIG_REF_NAME = "ClearBlock" *) 
module design_1_ClearBlock_0_0_ClearBlock
   (DBG_LastWrittenClearData,
    \DBG_ClearBlock_State[0] ,
    MEM_ClearBlockWriteRequestsFIFO_wr_en,
    CMD_ClearBlockIsIdle,
    CMD_ClearColorRGBA,
    clk,
    CMD_ClearDRAMLineCount,
    MEM_ClearBlockWriteRequestsFIFO_full,
    CMD_ClearBlockBeginSignal,
    CMD_BaseRenderTargetAddr);
  output [61:0]DBG_LastWrittenClearData;
  output \DBG_ClearBlock_State[0] ;
  output MEM_ClearBlockWriteRequestsFIFO_wr_en;
  output CMD_ClearBlockIsIdle;
  input [31:0]CMD_ClearColorRGBA;
  input clk;
  input [15:0]CMD_ClearDRAMLineCount;
  input MEM_ClearBlockWriteRequestsFIFO_full;
  input CMD_ClearBlockBeginSignal;
  input [29:0]CMD_BaseRenderTargetAddr;

  wire [29:0]CMD_BaseRenderTargetAddr;
  wire CMD_ClearBlockBeginSignal;
  wire CMD_ClearBlockIsIdle;
  wire CMD_ClearBlockIsIdle_i_1_n_0;
  wire [31:0]CMD_ClearColorRGBA;
  wire [15:0]CMD_ClearDRAMLineCount;
  wire \DBG_ClearBlock_State[0] ;
  wire [61:0]DBG_LastWrittenClearData;
  wire MEM_ClearBlockWriteRequestsFIFO_full;
  wire MEM_ClearBlockWriteRequestsFIFO_wr_en;
  wire \clearColorRGBA[31]_i_1_n_0 ;
  wire clearState_i_1_n_0;
  wire clk;
  wire memWriteEnable_i_1_n_0;
  wire \nextWriteAddr[0]_i_1_n_0 ;
  wire \nextWriteAddr[11]_i_2_n_0 ;
  wire \nextWriteAddr[11]_i_3_n_0 ;
  wire \nextWriteAddr[11]_i_4_n_0 ;
  wire \nextWriteAddr[11]_i_5_n_0 ;
  wire \nextWriteAddr[11]_i_6_n_0 ;
  wire \nextWriteAddr[11]_i_7_n_0 ;
  wire \nextWriteAddr[11]_i_8_n_0 ;
  wire \nextWriteAddr[11]_i_9_n_0 ;
  wire \nextWriteAddr[19]_i_2_n_0 ;
  wire \nextWriteAddr[19]_i_3_n_0 ;
  wire \nextWriteAddr[19]_i_4_n_0 ;
  wire \nextWriteAddr[19]_i_5_n_0 ;
  wire \nextWriteAddr[19]_i_6_n_0 ;
  wire \nextWriteAddr[19]_i_7_n_0 ;
  wire \nextWriteAddr[19]_i_8_n_0 ;
  wire \nextWriteAddr[19]_i_9_n_0 ;
  wire \nextWriteAddr[1]_i_1_n_0 ;
  wire \nextWriteAddr[27]_i_2_n_0 ;
  wire \nextWriteAddr[27]_i_3_n_0 ;
  wire \nextWriteAddr[27]_i_4_n_0 ;
  wire \nextWriteAddr[27]_i_5_n_0 ;
  wire \nextWriteAddr[27]_i_6_n_0 ;
  wire \nextWriteAddr[27]_i_7_n_0 ;
  wire \nextWriteAddr[27]_i_8_n_0 ;
  wire \nextWriteAddr[27]_i_9_n_0 ;
  wire \nextWriteAddr[29]_i_3_n_0 ;
  wire \nextWriteAddr[29]_i_4_n_0 ;
  wire \nextWriteAddr[29]_i_5_n_0 ;
  wire \nextWriteAddr[29]_i_6_n_0 ;
  wire \nextWriteAddr[29]_i_7_n_0 ;
  wire \nextWriteAddr[2]_i_1_n_0 ;
  wire \nextWriteAddr[3]_i_1_n_0 ;
  wire \nextWriteAddr_reg[11]_i_1_n_0 ;
  wire \nextWriteAddr_reg[11]_i_1_n_1 ;
  wire \nextWriteAddr_reg[11]_i_1_n_10 ;
  wire \nextWriteAddr_reg[11]_i_1_n_11 ;
  wire \nextWriteAddr_reg[11]_i_1_n_12 ;
  wire \nextWriteAddr_reg[11]_i_1_n_13 ;
  wire \nextWriteAddr_reg[11]_i_1_n_14 ;
  wire \nextWriteAddr_reg[11]_i_1_n_15 ;
  wire \nextWriteAddr_reg[11]_i_1_n_2 ;
  wire \nextWriteAddr_reg[11]_i_1_n_3 ;
  wire \nextWriteAddr_reg[11]_i_1_n_5 ;
  wire \nextWriteAddr_reg[11]_i_1_n_6 ;
  wire \nextWriteAddr_reg[11]_i_1_n_7 ;
  wire \nextWriteAddr_reg[11]_i_1_n_8 ;
  wire \nextWriteAddr_reg[11]_i_1_n_9 ;
  wire \nextWriteAddr_reg[19]_i_1_n_0 ;
  wire \nextWriteAddr_reg[19]_i_1_n_1 ;
  wire \nextWriteAddr_reg[19]_i_1_n_10 ;
  wire \nextWriteAddr_reg[19]_i_1_n_11 ;
  wire \nextWriteAddr_reg[19]_i_1_n_12 ;
  wire \nextWriteAddr_reg[19]_i_1_n_13 ;
  wire \nextWriteAddr_reg[19]_i_1_n_14 ;
  wire \nextWriteAddr_reg[19]_i_1_n_15 ;
  wire \nextWriteAddr_reg[19]_i_1_n_2 ;
  wire \nextWriteAddr_reg[19]_i_1_n_3 ;
  wire \nextWriteAddr_reg[19]_i_1_n_5 ;
  wire \nextWriteAddr_reg[19]_i_1_n_6 ;
  wire \nextWriteAddr_reg[19]_i_1_n_7 ;
  wire \nextWriteAddr_reg[19]_i_1_n_8 ;
  wire \nextWriteAddr_reg[19]_i_1_n_9 ;
  wire \nextWriteAddr_reg[27]_i_1_n_0 ;
  wire \nextWriteAddr_reg[27]_i_1_n_1 ;
  wire \nextWriteAddr_reg[27]_i_1_n_10 ;
  wire \nextWriteAddr_reg[27]_i_1_n_11 ;
  wire \nextWriteAddr_reg[27]_i_1_n_12 ;
  wire \nextWriteAddr_reg[27]_i_1_n_13 ;
  wire \nextWriteAddr_reg[27]_i_1_n_14 ;
  wire \nextWriteAddr_reg[27]_i_1_n_15 ;
  wire \nextWriteAddr_reg[27]_i_1_n_2 ;
  wire \nextWriteAddr_reg[27]_i_1_n_3 ;
  wire \nextWriteAddr_reg[27]_i_1_n_5 ;
  wire \nextWriteAddr_reg[27]_i_1_n_6 ;
  wire \nextWriteAddr_reg[27]_i_1_n_7 ;
  wire \nextWriteAddr_reg[27]_i_1_n_8 ;
  wire \nextWriteAddr_reg[27]_i_1_n_9 ;
  wire \nextWriteAddr_reg[29]_i_2_n_14 ;
  wire \nextWriteAddr_reg[29]_i_2_n_15 ;
  wire \nextWriteAddr_reg[29]_i_2_n_7 ;
  wire [15:0]p_0_in;
  wire remainingDRAMLines;
  wire \remainingDRAMLines[10]_i_2_n_0 ;
  wire \remainingDRAMLines[13]_i_2_n_0 ;
  wire \remainingDRAMLines[15]_i_2_n_0 ;
  wire \remainingDRAMLines[15]_i_3_n_0 ;
  wire \remainingDRAMLines[6]_i_2_n_0 ;
  wire \remainingDRAMLines[7]_i_2_n_0 ;
  wire [15:0]remainingDRAMLines_reg__0;
  wire [3:3]\NLW_nextWriteAddr_reg[11]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_nextWriteAddr_reg[19]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_nextWriteAddr_reg[27]_i_1_CO_UNCONNECTED ;
  wire [7:1]\NLW_nextWriteAddr_reg[29]_i_2_CO_UNCONNECTED ;
  wire [7:2]\NLW_nextWriteAddr_reg[29]_i_2_O_UNCONNECTED ;

  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h8B)) 
    CMD_ClearBlockIsIdle_i_1
       (.I0(CMD_ClearBlockIsIdle),
        .I1(\DBG_ClearBlock_State[0] ),
        .I2(CMD_ClearBlockBeginSignal),
        .O(CMD_ClearBlockIsIdle_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    CMD_ClearBlockIsIdle_reg
       (.C(clk),
        .CE(1'b1),
        .D(CMD_ClearBlockIsIdle_i_1_n_0),
        .Q(CMD_ClearBlockIsIdle),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h2)) 
    \clearColorRGBA[31]_i_1 
       (.I0(CMD_ClearBlockBeginSignal),
        .I1(\DBG_ClearBlock_State[0] ),
        .O(\clearColorRGBA[31]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA" *) 
  FDRE #(
    .INIT(1'b0)) 
    \clearColorRGBA_reg[0] 
       (.C(clk),
        .CE(\clearColorRGBA[31]_i_1_n_0 ),
        .D(CMD_ClearColorRGBA[0]),
        .Q(DBG_LastWrittenClearData[0]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA" *) 
  FDRE #(
    .INIT(1'b0)) 
    \clearColorRGBA_reg[10] 
       (.C(clk),
        .CE(\clearColorRGBA[31]_i_1_n_0 ),
        .D(CMD_ClearColorRGBA[10]),
        .Q(DBG_LastWrittenClearData[10]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA" *) 
  FDRE #(
    .INIT(1'b0)) 
    \clearColorRGBA_reg[11] 
       (.C(clk),
        .CE(\clearColorRGBA[31]_i_1_n_0 ),
        .D(CMD_ClearColorRGBA[11]),
        .Q(DBG_LastWrittenClearData[11]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA" *) 
  FDRE #(
    .INIT(1'b0)) 
    \clearColorRGBA_reg[12] 
       (.C(clk),
        .CE(\clearColorRGBA[31]_i_1_n_0 ),
        .D(CMD_ClearColorRGBA[12]),
        .Q(DBG_LastWrittenClearData[12]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA" *) 
  FDRE #(
    .INIT(1'b0)) 
    \clearColorRGBA_reg[13] 
       (.C(clk),
        .CE(\clearColorRGBA[31]_i_1_n_0 ),
        .D(CMD_ClearColorRGBA[13]),
        .Q(DBG_LastWrittenClearData[13]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA" *) 
  FDRE #(
    .INIT(1'b0)) 
    \clearColorRGBA_reg[14] 
       (.C(clk),
        .CE(\clearColorRGBA[31]_i_1_n_0 ),
        .D(CMD_ClearColorRGBA[14]),
        .Q(DBG_LastWrittenClearData[14]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA" *) 
  FDRE #(
    .INIT(1'b0)) 
    \clearColorRGBA_reg[15] 
       (.C(clk),
        .CE(\clearColorRGBA[31]_i_1_n_0 ),
        .D(CMD_ClearColorRGBA[15]),
        .Q(DBG_LastWrittenClearData[15]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA" *) 
  FDRE #(
    .INIT(1'b0)) 
    \clearColorRGBA_reg[16] 
       (.C(clk),
        .CE(\clearColorRGBA[31]_i_1_n_0 ),
        .D(CMD_ClearColorRGBA[16]),
        .Q(DBG_LastWrittenClearData[16]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA" *) 
  FDRE #(
    .INIT(1'b0)) 
    \clearColorRGBA_reg[17] 
       (.C(clk),
        .CE(\clearColorRGBA[31]_i_1_n_0 ),
        .D(CMD_ClearColorRGBA[17]),
        .Q(DBG_LastWrittenClearData[17]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA" *) 
  FDRE #(
    .INIT(1'b0)) 
    \clearColorRGBA_reg[18] 
       (.C(clk),
        .CE(\clearColorRGBA[31]_i_1_n_0 ),
        .D(CMD_ClearColorRGBA[18]),
        .Q(DBG_LastWrittenClearData[18]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA" *) 
  FDRE #(
    .INIT(1'b0)) 
    \clearColorRGBA_reg[19] 
       (.C(clk),
        .CE(\clearColorRGBA[31]_i_1_n_0 ),
        .D(CMD_ClearColorRGBA[19]),
        .Q(DBG_LastWrittenClearData[19]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA" *) 
  FDRE #(
    .INIT(1'b0)) 
    \clearColorRGBA_reg[1] 
       (.C(clk),
        .CE(\clearColorRGBA[31]_i_1_n_0 ),
        .D(CMD_ClearColorRGBA[1]),
        .Q(DBG_LastWrittenClearData[1]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA" *) 
  FDRE #(
    .INIT(1'b0)) 
    \clearColorRGBA_reg[20] 
       (.C(clk),
        .CE(\clearColorRGBA[31]_i_1_n_0 ),
        .D(CMD_ClearColorRGBA[20]),
        .Q(DBG_LastWrittenClearData[20]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA" *) 
  FDRE #(
    .INIT(1'b0)) 
    \clearColorRGBA_reg[21] 
       (.C(clk),
        .CE(\clearColorRGBA[31]_i_1_n_0 ),
        .D(CMD_ClearColorRGBA[21]),
        .Q(DBG_LastWrittenClearData[21]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA" *) 
  FDRE #(
    .INIT(1'b0)) 
    \clearColorRGBA_reg[22] 
       (.C(clk),
        .CE(\clearColorRGBA[31]_i_1_n_0 ),
        .D(CMD_ClearColorRGBA[22]),
        .Q(DBG_LastWrittenClearData[22]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA" *) 
  FDRE #(
    .INIT(1'b0)) 
    \clearColorRGBA_reg[23] 
       (.C(clk),
        .CE(\clearColorRGBA[31]_i_1_n_0 ),
        .D(CMD_ClearColorRGBA[23]),
        .Q(DBG_LastWrittenClearData[23]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA" *) 
  FDRE #(
    .INIT(1'b0)) 
    \clearColorRGBA_reg[24] 
       (.C(clk),
        .CE(\clearColorRGBA[31]_i_1_n_0 ),
        .D(CMD_ClearColorRGBA[24]),
        .Q(DBG_LastWrittenClearData[24]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA" *) 
  FDRE #(
    .INIT(1'b0)) 
    \clearColorRGBA_reg[25] 
       (.C(clk),
        .CE(\clearColorRGBA[31]_i_1_n_0 ),
        .D(CMD_ClearColorRGBA[25]),
        .Q(DBG_LastWrittenClearData[25]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA" *) 
  FDRE #(
    .INIT(1'b0)) 
    \clearColorRGBA_reg[26] 
       (.C(clk),
        .CE(\clearColorRGBA[31]_i_1_n_0 ),
        .D(CMD_ClearColorRGBA[26]),
        .Q(DBG_LastWrittenClearData[26]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA" *) 
  FDRE #(
    .INIT(1'b0)) 
    \clearColorRGBA_reg[27] 
       (.C(clk),
        .CE(\clearColorRGBA[31]_i_1_n_0 ),
        .D(CMD_ClearColorRGBA[27]),
        .Q(DBG_LastWrittenClearData[27]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA" *) 
  FDRE #(
    .INIT(1'b0)) 
    \clearColorRGBA_reg[28] 
       (.C(clk),
        .CE(\clearColorRGBA[31]_i_1_n_0 ),
        .D(CMD_ClearColorRGBA[28]),
        .Q(DBG_LastWrittenClearData[28]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA" *) 
  FDRE #(
    .INIT(1'b0)) 
    \clearColorRGBA_reg[29] 
       (.C(clk),
        .CE(\clearColorRGBA[31]_i_1_n_0 ),
        .D(CMD_ClearColorRGBA[29]),
        .Q(DBG_LastWrittenClearData[29]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA" *) 
  FDRE #(
    .INIT(1'b0)) 
    \clearColorRGBA_reg[2] 
       (.C(clk),
        .CE(\clearColorRGBA[31]_i_1_n_0 ),
        .D(CMD_ClearColorRGBA[2]),
        .Q(DBG_LastWrittenClearData[2]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA" *) 
  FDRE #(
    .INIT(1'b0)) 
    \clearColorRGBA_reg[30] 
       (.C(clk),
        .CE(\clearColorRGBA[31]_i_1_n_0 ),
        .D(CMD_ClearColorRGBA[30]),
        .Q(DBG_LastWrittenClearData[30]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA" *) 
  FDRE #(
    .INIT(1'b0)) 
    \clearColorRGBA_reg[31] 
       (.C(clk),
        .CE(\clearColorRGBA[31]_i_1_n_0 ),
        .D(CMD_ClearColorRGBA[31]),
        .Q(DBG_LastWrittenClearData[31]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA" *) 
  FDRE #(
    .INIT(1'b0)) 
    \clearColorRGBA_reg[3] 
       (.C(clk),
        .CE(\clearColorRGBA[31]_i_1_n_0 ),
        .D(CMD_ClearColorRGBA[3]),
        .Q(DBG_LastWrittenClearData[3]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA" *) 
  FDRE #(
    .INIT(1'b0)) 
    \clearColorRGBA_reg[4] 
       (.C(clk),
        .CE(\clearColorRGBA[31]_i_1_n_0 ),
        .D(CMD_ClearColorRGBA[4]),
        .Q(DBG_LastWrittenClearData[4]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA" *) 
  FDRE #(
    .INIT(1'b0)) 
    \clearColorRGBA_reg[5] 
       (.C(clk),
        .CE(\clearColorRGBA[31]_i_1_n_0 ),
        .D(CMD_ClearColorRGBA[5]),
        .Q(DBG_LastWrittenClearData[5]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA" *) 
  FDRE #(
    .INIT(1'b0)) 
    \clearColorRGBA_reg[6] 
       (.C(clk),
        .CE(\clearColorRGBA[31]_i_1_n_0 ),
        .D(CMD_ClearColorRGBA[6]),
        .Q(DBG_LastWrittenClearData[6]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA" *) 
  FDRE #(
    .INIT(1'b0)) 
    \clearColorRGBA_reg[7] 
       (.C(clk),
        .CE(\clearColorRGBA[31]_i_1_n_0 ),
        .D(CMD_ClearColorRGBA[7]),
        .Q(DBG_LastWrittenClearData[7]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA" *) 
  FDRE #(
    .INIT(1'b0)) 
    \clearColorRGBA_reg[8] 
       (.C(clk),
        .CE(\clearColorRGBA[31]_i_1_n_0 ),
        .D(CMD_ClearColorRGBA[8]),
        .Q(DBG_LastWrittenClearData[8]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA" *) 
  FDRE #(
    .INIT(1'b0)) 
    \clearColorRGBA_reg[9] 
       (.C(clk),
        .CE(\clearColorRGBA[31]_i_1_n_0 ),
        .D(CMD_ClearColorRGBA[9]),
        .Q(DBG_LastWrittenClearData[9]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h74)) 
    clearState_i_1
       (.I0(\nextWriteAddr[29]_i_3_n_0 ),
        .I1(\DBG_ClearBlock_State[0] ),
        .I2(CMD_ClearBlockBeginSignal),
        .O(clearState_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    clearState_reg
       (.C(clk),
        .CE(1'b1),
        .D(clearState_i_1_n_0),
        .Q(\DBG_ClearBlock_State[0] ),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h10)) 
    memWriteEnable_i_1
       (.I0(\nextWriteAddr[29]_i_3_n_0 ),
        .I1(MEM_ClearBlockWriteRequestsFIFO_full),
        .I2(\DBG_ClearBlock_State[0] ),
        .O(memWriteEnable_i_1_n_0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_EN" *) 
  FDRE #(
    .INIT(1'b0)) 
    memWriteEnable_reg
       (.C(clk),
        .CE(1'b1),
        .D(memWriteEnable_i_1_n_0),
        .Q(MEM_ClearBlockWriteRequestsFIFO_wr_en),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \nextWriteAddr[0]_i_1 
       (.I0(DBG_LastWrittenClearData[32]),
        .I1(\DBG_ClearBlock_State[0] ),
        .I2(CMD_BaseRenderTargetAddr[0]),
        .O(\nextWriteAddr[0]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \nextWriteAddr[11]_i_2 
       (.I0(DBG_LastWrittenClearData[43]),
        .I1(\DBG_ClearBlock_State[0] ),
        .I2(CMD_BaseRenderTargetAddr[11]),
        .O(\nextWriteAddr[11]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \nextWriteAddr[11]_i_3 
       (.I0(DBG_LastWrittenClearData[42]),
        .I1(\DBG_ClearBlock_State[0] ),
        .I2(CMD_BaseRenderTargetAddr[10]),
        .O(\nextWriteAddr[11]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \nextWriteAddr[11]_i_4 
       (.I0(DBG_LastWrittenClearData[41]),
        .I1(\DBG_ClearBlock_State[0] ),
        .I2(CMD_BaseRenderTargetAddr[9]),
        .O(\nextWriteAddr[11]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \nextWriteAddr[11]_i_5 
       (.I0(DBG_LastWrittenClearData[40]),
        .I1(\DBG_ClearBlock_State[0] ),
        .I2(CMD_BaseRenderTargetAddr[8]),
        .O(\nextWriteAddr[11]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \nextWriteAddr[11]_i_6 
       (.I0(DBG_LastWrittenClearData[39]),
        .I1(\DBG_ClearBlock_State[0] ),
        .I2(CMD_BaseRenderTargetAddr[7]),
        .O(\nextWriteAddr[11]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \nextWriteAddr[11]_i_7 
       (.I0(DBG_LastWrittenClearData[38]),
        .I1(\DBG_ClearBlock_State[0] ),
        .I2(CMD_BaseRenderTargetAddr[6]),
        .O(\nextWriteAddr[11]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'h3A)) 
    \nextWriteAddr[11]_i_8 
       (.I0(CMD_BaseRenderTargetAddr[5]),
        .I1(DBG_LastWrittenClearData[37]),
        .I2(\DBG_ClearBlock_State[0] ),
        .O(\nextWriteAddr[11]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \nextWriteAddr[11]_i_9 
       (.I0(DBG_LastWrittenClearData[36]),
        .I1(\DBG_ClearBlock_State[0] ),
        .I2(CMD_BaseRenderTargetAddr[4]),
        .O(\nextWriteAddr[11]_i_9_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \nextWriteAddr[19]_i_2 
       (.I0(DBG_LastWrittenClearData[51]),
        .I1(\DBG_ClearBlock_State[0] ),
        .I2(CMD_BaseRenderTargetAddr[19]),
        .O(\nextWriteAddr[19]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \nextWriteAddr[19]_i_3 
       (.I0(DBG_LastWrittenClearData[50]),
        .I1(\DBG_ClearBlock_State[0] ),
        .I2(CMD_BaseRenderTargetAddr[18]),
        .O(\nextWriteAddr[19]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \nextWriteAddr[19]_i_4 
       (.I0(DBG_LastWrittenClearData[49]),
        .I1(\DBG_ClearBlock_State[0] ),
        .I2(CMD_BaseRenderTargetAddr[17]),
        .O(\nextWriteAddr[19]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \nextWriteAddr[19]_i_5 
       (.I0(DBG_LastWrittenClearData[48]),
        .I1(\DBG_ClearBlock_State[0] ),
        .I2(CMD_BaseRenderTargetAddr[16]),
        .O(\nextWriteAddr[19]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \nextWriteAddr[19]_i_6 
       (.I0(DBG_LastWrittenClearData[47]),
        .I1(\DBG_ClearBlock_State[0] ),
        .I2(CMD_BaseRenderTargetAddr[15]),
        .O(\nextWriteAddr[19]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \nextWriteAddr[19]_i_7 
       (.I0(DBG_LastWrittenClearData[46]),
        .I1(\DBG_ClearBlock_State[0] ),
        .I2(CMD_BaseRenderTargetAddr[14]),
        .O(\nextWriteAddr[19]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \nextWriteAddr[19]_i_8 
       (.I0(DBG_LastWrittenClearData[45]),
        .I1(\DBG_ClearBlock_State[0] ),
        .I2(CMD_BaseRenderTargetAddr[13]),
        .O(\nextWriteAddr[19]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \nextWriteAddr[19]_i_9 
       (.I0(DBG_LastWrittenClearData[44]),
        .I1(\DBG_ClearBlock_State[0] ),
        .I2(CMD_BaseRenderTargetAddr[12]),
        .O(\nextWriteAddr[19]_i_9_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \nextWriteAddr[1]_i_1 
       (.I0(DBG_LastWrittenClearData[33]),
        .I1(\DBG_ClearBlock_State[0] ),
        .I2(CMD_BaseRenderTargetAddr[1]),
        .O(\nextWriteAddr[1]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \nextWriteAddr[27]_i_2 
       (.I0(DBG_LastWrittenClearData[59]),
        .I1(\DBG_ClearBlock_State[0] ),
        .I2(CMD_BaseRenderTargetAddr[27]),
        .O(\nextWriteAddr[27]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \nextWriteAddr[27]_i_3 
       (.I0(DBG_LastWrittenClearData[58]),
        .I1(\DBG_ClearBlock_State[0] ),
        .I2(CMD_BaseRenderTargetAddr[26]),
        .O(\nextWriteAddr[27]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \nextWriteAddr[27]_i_4 
       (.I0(DBG_LastWrittenClearData[57]),
        .I1(\DBG_ClearBlock_State[0] ),
        .I2(CMD_BaseRenderTargetAddr[25]),
        .O(\nextWriteAddr[27]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \nextWriteAddr[27]_i_5 
       (.I0(DBG_LastWrittenClearData[56]),
        .I1(\DBG_ClearBlock_State[0] ),
        .I2(CMD_BaseRenderTargetAddr[24]),
        .O(\nextWriteAddr[27]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \nextWriteAddr[27]_i_6 
       (.I0(DBG_LastWrittenClearData[55]),
        .I1(\DBG_ClearBlock_State[0] ),
        .I2(CMD_BaseRenderTargetAddr[23]),
        .O(\nextWriteAddr[27]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \nextWriteAddr[27]_i_7 
       (.I0(DBG_LastWrittenClearData[54]),
        .I1(\DBG_ClearBlock_State[0] ),
        .I2(CMD_BaseRenderTargetAddr[22]),
        .O(\nextWriteAddr[27]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \nextWriteAddr[27]_i_8 
       (.I0(DBG_LastWrittenClearData[53]),
        .I1(\DBG_ClearBlock_State[0] ),
        .I2(CMD_BaseRenderTargetAddr[21]),
        .O(\nextWriteAddr[27]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \nextWriteAddr[27]_i_9 
       (.I0(DBG_LastWrittenClearData[52]),
        .I1(\DBG_ClearBlock_State[0] ),
        .I2(CMD_BaseRenderTargetAddr[20]),
        .O(\nextWriteAddr[27]_i_9_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    \nextWriteAddr[29]_i_1 
       (.I0(\nextWriteAddr[29]_i_3_n_0 ),
        .I1(MEM_ClearBlockWriteRequestsFIFO_wr_en),
        .I2(MEM_ClearBlockWriteRequestsFIFO_full),
        .I3(\DBG_ClearBlock_State[0] ),
        .I4(CMD_ClearBlockBeginSignal),
        .O(remainingDRAMLines));
  LUT5 #(
    .INIT(32'h00000010)) 
    \nextWriteAddr[29]_i_3 
       (.I0(remainingDRAMLines_reg__0[8]),
        .I1(remainingDRAMLines_reg__0[9]),
        .I2(\remainingDRAMLines[6]_i_2_n_0 ),
        .I3(\nextWriteAddr[29]_i_6_n_0 ),
        .I4(\nextWriteAddr[29]_i_7_n_0 ),
        .O(\nextWriteAddr[29]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \nextWriteAddr[29]_i_4 
       (.I0(DBG_LastWrittenClearData[61]),
        .I1(\DBG_ClearBlock_State[0] ),
        .I2(CMD_BaseRenderTargetAddr[29]),
        .O(\nextWriteAddr[29]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \nextWriteAddr[29]_i_5 
       (.I0(DBG_LastWrittenClearData[60]),
        .I1(\DBG_ClearBlock_State[0] ),
        .I2(CMD_BaseRenderTargetAddr[28]),
        .O(\nextWriteAddr[29]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \nextWriteAddr[29]_i_6 
       (.I0(remainingDRAMLines_reg__0[5]),
        .I1(remainingDRAMLines_reg__0[4]),
        .I2(remainingDRAMLines_reg__0[7]),
        .I3(remainingDRAMLines_reg__0[6]),
        .O(\nextWriteAddr[29]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \nextWriteAddr[29]_i_7 
       (.I0(remainingDRAMLines_reg__0[10]),
        .I1(remainingDRAMLines_reg__0[15]),
        .I2(remainingDRAMLines_reg__0[13]),
        .I3(remainingDRAMLines_reg__0[14]),
        .I4(remainingDRAMLines_reg__0[12]),
        .I5(remainingDRAMLines_reg__0[11]),
        .O(\nextWriteAddr[29]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \nextWriteAddr[2]_i_1 
       (.I0(DBG_LastWrittenClearData[34]),
        .I1(\DBG_ClearBlock_State[0] ),
        .I2(CMD_BaseRenderTargetAddr[2]),
        .O(\nextWriteAddr[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \nextWriteAddr[3]_i_1 
       (.I0(DBG_LastWrittenClearData[35]),
        .I1(\DBG_ClearBlock_State[0] ),
        .I2(CMD_BaseRenderTargetAddr[3]),
        .O(\nextWriteAddr[3]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA" *) 
  FDRE #(
    .INIT(1'b0)) 
    \nextWriteAddr_reg[0] 
       (.C(clk),
        .CE(remainingDRAMLines),
        .D(\nextWriteAddr[0]_i_1_n_0 ),
        .Q(DBG_LastWrittenClearData[32]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA" *) 
  FDRE #(
    .INIT(1'b0)) 
    \nextWriteAddr_reg[10] 
       (.C(clk),
        .CE(remainingDRAMLines),
        .D(\nextWriteAddr_reg[11]_i_1_n_9 ),
        .Q(DBG_LastWrittenClearData[42]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA" *) 
  FDRE #(
    .INIT(1'b0)) 
    \nextWriteAddr_reg[11] 
       (.C(clk),
        .CE(remainingDRAMLines),
        .D(\nextWriteAddr_reg[11]_i_1_n_8 ),
        .Q(DBG_LastWrittenClearData[43]),
        .R(1'b0));
  CARRY8 \nextWriteAddr_reg[11]_i_1 
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({\nextWriteAddr_reg[11]_i_1_n_0 ,\nextWriteAddr_reg[11]_i_1_n_1 ,\nextWriteAddr_reg[11]_i_1_n_2 ,\nextWriteAddr_reg[11]_i_1_n_3 ,\NLW_nextWriteAddr_reg[11]_i_1_CO_UNCONNECTED [3],\nextWriteAddr_reg[11]_i_1_n_5 ,\nextWriteAddr_reg[11]_i_1_n_6 ,\nextWriteAddr_reg[11]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,\DBG_ClearBlock_State[0] ,1'b0}),
        .O({\nextWriteAddr_reg[11]_i_1_n_8 ,\nextWriteAddr_reg[11]_i_1_n_9 ,\nextWriteAddr_reg[11]_i_1_n_10 ,\nextWriteAddr_reg[11]_i_1_n_11 ,\nextWriteAddr_reg[11]_i_1_n_12 ,\nextWriteAddr_reg[11]_i_1_n_13 ,\nextWriteAddr_reg[11]_i_1_n_14 ,\nextWriteAddr_reg[11]_i_1_n_15 }),
        .S({\nextWriteAddr[11]_i_2_n_0 ,\nextWriteAddr[11]_i_3_n_0 ,\nextWriteAddr[11]_i_4_n_0 ,\nextWriteAddr[11]_i_5_n_0 ,\nextWriteAddr[11]_i_6_n_0 ,\nextWriteAddr[11]_i_7_n_0 ,\nextWriteAddr[11]_i_8_n_0 ,\nextWriteAddr[11]_i_9_n_0 }));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA" *) 
  FDRE #(
    .INIT(1'b0)) 
    \nextWriteAddr_reg[12] 
       (.C(clk),
        .CE(remainingDRAMLines),
        .D(\nextWriteAddr_reg[19]_i_1_n_15 ),
        .Q(DBG_LastWrittenClearData[44]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA" *) 
  FDRE #(
    .INIT(1'b0)) 
    \nextWriteAddr_reg[13] 
       (.C(clk),
        .CE(remainingDRAMLines),
        .D(\nextWriteAddr_reg[19]_i_1_n_14 ),
        .Q(DBG_LastWrittenClearData[45]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA" *) 
  FDRE #(
    .INIT(1'b0)) 
    \nextWriteAddr_reg[14] 
       (.C(clk),
        .CE(remainingDRAMLines),
        .D(\nextWriteAddr_reg[19]_i_1_n_13 ),
        .Q(DBG_LastWrittenClearData[46]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA" *) 
  FDRE #(
    .INIT(1'b0)) 
    \nextWriteAddr_reg[15] 
       (.C(clk),
        .CE(remainingDRAMLines),
        .D(\nextWriteAddr_reg[19]_i_1_n_12 ),
        .Q(DBG_LastWrittenClearData[47]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA" *) 
  FDRE #(
    .INIT(1'b0)) 
    \nextWriteAddr_reg[16] 
       (.C(clk),
        .CE(remainingDRAMLines),
        .D(\nextWriteAddr_reg[19]_i_1_n_11 ),
        .Q(DBG_LastWrittenClearData[48]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA" *) 
  FDRE #(
    .INIT(1'b0)) 
    \nextWriteAddr_reg[17] 
       (.C(clk),
        .CE(remainingDRAMLines),
        .D(\nextWriteAddr_reg[19]_i_1_n_10 ),
        .Q(DBG_LastWrittenClearData[49]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA" *) 
  FDRE #(
    .INIT(1'b0)) 
    \nextWriteAddr_reg[18] 
       (.C(clk),
        .CE(remainingDRAMLines),
        .D(\nextWriteAddr_reg[19]_i_1_n_9 ),
        .Q(DBG_LastWrittenClearData[50]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA" *) 
  FDRE #(
    .INIT(1'b0)) 
    \nextWriteAddr_reg[19] 
       (.C(clk),
        .CE(remainingDRAMLines),
        .D(\nextWriteAddr_reg[19]_i_1_n_8 ),
        .Q(DBG_LastWrittenClearData[51]),
        .R(1'b0));
  CARRY8 \nextWriteAddr_reg[19]_i_1 
       (.CI(\nextWriteAddr_reg[11]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\nextWriteAddr_reg[19]_i_1_n_0 ,\nextWriteAddr_reg[19]_i_1_n_1 ,\nextWriteAddr_reg[19]_i_1_n_2 ,\nextWriteAddr_reg[19]_i_1_n_3 ,\NLW_nextWriteAddr_reg[19]_i_1_CO_UNCONNECTED [3],\nextWriteAddr_reg[19]_i_1_n_5 ,\nextWriteAddr_reg[19]_i_1_n_6 ,\nextWriteAddr_reg[19]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\nextWriteAddr_reg[19]_i_1_n_8 ,\nextWriteAddr_reg[19]_i_1_n_9 ,\nextWriteAddr_reg[19]_i_1_n_10 ,\nextWriteAddr_reg[19]_i_1_n_11 ,\nextWriteAddr_reg[19]_i_1_n_12 ,\nextWriteAddr_reg[19]_i_1_n_13 ,\nextWriteAddr_reg[19]_i_1_n_14 ,\nextWriteAddr_reg[19]_i_1_n_15 }),
        .S({\nextWriteAddr[19]_i_2_n_0 ,\nextWriteAddr[19]_i_3_n_0 ,\nextWriteAddr[19]_i_4_n_0 ,\nextWriteAddr[19]_i_5_n_0 ,\nextWriteAddr[19]_i_6_n_0 ,\nextWriteAddr[19]_i_7_n_0 ,\nextWriteAddr[19]_i_8_n_0 ,\nextWriteAddr[19]_i_9_n_0 }));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA" *) 
  FDRE #(
    .INIT(1'b0)) 
    \nextWriteAddr_reg[1] 
       (.C(clk),
        .CE(remainingDRAMLines),
        .D(\nextWriteAddr[1]_i_1_n_0 ),
        .Q(DBG_LastWrittenClearData[33]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA" *) 
  FDRE #(
    .INIT(1'b0)) 
    \nextWriteAddr_reg[20] 
       (.C(clk),
        .CE(remainingDRAMLines),
        .D(\nextWriteAddr_reg[27]_i_1_n_15 ),
        .Q(DBG_LastWrittenClearData[52]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA" *) 
  FDRE #(
    .INIT(1'b0)) 
    \nextWriteAddr_reg[21] 
       (.C(clk),
        .CE(remainingDRAMLines),
        .D(\nextWriteAddr_reg[27]_i_1_n_14 ),
        .Q(DBG_LastWrittenClearData[53]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA" *) 
  FDRE #(
    .INIT(1'b0)) 
    \nextWriteAddr_reg[22] 
       (.C(clk),
        .CE(remainingDRAMLines),
        .D(\nextWriteAddr_reg[27]_i_1_n_13 ),
        .Q(DBG_LastWrittenClearData[54]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA" *) 
  FDRE #(
    .INIT(1'b0)) 
    \nextWriteAddr_reg[23] 
       (.C(clk),
        .CE(remainingDRAMLines),
        .D(\nextWriteAddr_reg[27]_i_1_n_12 ),
        .Q(DBG_LastWrittenClearData[55]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA" *) 
  FDRE #(
    .INIT(1'b0)) 
    \nextWriteAddr_reg[24] 
       (.C(clk),
        .CE(remainingDRAMLines),
        .D(\nextWriteAddr_reg[27]_i_1_n_11 ),
        .Q(DBG_LastWrittenClearData[56]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA" *) 
  FDRE #(
    .INIT(1'b0)) 
    \nextWriteAddr_reg[25] 
       (.C(clk),
        .CE(remainingDRAMLines),
        .D(\nextWriteAddr_reg[27]_i_1_n_10 ),
        .Q(DBG_LastWrittenClearData[57]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA" *) 
  FDRE #(
    .INIT(1'b0)) 
    \nextWriteAddr_reg[26] 
       (.C(clk),
        .CE(remainingDRAMLines),
        .D(\nextWriteAddr_reg[27]_i_1_n_9 ),
        .Q(DBG_LastWrittenClearData[58]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA" *) 
  FDRE #(
    .INIT(1'b0)) 
    \nextWriteAddr_reg[27] 
       (.C(clk),
        .CE(remainingDRAMLines),
        .D(\nextWriteAddr_reg[27]_i_1_n_8 ),
        .Q(DBG_LastWrittenClearData[59]),
        .R(1'b0));
  CARRY8 \nextWriteAddr_reg[27]_i_1 
       (.CI(\nextWriteAddr_reg[19]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\nextWriteAddr_reg[27]_i_1_n_0 ,\nextWriteAddr_reg[27]_i_1_n_1 ,\nextWriteAddr_reg[27]_i_1_n_2 ,\nextWriteAddr_reg[27]_i_1_n_3 ,\NLW_nextWriteAddr_reg[27]_i_1_CO_UNCONNECTED [3],\nextWriteAddr_reg[27]_i_1_n_5 ,\nextWriteAddr_reg[27]_i_1_n_6 ,\nextWriteAddr_reg[27]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\nextWriteAddr_reg[27]_i_1_n_8 ,\nextWriteAddr_reg[27]_i_1_n_9 ,\nextWriteAddr_reg[27]_i_1_n_10 ,\nextWriteAddr_reg[27]_i_1_n_11 ,\nextWriteAddr_reg[27]_i_1_n_12 ,\nextWriteAddr_reg[27]_i_1_n_13 ,\nextWriteAddr_reg[27]_i_1_n_14 ,\nextWriteAddr_reg[27]_i_1_n_15 }),
        .S({\nextWriteAddr[27]_i_2_n_0 ,\nextWriteAddr[27]_i_3_n_0 ,\nextWriteAddr[27]_i_4_n_0 ,\nextWriteAddr[27]_i_5_n_0 ,\nextWriteAddr[27]_i_6_n_0 ,\nextWriteAddr[27]_i_7_n_0 ,\nextWriteAddr[27]_i_8_n_0 ,\nextWriteAddr[27]_i_9_n_0 }));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA" *) 
  FDRE #(
    .INIT(1'b0)) 
    \nextWriteAddr_reg[28] 
       (.C(clk),
        .CE(remainingDRAMLines),
        .D(\nextWriteAddr_reg[29]_i_2_n_15 ),
        .Q(DBG_LastWrittenClearData[60]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA" *) 
  FDRE #(
    .INIT(1'b0)) 
    \nextWriteAddr_reg[29] 
       (.C(clk),
        .CE(remainingDRAMLines),
        .D(\nextWriteAddr_reg[29]_i_2_n_14 ),
        .Q(DBG_LastWrittenClearData[61]),
        .R(1'b0));
  CARRY8 \nextWriteAddr_reg[29]_i_2 
       (.CI(\nextWriteAddr_reg[27]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\NLW_nextWriteAddr_reg[29]_i_2_CO_UNCONNECTED [7:1],\nextWriteAddr_reg[29]_i_2_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_nextWriteAddr_reg[29]_i_2_O_UNCONNECTED [7:2],\nextWriteAddr_reg[29]_i_2_n_14 ,\nextWriteAddr_reg[29]_i_2_n_15 }),
        .S({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,\nextWriteAddr[29]_i_4_n_0 ,\nextWriteAddr[29]_i_5_n_0 }));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA" *) 
  FDRE #(
    .INIT(1'b0)) 
    \nextWriteAddr_reg[2] 
       (.C(clk),
        .CE(remainingDRAMLines),
        .D(\nextWriteAddr[2]_i_1_n_0 ),
        .Q(DBG_LastWrittenClearData[34]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA" *) 
  FDRE #(
    .INIT(1'b0)) 
    \nextWriteAddr_reg[3] 
       (.C(clk),
        .CE(remainingDRAMLines),
        .D(\nextWriteAddr[3]_i_1_n_0 ),
        .Q(DBG_LastWrittenClearData[35]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA" *) 
  FDRE #(
    .INIT(1'b0)) 
    \nextWriteAddr_reg[4] 
       (.C(clk),
        .CE(remainingDRAMLines),
        .D(\nextWriteAddr_reg[11]_i_1_n_15 ),
        .Q(DBG_LastWrittenClearData[36]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA" *) 
  FDRE #(
    .INIT(1'b0)) 
    \nextWriteAddr_reg[5] 
       (.C(clk),
        .CE(remainingDRAMLines),
        .D(\nextWriteAddr_reg[11]_i_1_n_14 ),
        .Q(DBG_LastWrittenClearData[37]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA" *) 
  FDRE #(
    .INIT(1'b0)) 
    \nextWriteAddr_reg[6] 
       (.C(clk),
        .CE(remainingDRAMLines),
        .D(\nextWriteAddr_reg[11]_i_1_n_13 ),
        .Q(DBG_LastWrittenClearData[38]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA" *) 
  FDRE #(
    .INIT(1'b0)) 
    \nextWriteAddr_reg[7] 
       (.C(clk),
        .CE(remainingDRAMLines),
        .D(\nextWriteAddr_reg[11]_i_1_n_12 ),
        .Q(DBG_LastWrittenClearData[39]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA" *) 
  FDRE #(
    .INIT(1'b0)) 
    \nextWriteAddr_reg[8] 
       (.C(clk),
        .CE(remainingDRAMLines),
        .D(\nextWriteAddr_reg[11]_i_1_n_11 ),
        .Q(DBG_LastWrittenClearData[40]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA" *) 
  FDRE #(
    .INIT(1'b0)) 
    \nextWriteAddr_reg[9] 
       (.C(clk),
        .CE(remainingDRAMLines),
        .D(\nextWriteAddr_reg[11]_i_1_n_10 ),
        .Q(DBG_LastWrittenClearData[41]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h74)) 
    \remainingDRAMLines[0]_i_1 
       (.I0(remainingDRAMLines_reg__0[0]),
        .I1(\DBG_ClearBlock_State[0] ),
        .I2(CMD_ClearDRAMLineCount[0]),
        .O(p_0_in[0]));
  LUT6 #(
    .INIT(64'hA9AAFFFFA9AA0000)) 
    \remainingDRAMLines[10]_i_1 
       (.I0(remainingDRAMLines_reg__0[10]),
        .I1(remainingDRAMLines_reg__0[8]),
        .I2(remainingDRAMLines_reg__0[9]),
        .I3(\remainingDRAMLines[10]_i_2_n_0 ),
        .I4(\DBG_ClearBlock_State[0] ),
        .I5(CMD_ClearDRAMLineCount[10]),
        .O(p_0_in[10]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h00000002)) 
    \remainingDRAMLines[10]_i_2 
       (.I0(\remainingDRAMLines[6]_i_2_n_0 ),
        .I1(remainingDRAMLines_reg__0[6]),
        .I2(remainingDRAMLines_reg__0[7]),
        .I3(remainingDRAMLines_reg__0[4]),
        .I4(remainingDRAMLines_reg__0[5]),
        .O(\remainingDRAMLines[10]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h6F60)) 
    \remainingDRAMLines[11]_i_1 
       (.I0(remainingDRAMLines_reg__0[11]),
        .I1(\remainingDRAMLines[13]_i_2_n_0 ),
        .I2(\DBG_ClearBlock_State[0] ),
        .I3(CMD_ClearDRAMLineCount[11]),
        .O(p_0_in[11]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h9AFF9A00)) 
    \remainingDRAMLines[12]_i_1 
       (.I0(remainingDRAMLines_reg__0[12]),
        .I1(remainingDRAMLines_reg__0[11]),
        .I2(\remainingDRAMLines[13]_i_2_n_0 ),
        .I3(\DBG_ClearBlock_State[0] ),
        .I4(CMD_ClearDRAMLineCount[12]),
        .O(p_0_in[12]));
  LUT6 #(
    .INIT(64'hA9AAFFFFA9AA0000)) 
    \remainingDRAMLines[13]_i_1 
       (.I0(remainingDRAMLines_reg__0[13]),
        .I1(remainingDRAMLines_reg__0[11]),
        .I2(remainingDRAMLines_reg__0[12]),
        .I3(\remainingDRAMLines[13]_i_2_n_0 ),
        .I4(\DBG_ClearBlock_State[0] ),
        .I5(CMD_ClearDRAMLineCount[13]),
        .O(p_0_in[13]));
  LUT5 #(
    .INIT(32'h00000010)) 
    \remainingDRAMLines[13]_i_2 
       (.I0(remainingDRAMLines_reg__0[8]),
        .I1(remainingDRAMLines_reg__0[9]),
        .I2(\remainingDRAMLines[6]_i_2_n_0 ),
        .I3(\nextWriteAddr[29]_i_6_n_0 ),
        .I4(remainingDRAMLines_reg__0[10]),
        .O(\remainingDRAMLines[13]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h9AFF9A00)) 
    \remainingDRAMLines[14]_i_1 
       (.I0(remainingDRAMLines_reg__0[14]),
        .I1(remainingDRAMLines_reg__0[13]),
        .I2(\remainingDRAMLines[15]_i_2_n_0 ),
        .I3(\DBG_ClearBlock_State[0] ),
        .I4(CMD_ClearDRAMLineCount[14]),
        .O(p_0_in[14]));
  LUT6 #(
    .INIT(64'hA9AAFFFFA9AA0000)) 
    \remainingDRAMLines[15]_i_1 
       (.I0(remainingDRAMLines_reg__0[15]),
        .I1(remainingDRAMLines_reg__0[13]),
        .I2(remainingDRAMLines_reg__0[14]),
        .I3(\remainingDRAMLines[15]_i_2_n_0 ),
        .I4(\DBG_ClearBlock_State[0] ),
        .I5(CMD_ClearDRAMLineCount[15]),
        .O(p_0_in[15]));
  LUT6 #(
    .INIT(64'h0000000000000010)) 
    \remainingDRAMLines[15]_i_2 
       (.I0(remainingDRAMLines_reg__0[10]),
        .I1(\nextWriteAddr[29]_i_6_n_0 ),
        .I2(\remainingDRAMLines[6]_i_2_n_0 ),
        .I3(remainingDRAMLines_reg__0[9]),
        .I4(remainingDRAMLines_reg__0[8]),
        .I5(\remainingDRAMLines[15]_i_3_n_0 ),
        .O(\remainingDRAMLines[15]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \remainingDRAMLines[15]_i_3 
       (.I0(remainingDRAMLines_reg__0[11]),
        .I1(remainingDRAMLines_reg__0[12]),
        .O(\remainingDRAMLines[15]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h9F90)) 
    \remainingDRAMLines[1]_i_1 
       (.I0(remainingDRAMLines_reg__0[0]),
        .I1(remainingDRAMLines_reg__0[1]),
        .I2(\DBG_ClearBlock_State[0] ),
        .I3(CMD_ClearDRAMLineCount[1]),
        .O(p_0_in[1]));
  LUT5 #(
    .INIT(32'hE1FFE100)) 
    \remainingDRAMLines[2]_i_1 
       (.I0(remainingDRAMLines_reg__0[0]),
        .I1(remainingDRAMLines_reg__0[1]),
        .I2(remainingDRAMLines_reg__0[2]),
        .I3(\DBG_ClearBlock_State[0] ),
        .I4(CMD_ClearDRAMLineCount[2]),
        .O(p_0_in[2]));
  LUT6 #(
    .INIT(64'hFE01FFFFFE010000)) 
    \remainingDRAMLines[3]_i_1 
       (.I0(remainingDRAMLines_reg__0[2]),
        .I1(remainingDRAMLines_reg__0[1]),
        .I2(remainingDRAMLines_reg__0[0]),
        .I3(remainingDRAMLines_reg__0[3]),
        .I4(\DBG_ClearBlock_State[0] ),
        .I5(CMD_ClearDRAMLineCount[3]),
        .O(p_0_in[3]));
  LUT4 #(
    .INIT(16'h6F60)) 
    \remainingDRAMLines[4]_i_1 
       (.I0(remainingDRAMLines_reg__0[4]),
        .I1(\remainingDRAMLines[6]_i_2_n_0 ),
        .I2(\DBG_ClearBlock_State[0] ),
        .I3(CMD_ClearDRAMLineCount[4]),
        .O(p_0_in[4]));
  LUT5 #(
    .INIT(32'h9AFF9A00)) 
    \remainingDRAMLines[5]_i_1 
       (.I0(remainingDRAMLines_reg__0[5]),
        .I1(remainingDRAMLines_reg__0[4]),
        .I2(\remainingDRAMLines[6]_i_2_n_0 ),
        .I3(\DBG_ClearBlock_State[0] ),
        .I4(CMD_ClearDRAMLineCount[5]),
        .O(p_0_in[5]));
  LUT6 #(
    .INIT(64'hAA9AFFFFAA9A0000)) 
    \remainingDRAMLines[6]_i_1 
       (.I0(remainingDRAMLines_reg__0[6]),
        .I1(remainingDRAMLines_reg__0[5]),
        .I2(\remainingDRAMLines[6]_i_2_n_0 ),
        .I3(remainingDRAMLines_reg__0[4]),
        .I4(\DBG_ClearBlock_State[0] ),
        .I5(CMD_ClearDRAMLineCount[6]),
        .O(p_0_in[6]));
  LUT4 #(
    .INIT(16'h0001)) 
    \remainingDRAMLines[6]_i_2 
       (.I0(remainingDRAMLines_reg__0[1]),
        .I1(remainingDRAMLines_reg__0[0]),
        .I2(remainingDRAMLines_reg__0[3]),
        .I3(remainingDRAMLines_reg__0[2]),
        .O(\remainingDRAMLines[6]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h9AFF9A00)) 
    \remainingDRAMLines[7]_i_1 
       (.I0(remainingDRAMLines_reg__0[7]),
        .I1(remainingDRAMLines_reg__0[6]),
        .I2(\remainingDRAMLines[7]_i_2_n_0 ),
        .I3(\DBG_ClearBlock_State[0] ),
        .I4(CMD_ClearDRAMLineCount[7]),
        .O(p_0_in[7]));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \remainingDRAMLines[7]_i_2 
       (.I0(remainingDRAMLines_reg__0[4]),
        .I1(remainingDRAMLines_reg__0[1]),
        .I2(remainingDRAMLines_reg__0[0]),
        .I3(remainingDRAMLines_reg__0[3]),
        .I4(remainingDRAMLines_reg__0[2]),
        .I5(remainingDRAMLines_reg__0[5]),
        .O(\remainingDRAMLines[7]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h6F60)) 
    \remainingDRAMLines[8]_i_1 
       (.I0(remainingDRAMLines_reg__0[8]),
        .I1(\remainingDRAMLines[10]_i_2_n_0 ),
        .I2(\DBG_ClearBlock_State[0] ),
        .I3(CMD_ClearDRAMLineCount[8]),
        .O(p_0_in[8]));
  LUT5 #(
    .INIT(32'h9AFF9A00)) 
    \remainingDRAMLines[9]_i_1 
       (.I0(remainingDRAMLines_reg__0[9]),
        .I1(remainingDRAMLines_reg__0[8]),
        .I2(\remainingDRAMLines[10]_i_2_n_0 ),
        .I3(\DBG_ClearBlock_State[0] ),
        .I4(CMD_ClearDRAMLineCount[9]),
        .O(p_0_in[9]));
  FDRE #(
    .INIT(1'b0)) 
    \remainingDRAMLines_reg[0] 
       (.C(clk),
        .CE(remainingDRAMLines),
        .D(p_0_in[0]),
        .Q(remainingDRAMLines_reg__0[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \remainingDRAMLines_reg[10] 
       (.C(clk),
        .CE(remainingDRAMLines),
        .D(p_0_in[10]),
        .Q(remainingDRAMLines_reg__0[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \remainingDRAMLines_reg[11] 
       (.C(clk),
        .CE(remainingDRAMLines),
        .D(p_0_in[11]),
        .Q(remainingDRAMLines_reg__0[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \remainingDRAMLines_reg[12] 
       (.C(clk),
        .CE(remainingDRAMLines),
        .D(p_0_in[12]),
        .Q(remainingDRAMLines_reg__0[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \remainingDRAMLines_reg[13] 
       (.C(clk),
        .CE(remainingDRAMLines),
        .D(p_0_in[13]),
        .Q(remainingDRAMLines_reg__0[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \remainingDRAMLines_reg[14] 
       (.C(clk),
        .CE(remainingDRAMLines),
        .D(p_0_in[14]),
        .Q(remainingDRAMLines_reg__0[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \remainingDRAMLines_reg[15] 
       (.C(clk),
        .CE(remainingDRAMLines),
        .D(p_0_in[15]),
        .Q(remainingDRAMLines_reg__0[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \remainingDRAMLines_reg[1] 
       (.C(clk),
        .CE(remainingDRAMLines),
        .D(p_0_in[1]),
        .Q(remainingDRAMLines_reg__0[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \remainingDRAMLines_reg[2] 
       (.C(clk),
        .CE(remainingDRAMLines),
        .D(p_0_in[2]),
        .Q(remainingDRAMLines_reg__0[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \remainingDRAMLines_reg[3] 
       (.C(clk),
        .CE(remainingDRAMLines),
        .D(p_0_in[3]),
        .Q(remainingDRAMLines_reg__0[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \remainingDRAMLines_reg[4] 
       (.C(clk),
        .CE(remainingDRAMLines),
        .D(p_0_in[4]),
        .Q(remainingDRAMLines_reg__0[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \remainingDRAMLines_reg[5] 
       (.C(clk),
        .CE(remainingDRAMLines),
        .D(p_0_in[5]),
        .Q(remainingDRAMLines_reg__0[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \remainingDRAMLines_reg[6] 
       (.C(clk),
        .CE(remainingDRAMLines),
        .D(p_0_in[6]),
        .Q(remainingDRAMLines_reg__0[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \remainingDRAMLines_reg[7] 
       (.C(clk),
        .CE(remainingDRAMLines),
        .D(p_0_in[7]),
        .Q(remainingDRAMLines_reg__0[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \remainingDRAMLines_reg[8] 
       (.C(clk),
        .CE(remainingDRAMLines),
        .D(p_0_in[8]),
        .Q(remainingDRAMLines_reg__0[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \remainingDRAMLines_reg[9] 
       (.C(clk),
        .CE(remainingDRAMLines),
        .D(p_0_in[9]),
        .Q(remainingDRAMLines_reg__0[9]),
        .R(1'b0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
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

endmodule
`endif
