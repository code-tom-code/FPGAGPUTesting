// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Mon Dec  8 18:20:30 2025
// Host        : Dragon3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_NetProtoPacketProces_0_0/MainDesign_NetProtoPacketProces_0_0_sim_netlist.v
// Design      : MainDesign_NetProtoPacketProces_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "MainDesign_NetProtoPacketProces_0_0,NetProtoPacketProcessor,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "module_ref" *) 
(* x_core_info = "NetProtoPacketProcessor,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module MainDesign_NetProtoPacketProces_0_0
   (clk333_250,
    recv_pkt_header_empty,
    recv_pkt_header_almost_empty,
    recv_pkt_header_rd_data,
    recv_pkt_header_rd_en,
    recv_pkt_data_empty,
    recv_pkt_data_almost_empty,
    recv_pkt_data_rd_data,
    recv_pkt_data_rd_en,
    send_pkt_header_prog_full,
    send_pkt_header_wr_data,
    send_pkt_header_wr_en,
    send_pkt_data_count,
    send_pkt_data_wr_data,
    send_pkt_data_wr_en,
    ETHCTRL_SendReady,
    ETHCTRL_RecvReady,
    validPacketsFIFO_wr_data,
    validPacketsFIFO_full,
    validPacketsFIFO_prog_full,
    validPacketsFIFO_wr_en,
    returnPacketsFIFO_empty,
    returnPacketsFIFO_almost_empty,
    returnPacketsFIFO_rd_data,
    returnPacketsFIFO_rd_en,
    sendBRAM_addra,
    sendBRAM_clka,
    sendBRAM_dina,
    sendBRAM_ena,
    sendBRAM_wea,
    sendBRAM_addrb,
    sendBRAM_clkb,
    sendBRAM_doutb,
    sendBRAM_enb,
    STAT_SendSessionPackets,
    STAT_RecvSessionPacketsValid,
    STAT_RecvSessionPacketsInvalid,
    STAT_RecvSessionPacketsDropped,
    DBG_NetPkt_State,
    DBG_SendFIFOState,
    DBG_RecvFIFOState,
    DBG_RecvSessionParseState,
    DBG_SendPacketState,
    DBG_recvSendReplyPacket,
    DBG_sendReplyAck,
    DBG_sendHandlingReply,
    DBG_recvPacketData,
    DBG_recvCurrentSubpacketOffset,
    DBG_recvCurrentSubpacket,
    DBG_recvValid_Session,
    DBG_recvHeaderChecksum,
    DBG_discardPacketReason,
    DBG_sendLastAckedPacketID,
    DBG_recvLastSendAckedPacketID,
    DBG_recvLastAckedPacketID,
    DBG_sendCyclesBetweenAutoResends,
    DBG_recvCurrentSubpacketIndex,
    DBG_recvCurrentPacketLength,
    DBG_returnPacketsFIFO_empty,
    DBG_returnPacketsFIFO_rd_en,
    DBG_returnPacketsFIFO_rd_data,
    DBG_sendHasUnackedSentPacket,
    DBG_send_pkt_header_prog_full);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk333_250 CLK" *) (* x_interface_mode = "slave clk333_250" *) (* x_interface_parameter = "XIL_INTERFACENAME clk333_250, FREQ_HZ 333250000, ASSOCIATED_BUSIF recv_pkt_header:recv_pkt_data:send_pkt_header:send_pkt_data:validPacketsFIFO:returnPacketsFIFO:SendPacketBRAMW:SendPacketBRAMR, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0" *) input clk333_250;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 recv_pkt_header EMPTY" *) (* x_interface_mode = "master recv_pkt_header" *) input recv_pkt_header_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 recv_pkt_header ALMOST_EMPTY" *) input recv_pkt_header_almost_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 recv_pkt_header RD_DATA" *) (* x_interface_mode = "master" *) input [31:0]recv_pkt_header_rd_data;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 recv_pkt_header RD_EN" *) output recv_pkt_header_rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 recv_pkt_data EMPTY" *) (* x_interface_mode = "master recv_pkt_data" *) input recv_pkt_data_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 recv_pkt_data ALMOST_EMPTY" *) input recv_pkt_data_almost_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 recv_pkt_data RD_DATA" *) (* x_interface_mode = "master" *) input [31:0]recv_pkt_data_rd_data;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 recv_pkt_data RD_EN" *) output recv_pkt_data_rd_en;
  input send_pkt_header_prog_full;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_header WR_DATA" *) (* x_interface_mode = "master send_pkt_header" *) output [31:0]send_pkt_header_wr_data;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_header WR_EN" *) output send_pkt_header_wr_en;
  input [10:0]send_pkt_data_count;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_data WR_DATA" *) (* x_interface_mode = "master send_pkt_data" *) output [31:0]send_pkt_data_wr_data;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_data WR_EN" *) output send_pkt_data_wr_en;
  input ETHCTRL_SendReady;
  input ETHCTRL_RecvReady;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) (* x_interface_mode = "master validPacketsFIFO" *) output [87:0]validPacketsFIFO_wr_data;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO FULL" *) input validPacketsFIFO_full;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO ALMOST_FULL" *) input validPacketsFIFO_prog_full;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_EN" *) output validPacketsFIFO_wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 returnPacketsFIFO EMPTY" *) (* x_interface_mode = "master returnPacketsFIFO" *) input returnPacketsFIFO_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 returnPacketsFIFO ALMOST_EMPTY" *) input returnPacketsFIFO_almost_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 returnPacketsFIFO RD_DATA" *) input [87:0]returnPacketsFIFO_rd_data;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 returnPacketsFIFO RD_EN" *) output returnPacketsFIFO_rd_en;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SendPacketBRAMW ADDR" *) (* x_interface_mode = "master SendPacketBRAMW" *) (* x_interface_parameter = "XIL_INTERFACENAME SendPacketBRAMW, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) output [8:0]sendBRAM_addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SendPacketBRAMW CLK" *) output sendBRAM_clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SendPacketBRAMW DIN" *) output [31:0]sendBRAM_dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SendPacketBRAMW EN" *) output sendBRAM_ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SendPacketBRAMW WE" *) output [0:0]sendBRAM_wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SendPacketBRAMR ADDR" *) (* x_interface_mode = "master SendPacketBRAMR" *) (* x_interface_parameter = "XIL_INTERFACENAME SendPacketBRAMR, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) output [8:0]sendBRAM_addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SendPacketBRAMR CLK" *) output sendBRAM_clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SendPacketBRAMR DOUT" *) input [31:0]sendBRAM_doutb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SendPacketBRAMR EN" *) output sendBRAM_enb;
  output [31:0]STAT_SendSessionPackets;
  output [31:0]STAT_RecvSessionPacketsValid;
  output [31:0]STAT_RecvSessionPacketsInvalid;
  output [31:0]STAT_RecvSessionPacketsDropped;
  output [4:0]DBG_NetPkt_State;
  output [4:0]DBG_SendFIFOState;
  output [4:0]DBG_RecvFIFOState;
  output [4:0]DBG_RecvSessionParseState;
  output [4:0]DBG_SendPacketState;
  output DBG_recvSendReplyPacket;
  output DBG_sendReplyAck;
  output DBG_sendHandlingReply;
  output [63:0]DBG_recvPacketData;
  output [3:0]DBG_recvCurrentSubpacketOffset;
  output [71:0]DBG_recvCurrentSubpacket;
  output [3:0]DBG_recvValid_Session;
  output [7:0]DBG_recvHeaderChecksum;
  output [3:0]DBG_discardPacketReason;
  output [15:0]DBG_sendLastAckedPacketID;
  output [15:0]DBG_recvLastSendAckedPacketID;
  output [15:0]DBG_recvLastAckedPacketID;
  output [27:0]DBG_sendCyclesBetweenAutoResends;
  output [7:0]DBG_recvCurrentSubpacketIndex;
  output [15:0]DBG_recvCurrentPacketLength;
  output DBG_returnPacketsFIFO_empty;
  output DBG_returnPacketsFIFO_rd_en;
  output [87:0]DBG_returnPacketsFIFO_rd_data;
  output DBG_sendHasUnackedSentPacket;
  output DBG_send_pkt_header_prog_full;

  wire \<const0> ;
  wire \<const1> ;
  wire [2:0]\^DBG_NetPkt_State ;
  wire [2:0]\^DBG_RecvFIFOState ;
  wire [2:0]\^DBG_RecvSessionParseState ;
  wire [2:0]\^DBG_SendFIFOState ;
  wire [3:0]\^DBG_SendPacketState ;
  wire [2:0]\^DBG_discardPacketReason ;
  wire [15:0]DBG_recvCurrentPacketLength;
  wire [71:0]DBG_recvCurrentSubpacket;
  wire [7:0]DBG_recvCurrentSubpacketIndex;
  wire [3:0]DBG_recvCurrentSubpacketOffset;
  wire [7:0]DBG_recvHeaderChecksum;
  wire [15:0]DBG_recvLastAckedPacketID;
  wire [15:0]DBG_recvLastSendAckedPacketID;
  wire [63:0]DBG_recvPacketData;
  wire DBG_recvSendReplyPacket;
  wire [3:0]DBG_recvValid_Session;
  wire DBG_returnPacketsFIFO_rd_en;
  wire [27:0]DBG_sendCyclesBetweenAutoResends;
  wire DBG_sendHandlingReply;
  wire DBG_sendHasUnackedSentPacket;
  wire [15:0]DBG_sendLastAckedPacketID;
  wire DBG_sendReplyAck;
  wire ETHCTRL_RecvReady;
  wire ETHCTRL_SendReady;
  wire [31:0]STAT_RecvSessionPacketsDropped;
  wire [31:0]STAT_RecvSessionPacketsInvalid;
  wire [31:0]STAT_RecvSessionPacketsValid;
  wire [31:0]STAT_SendSessionPackets;
  wire clk333_250;
  wire recv_pkt_data_empty;
  wire [31:0]recv_pkt_data_rd_data;
  wire recv_pkt_data_rd_en;
  wire recv_pkt_header_empty;
  wire [31:0]recv_pkt_header_rd_data;
  wire recv_pkt_header_rd_en;
  wire returnPacketsFIFO_empty;
  wire [87:0]returnPacketsFIFO_rd_data;
  wire returnPacketsFIFO_rd_en;
  wire [1:0]\^sendBRAM_addra ;
  wire [2:0]\^sendBRAM_addrb ;
  wire [31:0]sendBRAM_dina;
  wire [31:0]sendBRAM_doutb;
  wire [0:0]sendBRAM_wea;
  wire [10:0]send_pkt_data_count;
  wire [31:0]send_pkt_data_wr_data;
  wire send_pkt_data_wr_en;
  wire send_pkt_header_prog_full;
  wire [31:0]send_pkt_header_wr_data;
  wire send_pkt_header_wr_en;
  wire validPacketsFIFO_prog_full;
  wire [87:6]\^validPacketsFIFO_wr_data ;
  wire validPacketsFIFO_wr_en;

  assign DBG_NetPkt_State[4] = \<const0> ;
  assign DBG_NetPkt_State[3] = \<const0> ;
  assign DBG_NetPkt_State[2:0] = \^DBG_NetPkt_State [2:0];
  assign DBG_RecvFIFOState[4] = \<const0> ;
  assign DBG_RecvFIFOState[3] = \<const0> ;
  assign DBG_RecvFIFOState[2:0] = \^DBG_RecvFIFOState [2:0];
  assign DBG_RecvSessionParseState[4] = \<const0> ;
  assign DBG_RecvSessionParseState[3] = \<const0> ;
  assign DBG_RecvSessionParseState[2:0] = \^DBG_RecvSessionParseState [2:0];
  assign DBG_SendFIFOState[4] = \<const0> ;
  assign DBG_SendFIFOState[3] = \<const0> ;
  assign DBG_SendFIFOState[2:0] = \^DBG_SendFIFOState [2:0];
  assign DBG_SendPacketState[4] = \<const0> ;
  assign DBG_SendPacketState[3:0] = \^DBG_SendPacketState [3:0];
  assign DBG_discardPacketReason[3] = \<const0> ;
  assign DBG_discardPacketReason[2:0] = \^DBG_discardPacketReason [2:0];
  assign DBG_returnPacketsFIFO_empty = returnPacketsFIFO_empty;
  assign DBG_returnPacketsFIFO_rd_data[87:0] = returnPacketsFIFO_rd_data;
  assign DBG_send_pkt_header_prog_full = send_pkt_header_prog_full;
  assign sendBRAM_addra[8] = \<const0> ;
  assign sendBRAM_addra[7] = \<const0> ;
  assign sendBRAM_addra[6] = \<const0> ;
  assign sendBRAM_addra[5] = \<const0> ;
  assign sendBRAM_addra[4] = \<const0> ;
  assign sendBRAM_addra[3] = \<const0> ;
  assign sendBRAM_addra[2] = \<const0> ;
  assign sendBRAM_addra[1:0] = \^sendBRAM_addra [1:0];
  assign sendBRAM_addrb[8] = \<const0> ;
  assign sendBRAM_addrb[7] = \<const0> ;
  assign sendBRAM_addrb[6] = \<const0> ;
  assign sendBRAM_addrb[5] = \<const0> ;
  assign sendBRAM_addrb[4] = \<const0> ;
  assign sendBRAM_addrb[3] = \<const0> ;
  assign sendBRAM_addrb[2:0] = \^sendBRAM_addrb [2:0];
  assign sendBRAM_clka = clk333_250;
  assign sendBRAM_clkb = clk333_250;
  assign sendBRAM_ena = \<const1> ;
  assign sendBRAM_enb = \<const1> ;
  assign validPacketsFIFO_wr_data[87:16] = \^validPacketsFIFO_wr_data [87:16];
  assign validPacketsFIFO_wr_data[15] = \<const0> ;
  assign validPacketsFIFO_wr_data[14] = \<const0> ;
  assign validPacketsFIFO_wr_data[13] = \<const0> ;
  assign validPacketsFIFO_wr_data[12] = \<const0> ;
  assign validPacketsFIFO_wr_data[11] = \<const0> ;
  assign validPacketsFIFO_wr_data[10] = \<const0> ;
  assign validPacketsFIFO_wr_data[9] = \<const0> ;
  assign validPacketsFIFO_wr_data[8] = \<const0> ;
  assign validPacketsFIFO_wr_data[7] = \<const0> ;
  assign validPacketsFIFO_wr_data[6] = \^validPacketsFIFO_wr_data [6];
  assign validPacketsFIFO_wr_data[5] = \<const0> ;
  assign validPacketsFIFO_wr_data[4] = \<const0> ;
  assign validPacketsFIFO_wr_data[3] = \<const0> ;
  assign validPacketsFIFO_wr_data[2] = \<const0> ;
  assign validPacketsFIFO_wr_data[1] = \^validPacketsFIFO_wr_data [6];
  assign validPacketsFIFO_wr_data[0] = \^validPacketsFIFO_wr_data [6];
  GND GND
       (.G(\<const0> ));
  MainDesign_NetProtoPacketProces_0_0_NetProtoPacketProcessor U0
       (.D(DBG_recvLastAckedPacketID),
        .DBG_NetPkt_State(\^DBG_NetPkt_State ),
        .DBG_RecvFIFOState(\^DBG_RecvFIFOState ),
        .DBG_RecvSessionParseState(\^DBG_RecvSessionParseState ),
        .DBG_SendFIFOState(\^DBG_SendFIFOState ),
        .DBG_SendPacketState(\^DBG_SendPacketState ),
        .DBG_discardPacketReason(\^DBG_discardPacketReason ),
        .DBG_recvCurrentPacketLength(DBG_recvCurrentPacketLength),
        .DBG_recvCurrentSubpacket(DBG_recvCurrentSubpacket),
        .DBG_recvCurrentSubpacketIndex(DBG_recvCurrentSubpacketIndex),
        .DBG_recvCurrentSubpacketOffset(DBG_recvCurrentSubpacketOffset),
        .DBG_recvHeaderChecksum(DBG_recvHeaderChecksum),
        .DBG_recvLastSendAckedPacketID(DBG_recvLastSendAckedPacketID),
        .DBG_recvPacketData({DBG_recvPacketData[25:23],DBG_recvPacketData[21:20],DBG_recvPacketData[18],DBG_recvPacketData[15],DBG_recvPacketData[13:11],DBG_recvPacketData[8],DBG_recvPacketData[6]}),
        .DBG_recvValid_Session(DBG_recvValid_Session),
        .DBG_returnPacketsFIFO_rd_en(DBG_returnPacketsFIFO_rd_en),
        .DBG_sendCyclesBetweenAutoResends(DBG_sendCyclesBetweenAutoResends),
        .DBG_sendLastAckedPacketID(DBG_sendLastAckedPacketID),
        .ETHCTRL_RecvReady(ETHCTRL_RecvReady),
        .ETHCTRL_SendReady(ETHCTRL_SendReady),
        .STAT_RecvSessionPacketsDropped(STAT_RecvSessionPacketsDropped),
        .STAT_RecvSessionPacketsInvalid(STAT_RecvSessionPacketsInvalid),
        .STAT_RecvSessionPacketsValid(STAT_RecvSessionPacketsValid),
        .STAT_SendSessionPackets(STAT_SendSessionPackets),
        .clk333_250(clk333_250),
        .\recvPacketHeaderBuffer_reg[0]_0 (DBG_recvPacketData[0]),
        .\recvPacketHeaderBuffer_reg[10]_0 (DBG_recvPacketData[10]),
        .\recvPacketHeaderBuffer_reg[14]_0 (DBG_recvPacketData[14]),
        .\recvPacketHeaderBuffer_reg[16]_0 (DBG_recvPacketData[16]),
        .\recvPacketHeaderBuffer_reg[17]_0 (DBG_recvPacketData[17]),
        .\recvPacketHeaderBuffer_reg[19]_0 (DBG_recvPacketData[19]),
        .\recvPacketHeaderBuffer_reg[1]_0 (DBG_recvPacketData[1]),
        .\recvPacketHeaderBuffer_reg[22]_0 (DBG_recvPacketData[22]),
        .\recvPacketHeaderBuffer_reg[26]_0 (DBG_recvPacketData[26]),
        .\recvPacketHeaderBuffer_reg[27]_0 (DBG_recvPacketData[27]),
        .\recvPacketHeaderBuffer_reg[28]_0 (DBG_recvPacketData[28]),
        .\recvPacketHeaderBuffer_reg[29]_0 (DBG_recvPacketData[29]),
        .\recvPacketHeaderBuffer_reg[2]_0 (DBG_recvPacketData[2]),
        .\recvPacketHeaderBuffer_reg[30]_0 (DBG_recvPacketData[30]),
        .\recvPacketHeaderBuffer_reg[31]_0 (DBG_recvPacketData[31]),
        .\recvPacketHeaderBuffer_reg[32]_0 (DBG_recvPacketData[32]),
        .\recvPacketHeaderBuffer_reg[33]_0 (DBG_recvPacketData[33]),
        .\recvPacketHeaderBuffer_reg[34]_0 (DBG_recvPacketData[34]),
        .\recvPacketHeaderBuffer_reg[35]_0 (DBG_recvPacketData[35]),
        .\recvPacketHeaderBuffer_reg[36]_0 (DBG_recvPacketData[36]),
        .\recvPacketHeaderBuffer_reg[37]_0 (DBG_recvPacketData[37]),
        .\recvPacketHeaderBuffer_reg[38]_0 (DBG_recvPacketData[38]),
        .\recvPacketHeaderBuffer_reg[39]_0 (DBG_recvPacketData[39]),
        .\recvPacketHeaderBuffer_reg[3]_0 (DBG_recvPacketData[3]),
        .\recvPacketHeaderBuffer_reg[40]_0 (DBG_recvPacketData[40]),
        .\recvPacketHeaderBuffer_reg[41]_0 (DBG_recvPacketData[41]),
        .\recvPacketHeaderBuffer_reg[42]_0 (DBG_recvPacketData[42]),
        .\recvPacketHeaderBuffer_reg[43]_0 (DBG_recvPacketData[43]),
        .\recvPacketHeaderBuffer_reg[44]_0 (DBG_recvPacketData[44]),
        .\recvPacketHeaderBuffer_reg[45]_0 (DBG_recvPacketData[45]),
        .\recvPacketHeaderBuffer_reg[46]_0 (DBG_recvPacketData[46]),
        .\recvPacketHeaderBuffer_reg[47]_0 (DBG_recvPacketData[47]),
        .\recvPacketHeaderBuffer_reg[48]_0 (DBG_recvPacketData[48]),
        .\recvPacketHeaderBuffer_reg[49]_0 (DBG_recvPacketData[49]),
        .\recvPacketHeaderBuffer_reg[4]_0 (DBG_recvPacketData[4]),
        .\recvPacketHeaderBuffer_reg[50]_0 (DBG_recvPacketData[50]),
        .\recvPacketHeaderBuffer_reg[51]_0 (DBG_recvPacketData[51]),
        .\recvPacketHeaderBuffer_reg[52]_0 (DBG_recvPacketData[52]),
        .\recvPacketHeaderBuffer_reg[53]_0 (DBG_recvPacketData[53]),
        .\recvPacketHeaderBuffer_reg[54]_0 (DBG_recvPacketData[54]),
        .\recvPacketHeaderBuffer_reg[55]_0 (DBG_recvPacketData[55]),
        .\recvPacketHeaderBuffer_reg[56]_0 (DBG_recvPacketData[56]),
        .\recvPacketHeaderBuffer_reg[57]_0 (DBG_recvPacketData[57]),
        .\recvPacketHeaderBuffer_reg[58]_0 (DBG_recvPacketData[58]),
        .\recvPacketHeaderBuffer_reg[59]_0 (DBG_recvPacketData[59]),
        .\recvPacketHeaderBuffer_reg[5]_0 (DBG_recvPacketData[5]),
        .\recvPacketHeaderBuffer_reg[60]_0 (DBG_recvPacketData[60]),
        .\recvPacketHeaderBuffer_reg[61]_0 (DBG_recvPacketData[61]),
        .\recvPacketHeaderBuffer_reg[62]_0 (DBG_recvPacketData[62]),
        .\recvPacketHeaderBuffer_reg[63]_0 (DBG_recvPacketData[63]),
        .\recvPacketHeaderBuffer_reg[7]_0 (DBG_recvPacketData[7]),
        .\recvPacketHeaderBuffer_reg[9]_0 (DBG_recvPacketData[9]),
        .recvSendReplyPacket_reg_0(DBG_recvSendReplyPacket),
        .recv_pkt_data_empty(recv_pkt_data_empty),
        .recv_pkt_data_rd_data(recv_pkt_data_rd_data),
        .recv_pkt_data_rd_en(recv_pkt_data_rd_en),
        .recv_pkt_header_empty(recv_pkt_header_empty),
        .recv_pkt_header_rd_data(recv_pkt_header_rd_data),
        .recv_pkt_header_rd_en(recv_pkt_header_rd_en),
        .returnPacketsFIFO_empty(returnPacketsFIFO_empty),
        .returnPacketsFIFO_rd_data(returnPacketsFIFO_rd_data[87:16]),
        .returnPacketsFIFO_rd_en(returnPacketsFIFO_rd_en),
        .sendBRAM_addra(\^sendBRAM_addra ),
        .sendBRAM_addrb(\^sendBRAM_addrb ),
        .sendBRAM_dina(sendBRAM_dina),
        .sendBRAM_doutb(sendBRAM_doutb),
        .sendBRAM_wea(sendBRAM_wea),
        .sendHandlingReply_reg_0(DBG_sendHandlingReply),
        .sendHasUnackedSentPacket_reg_0(DBG_sendHasUnackedSentPacket),
        .sendReplyAck_reg_0(DBG_sendReplyAck),
        .send_pkt_data_count(send_pkt_data_count),
        .send_pkt_data_wr_data(send_pkt_data_wr_data),
        .send_pkt_data_wr_en(send_pkt_data_wr_en),
        .send_pkt_header_prog_full(send_pkt_header_prog_full),
        .send_pkt_header_wr_data(send_pkt_header_wr_data),
        .send_pkt_header_wr_en(send_pkt_header_wr_en),
        .validPacketsFIFO_prog_full(validPacketsFIFO_prog_full),
        .validPacketsFIFO_wr_data({\^validPacketsFIFO_wr_data [87:16],\^validPacketsFIFO_wr_data [6]}),
        .validPacketsFIFO_wr_en(validPacketsFIFO_wr_en));
  VCC VCC
       (.P(\<const1> ));
endmodule

(* ORIG_REF_NAME = "NetProtoPacketProcessor" *) 
module MainDesign_NetProtoPacketProces_0_0_NetProtoPacketProcessor
   (sendReplyAck_reg_0,
    recvSendReplyPacket_reg_0,
    sendHandlingReply_reg_0,
    DBG_SendFIFOState,
    \recvPacketHeaderBuffer_reg[0]_0 ,
    DBG_SendPacketState,
    sendHasUnackedSentPacket_reg_0,
    DBG_RecvFIFOState,
    \recvPacketHeaderBuffer_reg[14]_0 ,
    \recvPacketHeaderBuffer_reg[57]_0 ,
    \recvPacketHeaderBuffer_reg[4]_0 ,
    \recvPacketHeaderBuffer_reg[49]_0 ,
    \recvPacketHeaderBuffer_reg[48]_0 ,
    \recvPacketHeaderBuffer_reg[3]_0 ,
    \recvPacketHeaderBuffer_reg[56]_0 ,
    \recvPacketHeaderBuffer_reg[63]_0 ,
    \recvPacketHeaderBuffer_reg[2]_0 ,
    \recvPacketHeaderBuffer_reg[55]_0 ,
    \recvPacketHeaderBuffer_reg[10]_0 ,
    \recvPacketHeaderBuffer_reg[1]_0 ,
    \recvPacketHeaderBuffer_reg[62]_0 ,
    \recvPacketHeaderBuffer_reg[54]_0 ,
    \recvPacketHeaderBuffer_reg[50]_0 ,
    \recvPacketHeaderBuffer_reg[58]_0 ,
    \recvPacketHeaderBuffer_reg[5]_0 ,
    \recvPacketHeaderBuffer_reg[34]_0 ,
    \recvPacketHeaderBuffer_reg[31]_0 ,
    \recvPacketHeaderBuffer_reg[19]_0 ,
    \recvPacketHeaderBuffer_reg[16]_0 ,
    \recvPacketHeaderBuffer_reg[28]_0 ,
    \recvPacketHeaderBuffer_reg[39]_0 ,
    \recvPacketHeaderBuffer_reg[32]_0 ,
    \recvPacketHeaderBuffer_reg[29]_0 ,
    \recvPacketHeaderBuffer_reg[17]_0 ,
    \recvPacketHeaderBuffer_reg[9]_0 ,
    \recvPacketHeaderBuffer_reg[7]_0 ,
    \recvPacketHeaderBuffer_reg[60]_0 ,
    \recvPacketHeaderBuffer_reg[52]_0 ,
    \recvPacketHeaderBuffer_reg[22]_0 ,
    \recvPacketHeaderBuffer_reg[26]_0 ,
    \recvPacketHeaderBuffer_reg[37]_0 ,
    DBG_recvCurrentSubpacketOffset,
    DBG_recvCurrentSubpacket,
    DBG_NetPkt_State,
    \recvPacketHeaderBuffer_reg[61]_0 ,
    \recvPacketHeaderBuffer_reg[59]_0 ,
    \recvPacketHeaderBuffer_reg[53]_0 ,
    \recvPacketHeaderBuffer_reg[51]_0 ,
    \recvPacketHeaderBuffer_reg[47]_0 ,
    \recvPacketHeaderBuffer_reg[46]_0 ,
    \recvPacketHeaderBuffer_reg[45]_0 ,
    \recvPacketHeaderBuffer_reg[44]_0 ,
    \recvPacketHeaderBuffer_reg[43]_0 ,
    \recvPacketHeaderBuffer_reg[42]_0 ,
    \recvPacketHeaderBuffer_reg[41]_0 ,
    \recvPacketHeaderBuffer_reg[40]_0 ,
    \recvPacketHeaderBuffer_reg[38]_0 ,
    \recvPacketHeaderBuffer_reg[36]_0 ,
    \recvPacketHeaderBuffer_reg[35]_0 ,
    \recvPacketHeaderBuffer_reg[33]_0 ,
    \recvPacketHeaderBuffer_reg[30]_0 ,
    \recvPacketHeaderBuffer_reg[27]_0 ,
    DBG_recvPacketData,
    DBG_recvLastSendAckedPacketID,
    D,
    DBG_sendCyclesBetweenAutoResends,
    DBG_recvCurrentSubpacketIndex,
    DBG_recvCurrentPacketLength,
    send_pkt_header_wr_data,
    send_pkt_header_wr_en,
    send_pkt_data_wr_data,
    send_pkt_data_wr_en,
    validPacketsFIFO_wr_data,
    returnPacketsFIFO_rd_en,
    sendBRAM_addra,
    sendBRAM_dina,
    sendBRAM_wea,
    sendBRAM_addrb,
    DBG_RecvSessionParseState,
    DBG_recvValid_Session,
    DBG_recvHeaderChecksum,
    DBG_discardPacketReason,
    DBG_sendLastAckedPacketID,
    DBG_returnPacketsFIFO_rd_en,
    STAT_SendSessionPackets,
    STAT_RecvSessionPacketsValid,
    STAT_RecvSessionPacketsInvalid,
    STAT_RecvSessionPacketsDropped,
    recv_pkt_header_rd_en,
    recv_pkt_data_rd_en,
    validPacketsFIFO_wr_en,
    send_pkt_header_prog_full,
    send_pkt_data_count,
    recv_pkt_data_empty,
    recv_pkt_header_empty,
    recv_pkt_data_rd_data,
    validPacketsFIFO_prog_full,
    clk333_250,
    recv_pkt_header_rd_data,
    returnPacketsFIFO_empty,
    ETHCTRL_SendReady,
    ETHCTRL_RecvReady,
    sendBRAM_doutb,
    returnPacketsFIFO_rd_data);
  output sendReplyAck_reg_0;
  output recvSendReplyPacket_reg_0;
  output sendHandlingReply_reg_0;
  output [2:0]DBG_SendFIFOState;
  output \recvPacketHeaderBuffer_reg[0]_0 ;
  output [3:0]DBG_SendPacketState;
  output sendHasUnackedSentPacket_reg_0;
  output [2:0]DBG_RecvFIFOState;
  output \recvPacketHeaderBuffer_reg[14]_0 ;
  output \recvPacketHeaderBuffer_reg[57]_0 ;
  output \recvPacketHeaderBuffer_reg[4]_0 ;
  output \recvPacketHeaderBuffer_reg[49]_0 ;
  output \recvPacketHeaderBuffer_reg[48]_0 ;
  output \recvPacketHeaderBuffer_reg[3]_0 ;
  output \recvPacketHeaderBuffer_reg[56]_0 ;
  output \recvPacketHeaderBuffer_reg[63]_0 ;
  output \recvPacketHeaderBuffer_reg[2]_0 ;
  output \recvPacketHeaderBuffer_reg[55]_0 ;
  output \recvPacketHeaderBuffer_reg[10]_0 ;
  output \recvPacketHeaderBuffer_reg[1]_0 ;
  output \recvPacketHeaderBuffer_reg[62]_0 ;
  output \recvPacketHeaderBuffer_reg[54]_0 ;
  output \recvPacketHeaderBuffer_reg[50]_0 ;
  output \recvPacketHeaderBuffer_reg[58]_0 ;
  output \recvPacketHeaderBuffer_reg[5]_0 ;
  output \recvPacketHeaderBuffer_reg[34]_0 ;
  output \recvPacketHeaderBuffer_reg[31]_0 ;
  output \recvPacketHeaderBuffer_reg[19]_0 ;
  output \recvPacketHeaderBuffer_reg[16]_0 ;
  output \recvPacketHeaderBuffer_reg[28]_0 ;
  output \recvPacketHeaderBuffer_reg[39]_0 ;
  output \recvPacketHeaderBuffer_reg[32]_0 ;
  output \recvPacketHeaderBuffer_reg[29]_0 ;
  output \recvPacketHeaderBuffer_reg[17]_0 ;
  output \recvPacketHeaderBuffer_reg[9]_0 ;
  output \recvPacketHeaderBuffer_reg[7]_0 ;
  output \recvPacketHeaderBuffer_reg[60]_0 ;
  output \recvPacketHeaderBuffer_reg[52]_0 ;
  output \recvPacketHeaderBuffer_reg[22]_0 ;
  output \recvPacketHeaderBuffer_reg[26]_0 ;
  output \recvPacketHeaderBuffer_reg[37]_0 ;
  output [3:0]DBG_recvCurrentSubpacketOffset;
  output [71:0]DBG_recvCurrentSubpacket;
  output [2:0]DBG_NetPkt_State;
  output \recvPacketHeaderBuffer_reg[61]_0 ;
  output \recvPacketHeaderBuffer_reg[59]_0 ;
  output \recvPacketHeaderBuffer_reg[53]_0 ;
  output \recvPacketHeaderBuffer_reg[51]_0 ;
  output \recvPacketHeaderBuffer_reg[47]_0 ;
  output \recvPacketHeaderBuffer_reg[46]_0 ;
  output \recvPacketHeaderBuffer_reg[45]_0 ;
  output \recvPacketHeaderBuffer_reg[44]_0 ;
  output \recvPacketHeaderBuffer_reg[43]_0 ;
  output \recvPacketHeaderBuffer_reg[42]_0 ;
  output \recvPacketHeaderBuffer_reg[41]_0 ;
  output \recvPacketHeaderBuffer_reg[40]_0 ;
  output \recvPacketHeaderBuffer_reg[38]_0 ;
  output \recvPacketHeaderBuffer_reg[36]_0 ;
  output \recvPacketHeaderBuffer_reg[35]_0 ;
  output \recvPacketHeaderBuffer_reg[33]_0 ;
  output \recvPacketHeaderBuffer_reg[30]_0 ;
  output \recvPacketHeaderBuffer_reg[27]_0 ;
  output [11:0]DBG_recvPacketData;
  output [15:0]DBG_recvLastSendAckedPacketID;
  output [15:0]D;
  output [27:0]DBG_sendCyclesBetweenAutoResends;
  output [7:0]DBG_recvCurrentSubpacketIndex;
  output [15:0]DBG_recvCurrentPacketLength;
  output [31:0]send_pkt_header_wr_data;
  output send_pkt_header_wr_en;
  output [31:0]send_pkt_data_wr_data;
  output send_pkt_data_wr_en;
  output [72:0]validPacketsFIFO_wr_data;
  output returnPacketsFIFO_rd_en;
  output [1:0]sendBRAM_addra;
  output [31:0]sendBRAM_dina;
  output [0:0]sendBRAM_wea;
  output [2:0]sendBRAM_addrb;
  output [2:0]DBG_RecvSessionParseState;
  output [3:0]DBG_recvValid_Session;
  output [7:0]DBG_recvHeaderChecksum;
  output [2:0]DBG_discardPacketReason;
  output [15:0]DBG_sendLastAckedPacketID;
  output DBG_returnPacketsFIFO_rd_en;
  output [31:0]STAT_SendSessionPackets;
  output [31:0]STAT_RecvSessionPacketsValid;
  output [31:0]STAT_RecvSessionPacketsInvalid;
  output [31:0]STAT_RecvSessionPacketsDropped;
  output recv_pkt_header_rd_en;
  output recv_pkt_data_rd_en;
  output validPacketsFIFO_wr_en;
  input send_pkt_header_prog_full;
  input [10:0]send_pkt_data_count;
  input recv_pkt_data_empty;
  input recv_pkt_header_empty;
  input [31:0]recv_pkt_data_rd_data;
  input validPacketsFIFO_prog_full;
  input clk333_250;
  input [31:0]recv_pkt_header_rd_data;
  input returnPacketsFIFO_empty;
  input ETHCTRL_SendReady;
  input ETHCTRL_RecvReady;
  input [31:0]sendBRAM_doutb;
  input [71:0]returnPacketsFIFO_rd_data;

  wire [7:1]CalcNetSessionPacketHeaderChecksum;
  wire [15:0]D;
  wire [2:0]DBG_NetPkt_State;
  wire [2:0]DBG_RecvFIFOState;
  wire [2:0]DBG_RecvSessionParseState;
  wire [2:0]DBG_SendFIFOState;
  wire [3:0]DBG_SendPacketState;
  wire [2:0]DBG_discardPacketReason;
  wire \DBG_discardPacketReason[0]_i_1_n_0 ;
  wire \DBG_discardPacketReason[1]_i_1_n_0 ;
  wire \DBG_discardPacketReason[2]_i_1_n_0 ;
  wire [15:0]DBG_recvCurrentPacketLength;
  wire [71:0]DBG_recvCurrentSubpacket;
  wire [7:0]DBG_recvCurrentSubpacketIndex;
  wire [3:0]DBG_recvCurrentSubpacketOffset;
  wire [7:0]DBG_recvHeaderChecksum;
  wire \DBG_recvHeaderChecksum[0]_i_1_n_0 ;
  wire \DBG_recvHeaderChecksum[1]_i_2_n_0 ;
  wire \DBG_recvHeaderChecksum[1]_i_3_n_0 ;
  wire \DBG_recvHeaderChecksum[2]_i_2_n_0 ;
  wire \DBG_recvHeaderChecksum[2]_i_3_n_0 ;
  wire \DBG_recvHeaderChecksum[2]_i_4_n_0 ;
  wire \DBG_recvHeaderChecksum[2]_i_5_n_0 ;
  wire \DBG_recvHeaderChecksum[2]_i_6_n_0 ;
  wire \DBG_recvHeaderChecksum[3]_i_2_n_0 ;
  wire \DBG_recvHeaderChecksum[3]_i_3_n_0 ;
  wire \DBG_recvHeaderChecksum[3]_i_4_n_0 ;
  wire \DBG_recvHeaderChecksum[3]_i_5_n_0 ;
  wire \DBG_recvHeaderChecksum[3]_i_6_n_0 ;
  wire \DBG_recvHeaderChecksum[3]_i_7_n_0 ;
  wire \DBG_recvHeaderChecksum[3]_i_8_n_0 ;
  wire \DBG_recvHeaderChecksum[4]_i_2_n_0 ;
  wire \DBG_recvHeaderChecksum[4]_i_3_n_0 ;
  wire \DBG_recvHeaderChecksum[4]_i_4_n_0 ;
  wire \DBG_recvHeaderChecksum[4]_i_5_n_0 ;
  wire \DBG_recvHeaderChecksum[4]_i_6_n_0 ;
  wire \DBG_recvHeaderChecksum[4]_i_7_n_0 ;
  wire \DBG_recvHeaderChecksum[4]_i_8_n_0 ;
  wire \DBG_recvHeaderChecksum[4]_i_9_n_0 ;
  wire \DBG_recvHeaderChecksum[5]_i_10_n_0 ;
  wire \DBG_recvHeaderChecksum[5]_i_11_n_0 ;
  wire \DBG_recvHeaderChecksum[5]_i_12_n_0 ;
  wire \DBG_recvHeaderChecksum[5]_i_13_n_0 ;
  wire \DBG_recvHeaderChecksum[5]_i_14_n_0 ;
  wire \DBG_recvHeaderChecksum[5]_i_15_n_0 ;
  wire \DBG_recvHeaderChecksum[5]_i_16_n_0 ;
  wire \DBG_recvHeaderChecksum[5]_i_17_n_0 ;
  wire \DBG_recvHeaderChecksum[5]_i_18_n_0 ;
  wire \DBG_recvHeaderChecksum[5]_i_19_n_0 ;
  wire \DBG_recvHeaderChecksum[5]_i_20_n_0 ;
  wire \DBG_recvHeaderChecksum[5]_i_21_n_0 ;
  wire \DBG_recvHeaderChecksum[5]_i_22_n_0 ;
  wire \DBG_recvHeaderChecksum[5]_i_23_n_0 ;
  wire \DBG_recvHeaderChecksum[5]_i_24_n_0 ;
  wire \DBG_recvHeaderChecksum[5]_i_2_n_0 ;
  wire \DBG_recvHeaderChecksum[5]_i_3_n_0 ;
  wire \DBG_recvHeaderChecksum[5]_i_4_n_0 ;
  wire \DBG_recvHeaderChecksum[5]_i_5_n_0 ;
  wire \DBG_recvHeaderChecksum[5]_i_6_n_0 ;
  wire \DBG_recvHeaderChecksum[5]_i_7_n_0 ;
  wire \DBG_recvHeaderChecksum[5]_i_8_n_0 ;
  wire \DBG_recvHeaderChecksum[5]_i_9_n_0 ;
  wire \DBG_recvHeaderChecksum[6]_i_2_n_0 ;
  wire \DBG_recvHeaderChecksum[6]_i_3_n_0 ;
  wire \DBG_recvHeaderChecksum[6]_i_4_n_0 ;
  wire \DBG_recvHeaderChecksum[7]_i_10_n_0 ;
  wire \DBG_recvHeaderChecksum[7]_i_11_n_0 ;
  wire \DBG_recvHeaderChecksum[7]_i_12_n_0 ;
  wire \DBG_recvHeaderChecksum[7]_i_13_n_0 ;
  wire \DBG_recvHeaderChecksum[7]_i_14_n_0 ;
  wire \DBG_recvHeaderChecksum[7]_i_15_n_0 ;
  wire \DBG_recvHeaderChecksum[7]_i_16_n_0 ;
  wire \DBG_recvHeaderChecksum[7]_i_17_n_0 ;
  wire \DBG_recvHeaderChecksum[7]_i_18_n_0 ;
  wire \DBG_recvHeaderChecksum[7]_i_19_n_0 ;
  wire \DBG_recvHeaderChecksum[7]_i_1_n_0 ;
  wire \DBG_recvHeaderChecksum[7]_i_20_n_0 ;
  wire \DBG_recvHeaderChecksum[7]_i_21_n_0 ;
  wire \DBG_recvHeaderChecksum[7]_i_22_n_0 ;
  wire \DBG_recvHeaderChecksum[7]_i_23_n_0 ;
  wire \DBG_recvHeaderChecksum[7]_i_3_n_0 ;
  wire \DBG_recvHeaderChecksum[7]_i_4_n_0 ;
  wire \DBG_recvHeaderChecksum[7]_i_5_n_0 ;
  wire \DBG_recvHeaderChecksum[7]_i_6_n_0 ;
  wire \DBG_recvHeaderChecksum[7]_i_7_n_0 ;
  wire \DBG_recvHeaderChecksum[7]_i_8_n_0 ;
  wire \DBG_recvHeaderChecksum[7]_i_9_n_0 ;
  wire [15:0]DBG_recvLastSendAckedPacketID;
  wire [11:0]DBG_recvPacketData;
  wire [3:0]DBG_recvValid_Session;
  wire DBG_returnPacketsFIFO_rd_en;
  wire [27:0]DBG_sendCyclesBetweenAutoResends;
  wire [15:0]DBG_sendLastAckedPacketID;
  wire ETHCTRL_RecvReady;
  wire ETHCTRL_SendReady;
  wire \FSM_sequential_sendPacketState[0]_i_2_n_0 ;
  wire \FSM_sequential_sendPacketState_reg_n_0_[0] ;
  wire \FSM_sequential_sendPacketState_reg_n_0_[1] ;
  wire \FSM_sequential_sendPacketState_reg_n_0_[3] ;
  wire [7:0]RotateByteLeft;
  wire [7:0]RotateByteLeft1_in;
  wire [7:0]RotateByteRight;
  wire [7:0]RotateByteRight0_in;
  wire [31:0]STAT_RecvSessionPacketsDropped;
  wire [31:0]STAT_RecvSessionPacketsInvalid;
  wire [31:0]STAT_RecvSessionPacketsValid;
  wire [31:0]STAT_SendSessionPackets;
  wire clk333_250;
  wire [0:0]\currentSessionState[hostMACAddress] ;
  wire [31:0]\currentSessionState_reg[hostIPv4Address] ;
  wire [0:0]currentState;
  wire \currentState[0]__0_i_1_n_0 ;
  wire \currentState[0]_i_1_n_0 ;
  wire \currentState[1]__0_i_1_n_0 ;
  wire \currentState[1]_i_1_n_0 ;
  wire \currentState[2]__0_i_2_n_0 ;
  wire \currentState[2]__0_i_3_n_0 ;
  wire \currentState[2]__0_i_4_n_0 ;
  wire [2:0]currentState__0;
  wire [2:2]currentState__1;
  wire [31:16]data1;
  wire [31:31]data2;
  wire [23:8]data3;
  wire [27:1]in17;
  wire [31:0]in9;
  wire p_41_in;
  wire [0:0]\recvCurrentPacket[hostIPv4Address] ;
  wire \recvCurrentPacket[hostIPv4Address][31]_i_2_n_0 ;
  wire [16:16]\recvCurrentPacket[hostMACAddress] ;
  wire \recvCurrentPacket[hostMACAddress][47]_i_2_n_0 ;
  wire \recvCurrentPacket[hostMACAddress][47]_i_3_n_0 ;
  wire \recvCurrentPacket[hostMACAddress][47]_i_4_n_0 ;
  wire [0:0]\recvCurrentPacket[packetLength] ;
  wire \recvCurrentPacket[packetLength][15]_i_2_n_0 ;
  wire \recvCurrentPacket_reg[hostIPv4Address_n_0_][0] ;
  wire \recvCurrentPacket_reg[hostIPv4Address_n_0_][10] ;
  wire \recvCurrentPacket_reg[hostIPv4Address_n_0_][11] ;
  wire \recvCurrentPacket_reg[hostIPv4Address_n_0_][12] ;
  wire \recvCurrentPacket_reg[hostIPv4Address_n_0_][13] ;
  wire \recvCurrentPacket_reg[hostIPv4Address_n_0_][14] ;
  wire \recvCurrentPacket_reg[hostIPv4Address_n_0_][15] ;
  wire \recvCurrentPacket_reg[hostIPv4Address_n_0_][16] ;
  wire \recvCurrentPacket_reg[hostIPv4Address_n_0_][17] ;
  wire \recvCurrentPacket_reg[hostIPv4Address_n_0_][18] ;
  wire \recvCurrentPacket_reg[hostIPv4Address_n_0_][19] ;
  wire \recvCurrentPacket_reg[hostIPv4Address_n_0_][1] ;
  wire \recvCurrentPacket_reg[hostIPv4Address_n_0_][20] ;
  wire \recvCurrentPacket_reg[hostIPv4Address_n_0_][21] ;
  wire \recvCurrentPacket_reg[hostIPv4Address_n_0_][22] ;
  wire \recvCurrentPacket_reg[hostIPv4Address_n_0_][23] ;
  wire \recvCurrentPacket_reg[hostIPv4Address_n_0_][24] ;
  wire \recvCurrentPacket_reg[hostIPv4Address_n_0_][25] ;
  wire \recvCurrentPacket_reg[hostIPv4Address_n_0_][26] ;
  wire \recvCurrentPacket_reg[hostIPv4Address_n_0_][27] ;
  wire \recvCurrentPacket_reg[hostIPv4Address_n_0_][28] ;
  wire \recvCurrentPacket_reg[hostIPv4Address_n_0_][29] ;
  wire \recvCurrentPacket_reg[hostIPv4Address_n_0_][2] ;
  wire \recvCurrentPacket_reg[hostIPv4Address_n_0_][30] ;
  wire \recvCurrentPacket_reg[hostIPv4Address_n_0_][31] ;
  wire \recvCurrentPacket_reg[hostIPv4Address_n_0_][3] ;
  wire \recvCurrentPacket_reg[hostIPv4Address_n_0_][4] ;
  wire \recvCurrentPacket_reg[hostIPv4Address_n_0_][5] ;
  wire \recvCurrentPacket_reg[hostIPv4Address_n_0_][6] ;
  wire \recvCurrentPacket_reg[hostIPv4Address_n_0_][7] ;
  wire \recvCurrentPacket_reg[hostIPv4Address_n_0_][8] ;
  wire \recvCurrentPacket_reg[hostIPv4Address_n_0_][9] ;
  wire \recvCurrentPacket_reg[hostMACAddress_n_0_][0] ;
  wire \recvCurrentPacket_reg[hostMACAddress_n_0_][10] ;
  wire \recvCurrentPacket_reg[hostMACAddress_n_0_][11] ;
  wire \recvCurrentPacket_reg[hostMACAddress_n_0_][12] ;
  wire \recvCurrentPacket_reg[hostMACAddress_n_0_][13] ;
  wire \recvCurrentPacket_reg[hostMACAddress_n_0_][14] ;
  wire \recvCurrentPacket_reg[hostMACAddress_n_0_][15] ;
  wire \recvCurrentPacket_reg[hostMACAddress_n_0_][16] ;
  wire \recvCurrentPacket_reg[hostMACAddress_n_0_][17] ;
  wire \recvCurrentPacket_reg[hostMACAddress_n_0_][18] ;
  wire \recvCurrentPacket_reg[hostMACAddress_n_0_][19] ;
  wire \recvCurrentPacket_reg[hostMACAddress_n_0_][1] ;
  wire \recvCurrentPacket_reg[hostMACAddress_n_0_][20] ;
  wire \recvCurrentPacket_reg[hostMACAddress_n_0_][21] ;
  wire \recvCurrentPacket_reg[hostMACAddress_n_0_][22] ;
  wire \recvCurrentPacket_reg[hostMACAddress_n_0_][23] ;
  wire \recvCurrentPacket_reg[hostMACAddress_n_0_][24] ;
  wire \recvCurrentPacket_reg[hostMACAddress_n_0_][25] ;
  wire \recvCurrentPacket_reg[hostMACAddress_n_0_][26] ;
  wire \recvCurrentPacket_reg[hostMACAddress_n_0_][27] ;
  wire \recvCurrentPacket_reg[hostMACAddress_n_0_][28] ;
  wire \recvCurrentPacket_reg[hostMACAddress_n_0_][29] ;
  wire \recvCurrentPacket_reg[hostMACAddress_n_0_][2] ;
  wire \recvCurrentPacket_reg[hostMACAddress_n_0_][30] ;
  wire \recvCurrentPacket_reg[hostMACAddress_n_0_][31] ;
  wire \recvCurrentPacket_reg[hostMACAddress_n_0_][32] ;
  wire \recvCurrentPacket_reg[hostMACAddress_n_0_][33] ;
  wire \recvCurrentPacket_reg[hostMACAddress_n_0_][34] ;
  wire \recvCurrentPacket_reg[hostMACAddress_n_0_][35] ;
  wire \recvCurrentPacket_reg[hostMACAddress_n_0_][36] ;
  wire \recvCurrentPacket_reg[hostMACAddress_n_0_][37] ;
  wire \recvCurrentPacket_reg[hostMACAddress_n_0_][38] ;
  wire \recvCurrentPacket_reg[hostMACAddress_n_0_][39] ;
  wire \recvCurrentPacket_reg[hostMACAddress_n_0_][3] ;
  wire \recvCurrentPacket_reg[hostMACAddress_n_0_][40] ;
  wire \recvCurrentPacket_reg[hostMACAddress_n_0_][41] ;
  wire \recvCurrentPacket_reg[hostMACAddress_n_0_][42] ;
  wire \recvCurrentPacket_reg[hostMACAddress_n_0_][43] ;
  wire \recvCurrentPacket_reg[hostMACAddress_n_0_][44] ;
  wire \recvCurrentPacket_reg[hostMACAddress_n_0_][45] ;
  wire \recvCurrentPacket_reg[hostMACAddress_n_0_][46] ;
  wire \recvCurrentPacket_reg[hostMACAddress_n_0_][47] ;
  wire \recvCurrentPacket_reg[hostMACAddress_n_0_][4] ;
  wire \recvCurrentPacket_reg[hostMACAddress_n_0_][5] ;
  wire \recvCurrentPacket_reg[hostMACAddress_n_0_][6] ;
  wire \recvCurrentPacket_reg[hostMACAddress_n_0_][7] ;
  wire \recvCurrentPacket_reg[hostMACAddress_n_0_][8] ;
  wire \recvCurrentPacket_reg[hostMACAddress_n_0_][9] ;
  wire \recvCurrentSubpacketBuffer[0]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[0]_i_2_n_0 ;
  wire \recvCurrentSubpacketBuffer[10]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[10]_i_2_n_0 ;
  wire \recvCurrentSubpacketBuffer[11]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[11]_i_2_n_0 ;
  wire \recvCurrentSubpacketBuffer[12]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[12]_i_2_n_0 ;
  wire \recvCurrentSubpacketBuffer[13]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[13]_i_2_n_0 ;
  wire \recvCurrentSubpacketBuffer[14]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[14]_i_2_n_0 ;
  wire \recvCurrentSubpacketBuffer[15]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[15]_i_2_n_0 ;
  wire \recvCurrentSubpacketBuffer[15]_i_3_n_0 ;
  wire \recvCurrentSubpacketBuffer[15]_i_4_n_0 ;
  wire \recvCurrentSubpacketBuffer[16]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[16]_i_2_n_0 ;
  wire \recvCurrentSubpacketBuffer[17]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[17]_i_2_n_0 ;
  wire \recvCurrentSubpacketBuffer[18]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[18]_i_2_n_0 ;
  wire \recvCurrentSubpacketBuffer[19]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[19]_i_2_n_0 ;
  wire \recvCurrentSubpacketBuffer[1]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[1]_i_2_n_0 ;
  wire \recvCurrentSubpacketBuffer[20]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[20]_i_2_n_0 ;
  wire \recvCurrentSubpacketBuffer[21]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[21]_i_2_n_0 ;
  wire \recvCurrentSubpacketBuffer[22]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[22]_i_2_n_0 ;
  wire \recvCurrentSubpacketBuffer[23]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[23]_i_2_n_0 ;
  wire \recvCurrentSubpacketBuffer[23]_i_3_n_0 ;
  wire \recvCurrentSubpacketBuffer[23]_i_4_n_0 ;
  wire \recvCurrentSubpacketBuffer[24]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[25]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[26]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[27]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[28]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[29]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[2]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[2]_i_2_n_0 ;
  wire \recvCurrentSubpacketBuffer[30]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[31]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[31]_i_2_n_0 ;
  wire \recvCurrentSubpacketBuffer[31]_i_3_n_0 ;
  wire \recvCurrentSubpacketBuffer[31]_i_4_n_0 ;
  wire \recvCurrentSubpacketBuffer[32]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[33]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[34]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[35]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[36]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[37]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[38]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[39]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[39]_i_2_n_0 ;
  wire \recvCurrentSubpacketBuffer[3]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[3]_i_2_n_0 ;
  wire \recvCurrentSubpacketBuffer[40]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[40]_i_2_n_0 ;
  wire \recvCurrentSubpacketBuffer[41]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[41]_i_2_n_0 ;
  wire \recvCurrentSubpacketBuffer[42]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[42]_i_2_n_0 ;
  wire \recvCurrentSubpacketBuffer[43]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[43]_i_2_n_0 ;
  wire \recvCurrentSubpacketBuffer[44]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[44]_i_2_n_0 ;
  wire \recvCurrentSubpacketBuffer[45]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[45]_i_2_n_0 ;
  wire \recvCurrentSubpacketBuffer[46]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[46]_i_2_n_0 ;
  wire \recvCurrentSubpacketBuffer[47]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[47]_i_2_n_0 ;
  wire \recvCurrentSubpacketBuffer[47]_i_3_n_0 ;
  wire \recvCurrentSubpacketBuffer[47]_i_4_n_0 ;
  wire \recvCurrentSubpacketBuffer[48]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[48]_i_2_n_0 ;
  wire \recvCurrentSubpacketBuffer[49]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[49]_i_2_n_0 ;
  wire \recvCurrentSubpacketBuffer[4]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[4]_i_2_n_0 ;
  wire \recvCurrentSubpacketBuffer[50]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[50]_i_2_n_0 ;
  wire \recvCurrentSubpacketBuffer[51]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[51]_i_2_n_0 ;
  wire \recvCurrentSubpacketBuffer[52]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[52]_i_2_n_0 ;
  wire \recvCurrentSubpacketBuffer[53]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[53]_i_2_n_0 ;
  wire \recvCurrentSubpacketBuffer[54]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[54]_i_2_n_0 ;
  wire \recvCurrentSubpacketBuffer[55]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[55]_i_2_n_0 ;
  wire \recvCurrentSubpacketBuffer[55]_i_3_n_0 ;
  wire \recvCurrentSubpacketBuffer[56]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[56]_i_2_n_0 ;
  wire \recvCurrentSubpacketBuffer[57]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[57]_i_2_n_0 ;
  wire \recvCurrentSubpacketBuffer[58]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[58]_i_2_n_0 ;
  wire \recvCurrentSubpacketBuffer[59]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[59]_i_2_n_0 ;
  wire \recvCurrentSubpacketBuffer[5]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[5]_i_2_n_0 ;
  wire \recvCurrentSubpacketBuffer[60]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[60]_i_2_n_0 ;
  wire \recvCurrentSubpacketBuffer[61]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[61]_i_2_n_0 ;
  wire \recvCurrentSubpacketBuffer[62]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[62]_i_2_n_0 ;
  wire \recvCurrentSubpacketBuffer[63]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[63]_i_2_n_0 ;
  wire \recvCurrentSubpacketBuffer[63]_i_3_n_0 ;
  wire \recvCurrentSubpacketBuffer[63]_i_4_n_0 ;
  wire \recvCurrentSubpacketBuffer[64]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[64]_i_2_n_0 ;
  wire \recvCurrentSubpacketBuffer[65]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[65]_i_2_n_0 ;
  wire \recvCurrentSubpacketBuffer[66]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[66]_i_2_n_0 ;
  wire \recvCurrentSubpacketBuffer[67]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[67]_i_2_n_0 ;
  wire \recvCurrentSubpacketBuffer[68]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[68]_i_2_n_0 ;
  wire \recvCurrentSubpacketBuffer[69]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[69]_i_2_n_0 ;
  wire \recvCurrentSubpacketBuffer[6]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[6]_i_2_n_0 ;
  wire \recvCurrentSubpacketBuffer[70]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[70]_i_2_n_0 ;
  wire \recvCurrentSubpacketBuffer[71]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[71]_i_2_n_0 ;
  wire \recvCurrentSubpacketBuffer[71]_i_3_n_0 ;
  wire \recvCurrentSubpacketBuffer[71]_i_4_n_0 ;
  wire \recvCurrentSubpacketBuffer[7]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[7]_i_2_n_0 ;
  wire \recvCurrentSubpacketBuffer[7]_i_3_n_0 ;
  wire \recvCurrentSubpacketBuffer[7]_i_4_n_0 ;
  wire \recvCurrentSubpacketBuffer[8]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[8]_i_2_n_0 ;
  wire \recvCurrentSubpacketBuffer[9]_i_1_n_0 ;
  wire \recvCurrentSubpacketBuffer[9]_i_2_n_0 ;
  wire [7:0]recvCurrentSubpacketCount;
  wire \recvCurrentSubpacketCount[7]_i_1_n_0 ;
  wire [0:0]recvCurrentSubpacketIndex;
  wire \recvCurrentSubpacketIndex[0]_i_1_n_0 ;
  wire \recvCurrentSubpacketIndex[1]_i_1_n_0 ;
  wire \recvCurrentSubpacketIndex[2]_i_1_n_0 ;
  wire \recvCurrentSubpacketIndex[3]_i_1_n_0 ;
  wire \recvCurrentSubpacketIndex[4]_i_1_n_0 ;
  wire \recvCurrentSubpacketIndex[4]_i_2_n_0 ;
  wire \recvCurrentSubpacketIndex[5]_i_1_n_0 ;
  wire \recvCurrentSubpacketIndex[5]_i_2_n_0 ;
  wire \recvCurrentSubpacketIndex[6]_i_1_n_0 ;
  wire \recvCurrentSubpacketIndex[7]_i_2_n_0 ;
  wire \recvCurrentSubpacketIndex[7]_i_3_n_0 ;
  wire [0:0]recvCurrentSubpacketOffset;
  wire \recvCurrentSubpacketOffset[0]_i_1_n_0 ;
  wire \recvCurrentSubpacketOffset[1]_i_1_n_0 ;
  wire \recvCurrentSubpacketOffset[2]_i_1_n_0 ;
  wire \recvCurrentSubpacketOffset[3]_i_2_n_0 ;
  wire \recvCurrentSubpacketOffset[3]_i_3_n_0 ;
  wire \recvCurrentSubpacketOffset[3]_i_4_n_0 ;
  wire [0:0]recvFIFOAccess;
  wire \recvFIFOAccess[1]_i_1_n_0 ;
  wire \recvFIFOAccess[2]_i_1_n_0 ;
  wire \recvFIFOAccess[2]_i_2_n_0 ;
  wire \recvFIFOAccess[2]_i_3_n_0 ;
  wire \recvLastAckedPacketID[15]_i_1_n_0 ;
  wire \recvLastAckedPacketID[15]_i_2_n_0 ;
  wire \recvLastAckedPacketID[15]_i_3_n_0 ;
  wire \recvLastAckedPacketID[15]_i_4_n_0 ;
  wire [0:0]recvLastSendAckedPacketID;
  wire \recvLastSendAckedPacketID[15]_i_2_n_0 ;
  wire \recvLastSendAckedPacketID[15]_i_3_n_0 ;
  wire \recvLastSendAckedPacketID[15]_i_4_n_0 ;
  wire [0:0]recvNextSubpacketOverflowBytes;
  wire \recvNextSubpacketOverflowBytes_reg_n_0_[0] ;
  wire \recvNextSubpacketOverflowBytes_reg_n_0_[10] ;
  wire \recvNextSubpacketOverflowBytes_reg_n_0_[11] ;
  wire \recvNextSubpacketOverflowBytes_reg_n_0_[12] ;
  wire \recvNextSubpacketOverflowBytes_reg_n_0_[13] ;
  wire \recvNextSubpacketOverflowBytes_reg_n_0_[14] ;
  wire \recvNextSubpacketOverflowBytes_reg_n_0_[15] ;
  wire \recvNextSubpacketOverflowBytes_reg_n_0_[16] ;
  wire \recvNextSubpacketOverflowBytes_reg_n_0_[17] ;
  wire \recvNextSubpacketOverflowBytes_reg_n_0_[18] ;
  wire \recvNextSubpacketOverflowBytes_reg_n_0_[19] ;
  wire \recvNextSubpacketOverflowBytes_reg_n_0_[1] ;
  wire \recvNextSubpacketOverflowBytes_reg_n_0_[20] ;
  wire \recvNextSubpacketOverflowBytes_reg_n_0_[21] ;
  wire \recvNextSubpacketOverflowBytes_reg_n_0_[22] ;
  wire \recvNextSubpacketOverflowBytes_reg_n_0_[23] ;
  wire \recvNextSubpacketOverflowBytes_reg_n_0_[2] ;
  wire \recvNextSubpacketOverflowBytes_reg_n_0_[3] ;
  wire \recvNextSubpacketOverflowBytes_reg_n_0_[4] ;
  wire \recvNextSubpacketOverflowBytes_reg_n_0_[5] ;
  wire \recvNextSubpacketOverflowBytes_reg_n_0_[6] ;
  wire \recvNextSubpacketOverflowBytes_reg_n_0_[7] ;
  wire \recvNextSubpacketOverflowBytes_reg_n_0_[8] ;
  wire \recvNextSubpacketOverflowBytes_reg_n_0_[9] ;
  wire recvPacketAllValid_i_1_n_0;
  wire recvPacketAllValid_reg_n_0;
  wire recvPacketCanProcess;
  wire recvPacketCanProcess_i_1_n_0;
  wire \recvPacketHeaderBuffer[31]_i_1_n_0 ;
  wire \recvPacketHeaderBuffer[31]_i_2_n_0 ;
  wire \recvPacketHeaderBuffer[31]_i_3_n_0 ;
  wire \recvPacketHeaderBuffer[31]_i_4_n_0 ;
  wire \recvPacketHeaderBuffer[63]_i_1_n_0 ;
  wire \recvPacketHeaderBuffer[63]_i_2_n_0 ;
  wire \recvPacketHeaderBuffer[63]_i_3_n_0 ;
  wire \recvPacketHeaderBuffer[63]_i_4_n_0 ;
  wire \recvPacketHeaderBuffer_reg[0]_0 ;
  wire \recvPacketHeaderBuffer_reg[10]_0 ;
  wire \recvPacketHeaderBuffer_reg[14]_0 ;
  wire \recvPacketHeaderBuffer_reg[16]_0 ;
  wire \recvPacketHeaderBuffer_reg[17]_0 ;
  wire \recvPacketHeaderBuffer_reg[19]_0 ;
  wire \recvPacketHeaderBuffer_reg[1]_0 ;
  wire \recvPacketHeaderBuffer_reg[22]_0 ;
  wire \recvPacketHeaderBuffer_reg[26]_0 ;
  wire \recvPacketHeaderBuffer_reg[27]_0 ;
  wire \recvPacketHeaderBuffer_reg[28]_0 ;
  wire \recvPacketHeaderBuffer_reg[29]_0 ;
  wire \recvPacketHeaderBuffer_reg[2]_0 ;
  wire \recvPacketHeaderBuffer_reg[30]_0 ;
  wire \recvPacketHeaderBuffer_reg[31]_0 ;
  wire \recvPacketHeaderBuffer_reg[32]_0 ;
  wire \recvPacketHeaderBuffer_reg[33]_0 ;
  wire \recvPacketHeaderBuffer_reg[34]_0 ;
  wire \recvPacketHeaderBuffer_reg[35]_0 ;
  wire \recvPacketHeaderBuffer_reg[36]_0 ;
  wire \recvPacketHeaderBuffer_reg[37]_0 ;
  wire \recvPacketHeaderBuffer_reg[38]_0 ;
  wire \recvPacketHeaderBuffer_reg[39]_0 ;
  wire \recvPacketHeaderBuffer_reg[3]_0 ;
  wire \recvPacketHeaderBuffer_reg[40]_0 ;
  wire \recvPacketHeaderBuffer_reg[41]_0 ;
  wire \recvPacketHeaderBuffer_reg[42]_0 ;
  wire \recvPacketHeaderBuffer_reg[43]_0 ;
  wire \recvPacketHeaderBuffer_reg[44]_0 ;
  wire \recvPacketHeaderBuffer_reg[45]_0 ;
  wire \recvPacketHeaderBuffer_reg[46]_0 ;
  wire \recvPacketHeaderBuffer_reg[47]_0 ;
  wire \recvPacketHeaderBuffer_reg[48]_0 ;
  wire \recvPacketHeaderBuffer_reg[49]_0 ;
  wire \recvPacketHeaderBuffer_reg[4]_0 ;
  wire \recvPacketHeaderBuffer_reg[50]_0 ;
  wire \recvPacketHeaderBuffer_reg[51]_0 ;
  wire \recvPacketHeaderBuffer_reg[52]_0 ;
  wire \recvPacketHeaderBuffer_reg[53]_0 ;
  wire \recvPacketHeaderBuffer_reg[54]_0 ;
  wire \recvPacketHeaderBuffer_reg[55]_0 ;
  wire \recvPacketHeaderBuffer_reg[56]_0 ;
  wire \recvPacketHeaderBuffer_reg[57]_0 ;
  wire \recvPacketHeaderBuffer_reg[58]_0 ;
  wire \recvPacketHeaderBuffer_reg[59]_0 ;
  wire \recvPacketHeaderBuffer_reg[5]_0 ;
  wire \recvPacketHeaderBuffer_reg[60]_0 ;
  wire \recvPacketHeaderBuffer_reg[61]_0 ;
  wire \recvPacketHeaderBuffer_reg[62]_0 ;
  wire \recvPacketHeaderBuffer_reg[63]_0 ;
  wire \recvPacketHeaderBuffer_reg[7]_0 ;
  wire \recvPacketHeaderBuffer_reg[9]_0 ;
  wire [2:0]recvPacketSessionValid;
  wire \recvPacketSessionValid[2]_i_1_n_0 ;
  wire \recvPacketSessionValid[3]_i_1_n_0 ;
  wire \recvPacketSessionValid[3]_i_2_n_0 ;
  wire [0:0]recvParseState;
  wire \recvParseState[0]__0_i_1_n_0 ;
  wire \recvParseState[1]__0_i_1_n_0 ;
  wire \recvParseState[2]__0_i_2_n_0 ;
  wire \recvParseState[2]__0_i_3_n_0 ;
  wire \recvParseState[2]__0_i_4_n_0 ;
  wire \recvParseState[2]__0_i_5_n_0 ;
  wire \recvParseState[2]__0_i_6_n_0 ;
  wire \recvParseState[2]__0_i_7_n_0 ;
  wire \recvParseState[2]__0_i_8_n_0 ;
  wire \recvParseState[2]__0_i_9_n_0 ;
  wire [2:0]recvParseState__0;
  wire [2:0]recvParseState__1;
  wire recvPumpFIFO;
  wire recvPumpFIFO_i_1_n_0;
  wire recvPumpFIFO_i_3_n_0;
  wire recvPumpFIFO_i_4_n_0;
  wire recvPumpFIFO_i_5_n_0;
  wire recvPumpFIFO_i_6_n_0;
  wire recvPumpFIFO_reg_n_0;
  wire [0:0]recvReplyStatus;
  wire \recvReplyStatus[0]_i_1_n_0 ;
  wire \recvReplyStatus[1]_i_1_n_0 ;
  wire \recvReplyStatus[2]_i_10_n_0 ;
  wire \recvReplyStatus[2]_i_11_n_0 ;
  wire \recvReplyStatus[2]_i_12_n_0 ;
  wire \recvReplyStatus[2]_i_13_n_0 ;
  wire \recvReplyStatus[2]_i_15_n_0 ;
  wire \recvReplyStatus[2]_i_16_n_0 ;
  wire \recvReplyStatus[2]_i_17_n_0 ;
  wire \recvReplyStatus[2]_i_18_n_0 ;
  wire \recvReplyStatus[2]_i_19_n_0 ;
  wire \recvReplyStatus[2]_i_20_n_0 ;
  wire \recvReplyStatus[2]_i_21_n_0 ;
  wire \recvReplyStatus[2]_i_22_n_0 ;
  wire \recvReplyStatus[2]_i_23_n_0 ;
  wire \recvReplyStatus[2]_i_24_n_0 ;
  wire \recvReplyStatus[2]_i_25_n_0 ;
  wire \recvReplyStatus[2]_i_26_n_0 ;
  wire \recvReplyStatus[2]_i_27_n_0 ;
  wire \recvReplyStatus[2]_i_28_n_0 ;
  wire \recvReplyStatus[2]_i_29_n_0 ;
  wire \recvReplyStatus[2]_i_2_n_0 ;
  wire \recvReplyStatus[2]_i_30_n_0 ;
  wire \recvReplyStatus[2]_i_31_n_0 ;
  wire \recvReplyStatus[2]_i_32_n_0 ;
  wire \recvReplyStatus[2]_i_33_n_0 ;
  wire \recvReplyStatus[2]_i_34_n_0 ;
  wire \recvReplyStatus[2]_i_35_n_0 ;
  wire \recvReplyStatus[2]_i_36_n_0 ;
  wire \recvReplyStatus[2]_i_37_n_0 ;
  wire \recvReplyStatus[2]_i_38_n_0 ;
  wire \recvReplyStatus[2]_i_3_n_0 ;
  wire \recvReplyStatus[2]_i_4_n_0 ;
  wire \recvReplyStatus[2]_i_5_n_0 ;
  wire \recvReplyStatus[2]_i_7_n_0 ;
  wire \recvReplyStatus[2]_i_8_n_0 ;
  wire \recvReplyStatus[2]_i_9_n_0 ;
  wire \recvReplyStatus_reg[2]_i_14_n_0 ;
  wire \recvReplyStatus_reg[2]_i_14_n_1 ;
  wire \recvReplyStatus_reg[2]_i_14_n_2 ;
  wire \recvReplyStatus_reg[2]_i_14_n_3 ;
  wire \recvReplyStatus_reg[2]_i_14_n_4 ;
  wire \recvReplyStatus_reg[2]_i_14_n_5 ;
  wire \recvReplyStatus_reg[2]_i_14_n_6 ;
  wire \recvReplyStatus_reg[2]_i_14_n_7 ;
  wire \recvReplyStatus_reg[2]_i_6_n_5 ;
  wire \recvReplyStatus_reg[2]_i_6_n_6 ;
  wire \recvReplyStatus_reg[2]_i_6_n_7 ;
  wire \recvReplyStatus_reg_n_0_[0] ;
  wire \recvReplyStatus_reg_n_0_[1] ;
  wire \recvReplyStatus_reg_n_0_[2] ;
  wire recvSendReplyPacket_i_10_n_0;
  wire recvSendReplyPacket_i_11_n_0;
  wire recvSendReplyPacket_i_12_n_0;
  wire recvSendReplyPacket_i_13_n_0;
  wire recvSendReplyPacket_i_14_n_0;
  wire recvSendReplyPacket_i_15_n_0;
  wire recvSendReplyPacket_i_16_n_0;
  wire recvSendReplyPacket_i_17_n_0;
  wire recvSendReplyPacket_i_18_n_0;
  wire recvSendReplyPacket_i_19_n_0;
  wire recvSendReplyPacket_i_1_n_0;
  wire recvSendReplyPacket_i_20_n_0;
  wire recvSendReplyPacket_i_21_n_0;
  wire recvSendReplyPacket_i_22_n_0;
  wire recvSendReplyPacket_i_23_n_0;
  wire recvSendReplyPacket_i_24_n_0;
  wire recvSendReplyPacket_i_25_n_0;
  wire recvSendReplyPacket_i_26_n_0;
  wire recvSendReplyPacket_i_27_n_0;
  wire recvSendReplyPacket_i_28_n_0;
  wire recvSendReplyPacket_i_29_n_0;
  wire recvSendReplyPacket_i_2_n_0;
  wire recvSendReplyPacket_i_30_n_0;
  wire recvSendReplyPacket_i_31_n_0;
  wire recvSendReplyPacket_i_32_n_0;
  wire recvSendReplyPacket_i_33_n_0;
  wire recvSendReplyPacket_i_34_n_0;
  wire recvSendReplyPacket_i_35_n_0;
  wire recvSendReplyPacket_i_36_n_0;
  wire recvSendReplyPacket_i_37_n_0;
  wire recvSendReplyPacket_i_38_n_0;
  wire recvSendReplyPacket_i_39_n_0;
  wire recvSendReplyPacket_i_3_n_0;
  wire recvSendReplyPacket_i_40_n_0;
  wire recvSendReplyPacket_i_41_n_0;
  wire recvSendReplyPacket_i_42_n_0;
  wire recvSendReplyPacket_i_43_n_0;
  wire recvSendReplyPacket_i_44_n_0;
  wire recvSendReplyPacket_i_4_n_0;
  wire recvSendReplyPacket_i_5_n_0;
  wire recvSendReplyPacket_i_6_n_0;
  wire recvSendReplyPacket_i_7_n_0;
  wire recvSendReplyPacket_i_8_n_0;
  wire recvSendReplyPacket_i_9_n_0;
  wire recvSendReplyPacket_reg_0;
  wire recvSessionDisconnectSignal_i_1_n_0;
  wire recvSessionDisconnectSignal_reg_n_0;
  wire recv_pkt_data_empty;
  wire [31:0]recv_pkt_data_rd_data;
  wire recv_pkt_data_rd_en;
  wire recv_pkt_data_rd_en_i_1_n_0;
  wire recv_pkt_data_rd_en_i_2_n_0;
  wire recv_pkt_data_rd_en_i_3_n_0;
  wire recv_pkt_data_rd_en_i_4_n_0;
  wire recv_pkt_data_rd_en_i_5_n_0;
  wire recv_pkt_data_rd_en_i_6_n_0;
  wire recv_pkt_data_rd_en_i_7_n_0;
  wire recv_pkt_header_empty;
  wire [31:0]recv_pkt_header_rd_data;
  wire recv_pkt_header_rd_en;
  wire recv_pkt_header_rd_en_i_1_n_0;
  wire recv_pkt_header_rd_en_i_2_n_0;
  wire recv_pkt_header_rd_en_i_3_n_0;
  wire recv_pkt_header_rd_en_i_4_n_0;
  wire recv_pkt_header_rd_en_i_5_n_0;
  wire returnPacketsFIFO_empty;
  wire [71:0]returnPacketsFIFO_rd_data;
  wire returnPacketsFIFO_rd_en;
  wire returnPacketsFIFO_rd_en_i_1_n_0;
  wire [1:0]sendBRAM_addra;
  wire \sendBRAM_addra[0]_i_1_n_0 ;
  wire \sendBRAM_addra[1]_i_1_n_0 ;
  wire \sendBRAM_addra[1]_i_2_n_0 ;
  wire [2:0]sendBRAM_addrb;
  wire \sendBRAM_addrb[2]_i_1_n_0 ;
  wire [31:0]sendBRAM_dina;
  wire \sendBRAM_dina[0]_i_1_n_0 ;
  wire \sendBRAM_dina[10]_i_1_n_0 ;
  wire \sendBRAM_dina[11]_i_1_n_0 ;
  wire \sendBRAM_dina[12]_i_1_n_0 ;
  wire \sendBRAM_dina[13]_i_1_n_0 ;
  wire \sendBRAM_dina[14]_i_1_n_0 ;
  wire \sendBRAM_dina[15]_i_1_n_0 ;
  wire \sendBRAM_dina[16]_i_1_n_0 ;
  wire \sendBRAM_dina[17]_i_1_n_0 ;
  wire \sendBRAM_dina[18]_i_1_n_0 ;
  wire \sendBRAM_dina[19]_i_1_n_0 ;
  wire \sendBRAM_dina[1]_i_1_n_0 ;
  wire \sendBRAM_dina[20]_i_1_n_0 ;
  wire \sendBRAM_dina[21]_i_1_n_0 ;
  wire \sendBRAM_dina[22]_i_1_n_0 ;
  wire \sendBRAM_dina[23]_i_1_n_0 ;
  wire \sendBRAM_dina[24]_i_1_n_0 ;
  wire \sendBRAM_dina[25]_i_1_n_0 ;
  wire \sendBRAM_dina[26]_i_1_n_0 ;
  wire \sendBRAM_dina[27]_i_1_n_0 ;
  wire \sendBRAM_dina[28]_i_1_n_0 ;
  wire \sendBRAM_dina[29]_i_1_n_0 ;
  wire \sendBRAM_dina[2]_i_1_n_0 ;
  wire \sendBRAM_dina[30]_i_1_n_0 ;
  wire \sendBRAM_dina[31]_i_1_n_0 ;
  wire \sendBRAM_dina[3]_i_1_n_0 ;
  wire \sendBRAM_dina[4]_i_1_n_0 ;
  wire \sendBRAM_dina[5]_i_1_n_0 ;
  wire \sendBRAM_dina[6]_i_1_n_0 ;
  wire \sendBRAM_dina[7]_i_1_n_0 ;
  wire \sendBRAM_dina[8]_i_1_n_0 ;
  wire \sendBRAM_dina[9]_i_1_n_0 ;
  wire [31:0]sendBRAM_doutb;
  wire [0:0]sendBRAM_wea;
  wire \sendClocksBetweenBroadcastsWait[0]_i_1_n_0 ;
  wire \sendClocksBetweenBroadcastsWait[16]_i_2_n_0 ;
  wire \sendClocksBetweenBroadcastsWait[16]_i_3_n_0 ;
  wire \sendClocksBetweenBroadcastsWait[16]_i_4_n_0 ;
  wire \sendClocksBetweenBroadcastsWait[16]_i_5_n_0 ;
  wire \sendClocksBetweenBroadcastsWait[16]_i_6_n_0 ;
  wire \sendClocksBetweenBroadcastsWait[16]_i_7_n_0 ;
  wire \sendClocksBetweenBroadcastsWait[16]_i_8_n_0 ;
  wire \sendClocksBetweenBroadcastsWait[16]_i_9_n_0 ;
  wire \sendClocksBetweenBroadcastsWait[21]_i_2_n_0 ;
  wire \sendClocksBetweenBroadcastsWait[21]_i_3_n_0 ;
  wire \sendClocksBetweenBroadcastsWait[21]_i_4_n_0 ;
  wire \sendClocksBetweenBroadcastsWait[21]_i_5_n_0 ;
  wire \sendClocksBetweenBroadcastsWait[21]_i_6_n_0 ;
  wire \sendClocksBetweenBroadcastsWait[21]_i_7_n_0 ;
  wire \sendClocksBetweenBroadcastsWait[21]_i_8_n_0 ;
  wire \sendClocksBetweenBroadcastsWait[21]_i_9_n_0 ;
  wire \sendClocksBetweenBroadcastsWait[31]_i_10_n_0 ;
  wire \sendClocksBetweenBroadcastsWait[31]_i_11_n_0 ;
  wire \sendClocksBetweenBroadcastsWait[31]_i_12_n_0 ;
  wire \sendClocksBetweenBroadcastsWait[31]_i_13_n_0 ;
  wire \sendClocksBetweenBroadcastsWait[31]_i_14_n_0 ;
  wire \sendClocksBetweenBroadcastsWait[31]_i_15_n_0 ;
  wire \sendClocksBetweenBroadcastsWait[31]_i_16_n_0 ;
  wire \sendClocksBetweenBroadcastsWait[31]_i_17_n_0 ;
  wire \sendClocksBetweenBroadcastsWait[31]_i_18_n_0 ;
  wire \sendClocksBetweenBroadcastsWait[31]_i_19_n_0 ;
  wire \sendClocksBetweenBroadcastsWait[31]_i_1_n_0 ;
  wire \sendClocksBetweenBroadcastsWait[31]_i_20_n_0 ;
  wire \sendClocksBetweenBroadcastsWait[31]_i_21_n_0 ;
  wire \sendClocksBetweenBroadcastsWait[31]_i_22_n_0 ;
  wire \sendClocksBetweenBroadcastsWait[31]_i_23_n_0 ;
  wire \sendClocksBetweenBroadcastsWait[31]_i_24_n_0 ;
  wire \sendClocksBetweenBroadcastsWait[31]_i_25_n_0 ;
  wire \sendClocksBetweenBroadcastsWait[31]_i_26_n_0 ;
  wire \sendClocksBetweenBroadcastsWait[31]_i_27_n_0 ;
  wire \sendClocksBetweenBroadcastsWait[31]_i_28_n_0 ;
  wire \sendClocksBetweenBroadcastsWait[31]_i_29_n_0 ;
  wire \sendClocksBetweenBroadcastsWait[31]_i_2_n_0 ;
  wire \sendClocksBetweenBroadcastsWait[31]_i_4_n_0 ;
  wire \sendClocksBetweenBroadcastsWait[31]_i_5_n_0 ;
  wire \sendClocksBetweenBroadcastsWait[31]_i_6_n_0 ;
  wire \sendClocksBetweenBroadcastsWait[31]_i_7_n_0 ;
  wire \sendClocksBetweenBroadcastsWait[31]_i_8_n_0 ;
  wire \sendClocksBetweenBroadcastsWait[31]_i_9_n_0 ;
  wire \sendClocksBetweenBroadcastsWait[5]_i_2_n_0 ;
  wire \sendClocksBetweenBroadcastsWait[5]_i_3_n_0 ;
  wire \sendClocksBetweenBroadcastsWait[5]_i_4_n_0 ;
  wire \sendClocksBetweenBroadcastsWait[5]_i_5_n_0 ;
  wire \sendClocksBetweenBroadcastsWait[5]_i_6_n_0 ;
  wire \sendClocksBetweenBroadcastsWait[5]_i_7_n_0 ;
  wire \sendClocksBetweenBroadcastsWait[5]_i_8_n_0 ;
  wire \sendClocksBetweenBroadcastsWait[5]_i_9_n_0 ;
  wire \sendClocksBetweenBroadcastsWait_reg[16]_i_1_n_0 ;
  wire \sendClocksBetweenBroadcastsWait_reg[16]_i_1_n_1 ;
  wire \sendClocksBetweenBroadcastsWait_reg[16]_i_1_n_10 ;
  wire \sendClocksBetweenBroadcastsWait_reg[16]_i_1_n_11 ;
  wire \sendClocksBetweenBroadcastsWait_reg[16]_i_1_n_12 ;
  wire \sendClocksBetweenBroadcastsWait_reg[16]_i_1_n_13 ;
  wire \sendClocksBetweenBroadcastsWait_reg[16]_i_1_n_14 ;
  wire \sendClocksBetweenBroadcastsWait_reg[16]_i_1_n_15 ;
  wire \sendClocksBetweenBroadcastsWait_reg[16]_i_1_n_2 ;
  wire \sendClocksBetweenBroadcastsWait_reg[16]_i_1_n_3 ;
  wire \sendClocksBetweenBroadcastsWait_reg[16]_i_1_n_4 ;
  wire \sendClocksBetweenBroadcastsWait_reg[16]_i_1_n_5 ;
  wire \sendClocksBetweenBroadcastsWait_reg[16]_i_1_n_6 ;
  wire \sendClocksBetweenBroadcastsWait_reg[16]_i_1_n_7 ;
  wire \sendClocksBetweenBroadcastsWait_reg[16]_i_1_n_8 ;
  wire \sendClocksBetweenBroadcastsWait_reg[16]_i_1_n_9 ;
  wire \sendClocksBetweenBroadcastsWait_reg[21]_i_1_n_0 ;
  wire \sendClocksBetweenBroadcastsWait_reg[21]_i_1_n_1 ;
  wire \sendClocksBetweenBroadcastsWait_reg[21]_i_1_n_10 ;
  wire \sendClocksBetweenBroadcastsWait_reg[21]_i_1_n_11 ;
  wire \sendClocksBetweenBroadcastsWait_reg[21]_i_1_n_12 ;
  wire \sendClocksBetweenBroadcastsWait_reg[21]_i_1_n_13 ;
  wire \sendClocksBetweenBroadcastsWait_reg[21]_i_1_n_14 ;
  wire \sendClocksBetweenBroadcastsWait_reg[21]_i_1_n_15 ;
  wire \sendClocksBetweenBroadcastsWait_reg[21]_i_1_n_2 ;
  wire \sendClocksBetweenBroadcastsWait_reg[21]_i_1_n_3 ;
  wire \sendClocksBetweenBroadcastsWait_reg[21]_i_1_n_4 ;
  wire \sendClocksBetweenBroadcastsWait_reg[21]_i_1_n_5 ;
  wire \sendClocksBetweenBroadcastsWait_reg[21]_i_1_n_6 ;
  wire \sendClocksBetweenBroadcastsWait_reg[21]_i_1_n_7 ;
  wire \sendClocksBetweenBroadcastsWait_reg[21]_i_1_n_8 ;
  wire \sendClocksBetweenBroadcastsWait_reg[21]_i_1_n_9 ;
  wire \sendClocksBetweenBroadcastsWait_reg[31]_i_3_n_10 ;
  wire \sendClocksBetweenBroadcastsWait_reg[31]_i_3_n_11 ;
  wire \sendClocksBetweenBroadcastsWait_reg[31]_i_3_n_12 ;
  wire \sendClocksBetweenBroadcastsWait_reg[31]_i_3_n_13 ;
  wire \sendClocksBetweenBroadcastsWait_reg[31]_i_3_n_14 ;
  wire \sendClocksBetweenBroadcastsWait_reg[31]_i_3_n_15 ;
  wire \sendClocksBetweenBroadcastsWait_reg[31]_i_3_n_2 ;
  wire \sendClocksBetweenBroadcastsWait_reg[31]_i_3_n_3 ;
  wire \sendClocksBetweenBroadcastsWait_reg[31]_i_3_n_4 ;
  wire \sendClocksBetweenBroadcastsWait_reg[31]_i_3_n_5 ;
  wire \sendClocksBetweenBroadcastsWait_reg[31]_i_3_n_6 ;
  wire \sendClocksBetweenBroadcastsWait_reg[31]_i_3_n_7 ;
  wire \sendClocksBetweenBroadcastsWait_reg[31]_i_3_n_9 ;
  wire \sendClocksBetweenBroadcastsWait_reg[5]_i_1_n_0 ;
  wire \sendClocksBetweenBroadcastsWait_reg[5]_i_1_n_1 ;
  wire \sendClocksBetweenBroadcastsWait_reg[5]_i_1_n_10 ;
  wire \sendClocksBetweenBroadcastsWait_reg[5]_i_1_n_11 ;
  wire \sendClocksBetweenBroadcastsWait_reg[5]_i_1_n_12 ;
  wire \sendClocksBetweenBroadcastsWait_reg[5]_i_1_n_13 ;
  wire \sendClocksBetweenBroadcastsWait_reg[5]_i_1_n_14 ;
  wire \sendClocksBetweenBroadcastsWait_reg[5]_i_1_n_15 ;
  wire \sendClocksBetweenBroadcastsWait_reg[5]_i_1_n_2 ;
  wire \sendClocksBetweenBroadcastsWait_reg[5]_i_1_n_3 ;
  wire \sendClocksBetweenBroadcastsWait_reg[5]_i_1_n_4 ;
  wire \sendClocksBetweenBroadcastsWait_reg[5]_i_1_n_5 ;
  wire \sendClocksBetweenBroadcastsWait_reg[5]_i_1_n_6 ;
  wire \sendClocksBetweenBroadcastsWait_reg[5]_i_1_n_7 ;
  wire \sendClocksBetweenBroadcastsWait_reg[5]_i_1_n_8 ;
  wire \sendClocksBetweenBroadcastsWait_reg[5]_i_1_n_9 ;
  wire \sendClocksBetweenBroadcastsWait_reg_n_0_[0] ;
  wire \sendClocksBetweenBroadcastsWait_reg_n_0_[10] ;
  wire \sendClocksBetweenBroadcastsWait_reg_n_0_[11] ;
  wire \sendClocksBetweenBroadcastsWait_reg_n_0_[12] ;
  wire \sendClocksBetweenBroadcastsWait_reg_n_0_[13] ;
  wire \sendClocksBetweenBroadcastsWait_reg_n_0_[14] ;
  wire \sendClocksBetweenBroadcastsWait_reg_n_0_[15] ;
  wire \sendClocksBetweenBroadcastsWait_reg_n_0_[16] ;
  wire \sendClocksBetweenBroadcastsWait_reg_n_0_[17] ;
  wire \sendClocksBetweenBroadcastsWait_reg_n_0_[18] ;
  wire \sendClocksBetweenBroadcastsWait_reg_n_0_[19] ;
  wire \sendClocksBetweenBroadcastsWait_reg_n_0_[1] ;
  wire \sendClocksBetweenBroadcastsWait_reg_n_0_[20] ;
  wire \sendClocksBetweenBroadcastsWait_reg_n_0_[21] ;
  wire \sendClocksBetweenBroadcastsWait_reg_n_0_[22] ;
  wire \sendClocksBetweenBroadcastsWait_reg_n_0_[23] ;
  wire \sendClocksBetweenBroadcastsWait_reg_n_0_[24] ;
  wire \sendClocksBetweenBroadcastsWait_reg_n_0_[25] ;
  wire \sendClocksBetweenBroadcastsWait_reg_n_0_[26] ;
  wire \sendClocksBetweenBroadcastsWait_reg_n_0_[27] ;
  wire \sendClocksBetweenBroadcastsWait_reg_n_0_[28] ;
  wire \sendClocksBetweenBroadcastsWait_reg_n_0_[29] ;
  wire \sendClocksBetweenBroadcastsWait_reg_n_0_[2] ;
  wire \sendClocksBetweenBroadcastsWait_reg_n_0_[30] ;
  wire \sendClocksBetweenBroadcastsWait_reg_n_0_[31] ;
  wire \sendClocksBetweenBroadcastsWait_reg_n_0_[3] ;
  wire \sendClocksBetweenBroadcastsWait_reg_n_0_[4] ;
  wire \sendClocksBetweenBroadcastsWait_reg_n_0_[5] ;
  wire \sendClocksBetweenBroadcastsWait_reg_n_0_[6] ;
  wire \sendClocksBetweenBroadcastsWait_reg_n_0_[7] ;
  wire \sendClocksBetweenBroadcastsWait_reg_n_0_[8] ;
  wire \sendClocksBetweenBroadcastsWait_reg_n_0_[9] ;
  wire \sendCurrentPacket[hostIPv4Address][0]_i_1_n_0 ;
  wire \sendCurrentPacket[hostIPv4Address][10]_i_1_n_0 ;
  wire \sendCurrentPacket[hostIPv4Address][11]_i_1_n_0 ;
  wire \sendCurrentPacket[hostIPv4Address][12]_i_1_n_0 ;
  wire \sendCurrentPacket[hostIPv4Address][13]_i_1_n_0 ;
  wire \sendCurrentPacket[hostIPv4Address][14]_i_1_n_0 ;
  wire \sendCurrentPacket[hostIPv4Address][15]_i_1_n_0 ;
  wire \sendCurrentPacket[hostIPv4Address][16]_i_1_n_0 ;
  wire \sendCurrentPacket[hostIPv4Address][17]_i_1_n_0 ;
  wire \sendCurrentPacket[hostIPv4Address][18]_i_1_n_0 ;
  wire \sendCurrentPacket[hostIPv4Address][19]_i_1_n_0 ;
  wire \sendCurrentPacket[hostIPv4Address][1]_i_1_n_0 ;
  wire \sendCurrentPacket[hostIPv4Address][20]_i_1_n_0 ;
  wire \sendCurrentPacket[hostIPv4Address][21]_i_1_n_0 ;
  wire \sendCurrentPacket[hostIPv4Address][22]_i_1_n_0 ;
  wire \sendCurrentPacket[hostIPv4Address][23]_i_1_n_0 ;
  wire \sendCurrentPacket[hostIPv4Address][24]_i_1_n_0 ;
  wire \sendCurrentPacket[hostIPv4Address][25]_i_1_n_0 ;
  wire \sendCurrentPacket[hostIPv4Address][26]_i_1_n_0 ;
  wire \sendCurrentPacket[hostIPv4Address][27]_i_1_n_0 ;
  wire \sendCurrentPacket[hostIPv4Address][28]_i_1_n_0 ;
  wire \sendCurrentPacket[hostIPv4Address][29]_i_1_n_0 ;
  wire \sendCurrentPacket[hostIPv4Address][2]_i_1_n_0 ;
  wire \sendCurrentPacket[hostIPv4Address][30]_i_1_n_0 ;
  wire \sendCurrentPacket[hostIPv4Address][31]_i_1_n_0 ;
  wire \sendCurrentPacket[hostIPv4Address][3]_i_1_n_0 ;
  wire \sendCurrentPacket[hostIPv4Address][4]_i_1_n_0 ;
  wire \sendCurrentPacket[hostIPv4Address][5]_i_1_n_0 ;
  wire \sendCurrentPacket[hostIPv4Address][6]_i_1_n_0 ;
  wire \sendCurrentPacket[hostIPv4Address][7]_i_1_n_0 ;
  wire \sendCurrentPacket[hostIPv4Address][8]_i_1_n_0 ;
  wire \sendCurrentPacket[hostIPv4Address][9]_i_1_n_0 ;
  wire [0:0]\sendCurrentPacket[hostMACAddress] ;
  wire \sendCurrentPacket[hostMACAddress][0]_i_1_n_0 ;
  wire \sendCurrentPacket[hostMACAddress][10]_i_1_n_0 ;
  wire \sendCurrentPacket[hostMACAddress][11]_i_1_n_0 ;
  wire \sendCurrentPacket[hostMACAddress][12]_i_1_n_0 ;
  wire \sendCurrentPacket[hostMACAddress][13]_i_1_n_0 ;
  wire \sendCurrentPacket[hostMACAddress][14]_i_1_n_0 ;
  wire \sendCurrentPacket[hostMACAddress][15]_i_1_n_0 ;
  wire \sendCurrentPacket[hostMACAddress][16]_i_1_n_0 ;
  wire \sendCurrentPacket[hostMACAddress][17]_i_1_n_0 ;
  wire \sendCurrentPacket[hostMACAddress][18]_i_1_n_0 ;
  wire \sendCurrentPacket[hostMACAddress][19]_i_1_n_0 ;
  wire \sendCurrentPacket[hostMACAddress][1]_i_1_n_0 ;
  wire \sendCurrentPacket[hostMACAddress][20]_i_1_n_0 ;
  wire \sendCurrentPacket[hostMACAddress][21]_i_1_n_0 ;
  wire \sendCurrentPacket[hostMACAddress][22]_i_1_n_0 ;
  wire \sendCurrentPacket[hostMACAddress][23]_i_1_n_0 ;
  wire \sendCurrentPacket[hostMACAddress][24]_i_1_n_0 ;
  wire \sendCurrentPacket[hostMACAddress][25]_i_1_n_0 ;
  wire \sendCurrentPacket[hostMACAddress][26]_i_1_n_0 ;
  wire \sendCurrentPacket[hostMACAddress][27]_i_1_n_0 ;
  wire \sendCurrentPacket[hostMACAddress][28]_i_1_n_0 ;
  wire \sendCurrentPacket[hostMACAddress][29]_i_1_n_0 ;
  wire \sendCurrentPacket[hostMACAddress][2]_i_1_n_0 ;
  wire \sendCurrentPacket[hostMACAddress][30]_i_1_n_0 ;
  wire \sendCurrentPacket[hostMACAddress][31]_i_1_n_0 ;
  wire \sendCurrentPacket[hostMACAddress][32]_i_1_n_0 ;
  wire \sendCurrentPacket[hostMACAddress][33]_i_1_n_0 ;
  wire \sendCurrentPacket[hostMACAddress][34]_i_1_n_0 ;
  wire \sendCurrentPacket[hostMACAddress][35]_i_1_n_0 ;
  wire \sendCurrentPacket[hostMACAddress][36]_i_1_n_0 ;
  wire \sendCurrentPacket[hostMACAddress][37]_i_1_n_0 ;
  wire \sendCurrentPacket[hostMACAddress][38]_i_1_n_0 ;
  wire \sendCurrentPacket[hostMACAddress][39]_i_1_n_0 ;
  wire \sendCurrentPacket[hostMACAddress][3]_i_1_n_0 ;
  wire \sendCurrentPacket[hostMACAddress][40]_i_1_n_0 ;
  wire \sendCurrentPacket[hostMACAddress][41]_i_1_n_0 ;
  wire \sendCurrentPacket[hostMACAddress][42]_i_1_n_0 ;
  wire \sendCurrentPacket[hostMACAddress][43]_i_1_n_0 ;
  wire \sendCurrentPacket[hostMACAddress][44]_i_1_n_0 ;
  wire \sendCurrentPacket[hostMACAddress][45]_i_1_n_0 ;
  wire \sendCurrentPacket[hostMACAddress][46]_i_1_n_0 ;
  wire \sendCurrentPacket[hostMACAddress][47]_i_10_n_0 ;
  wire \sendCurrentPacket[hostMACAddress][47]_i_11_n_0 ;
  wire \sendCurrentPacket[hostMACAddress][47]_i_2_n_0 ;
  wire \sendCurrentPacket[hostMACAddress][47]_i_3_n_0 ;
  wire \sendCurrentPacket[hostMACAddress][47]_i_4_n_0 ;
  wire \sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ;
  wire \sendCurrentPacket[hostMACAddress][47]_i_6_n_0 ;
  wire \sendCurrentPacket[hostMACAddress][47]_i_7_n_0 ;
  wire \sendCurrentPacket[hostMACAddress][47]_i_8_n_0 ;
  wire \sendCurrentPacket[hostMACAddress][47]_i_9_n_0 ;
  wire \sendCurrentPacket[hostMACAddress][4]_i_1_n_0 ;
  wire \sendCurrentPacket[hostMACAddress][5]_i_1_n_0 ;
  wire \sendCurrentPacket[hostMACAddress][6]_i_1_n_0 ;
  wire \sendCurrentPacket[hostMACAddress][7]_i_1_n_0 ;
  wire \sendCurrentPacket[hostMACAddress][8]_i_1_n_0 ;
  wire \sendCurrentPacket[hostMACAddress][9]_i_1_n_0 ;
  wire [0:0]\sendCurrentPacket[packetLength] ;
  wire \sendCurrentPacket[packetLength][15]_i_1_n_0 ;
  wire \sendCurrentPacket[packetLength][15]_i_3_n_0 ;
  wire \sendCurrentPacket[packetLength][1]_i_1_n_0 ;
  wire \sendCurrentPacket[packetLength][4]_i_1_n_0 ;
  wire [31:0]\sendCurrentPacket_reg[hostIPv4Address] ;
  wire [47:0]\sendCurrentPacket_reg[hostMACAddress] ;
  wire [15:0]\sendCurrentPacket_reg[packetLength] ;
  wire [0:0]sendCyclesBetweenAutoResends;
  wire \sendCyclesBetweenAutoResends[0]_i_1_n_0 ;
  wire \sendCyclesBetweenAutoResends[27]_i_10_n_0 ;
  wire \sendCyclesBetweenAutoResends[27]_i_1_n_0 ;
  wire \sendCyclesBetweenAutoResends[27]_i_4_n_0 ;
  wire \sendCyclesBetweenAutoResends[27]_i_5_n_0 ;
  wire \sendCyclesBetweenAutoResends[27]_i_6_n_0 ;
  wire \sendCyclesBetweenAutoResends[27]_i_7_n_0 ;
  wire \sendCyclesBetweenAutoResends[27]_i_8_n_0 ;
  wire \sendCyclesBetweenAutoResends[27]_i_9_n_0 ;
  wire \sendCyclesBetweenAutoResends_reg[16]_i_1_n_0 ;
  wire \sendCyclesBetweenAutoResends_reg[16]_i_1_n_1 ;
  wire \sendCyclesBetweenAutoResends_reg[16]_i_1_n_2 ;
  wire \sendCyclesBetweenAutoResends_reg[16]_i_1_n_3 ;
  wire \sendCyclesBetweenAutoResends_reg[16]_i_1_n_4 ;
  wire \sendCyclesBetweenAutoResends_reg[16]_i_1_n_5 ;
  wire \sendCyclesBetweenAutoResends_reg[16]_i_1_n_6 ;
  wire \sendCyclesBetweenAutoResends_reg[16]_i_1_n_7 ;
  wire \sendCyclesBetweenAutoResends_reg[24]_i_1_n_0 ;
  wire \sendCyclesBetweenAutoResends_reg[24]_i_1_n_1 ;
  wire \sendCyclesBetweenAutoResends_reg[24]_i_1_n_2 ;
  wire \sendCyclesBetweenAutoResends_reg[24]_i_1_n_3 ;
  wire \sendCyclesBetweenAutoResends_reg[24]_i_1_n_4 ;
  wire \sendCyclesBetweenAutoResends_reg[24]_i_1_n_5 ;
  wire \sendCyclesBetweenAutoResends_reg[24]_i_1_n_6 ;
  wire \sendCyclesBetweenAutoResends_reg[24]_i_1_n_7 ;
  wire \sendCyclesBetweenAutoResends_reg[27]_i_3_n_6 ;
  wire \sendCyclesBetweenAutoResends_reg[27]_i_3_n_7 ;
  wire \sendCyclesBetweenAutoResends_reg[8]_i_1_n_0 ;
  wire \sendCyclesBetweenAutoResends_reg[8]_i_1_n_1 ;
  wire \sendCyclesBetweenAutoResends_reg[8]_i_1_n_2 ;
  wire \sendCyclesBetweenAutoResends_reg[8]_i_1_n_3 ;
  wire \sendCyclesBetweenAutoResends_reg[8]_i_1_n_4 ;
  wire \sendCyclesBetweenAutoResends_reg[8]_i_1_n_5 ;
  wire \sendCyclesBetweenAutoResends_reg[8]_i_1_n_6 ;
  wire \sendCyclesBetweenAutoResends_reg[8]_i_1_n_7 ;
  wire [0:0]sendFIFOAccess;
  wire \sendFIFOAccess[1]_i_1_n_0 ;
  wire \sendFIFOAccess[2]_i_10_n_0 ;
  wire \sendFIFOAccess[2]_i_1_n_0 ;
  wire \sendFIFOAccess[2]_i_2_n_0 ;
  wire \sendFIFOAccess[2]_i_3_n_0 ;
  wire \sendFIFOAccess[2]_i_4_n_0 ;
  wire \sendFIFOAccess[2]_i_5_n_0 ;
  wire \sendFIFOAccess[2]_i_6_n_0 ;
  wire \sendFIFOAccess[2]_i_7_n_0 ;
  wire \sendFIFOAccess[2]_i_8_n_0 ;
  wire \sendFIFOAccess[2]_i_9_n_0 ;
  wire sendHandlingReply_i_1_n_0;
  wire sendHandlingReply_i_2_n_0;
  wire sendHandlingReply_reg_0;
  wire sendHasRepliedSuccessfulConnection;
  wire sendHasRepliedSuccessfulConnection_i_1_n_0;
  wire sendHasRepliedSuccessfulConnection_i_2_n_0;
  wire sendHasRepliedSuccessfulConnection_reg_n_0;
  wire sendHasUnackedSentPacket_i_10_n_0;
  wire sendHasUnackedSentPacket_i_11_n_0;
  wire sendHasUnackedSentPacket_i_12_n_0;
  wire sendHasUnackedSentPacket_i_13_n_0;
  wire sendHasUnackedSentPacket_i_14_n_0;
  wire sendHasUnackedSentPacket_i_15_n_0;
  wire sendHasUnackedSentPacket_i_16_n_0;
  wire sendHasUnackedSentPacket_i_17_n_0;
  wire sendHasUnackedSentPacket_i_18_n_0;
  wire sendHasUnackedSentPacket_i_19_n_0;
  wire sendHasUnackedSentPacket_i_1_n_0;
  wire sendHasUnackedSentPacket_i_20_n_0;
  wire sendHasUnackedSentPacket_i_21_n_0;
  wire sendHasUnackedSentPacket_i_22_n_0;
  wire sendHasUnackedSentPacket_i_2_n_0;
  wire sendHasUnackedSentPacket_i_3_n_0;
  wire sendHasUnackedSentPacket_i_4_n_0;
  wire sendHasUnackedSentPacket_i_5_n_0;
  wire sendHasUnackedSentPacket_i_6_n_0;
  wire sendHasUnackedSentPacket_i_7_n_0;
  wire sendHasUnackedSentPacket_i_8_n_0;
  wire sendHasUnackedSentPacket_i_9_n_0;
  wire sendHasUnackedSentPacket_reg_0;
  wire \sendLastAckedPacketID[15]_i_10_n_0 ;
  wire \sendLastAckedPacketID[15]_i_11_n_0 ;
  wire \sendLastAckedPacketID[15]_i_1_n_0 ;
  wire \sendLastAckedPacketID[15]_i_2_n_0 ;
  wire \sendLastAckedPacketID[15]_i_3_n_0 ;
  wire \sendLastAckedPacketID[15]_i_4_n_0 ;
  wire \sendLastAckedPacketID[15]_i_5_n_0 ;
  wire \sendLastAckedPacketID[15]_i_6_n_0 ;
  wire \sendLastAckedPacketID[15]_i_7_n_0 ;
  wire \sendLastAckedPacketID[15]_i_8_n_0 ;
  wire \sendLastAckedPacketID[15]_i_9_n_0 ;
  wire \sendLastSendPacketID[0]_i_1_n_0 ;
  wire \sendLastSendPacketID[10]_i_1_n_0 ;
  wire \sendLastSendPacketID[10]_i_2_n_0 ;
  wire \sendLastSendPacketID[11]_i_1_n_0 ;
  wire \sendLastSendPacketID[12]_i_1_n_0 ;
  wire \sendLastSendPacketID[13]_i_1_n_0 ;
  wire \sendLastSendPacketID[14]_i_1_n_0 ;
  wire \sendLastSendPacketID[15]_i_1_n_0 ;
  wire \sendLastSendPacketID[15]_i_2_n_0 ;
  wire \sendLastSendPacketID[15]_i_3_n_0 ;
  wire \sendLastSendPacketID[15]_i_4_n_0 ;
  wire \sendLastSendPacketID[15]_i_5_n_0 ;
  wire \sendLastSendPacketID[1]_i_1_n_0 ;
  wire \sendLastSendPacketID[2]_i_1_n_0 ;
  wire \sendLastSendPacketID[3]_i_1_n_0 ;
  wire \sendLastSendPacketID[4]_i_1_n_0 ;
  wire \sendLastSendPacketID[5]_i_1_n_0 ;
  wire \sendLastSendPacketID[6]_i_1_n_0 ;
  wire \sendLastSendPacketID[7]_i_1_n_0 ;
  wire \sendLastSendPacketID[8]_i_1_n_0 ;
  wire \sendLastSendPacketID[9]_i_1_n_0 ;
  wire \sendLastSendPacketID_reg_n_0_[0] ;
  wire \sendLastSendPacketID_reg_n_0_[10] ;
  wire \sendLastSendPacketID_reg_n_0_[11] ;
  wire \sendLastSendPacketID_reg_n_0_[12] ;
  wire \sendLastSendPacketID_reg_n_0_[13] ;
  wire \sendLastSendPacketID_reg_n_0_[14] ;
  wire \sendLastSendPacketID_reg_n_0_[15] ;
  wire \sendLastSendPacketID_reg_n_0_[1] ;
  wire \sendLastSendPacketID_reg_n_0_[2] ;
  wire \sendLastSendPacketID_reg_n_0_[3] ;
  wire \sendLastSendPacketID_reg_n_0_[4] ;
  wire \sendLastSendPacketID_reg_n_0_[5] ;
  wire \sendLastSendPacketID_reg_n_0_[6] ;
  wire \sendLastSendPacketID_reg_n_0_[7] ;
  wire \sendLastSendPacketID_reg_n_0_[8] ;
  wire \sendLastSendPacketID_reg_n_0_[9] ;
  wire [0:0]\sendLastSentPacketHeader[lastAckedPacketID] ;
  wire \sendLastSentPacketHeader[lastAckedPacketID][15]_i_2_n_0 ;
  wire [0:0]\sendLastSentPacketHeader[packetChecksum] ;
  wire \sendLastSentPacketHeader[packetChecksum][7]_i_10_n_0 ;
  wire \sendLastSentPacketHeader[packetChecksum][7]_i_11_n_0 ;
  wire \sendLastSentPacketHeader[packetChecksum][7]_i_12_n_0 ;
  wire \sendLastSentPacketHeader[packetChecksum][7]_i_13_n_0 ;
  wire \sendLastSentPacketHeader[packetChecksum][7]_i_14_n_0 ;
  wire \sendLastSentPacketHeader[packetChecksum][7]_i_15_n_0 ;
  wire \sendLastSentPacketHeader[packetChecksum][7]_i_18_n_0 ;
  wire \sendLastSentPacketHeader[packetChecksum][7]_i_19_n_0 ;
  wire \sendLastSentPacketHeader[packetChecksum][7]_i_20_n_0 ;
  wire \sendLastSentPacketHeader[packetChecksum][7]_i_21_n_0 ;
  wire \sendLastSentPacketHeader[packetChecksum][7]_i_22_n_0 ;
  wire \sendLastSentPacketHeader[packetChecksum][7]_i_23_n_0 ;
  wire \sendLastSentPacketHeader[packetChecksum][7]_i_24_n_0 ;
  wire \sendLastSentPacketHeader[packetChecksum][7]_i_25_n_0 ;
  wire \sendLastSentPacketHeader[packetChecksum][7]_i_26_n_0 ;
  wire \sendLastSentPacketHeader[packetChecksum][7]_i_27_n_0 ;
  wire \sendLastSentPacketHeader[packetChecksum][7]_i_28_n_0 ;
  wire \sendLastSentPacketHeader[packetChecksum][7]_i_29_n_0 ;
  wire \sendLastSentPacketHeader[packetChecksum][7]_i_2_n_0 ;
  wire \sendLastSentPacketHeader[packetChecksum][7]_i_30_n_0 ;
  wire \sendLastSentPacketHeader[packetChecksum][7]_i_31_n_0 ;
  wire \sendLastSentPacketHeader[packetChecksum][7]_i_32_n_0 ;
  wire \sendLastSentPacketHeader[packetChecksum][7]_i_33_n_0 ;
  wire \sendLastSentPacketHeader[packetChecksum][7]_i_34_n_0 ;
  wire \sendLastSentPacketHeader[packetChecksum][7]_i_35_n_0 ;
  wire \sendLastSentPacketHeader[packetChecksum][7]_i_36_n_0 ;
  wire \sendLastSentPacketHeader[packetChecksum][7]_i_37_n_0 ;
  wire \sendLastSentPacketHeader[packetChecksum][7]_i_38_n_0 ;
  wire \sendLastSentPacketHeader[packetChecksum][7]_i_3_n_0 ;
  wire \sendLastSentPacketHeader[packetChecksum][7]_i_4_n_0 ;
  wire \sendLastSentPacketHeader[packetChecksum][7]_i_5_n_0 ;
  wire \sendLastSentPacketHeader[packetChecksum][7]_i_6_n_0 ;
  wire \sendLastSentPacketHeader[packetChecksum][7]_i_7_n_0 ;
  wire \sendLastSentPacketHeader[packetChecksum][7]_i_8_n_0 ;
  wire \sendLastSentPacketHeader[packetChecksum][7]_i_9_n_0 ;
  wire [0:0]\sendLastSentPacketHeader[packetType] ;
  wire [7:0]\sendLastSentPacketHeader_reg[packetChecksum] ;
  wire \sendLastSentPacketHeader_reg[packetChecksum][7]_i_16_n_14 ;
  wire \sendLastSentPacketHeader_reg[packetChecksum][7]_i_16_n_15 ;
  wire \sendLastSentPacketHeader_reg[packetChecksum][7]_i_16_n_6 ;
  wire \sendLastSentPacketHeader_reg[packetChecksum][7]_i_16_n_7 ;
  wire \sendLastSentPacketHeader_reg[packetChecksum][7]_i_17_n_1 ;
  wire \sendLastSentPacketHeader_reg[packetChecksum][7]_i_17_n_10 ;
  wire \sendLastSentPacketHeader_reg[packetChecksum][7]_i_17_n_11 ;
  wire \sendLastSentPacketHeader_reg[packetChecksum][7]_i_17_n_12 ;
  wire \sendLastSentPacketHeader_reg[packetChecksum][7]_i_17_n_13 ;
  wire \sendLastSentPacketHeader_reg[packetChecksum][7]_i_17_n_14 ;
  wire \sendLastSentPacketHeader_reg[packetChecksum][7]_i_17_n_15 ;
  wire \sendLastSentPacketHeader_reg[packetChecksum][7]_i_17_n_2 ;
  wire \sendLastSentPacketHeader_reg[packetChecksum][7]_i_17_n_3 ;
  wire \sendLastSentPacketHeader_reg[packetChecksum][7]_i_17_n_4 ;
  wire \sendLastSentPacketHeader_reg[packetChecksum][7]_i_17_n_5 ;
  wire \sendLastSentPacketHeader_reg[packetChecksum][7]_i_17_n_6 ;
  wire \sendLastSentPacketHeader_reg[packetChecksum][7]_i_17_n_7 ;
  wire \sendLastSentPacketHeader_reg[packetChecksum][7]_i_17_n_8 ;
  wire \sendLastSentPacketHeader_reg[packetChecksum][7]_i_17_n_9 ;
  wire \sendLastSentPacketHeader_reg[packetChecksum][7]_i_1_n_1 ;
  wire \sendLastSentPacketHeader_reg[packetChecksum][7]_i_1_n_10 ;
  wire \sendLastSentPacketHeader_reg[packetChecksum][7]_i_1_n_11 ;
  wire \sendLastSentPacketHeader_reg[packetChecksum][7]_i_1_n_12 ;
  wire \sendLastSentPacketHeader_reg[packetChecksum][7]_i_1_n_13 ;
  wire \sendLastSentPacketHeader_reg[packetChecksum][7]_i_1_n_14 ;
  wire \sendLastSentPacketHeader_reg[packetChecksum][7]_i_1_n_15 ;
  wire \sendLastSentPacketHeader_reg[packetChecksum][7]_i_1_n_2 ;
  wire \sendLastSentPacketHeader_reg[packetChecksum][7]_i_1_n_3 ;
  wire \sendLastSentPacketHeader_reg[packetChecksum][7]_i_1_n_4 ;
  wire \sendLastSentPacketHeader_reg[packetChecksum][7]_i_1_n_5 ;
  wire \sendLastSentPacketHeader_reg[packetChecksum][7]_i_1_n_6 ;
  wire \sendLastSentPacketHeader_reg[packetChecksum][7]_i_1_n_7 ;
  wire \sendLastSentPacketHeader_reg[packetChecksum][7]_i_1_n_8 ;
  wire \sendLastSentPacketHeader_reg[packetChecksum][7]_i_1_n_9 ;
  wire \sendLastSentPacketHeader_reg[packetFlags] ;
  wire \sendLastSentPacketHeader_reg[subpacketCount_n_0_][0] ;
  wire \sendNumBroadcastsSinceReset[0]_i_1_n_0 ;
  wire \sendNumBroadcastsSinceReset[10]_i_1_n_0 ;
  wire \sendNumBroadcastsSinceReset[10]_i_2_n_0 ;
  wire \sendNumBroadcastsSinceReset[11]_i_1_n_0 ;
  wire \sendNumBroadcastsSinceReset[12]_i_1_n_0 ;
  wire \sendNumBroadcastsSinceReset[13]_i_1_n_0 ;
  wire \sendNumBroadcastsSinceReset[14]_i_1_n_0 ;
  wire \sendNumBroadcastsSinceReset[14]_i_2_n_0 ;
  wire \sendNumBroadcastsSinceReset[15]_i_1_n_0 ;
  wire \sendNumBroadcastsSinceReset[15]_i_2_n_0 ;
  wire \sendNumBroadcastsSinceReset[15]_i_3_n_0 ;
  wire \sendNumBroadcastsSinceReset[15]_i_4_n_0 ;
  wire \sendNumBroadcastsSinceReset[1]_i_1_n_0 ;
  wire \sendNumBroadcastsSinceReset[2]_i_1_n_0 ;
  wire \sendNumBroadcastsSinceReset[3]_i_1_n_0 ;
  wire \sendNumBroadcastsSinceReset[4]_i_1_n_0 ;
  wire \sendNumBroadcastsSinceReset[5]_i_1_n_0 ;
  wire \sendNumBroadcastsSinceReset[5]_i_2_n_0 ;
  wire \sendNumBroadcastsSinceReset[6]_i_1_n_0 ;
  wire \sendNumBroadcastsSinceReset[7]_i_1_n_0 ;
  wire \sendNumBroadcastsSinceReset[8]_i_1_n_0 ;
  wire \sendNumBroadcastsSinceReset[9]_i_1_n_0 ;
  wire \sendNumBroadcastsSinceReset[9]_i_2_n_0 ;
  wire \sendNumBroadcastsSinceReset_reg_n_0_[0] ;
  wire \sendNumBroadcastsSinceReset_reg_n_0_[10] ;
  wire \sendNumBroadcastsSinceReset_reg_n_0_[11] ;
  wire \sendNumBroadcastsSinceReset_reg_n_0_[12] ;
  wire \sendNumBroadcastsSinceReset_reg_n_0_[13] ;
  wire \sendNumBroadcastsSinceReset_reg_n_0_[14] ;
  wire \sendNumBroadcastsSinceReset_reg_n_0_[15] ;
  wire \sendNumBroadcastsSinceReset_reg_n_0_[1] ;
  wire \sendNumBroadcastsSinceReset_reg_n_0_[2] ;
  wire \sendNumBroadcastsSinceReset_reg_n_0_[3] ;
  wire \sendNumBroadcastsSinceReset_reg_n_0_[4] ;
  wire \sendNumBroadcastsSinceReset_reg_n_0_[5] ;
  wire \sendNumBroadcastsSinceReset_reg_n_0_[6] ;
  wire \sendNumBroadcastsSinceReset_reg_n_0_[7] ;
  wire \sendNumBroadcastsSinceReset_reg_n_0_[8] ;
  wire \sendNumBroadcastsSinceReset_reg_n_0_[9] ;
  wire \sendPacketHeaderBuffer[10]_i_1_n_0 ;
  wire \sendPacketHeaderBuffer[119]_i_1_n_0 ;
  wire \sendPacketHeaderBuffer[16]_i_1_n_0 ;
  wire \sendPacketHeaderBuffer[28]_i_1_n_0 ;
  wire \sendPacketHeaderBuffer[8]_i_1_n_0 ;
  wire \sendPacketHeaderBuffer[9]_i_1_n_0 ;
  wire \sendPacketHeaderBuffer_reg_n_0_[10] ;
  wire \sendPacketHeaderBuffer_reg_n_0_[16] ;
  wire \sendPacketHeaderBuffer_reg_n_0_[28] ;
  wire \sendPacketHeaderBuffer_reg_n_0_[4] ;
  wire \sendPacketHeaderBuffer_reg_n_0_[8] ;
  wire \sendPacketHeaderBuffer_reg_n_0_[9] ;
  wire [0:0]sendPacketState;
  wire \sendPacketState[0]_i_1_n_0 ;
  wire \sendPacketState[0]_i_2_n_0 ;
  wire \sendPacketState[1]_i_1_n_0 ;
  wire \sendPacketState[2]_i_1_n_0 ;
  wire \sendPacketState[3]_i_2_n_0 ;
  wire \sendPacketState[3]_i_3_n_0 ;
  wire [2:2]sendPacketState__0;
  wire [3:0]sendPacketState__1;
  wire sendReplyAck_i_1_n_0;
  wire sendReplyAck_i_2_n_0;
  wire sendReplyAck_reg_0;
  wire [10:0]send_pkt_data_count;
  wire [31:0]send_pkt_data_wr_data;
  wire [31:0]send_pkt_data_wr_data0_in;
  wire \send_pkt_data_wr_data[0]_i_2_n_0 ;
  wire \send_pkt_data_wr_data[10]_i_2_n_0 ;
  wire \send_pkt_data_wr_data[10]_i_3_n_0 ;
  wire \send_pkt_data_wr_data[10]_i_4_n_0 ;
  wire \send_pkt_data_wr_data[10]_i_5_n_0 ;
  wire \send_pkt_data_wr_data[11]_i_2_n_0 ;
  wire \send_pkt_data_wr_data[12]_i_2_n_0 ;
  wire \send_pkt_data_wr_data[13]_i_2_n_0 ;
  wire \send_pkt_data_wr_data[14]_i_2_n_0 ;
  wire \send_pkt_data_wr_data[15]_i_2_n_0 ;
  wire \send_pkt_data_wr_data[16]_i_2_n_0 ;
  wire \send_pkt_data_wr_data[16]_i_3_n_0 ;
  wire \send_pkt_data_wr_data[17]_i_2_n_0 ;
  wire \send_pkt_data_wr_data[17]_i_3_n_0 ;
  wire \send_pkt_data_wr_data[18]_i_2_n_0 ;
  wire \send_pkt_data_wr_data[18]_i_3_n_0 ;
  wire \send_pkt_data_wr_data[19]_i_2_n_0 ;
  wire \send_pkt_data_wr_data[1]_i_2_n_0 ;
  wire \send_pkt_data_wr_data[20]_i_2_n_0 ;
  wire \send_pkt_data_wr_data[21]_i_2_n_0 ;
  wire \send_pkt_data_wr_data[21]_i_3_n_0 ;
  wire \send_pkt_data_wr_data[22]_i_2_n_0 ;
  wire \send_pkt_data_wr_data[23]_i_2_n_0 ;
  wire \send_pkt_data_wr_data[24]_i_2_n_0 ;
  wire \send_pkt_data_wr_data[24]_i_3_n_0 ;
  wire \send_pkt_data_wr_data[24]_i_4_n_0 ;
  wire \send_pkt_data_wr_data[25]_i_2_n_0 ;
  wire \send_pkt_data_wr_data[27]_i_2_n_0 ;
  wire \send_pkt_data_wr_data[27]_i_3_n_0 ;
  wire \send_pkt_data_wr_data[27]_i_4_n_0 ;
  wire \send_pkt_data_wr_data[28]_i_2_n_0 ;
  wire \send_pkt_data_wr_data[28]_i_3_n_0 ;
  wire \send_pkt_data_wr_data[30]_i_2_n_0 ;
  wire \send_pkt_data_wr_data[31]_i_10_n_0 ;
  wire \send_pkt_data_wr_data[31]_i_11_n_0 ;
  wire \send_pkt_data_wr_data[31]_i_1_n_0 ;
  wire \send_pkt_data_wr_data[31]_i_3_n_0 ;
  wire \send_pkt_data_wr_data[31]_i_4_n_0 ;
  wire \send_pkt_data_wr_data[31]_i_5_n_0 ;
  wire \send_pkt_data_wr_data[31]_i_6_n_0 ;
  wire \send_pkt_data_wr_data[31]_i_7_n_0 ;
  wire \send_pkt_data_wr_data[31]_i_8_n_0 ;
  wire \send_pkt_data_wr_data[31]_i_9_n_0 ;
  wire \send_pkt_data_wr_data[4]_i_2_n_0 ;
  wire \send_pkt_data_wr_data[4]_i_3_n_0 ;
  wire \send_pkt_data_wr_data[8]_i_2_n_0 ;
  wire \send_pkt_data_wr_data[8]_i_3_n_0 ;
  wire \send_pkt_data_wr_data[9]_i_2_n_0 ;
  wire \send_pkt_data_wr_data[9]_i_3_n_0 ;
  wire send_pkt_data_wr_en;
  wire send_pkt_header_prog_full;
  wire [31:0]send_pkt_header_wr_data;
  wire [31:0]send_pkt_header_wr_data0_in;
  wire \send_pkt_header_wr_data[0]_i_2_n_0 ;
  wire \send_pkt_header_wr_data[0]_i_3_n_0 ;
  wire \send_pkt_header_wr_data[10]_i_2_n_0 ;
  wire \send_pkt_header_wr_data[11]_i_2_n_0 ;
  wire \send_pkt_header_wr_data[12]_i_2_n_0 ;
  wire \send_pkt_header_wr_data[13]_i_2_n_0 ;
  wire \send_pkt_header_wr_data[14]_i_2_n_0 ;
  wire \send_pkt_header_wr_data[15]_i_2_n_0 ;
  wire \send_pkt_header_wr_data[16]_i_2_n_0 ;
  wire \send_pkt_header_wr_data[16]_i_3_n_0 ;
  wire \send_pkt_header_wr_data[17]_i_2_n_0 ;
  wire \send_pkt_header_wr_data[17]_i_3_n_0 ;
  wire \send_pkt_header_wr_data[18]_i_2_n_0 ;
  wire \send_pkt_header_wr_data[18]_i_3_n_0 ;
  wire \send_pkt_header_wr_data[19]_i_2_n_0 ;
  wire \send_pkt_header_wr_data[19]_i_3_n_0 ;
  wire \send_pkt_header_wr_data[1]_i_2_n_0 ;
  wire \send_pkt_header_wr_data[20]_i_2_n_0 ;
  wire \send_pkt_header_wr_data[20]_i_3_n_0 ;
  wire \send_pkt_header_wr_data[21]_i_2_n_0 ;
  wire \send_pkt_header_wr_data[21]_i_3_n_0 ;
  wire \send_pkt_header_wr_data[22]_i_2_n_0 ;
  wire \send_pkt_header_wr_data[22]_i_3_n_0 ;
  wire \send_pkt_header_wr_data[23]_i_2_n_0 ;
  wire \send_pkt_header_wr_data[23]_i_3_n_0 ;
  wire \send_pkt_header_wr_data[24]_i_2_n_0 ;
  wire \send_pkt_header_wr_data[24]_i_3_n_0 ;
  wire \send_pkt_header_wr_data[25]_i_2_n_0 ;
  wire \send_pkt_header_wr_data[25]_i_3_n_0 ;
  wire \send_pkt_header_wr_data[26]_i_2_n_0 ;
  wire \send_pkt_header_wr_data[26]_i_3_n_0 ;
  wire \send_pkt_header_wr_data[27]_i_2_n_0 ;
  wire \send_pkt_header_wr_data[27]_i_3_n_0 ;
  wire \send_pkt_header_wr_data[28]_i_2_n_0 ;
  wire \send_pkt_header_wr_data[28]_i_3_n_0 ;
  wire \send_pkt_header_wr_data[29]_i_2_n_0 ;
  wire \send_pkt_header_wr_data[29]_i_3_n_0 ;
  wire \send_pkt_header_wr_data[2]_i_2_n_0 ;
  wire \send_pkt_header_wr_data[30]_i_2_n_0 ;
  wire \send_pkt_header_wr_data[30]_i_3_n_0 ;
  wire \send_pkt_header_wr_data[31]_i_1_n_0 ;
  wire \send_pkt_header_wr_data[31]_i_3_n_0 ;
  wire \send_pkt_header_wr_data[31]_i_4_n_0 ;
  wire \send_pkt_header_wr_data[31]_i_5_n_0 ;
  wire \send_pkt_header_wr_data[3]_i_2_n_0 ;
  wire \send_pkt_header_wr_data[3]_i_3_n_0 ;
  wire \send_pkt_header_wr_data[4]_i_2_n_0 ;
  wire \send_pkt_header_wr_data[4]_i_3_n_0 ;
  wire \send_pkt_header_wr_data[5]_i_2_n_0 ;
  wire \send_pkt_header_wr_data[6]_i_2_n_0 ;
  wire \send_pkt_header_wr_data[7]_i_2_n_0 ;
  wire \send_pkt_header_wr_data[8]_i_2_n_0 ;
  wire \send_pkt_header_wr_data[9]_i_2_n_0 ;
  wire send_pkt_header_wr_en;
  wire send_pkt_header_wr_en1;
  wire [0:0]stat_recv_session_packets_dropped;
  wire \stat_recv_session_packets_dropped[7]_i_2_n_0 ;
  wire \stat_recv_session_packets_dropped_reg[15]_i_1_n_0 ;
  wire \stat_recv_session_packets_dropped_reg[15]_i_1_n_1 ;
  wire \stat_recv_session_packets_dropped_reg[15]_i_1_n_10 ;
  wire \stat_recv_session_packets_dropped_reg[15]_i_1_n_11 ;
  wire \stat_recv_session_packets_dropped_reg[15]_i_1_n_12 ;
  wire \stat_recv_session_packets_dropped_reg[15]_i_1_n_13 ;
  wire \stat_recv_session_packets_dropped_reg[15]_i_1_n_14 ;
  wire \stat_recv_session_packets_dropped_reg[15]_i_1_n_15 ;
  wire \stat_recv_session_packets_dropped_reg[15]_i_1_n_2 ;
  wire \stat_recv_session_packets_dropped_reg[15]_i_1_n_3 ;
  wire \stat_recv_session_packets_dropped_reg[15]_i_1_n_4 ;
  wire \stat_recv_session_packets_dropped_reg[15]_i_1_n_5 ;
  wire \stat_recv_session_packets_dropped_reg[15]_i_1_n_6 ;
  wire \stat_recv_session_packets_dropped_reg[15]_i_1_n_7 ;
  wire \stat_recv_session_packets_dropped_reg[15]_i_1_n_8 ;
  wire \stat_recv_session_packets_dropped_reg[15]_i_1_n_9 ;
  wire \stat_recv_session_packets_dropped_reg[23]_i_1_n_0 ;
  wire \stat_recv_session_packets_dropped_reg[23]_i_1_n_1 ;
  wire \stat_recv_session_packets_dropped_reg[23]_i_1_n_10 ;
  wire \stat_recv_session_packets_dropped_reg[23]_i_1_n_11 ;
  wire \stat_recv_session_packets_dropped_reg[23]_i_1_n_12 ;
  wire \stat_recv_session_packets_dropped_reg[23]_i_1_n_13 ;
  wire \stat_recv_session_packets_dropped_reg[23]_i_1_n_14 ;
  wire \stat_recv_session_packets_dropped_reg[23]_i_1_n_15 ;
  wire \stat_recv_session_packets_dropped_reg[23]_i_1_n_2 ;
  wire \stat_recv_session_packets_dropped_reg[23]_i_1_n_3 ;
  wire \stat_recv_session_packets_dropped_reg[23]_i_1_n_4 ;
  wire \stat_recv_session_packets_dropped_reg[23]_i_1_n_5 ;
  wire \stat_recv_session_packets_dropped_reg[23]_i_1_n_6 ;
  wire \stat_recv_session_packets_dropped_reg[23]_i_1_n_7 ;
  wire \stat_recv_session_packets_dropped_reg[23]_i_1_n_8 ;
  wire \stat_recv_session_packets_dropped_reg[23]_i_1_n_9 ;
  wire \stat_recv_session_packets_dropped_reg[31]_i_2_n_1 ;
  wire \stat_recv_session_packets_dropped_reg[31]_i_2_n_10 ;
  wire \stat_recv_session_packets_dropped_reg[31]_i_2_n_11 ;
  wire \stat_recv_session_packets_dropped_reg[31]_i_2_n_12 ;
  wire \stat_recv_session_packets_dropped_reg[31]_i_2_n_13 ;
  wire \stat_recv_session_packets_dropped_reg[31]_i_2_n_14 ;
  wire \stat_recv_session_packets_dropped_reg[31]_i_2_n_15 ;
  wire \stat_recv_session_packets_dropped_reg[31]_i_2_n_2 ;
  wire \stat_recv_session_packets_dropped_reg[31]_i_2_n_3 ;
  wire \stat_recv_session_packets_dropped_reg[31]_i_2_n_4 ;
  wire \stat_recv_session_packets_dropped_reg[31]_i_2_n_5 ;
  wire \stat_recv_session_packets_dropped_reg[31]_i_2_n_6 ;
  wire \stat_recv_session_packets_dropped_reg[31]_i_2_n_7 ;
  wire \stat_recv_session_packets_dropped_reg[31]_i_2_n_8 ;
  wire \stat_recv_session_packets_dropped_reg[31]_i_2_n_9 ;
  wire \stat_recv_session_packets_dropped_reg[7]_i_1_n_0 ;
  wire \stat_recv_session_packets_dropped_reg[7]_i_1_n_1 ;
  wire \stat_recv_session_packets_dropped_reg[7]_i_1_n_10 ;
  wire \stat_recv_session_packets_dropped_reg[7]_i_1_n_11 ;
  wire \stat_recv_session_packets_dropped_reg[7]_i_1_n_12 ;
  wire \stat_recv_session_packets_dropped_reg[7]_i_1_n_13 ;
  wire \stat_recv_session_packets_dropped_reg[7]_i_1_n_14 ;
  wire \stat_recv_session_packets_dropped_reg[7]_i_1_n_15 ;
  wire \stat_recv_session_packets_dropped_reg[7]_i_1_n_2 ;
  wire \stat_recv_session_packets_dropped_reg[7]_i_1_n_3 ;
  wire \stat_recv_session_packets_dropped_reg[7]_i_1_n_4 ;
  wire \stat_recv_session_packets_dropped_reg[7]_i_1_n_5 ;
  wire \stat_recv_session_packets_dropped_reg[7]_i_1_n_6 ;
  wire \stat_recv_session_packets_dropped_reg[7]_i_1_n_7 ;
  wire \stat_recv_session_packets_dropped_reg[7]_i_1_n_8 ;
  wire \stat_recv_session_packets_dropped_reg[7]_i_1_n_9 ;
  wire [0:0]stat_recv_session_packets_invalid;
  wire \stat_recv_session_packets_invalid[7]_i_2_n_0 ;
  wire \stat_recv_session_packets_invalid_reg[15]_i_1_n_0 ;
  wire \stat_recv_session_packets_invalid_reg[15]_i_1_n_1 ;
  wire \stat_recv_session_packets_invalid_reg[15]_i_1_n_10 ;
  wire \stat_recv_session_packets_invalid_reg[15]_i_1_n_11 ;
  wire \stat_recv_session_packets_invalid_reg[15]_i_1_n_12 ;
  wire \stat_recv_session_packets_invalid_reg[15]_i_1_n_13 ;
  wire \stat_recv_session_packets_invalid_reg[15]_i_1_n_14 ;
  wire \stat_recv_session_packets_invalid_reg[15]_i_1_n_15 ;
  wire \stat_recv_session_packets_invalid_reg[15]_i_1_n_2 ;
  wire \stat_recv_session_packets_invalid_reg[15]_i_1_n_3 ;
  wire \stat_recv_session_packets_invalid_reg[15]_i_1_n_4 ;
  wire \stat_recv_session_packets_invalid_reg[15]_i_1_n_5 ;
  wire \stat_recv_session_packets_invalid_reg[15]_i_1_n_6 ;
  wire \stat_recv_session_packets_invalid_reg[15]_i_1_n_7 ;
  wire \stat_recv_session_packets_invalid_reg[15]_i_1_n_8 ;
  wire \stat_recv_session_packets_invalid_reg[15]_i_1_n_9 ;
  wire \stat_recv_session_packets_invalid_reg[23]_i_1_n_0 ;
  wire \stat_recv_session_packets_invalid_reg[23]_i_1_n_1 ;
  wire \stat_recv_session_packets_invalid_reg[23]_i_1_n_10 ;
  wire \stat_recv_session_packets_invalid_reg[23]_i_1_n_11 ;
  wire \stat_recv_session_packets_invalid_reg[23]_i_1_n_12 ;
  wire \stat_recv_session_packets_invalid_reg[23]_i_1_n_13 ;
  wire \stat_recv_session_packets_invalid_reg[23]_i_1_n_14 ;
  wire \stat_recv_session_packets_invalid_reg[23]_i_1_n_15 ;
  wire \stat_recv_session_packets_invalid_reg[23]_i_1_n_2 ;
  wire \stat_recv_session_packets_invalid_reg[23]_i_1_n_3 ;
  wire \stat_recv_session_packets_invalid_reg[23]_i_1_n_4 ;
  wire \stat_recv_session_packets_invalid_reg[23]_i_1_n_5 ;
  wire \stat_recv_session_packets_invalid_reg[23]_i_1_n_6 ;
  wire \stat_recv_session_packets_invalid_reg[23]_i_1_n_7 ;
  wire \stat_recv_session_packets_invalid_reg[23]_i_1_n_8 ;
  wire \stat_recv_session_packets_invalid_reg[23]_i_1_n_9 ;
  wire \stat_recv_session_packets_invalid_reg[31]_i_2_n_1 ;
  wire \stat_recv_session_packets_invalid_reg[31]_i_2_n_10 ;
  wire \stat_recv_session_packets_invalid_reg[31]_i_2_n_11 ;
  wire \stat_recv_session_packets_invalid_reg[31]_i_2_n_12 ;
  wire \stat_recv_session_packets_invalid_reg[31]_i_2_n_13 ;
  wire \stat_recv_session_packets_invalid_reg[31]_i_2_n_14 ;
  wire \stat_recv_session_packets_invalid_reg[31]_i_2_n_15 ;
  wire \stat_recv_session_packets_invalid_reg[31]_i_2_n_2 ;
  wire \stat_recv_session_packets_invalid_reg[31]_i_2_n_3 ;
  wire \stat_recv_session_packets_invalid_reg[31]_i_2_n_4 ;
  wire \stat_recv_session_packets_invalid_reg[31]_i_2_n_5 ;
  wire \stat_recv_session_packets_invalid_reg[31]_i_2_n_6 ;
  wire \stat_recv_session_packets_invalid_reg[31]_i_2_n_7 ;
  wire \stat_recv_session_packets_invalid_reg[31]_i_2_n_8 ;
  wire \stat_recv_session_packets_invalid_reg[31]_i_2_n_9 ;
  wire \stat_recv_session_packets_invalid_reg[7]_i_1_n_0 ;
  wire \stat_recv_session_packets_invalid_reg[7]_i_1_n_1 ;
  wire \stat_recv_session_packets_invalid_reg[7]_i_1_n_10 ;
  wire \stat_recv_session_packets_invalid_reg[7]_i_1_n_11 ;
  wire \stat_recv_session_packets_invalid_reg[7]_i_1_n_12 ;
  wire \stat_recv_session_packets_invalid_reg[7]_i_1_n_13 ;
  wire \stat_recv_session_packets_invalid_reg[7]_i_1_n_14 ;
  wire \stat_recv_session_packets_invalid_reg[7]_i_1_n_15 ;
  wire \stat_recv_session_packets_invalid_reg[7]_i_1_n_2 ;
  wire \stat_recv_session_packets_invalid_reg[7]_i_1_n_3 ;
  wire \stat_recv_session_packets_invalid_reg[7]_i_1_n_4 ;
  wire \stat_recv_session_packets_invalid_reg[7]_i_1_n_5 ;
  wire \stat_recv_session_packets_invalid_reg[7]_i_1_n_6 ;
  wire \stat_recv_session_packets_invalid_reg[7]_i_1_n_7 ;
  wire \stat_recv_session_packets_invalid_reg[7]_i_1_n_8 ;
  wire \stat_recv_session_packets_invalid_reg[7]_i_1_n_9 ;
  wire [0:0]stat_recv_session_packets_valid;
  wire \stat_recv_session_packets_valid[31]_i_10_n_0 ;
  wire \stat_recv_session_packets_valid[31]_i_11_n_0 ;
  wire \stat_recv_session_packets_valid[31]_i_12_n_0 ;
  wire \stat_recv_session_packets_valid[31]_i_13_n_0 ;
  wire \stat_recv_session_packets_valid[31]_i_14_n_0 ;
  wire \stat_recv_session_packets_valid[31]_i_15_n_0 ;
  wire \stat_recv_session_packets_valid[31]_i_16_n_0 ;
  wire \stat_recv_session_packets_valid[31]_i_17_n_0 ;
  wire \stat_recv_session_packets_valid[31]_i_18_n_0 ;
  wire \stat_recv_session_packets_valid[31]_i_19_n_0 ;
  wire \stat_recv_session_packets_valid[31]_i_20_n_0 ;
  wire \stat_recv_session_packets_valid[31]_i_21_n_0 ;
  wire \stat_recv_session_packets_valid[31]_i_22_n_0 ;
  wire \stat_recv_session_packets_valid[31]_i_23_n_0 ;
  wire \stat_recv_session_packets_valid[31]_i_24_n_0 ;
  wire \stat_recv_session_packets_valid[31]_i_25_n_0 ;
  wire \stat_recv_session_packets_valid[31]_i_26_n_0 ;
  wire \stat_recv_session_packets_valid[31]_i_27_n_0 ;
  wire \stat_recv_session_packets_valid[31]_i_28_n_0 ;
  wire \stat_recv_session_packets_valid[31]_i_29_n_0 ;
  wire \stat_recv_session_packets_valid[31]_i_30_n_0 ;
  wire \stat_recv_session_packets_valid[31]_i_31_n_0 ;
  wire \stat_recv_session_packets_valid[31]_i_32_n_0 ;
  wire \stat_recv_session_packets_valid[31]_i_33_n_0 ;
  wire \stat_recv_session_packets_valid[31]_i_34_n_0 ;
  wire \stat_recv_session_packets_valid[31]_i_3_n_0 ;
  wire \stat_recv_session_packets_valid[31]_i_4_n_0 ;
  wire \stat_recv_session_packets_valid[31]_i_5_n_0 ;
  wire \stat_recv_session_packets_valid[31]_i_6_n_0 ;
  wire \stat_recv_session_packets_valid[31]_i_7_n_0 ;
  wire \stat_recv_session_packets_valid[31]_i_8_n_0 ;
  wire \stat_recv_session_packets_valid[31]_i_9_n_0 ;
  wire \stat_recv_session_packets_valid[7]_i_2_n_0 ;
  wire \stat_recv_session_packets_valid_reg[15]_i_1_n_0 ;
  wire \stat_recv_session_packets_valid_reg[15]_i_1_n_1 ;
  wire \stat_recv_session_packets_valid_reg[15]_i_1_n_10 ;
  wire \stat_recv_session_packets_valid_reg[15]_i_1_n_11 ;
  wire \stat_recv_session_packets_valid_reg[15]_i_1_n_12 ;
  wire \stat_recv_session_packets_valid_reg[15]_i_1_n_13 ;
  wire \stat_recv_session_packets_valid_reg[15]_i_1_n_14 ;
  wire \stat_recv_session_packets_valid_reg[15]_i_1_n_15 ;
  wire \stat_recv_session_packets_valid_reg[15]_i_1_n_2 ;
  wire \stat_recv_session_packets_valid_reg[15]_i_1_n_3 ;
  wire \stat_recv_session_packets_valid_reg[15]_i_1_n_4 ;
  wire \stat_recv_session_packets_valid_reg[15]_i_1_n_5 ;
  wire \stat_recv_session_packets_valid_reg[15]_i_1_n_6 ;
  wire \stat_recv_session_packets_valid_reg[15]_i_1_n_7 ;
  wire \stat_recv_session_packets_valid_reg[15]_i_1_n_8 ;
  wire \stat_recv_session_packets_valid_reg[15]_i_1_n_9 ;
  wire \stat_recv_session_packets_valid_reg[23]_i_1_n_0 ;
  wire \stat_recv_session_packets_valid_reg[23]_i_1_n_1 ;
  wire \stat_recv_session_packets_valid_reg[23]_i_1_n_10 ;
  wire \stat_recv_session_packets_valid_reg[23]_i_1_n_11 ;
  wire \stat_recv_session_packets_valid_reg[23]_i_1_n_12 ;
  wire \stat_recv_session_packets_valid_reg[23]_i_1_n_13 ;
  wire \stat_recv_session_packets_valid_reg[23]_i_1_n_14 ;
  wire \stat_recv_session_packets_valid_reg[23]_i_1_n_15 ;
  wire \stat_recv_session_packets_valid_reg[23]_i_1_n_2 ;
  wire \stat_recv_session_packets_valid_reg[23]_i_1_n_3 ;
  wire \stat_recv_session_packets_valid_reg[23]_i_1_n_4 ;
  wire \stat_recv_session_packets_valid_reg[23]_i_1_n_5 ;
  wire \stat_recv_session_packets_valid_reg[23]_i_1_n_6 ;
  wire \stat_recv_session_packets_valid_reg[23]_i_1_n_7 ;
  wire \stat_recv_session_packets_valid_reg[23]_i_1_n_8 ;
  wire \stat_recv_session_packets_valid_reg[23]_i_1_n_9 ;
  wire \stat_recv_session_packets_valid_reg[31]_i_2_n_1 ;
  wire \stat_recv_session_packets_valid_reg[31]_i_2_n_10 ;
  wire \stat_recv_session_packets_valid_reg[31]_i_2_n_11 ;
  wire \stat_recv_session_packets_valid_reg[31]_i_2_n_12 ;
  wire \stat_recv_session_packets_valid_reg[31]_i_2_n_13 ;
  wire \stat_recv_session_packets_valid_reg[31]_i_2_n_14 ;
  wire \stat_recv_session_packets_valid_reg[31]_i_2_n_15 ;
  wire \stat_recv_session_packets_valid_reg[31]_i_2_n_2 ;
  wire \stat_recv_session_packets_valid_reg[31]_i_2_n_3 ;
  wire \stat_recv_session_packets_valid_reg[31]_i_2_n_4 ;
  wire \stat_recv_session_packets_valid_reg[31]_i_2_n_5 ;
  wire \stat_recv_session_packets_valid_reg[31]_i_2_n_6 ;
  wire \stat_recv_session_packets_valid_reg[31]_i_2_n_7 ;
  wire \stat_recv_session_packets_valid_reg[31]_i_2_n_8 ;
  wire \stat_recv_session_packets_valid_reg[31]_i_2_n_9 ;
  wire \stat_recv_session_packets_valid_reg[7]_i_1_n_0 ;
  wire \stat_recv_session_packets_valid_reg[7]_i_1_n_1 ;
  wire \stat_recv_session_packets_valid_reg[7]_i_1_n_10 ;
  wire \stat_recv_session_packets_valid_reg[7]_i_1_n_11 ;
  wire \stat_recv_session_packets_valid_reg[7]_i_1_n_12 ;
  wire \stat_recv_session_packets_valid_reg[7]_i_1_n_13 ;
  wire \stat_recv_session_packets_valid_reg[7]_i_1_n_14 ;
  wire \stat_recv_session_packets_valid_reg[7]_i_1_n_15 ;
  wire \stat_recv_session_packets_valid_reg[7]_i_1_n_2 ;
  wire \stat_recv_session_packets_valid_reg[7]_i_1_n_3 ;
  wire \stat_recv_session_packets_valid_reg[7]_i_1_n_4 ;
  wire \stat_recv_session_packets_valid_reg[7]_i_1_n_5 ;
  wire \stat_recv_session_packets_valid_reg[7]_i_1_n_6 ;
  wire \stat_recv_session_packets_valid_reg[7]_i_1_n_7 ;
  wire \stat_recv_session_packets_valid_reg[7]_i_1_n_8 ;
  wire \stat_recv_session_packets_valid_reg[7]_i_1_n_9 ;
  wire \stat_send_session_packets[7]_i_2_n_0 ;
  wire \stat_send_session_packets_reg[15]_i_1_n_0 ;
  wire \stat_send_session_packets_reg[15]_i_1_n_1 ;
  wire \stat_send_session_packets_reg[15]_i_1_n_10 ;
  wire \stat_send_session_packets_reg[15]_i_1_n_11 ;
  wire \stat_send_session_packets_reg[15]_i_1_n_12 ;
  wire \stat_send_session_packets_reg[15]_i_1_n_13 ;
  wire \stat_send_session_packets_reg[15]_i_1_n_14 ;
  wire \stat_send_session_packets_reg[15]_i_1_n_15 ;
  wire \stat_send_session_packets_reg[15]_i_1_n_2 ;
  wire \stat_send_session_packets_reg[15]_i_1_n_3 ;
  wire \stat_send_session_packets_reg[15]_i_1_n_4 ;
  wire \stat_send_session_packets_reg[15]_i_1_n_5 ;
  wire \stat_send_session_packets_reg[15]_i_1_n_6 ;
  wire \stat_send_session_packets_reg[15]_i_1_n_7 ;
  wire \stat_send_session_packets_reg[15]_i_1_n_8 ;
  wire \stat_send_session_packets_reg[15]_i_1_n_9 ;
  wire \stat_send_session_packets_reg[23]_i_1_n_0 ;
  wire \stat_send_session_packets_reg[23]_i_1_n_1 ;
  wire \stat_send_session_packets_reg[23]_i_1_n_10 ;
  wire \stat_send_session_packets_reg[23]_i_1_n_11 ;
  wire \stat_send_session_packets_reg[23]_i_1_n_12 ;
  wire \stat_send_session_packets_reg[23]_i_1_n_13 ;
  wire \stat_send_session_packets_reg[23]_i_1_n_14 ;
  wire \stat_send_session_packets_reg[23]_i_1_n_15 ;
  wire \stat_send_session_packets_reg[23]_i_1_n_2 ;
  wire \stat_send_session_packets_reg[23]_i_1_n_3 ;
  wire \stat_send_session_packets_reg[23]_i_1_n_4 ;
  wire \stat_send_session_packets_reg[23]_i_1_n_5 ;
  wire \stat_send_session_packets_reg[23]_i_1_n_6 ;
  wire \stat_send_session_packets_reg[23]_i_1_n_7 ;
  wire \stat_send_session_packets_reg[23]_i_1_n_8 ;
  wire \stat_send_session_packets_reg[23]_i_1_n_9 ;
  wire \stat_send_session_packets_reg[31]_i_2_n_1 ;
  wire \stat_send_session_packets_reg[31]_i_2_n_10 ;
  wire \stat_send_session_packets_reg[31]_i_2_n_11 ;
  wire \stat_send_session_packets_reg[31]_i_2_n_12 ;
  wire \stat_send_session_packets_reg[31]_i_2_n_13 ;
  wire \stat_send_session_packets_reg[31]_i_2_n_14 ;
  wire \stat_send_session_packets_reg[31]_i_2_n_15 ;
  wire \stat_send_session_packets_reg[31]_i_2_n_2 ;
  wire \stat_send_session_packets_reg[31]_i_2_n_3 ;
  wire \stat_send_session_packets_reg[31]_i_2_n_4 ;
  wire \stat_send_session_packets_reg[31]_i_2_n_5 ;
  wire \stat_send_session_packets_reg[31]_i_2_n_6 ;
  wire \stat_send_session_packets_reg[31]_i_2_n_7 ;
  wire \stat_send_session_packets_reg[31]_i_2_n_8 ;
  wire \stat_send_session_packets_reg[31]_i_2_n_9 ;
  wire \stat_send_session_packets_reg[7]_i_1_n_0 ;
  wire \stat_send_session_packets_reg[7]_i_1_n_1 ;
  wire \stat_send_session_packets_reg[7]_i_1_n_10 ;
  wire \stat_send_session_packets_reg[7]_i_1_n_11 ;
  wire \stat_send_session_packets_reg[7]_i_1_n_12 ;
  wire \stat_send_session_packets_reg[7]_i_1_n_13 ;
  wire \stat_send_session_packets_reg[7]_i_1_n_14 ;
  wire \stat_send_session_packets_reg[7]_i_1_n_15 ;
  wire \stat_send_session_packets_reg[7]_i_1_n_2 ;
  wire \stat_send_session_packets_reg[7]_i_1_n_3 ;
  wire \stat_send_session_packets_reg[7]_i_1_n_4 ;
  wire \stat_send_session_packets_reg[7]_i_1_n_5 ;
  wire \stat_send_session_packets_reg[7]_i_1_n_6 ;
  wire \stat_send_session_packets_reg[7]_i_1_n_7 ;
  wire \stat_send_session_packets_reg[7]_i_1_n_8 ;
  wire \stat_send_session_packets_reg[7]_i_1_n_9 ;
  wire validPacketsFIFO_prog_full;
  wire [72:0]validPacketsFIFO_wr_data;
  wire \validPacketsFIFO_wr_data[87]_i_1_n_0 ;
  wire validPacketsFIFO_wr_en;
  wire validPacketsFIFO_wr_en_i_1_n_0;
  wire validPacketsFIFO_wr_en_i_2_n_0;
  wire [7:0]\NLW_recvReplyStatus_reg[2]_i_14_O_UNCONNECTED ;
  wire [7:3]\NLW_recvReplyStatus_reg[2]_i_6_CO_UNCONNECTED ;
  wire [7:0]\NLW_recvReplyStatus_reg[2]_i_6_O_UNCONNECTED ;
  wire [7:6]\NLW_sendClocksBetweenBroadcastsWait_reg[31]_i_3_CO_UNCONNECTED ;
  wire [7:7]\NLW_sendClocksBetweenBroadcastsWait_reg[31]_i_3_O_UNCONNECTED ;
  wire [7:2]\NLW_sendCyclesBetweenAutoResends_reg[27]_i_3_CO_UNCONNECTED ;
  wire [7:3]\NLW_sendCyclesBetweenAutoResends_reg[27]_i_3_O_UNCONNECTED ;
  wire [7:7]\NLW_sendLastSentPacketHeader_reg[packetChecksum][7]_i_1_CO_UNCONNECTED ;
  wire [7:2]\NLW_sendLastSentPacketHeader_reg[packetChecksum][7]_i_16_CO_UNCONNECTED ;
  wire [7:2]\NLW_sendLastSentPacketHeader_reg[packetChecksum][7]_i_16_O_UNCONNECTED ;
  wire [7:7]\NLW_sendLastSentPacketHeader_reg[packetChecksum][7]_i_17_CO_UNCONNECTED ;
  wire [7:7]\NLW_stat_recv_session_packets_dropped_reg[31]_i_2_CO_UNCONNECTED ;
  wire [7:7]\NLW_stat_recv_session_packets_invalid_reg[31]_i_2_CO_UNCONNECTED ;
  wire [7:7]\NLW_stat_recv_session_packets_valid_reg[31]_i_2_CO_UNCONNECTED ;
  wire [7:7]\NLW_stat_send_session_packets_reg[31]_i_2_CO_UNCONNECTED ;

  LUT6 #(
    .INIT(64'h4444444444440400)) 
    \DBG_discardPacketReason[0]_i_1 
       (.I0(\recvPacketHeaderBuffer_reg[0]_0 ),
        .I1(\stat_recv_session_packets_valid[31]_i_3_n_0 ),
        .I2(\stat_recv_session_packets_valid[31]_i_5_n_0 ),
        .I3(\stat_recv_session_packets_valid[31]_i_4_n_0 ),
        .I4(\stat_recv_session_packets_valid[31]_i_6_n_0 ),
        .I5(validPacketsFIFO_prog_full),
        .O(\DBG_discardPacketReason[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT5 #(
    .INIT(32'h04040400)) 
    \DBG_discardPacketReason[1]_i_1 
       (.I0(validPacketsFIFO_prog_full),
        .I1(\stat_recv_session_packets_valid[31]_i_3_n_0 ),
        .I2(\recvPacketHeaderBuffer_reg[0]_0 ),
        .I3(\stat_recv_session_packets_valid[31]_i_5_n_0 ),
        .I4(\stat_recv_session_packets_valid[31]_i_6_n_0 ),
        .O(\DBG_discardPacketReason[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'h5D)) 
    \DBG_discardPacketReason[2]_i_1 
       (.I0(\stat_recv_session_packets_valid[31]_i_3_n_0 ),
        .I1(validPacketsFIFO_prog_full),
        .I2(\recvPacketHeaderBuffer_reg[0]_0 ),
        .O(\DBG_discardPacketReason[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \DBG_discardPacketReason_reg[0] 
       (.C(clk333_250),
        .CE(\DBG_recvHeaderChecksum[7]_i_1_n_0 ),
        .D(\DBG_discardPacketReason[0]_i_1_n_0 ),
        .Q(DBG_discardPacketReason[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DBG_discardPacketReason_reg[1] 
       (.C(clk333_250),
        .CE(\DBG_recvHeaderChecksum[7]_i_1_n_0 ),
        .D(\DBG_discardPacketReason[1]_i_1_n_0 ),
        .Q(DBG_discardPacketReason[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DBG_discardPacketReason_reg[2] 
       (.C(clk333_250),
        .CE(\DBG_recvHeaderChecksum[7]_i_1_n_0 ),
        .D(\DBG_discardPacketReason[2]_i_1_n_0 ),
        .Q(DBG_discardPacketReason[2]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h96696996)) 
    \DBG_recvHeaderChecksum[0]_i_1 
       (.I0(\recvPacketHeaderBuffer_reg[9]_0 ),
        .I1(\DBG_recvHeaderChecksum[1]_i_3_n_0 ),
        .I2(\recvPacketHeaderBuffer_reg[7]_0 ),
        .I3(\recvPacketHeaderBuffer_reg[60]_0 ),
        .I4(\recvPacketHeaderBuffer_reg[52]_0 ),
        .O(\DBG_recvHeaderChecksum[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h6556566559959559)) 
    \DBG_recvHeaderChecksum[1]_i_1 
       (.I0(\DBG_recvHeaderChecksum[1]_i_2_n_0 ),
        .I1(\DBG_recvHeaderChecksum[1]_i_3_n_0 ),
        .I2(\recvPacketHeaderBuffer_reg[7]_0 ),
        .I3(\recvPacketHeaderBuffer_reg[60]_0 ),
        .I4(\recvPacketHeaderBuffer_reg[52]_0 ),
        .I5(\recvPacketHeaderBuffer_reg[9]_0 ),
        .O(CalcNetSessionPacketHeaderChecksum[1]));
  (* SOFT_HLUTNM = "soft_lutpair121" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \DBG_recvHeaderChecksum[1]_i_2 
       (.I0(\recvPacketHeaderBuffer_reg[10]_0 ),
        .I1(\DBG_recvHeaderChecksum[2]_i_3_n_0 ),
        .I2(\DBG_recvHeaderChecksum[2]_i_2_n_0 ),
        .O(\DBG_recvHeaderChecksum[1]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h69)) 
    \DBG_recvHeaderChecksum[1]_i_3 
       (.I0(\recvPacketHeaderBuffer_reg[22]_0 ),
        .I1(\recvPacketHeaderBuffer_reg[26]_0 ),
        .I2(\recvPacketHeaderBuffer_reg[37]_0 ),
        .O(\DBG_recvHeaderChecksum[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h4DB2B24DB24D4DB2)) 
    \DBG_recvHeaderChecksum[2]_i_1 
       (.I0(\recvPacketHeaderBuffer_reg[10]_0 ),
        .I1(\DBG_recvHeaderChecksum[2]_i_2_n_0 ),
        .I2(\DBG_recvHeaderChecksum[2]_i_3_n_0 ),
        .I3(\DBG_recvHeaderChecksum[2]_i_4_n_0 ),
        .I4(DBG_recvPacketData[2]),
        .I5(\DBG_recvHeaderChecksum[3]_i_3_n_0 ),
        .O(CalcNetSessionPacketHeaderChecksum[2]));
  LUT6 #(
    .INIT(64'hE81717E817E8E817)) 
    \DBG_recvHeaderChecksum[2]_i_2 
       (.I0(\recvPacketHeaderBuffer_reg[60]_0 ),
        .I1(\recvPacketHeaderBuffer_reg[7]_0 ),
        .I2(\recvPacketHeaderBuffer_reg[52]_0 ),
        .I3(\recvPacketHeaderBuffer_reg[0]_0 ),
        .I4(\recvPacketHeaderBuffer_reg[61]_0 ),
        .I5(\recvPacketHeaderBuffer_reg[53]_0 ),
        .O(\DBG_recvHeaderChecksum[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h6969699669969696)) 
    \DBG_recvHeaderChecksum[2]_i_3 
       (.I0(\recvPacketHeaderBuffer_reg[38]_0 ),
        .I1(\recvPacketHeaderBuffer_reg[27]_0 ),
        .I2(DBG_recvPacketData[9]),
        .I3(\recvPacketHeaderBuffer_reg[22]_0 ),
        .I4(\recvPacketHeaderBuffer_reg[26]_0 ),
        .I5(\recvPacketHeaderBuffer_reg[37]_0 ),
        .O(\DBG_recvHeaderChecksum[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \DBG_recvHeaderChecksum[2]_i_4 
       (.I0(\DBG_recvHeaderChecksum[4]_i_8_n_0 ),
        .I1(\DBG_recvHeaderChecksum[2]_i_5_n_0 ),
        .I2(\DBG_recvHeaderChecksum[4]_i_9_n_0 ),
        .I3(\DBG_recvHeaderChecksum[3]_i_8_n_0 ),
        .I4(\DBG_recvHeaderChecksum[2]_i_6_n_0 ),
        .I5(\DBG_recvHeaderChecksum[3]_i_7_n_0 ),
        .O(\DBG_recvHeaderChecksum[2]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \DBG_recvHeaderChecksum[2]_i_5 
       (.I0(\recvPacketHeaderBuffer_reg[16]_0 ),
        .I1(\recvPacketHeaderBuffer_reg[28]_0 ),
        .I2(\recvPacketHeaderBuffer_reg[39]_0 ),
        .O(\DBG_recvHeaderChecksum[2]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \DBG_recvHeaderChecksum[2]_i_6 
       (.I0(\recvPacketHeaderBuffer_reg[1]_0 ),
        .I1(\recvPacketHeaderBuffer_reg[62]_0 ),
        .I2(\recvPacketHeaderBuffer_reg[54]_0 ),
        .O(\DBG_recvHeaderChecksum[2]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hA69A65A665A65965)) 
    \DBG_recvHeaderChecksum[3]_i_1 
       (.I0(\DBG_recvHeaderChecksum[4]_i_5_n_0 ),
        .I1(\DBG_recvHeaderChecksum[3]_i_2_n_0 ),
        .I2(\DBG_recvHeaderChecksum[3]_i_3_n_0 ),
        .I3(DBG_recvPacketData[2]),
        .I4(\DBG_recvHeaderChecksum[3]_i_4_n_0 ),
        .I5(\DBG_recvHeaderChecksum[3]_i_5_n_0 ),
        .O(CalcNetSessionPacketHeaderChecksum[3]));
  (* SOFT_HLUTNM = "soft_lutpair121" *) 
  LUT3 #(
    .INIT(8'hB2)) 
    \DBG_recvHeaderChecksum[3]_i_2 
       (.I0(\DBG_recvHeaderChecksum[2]_i_3_n_0 ),
        .I1(\DBG_recvHeaderChecksum[2]_i_2_n_0 ),
        .I2(\recvPacketHeaderBuffer_reg[10]_0 ),
        .O(\DBG_recvHeaderChecksum[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h96969600FF969696)) 
    \DBG_recvHeaderChecksum[3]_i_3 
       (.I0(\recvPacketHeaderBuffer_reg[10]_0 ),
        .I1(\DBG_recvHeaderChecksum[2]_i_3_n_0 ),
        .I2(\DBG_recvHeaderChecksum[2]_i_2_n_0 ),
        .I3(\DBG_recvHeaderChecksum[3]_i_6_n_0 ),
        .I4(\DBG_recvHeaderChecksum[1]_i_3_n_0 ),
        .I5(\recvPacketHeaderBuffer_reg[9]_0 ),
        .O(\DBG_recvHeaderChecksum[3]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT5 #(
    .INIT(32'h69969669)) 
    \DBG_recvHeaderChecksum[3]_i_4 
       (.I0(\DBG_recvHeaderChecksum[4]_i_9_n_0 ),
        .I1(\recvPacketHeaderBuffer_reg[16]_0 ),
        .I2(\recvPacketHeaderBuffer_reg[28]_0 ),
        .I3(\recvPacketHeaderBuffer_reg[39]_0 ),
        .I4(\DBG_recvHeaderChecksum[4]_i_8_n_0 ),
        .O(\DBG_recvHeaderChecksum[3]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT5 #(
    .INIT(32'h69969669)) 
    \DBG_recvHeaderChecksum[3]_i_5 
       (.I0(\DBG_recvHeaderChecksum[3]_i_7_n_0 ),
        .I1(\recvPacketHeaderBuffer_reg[1]_0 ),
        .I2(\recvPacketHeaderBuffer_reg[62]_0 ),
        .I3(\recvPacketHeaderBuffer_reg[54]_0 ),
        .I4(\DBG_recvHeaderChecksum[3]_i_8_n_0 ),
        .O(\DBG_recvHeaderChecksum[3]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \DBG_recvHeaderChecksum[3]_i_6 
       (.I0(\recvPacketHeaderBuffer_reg[7]_0 ),
        .I1(\recvPacketHeaderBuffer_reg[60]_0 ),
        .I2(\recvPacketHeaderBuffer_reg[52]_0 ),
        .O(\DBG_recvHeaderChecksum[3]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hE80000E800E8E800)) 
    \DBG_recvHeaderChecksum[3]_i_7 
       (.I0(\recvPacketHeaderBuffer_reg[60]_0 ),
        .I1(\recvPacketHeaderBuffer_reg[7]_0 ),
        .I2(\recvPacketHeaderBuffer_reg[52]_0 ),
        .I3(\recvPacketHeaderBuffer_reg[0]_0 ),
        .I4(\recvPacketHeaderBuffer_reg[61]_0 ),
        .I5(\recvPacketHeaderBuffer_reg[53]_0 ),
        .O(\DBG_recvHeaderChecksum[3]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair134" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    \DBG_recvHeaderChecksum[3]_i_8 
       (.I0(\recvPacketHeaderBuffer_reg[0]_0 ),
        .I1(\recvPacketHeaderBuffer_reg[61]_0 ),
        .I2(\recvPacketHeaderBuffer_reg[53]_0 ),
        .O(\DBG_recvHeaderChecksum[3]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h555AA555A555A665)) 
    \DBG_recvHeaderChecksum[4]_i_1 
       (.I0(\DBG_recvHeaderChecksum[4]_i_2_n_0 ),
        .I1(\DBG_recvHeaderChecksum[4]_i_3_n_0 ),
        .I2(\DBG_recvHeaderChecksum[4]_i_4_n_0 ),
        .I3(\DBG_recvHeaderChecksum[4]_i_5_n_0 ),
        .I4(\DBG_recvHeaderChecksum[4]_i_6_n_0 ),
        .I5(\DBG_recvHeaderChecksum[4]_i_7_n_0 ),
        .O(CalcNetSessionPacketHeaderChecksum[4]));
  LUT6 #(
    .INIT(64'h9669969669699669)) 
    \DBG_recvHeaderChecksum[4]_i_2 
       (.I0(\DBG_recvHeaderChecksum[5]_i_7_n_0 ),
        .I1(\DBG_recvHeaderChecksum[5]_i_15_n_0 ),
        .I2(DBG_recvPacketData[4]),
        .I3(DBG_recvPacketData[3]),
        .I4(\DBG_recvHeaderChecksum[5]_i_16_n_0 ),
        .I5(\DBG_recvHeaderChecksum[5]_i_17_n_0 ),
        .O(\DBG_recvHeaderChecksum[4]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h09)) 
    \DBG_recvHeaderChecksum[4]_i_3 
       (.I0(\DBG_recvHeaderChecksum[2]_i_4_n_0 ),
        .I1(DBG_recvPacketData[2]),
        .I2(\DBG_recvHeaderChecksum[3]_i_3_n_0 ),
        .O(\DBG_recvHeaderChecksum[4]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h6996966900000000)) 
    \DBG_recvHeaderChecksum[4]_i_4 
       (.I0(\DBG_recvHeaderChecksum[4]_i_8_n_0 ),
        .I1(\recvPacketHeaderBuffer_reg[39]_0 ),
        .I2(\recvPacketHeaderBuffer_reg[28]_0 ),
        .I3(\recvPacketHeaderBuffer_reg[16]_0 ),
        .I4(\DBG_recvHeaderChecksum[4]_i_9_n_0 ),
        .I5(\DBG_recvHeaderChecksum[3]_i_5_n_0 ),
        .O(\DBG_recvHeaderChecksum[4]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \DBG_recvHeaderChecksum[4]_i_5 
       (.I0(DBG_recvPacketData[3]),
        .I1(\DBG_recvHeaderChecksum[5]_i_17_n_0 ),
        .I2(\DBG_recvHeaderChecksum[5]_i_16_n_0 ),
        .O(\DBG_recvHeaderChecksum[4]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair104" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \DBG_recvHeaderChecksum[4]_i_6 
       (.I0(DBG_recvPacketData[2]),
        .I1(\DBG_recvHeaderChecksum[2]_i_4_n_0 ),
        .O(\DBG_recvHeaderChecksum[4]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hB20000B2B2B2B2B2)) 
    \DBG_recvHeaderChecksum[4]_i_7 
       (.I0(\recvPacketHeaderBuffer_reg[10]_0 ),
        .I1(\DBG_recvHeaderChecksum[2]_i_2_n_0 ),
        .I2(\DBG_recvHeaderChecksum[2]_i_3_n_0 ),
        .I3(DBG_recvPacketData[2]),
        .I4(\DBG_recvHeaderChecksum[2]_i_4_n_0 ),
        .I5(\DBG_recvHeaderChecksum[3]_i_3_n_0 ),
        .O(\DBG_recvHeaderChecksum[4]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair139" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    \DBG_recvHeaderChecksum[4]_i_8 
       (.I0(DBG_recvPacketData[9]),
        .I1(\recvPacketHeaderBuffer_reg[38]_0 ),
        .I2(\recvPacketHeaderBuffer_reg[27]_0 ),
        .O(\DBG_recvHeaderChecksum[4]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h9696960096000000)) 
    \DBG_recvHeaderChecksum[4]_i_9 
       (.I0(\recvPacketHeaderBuffer_reg[38]_0 ),
        .I1(\recvPacketHeaderBuffer_reg[27]_0 ),
        .I2(DBG_recvPacketData[9]),
        .I3(\recvPacketHeaderBuffer_reg[22]_0 ),
        .I4(\recvPacketHeaderBuffer_reg[26]_0 ),
        .I5(\recvPacketHeaderBuffer_reg[37]_0 ),
        .O(\DBG_recvHeaderChecksum[4]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'h9669699669969669)) 
    \DBG_recvHeaderChecksum[5]_i_1 
       (.I0(\DBG_recvHeaderChecksum[5]_i_2_n_0 ),
        .I1(\DBG_recvHeaderChecksum[5]_i_3_n_0 ),
        .I2(\DBG_recvHeaderChecksum[5]_i_4_n_0 ),
        .I3(\recvPacketHeaderBuffer_reg[14]_0 ),
        .I4(\DBG_recvHeaderChecksum[5]_i_5_n_0 ),
        .I5(\DBG_recvHeaderChecksum[5]_i_6_n_0 ),
        .O(CalcNetSessionPacketHeaderChecksum[5]));
  (* SOFT_HLUTNM = "soft_lutpair123" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    \DBG_recvHeaderChecksum[5]_i_10 
       (.I0(\recvPacketHeaderBuffer_reg[17]_0 ),
        .I1(\recvPacketHeaderBuffer_reg[32]_0 ),
        .I2(\recvPacketHeaderBuffer_reg[29]_0 ),
        .O(\DBG_recvHeaderChecksum[5]_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair122" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \DBG_recvHeaderChecksum[5]_i_11 
       (.I0(\recvPacketHeaderBuffer_reg[34]_0 ),
        .I1(\recvPacketHeaderBuffer_reg[31]_0 ),
        .I2(\recvPacketHeaderBuffer_reg[19]_0 ),
        .O(\DBG_recvHeaderChecksum[5]_i_11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair120" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \DBG_recvHeaderChecksum[5]_i_12 
       (.I0(\recvPacketHeaderBuffer_reg[57]_0 ),
        .I1(\recvPacketHeaderBuffer_reg[4]_0 ),
        .I2(\recvPacketHeaderBuffer_reg[49]_0 ),
        .O(\DBG_recvHeaderChecksum[5]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'h011515571557577F)) 
    \DBG_recvHeaderChecksum[5]_i_13 
       (.I0(\DBG_recvHeaderChecksum[5]_i_22_n_0 ),
        .I1(\recvPacketHeaderBuffer_reg[54]_0 ),
        .I2(\recvPacketHeaderBuffer_reg[1]_0 ),
        .I3(\recvPacketHeaderBuffer_reg[62]_0 ),
        .I4(\DBG_recvHeaderChecksum[3]_i_8_n_0 ),
        .I5(\DBG_recvHeaderChecksum[3]_i_7_n_0 ),
        .O(\DBG_recvHeaderChecksum[5]_i_13_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair137" *) 
  LUT3 #(
    .INIT(8'h17)) 
    \DBG_recvHeaderChecksum[5]_i_14 
       (.I0(\recvPacketHeaderBuffer_reg[55]_0 ),
        .I1(\recvPacketHeaderBuffer_reg[2]_0 ),
        .I2(\recvPacketHeaderBuffer_reg[63]_0 ),
        .O(\DBG_recvHeaderChecksum[5]_i_14_n_0 ));
  LUT6 #(
    .INIT(64'h88E8E8EE77171711)) 
    \DBG_recvHeaderChecksum[5]_i_15 
       (.I0(\DBG_recvHeaderChecksum[5]_i_21_n_0 ),
        .I1(\DBG_recvHeaderChecksum[5]_i_23_n_0 ),
        .I2(\DBG_recvHeaderChecksum[2]_i_5_n_0 ),
        .I3(\DBG_recvHeaderChecksum[4]_i_8_n_0 ),
        .I4(\DBG_recvHeaderChecksum[4]_i_9_n_0 ),
        .I5(\DBG_recvHeaderChecksum[5]_i_24_n_0 ),
        .O(\DBG_recvHeaderChecksum[5]_i_15_n_0 ));
  LUT6 #(
    .INIT(64'h1E7878E178E1E187)) 
    \DBG_recvHeaderChecksum[5]_i_16 
       (.I0(\DBG_recvHeaderChecksum[3]_i_7_n_0 ),
        .I1(\DBG_recvHeaderChecksum[3]_i_8_n_0 ),
        .I2(\DBG_recvHeaderChecksum[5]_i_22_n_0 ),
        .I3(\recvPacketHeaderBuffer_reg[54]_0 ),
        .I4(\recvPacketHeaderBuffer_reg[1]_0 ),
        .I5(\recvPacketHeaderBuffer_reg[62]_0 ),
        .O(\DBG_recvHeaderChecksum[5]_i_16_n_0 ));
  LUT6 #(
    .INIT(64'h1E7878E178E1E187)) 
    \DBG_recvHeaderChecksum[5]_i_17 
       (.I0(\DBG_recvHeaderChecksum[4]_i_8_n_0 ),
        .I1(\DBG_recvHeaderChecksum[4]_i_9_n_0 ),
        .I2(\DBG_recvHeaderChecksum[5]_i_21_n_0 ),
        .I3(\recvPacketHeaderBuffer_reg[16]_0 ),
        .I4(\recvPacketHeaderBuffer_reg[28]_0 ),
        .I5(\recvPacketHeaderBuffer_reg[39]_0 ),
        .O(\DBG_recvHeaderChecksum[5]_i_17_n_0 ));
  LUT6 #(
    .INIT(64'h9696960096000000)) 
    \DBG_recvHeaderChecksum[5]_i_18 
       (.I0(\recvPacketHeaderBuffer_reg[55]_0 ),
        .I1(\recvPacketHeaderBuffer_reg[2]_0 ),
        .I2(\recvPacketHeaderBuffer_reg[63]_0 ),
        .I3(\recvPacketHeaderBuffer_reg[54]_0 ),
        .I4(\recvPacketHeaderBuffer_reg[1]_0 ),
        .I5(\recvPacketHeaderBuffer_reg[62]_0 ),
        .O(\DBG_recvHeaderChecksum[5]_i_18_n_0 ));
  LUT6 #(
    .INIT(64'h0017170017000017)) 
    \DBG_recvHeaderChecksum[5]_i_19 
       (.I0(\recvPacketHeaderBuffer_reg[54]_0 ),
        .I1(\recvPacketHeaderBuffer_reg[1]_0 ),
        .I2(\recvPacketHeaderBuffer_reg[62]_0 ),
        .I3(\recvPacketHeaderBuffer_reg[55]_0 ),
        .I4(\recvPacketHeaderBuffer_reg[2]_0 ),
        .I5(\recvPacketHeaderBuffer_reg[63]_0 ),
        .O(\DBG_recvHeaderChecksum[5]_i_19_n_0 ));
  LUT5 #(
    .INIT(32'h2BB2B22B)) 
    \DBG_recvHeaderChecksum[5]_i_2 
       (.I0(\DBG_recvHeaderChecksum[5]_i_7_n_0 ),
        .I1(DBG_recvPacketData[4]),
        .I2(\DBG_recvHeaderChecksum[5]_i_8_n_0 ),
        .I3(\DBG_recvHeaderChecksum[5]_i_9_n_0 ),
        .I4(\DBG_recvHeaderChecksum[5]_i_10_n_0 ),
        .O(\DBG_recvHeaderChecksum[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h6969699669969696)) 
    \DBG_recvHeaderChecksum[5]_i_20 
       (.I0(\recvPacketHeaderBuffer_reg[48]_0 ),
        .I1(\recvPacketHeaderBuffer_reg[3]_0 ),
        .I2(\recvPacketHeaderBuffer_reg[56]_0 ),
        .I3(\recvPacketHeaderBuffer_reg[63]_0 ),
        .I4(\recvPacketHeaderBuffer_reg[2]_0 ),
        .I5(\recvPacketHeaderBuffer_reg[55]_0 ),
        .O(\DBG_recvHeaderChecksum[5]_i_20_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair123" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \DBG_recvHeaderChecksum[5]_i_21 
       (.I0(\recvPacketHeaderBuffer_reg[32]_0 ),
        .I1(\recvPacketHeaderBuffer_reg[29]_0 ),
        .I2(\recvPacketHeaderBuffer_reg[17]_0 ),
        .O(\DBG_recvHeaderChecksum[5]_i_21_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair137" *) 
  LUT3 #(
    .INIT(8'h96)) 
    \DBG_recvHeaderChecksum[5]_i_22 
       (.I0(\recvPacketHeaderBuffer_reg[63]_0 ),
        .I1(\recvPacketHeaderBuffer_reg[2]_0 ),
        .I2(\recvPacketHeaderBuffer_reg[55]_0 ),
        .O(\DBG_recvHeaderChecksum[5]_i_22_n_0 ));
  LUT3 #(
    .INIT(8'h17)) 
    \DBG_recvHeaderChecksum[5]_i_23 
       (.I0(\recvPacketHeaderBuffer_reg[16]_0 ),
        .I1(\recvPacketHeaderBuffer_reg[28]_0 ),
        .I2(\recvPacketHeaderBuffer_reg[39]_0 ),
        .O(\DBG_recvHeaderChecksum[5]_i_23_n_0 ));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    \DBG_recvHeaderChecksum[5]_i_24 
       (.I0(\recvPacketHeaderBuffer_reg[29]_0 ),
        .I1(\recvPacketHeaderBuffer_reg[32]_0 ),
        .I2(\recvPacketHeaderBuffer_reg[17]_0 ),
        .I3(DBG_recvPacketData[6]),
        .I4(\recvPacketHeaderBuffer_reg[30]_0 ),
        .I5(\recvPacketHeaderBuffer_reg[33]_0 ),
        .O(\DBG_recvHeaderChecksum[5]_i_24_n_0 ));
  LUT6 #(
    .INIT(64'hA99595569556566A)) 
    \DBG_recvHeaderChecksum[5]_i_3 
       (.I0(\DBG_recvHeaderChecksum[5]_i_11_n_0 ),
        .I1(\DBG_recvHeaderChecksum[5]_i_10_n_0 ),
        .I2(DBG_recvPacketData[6]),
        .I3(\recvPacketHeaderBuffer_reg[30]_0 ),
        .I4(\recvPacketHeaderBuffer_reg[33]_0 ),
        .I5(\DBG_recvHeaderChecksum[5]_i_8_n_0 ),
        .O(\DBG_recvHeaderChecksum[5]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h95A9A96AA96A6A56)) 
    \DBG_recvHeaderChecksum[5]_i_4 
       (.I0(\DBG_recvHeaderChecksum[5]_i_12_n_0 ),
        .I1(\DBG_recvHeaderChecksum[5]_i_13_n_0 ),
        .I2(\DBG_recvHeaderChecksum[5]_i_14_n_0 ),
        .I3(\recvPacketHeaderBuffer_reg[56]_0 ),
        .I4(\recvPacketHeaderBuffer_reg[3]_0 ),
        .I5(\recvPacketHeaderBuffer_reg[48]_0 ),
        .O(\DBG_recvHeaderChecksum[5]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hC000CCC8CCC8FCCC)) 
    \DBG_recvHeaderChecksum[5]_i_5 
       (.I0(\DBG_recvHeaderChecksum[4]_i_3_n_0 ),
        .I1(\DBG_recvHeaderChecksum[4]_i_2_n_0 ),
        .I2(\DBG_recvHeaderChecksum[4]_i_6_n_0 ),
        .I3(\DBG_recvHeaderChecksum[4]_i_7_n_0 ),
        .I4(\DBG_recvHeaderChecksum[4]_i_4_n_0 ),
        .I5(\DBG_recvHeaderChecksum[4]_i_5_n_0 ),
        .O(\DBG_recvHeaderChecksum[5]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h6900696900006900)) 
    \DBG_recvHeaderChecksum[5]_i_6 
       (.I0(\DBG_recvHeaderChecksum[5]_i_7_n_0 ),
        .I1(\DBG_recvHeaderChecksum[5]_i_15_n_0 ),
        .I2(DBG_recvPacketData[4]),
        .I3(DBG_recvPacketData[3]),
        .I4(\DBG_recvHeaderChecksum[5]_i_16_n_0 ),
        .I5(\DBG_recvHeaderChecksum[5]_i_17_n_0 ),
        .O(\DBG_recvHeaderChecksum[5]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h0000FF8EFFFF0071)) 
    \DBG_recvHeaderChecksum[5]_i_7 
       (.I0(\DBG_recvHeaderChecksum[3]_i_7_n_0 ),
        .I1(\DBG_recvHeaderChecksum[3]_i_8_n_0 ),
        .I2(\DBG_recvHeaderChecksum[2]_i_6_n_0 ),
        .I3(\DBG_recvHeaderChecksum[5]_i_18_n_0 ),
        .I4(\DBG_recvHeaderChecksum[5]_i_19_n_0 ),
        .I5(\DBG_recvHeaderChecksum[5]_i_20_n_0 ),
        .O(\DBG_recvHeaderChecksum[5]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hE8808000FFFEFEE8)) 
    \DBG_recvHeaderChecksum[5]_i_8 
       (.I0(\DBG_recvHeaderChecksum[4]_i_9_n_0 ),
        .I1(\DBG_recvHeaderChecksum[4]_i_8_n_0 ),
        .I2(\recvPacketHeaderBuffer_reg[16]_0 ),
        .I3(\recvPacketHeaderBuffer_reg[28]_0 ),
        .I4(\recvPacketHeaderBuffer_reg[39]_0 ),
        .I5(\DBG_recvHeaderChecksum[5]_i_21_n_0 ),
        .O(\DBG_recvHeaderChecksum[5]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair138" *) 
  LUT3 #(
    .INIT(8'h96)) 
    \DBG_recvHeaderChecksum[5]_i_9 
       (.I0(\recvPacketHeaderBuffer_reg[33]_0 ),
        .I1(\recvPacketHeaderBuffer_reg[30]_0 ),
        .I2(DBG_recvPacketData[6]),
        .O(\DBG_recvHeaderChecksum[5]_i_9_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \DBG_recvHeaderChecksum[6]_i_1 
       (.I0(\DBG_recvHeaderChecksum[6]_i_2_n_0 ),
        .O(CalcNetSessionPacketHeaderChecksum[6]));
  LUT6 #(
    .INIT(64'h78E1E1871E7878E1)) 
    \DBG_recvHeaderChecksum[6]_i_2 
       (.I0(\DBG_recvHeaderChecksum[5]_i_6_n_0 ),
        .I1(\DBG_recvHeaderChecksum[5]_i_5_n_0 ),
        .I2(\DBG_recvHeaderChecksum[6]_i_3_n_0 ),
        .I3(\recvPacketHeaderBuffer_reg[14]_0 ),
        .I4(\DBG_recvHeaderChecksum[6]_i_4_n_0 ),
        .I5(\DBG_recvHeaderChecksum[5]_i_2_n_0 ),
        .O(\DBG_recvHeaderChecksum[6]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT5 #(
    .INIT(32'h4BB4B44B)) 
    \DBG_recvHeaderChecksum[6]_i_3 
       (.I0(\DBG_recvHeaderChecksum[5]_i_4_n_0 ),
        .I1(\DBG_recvHeaderChecksum[5]_i_3_n_0 ),
        .I2(\DBG_recvHeaderChecksum[7]_i_9_n_0 ),
        .I3(DBG_recvPacketData[5]),
        .I4(\DBG_recvHeaderChecksum[7]_i_8_n_0 ),
        .O(\DBG_recvHeaderChecksum[6]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \DBG_recvHeaderChecksum[6]_i_4 
       (.I0(\DBG_recvHeaderChecksum[5]_i_3_n_0 ),
        .I1(\DBG_recvHeaderChecksum[5]_i_4_n_0 ),
        .O(\DBG_recvHeaderChecksum[6]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000000040000000)) 
    \DBG_recvHeaderChecksum[7]_i_1 
       (.I0(recv_pkt_header_empty),
        .I1(recvParseState__0[0]),
        .I2(recvParseState__0[1]),
        .I3(currentState__0[0]),
        .I4(sendHasRepliedSuccessfulConnection),
        .I5(recvPumpFIFO_reg_n_0),
        .O(\DBG_recvHeaderChecksum[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hA880FEEA577F0115)) 
    \DBG_recvHeaderChecksum[7]_i_10 
       (.I0(\DBG_recvHeaderChecksum[7]_i_14_n_0 ),
        .I1(\recvPacketHeaderBuffer_reg[19]_0 ),
        .I2(\recvPacketHeaderBuffer_reg[34]_0 ),
        .I3(\recvPacketHeaderBuffer_reg[31]_0 ),
        .I4(\DBG_recvHeaderChecksum[7]_i_12_n_0 ),
        .I5(\DBG_recvHeaderChecksum[7]_i_20_n_0 ),
        .O(\DBG_recvHeaderChecksum[7]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h87E1E178E178781E)) 
    \DBG_recvHeaderChecksum[7]_i_11 
       (.I0(\DBG_recvHeaderChecksum[7]_i_21_n_0 ),
        .I1(\DBG_recvHeaderChecksum[7]_i_22_n_0 ),
        .I2(\DBG_recvHeaderChecksum[7]_i_23_n_0 ),
        .I3(\recvPacketHeaderBuffer_reg[50]_0 ),
        .I4(\recvPacketHeaderBuffer_reg[58]_0 ),
        .I5(\recvPacketHeaderBuffer_reg[5]_0 ),
        .O(\DBG_recvHeaderChecksum[7]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'h107070F170F1F1F7)) 
    \DBG_recvHeaderChecksum[7]_i_12 
       (.I0(\DBG_recvHeaderChecksum[5]_i_8_n_0 ),
        .I1(\DBG_recvHeaderChecksum[5]_i_10_n_0 ),
        .I2(\DBG_recvHeaderChecksum[5]_i_11_n_0 ),
        .I3(DBG_recvPacketData[6]),
        .I4(\recvPacketHeaderBuffer_reg[33]_0 ),
        .I5(\recvPacketHeaderBuffer_reg[30]_0 ),
        .O(\DBG_recvHeaderChecksum[7]_i_12_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair122" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    \DBG_recvHeaderChecksum[7]_i_13 
       (.I0(\recvPacketHeaderBuffer_reg[19]_0 ),
        .I1(\recvPacketHeaderBuffer_reg[34]_0 ),
        .I2(\recvPacketHeaderBuffer_reg[31]_0 ),
        .O(\DBG_recvHeaderChecksum[7]_i_13_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \DBG_recvHeaderChecksum[7]_i_14 
       (.I0(\recvPacketHeaderBuffer_reg[35]_0 ),
        .I1(DBG_recvPacketData[10]),
        .I2(DBG_recvPacketData[7]),
        .O(\DBG_recvHeaderChecksum[7]_i_14_n_0 ));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    \DBG_recvHeaderChecksum[7]_i_15 
       (.I0(\recvPacketHeaderBuffer_reg[31]_0 ),
        .I1(\recvPacketHeaderBuffer_reg[34]_0 ),
        .I2(\recvPacketHeaderBuffer_reg[19]_0 ),
        .I3(DBG_recvPacketData[7]),
        .I4(DBG_recvPacketData[10]),
        .I5(\recvPacketHeaderBuffer_reg[35]_0 ),
        .O(\DBG_recvHeaderChecksum[7]_i_15_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair138" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    \DBG_recvHeaderChecksum[7]_i_16 
       (.I0(DBG_recvPacketData[6]),
        .I1(\recvPacketHeaderBuffer_reg[33]_0 ),
        .I2(\recvPacketHeaderBuffer_reg[30]_0 ),
        .O(\DBG_recvHeaderChecksum[7]_i_16_n_0 ));
  LUT6 #(
    .INIT(64'h6969699669969696)) 
    \DBG_recvHeaderChecksum[7]_i_17 
       (.I0(\recvPacketHeaderBuffer_reg[50]_0 ),
        .I1(\recvPacketHeaderBuffer_reg[58]_0 ),
        .I2(\recvPacketHeaderBuffer_reg[5]_0 ),
        .I3(\recvPacketHeaderBuffer_reg[57]_0 ),
        .I4(\recvPacketHeaderBuffer_reg[4]_0 ),
        .I5(\recvPacketHeaderBuffer_reg[49]_0 ),
        .O(\DBG_recvHeaderChecksum[7]_i_17_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair136" *) 
  LUT3 #(
    .INIT(8'h17)) 
    \DBG_recvHeaderChecksum[7]_i_18 
       (.I0(\recvPacketHeaderBuffer_reg[48]_0 ),
        .I1(\recvPacketHeaderBuffer_reg[3]_0 ),
        .I2(\recvPacketHeaderBuffer_reg[56]_0 ),
        .O(\DBG_recvHeaderChecksum[7]_i_18_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair136" *) 
  LUT3 #(
    .INIT(8'h96)) 
    \DBG_recvHeaderChecksum[7]_i_19 
       (.I0(\recvPacketHeaderBuffer_reg[56]_0 ),
        .I1(\recvPacketHeaderBuffer_reg[3]_0 ),
        .I2(\recvPacketHeaderBuffer_reg[48]_0 ),
        .O(\DBG_recvHeaderChecksum[7]_i_19_n_0 ));
  LUT5 #(
    .INIT(32'h2DB4B4D2)) 
    \DBG_recvHeaderChecksum[7]_i_2 
       (.I0(\DBG_recvHeaderChecksum[7]_i_3_n_0 ),
        .I1(\DBG_recvHeaderChecksum[7]_i_4_n_0 ),
        .I2(\DBG_recvHeaderChecksum[7]_i_5_n_0 ),
        .I3(\DBG_recvHeaderChecksum[7]_i_6_n_0 ),
        .I4(\DBG_recvHeaderChecksum[7]_i_7_n_0 ),
        .O(CalcNetSessionPacketHeaderChecksum[7]));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    \DBG_recvHeaderChecksum[7]_i_20 
       (.I0(DBG_recvPacketData[10]),
        .I1(\recvPacketHeaderBuffer_reg[35]_0 ),
        .I2(DBG_recvPacketData[7]),
        .I3(DBG_recvPacketData[8]),
        .I4(DBG_recvPacketData[11]),
        .I5(\recvPacketHeaderBuffer_reg[36]_0 ),
        .O(\DBG_recvHeaderChecksum[7]_i_20_n_0 ));
  LUT6 #(
    .INIT(64'h80E0E0F8E0F8F8FE)) 
    \DBG_recvHeaderChecksum[7]_i_21 
       (.I0(\DBG_recvHeaderChecksum[5]_i_14_n_0 ),
        .I1(\DBG_recvHeaderChecksum[5]_i_13_n_0 ),
        .I2(\DBG_recvHeaderChecksum[5]_i_12_n_0 ),
        .I3(\recvPacketHeaderBuffer_reg[48]_0 ),
        .I4(\recvPacketHeaderBuffer_reg[3]_0 ),
        .I5(\recvPacketHeaderBuffer_reg[56]_0 ),
        .O(\DBG_recvHeaderChecksum[7]_i_21_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair120" *) 
  LUT3 #(
    .INIT(8'h17)) 
    \DBG_recvHeaderChecksum[7]_i_22 
       (.I0(\recvPacketHeaderBuffer_reg[49]_0 ),
        .I1(\recvPacketHeaderBuffer_reg[4]_0 ),
        .I2(\recvPacketHeaderBuffer_reg[57]_0 ),
        .O(\DBG_recvHeaderChecksum[7]_i_22_n_0 ));
  LUT4 #(
    .INIT(16'h6996)) 
    \DBG_recvHeaderChecksum[7]_i_23 
       (.I0(\recvPacketHeaderBuffer_reg[59]_0 ),
        .I1(\recvPacketHeaderBuffer_reg[51]_0 ),
        .I2(DBG_recvPacketData[1]),
        .I3(DBG_recvPacketData[0]),
        .O(\DBG_recvHeaderChecksum[7]_i_23_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF966996690000)) 
    \DBG_recvHeaderChecksum[7]_i_3 
       (.I0(\DBG_recvHeaderChecksum[5]_i_2_n_0 ),
        .I1(\DBG_recvHeaderChecksum[5]_i_3_n_0 ),
        .I2(\DBG_recvHeaderChecksum[5]_i_4_n_0 ),
        .I3(\recvPacketHeaderBuffer_reg[14]_0 ),
        .I4(\DBG_recvHeaderChecksum[5]_i_5_n_0 ),
        .I5(\DBG_recvHeaderChecksum[5]_i_6_n_0 ),
        .O(\DBG_recvHeaderChecksum[7]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'hD741)) 
    \DBG_recvHeaderChecksum[7]_i_4 
       (.I0(\recvPacketHeaderBuffer_reg[14]_0 ),
        .I1(\DBG_recvHeaderChecksum[5]_i_4_n_0 ),
        .I2(\DBG_recvHeaderChecksum[5]_i_3_n_0 ),
        .I3(\DBG_recvHeaderChecksum[5]_i_2_n_0 ),
        .O(\DBG_recvHeaderChecksum[7]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h718E8E71)) 
    \DBG_recvHeaderChecksum[7]_i_5 
       (.I0(\DBG_recvHeaderChecksum[7]_i_8_n_0 ),
        .I1(\DBG_recvHeaderChecksum[7]_i_9_n_0 ),
        .I2(DBG_recvPacketData[5]),
        .I3(\DBG_recvHeaderChecksum[7]_i_10_n_0 ),
        .I4(\DBG_recvHeaderChecksum[7]_i_11_n_0 ),
        .O(\DBG_recvHeaderChecksum[7]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \DBG_recvHeaderChecksum[7]_i_6 
       (.I0(\DBG_recvHeaderChecksum[5]_i_3_n_0 ),
        .I1(\DBG_recvHeaderChecksum[5]_i_4_n_0 ),
        .O(\DBG_recvHeaderChecksum[7]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h69969669)) 
    \DBG_recvHeaderChecksum[7]_i_7 
       (.I0(\DBG_recvHeaderChecksum[7]_i_12_n_0 ),
        .I1(\DBG_recvHeaderChecksum[7]_i_13_n_0 ),
        .I2(\DBG_recvHeaderChecksum[7]_i_14_n_0 ),
        .I3(DBG_recvPacketData[5]),
        .I4(\DBG_recvHeaderChecksum[7]_i_9_n_0 ),
        .O(\DBG_recvHeaderChecksum[7]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h9A9A9A599A595959)) 
    \DBG_recvHeaderChecksum[7]_i_8 
       (.I0(\DBG_recvHeaderChecksum[7]_i_15_n_0 ),
        .I1(\DBG_recvHeaderChecksum[7]_i_16_n_0 ),
        .I2(\DBG_recvHeaderChecksum[5]_i_11_n_0 ),
        .I3(\DBG_recvHeaderChecksum[5]_i_10_n_0 ),
        .I4(\DBG_recvHeaderChecksum[5]_i_9_n_0 ),
        .I5(\DBG_recvHeaderChecksum[5]_i_8_n_0 ),
        .O(\DBG_recvHeaderChecksum[7]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h566A6A6A5656566A)) 
    \DBG_recvHeaderChecksum[7]_i_9 
       (.I0(\DBG_recvHeaderChecksum[7]_i_17_n_0 ),
        .I1(\DBG_recvHeaderChecksum[7]_i_18_n_0 ),
        .I2(\DBG_recvHeaderChecksum[5]_i_12_n_0 ),
        .I3(\DBG_recvHeaderChecksum[5]_i_13_n_0 ),
        .I4(\DBG_recvHeaderChecksum[5]_i_14_n_0 ),
        .I5(\DBG_recvHeaderChecksum[7]_i_19_n_0 ),
        .O(\DBG_recvHeaderChecksum[7]_i_9_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \DBG_recvHeaderChecksum_reg[0] 
       (.C(clk333_250),
        .CE(\DBG_recvHeaderChecksum[7]_i_1_n_0 ),
        .D(\DBG_recvHeaderChecksum[0]_i_1_n_0 ),
        .Q(DBG_recvHeaderChecksum[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DBG_recvHeaderChecksum_reg[1] 
       (.C(clk333_250),
        .CE(\DBG_recvHeaderChecksum[7]_i_1_n_0 ),
        .D(CalcNetSessionPacketHeaderChecksum[1]),
        .Q(DBG_recvHeaderChecksum[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DBG_recvHeaderChecksum_reg[2] 
       (.C(clk333_250),
        .CE(\DBG_recvHeaderChecksum[7]_i_1_n_0 ),
        .D(CalcNetSessionPacketHeaderChecksum[2]),
        .Q(DBG_recvHeaderChecksum[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DBG_recvHeaderChecksum_reg[3] 
       (.C(clk333_250),
        .CE(\DBG_recvHeaderChecksum[7]_i_1_n_0 ),
        .D(CalcNetSessionPacketHeaderChecksum[3]),
        .Q(DBG_recvHeaderChecksum[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DBG_recvHeaderChecksum_reg[4] 
       (.C(clk333_250),
        .CE(\DBG_recvHeaderChecksum[7]_i_1_n_0 ),
        .D(CalcNetSessionPacketHeaderChecksum[4]),
        .Q(DBG_recvHeaderChecksum[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DBG_recvHeaderChecksum_reg[5] 
       (.C(clk333_250),
        .CE(\DBG_recvHeaderChecksum[7]_i_1_n_0 ),
        .D(CalcNetSessionPacketHeaderChecksum[5]),
        .Q(DBG_recvHeaderChecksum[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DBG_recvHeaderChecksum_reg[6] 
       (.C(clk333_250),
        .CE(\DBG_recvHeaderChecksum[7]_i_1_n_0 ),
        .D(CalcNetSessionPacketHeaderChecksum[6]),
        .Q(DBG_recvHeaderChecksum[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DBG_recvHeaderChecksum_reg[7] 
       (.C(clk333_250),
        .CE(\DBG_recvHeaderChecksum[7]_i_1_n_0 ),
        .D(CalcNetSessionPacketHeaderChecksum[7]),
        .Q(DBG_recvHeaderChecksum[7]),
        .R(1'b0));
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    DBG_returnPacketsFIFO_rd_en_reg
       (.C(clk333_250),
        .CE(1'b1),
        .D(returnPacketsFIFO_rd_en_i_1_n_0),
        .Q(DBG_returnPacketsFIFO_rd_en),
        .R(1'b0));
  LUT3 #(
    .INIT(8'hB8)) 
    \FSM_sequential_sendPacketState[0]_i_1 
       (.I0(recvSessionDisconnectSignal_reg_n_0),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[3] ),
        .I2(\FSM_sequential_sendPacketState[0]_i_2_n_0 ),
        .O(sendPacketState__1[0]));
  LUT6 #(
    .INIT(64'h3331333133310331)) 
    \FSM_sequential_sendPacketState[0]_i_2 
       (.I0(sendHasUnackedSentPacket_reg_0),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .I2(sendPacketState__0),
        .I3(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I4(recvSessionDisconnectSignal_reg_n_0),
        .I5(\sendLastSentPacketHeader_reg[subpacketCount_n_0_][0] ),
        .O(\FSM_sequential_sendPacketState[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT5 #(
    .INIT(32'h000F0B00)) 
    \FSM_sequential_sendPacketState[1]_i_1 
       (.I0(\sendLastSentPacketHeader_reg[subpacketCount_n_0_][0] ),
        .I1(sendPacketState__0),
        .I2(\FSM_sequential_sendPacketState_reg_n_0_[3] ),
        .I3(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I4(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .O(sendPacketState__1[1]));
  LUT6 #(
    .INIT(64'h1445140514441404)) 
    \FSM_sequential_sendPacketState[2]_i_1 
       (.I0(\FSM_sequential_sendPacketState_reg_n_0_[3] ),
        .I1(sendPacketState__0),
        .I2(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I3(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .I4(\sendLastSentPacketHeader_reg[subpacketCount_n_0_][0] ),
        .I5(sendHasUnackedSentPacket_reg_0),
        .O(sendPacketState__1[2]));
  LUT6 #(
    .INIT(64'hEAAAEAEA40004000)) 
    \FSM_sequential_sendPacketState[3]_i_1 
       (.I0(\FSM_sequential_sendPacketState_reg_n_0_[3] ),
        .I1(sendPacketState__0),
        .I2(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I3(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .I4(\sendLastSentPacketHeader_reg[subpacketCount_n_0_][0] ),
        .I5(recvSessionDisconnectSignal_reg_n_0),
        .O(sendPacketState__1[3]));
  (* FSM_ENCODED_STATES = "sendpacketfrombramstateb4:0111,sendpacketfrombramstateb0:0110,sendpacketfrombramstateh1:0101,sendpacketfrombramstateh0:0100,sendcontrollerstate:0000,sendsafetoresetsession:1001,sendcopypackettobramstateb4:0010,sendcopypackettobramstateb8:0011,sendcopypackettobramstateb0:0001,sendpacketfrombramstateb8:1000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_sendPacketState_reg[0] 
       (.C(clk333_250),
        .CE(sendPacketState),
        .D(sendPacketState__1[0]),
        .Q(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "sendpacketfrombramstateb4:0111,sendpacketfrombramstateb0:0110,sendpacketfrombramstateh1:0101,sendpacketfrombramstateh0:0100,sendcontrollerstate:0000,sendsafetoresetsession:1001,sendcopypackettobramstateb4:0010,sendcopypackettobramstateb8:0011,sendcopypackettobramstateb0:0001,sendpacketfrombramstateb8:1000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_sendPacketState_reg[1] 
       (.C(clk333_250),
        .CE(sendPacketState),
        .D(sendPacketState__1[1]),
        .Q(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "sendpacketfrombramstateb4:0111,sendpacketfrombramstateb0:0110,sendpacketfrombramstateh1:0101,sendpacketfrombramstateh0:0100,sendcontrollerstate:0000,sendsafetoresetsession:1001,sendcopypackettobramstateb4:0010,sendcopypackettobramstateb8:0011,sendcopypackettobramstateb0:0001,sendpacketfrombramstateb8:1000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_sendPacketState_reg[2] 
       (.C(clk333_250),
        .CE(sendPacketState),
        .D(sendPacketState__1[2]),
        .Q(sendPacketState__0),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "sendpacketfrombramstateb4:0111,sendpacketfrombramstateb0:0110,sendpacketfrombramstateh1:0101,sendpacketfrombramstateh0:0100,sendcontrollerstate:0000,sendsafetoresetsession:1001,sendcopypackettobramstateb4:0010,sendcopypackettobramstateb8:0011,sendcopypackettobramstateb0:0001,sendpacketfrombramstateb8:1000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_sendPacketState_reg[3] 
       (.C(clk333_250),
        .CE(sendPacketState),
        .D(sendPacketState__1[3]),
        .Q(\FSM_sequential_sendPacketState_reg_n_0_[3] ),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0100000000000000)) 
    \currentSessionState[hostMACAddress][47]_i_1 
       (.I0(\sendPacketHeaderBuffer_reg_n_0_[10] ),
        .I1(\sendPacketHeaderBuffer_reg_n_0_[8] ),
        .I2(\sendPacketHeaderBuffer_reg_n_0_[9] ),
        .I3(\send_pkt_data_wr_data[31]_i_6_n_0 ),
        .I4(sendHandlingReply_reg_0),
        .I5(DBG_SendFIFOState[2]),
        .O(\currentSessionState[hostMACAddress] ));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostIPv4Address][0] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostIPv4Address] [0]),
        .Q(\currentSessionState_reg[hostIPv4Address] [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostIPv4Address][10] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostIPv4Address] [10]),
        .Q(\currentSessionState_reg[hostIPv4Address] [10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostIPv4Address][11] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostIPv4Address] [11]),
        .Q(\currentSessionState_reg[hostIPv4Address] [11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostIPv4Address][12] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostIPv4Address] [12]),
        .Q(\currentSessionState_reg[hostIPv4Address] [12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostIPv4Address][13] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostIPv4Address] [13]),
        .Q(\currentSessionState_reg[hostIPv4Address] [13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostIPv4Address][14] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostIPv4Address] [14]),
        .Q(\currentSessionState_reg[hostIPv4Address] [14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostIPv4Address][15] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostIPv4Address] [15]),
        .Q(\currentSessionState_reg[hostIPv4Address] [15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostIPv4Address][16] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostIPv4Address] [16]),
        .Q(\currentSessionState_reg[hostIPv4Address] [16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostIPv4Address][17] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostIPv4Address] [17]),
        .Q(\currentSessionState_reg[hostIPv4Address] [17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostIPv4Address][18] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostIPv4Address] [18]),
        .Q(\currentSessionState_reg[hostIPv4Address] [18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostIPv4Address][19] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostIPv4Address] [19]),
        .Q(\currentSessionState_reg[hostIPv4Address] [19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostIPv4Address][1] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostIPv4Address] [1]),
        .Q(\currentSessionState_reg[hostIPv4Address] [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostIPv4Address][20] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostIPv4Address] [20]),
        .Q(\currentSessionState_reg[hostIPv4Address] [20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostIPv4Address][21] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostIPv4Address] [21]),
        .Q(\currentSessionState_reg[hostIPv4Address] [21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostIPv4Address][22] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostIPv4Address] [22]),
        .Q(\currentSessionState_reg[hostIPv4Address] [22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostIPv4Address][23] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostIPv4Address] [23]),
        .Q(\currentSessionState_reg[hostIPv4Address] [23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostIPv4Address][24] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostIPv4Address] [24]),
        .Q(\currentSessionState_reg[hostIPv4Address] [24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostIPv4Address][25] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostIPv4Address] [25]),
        .Q(\currentSessionState_reg[hostIPv4Address] [25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostIPv4Address][26] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostIPv4Address] [26]),
        .Q(\currentSessionState_reg[hostIPv4Address] [26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostIPv4Address][27] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostIPv4Address] [27]),
        .Q(\currentSessionState_reg[hostIPv4Address] [27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostIPv4Address][28] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostIPv4Address] [28]),
        .Q(\currentSessionState_reg[hostIPv4Address] [28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostIPv4Address][29] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostIPv4Address] [29]),
        .Q(\currentSessionState_reg[hostIPv4Address] [29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostIPv4Address][2] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostIPv4Address] [2]),
        .Q(\currentSessionState_reg[hostIPv4Address] [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostIPv4Address][30] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostIPv4Address] [30]),
        .Q(\currentSessionState_reg[hostIPv4Address] [30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostIPv4Address][31] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostIPv4Address] [31]),
        .Q(\currentSessionState_reg[hostIPv4Address] [31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostIPv4Address][3] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostIPv4Address] [3]),
        .Q(\currentSessionState_reg[hostIPv4Address] [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostIPv4Address][4] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostIPv4Address] [4]),
        .Q(\currentSessionState_reg[hostIPv4Address] [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostIPv4Address][5] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostIPv4Address] [5]),
        .Q(\currentSessionState_reg[hostIPv4Address] [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostIPv4Address][6] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostIPv4Address] [6]),
        .Q(\currentSessionState_reg[hostIPv4Address] [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostIPv4Address][7] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostIPv4Address] [7]),
        .Q(\currentSessionState_reg[hostIPv4Address] [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostIPv4Address][8] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostIPv4Address] [8]),
        .Q(\currentSessionState_reg[hostIPv4Address] [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostIPv4Address][9] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostIPv4Address] [9]),
        .Q(\currentSessionState_reg[hostIPv4Address] [9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostMACAddress][0] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostMACAddress] [0]),
        .Q(data1[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostMACAddress][10] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostMACAddress] [10]),
        .Q(data1[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostMACAddress][11] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostMACAddress] [11]),
        .Q(data1[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostMACAddress][12] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostMACAddress] [12]),
        .Q(data1[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostMACAddress][13] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostMACAddress] [13]),
        .Q(data1[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostMACAddress][14] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostMACAddress] [14]),
        .Q(data1[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostMACAddress][15] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostMACAddress] [15]),
        .Q(data1[31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostMACAddress][16] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostMACAddress] [16]),
        .Q(in9[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostMACAddress][17] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostMACAddress] [17]),
        .Q(in9[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostMACAddress][18] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostMACAddress] [18]),
        .Q(in9[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostMACAddress][19] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostMACAddress] [19]),
        .Q(in9[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostMACAddress][1] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostMACAddress] [1]),
        .Q(data1[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostMACAddress][20] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostMACAddress] [20]),
        .Q(in9[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostMACAddress][21] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostMACAddress] [21]),
        .Q(in9[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostMACAddress][22] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostMACAddress] [22]),
        .Q(in9[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostMACAddress][23] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostMACAddress] [23]),
        .Q(in9[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostMACAddress][24] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostMACAddress] [24]),
        .Q(in9[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostMACAddress][25] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostMACAddress] [25]),
        .Q(in9[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostMACAddress][26] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostMACAddress] [26]),
        .Q(in9[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostMACAddress][27] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostMACAddress] [27]),
        .Q(in9[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostMACAddress][28] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostMACAddress] [28]),
        .Q(in9[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostMACAddress][29] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostMACAddress] [29]),
        .Q(in9[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostMACAddress][2] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostMACAddress] [2]),
        .Q(data1[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostMACAddress][30] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostMACAddress] [30]),
        .Q(in9[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostMACAddress][31] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostMACAddress] [31]),
        .Q(in9[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostMACAddress][32] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostMACAddress] [32]),
        .Q(in9[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostMACAddress][33] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostMACAddress] [33]),
        .Q(in9[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostMACAddress][34] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostMACAddress] [34]),
        .Q(in9[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostMACAddress][35] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostMACAddress] [35]),
        .Q(in9[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostMACAddress][36] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostMACAddress] [36]),
        .Q(in9[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostMACAddress][37] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostMACAddress] [37]),
        .Q(in9[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostMACAddress][38] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostMACAddress] [38]),
        .Q(in9[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostMACAddress][39] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostMACAddress] [39]),
        .Q(in9[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostMACAddress][3] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostMACAddress] [3]),
        .Q(data1[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostMACAddress][40] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostMACAddress] [40]),
        .Q(in9[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostMACAddress][41] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostMACAddress] [41]),
        .Q(in9[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostMACAddress][42] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostMACAddress] [42]),
        .Q(in9[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostMACAddress][43] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostMACAddress] [43]),
        .Q(in9[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostMACAddress][44] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostMACAddress] [44]),
        .Q(in9[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostMACAddress][45] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostMACAddress] [45]),
        .Q(in9[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostMACAddress][46] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostMACAddress] [46]),
        .Q(in9[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostMACAddress][47] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostMACAddress] [47]),
        .Q(in9[31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostMACAddress][4] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostMACAddress] [4]),
        .Q(data1[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostMACAddress][5] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostMACAddress] [5]),
        .Q(data1[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostMACAddress][6] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostMACAddress] [6]),
        .Q(data1[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostMACAddress][7] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostMACAddress] [7]),
        .Q(data1[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostMACAddress][8] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostMACAddress] [8]),
        .Q(data1[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentSessionState_reg[hostMACAddress][9] 
       (.C(clk333_250),
        .CE(\currentSessionState[hostMACAddress] ),
        .D(\sendCurrentPacket_reg[hostMACAddress] [9]),
        .Q(data1[25]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair129" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \currentState[0]__0_i_1 
       (.I0(DBG_NetPkt_State[0]),
        .I1(DBG_NetPkt_State[2]),
        .O(\currentState[0]__0_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair96" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \currentState[0]_i_1 
       (.I0(currentState__0[0]),
        .I1(currentState__0[2]),
        .O(\currentState[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair129" *) 
  LUT3 #(
    .INIT(8'hBE)) 
    \currentState[1]__0_i_1 
       (.I0(DBG_NetPkt_State[2]),
        .I1(DBG_NetPkt_State[1]),
        .I2(DBG_NetPkt_State[0]),
        .O(\currentState[1]__0_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair117" *) 
  LUT3 #(
    .INIT(8'hDE)) 
    \currentState[1]_i_1 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(currentState__0[2]),
        .I2(currentState__0[0]),
        .O(\currentState[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF40FF4055)) 
    \currentState[2]__0_i_1 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(ETHCTRL_SendReady),
        .I2(ETHCTRL_RecvReady),
        .I3(currentState__0[0]),
        .I4(sendHasRepliedSuccessfulConnection_reg_n_0),
        .I5(\currentState[2]__0_i_3_n_0 ),
        .O(currentState));
  LUT2 #(
    .INIT(4'h8)) 
    \currentState[2]__0_i_2 
       (.I0(DBG_NetPkt_State[0]),
        .I1(DBG_NetPkt_State[1]),
        .O(\currentState[2]__0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000800000000000)) 
    \currentState[2]__0_i_3 
       (.I0(\currentState[2]__0_i_4_n_0 ),
        .I1(sendHasRepliedSuccessfulConnection),
        .I2(currentState__0[0]),
        .I3(recvParseState__0[1]),
        .I4(recvParseState__0[0]),
        .I5(recvParseState__0[2]),
        .O(\currentState[2]__0_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h0400)) 
    \currentState[2]__0_i_4 
       (.I0(sendPacketState__0),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .I2(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I3(\FSM_sequential_sendPacketState_reg_n_0_[3] ),
        .O(\currentState[2]__0_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \currentState[2]_i_1 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(currentState__0[0]),
        .O(currentState__1));
  (* FSM_ENCODED_STATES = "init:000,waitfornetsystemready:001,unconnectedsendingnonsessionbroadcasts:010,sessionconnectedready:011,sessionisresetting:100," *) 
  (* FSM_ENCODING = "user_encoding" *) 
  FDRE #(
    .INIT(1'b0)) 
    \currentState_reg[0] 
       (.C(clk333_250),
        .CE(currentState),
        .D(\currentState[0]_i_1_n_0 ),
        .Q(currentState__0[0]),
        .R(1'b0));
  (* FSM_ENCODING = "user_encoding" *) 
  FDRE #(
    .INIT(1'b0)) 
    \currentState_reg[0]__0 
       (.C(clk333_250),
        .CE(currentState),
        .D(\currentState[0]__0_i_1_n_0 ),
        .Q(DBG_NetPkt_State[0]),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "init:000,waitfornetsystemready:001,unconnectedsendingnonsessionbroadcasts:010,sessionconnectedready:011,sessionisresetting:100," *) 
  (* FSM_ENCODING = "user_encoding" *) 
  FDRE #(
    .INIT(1'b0)) 
    \currentState_reg[1] 
       (.C(clk333_250),
        .CE(currentState),
        .D(\currentState[1]_i_1_n_0 ),
        .Q(sendHasRepliedSuccessfulConnection),
        .R(1'b0));
  (* FSM_ENCODING = "user_encoding" *) 
  FDRE #(
    .INIT(1'b0)) 
    \currentState_reg[1]__0 
       (.C(clk333_250),
        .CE(currentState),
        .D(\currentState[1]__0_i_1_n_0 ),
        .Q(DBG_NetPkt_State[1]),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "init:000,waitfornetsystemready:001,unconnectedsendingnonsessionbroadcasts:010,sessionconnectedready:011,sessionisresetting:100," *) 
  (* FSM_ENCODING = "user_encoding" *) 
  FDRE #(
    .INIT(1'b0)) 
    \currentState_reg[2] 
       (.C(clk333_250),
        .CE(currentState),
        .D(currentState__1),
        .Q(currentState__0[2]),
        .R(1'b0));
  (* FSM_ENCODING = "user_encoding" *) 
  FDRE #(
    .INIT(1'b0)) 
    \currentState_reg[2]__0 
       (.C(clk333_250),
        .CE(currentState),
        .D(\currentState[2]__0_i_2_n_0 ),
        .Q(DBG_NetPkt_State[2]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hAAABAAAAAAAAAAAA)) 
    \recvCurrentPacket[hostIPv4Address][31]_i_1 
       (.I0(\DBG_recvHeaderChecksum[7]_i_1_n_0 ),
        .I1(\recvCurrentPacket[hostMACAddress][47]_i_3_n_0 ),
        .I2(currentState__0[0]),
        .I3(recv_pkt_header_empty),
        .I4(\recvCurrentPacket[hostIPv4Address][31]_i_2_n_0 ),
        .I5(sendHasRepliedSuccessfulConnection),
        .O(\recvCurrentPacket[hostIPv4Address] ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \recvCurrentPacket[hostIPv4Address][31]_i_2 
       (.I0(DBG_RecvFIFOState[1]),
        .I1(DBG_RecvFIFOState[0]),
        .O(\recvCurrentPacket[hostIPv4Address][31]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAABAAAAAAAAAAA)) 
    \recvCurrentPacket[hostMACAddress][47]_i_1 
       (.I0(\recvCurrentPacket[hostMACAddress][47]_i_2_n_0 ),
        .I1(\recvCurrentPacket[hostMACAddress][47]_i_3_n_0 ),
        .I2(\recvCurrentPacket[hostMACAddress][47]_i_4_n_0 ),
        .I3(DBG_RecvFIFOState[1]),
        .I4(DBG_RecvFIFOState[0]),
        .I5(\send_pkt_data_wr_data[31]_i_6_n_0 ),
        .O(\recvCurrentPacket[hostMACAddress] ));
  LUT6 #(
    .INIT(64'h0000000000000200)) 
    \recvCurrentPacket[hostMACAddress][47]_i_2 
       (.I0(\recvParseState[2]__0_i_3_n_0 ),
        .I1(recv_pkt_data_empty),
        .I2(recv_pkt_header_empty),
        .I3(recvParseState__0[1]),
        .I4(recvParseState__0[0]),
        .I5(recvParseState__0[2]),
        .O(\recvCurrentPacket[hostMACAddress][47]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \recvCurrentPacket[hostMACAddress][47]_i_3 
       (.I0(recvSendReplyPacket_reg_0),
        .I1(recvPumpFIFO_reg_n_0),
        .O(\recvCurrentPacket[hostMACAddress][47]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \recvCurrentPacket[hostMACAddress][47]_i_4 
       (.I0(recv_pkt_header_empty),
        .I1(recv_pkt_data_empty),
        .O(\recvCurrentPacket[hostMACAddress][47]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h444444F444444444)) 
    \recvCurrentPacket[packetLength][15]_i_1 
       (.I0(\recvPacketHeaderBuffer[31]_i_4_n_0 ),
        .I1(\send_pkt_data_wr_data[31]_i_6_n_0 ),
        .I2(\recvParseState[2]__0_i_3_n_0 ),
        .I3(recvParseState__0[1]),
        .I4(recvParseState__0[2]),
        .I5(\recvCurrentPacket[packetLength][15]_i_2_n_0 ),
        .O(\recvCurrentPacket[packetLength] ));
  (* SOFT_HLUTNM = "soft_lutpair113" *) 
  LUT3 #(
    .INIT(8'h10)) 
    \recvCurrentPacket[packetLength][15]_i_2 
       (.I0(recv_pkt_data_empty),
        .I1(recv_pkt_header_empty),
        .I2(recvParseState__0[0]),
        .O(\recvCurrentPacket[packetLength][15]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostIPv4Address][0] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[hostIPv4Address] ),
        .D(recv_pkt_header_rd_data[0]),
        .Q(\recvCurrentPacket_reg[hostIPv4Address_n_0_][0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostIPv4Address][10] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[hostIPv4Address] ),
        .D(recv_pkt_header_rd_data[10]),
        .Q(\recvCurrentPacket_reg[hostIPv4Address_n_0_][10] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostIPv4Address][11] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[hostIPv4Address] ),
        .D(recv_pkt_header_rd_data[11]),
        .Q(\recvCurrentPacket_reg[hostIPv4Address_n_0_][11] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostIPv4Address][12] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[hostIPv4Address] ),
        .D(recv_pkt_header_rd_data[12]),
        .Q(\recvCurrentPacket_reg[hostIPv4Address_n_0_][12] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostIPv4Address][13] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[hostIPv4Address] ),
        .D(recv_pkt_header_rd_data[13]),
        .Q(\recvCurrentPacket_reg[hostIPv4Address_n_0_][13] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostIPv4Address][14] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[hostIPv4Address] ),
        .D(recv_pkt_header_rd_data[14]),
        .Q(\recvCurrentPacket_reg[hostIPv4Address_n_0_][14] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostIPv4Address][15] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[hostIPv4Address] ),
        .D(recv_pkt_header_rd_data[15]),
        .Q(\recvCurrentPacket_reg[hostIPv4Address_n_0_][15] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostIPv4Address][16] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[hostIPv4Address] ),
        .D(recv_pkt_header_rd_data[16]),
        .Q(\recvCurrentPacket_reg[hostIPv4Address_n_0_][16] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostIPv4Address][17] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[hostIPv4Address] ),
        .D(recv_pkt_header_rd_data[17]),
        .Q(\recvCurrentPacket_reg[hostIPv4Address_n_0_][17] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostIPv4Address][18] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[hostIPv4Address] ),
        .D(recv_pkt_header_rd_data[18]),
        .Q(\recvCurrentPacket_reg[hostIPv4Address_n_0_][18] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostIPv4Address][19] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[hostIPv4Address] ),
        .D(recv_pkt_header_rd_data[19]),
        .Q(\recvCurrentPacket_reg[hostIPv4Address_n_0_][19] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostIPv4Address][1] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[hostIPv4Address] ),
        .D(recv_pkt_header_rd_data[1]),
        .Q(\recvCurrentPacket_reg[hostIPv4Address_n_0_][1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostIPv4Address][20] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[hostIPv4Address] ),
        .D(recv_pkt_header_rd_data[20]),
        .Q(\recvCurrentPacket_reg[hostIPv4Address_n_0_][20] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostIPv4Address][21] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[hostIPv4Address] ),
        .D(recv_pkt_header_rd_data[21]),
        .Q(\recvCurrentPacket_reg[hostIPv4Address_n_0_][21] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostIPv4Address][22] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[hostIPv4Address] ),
        .D(recv_pkt_header_rd_data[22]),
        .Q(\recvCurrentPacket_reg[hostIPv4Address_n_0_][22] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostIPv4Address][23] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[hostIPv4Address] ),
        .D(recv_pkt_header_rd_data[23]),
        .Q(\recvCurrentPacket_reg[hostIPv4Address_n_0_][23] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostIPv4Address][24] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[hostIPv4Address] ),
        .D(recv_pkt_header_rd_data[24]),
        .Q(\recvCurrentPacket_reg[hostIPv4Address_n_0_][24] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostIPv4Address][25] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[hostIPv4Address] ),
        .D(recv_pkt_header_rd_data[25]),
        .Q(\recvCurrentPacket_reg[hostIPv4Address_n_0_][25] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostIPv4Address][26] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[hostIPv4Address] ),
        .D(recv_pkt_header_rd_data[26]),
        .Q(\recvCurrentPacket_reg[hostIPv4Address_n_0_][26] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostIPv4Address][27] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[hostIPv4Address] ),
        .D(recv_pkt_header_rd_data[27]),
        .Q(\recvCurrentPacket_reg[hostIPv4Address_n_0_][27] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostIPv4Address][28] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[hostIPv4Address] ),
        .D(recv_pkt_header_rd_data[28]),
        .Q(\recvCurrentPacket_reg[hostIPv4Address_n_0_][28] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostIPv4Address][29] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[hostIPv4Address] ),
        .D(recv_pkt_header_rd_data[29]),
        .Q(\recvCurrentPacket_reg[hostIPv4Address_n_0_][29] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostIPv4Address][2] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[hostIPv4Address] ),
        .D(recv_pkt_header_rd_data[2]),
        .Q(\recvCurrentPacket_reg[hostIPv4Address_n_0_][2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostIPv4Address][30] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[hostIPv4Address] ),
        .D(recv_pkt_header_rd_data[30]),
        .Q(\recvCurrentPacket_reg[hostIPv4Address_n_0_][30] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostIPv4Address][31] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[hostIPv4Address] ),
        .D(recv_pkt_header_rd_data[31]),
        .Q(\recvCurrentPacket_reg[hostIPv4Address_n_0_][31] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostIPv4Address][3] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[hostIPv4Address] ),
        .D(recv_pkt_header_rd_data[3]),
        .Q(\recvCurrentPacket_reg[hostIPv4Address_n_0_][3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostIPv4Address][4] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[hostIPv4Address] ),
        .D(recv_pkt_header_rd_data[4]),
        .Q(\recvCurrentPacket_reg[hostIPv4Address_n_0_][4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostIPv4Address][5] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[hostIPv4Address] ),
        .D(recv_pkt_header_rd_data[5]),
        .Q(\recvCurrentPacket_reg[hostIPv4Address_n_0_][5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostIPv4Address][6] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[hostIPv4Address] ),
        .D(recv_pkt_header_rd_data[6]),
        .Q(\recvCurrentPacket_reg[hostIPv4Address_n_0_][6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostIPv4Address][7] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[hostIPv4Address] ),
        .D(recv_pkt_header_rd_data[7]),
        .Q(\recvCurrentPacket_reg[hostIPv4Address_n_0_][7] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostIPv4Address][8] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[hostIPv4Address] ),
        .D(recv_pkt_header_rd_data[8]),
        .Q(\recvCurrentPacket_reg[hostIPv4Address_n_0_][8] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostIPv4Address][9] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[hostIPv4Address] ),
        .D(recv_pkt_header_rd_data[9]),
        .Q(\recvCurrentPacket_reg[hostIPv4Address_n_0_][9] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostMACAddress][0] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[packetLength] ),
        .D(recv_pkt_header_rd_data[16]),
        .Q(\recvCurrentPacket_reg[hostMACAddress_n_0_][0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostMACAddress][10] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[packetLength] ),
        .D(recv_pkt_header_rd_data[26]),
        .Q(\recvCurrentPacket_reg[hostMACAddress_n_0_][10] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostMACAddress][11] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[packetLength] ),
        .D(recv_pkt_header_rd_data[27]),
        .Q(\recvCurrentPacket_reg[hostMACAddress_n_0_][11] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostMACAddress][12] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[packetLength] ),
        .D(recv_pkt_header_rd_data[28]),
        .Q(\recvCurrentPacket_reg[hostMACAddress_n_0_][12] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostMACAddress][13] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[packetLength] ),
        .D(recv_pkt_header_rd_data[29]),
        .Q(\recvCurrentPacket_reg[hostMACAddress_n_0_][13] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostMACAddress][14] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[packetLength] ),
        .D(recv_pkt_header_rd_data[30]),
        .Q(\recvCurrentPacket_reg[hostMACAddress_n_0_][14] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostMACAddress][15] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[packetLength] ),
        .D(recv_pkt_header_rd_data[31]),
        .Q(\recvCurrentPacket_reg[hostMACAddress_n_0_][15] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostMACAddress][16] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[hostMACAddress] ),
        .D(recv_pkt_header_rd_data[0]),
        .Q(\recvCurrentPacket_reg[hostMACAddress_n_0_][16] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostMACAddress][17] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[hostMACAddress] ),
        .D(recv_pkt_header_rd_data[1]),
        .Q(\recvCurrentPacket_reg[hostMACAddress_n_0_][17] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostMACAddress][18] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[hostMACAddress] ),
        .D(recv_pkt_header_rd_data[2]),
        .Q(\recvCurrentPacket_reg[hostMACAddress_n_0_][18] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostMACAddress][19] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[hostMACAddress] ),
        .D(recv_pkt_header_rd_data[3]),
        .Q(\recvCurrentPacket_reg[hostMACAddress_n_0_][19] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostMACAddress][1] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[packetLength] ),
        .D(recv_pkt_header_rd_data[17]),
        .Q(\recvCurrentPacket_reg[hostMACAddress_n_0_][1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostMACAddress][20] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[hostMACAddress] ),
        .D(recv_pkt_header_rd_data[4]),
        .Q(\recvCurrentPacket_reg[hostMACAddress_n_0_][20] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostMACAddress][21] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[hostMACAddress] ),
        .D(recv_pkt_header_rd_data[5]),
        .Q(\recvCurrentPacket_reg[hostMACAddress_n_0_][21] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostMACAddress][22] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[hostMACAddress] ),
        .D(recv_pkt_header_rd_data[6]),
        .Q(\recvCurrentPacket_reg[hostMACAddress_n_0_][22] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostMACAddress][23] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[hostMACAddress] ),
        .D(recv_pkt_header_rd_data[7]),
        .Q(\recvCurrentPacket_reg[hostMACAddress_n_0_][23] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostMACAddress][24] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[hostMACAddress] ),
        .D(recv_pkt_header_rd_data[8]),
        .Q(\recvCurrentPacket_reg[hostMACAddress_n_0_][24] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostMACAddress][25] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[hostMACAddress] ),
        .D(recv_pkt_header_rd_data[9]),
        .Q(\recvCurrentPacket_reg[hostMACAddress_n_0_][25] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostMACAddress][26] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[hostMACAddress] ),
        .D(recv_pkt_header_rd_data[10]),
        .Q(\recvCurrentPacket_reg[hostMACAddress_n_0_][26] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostMACAddress][27] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[hostMACAddress] ),
        .D(recv_pkt_header_rd_data[11]),
        .Q(\recvCurrentPacket_reg[hostMACAddress_n_0_][27] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostMACAddress][28] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[hostMACAddress] ),
        .D(recv_pkt_header_rd_data[12]),
        .Q(\recvCurrentPacket_reg[hostMACAddress_n_0_][28] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostMACAddress][29] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[hostMACAddress] ),
        .D(recv_pkt_header_rd_data[13]),
        .Q(\recvCurrentPacket_reg[hostMACAddress_n_0_][29] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostMACAddress][2] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[packetLength] ),
        .D(recv_pkt_header_rd_data[18]),
        .Q(\recvCurrentPacket_reg[hostMACAddress_n_0_][2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostMACAddress][30] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[hostMACAddress] ),
        .D(recv_pkt_header_rd_data[14]),
        .Q(\recvCurrentPacket_reg[hostMACAddress_n_0_][30] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostMACAddress][31] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[hostMACAddress] ),
        .D(recv_pkt_header_rd_data[15]),
        .Q(\recvCurrentPacket_reg[hostMACAddress_n_0_][31] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostMACAddress][32] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[hostMACAddress] ),
        .D(recv_pkt_header_rd_data[16]),
        .Q(\recvCurrentPacket_reg[hostMACAddress_n_0_][32] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostMACAddress][33] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[hostMACAddress] ),
        .D(recv_pkt_header_rd_data[17]),
        .Q(\recvCurrentPacket_reg[hostMACAddress_n_0_][33] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostMACAddress][34] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[hostMACAddress] ),
        .D(recv_pkt_header_rd_data[18]),
        .Q(\recvCurrentPacket_reg[hostMACAddress_n_0_][34] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostMACAddress][35] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[hostMACAddress] ),
        .D(recv_pkt_header_rd_data[19]),
        .Q(\recvCurrentPacket_reg[hostMACAddress_n_0_][35] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostMACAddress][36] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[hostMACAddress] ),
        .D(recv_pkt_header_rd_data[20]),
        .Q(\recvCurrentPacket_reg[hostMACAddress_n_0_][36] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostMACAddress][37] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[hostMACAddress] ),
        .D(recv_pkt_header_rd_data[21]),
        .Q(\recvCurrentPacket_reg[hostMACAddress_n_0_][37] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostMACAddress][38] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[hostMACAddress] ),
        .D(recv_pkt_header_rd_data[22]),
        .Q(\recvCurrentPacket_reg[hostMACAddress_n_0_][38] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostMACAddress][39] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[hostMACAddress] ),
        .D(recv_pkt_header_rd_data[23]),
        .Q(\recvCurrentPacket_reg[hostMACAddress_n_0_][39] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostMACAddress][3] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[packetLength] ),
        .D(recv_pkt_header_rd_data[19]),
        .Q(\recvCurrentPacket_reg[hostMACAddress_n_0_][3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostMACAddress][40] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[hostMACAddress] ),
        .D(recv_pkt_header_rd_data[24]),
        .Q(\recvCurrentPacket_reg[hostMACAddress_n_0_][40] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostMACAddress][41] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[hostMACAddress] ),
        .D(recv_pkt_header_rd_data[25]),
        .Q(\recvCurrentPacket_reg[hostMACAddress_n_0_][41] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostMACAddress][42] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[hostMACAddress] ),
        .D(recv_pkt_header_rd_data[26]),
        .Q(\recvCurrentPacket_reg[hostMACAddress_n_0_][42] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostMACAddress][43] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[hostMACAddress] ),
        .D(recv_pkt_header_rd_data[27]),
        .Q(\recvCurrentPacket_reg[hostMACAddress_n_0_][43] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostMACAddress][44] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[hostMACAddress] ),
        .D(recv_pkt_header_rd_data[28]),
        .Q(\recvCurrentPacket_reg[hostMACAddress_n_0_][44] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostMACAddress][45] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[hostMACAddress] ),
        .D(recv_pkt_header_rd_data[29]),
        .Q(\recvCurrentPacket_reg[hostMACAddress_n_0_][45] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostMACAddress][46] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[hostMACAddress] ),
        .D(recv_pkt_header_rd_data[30]),
        .Q(\recvCurrentPacket_reg[hostMACAddress_n_0_][46] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostMACAddress][47] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[hostMACAddress] ),
        .D(recv_pkt_header_rd_data[31]),
        .Q(\recvCurrentPacket_reg[hostMACAddress_n_0_][47] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostMACAddress][4] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[packetLength] ),
        .D(recv_pkt_header_rd_data[20]),
        .Q(\recvCurrentPacket_reg[hostMACAddress_n_0_][4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostMACAddress][5] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[packetLength] ),
        .D(recv_pkt_header_rd_data[21]),
        .Q(\recvCurrentPacket_reg[hostMACAddress_n_0_][5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostMACAddress][6] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[packetLength] ),
        .D(recv_pkt_header_rd_data[22]),
        .Q(\recvCurrentPacket_reg[hostMACAddress_n_0_][6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostMACAddress][7] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[packetLength] ),
        .D(recv_pkt_header_rd_data[23]),
        .Q(\recvCurrentPacket_reg[hostMACAddress_n_0_][7] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostMACAddress][8] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[packetLength] ),
        .D(recv_pkt_header_rd_data[24]),
        .Q(\recvCurrentPacket_reg[hostMACAddress_n_0_][8] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[hostMACAddress][9] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[packetLength] ),
        .D(recv_pkt_header_rd_data[25]),
        .Q(\recvCurrentPacket_reg[hostMACAddress_n_0_][9] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[packetLength][0] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[packetLength] ),
        .D(recv_pkt_header_rd_data[0]),
        .Q(DBG_recvCurrentPacketLength[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[packetLength][10] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[packetLength] ),
        .D(recv_pkt_header_rd_data[10]),
        .Q(DBG_recvCurrentPacketLength[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[packetLength][11] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[packetLength] ),
        .D(recv_pkt_header_rd_data[11]),
        .Q(DBG_recvCurrentPacketLength[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[packetLength][12] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[packetLength] ),
        .D(recv_pkt_header_rd_data[12]),
        .Q(DBG_recvCurrentPacketLength[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[packetLength][13] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[packetLength] ),
        .D(recv_pkt_header_rd_data[13]),
        .Q(DBG_recvCurrentPacketLength[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[packetLength][14] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[packetLength] ),
        .D(recv_pkt_header_rd_data[14]),
        .Q(DBG_recvCurrentPacketLength[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[packetLength][15] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[packetLength] ),
        .D(recv_pkt_header_rd_data[15]),
        .Q(DBG_recvCurrentPacketLength[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[packetLength][1] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[packetLength] ),
        .D(recv_pkt_header_rd_data[1]),
        .Q(DBG_recvCurrentPacketLength[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[packetLength][2] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[packetLength] ),
        .D(recv_pkt_header_rd_data[2]),
        .Q(DBG_recvCurrentPacketLength[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[packetLength][3] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[packetLength] ),
        .D(recv_pkt_header_rd_data[3]),
        .Q(DBG_recvCurrentPacketLength[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[packetLength][4] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[packetLength] ),
        .D(recv_pkt_header_rd_data[4]),
        .Q(DBG_recvCurrentPacketLength[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[packetLength][5] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[packetLength] ),
        .D(recv_pkt_header_rd_data[5]),
        .Q(DBG_recvCurrentPacketLength[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[packetLength][6] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[packetLength] ),
        .D(recv_pkt_header_rd_data[6]),
        .Q(DBG_recvCurrentPacketLength[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[packetLength][7] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[packetLength] ),
        .D(recv_pkt_header_rd_data[7]),
        .Q(DBG_recvCurrentPacketLength[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[packetLength][8] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[packetLength] ),
        .D(recv_pkt_header_rd_data[8]),
        .Q(DBG_recvCurrentPacketLength[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentPacket_reg[packetLength][9] 
       (.C(clk333_250),
        .CE(\recvCurrentPacket[packetLength] ),
        .D(recv_pkt_header_rd_data[9]),
        .Q(DBG_recvCurrentPacketLength[9]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h8A808A8A8A808080)) 
    \recvCurrentSubpacketBuffer[0]_i_1 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(\recvCurrentSubpacketBuffer[0]_i_2_n_0 ),
        .I2(recvParseState__0[0]),
        .I3(DBG_recvCurrentSubpacket[0]),
        .I4(DBG_recvCurrentSubpacketOffset[3]),
        .I5(recv_pkt_data_rd_data[0]),
        .O(\recvCurrentSubpacketBuffer[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \recvCurrentSubpacketBuffer[0]_i_2 
       (.I0(\recvNextSubpacketOverflowBytes_reg_n_0_[0] ),
        .I1(DBG_recvCurrentSubpacketOffset[0]),
        .I2(\recvNextSubpacketOverflowBytes_reg_n_0_[8] ),
        .I3(DBG_recvCurrentSubpacketOffset[1]),
        .I4(\recvNextSubpacketOverflowBytes_reg_n_0_[16] ),
        .O(\recvCurrentSubpacketBuffer[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8A80AAAA8A800000)) 
    \recvCurrentSubpacketBuffer[10]_i_1 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(\recvNextSubpacketOverflowBytes_reg_n_0_[10] ),
        .I2(DBG_recvCurrentSubpacketOffset[0]),
        .I3(\recvNextSubpacketOverflowBytes_reg_n_0_[18] ),
        .I4(recvParseState__0[0]),
        .I5(\recvCurrentSubpacketBuffer[10]_i_2_n_0 ),
        .O(\recvCurrentSubpacketBuffer[10]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \recvCurrentSubpacketBuffer[10]_i_2 
       (.I0(DBG_recvCurrentSubpacket[10]),
        .I1(DBG_recvCurrentSubpacketOffset[3]),
        .I2(recv_pkt_data_rd_data[2]),
        .I3(DBG_recvCurrentSubpacketOffset[0]),
        .I4(recv_pkt_data_rd_data[10]),
        .O(\recvCurrentSubpacketBuffer[10]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8A80AAAA8A800000)) 
    \recvCurrentSubpacketBuffer[11]_i_1 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(\recvNextSubpacketOverflowBytes_reg_n_0_[11] ),
        .I2(DBG_recvCurrentSubpacketOffset[0]),
        .I3(\recvNextSubpacketOverflowBytes_reg_n_0_[19] ),
        .I4(recvParseState__0[0]),
        .I5(\recvCurrentSubpacketBuffer[11]_i_2_n_0 ),
        .O(\recvCurrentSubpacketBuffer[11]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \recvCurrentSubpacketBuffer[11]_i_2 
       (.I0(DBG_recvCurrentSubpacket[11]),
        .I1(DBG_recvCurrentSubpacketOffset[3]),
        .I2(recv_pkt_data_rd_data[3]),
        .I3(DBG_recvCurrentSubpacketOffset[0]),
        .I4(recv_pkt_data_rd_data[11]),
        .O(\recvCurrentSubpacketBuffer[11]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8A80AAAA8A800000)) 
    \recvCurrentSubpacketBuffer[12]_i_1 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(\recvNextSubpacketOverflowBytes_reg_n_0_[12] ),
        .I2(DBG_recvCurrentSubpacketOffset[0]),
        .I3(\recvNextSubpacketOverflowBytes_reg_n_0_[20] ),
        .I4(recvParseState__0[0]),
        .I5(\recvCurrentSubpacketBuffer[12]_i_2_n_0 ),
        .O(\recvCurrentSubpacketBuffer[12]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \recvCurrentSubpacketBuffer[12]_i_2 
       (.I0(DBG_recvCurrentSubpacket[12]),
        .I1(DBG_recvCurrentSubpacketOffset[3]),
        .I2(recv_pkt_data_rd_data[4]),
        .I3(DBG_recvCurrentSubpacketOffset[0]),
        .I4(recv_pkt_data_rd_data[12]),
        .O(\recvCurrentSubpacketBuffer[12]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8A80AAAA8A800000)) 
    \recvCurrentSubpacketBuffer[13]_i_1 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(\recvNextSubpacketOverflowBytes_reg_n_0_[13] ),
        .I2(DBG_recvCurrentSubpacketOffset[0]),
        .I3(\recvNextSubpacketOverflowBytes_reg_n_0_[21] ),
        .I4(recvParseState__0[0]),
        .I5(\recvCurrentSubpacketBuffer[13]_i_2_n_0 ),
        .O(\recvCurrentSubpacketBuffer[13]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \recvCurrentSubpacketBuffer[13]_i_2 
       (.I0(DBG_recvCurrentSubpacket[13]),
        .I1(DBG_recvCurrentSubpacketOffset[3]),
        .I2(recv_pkt_data_rd_data[5]),
        .I3(DBG_recvCurrentSubpacketOffset[0]),
        .I4(recv_pkt_data_rd_data[13]),
        .O(\recvCurrentSubpacketBuffer[13]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8A80AAAA8A800000)) 
    \recvCurrentSubpacketBuffer[14]_i_1 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(\recvNextSubpacketOverflowBytes_reg_n_0_[14] ),
        .I2(DBG_recvCurrentSubpacketOffset[0]),
        .I3(\recvNextSubpacketOverflowBytes_reg_n_0_[22] ),
        .I4(recvParseState__0[0]),
        .I5(\recvCurrentSubpacketBuffer[14]_i_2_n_0 ),
        .O(\recvCurrentSubpacketBuffer[14]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \recvCurrentSubpacketBuffer[14]_i_2 
       (.I0(DBG_recvCurrentSubpacket[14]),
        .I1(DBG_recvCurrentSubpacketOffset[3]),
        .I2(recv_pkt_data_rd_data[6]),
        .I3(DBG_recvCurrentSubpacketOffset[0]),
        .I4(recv_pkt_data_rd_data[14]),
        .O(\recvCurrentSubpacketBuffer[14]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hEAFFEAAAAAAAAAAA)) 
    \recvCurrentSubpacketBuffer[15]_i_1 
       (.I0(\recvCurrentSubpacketBuffer[71]_i_3_n_0 ),
        .I1(\recvCurrentSubpacketBuffer[15]_i_3_n_0 ),
        .I2(recvParseState__0[0]),
        .I3(DBG_recvCurrentSubpacketOffset[1]),
        .I4(\recvCurrentSubpacketBuffer[31]_i_4_n_0 ),
        .I5(validPacketsFIFO_wr_en_i_2_n_0),
        .O(\recvCurrentSubpacketBuffer[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8A80AAAA8A800000)) 
    \recvCurrentSubpacketBuffer[15]_i_2 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(\recvNextSubpacketOverflowBytes_reg_n_0_[15] ),
        .I2(DBG_recvCurrentSubpacketOffset[0]),
        .I3(\recvNextSubpacketOverflowBytes_reg_n_0_[23] ),
        .I4(recvParseState__0[0]),
        .I5(\recvCurrentSubpacketBuffer[15]_i_4_n_0 ),
        .O(\recvCurrentSubpacketBuffer[15]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair102" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \recvCurrentSubpacketBuffer[15]_i_3 
       (.I0(DBG_recvCurrentSubpacketOffset[2]),
        .I1(DBG_recvCurrentSubpacketOffset[3]),
        .O(\recvCurrentSubpacketBuffer[15]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \recvCurrentSubpacketBuffer[15]_i_4 
       (.I0(DBG_recvCurrentSubpacket[15]),
        .I1(DBG_recvCurrentSubpacketOffset[3]),
        .I2(recv_pkt_data_rd_data[7]),
        .I3(DBG_recvCurrentSubpacketOffset[0]),
        .I4(recv_pkt_data_rd_data[15]),
        .O(\recvCurrentSubpacketBuffer[15]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h8A808A8A8A808080)) 
    \recvCurrentSubpacketBuffer[16]_i_1 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(\recvNextSubpacketOverflowBytes_reg_n_0_[16] ),
        .I2(recvParseState__0[0]),
        .I3(DBG_recvCurrentSubpacket[16]),
        .I4(DBG_recvCurrentSubpacketOffset[3]),
        .I5(\recvCurrentSubpacketBuffer[16]_i_2_n_0 ),
        .O(\recvCurrentSubpacketBuffer[16]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \recvCurrentSubpacketBuffer[16]_i_2 
       (.I0(recv_pkt_data_rd_data[0]),
        .I1(DBG_recvCurrentSubpacketOffset[1]),
        .I2(recv_pkt_data_rd_data[8]),
        .I3(DBG_recvCurrentSubpacketOffset[0]),
        .I4(recv_pkt_data_rd_data[16]),
        .O(\recvCurrentSubpacketBuffer[16]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8A808A8A8A808080)) 
    \recvCurrentSubpacketBuffer[17]_i_1 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(\recvNextSubpacketOverflowBytes_reg_n_0_[17] ),
        .I2(recvParseState__0[0]),
        .I3(DBG_recvCurrentSubpacket[17]),
        .I4(DBG_recvCurrentSubpacketOffset[3]),
        .I5(\recvCurrentSubpacketBuffer[17]_i_2_n_0 ),
        .O(\recvCurrentSubpacketBuffer[17]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \recvCurrentSubpacketBuffer[17]_i_2 
       (.I0(recv_pkt_data_rd_data[1]),
        .I1(DBG_recvCurrentSubpacketOffset[1]),
        .I2(recv_pkt_data_rd_data[9]),
        .I3(DBG_recvCurrentSubpacketOffset[0]),
        .I4(recv_pkt_data_rd_data[17]),
        .O(\recvCurrentSubpacketBuffer[17]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8A808A8A8A808080)) 
    \recvCurrentSubpacketBuffer[18]_i_1 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(\recvNextSubpacketOverflowBytes_reg_n_0_[18] ),
        .I2(recvParseState__0[0]),
        .I3(DBG_recvCurrentSubpacket[18]),
        .I4(DBG_recvCurrentSubpacketOffset[3]),
        .I5(\recvCurrentSubpacketBuffer[18]_i_2_n_0 ),
        .O(\recvCurrentSubpacketBuffer[18]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \recvCurrentSubpacketBuffer[18]_i_2 
       (.I0(recv_pkt_data_rd_data[2]),
        .I1(DBG_recvCurrentSubpacketOffset[1]),
        .I2(recv_pkt_data_rd_data[10]),
        .I3(DBG_recvCurrentSubpacketOffset[0]),
        .I4(recv_pkt_data_rd_data[18]),
        .O(\recvCurrentSubpacketBuffer[18]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8A808A8A8A808080)) 
    \recvCurrentSubpacketBuffer[19]_i_1 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(\recvNextSubpacketOverflowBytes_reg_n_0_[19] ),
        .I2(recvParseState__0[0]),
        .I3(DBG_recvCurrentSubpacket[19]),
        .I4(DBG_recvCurrentSubpacketOffset[3]),
        .I5(\recvCurrentSubpacketBuffer[19]_i_2_n_0 ),
        .O(\recvCurrentSubpacketBuffer[19]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \recvCurrentSubpacketBuffer[19]_i_2 
       (.I0(recv_pkt_data_rd_data[3]),
        .I1(DBG_recvCurrentSubpacketOffset[1]),
        .I2(recv_pkt_data_rd_data[11]),
        .I3(DBG_recvCurrentSubpacketOffset[0]),
        .I4(recv_pkt_data_rd_data[19]),
        .O(\recvCurrentSubpacketBuffer[19]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8A808A8A8A808080)) 
    \recvCurrentSubpacketBuffer[1]_i_1 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(\recvCurrentSubpacketBuffer[1]_i_2_n_0 ),
        .I2(recvParseState__0[0]),
        .I3(DBG_recvCurrentSubpacket[1]),
        .I4(DBG_recvCurrentSubpacketOffset[3]),
        .I5(recv_pkt_data_rd_data[1]),
        .O(\recvCurrentSubpacketBuffer[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \recvCurrentSubpacketBuffer[1]_i_2 
       (.I0(\recvNextSubpacketOverflowBytes_reg_n_0_[1] ),
        .I1(DBG_recvCurrentSubpacketOffset[0]),
        .I2(\recvNextSubpacketOverflowBytes_reg_n_0_[9] ),
        .I3(DBG_recvCurrentSubpacketOffset[1]),
        .I4(\recvNextSubpacketOverflowBytes_reg_n_0_[17] ),
        .O(\recvCurrentSubpacketBuffer[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8A808A8A8A808080)) 
    \recvCurrentSubpacketBuffer[20]_i_1 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(\recvNextSubpacketOverflowBytes_reg_n_0_[20] ),
        .I2(recvParseState__0[0]),
        .I3(DBG_recvCurrentSubpacket[20]),
        .I4(DBG_recvCurrentSubpacketOffset[3]),
        .I5(\recvCurrentSubpacketBuffer[20]_i_2_n_0 ),
        .O(\recvCurrentSubpacketBuffer[20]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \recvCurrentSubpacketBuffer[20]_i_2 
       (.I0(recv_pkt_data_rd_data[4]),
        .I1(DBG_recvCurrentSubpacketOffset[1]),
        .I2(recv_pkt_data_rd_data[12]),
        .I3(DBG_recvCurrentSubpacketOffset[0]),
        .I4(recv_pkt_data_rd_data[20]),
        .O(\recvCurrentSubpacketBuffer[20]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8A808A8A8A808080)) 
    \recvCurrentSubpacketBuffer[21]_i_1 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(\recvNextSubpacketOverflowBytes_reg_n_0_[21] ),
        .I2(recvParseState__0[0]),
        .I3(DBG_recvCurrentSubpacket[21]),
        .I4(DBG_recvCurrentSubpacketOffset[3]),
        .I5(\recvCurrentSubpacketBuffer[21]_i_2_n_0 ),
        .O(\recvCurrentSubpacketBuffer[21]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \recvCurrentSubpacketBuffer[21]_i_2 
       (.I0(recv_pkt_data_rd_data[5]),
        .I1(DBG_recvCurrentSubpacketOffset[1]),
        .I2(recv_pkt_data_rd_data[13]),
        .I3(DBG_recvCurrentSubpacketOffset[0]),
        .I4(recv_pkt_data_rd_data[21]),
        .O(\recvCurrentSubpacketBuffer[21]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8A808A8A8A808080)) 
    \recvCurrentSubpacketBuffer[22]_i_1 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(\recvNextSubpacketOverflowBytes_reg_n_0_[22] ),
        .I2(recvParseState__0[0]),
        .I3(DBG_recvCurrentSubpacket[22]),
        .I4(DBG_recvCurrentSubpacketOffset[3]),
        .I5(\recvCurrentSubpacketBuffer[22]_i_2_n_0 ),
        .O(\recvCurrentSubpacketBuffer[22]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \recvCurrentSubpacketBuffer[22]_i_2 
       (.I0(recv_pkt_data_rd_data[6]),
        .I1(DBG_recvCurrentSubpacketOffset[1]),
        .I2(recv_pkt_data_rd_data[14]),
        .I3(DBG_recvCurrentSubpacketOffset[0]),
        .I4(recv_pkt_data_rd_data[22]),
        .O(\recvCurrentSubpacketBuffer[22]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hEEAEEEEEAAAAAAAA)) 
    \recvCurrentSubpacketBuffer[23]_i_1 
       (.I0(\recvCurrentSubpacketBuffer[71]_i_3_n_0 ),
        .I1(validPacketsFIFO_wr_en_i_2_n_0),
        .I2(DBG_recvCurrentSubpacketOffset[0]),
        .I3(recvParseState__0[0]),
        .I4(DBG_recvCurrentSubpacketOffset[1]),
        .I5(\recvCurrentSubpacketBuffer[23]_i_3_n_0 ),
        .O(\recvCurrentSubpacketBuffer[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8A808A8A8A808080)) 
    \recvCurrentSubpacketBuffer[23]_i_2 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(\recvNextSubpacketOverflowBytes_reg_n_0_[23] ),
        .I2(recvParseState__0[0]),
        .I3(DBG_recvCurrentSubpacket[23]),
        .I4(DBG_recvCurrentSubpacketOffset[3]),
        .I5(\recvCurrentSubpacketBuffer[23]_i_4_n_0 ),
        .O(\recvCurrentSubpacketBuffer[23]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAEAAAAAAAAA)) 
    \recvCurrentSubpacketBuffer[23]_i_3 
       (.I0(\recvCurrentSubpacketBuffer[31]_i_4_n_0 ),
        .I1(DBG_recvCurrentSubpacketOffset[1]),
        .I2(recvParseState__0[0]),
        .I3(DBG_recvCurrentSubpacketOffset[2]),
        .I4(DBG_recvCurrentSubpacketOffset[3]),
        .I5(DBG_recvCurrentSubpacketOffset[0]),
        .O(\recvCurrentSubpacketBuffer[23]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \recvCurrentSubpacketBuffer[23]_i_4 
       (.I0(recv_pkt_data_rd_data[7]),
        .I1(DBG_recvCurrentSubpacketOffset[1]),
        .I2(recv_pkt_data_rd_data[15]),
        .I3(DBG_recvCurrentSubpacketOffset[0]),
        .I4(recv_pkt_data_rd_data[23]),
        .O(\recvCurrentSubpacketBuffer[23]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair146" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \recvCurrentSubpacketBuffer[24]_i_1 
       (.I0(DBG_recvCurrentSubpacket[24]),
        .I1(DBG_recvCurrentSubpacketOffset[3]),
        .I2(\recvCurrentSubpacketBuffer[56]_i_2_n_0 ),
        .O(\recvCurrentSubpacketBuffer[24]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair146" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \recvCurrentSubpacketBuffer[25]_i_1 
       (.I0(DBG_recvCurrentSubpacket[25]),
        .I1(DBG_recvCurrentSubpacketOffset[3]),
        .I2(\recvCurrentSubpacketBuffer[57]_i_2_n_0 ),
        .O(\recvCurrentSubpacketBuffer[25]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair144" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \recvCurrentSubpacketBuffer[26]_i_1 
       (.I0(DBG_recvCurrentSubpacket[26]),
        .I1(DBG_recvCurrentSubpacketOffset[3]),
        .I2(\recvCurrentSubpacketBuffer[58]_i_2_n_0 ),
        .O(\recvCurrentSubpacketBuffer[26]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair144" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \recvCurrentSubpacketBuffer[27]_i_1 
       (.I0(DBG_recvCurrentSubpacket[27]),
        .I1(DBG_recvCurrentSubpacketOffset[3]),
        .I2(\recvCurrentSubpacketBuffer[59]_i_2_n_0 ),
        .O(\recvCurrentSubpacketBuffer[27]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair142" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \recvCurrentSubpacketBuffer[28]_i_1 
       (.I0(DBG_recvCurrentSubpacket[28]),
        .I1(DBG_recvCurrentSubpacketOffset[3]),
        .I2(\recvCurrentSubpacketBuffer[60]_i_2_n_0 ),
        .O(\recvCurrentSubpacketBuffer[28]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair142" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \recvCurrentSubpacketBuffer[29]_i_1 
       (.I0(DBG_recvCurrentSubpacket[29]),
        .I1(DBG_recvCurrentSubpacketOffset[3]),
        .I2(\recvCurrentSubpacketBuffer[61]_i_2_n_0 ),
        .O(\recvCurrentSubpacketBuffer[29]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8A808A8A8A808080)) 
    \recvCurrentSubpacketBuffer[2]_i_1 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(\recvCurrentSubpacketBuffer[2]_i_2_n_0 ),
        .I2(recvParseState__0[0]),
        .I3(DBG_recvCurrentSubpacket[2]),
        .I4(DBG_recvCurrentSubpacketOffset[3]),
        .I5(recv_pkt_data_rd_data[2]),
        .O(\recvCurrentSubpacketBuffer[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \recvCurrentSubpacketBuffer[2]_i_2 
       (.I0(\recvNextSubpacketOverflowBytes_reg_n_0_[2] ),
        .I1(DBG_recvCurrentSubpacketOffset[0]),
        .I2(\recvNextSubpacketOverflowBytes_reg_n_0_[10] ),
        .I3(DBG_recvCurrentSubpacketOffset[1]),
        .I4(\recvNextSubpacketOverflowBytes_reg_n_0_[18] ),
        .O(\recvCurrentSubpacketBuffer[2]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair140" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \recvCurrentSubpacketBuffer[30]_i_1 
       (.I0(DBG_recvCurrentSubpacket[30]),
        .I1(DBG_recvCurrentSubpacketOffset[3]),
        .I2(\recvCurrentSubpacketBuffer[62]_i_2_n_0 ),
        .O(\recvCurrentSubpacketBuffer[30]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h4444544444444444)) 
    \recvCurrentSubpacketBuffer[31]_i_1 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(\currentState[0]_i_1_n_0 ),
        .I2(\recvParseState[2]__0_i_3_n_0 ),
        .I3(recvParseState__0[2]),
        .I4(recvParseState__0[1]),
        .I5(\recvCurrentSubpacketBuffer[31]_i_4_n_0 ),
        .O(\recvCurrentSubpacketBuffer[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h4444F44444444444)) 
    \recvCurrentSubpacketBuffer[31]_i_2 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(\currentState[0]_i_1_n_0 ),
        .I2(\recvParseState[2]__0_i_3_n_0 ),
        .I3(recvParseState__0[2]),
        .I4(recvParseState__0[1]),
        .I5(\recvCurrentSubpacketBuffer[31]_i_4_n_0 ),
        .O(\recvCurrentSubpacketBuffer[31]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair140" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \recvCurrentSubpacketBuffer[31]_i_3 
       (.I0(DBG_recvCurrentSubpacket[31]),
        .I1(DBG_recvCurrentSubpacketOffset[3]),
        .I2(\recvCurrentSubpacketBuffer[63]_i_4_n_0 ),
        .O(\recvCurrentSubpacketBuffer[31]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT5 #(
    .INIT(32'h00000010)) 
    \recvCurrentSubpacketBuffer[31]_i_4 
       (.I0(DBG_recvCurrentSubpacketOffset[3]),
        .I1(DBG_recvCurrentSubpacketOffset[2]),
        .I2(\recvParseState[2]__0_i_7_n_0 ),
        .I3(recvParseState__0[0]),
        .I4(recv_pkt_data_empty),
        .O(\recvCurrentSubpacketBuffer[31]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h8A808A808A8A8080)) 
    \recvCurrentSubpacketBuffer[32]_i_1 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(DBG_recvCurrentSubpacket[32]),
        .I2(DBG_recvCurrentSubpacketOffset[3]),
        .I3(\recvCurrentSubpacketBuffer[64]_i_2_n_0 ),
        .I4(\recvCurrentSubpacketBuffer[48]_i_2_n_0 ),
        .I5(DBG_recvCurrentSubpacketOffset[1]),
        .O(\recvCurrentSubpacketBuffer[32]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8A808A808A8A8080)) 
    \recvCurrentSubpacketBuffer[33]_i_1 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(DBG_recvCurrentSubpacket[33]),
        .I2(DBG_recvCurrentSubpacketOffset[3]),
        .I3(\recvCurrentSubpacketBuffer[65]_i_2_n_0 ),
        .I4(\recvCurrentSubpacketBuffer[49]_i_2_n_0 ),
        .I5(DBG_recvCurrentSubpacketOffset[1]),
        .O(\recvCurrentSubpacketBuffer[33]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8A808A808A8A8080)) 
    \recvCurrentSubpacketBuffer[34]_i_1 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(DBG_recvCurrentSubpacket[34]),
        .I2(DBG_recvCurrentSubpacketOffset[3]),
        .I3(\recvCurrentSubpacketBuffer[66]_i_2_n_0 ),
        .I4(\recvCurrentSubpacketBuffer[50]_i_2_n_0 ),
        .I5(DBG_recvCurrentSubpacketOffset[1]),
        .O(\recvCurrentSubpacketBuffer[34]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8A808A808A8A8080)) 
    \recvCurrentSubpacketBuffer[35]_i_1 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(DBG_recvCurrentSubpacket[35]),
        .I2(DBG_recvCurrentSubpacketOffset[3]),
        .I3(\recvCurrentSubpacketBuffer[67]_i_2_n_0 ),
        .I4(\recvCurrentSubpacketBuffer[51]_i_2_n_0 ),
        .I5(DBG_recvCurrentSubpacketOffset[1]),
        .O(\recvCurrentSubpacketBuffer[35]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8A808A808A8A8080)) 
    \recvCurrentSubpacketBuffer[36]_i_1 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(DBG_recvCurrentSubpacket[36]),
        .I2(DBG_recvCurrentSubpacketOffset[3]),
        .I3(\recvCurrentSubpacketBuffer[68]_i_2_n_0 ),
        .I4(\recvCurrentSubpacketBuffer[52]_i_2_n_0 ),
        .I5(DBG_recvCurrentSubpacketOffset[1]),
        .O(\recvCurrentSubpacketBuffer[36]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8A808A808A8A8080)) 
    \recvCurrentSubpacketBuffer[37]_i_1 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(DBG_recvCurrentSubpacket[37]),
        .I2(DBG_recvCurrentSubpacketOffset[3]),
        .I3(\recvCurrentSubpacketBuffer[69]_i_2_n_0 ),
        .I4(\recvCurrentSubpacketBuffer[53]_i_2_n_0 ),
        .I5(DBG_recvCurrentSubpacketOffset[1]),
        .O(\recvCurrentSubpacketBuffer[37]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8A808A808A8A8080)) 
    \recvCurrentSubpacketBuffer[38]_i_1 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(DBG_recvCurrentSubpacket[38]),
        .I2(DBG_recvCurrentSubpacketOffset[3]),
        .I3(\recvCurrentSubpacketBuffer[70]_i_2_n_0 ),
        .I4(\recvCurrentSubpacketBuffer[54]_i_2_n_0 ),
        .I5(DBG_recvCurrentSubpacketOffset[1]),
        .O(\recvCurrentSubpacketBuffer[38]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAABAAABAAABABAAA)) 
    \recvCurrentSubpacketBuffer[39]_i_1 
       (.I0(\recvCurrentSubpacketBuffer[71]_i_3_n_0 ),
        .I1(DBG_recvCurrentSubpacketOffset[3]),
        .I2(\recvCurrentSubpacketOffset[3]_i_3_n_0 ),
        .I3(DBG_recvCurrentSubpacketOffset[2]),
        .I4(DBG_recvCurrentSubpacketOffset[1]),
        .I5(DBG_recvCurrentSubpacketOffset[0]),
        .O(\recvCurrentSubpacketBuffer[39]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8A808A808A8A8080)) 
    \recvCurrentSubpacketBuffer[39]_i_2 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(DBG_recvCurrentSubpacket[39]),
        .I2(DBG_recvCurrentSubpacketOffset[3]),
        .I3(\recvCurrentSubpacketBuffer[71]_i_4_n_0 ),
        .I4(\recvCurrentSubpacketBuffer[55]_i_3_n_0 ),
        .I5(DBG_recvCurrentSubpacketOffset[1]),
        .O(\recvCurrentSubpacketBuffer[39]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8A808A8A8A808080)) 
    \recvCurrentSubpacketBuffer[3]_i_1 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(\recvCurrentSubpacketBuffer[3]_i_2_n_0 ),
        .I2(recvParseState__0[0]),
        .I3(DBG_recvCurrentSubpacket[3]),
        .I4(DBG_recvCurrentSubpacketOffset[3]),
        .I5(recv_pkt_data_rd_data[3]),
        .O(\recvCurrentSubpacketBuffer[3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \recvCurrentSubpacketBuffer[3]_i_2 
       (.I0(\recvNextSubpacketOverflowBytes_reg_n_0_[3] ),
        .I1(DBG_recvCurrentSubpacketOffset[0]),
        .I2(\recvNextSubpacketOverflowBytes_reg_n_0_[11] ),
        .I3(DBG_recvCurrentSubpacketOffset[1]),
        .I4(\recvNextSubpacketOverflowBytes_reg_n_0_[19] ),
        .O(\recvCurrentSubpacketBuffer[3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair155" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \recvCurrentSubpacketBuffer[40]_i_1 
       (.I0(DBG_recvCurrentSubpacket[40]),
        .I1(DBG_recvCurrentSubpacketOffset[3]),
        .I2(\recvCurrentSubpacketBuffer[40]_i_2_n_0 ),
        .O(\recvCurrentSubpacketBuffer[40]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \recvCurrentSubpacketBuffer[40]_i_2 
       (.I0(recv_pkt_data_rd_data[0]),
        .I1(recv_pkt_data_rd_data[16]),
        .I2(DBG_recvCurrentSubpacketOffset[0]),
        .I3(recv_pkt_data_rd_data[8]),
        .I4(DBG_recvCurrentSubpacketOffset[2]),
        .I5(recv_pkt_data_rd_data[24]),
        .O(\recvCurrentSubpacketBuffer[40]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair155" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \recvCurrentSubpacketBuffer[41]_i_1 
       (.I0(DBG_recvCurrentSubpacket[41]),
        .I1(DBG_recvCurrentSubpacketOffset[3]),
        .I2(\recvCurrentSubpacketBuffer[41]_i_2_n_0 ),
        .O(\recvCurrentSubpacketBuffer[41]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \recvCurrentSubpacketBuffer[41]_i_2 
       (.I0(recv_pkt_data_rd_data[1]),
        .I1(recv_pkt_data_rd_data[17]),
        .I2(DBG_recvCurrentSubpacketOffset[0]),
        .I3(recv_pkt_data_rd_data[9]),
        .I4(DBG_recvCurrentSubpacketOffset[2]),
        .I5(recv_pkt_data_rd_data[25]),
        .O(\recvCurrentSubpacketBuffer[41]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair154" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \recvCurrentSubpacketBuffer[42]_i_1 
       (.I0(DBG_recvCurrentSubpacket[42]),
        .I1(DBG_recvCurrentSubpacketOffset[3]),
        .I2(\recvCurrentSubpacketBuffer[42]_i_2_n_0 ),
        .O(\recvCurrentSubpacketBuffer[42]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \recvCurrentSubpacketBuffer[42]_i_2 
       (.I0(recv_pkt_data_rd_data[2]),
        .I1(recv_pkt_data_rd_data[18]),
        .I2(DBG_recvCurrentSubpacketOffset[0]),
        .I3(recv_pkt_data_rd_data[10]),
        .I4(DBG_recvCurrentSubpacketOffset[2]),
        .I5(recv_pkt_data_rd_data[26]),
        .O(\recvCurrentSubpacketBuffer[42]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair154" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \recvCurrentSubpacketBuffer[43]_i_1 
       (.I0(DBG_recvCurrentSubpacket[43]),
        .I1(DBG_recvCurrentSubpacketOffset[3]),
        .I2(\recvCurrentSubpacketBuffer[43]_i_2_n_0 ),
        .O(\recvCurrentSubpacketBuffer[43]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \recvCurrentSubpacketBuffer[43]_i_2 
       (.I0(recv_pkt_data_rd_data[3]),
        .I1(recv_pkt_data_rd_data[19]),
        .I2(DBG_recvCurrentSubpacketOffset[0]),
        .I3(recv_pkt_data_rd_data[11]),
        .I4(DBG_recvCurrentSubpacketOffset[2]),
        .I5(recv_pkt_data_rd_data[27]),
        .O(\recvCurrentSubpacketBuffer[43]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair153" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \recvCurrentSubpacketBuffer[44]_i_1 
       (.I0(DBG_recvCurrentSubpacket[44]),
        .I1(DBG_recvCurrentSubpacketOffset[3]),
        .I2(\recvCurrentSubpacketBuffer[44]_i_2_n_0 ),
        .O(\recvCurrentSubpacketBuffer[44]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \recvCurrentSubpacketBuffer[44]_i_2 
       (.I0(recv_pkt_data_rd_data[4]),
        .I1(recv_pkt_data_rd_data[20]),
        .I2(DBG_recvCurrentSubpacketOffset[0]),
        .I3(recv_pkt_data_rd_data[12]),
        .I4(DBG_recvCurrentSubpacketOffset[2]),
        .I5(recv_pkt_data_rd_data[28]),
        .O(\recvCurrentSubpacketBuffer[44]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair153" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \recvCurrentSubpacketBuffer[45]_i_1 
       (.I0(DBG_recvCurrentSubpacket[45]),
        .I1(DBG_recvCurrentSubpacketOffset[3]),
        .I2(\recvCurrentSubpacketBuffer[45]_i_2_n_0 ),
        .O(\recvCurrentSubpacketBuffer[45]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \recvCurrentSubpacketBuffer[45]_i_2 
       (.I0(recv_pkt_data_rd_data[5]),
        .I1(recv_pkt_data_rd_data[21]),
        .I2(DBG_recvCurrentSubpacketOffset[0]),
        .I3(recv_pkt_data_rd_data[13]),
        .I4(DBG_recvCurrentSubpacketOffset[2]),
        .I5(recv_pkt_data_rd_data[29]),
        .O(\recvCurrentSubpacketBuffer[45]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair152" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \recvCurrentSubpacketBuffer[46]_i_1 
       (.I0(DBG_recvCurrentSubpacket[46]),
        .I1(DBG_recvCurrentSubpacketOffset[3]),
        .I2(\recvCurrentSubpacketBuffer[46]_i_2_n_0 ),
        .O(\recvCurrentSubpacketBuffer[46]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \recvCurrentSubpacketBuffer[46]_i_2 
       (.I0(recv_pkt_data_rd_data[6]),
        .I1(recv_pkt_data_rd_data[22]),
        .I2(DBG_recvCurrentSubpacketOffset[0]),
        .I3(recv_pkt_data_rd_data[14]),
        .I4(DBG_recvCurrentSubpacketOffset[2]),
        .I5(recv_pkt_data_rd_data[30]),
        .O(\recvCurrentSubpacketBuffer[46]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h4444454445444444)) 
    \recvCurrentSubpacketBuffer[47]_i_1 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(\currentState[0]_i_1_n_0 ),
        .I2(DBG_recvCurrentSubpacketOffset[3]),
        .I3(\recvCurrentSubpacketOffset[3]_i_3_n_0 ),
        .I4(DBG_recvCurrentSubpacketOffset[2]),
        .I5(DBG_recvCurrentSubpacketOffset[1]),
        .O(\recvCurrentSubpacketBuffer[47]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h44444F444F444444)) 
    \recvCurrentSubpacketBuffer[47]_i_2 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(\currentState[0]_i_1_n_0 ),
        .I2(DBG_recvCurrentSubpacketOffset[3]),
        .I3(\recvCurrentSubpacketOffset[3]_i_3_n_0 ),
        .I4(DBG_recvCurrentSubpacketOffset[2]),
        .I5(DBG_recvCurrentSubpacketOffset[1]),
        .O(\recvCurrentSubpacketBuffer[47]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair152" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \recvCurrentSubpacketBuffer[47]_i_3 
       (.I0(DBG_recvCurrentSubpacket[47]),
        .I1(DBG_recvCurrentSubpacketOffset[3]),
        .I2(\recvCurrentSubpacketBuffer[47]_i_4_n_0 ),
        .O(\recvCurrentSubpacketBuffer[47]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \recvCurrentSubpacketBuffer[47]_i_4 
       (.I0(recv_pkt_data_rd_data[7]),
        .I1(recv_pkt_data_rd_data[23]),
        .I2(DBG_recvCurrentSubpacketOffset[0]),
        .I3(recv_pkt_data_rd_data[15]),
        .I4(DBG_recvCurrentSubpacketOffset[2]),
        .I5(recv_pkt_data_rd_data[31]),
        .O(\recvCurrentSubpacketBuffer[47]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h8A8A80808A808A80)) 
    \recvCurrentSubpacketBuffer[48]_i_1 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(DBG_recvCurrentSubpacket[48]),
        .I2(DBG_recvCurrentSubpacketOffset[3]),
        .I3(\recvCurrentSubpacketBuffer[64]_i_2_n_0 ),
        .I4(\recvCurrentSubpacketBuffer[48]_i_2_n_0 ),
        .I5(DBG_recvCurrentSubpacketOffset[1]),
        .O(\recvCurrentSubpacketBuffer[48]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair151" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \recvCurrentSubpacketBuffer[48]_i_2 
       (.I0(recv_pkt_data_rd_data[0]),
        .I1(DBG_recvCurrentSubpacketOffset[2]),
        .I2(recv_pkt_data_rd_data[24]),
        .O(\recvCurrentSubpacketBuffer[48]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8A8A80808A808A80)) 
    \recvCurrentSubpacketBuffer[49]_i_1 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(DBG_recvCurrentSubpacket[49]),
        .I2(DBG_recvCurrentSubpacketOffset[3]),
        .I3(\recvCurrentSubpacketBuffer[65]_i_2_n_0 ),
        .I4(\recvCurrentSubpacketBuffer[49]_i_2_n_0 ),
        .I5(DBG_recvCurrentSubpacketOffset[1]),
        .O(\recvCurrentSubpacketBuffer[49]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair151" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \recvCurrentSubpacketBuffer[49]_i_2 
       (.I0(recv_pkt_data_rd_data[1]),
        .I1(DBG_recvCurrentSubpacketOffset[2]),
        .I2(recv_pkt_data_rd_data[25]),
        .O(\recvCurrentSubpacketBuffer[49]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8A808A8A8A808080)) 
    \recvCurrentSubpacketBuffer[4]_i_1 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(\recvCurrentSubpacketBuffer[4]_i_2_n_0 ),
        .I2(recvParseState__0[0]),
        .I3(DBG_recvCurrentSubpacket[4]),
        .I4(DBG_recvCurrentSubpacketOffset[3]),
        .I5(recv_pkt_data_rd_data[4]),
        .O(\recvCurrentSubpacketBuffer[4]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \recvCurrentSubpacketBuffer[4]_i_2 
       (.I0(\recvNextSubpacketOverflowBytes_reg_n_0_[4] ),
        .I1(DBG_recvCurrentSubpacketOffset[0]),
        .I2(\recvNextSubpacketOverflowBytes_reg_n_0_[12] ),
        .I3(DBG_recvCurrentSubpacketOffset[1]),
        .I4(\recvNextSubpacketOverflowBytes_reg_n_0_[20] ),
        .O(\recvCurrentSubpacketBuffer[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8A8A80808A808A80)) 
    \recvCurrentSubpacketBuffer[50]_i_1 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(DBG_recvCurrentSubpacket[50]),
        .I2(DBG_recvCurrentSubpacketOffset[3]),
        .I3(\recvCurrentSubpacketBuffer[66]_i_2_n_0 ),
        .I4(\recvCurrentSubpacketBuffer[50]_i_2_n_0 ),
        .I5(DBG_recvCurrentSubpacketOffset[1]),
        .O(\recvCurrentSubpacketBuffer[50]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair150" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \recvCurrentSubpacketBuffer[50]_i_2 
       (.I0(recv_pkt_data_rd_data[2]),
        .I1(DBG_recvCurrentSubpacketOffset[2]),
        .I2(recv_pkt_data_rd_data[26]),
        .O(\recvCurrentSubpacketBuffer[50]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8A8A80808A808A80)) 
    \recvCurrentSubpacketBuffer[51]_i_1 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(DBG_recvCurrentSubpacket[51]),
        .I2(DBG_recvCurrentSubpacketOffset[3]),
        .I3(\recvCurrentSubpacketBuffer[67]_i_2_n_0 ),
        .I4(\recvCurrentSubpacketBuffer[51]_i_2_n_0 ),
        .I5(DBG_recvCurrentSubpacketOffset[1]),
        .O(\recvCurrentSubpacketBuffer[51]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair150" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \recvCurrentSubpacketBuffer[51]_i_2 
       (.I0(recv_pkt_data_rd_data[3]),
        .I1(DBG_recvCurrentSubpacketOffset[2]),
        .I2(recv_pkt_data_rd_data[27]),
        .O(\recvCurrentSubpacketBuffer[51]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8A8A80808A808A80)) 
    \recvCurrentSubpacketBuffer[52]_i_1 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(DBG_recvCurrentSubpacket[52]),
        .I2(DBG_recvCurrentSubpacketOffset[3]),
        .I3(\recvCurrentSubpacketBuffer[68]_i_2_n_0 ),
        .I4(\recvCurrentSubpacketBuffer[52]_i_2_n_0 ),
        .I5(DBG_recvCurrentSubpacketOffset[1]),
        .O(\recvCurrentSubpacketBuffer[52]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair149" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \recvCurrentSubpacketBuffer[52]_i_2 
       (.I0(recv_pkt_data_rd_data[4]),
        .I1(DBG_recvCurrentSubpacketOffset[2]),
        .I2(recv_pkt_data_rd_data[28]),
        .O(\recvCurrentSubpacketBuffer[52]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8A8A80808A808A80)) 
    \recvCurrentSubpacketBuffer[53]_i_1 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(DBG_recvCurrentSubpacket[53]),
        .I2(DBG_recvCurrentSubpacketOffset[3]),
        .I3(\recvCurrentSubpacketBuffer[69]_i_2_n_0 ),
        .I4(\recvCurrentSubpacketBuffer[53]_i_2_n_0 ),
        .I5(DBG_recvCurrentSubpacketOffset[1]),
        .O(\recvCurrentSubpacketBuffer[53]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair149" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \recvCurrentSubpacketBuffer[53]_i_2 
       (.I0(recv_pkt_data_rd_data[5]),
        .I1(DBG_recvCurrentSubpacketOffset[2]),
        .I2(recv_pkt_data_rd_data[29]),
        .O(\recvCurrentSubpacketBuffer[53]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8A8A80808A808A80)) 
    \recvCurrentSubpacketBuffer[54]_i_1 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(DBG_recvCurrentSubpacket[54]),
        .I2(DBG_recvCurrentSubpacketOffset[3]),
        .I3(\recvCurrentSubpacketBuffer[70]_i_2_n_0 ),
        .I4(\recvCurrentSubpacketBuffer[54]_i_2_n_0 ),
        .I5(DBG_recvCurrentSubpacketOffset[1]),
        .O(\recvCurrentSubpacketBuffer[54]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair148" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \recvCurrentSubpacketBuffer[54]_i_2 
       (.I0(recv_pkt_data_rd_data[6]),
        .I1(DBG_recvCurrentSubpacketOffset[2]),
        .I2(recv_pkt_data_rd_data[30]),
        .O(\recvCurrentSubpacketBuffer[54]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAABABABABAAAAAAA)) 
    \recvCurrentSubpacketBuffer[55]_i_1 
       (.I0(\recvCurrentSubpacketBuffer[71]_i_3_n_0 ),
        .I1(DBG_recvCurrentSubpacketOffset[3]),
        .I2(\recvCurrentSubpacketOffset[3]_i_3_n_0 ),
        .I3(DBG_recvCurrentSubpacketOffset[1]),
        .I4(DBG_recvCurrentSubpacketOffset[0]),
        .I5(DBG_recvCurrentSubpacketOffset[2]),
        .O(\recvCurrentSubpacketBuffer[55]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8A8A80808A808A80)) 
    \recvCurrentSubpacketBuffer[55]_i_2 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(DBG_recvCurrentSubpacket[55]),
        .I2(DBG_recvCurrentSubpacketOffset[3]),
        .I3(\recvCurrentSubpacketBuffer[71]_i_4_n_0 ),
        .I4(\recvCurrentSubpacketBuffer[55]_i_3_n_0 ),
        .I5(DBG_recvCurrentSubpacketOffset[1]),
        .O(\recvCurrentSubpacketBuffer[55]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair148" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \recvCurrentSubpacketBuffer[55]_i_3 
       (.I0(recv_pkt_data_rd_data[7]),
        .I1(DBG_recvCurrentSubpacketOffset[2]),
        .I2(recv_pkt_data_rd_data[31]),
        .O(\recvCurrentSubpacketBuffer[55]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair147" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \recvCurrentSubpacketBuffer[56]_i_1 
       (.I0(DBG_recvCurrentSubpacket[56]),
        .I1(DBG_recvCurrentSubpacketOffset[3]),
        .I2(\recvCurrentSubpacketBuffer[56]_i_2_n_0 ),
        .O(\recvCurrentSubpacketBuffer[56]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \recvCurrentSubpacketBuffer[56]_i_2 
       (.I0(recv_pkt_data_rd_data[0]),
        .I1(recv_pkt_data_rd_data[16]),
        .I2(DBG_recvCurrentSubpacketOffset[0]),
        .I3(recv_pkt_data_rd_data[8]),
        .I4(DBG_recvCurrentSubpacketOffset[1]),
        .I5(recv_pkt_data_rd_data[24]),
        .O(\recvCurrentSubpacketBuffer[56]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair147" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \recvCurrentSubpacketBuffer[57]_i_1 
       (.I0(DBG_recvCurrentSubpacket[57]),
        .I1(DBG_recvCurrentSubpacketOffset[3]),
        .I2(\recvCurrentSubpacketBuffer[57]_i_2_n_0 ),
        .O(\recvCurrentSubpacketBuffer[57]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \recvCurrentSubpacketBuffer[57]_i_2 
       (.I0(recv_pkt_data_rd_data[1]),
        .I1(recv_pkt_data_rd_data[17]),
        .I2(DBG_recvCurrentSubpacketOffset[0]),
        .I3(recv_pkt_data_rd_data[9]),
        .I4(DBG_recvCurrentSubpacketOffset[1]),
        .I5(recv_pkt_data_rd_data[25]),
        .O(\recvCurrentSubpacketBuffer[57]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair145" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \recvCurrentSubpacketBuffer[58]_i_1 
       (.I0(DBG_recvCurrentSubpacket[58]),
        .I1(DBG_recvCurrentSubpacketOffset[3]),
        .I2(\recvCurrentSubpacketBuffer[58]_i_2_n_0 ),
        .O(\recvCurrentSubpacketBuffer[58]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \recvCurrentSubpacketBuffer[58]_i_2 
       (.I0(recv_pkt_data_rd_data[2]),
        .I1(recv_pkt_data_rd_data[18]),
        .I2(DBG_recvCurrentSubpacketOffset[0]),
        .I3(recv_pkt_data_rd_data[10]),
        .I4(DBG_recvCurrentSubpacketOffset[1]),
        .I5(recv_pkt_data_rd_data[26]),
        .O(\recvCurrentSubpacketBuffer[58]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair145" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \recvCurrentSubpacketBuffer[59]_i_1 
       (.I0(DBG_recvCurrentSubpacket[59]),
        .I1(DBG_recvCurrentSubpacketOffset[3]),
        .I2(\recvCurrentSubpacketBuffer[59]_i_2_n_0 ),
        .O(\recvCurrentSubpacketBuffer[59]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \recvCurrentSubpacketBuffer[59]_i_2 
       (.I0(recv_pkt_data_rd_data[3]),
        .I1(recv_pkt_data_rd_data[19]),
        .I2(DBG_recvCurrentSubpacketOffset[0]),
        .I3(recv_pkt_data_rd_data[11]),
        .I4(DBG_recvCurrentSubpacketOffset[1]),
        .I5(recv_pkt_data_rd_data[27]),
        .O(\recvCurrentSubpacketBuffer[59]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8A808A8A8A808080)) 
    \recvCurrentSubpacketBuffer[5]_i_1 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(\recvCurrentSubpacketBuffer[5]_i_2_n_0 ),
        .I2(recvParseState__0[0]),
        .I3(DBG_recvCurrentSubpacket[5]),
        .I4(DBG_recvCurrentSubpacketOffset[3]),
        .I5(recv_pkt_data_rd_data[5]),
        .O(\recvCurrentSubpacketBuffer[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \recvCurrentSubpacketBuffer[5]_i_2 
       (.I0(\recvNextSubpacketOverflowBytes_reg_n_0_[5] ),
        .I1(DBG_recvCurrentSubpacketOffset[0]),
        .I2(\recvNextSubpacketOverflowBytes_reg_n_0_[13] ),
        .I3(DBG_recvCurrentSubpacketOffset[1]),
        .I4(\recvNextSubpacketOverflowBytes_reg_n_0_[21] ),
        .O(\recvCurrentSubpacketBuffer[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair143" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \recvCurrentSubpacketBuffer[60]_i_1 
       (.I0(DBG_recvCurrentSubpacket[60]),
        .I1(DBG_recvCurrentSubpacketOffset[3]),
        .I2(\recvCurrentSubpacketBuffer[60]_i_2_n_0 ),
        .O(\recvCurrentSubpacketBuffer[60]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \recvCurrentSubpacketBuffer[60]_i_2 
       (.I0(recv_pkt_data_rd_data[4]),
        .I1(recv_pkt_data_rd_data[20]),
        .I2(DBG_recvCurrentSubpacketOffset[0]),
        .I3(recv_pkt_data_rd_data[12]),
        .I4(DBG_recvCurrentSubpacketOffset[1]),
        .I5(recv_pkt_data_rd_data[28]),
        .O(\recvCurrentSubpacketBuffer[60]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair143" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \recvCurrentSubpacketBuffer[61]_i_1 
       (.I0(DBG_recvCurrentSubpacket[61]),
        .I1(DBG_recvCurrentSubpacketOffset[3]),
        .I2(\recvCurrentSubpacketBuffer[61]_i_2_n_0 ),
        .O(\recvCurrentSubpacketBuffer[61]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \recvCurrentSubpacketBuffer[61]_i_2 
       (.I0(recv_pkt_data_rd_data[5]),
        .I1(recv_pkt_data_rd_data[21]),
        .I2(DBG_recvCurrentSubpacketOffset[0]),
        .I3(recv_pkt_data_rd_data[13]),
        .I4(DBG_recvCurrentSubpacketOffset[1]),
        .I5(recv_pkt_data_rd_data[29]),
        .O(\recvCurrentSubpacketBuffer[61]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair141" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \recvCurrentSubpacketBuffer[62]_i_1 
       (.I0(DBG_recvCurrentSubpacket[62]),
        .I1(DBG_recvCurrentSubpacketOffset[3]),
        .I2(\recvCurrentSubpacketBuffer[62]_i_2_n_0 ),
        .O(\recvCurrentSubpacketBuffer[62]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \recvCurrentSubpacketBuffer[62]_i_2 
       (.I0(recv_pkt_data_rd_data[6]),
        .I1(recv_pkt_data_rd_data[22]),
        .I2(DBG_recvCurrentSubpacketOffset[0]),
        .I3(recv_pkt_data_rd_data[14]),
        .I4(DBG_recvCurrentSubpacketOffset[1]),
        .I5(recv_pkt_data_rd_data[30]),
        .O(\recvCurrentSubpacketBuffer[62]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0155010101010101)) 
    \recvCurrentSubpacketBuffer[63]_i_1 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(currentState__0[0]),
        .I2(currentState__0[2]),
        .I3(DBG_recvCurrentSubpacketOffset[3]),
        .I4(DBG_recvCurrentSubpacketOffset[2]),
        .I5(\recvCurrentSubpacketOffset[3]_i_3_n_0 ),
        .O(\recvCurrentSubpacketBuffer[63]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h01FF010101010101)) 
    \recvCurrentSubpacketBuffer[63]_i_2 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(currentState__0[0]),
        .I2(currentState__0[2]),
        .I3(DBG_recvCurrentSubpacketOffset[3]),
        .I4(DBG_recvCurrentSubpacketOffset[2]),
        .I5(\recvCurrentSubpacketOffset[3]_i_3_n_0 ),
        .O(\recvCurrentSubpacketBuffer[63]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair141" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \recvCurrentSubpacketBuffer[63]_i_3 
       (.I0(DBG_recvCurrentSubpacket[63]),
        .I1(DBG_recvCurrentSubpacketOffset[3]),
        .I2(\recvCurrentSubpacketBuffer[63]_i_4_n_0 ),
        .O(\recvCurrentSubpacketBuffer[63]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \recvCurrentSubpacketBuffer[63]_i_4 
       (.I0(recv_pkt_data_rd_data[7]),
        .I1(recv_pkt_data_rd_data[23]),
        .I2(DBG_recvCurrentSubpacketOffset[0]),
        .I3(recv_pkt_data_rd_data[15]),
        .I4(DBG_recvCurrentSubpacketOffset[1]),
        .I5(recv_pkt_data_rd_data[31]),
        .O(\recvCurrentSubpacketBuffer[63]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h8A808A8A8A808080)) 
    \recvCurrentSubpacketBuffer[64]_i_1 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(recv_pkt_data_rd_data[0]),
        .I2(DBG_recvCurrentSubpacketOffset[3]),
        .I3(\recvCurrentSubpacketBuffer[64]_i_2_n_0 ),
        .I4(DBG_recvCurrentSubpacketOffset[1]),
        .I5(recv_pkt_data_rd_data[24]),
        .O(\recvCurrentSubpacketBuffer[64]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \recvCurrentSubpacketBuffer[64]_i_2 
       (.I0(recv_pkt_data_rd_data[8]),
        .I1(DBG_recvCurrentSubpacketOffset[0]),
        .I2(recv_pkt_data_rd_data[16]),
        .O(\recvCurrentSubpacketBuffer[64]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8A808A8A8A808080)) 
    \recvCurrentSubpacketBuffer[65]_i_1 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(recv_pkt_data_rd_data[1]),
        .I2(DBG_recvCurrentSubpacketOffset[3]),
        .I3(\recvCurrentSubpacketBuffer[65]_i_2_n_0 ),
        .I4(DBG_recvCurrentSubpacketOffset[1]),
        .I5(recv_pkt_data_rd_data[25]),
        .O(\recvCurrentSubpacketBuffer[65]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \recvCurrentSubpacketBuffer[65]_i_2 
       (.I0(recv_pkt_data_rd_data[9]),
        .I1(DBG_recvCurrentSubpacketOffset[0]),
        .I2(recv_pkt_data_rd_data[17]),
        .O(\recvCurrentSubpacketBuffer[65]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8A808A8A8A808080)) 
    \recvCurrentSubpacketBuffer[66]_i_1 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(recv_pkt_data_rd_data[2]),
        .I2(DBG_recvCurrentSubpacketOffset[3]),
        .I3(\recvCurrentSubpacketBuffer[66]_i_2_n_0 ),
        .I4(DBG_recvCurrentSubpacketOffset[1]),
        .I5(recv_pkt_data_rd_data[26]),
        .O(\recvCurrentSubpacketBuffer[66]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \recvCurrentSubpacketBuffer[66]_i_2 
       (.I0(recv_pkt_data_rd_data[10]),
        .I1(DBG_recvCurrentSubpacketOffset[0]),
        .I2(recv_pkt_data_rd_data[18]),
        .O(\recvCurrentSubpacketBuffer[66]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8A808A8A8A808080)) 
    \recvCurrentSubpacketBuffer[67]_i_1 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(recv_pkt_data_rd_data[3]),
        .I2(DBG_recvCurrentSubpacketOffset[3]),
        .I3(\recvCurrentSubpacketBuffer[67]_i_2_n_0 ),
        .I4(DBG_recvCurrentSubpacketOffset[1]),
        .I5(recv_pkt_data_rd_data[27]),
        .O(\recvCurrentSubpacketBuffer[67]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \recvCurrentSubpacketBuffer[67]_i_2 
       (.I0(recv_pkt_data_rd_data[11]),
        .I1(DBG_recvCurrentSubpacketOffset[0]),
        .I2(recv_pkt_data_rd_data[19]),
        .O(\recvCurrentSubpacketBuffer[67]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8A808A8A8A808080)) 
    \recvCurrentSubpacketBuffer[68]_i_1 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(recv_pkt_data_rd_data[4]),
        .I2(DBG_recvCurrentSubpacketOffset[3]),
        .I3(\recvCurrentSubpacketBuffer[68]_i_2_n_0 ),
        .I4(DBG_recvCurrentSubpacketOffset[1]),
        .I5(recv_pkt_data_rd_data[28]),
        .O(\recvCurrentSubpacketBuffer[68]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \recvCurrentSubpacketBuffer[68]_i_2 
       (.I0(recv_pkt_data_rd_data[12]),
        .I1(DBG_recvCurrentSubpacketOffset[0]),
        .I2(recv_pkt_data_rd_data[20]),
        .O(\recvCurrentSubpacketBuffer[68]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8A808A8A8A808080)) 
    \recvCurrentSubpacketBuffer[69]_i_1 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(recv_pkt_data_rd_data[5]),
        .I2(DBG_recvCurrentSubpacketOffset[3]),
        .I3(\recvCurrentSubpacketBuffer[69]_i_2_n_0 ),
        .I4(DBG_recvCurrentSubpacketOffset[1]),
        .I5(recv_pkt_data_rd_data[29]),
        .O(\recvCurrentSubpacketBuffer[69]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \recvCurrentSubpacketBuffer[69]_i_2 
       (.I0(recv_pkt_data_rd_data[13]),
        .I1(DBG_recvCurrentSubpacketOffset[0]),
        .I2(recv_pkt_data_rd_data[21]),
        .O(\recvCurrentSubpacketBuffer[69]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8A808A8A8A808080)) 
    \recvCurrentSubpacketBuffer[6]_i_1 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(\recvCurrentSubpacketBuffer[6]_i_2_n_0 ),
        .I2(recvParseState__0[0]),
        .I3(DBG_recvCurrentSubpacket[6]),
        .I4(DBG_recvCurrentSubpacketOffset[3]),
        .I5(recv_pkt_data_rd_data[6]),
        .O(\recvCurrentSubpacketBuffer[6]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \recvCurrentSubpacketBuffer[6]_i_2 
       (.I0(\recvNextSubpacketOverflowBytes_reg_n_0_[6] ),
        .I1(DBG_recvCurrentSubpacketOffset[0]),
        .I2(\recvNextSubpacketOverflowBytes_reg_n_0_[14] ),
        .I3(DBG_recvCurrentSubpacketOffset[1]),
        .I4(\recvNextSubpacketOverflowBytes_reg_n_0_[22] ),
        .O(\recvCurrentSubpacketBuffer[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8A808A8A8A808080)) 
    \recvCurrentSubpacketBuffer[70]_i_1 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(recv_pkt_data_rd_data[6]),
        .I2(DBG_recvCurrentSubpacketOffset[3]),
        .I3(\recvCurrentSubpacketBuffer[70]_i_2_n_0 ),
        .I4(DBG_recvCurrentSubpacketOffset[1]),
        .I5(recv_pkt_data_rd_data[30]),
        .O(\recvCurrentSubpacketBuffer[70]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \recvCurrentSubpacketBuffer[70]_i_2 
       (.I0(recv_pkt_data_rd_data[14]),
        .I1(DBG_recvCurrentSubpacketOffset[0]),
        .I2(recv_pkt_data_rd_data[22]),
        .O(\recvCurrentSubpacketBuffer[70]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFEFFAAAAAAAAAA)) 
    \recvCurrentSubpacketBuffer[71]_i_1 
       (.I0(\recvCurrentSubpacketBuffer[71]_i_3_n_0 ),
        .I1(DBG_recvCurrentSubpacketOffset[0]),
        .I2(DBG_recvCurrentSubpacketOffset[1]),
        .I3(DBG_recvCurrentSubpacketOffset[3]),
        .I4(DBG_recvCurrentSubpacketOffset[2]),
        .I5(\recvCurrentSubpacketOffset[3]_i_3_n_0 ),
        .O(\recvCurrentSubpacketBuffer[71]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8A808A8A8A808080)) 
    \recvCurrentSubpacketBuffer[71]_i_2 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(recv_pkt_data_rd_data[7]),
        .I2(DBG_recvCurrentSubpacketOffset[3]),
        .I3(\recvCurrentSubpacketBuffer[71]_i_4_n_0 ),
        .I4(DBG_recvCurrentSubpacketOffset[1]),
        .I5(recv_pkt_data_rd_data[31]),
        .O(\recvCurrentSubpacketBuffer[71]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'h01)) 
    \recvCurrentSubpacketBuffer[71]_i_3 
       (.I0(currentState__0[2]),
        .I1(currentState__0[0]),
        .I2(sendHasRepliedSuccessfulConnection),
        .O(\recvCurrentSubpacketBuffer[71]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \recvCurrentSubpacketBuffer[71]_i_4 
       (.I0(recv_pkt_data_rd_data[15]),
        .I1(DBG_recvCurrentSubpacketOffset[0]),
        .I2(recv_pkt_data_rd_data[23]),
        .O(\recvCurrentSubpacketBuffer[71]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hEAEEEAAAEAAAEAAA)) 
    \recvCurrentSubpacketBuffer[7]_i_1 
       (.I0(\recvCurrentSubpacketBuffer[71]_i_3_n_0 ),
        .I1(validPacketsFIFO_wr_en_i_2_n_0),
        .I2(\recvCurrentSubpacketBuffer[31]_i_4_n_0 ),
        .I3(\recvCurrentSubpacketBuffer[7]_i_3_n_0 ),
        .I4(\recvCurrentSubpacketBuffer[15]_i_3_n_0 ),
        .I5(recvParseState__0[0]),
        .O(\recvCurrentSubpacketBuffer[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8A808A8A8A808080)) 
    \recvCurrentSubpacketBuffer[7]_i_2 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(\recvCurrentSubpacketBuffer[7]_i_4_n_0 ),
        .I2(recvParseState__0[0]),
        .I3(DBG_recvCurrentSubpacket[7]),
        .I4(DBG_recvCurrentSubpacketOffset[3]),
        .I5(recv_pkt_data_rd_data[7]),
        .O(\recvCurrentSubpacketBuffer[7]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \recvCurrentSubpacketBuffer[7]_i_3 
       (.I0(DBG_recvCurrentSubpacketOffset[0]),
        .I1(DBG_recvCurrentSubpacketOffset[1]),
        .O(\recvCurrentSubpacketBuffer[7]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \recvCurrentSubpacketBuffer[7]_i_4 
       (.I0(\recvNextSubpacketOverflowBytes_reg_n_0_[7] ),
        .I1(DBG_recvCurrentSubpacketOffset[0]),
        .I2(\recvNextSubpacketOverflowBytes_reg_n_0_[15] ),
        .I3(DBG_recvCurrentSubpacketOffset[1]),
        .I4(\recvNextSubpacketOverflowBytes_reg_n_0_[23] ),
        .O(\recvCurrentSubpacketBuffer[7]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h8A80AAAA8A800000)) 
    \recvCurrentSubpacketBuffer[8]_i_1 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(\recvNextSubpacketOverflowBytes_reg_n_0_[8] ),
        .I2(DBG_recvCurrentSubpacketOffset[0]),
        .I3(\recvNextSubpacketOverflowBytes_reg_n_0_[16] ),
        .I4(recvParseState__0[0]),
        .I5(\recvCurrentSubpacketBuffer[8]_i_2_n_0 ),
        .O(\recvCurrentSubpacketBuffer[8]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \recvCurrentSubpacketBuffer[8]_i_2 
       (.I0(DBG_recvCurrentSubpacket[8]),
        .I1(DBG_recvCurrentSubpacketOffset[3]),
        .I2(recv_pkt_data_rd_data[0]),
        .I3(DBG_recvCurrentSubpacketOffset[0]),
        .I4(recv_pkt_data_rd_data[8]),
        .O(\recvCurrentSubpacketBuffer[8]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8A80AAAA8A800000)) 
    \recvCurrentSubpacketBuffer[9]_i_1 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(\recvNextSubpacketOverflowBytes_reg_n_0_[9] ),
        .I2(DBG_recvCurrentSubpacketOffset[0]),
        .I3(\recvNextSubpacketOverflowBytes_reg_n_0_[17] ),
        .I4(recvParseState__0[0]),
        .I5(\recvCurrentSubpacketBuffer[9]_i_2_n_0 ),
        .O(\recvCurrentSubpacketBuffer[9]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \recvCurrentSubpacketBuffer[9]_i_2 
       (.I0(DBG_recvCurrentSubpacket[9]),
        .I1(DBG_recvCurrentSubpacketOffset[3]),
        .I2(recv_pkt_data_rd_data[1]),
        .I3(DBG_recvCurrentSubpacketOffset[0]),
        .I4(recv_pkt_data_rd_data[9]),
        .O(\recvCurrentSubpacketBuffer[9]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[0] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[7]_i_1_n_0 ),
        .D(\recvCurrentSubpacketBuffer[0]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacket[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[10] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[15]_i_1_n_0 ),
        .D(\recvCurrentSubpacketBuffer[10]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacket[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[11] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[15]_i_1_n_0 ),
        .D(\recvCurrentSubpacketBuffer[11]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacket[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[12] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[15]_i_1_n_0 ),
        .D(\recvCurrentSubpacketBuffer[12]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacket[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[13] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[15]_i_1_n_0 ),
        .D(\recvCurrentSubpacketBuffer[13]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacket[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[14] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[15]_i_1_n_0 ),
        .D(\recvCurrentSubpacketBuffer[14]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacket[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[15] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[15]_i_1_n_0 ),
        .D(\recvCurrentSubpacketBuffer[15]_i_2_n_0 ),
        .Q(DBG_recvCurrentSubpacket[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[16] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[23]_i_1_n_0 ),
        .D(\recvCurrentSubpacketBuffer[16]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacket[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[17] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[23]_i_1_n_0 ),
        .D(\recvCurrentSubpacketBuffer[17]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacket[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[18] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[23]_i_1_n_0 ),
        .D(\recvCurrentSubpacketBuffer[18]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacket[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[19] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[23]_i_1_n_0 ),
        .D(\recvCurrentSubpacketBuffer[19]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacket[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[1] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[7]_i_1_n_0 ),
        .D(\recvCurrentSubpacketBuffer[1]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacket[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[20] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[23]_i_1_n_0 ),
        .D(\recvCurrentSubpacketBuffer[20]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacket[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[21] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[23]_i_1_n_0 ),
        .D(\recvCurrentSubpacketBuffer[21]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacket[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[22] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[23]_i_1_n_0 ),
        .D(\recvCurrentSubpacketBuffer[22]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacket[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[23] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[23]_i_1_n_0 ),
        .D(\recvCurrentSubpacketBuffer[23]_i_2_n_0 ),
        .Q(DBG_recvCurrentSubpacket[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[24] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[31]_i_2_n_0 ),
        .D(\recvCurrentSubpacketBuffer[24]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacket[24]),
        .R(\recvCurrentSubpacketBuffer[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[25] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[31]_i_2_n_0 ),
        .D(\recvCurrentSubpacketBuffer[25]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacket[25]),
        .R(\recvCurrentSubpacketBuffer[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[26] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[31]_i_2_n_0 ),
        .D(\recvCurrentSubpacketBuffer[26]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacket[26]),
        .R(\recvCurrentSubpacketBuffer[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[27] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[31]_i_2_n_0 ),
        .D(\recvCurrentSubpacketBuffer[27]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacket[27]),
        .R(\recvCurrentSubpacketBuffer[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[28] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[31]_i_2_n_0 ),
        .D(\recvCurrentSubpacketBuffer[28]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacket[28]),
        .R(\recvCurrentSubpacketBuffer[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[29] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[31]_i_2_n_0 ),
        .D(\recvCurrentSubpacketBuffer[29]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacket[29]),
        .R(\recvCurrentSubpacketBuffer[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[2] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[7]_i_1_n_0 ),
        .D(\recvCurrentSubpacketBuffer[2]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacket[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[30] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[31]_i_2_n_0 ),
        .D(\recvCurrentSubpacketBuffer[30]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacket[30]),
        .R(\recvCurrentSubpacketBuffer[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[31] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[31]_i_2_n_0 ),
        .D(\recvCurrentSubpacketBuffer[31]_i_3_n_0 ),
        .Q(DBG_recvCurrentSubpacket[31]),
        .R(\recvCurrentSubpacketBuffer[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[32] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[39]_i_1_n_0 ),
        .D(\recvCurrentSubpacketBuffer[32]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacket[32]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[33] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[39]_i_1_n_0 ),
        .D(\recvCurrentSubpacketBuffer[33]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacket[33]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[34] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[39]_i_1_n_0 ),
        .D(\recvCurrentSubpacketBuffer[34]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacket[34]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[35] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[39]_i_1_n_0 ),
        .D(\recvCurrentSubpacketBuffer[35]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacket[35]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[36] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[39]_i_1_n_0 ),
        .D(\recvCurrentSubpacketBuffer[36]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacket[36]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[37] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[39]_i_1_n_0 ),
        .D(\recvCurrentSubpacketBuffer[37]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacket[37]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[38] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[39]_i_1_n_0 ),
        .D(\recvCurrentSubpacketBuffer[38]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacket[38]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[39] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[39]_i_1_n_0 ),
        .D(\recvCurrentSubpacketBuffer[39]_i_2_n_0 ),
        .Q(DBG_recvCurrentSubpacket[39]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[3] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[7]_i_1_n_0 ),
        .D(\recvCurrentSubpacketBuffer[3]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacket[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[40] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[47]_i_2_n_0 ),
        .D(\recvCurrentSubpacketBuffer[40]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacket[40]),
        .R(\recvCurrentSubpacketBuffer[47]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[41] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[47]_i_2_n_0 ),
        .D(\recvCurrentSubpacketBuffer[41]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacket[41]),
        .R(\recvCurrentSubpacketBuffer[47]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[42] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[47]_i_2_n_0 ),
        .D(\recvCurrentSubpacketBuffer[42]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacket[42]),
        .R(\recvCurrentSubpacketBuffer[47]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[43] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[47]_i_2_n_0 ),
        .D(\recvCurrentSubpacketBuffer[43]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacket[43]),
        .R(\recvCurrentSubpacketBuffer[47]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[44] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[47]_i_2_n_0 ),
        .D(\recvCurrentSubpacketBuffer[44]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacket[44]),
        .R(\recvCurrentSubpacketBuffer[47]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[45] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[47]_i_2_n_0 ),
        .D(\recvCurrentSubpacketBuffer[45]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacket[45]),
        .R(\recvCurrentSubpacketBuffer[47]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[46] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[47]_i_2_n_0 ),
        .D(\recvCurrentSubpacketBuffer[46]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacket[46]),
        .R(\recvCurrentSubpacketBuffer[47]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[47] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[47]_i_2_n_0 ),
        .D(\recvCurrentSubpacketBuffer[47]_i_3_n_0 ),
        .Q(DBG_recvCurrentSubpacket[47]),
        .R(\recvCurrentSubpacketBuffer[47]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[48] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[55]_i_1_n_0 ),
        .D(\recvCurrentSubpacketBuffer[48]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacket[48]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[49] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[55]_i_1_n_0 ),
        .D(\recvCurrentSubpacketBuffer[49]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacket[49]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[4] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[7]_i_1_n_0 ),
        .D(\recvCurrentSubpacketBuffer[4]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacket[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[50] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[55]_i_1_n_0 ),
        .D(\recvCurrentSubpacketBuffer[50]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacket[50]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[51] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[55]_i_1_n_0 ),
        .D(\recvCurrentSubpacketBuffer[51]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacket[51]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[52] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[55]_i_1_n_0 ),
        .D(\recvCurrentSubpacketBuffer[52]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacket[52]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[53] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[55]_i_1_n_0 ),
        .D(\recvCurrentSubpacketBuffer[53]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacket[53]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[54] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[55]_i_1_n_0 ),
        .D(\recvCurrentSubpacketBuffer[54]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacket[54]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[55] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[55]_i_1_n_0 ),
        .D(\recvCurrentSubpacketBuffer[55]_i_2_n_0 ),
        .Q(DBG_recvCurrentSubpacket[55]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[56] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[63]_i_2_n_0 ),
        .D(\recvCurrentSubpacketBuffer[56]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacket[56]),
        .R(\recvCurrentSubpacketBuffer[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[57] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[63]_i_2_n_0 ),
        .D(\recvCurrentSubpacketBuffer[57]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacket[57]),
        .R(\recvCurrentSubpacketBuffer[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[58] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[63]_i_2_n_0 ),
        .D(\recvCurrentSubpacketBuffer[58]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacket[58]),
        .R(\recvCurrentSubpacketBuffer[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[59] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[63]_i_2_n_0 ),
        .D(\recvCurrentSubpacketBuffer[59]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacket[59]),
        .R(\recvCurrentSubpacketBuffer[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[5] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[7]_i_1_n_0 ),
        .D(\recvCurrentSubpacketBuffer[5]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacket[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[60] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[63]_i_2_n_0 ),
        .D(\recvCurrentSubpacketBuffer[60]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacket[60]),
        .R(\recvCurrentSubpacketBuffer[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[61] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[63]_i_2_n_0 ),
        .D(\recvCurrentSubpacketBuffer[61]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacket[61]),
        .R(\recvCurrentSubpacketBuffer[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[62] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[63]_i_2_n_0 ),
        .D(\recvCurrentSubpacketBuffer[62]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacket[62]),
        .R(\recvCurrentSubpacketBuffer[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[63] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[63]_i_2_n_0 ),
        .D(\recvCurrentSubpacketBuffer[63]_i_3_n_0 ),
        .Q(DBG_recvCurrentSubpacket[63]),
        .R(\recvCurrentSubpacketBuffer[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[64] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[71]_i_1_n_0 ),
        .D(\recvCurrentSubpacketBuffer[64]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacket[64]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[65] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[71]_i_1_n_0 ),
        .D(\recvCurrentSubpacketBuffer[65]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacket[65]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[66] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[71]_i_1_n_0 ),
        .D(\recvCurrentSubpacketBuffer[66]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacket[66]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[67] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[71]_i_1_n_0 ),
        .D(\recvCurrentSubpacketBuffer[67]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacket[67]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[68] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[71]_i_1_n_0 ),
        .D(\recvCurrentSubpacketBuffer[68]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacket[68]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[69] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[71]_i_1_n_0 ),
        .D(\recvCurrentSubpacketBuffer[69]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacket[69]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[6] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[7]_i_1_n_0 ),
        .D(\recvCurrentSubpacketBuffer[6]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacket[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[70] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[71]_i_1_n_0 ),
        .D(\recvCurrentSubpacketBuffer[70]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacket[70]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[71] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[71]_i_1_n_0 ),
        .D(\recvCurrentSubpacketBuffer[71]_i_2_n_0 ),
        .Q(DBG_recvCurrentSubpacket[71]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[7] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[7]_i_1_n_0 ),
        .D(\recvCurrentSubpacketBuffer[7]_i_2_n_0 ),
        .Q(DBG_recvCurrentSubpacket[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[8] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[15]_i_1_n_0 ),
        .D(\recvCurrentSubpacketBuffer[8]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacket[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketBuffer_reg[9] 
       (.C(clk333_250),
        .CE(\recvCurrentSubpacketBuffer[15]_i_1_n_0 ),
        .D(\recvCurrentSubpacketBuffer[9]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacket[9]),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h8A)) 
    \recvCurrentSubpacketCount[7]_i_1 
       (.I0(\DBG_recvHeaderChecksum[7]_i_1_n_0 ),
        .I1(\recvPacketHeaderBuffer_reg[0]_0 ),
        .I2(\stat_recv_session_packets_valid[31]_i_3_n_0 ),
        .O(\recvCurrentSubpacketCount[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketCount_reg[0] 
       (.C(clk333_250),
        .CE(\DBG_recvHeaderChecksum[7]_i_1_n_0 ),
        .D(\recvPacketHeaderBuffer_reg[56]_0 ),
        .Q(recvCurrentSubpacketCount[0]),
        .R(\recvCurrentSubpacketCount[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketCount_reg[1] 
       (.C(clk333_250),
        .CE(\DBG_recvHeaderChecksum[7]_i_1_n_0 ),
        .D(\recvPacketHeaderBuffer_reg[57]_0 ),
        .Q(recvCurrentSubpacketCount[1]),
        .R(\recvCurrentSubpacketCount[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketCount_reg[2] 
       (.C(clk333_250),
        .CE(\DBG_recvHeaderChecksum[7]_i_1_n_0 ),
        .D(\recvPacketHeaderBuffer_reg[58]_0 ),
        .Q(recvCurrentSubpacketCount[2]),
        .R(\recvCurrentSubpacketCount[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketCount_reg[3] 
       (.C(clk333_250),
        .CE(\DBG_recvHeaderChecksum[7]_i_1_n_0 ),
        .D(\recvPacketHeaderBuffer_reg[59]_0 ),
        .Q(recvCurrentSubpacketCount[3]),
        .R(\recvCurrentSubpacketCount[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketCount_reg[4] 
       (.C(clk333_250),
        .CE(\DBG_recvHeaderChecksum[7]_i_1_n_0 ),
        .D(\recvPacketHeaderBuffer_reg[60]_0 ),
        .Q(recvCurrentSubpacketCount[4]),
        .R(\recvCurrentSubpacketCount[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketCount_reg[5] 
       (.C(clk333_250),
        .CE(\DBG_recvHeaderChecksum[7]_i_1_n_0 ),
        .D(\recvPacketHeaderBuffer_reg[61]_0 ),
        .Q(recvCurrentSubpacketCount[5]),
        .R(\recvCurrentSubpacketCount[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketCount_reg[6] 
       (.C(clk333_250),
        .CE(\DBG_recvHeaderChecksum[7]_i_1_n_0 ),
        .D(\recvPacketHeaderBuffer_reg[62]_0 ),
        .Q(recvCurrentSubpacketCount[6]),
        .R(\recvCurrentSubpacketCount[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketCount_reg[7] 
       (.C(clk333_250),
        .CE(\DBG_recvHeaderChecksum[7]_i_1_n_0 ),
        .D(\recvPacketHeaderBuffer_reg[63]_0 ),
        .Q(recvCurrentSubpacketCount[7]),
        .R(\recvCurrentSubpacketCount[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair114" *) 
  LUT3 #(
    .INIT(8'hA3)) 
    \recvCurrentSubpacketIndex[0]_i_1 
       (.I0(recv_pkt_header_empty),
        .I1(DBG_recvCurrentSubpacketIndex[0]),
        .I2(recvParseState__0[0]),
        .O(\recvCurrentSubpacketIndex[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT4 #(
    .INIT(16'h8BB8)) 
    \recvCurrentSubpacketIndex[1]_i_1 
       (.I0(recv_pkt_header_empty),
        .I1(recvParseState__0[0]),
        .I2(DBG_recvCurrentSubpacketIndex[0]),
        .I3(DBG_recvCurrentSubpacketIndex[1]),
        .O(\recvCurrentSubpacketIndex[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT5 #(
    .INIT(32'h8BB8B8B8)) 
    \recvCurrentSubpacketIndex[2]_i_1 
       (.I0(recv_pkt_header_empty),
        .I1(recvParseState__0[0]),
        .I2(DBG_recvCurrentSubpacketIndex[2]),
        .I3(DBG_recvCurrentSubpacketIndex[1]),
        .I4(DBG_recvCurrentSubpacketIndex[0]),
        .O(\recvCurrentSubpacketIndex[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8BB8B8B8B8B8B8B8)) 
    \recvCurrentSubpacketIndex[3]_i_1 
       (.I0(recv_pkt_header_empty),
        .I1(recvParseState__0[0]),
        .I2(DBG_recvCurrentSubpacketIndex[3]),
        .I3(DBG_recvCurrentSubpacketIndex[0]),
        .I4(DBG_recvCurrentSubpacketIndex[1]),
        .I5(DBG_recvCurrentSubpacketIndex[2]),
        .O(\recvCurrentSubpacketIndex[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair113" *) 
  LUT4 #(
    .INIT(16'h8BB8)) 
    \recvCurrentSubpacketIndex[4]_i_1 
       (.I0(recv_pkt_header_empty),
        .I1(recvParseState__0[0]),
        .I2(DBG_recvCurrentSubpacketIndex[4]),
        .I3(\recvCurrentSubpacketIndex[4]_i_2_n_0 ),
        .O(\recvCurrentSubpacketIndex[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \recvCurrentSubpacketIndex[4]_i_2 
       (.I0(DBG_recvCurrentSubpacketIndex[3]),
        .I1(DBG_recvCurrentSubpacketIndex[0]),
        .I2(DBG_recvCurrentSubpacketIndex[1]),
        .I3(DBG_recvCurrentSubpacketIndex[2]),
        .O(\recvCurrentSubpacketIndex[4]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair114" *) 
  LUT4 #(
    .INIT(16'h8BB8)) 
    \recvCurrentSubpacketIndex[5]_i_1 
       (.I0(recv_pkt_header_empty),
        .I1(recvParseState__0[0]),
        .I2(DBG_recvCurrentSubpacketIndex[5]),
        .I3(\recvCurrentSubpacketIndex[5]_i_2_n_0 ),
        .O(\recvCurrentSubpacketIndex[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \recvCurrentSubpacketIndex[5]_i_2 
       (.I0(DBG_recvCurrentSubpacketIndex[4]),
        .I1(DBG_recvCurrentSubpacketIndex[2]),
        .I2(DBG_recvCurrentSubpacketIndex[1]),
        .I3(DBG_recvCurrentSubpacketIndex[0]),
        .I4(DBG_recvCurrentSubpacketIndex[3]),
        .O(\recvCurrentSubpacketIndex[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT4 #(
    .INIT(16'h8BB8)) 
    \recvCurrentSubpacketIndex[6]_i_1 
       (.I0(recv_pkt_header_empty),
        .I1(recvParseState__0[0]),
        .I2(DBG_recvCurrentSubpacketIndex[6]),
        .I3(\recvCurrentSubpacketIndex[7]_i_3_n_0 ),
        .O(\recvCurrentSubpacketIndex[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF0FE00000)) 
    \recvCurrentSubpacketIndex[7]_i_1 
       (.I0(DBG_recvCurrentSubpacketOffset[1]),
        .I1(DBG_recvCurrentSubpacketOffset[0]),
        .I2(DBG_recvCurrentSubpacketOffset[2]),
        .I3(DBG_recvCurrentSubpacketOffset[3]),
        .I4(\recvCurrentSubpacketOffset[3]_i_3_n_0 ),
        .I5(\DBG_recvHeaderChecksum[7]_i_1_n_0 ),
        .O(recvCurrentSubpacketIndex));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT5 #(
    .INIT(32'h8BB8B8B8)) 
    \recvCurrentSubpacketIndex[7]_i_2 
       (.I0(recv_pkt_header_empty),
        .I1(recvParseState__0[0]),
        .I2(DBG_recvCurrentSubpacketIndex[7]),
        .I3(\recvCurrentSubpacketIndex[7]_i_3_n_0 ),
        .I4(DBG_recvCurrentSubpacketIndex[6]),
        .O(\recvCurrentSubpacketIndex[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \recvCurrentSubpacketIndex[7]_i_3 
       (.I0(DBG_recvCurrentSubpacketIndex[5]),
        .I1(DBG_recvCurrentSubpacketIndex[3]),
        .I2(DBG_recvCurrentSubpacketIndex[0]),
        .I3(DBG_recvCurrentSubpacketIndex[1]),
        .I4(DBG_recvCurrentSubpacketIndex[2]),
        .I5(DBG_recvCurrentSubpacketIndex[4]),
        .O(\recvCurrentSubpacketIndex[7]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketIndex_reg[0] 
       (.C(clk333_250),
        .CE(recvCurrentSubpacketIndex),
        .D(\recvCurrentSubpacketIndex[0]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacketIndex[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketIndex_reg[1] 
       (.C(clk333_250),
        .CE(recvCurrentSubpacketIndex),
        .D(\recvCurrentSubpacketIndex[1]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacketIndex[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketIndex_reg[2] 
       (.C(clk333_250),
        .CE(recvCurrentSubpacketIndex),
        .D(\recvCurrentSubpacketIndex[2]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacketIndex[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketIndex_reg[3] 
       (.C(clk333_250),
        .CE(recvCurrentSubpacketIndex),
        .D(\recvCurrentSubpacketIndex[3]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacketIndex[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketIndex_reg[4] 
       (.C(clk333_250),
        .CE(recvCurrentSubpacketIndex),
        .D(\recvCurrentSubpacketIndex[4]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacketIndex[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketIndex_reg[5] 
       (.C(clk333_250),
        .CE(recvCurrentSubpacketIndex),
        .D(\recvCurrentSubpacketIndex[5]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacketIndex[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketIndex_reg[6] 
       (.C(clk333_250),
        .CE(recvCurrentSubpacketIndex),
        .D(\recvCurrentSubpacketIndex[6]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacketIndex[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketIndex_reg[7] 
       (.C(clk333_250),
        .CE(recvCurrentSubpacketIndex),
        .D(\recvCurrentSubpacketIndex[7]_i_2_n_0 ),
        .Q(DBG_recvCurrentSubpacketIndex[7]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hBB8888BB88B8BB88)) 
    \recvCurrentSubpacketOffset[0]_i_1 
       (.I0(recv_pkt_header_empty),
        .I1(recvParseState__0[0]),
        .I2(DBG_recvCurrentSubpacketOffset[1]),
        .I3(DBG_recvCurrentSubpacketOffset[0]),
        .I4(DBG_recvCurrentSubpacketOffset[2]),
        .I5(DBG_recvCurrentSubpacketOffset[3]),
        .O(\recvCurrentSubpacketOffset[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBBB8B8BB88888B88)) 
    \recvCurrentSubpacketOffset[1]_i_1 
       (.I0(recv_pkt_header_empty),
        .I1(recvParseState__0[0]),
        .I2(DBG_recvCurrentSubpacketOffset[0]),
        .I3(DBG_recvCurrentSubpacketOffset[3]),
        .I4(DBG_recvCurrentSubpacketOffset[2]),
        .I5(DBG_recvCurrentSubpacketOffset[1]),
        .O(\recvCurrentSubpacketOffset[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h88888888BBB8BBBB)) 
    \recvCurrentSubpacketOffset[2]_i_1 
       (.I0(recv_pkt_header_empty),
        .I1(recvParseState__0[0]),
        .I2(DBG_recvCurrentSubpacketOffset[0]),
        .I3(DBG_recvCurrentSubpacketOffset[1]),
        .I4(DBG_recvCurrentSubpacketOffset[3]),
        .I5(DBG_recvCurrentSubpacketOffset[2]),
        .O(\recvCurrentSubpacketOffset[2]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \recvCurrentSubpacketOffset[3]_i_1 
       (.I0(\DBG_recvHeaderChecksum[7]_i_1_n_0 ),
        .I1(\recvCurrentSubpacketOffset[3]_i_3_n_0 ),
        .O(recvCurrentSubpacketOffset));
  LUT6 #(
    .INIT(64'h8888888B88888888)) 
    \recvCurrentSubpacketOffset[3]_i_2 
       (.I0(recv_pkt_header_empty),
        .I1(recvParseState__0[0]),
        .I2(DBG_recvCurrentSubpacketOffset[0]),
        .I3(DBG_recvCurrentSubpacketOffset[1]),
        .I4(DBG_recvCurrentSubpacketOffset[3]),
        .I5(DBG_recvCurrentSubpacketOffset[2]),
        .O(\recvCurrentSubpacketOffset[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000004000000)) 
    \recvCurrentSubpacketOffset[3]_i_3 
       (.I0(recvParseState__0[1]),
        .I1(recvParseState__0[2]),
        .I2(recvPumpFIFO_reg_n_0),
        .I3(sendHasRepliedSuccessfulConnection),
        .I4(currentState__0[0]),
        .I5(\recvCurrentSubpacketOffset[3]_i_4_n_0 ),
        .O(\recvCurrentSubpacketOffset[3]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'hEF)) 
    \recvCurrentSubpacketOffset[3]_i_4 
       (.I0(recv_pkt_data_empty),
        .I1(recvParseState__0[0]),
        .I2(\recvParseState[2]__0_i_7_n_0 ),
        .O(\recvCurrentSubpacketOffset[3]_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketOffset_reg[0] 
       (.C(clk333_250),
        .CE(recvCurrentSubpacketOffset),
        .D(\recvCurrentSubpacketOffset[0]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacketOffset[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketOffset_reg[1] 
       (.C(clk333_250),
        .CE(recvCurrentSubpacketOffset),
        .D(\recvCurrentSubpacketOffset[1]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacketOffset[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketOffset_reg[2] 
       (.C(clk333_250),
        .CE(recvCurrentSubpacketOffset),
        .D(\recvCurrentSubpacketOffset[2]_i_1_n_0 ),
        .Q(DBG_recvCurrentSubpacketOffset[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvCurrentSubpacketOffset_reg[3] 
       (.C(clk333_250),
        .CE(recvCurrentSubpacketOffset),
        .D(\recvCurrentSubpacketOffset[3]_i_2_n_0 ),
        .Q(DBG_recvCurrentSubpacketOffset[3]),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h04)) 
    \recvFIFOAccess[0]_i_1 
       (.I0(DBG_RecvFIFOState[2]),
        .I1(sendHasRepliedSuccessfulConnection),
        .I2(DBG_RecvFIFOState[0]),
        .O(recvFIFOAccess));
  (* SOFT_HLUTNM = "soft_lutpair119" *) 
  LUT3 #(
    .INIT(8'h60)) 
    \recvFIFOAccess[1]_i_1 
       (.I0(DBG_RecvFIFOState[0]),
        .I1(DBG_RecvFIFOState[1]),
        .I2(sendHasRepliedSuccessfulConnection),
        .O(\recvFIFOAccess[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000005700000055)) 
    \recvFIFOAccess[2]_i_1 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(recvPumpFIFO_reg_n_0),
        .I2(recvSendReplyPacket_reg_0),
        .I3(currentState__0[2]),
        .I4(currentState__0[0]),
        .I5(\recvFIFOAccess[2]_i_3_n_0 ),
        .O(\recvFIFOAccess[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair119" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \recvFIFOAccess[2]_i_2 
       (.I0(DBG_RecvFIFOState[0]),
        .I1(DBG_RecvFIFOState[1]),
        .I2(sendHasRepliedSuccessfulConnection),
        .O(\recvFIFOAccess[2]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h2323FF03)) 
    \recvFIFOAccess[2]_i_3 
       (.I0(DBG_RecvFIFOState[0]),
        .I1(recv_pkt_header_empty),
        .I2(recv_pkt_data_empty),
        .I3(DBG_RecvFIFOState[2]),
        .I4(DBG_RecvFIFOState[1]),
        .O(\recvFIFOAccess[2]_i_3_n_0 ));
  (* FSM_ENCODING = "user_encoding" *) 
  FDRE #(
    .INIT(1'b0)) 
    \recvFIFOAccess_reg[0] 
       (.C(clk333_250),
        .CE(\recvFIFOAccess[2]_i_1_n_0 ),
        .D(recvFIFOAccess),
        .Q(DBG_RecvFIFOState[0]),
        .R(1'b0));
  (* FSM_ENCODING = "user_encoding" *) 
  FDRE #(
    .INIT(1'b0)) 
    \recvFIFOAccess_reg[1] 
       (.C(clk333_250),
        .CE(\recvFIFOAccess[2]_i_1_n_0 ),
        .D(\recvFIFOAccess[1]_i_1_n_0 ),
        .Q(DBG_RecvFIFOState[1]),
        .R(1'b0));
  (* FSM_ENCODING = "user_encoding" *) 
  FDRE #(
    .INIT(1'b0)) 
    \recvFIFOAccess_reg[2] 
       (.C(clk333_250),
        .CE(\recvFIFOAccess[2]_i_1_n_0 ),
        .D(\recvFIFOAccess[2]_i_2_n_0 ),
        .Q(DBG_RecvFIFOState[2]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h1)) 
    \recvLastAckedPacketID[15]_i_1 
       (.I0(currentState__0[0]),
        .I1(currentState__0[2]),
        .O(\recvLastAckedPacketID[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0075005500550055)) 
    \recvLastAckedPacketID[15]_i_2 
       (.I0(currentState__0[0]),
        .I1(\recvLastAckedPacketID[15]_i_3_n_0 ),
        .I2(recvPacketCanProcess),
        .I3(currentState__0[2]),
        .I4(\recvLastAckedPacketID[15]_i_4_n_0 ),
        .I5(\recvLastSendAckedPacketID[15]_i_2_n_0 ),
        .O(\recvLastAckedPacketID[15]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT5 #(
    .INIT(32'h00000001)) 
    \recvLastAckedPacketID[15]_i_3 
       (.I0(\stat_recv_session_packets_valid[31]_i_16_n_0 ),
        .I1(\recvPacketHeaderBuffer_reg[61]_0 ),
        .I2(\recvPacketHeaderBuffer_reg[62]_0 ),
        .I3(\recvPacketHeaderBuffer_reg[56]_0 ),
        .I4(\recvPacketHeaderBuffer_reg[63]_0 ),
        .O(\recvLastAckedPacketID[15]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair101" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \recvLastAckedPacketID[15]_i_4 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(recvPumpFIFO_reg_n_0),
        .O(\recvLastAckedPacketID[15]_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvLastAckedPacketID_reg[0] 
       (.C(clk333_250),
        .CE(\recvLastAckedPacketID[15]_i_2_n_0 ),
        .D(DBG_recvPacketData[1]),
        .Q(D[0]),
        .R(\recvLastAckedPacketID[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvLastAckedPacketID_reg[10] 
       (.C(clk333_250),
        .CE(\recvLastAckedPacketID[15]_i_2_n_0 ),
        .D(DBG_recvPacketData[6]),
        .Q(D[10]),
        .R(\recvLastAckedPacketID[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvLastAckedPacketID_reg[11] 
       (.C(clk333_250),
        .CE(\recvLastAckedPacketID[15]_i_2_n_0 ),
        .D(\recvPacketHeaderBuffer_reg[19]_0 ),
        .Q(D[11]),
        .R(\recvLastAckedPacketID[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvLastAckedPacketID_reg[12] 
       (.C(clk333_250),
        .CE(\recvLastAckedPacketID[15]_i_2_n_0 ),
        .D(DBG_recvPacketData[7]),
        .Q(D[12]),
        .R(\recvLastAckedPacketID[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvLastAckedPacketID_reg[13] 
       (.C(clk333_250),
        .CE(\recvLastAckedPacketID[15]_i_2_n_0 ),
        .D(DBG_recvPacketData[8]),
        .Q(D[13]),
        .R(\recvLastAckedPacketID[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvLastAckedPacketID_reg[14] 
       (.C(clk333_250),
        .CE(\recvLastAckedPacketID[15]_i_2_n_0 ),
        .D(\recvPacketHeaderBuffer_reg[22]_0 ),
        .Q(D[14]),
        .R(\recvLastAckedPacketID[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvLastAckedPacketID_reg[15] 
       (.C(clk333_250),
        .CE(\recvLastAckedPacketID[15]_i_2_n_0 ),
        .D(DBG_recvPacketData[9]),
        .Q(D[15]),
        .R(\recvLastAckedPacketID[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvLastAckedPacketID_reg[1] 
       (.C(clk333_250),
        .CE(\recvLastAckedPacketID[15]_i_2_n_0 ),
        .D(\recvPacketHeaderBuffer_reg[9]_0 ),
        .Q(D[1]),
        .R(\recvLastAckedPacketID[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvLastAckedPacketID_reg[2] 
       (.C(clk333_250),
        .CE(\recvLastAckedPacketID[15]_i_2_n_0 ),
        .D(\recvPacketHeaderBuffer_reg[10]_0 ),
        .Q(D[2]),
        .R(\recvLastAckedPacketID[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvLastAckedPacketID_reg[3] 
       (.C(clk333_250),
        .CE(\recvLastAckedPacketID[15]_i_2_n_0 ),
        .D(DBG_recvPacketData[2]),
        .Q(D[3]),
        .R(\recvLastAckedPacketID[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvLastAckedPacketID_reg[4] 
       (.C(clk333_250),
        .CE(\recvLastAckedPacketID[15]_i_2_n_0 ),
        .D(DBG_recvPacketData[3]),
        .Q(D[4]),
        .R(\recvLastAckedPacketID[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvLastAckedPacketID_reg[5] 
       (.C(clk333_250),
        .CE(\recvLastAckedPacketID[15]_i_2_n_0 ),
        .D(DBG_recvPacketData[4]),
        .Q(D[5]),
        .R(\recvLastAckedPacketID[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvLastAckedPacketID_reg[6] 
       (.C(clk333_250),
        .CE(\recvLastAckedPacketID[15]_i_2_n_0 ),
        .D(\recvPacketHeaderBuffer_reg[14]_0 ),
        .Q(D[6]),
        .R(\recvLastAckedPacketID[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvLastAckedPacketID_reg[7] 
       (.C(clk333_250),
        .CE(\recvLastAckedPacketID[15]_i_2_n_0 ),
        .D(DBG_recvPacketData[5]),
        .Q(D[7]),
        .R(\recvLastAckedPacketID[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvLastAckedPacketID_reg[8] 
       (.C(clk333_250),
        .CE(\recvLastAckedPacketID[15]_i_2_n_0 ),
        .D(\recvPacketHeaderBuffer_reg[16]_0 ),
        .Q(D[8]),
        .R(\recvLastAckedPacketID[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvLastAckedPacketID_reg[9] 
       (.C(clk333_250),
        .CE(\recvLastAckedPacketID[15]_i_2_n_0 ),
        .D(\recvPacketHeaderBuffer_reg[17]_0 ),
        .Q(D[9]),
        .R(\recvLastAckedPacketID[15]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0800)) 
    \recvLastSendAckedPacketID[15]_i_1 
       (.I0(currentState__0[0]),
        .I1(sendHasRepliedSuccessfulConnection),
        .I2(recvPumpFIFO_reg_n_0),
        .I3(\recvLastSendAckedPacketID[15]_i_2_n_0 ),
        .O(recvLastSendAckedPacketID));
  LUT6 #(
    .INIT(64'h0000080000000000)) 
    \recvLastSendAckedPacketID[15]_i_2 
       (.I0(\stat_recv_session_packets_valid[31]_i_3_n_0 ),
        .I1(recvPacketAllValid_reg_n_0),
        .I2(\recvPacketHeaderBuffer_reg[0]_0 ),
        .I3(recvParseState__0[2]),
        .I4(\recvLastSendAckedPacketID[15]_i_3_n_0 ),
        .I5(\recvLastSendAckedPacketID[15]_i_4_n_0 ),
        .O(\recvLastSendAckedPacketID[15]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair103" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \recvLastSendAckedPacketID[15]_i_3 
       (.I0(\recvPacketHeaderBuffer_reg[7]_0 ),
        .I1(DBG_recvPacketData[0]),
        .O(\recvLastSendAckedPacketID[15]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \recvLastSendAckedPacketID[15]_i_4 
       (.I0(recvParseState__0[0]),
        .I1(recvParseState__0[1]),
        .O(\recvLastSendAckedPacketID[15]_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvLastSendAckedPacketID_reg[0] 
       (.C(clk333_250),
        .CE(recvLastSendAckedPacketID),
        .D(DBG_recvPacketData[10]),
        .Q(DBG_recvLastSendAckedPacketID[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvLastSendAckedPacketID_reg[10] 
       (.C(clk333_250),
        .CE(recvLastSendAckedPacketID),
        .D(\recvPacketHeaderBuffer_reg[34]_0 ),
        .Q(DBG_recvLastSendAckedPacketID[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvLastSendAckedPacketID_reg[11] 
       (.C(clk333_250),
        .CE(recvLastSendAckedPacketID),
        .D(\recvPacketHeaderBuffer_reg[35]_0 ),
        .Q(DBG_recvLastSendAckedPacketID[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvLastSendAckedPacketID_reg[12] 
       (.C(clk333_250),
        .CE(recvLastSendAckedPacketID),
        .D(\recvPacketHeaderBuffer_reg[36]_0 ),
        .Q(DBG_recvLastSendAckedPacketID[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvLastSendAckedPacketID_reg[13] 
       (.C(clk333_250),
        .CE(recvLastSendAckedPacketID),
        .D(\recvPacketHeaderBuffer_reg[37]_0 ),
        .Q(DBG_recvLastSendAckedPacketID[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvLastSendAckedPacketID_reg[14] 
       (.C(clk333_250),
        .CE(recvLastSendAckedPacketID),
        .D(\recvPacketHeaderBuffer_reg[38]_0 ),
        .Q(DBG_recvLastSendAckedPacketID[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvLastSendAckedPacketID_reg[15] 
       (.C(clk333_250),
        .CE(recvLastSendAckedPacketID),
        .D(\recvPacketHeaderBuffer_reg[39]_0 ),
        .Q(DBG_recvLastSendAckedPacketID[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvLastSendAckedPacketID_reg[1] 
       (.C(clk333_250),
        .CE(recvLastSendAckedPacketID),
        .D(DBG_recvPacketData[11]),
        .Q(DBG_recvLastSendAckedPacketID[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvLastSendAckedPacketID_reg[2] 
       (.C(clk333_250),
        .CE(recvLastSendAckedPacketID),
        .D(\recvPacketHeaderBuffer_reg[26]_0 ),
        .Q(DBG_recvLastSendAckedPacketID[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvLastSendAckedPacketID_reg[3] 
       (.C(clk333_250),
        .CE(recvLastSendAckedPacketID),
        .D(\recvPacketHeaderBuffer_reg[27]_0 ),
        .Q(DBG_recvLastSendAckedPacketID[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvLastSendAckedPacketID_reg[4] 
       (.C(clk333_250),
        .CE(recvLastSendAckedPacketID),
        .D(\recvPacketHeaderBuffer_reg[28]_0 ),
        .Q(DBG_recvLastSendAckedPacketID[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvLastSendAckedPacketID_reg[5] 
       (.C(clk333_250),
        .CE(recvLastSendAckedPacketID),
        .D(\recvPacketHeaderBuffer_reg[29]_0 ),
        .Q(DBG_recvLastSendAckedPacketID[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvLastSendAckedPacketID_reg[6] 
       (.C(clk333_250),
        .CE(recvLastSendAckedPacketID),
        .D(\recvPacketHeaderBuffer_reg[30]_0 ),
        .Q(DBG_recvLastSendAckedPacketID[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvLastSendAckedPacketID_reg[7] 
       (.C(clk333_250),
        .CE(recvLastSendAckedPacketID),
        .D(\recvPacketHeaderBuffer_reg[31]_0 ),
        .Q(DBG_recvLastSendAckedPacketID[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvLastSendAckedPacketID_reg[8] 
       (.C(clk333_250),
        .CE(recvLastSendAckedPacketID),
        .D(\recvPacketHeaderBuffer_reg[32]_0 ),
        .Q(DBG_recvLastSendAckedPacketID[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvLastSendAckedPacketID_reg[9] 
       (.C(clk333_250),
        .CE(recvLastSendAckedPacketID),
        .D(\recvPacketHeaderBuffer_reg[33]_0 ),
        .Q(DBG_recvLastSendAckedPacketID[9]),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h0FE00000)) 
    \recvNextSubpacketOverflowBytes[23]_i_1 
       (.I0(DBG_recvCurrentSubpacketOffset[1]),
        .I1(DBG_recvCurrentSubpacketOffset[0]),
        .I2(DBG_recvCurrentSubpacketOffset[2]),
        .I3(DBG_recvCurrentSubpacketOffset[3]),
        .I4(\recvCurrentSubpacketOffset[3]_i_3_n_0 ),
        .O(recvNextSubpacketOverflowBytes));
  FDRE #(
    .INIT(1'b0)) 
    \recvNextSubpacketOverflowBytes_reg[0] 
       (.C(clk333_250),
        .CE(recvNextSubpacketOverflowBytes),
        .D(recv_pkt_data_rd_data[8]),
        .Q(\recvNextSubpacketOverflowBytes_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvNextSubpacketOverflowBytes_reg[10] 
       (.C(clk333_250),
        .CE(recvNextSubpacketOverflowBytes),
        .D(recv_pkt_data_rd_data[18]),
        .Q(\recvNextSubpacketOverflowBytes_reg_n_0_[10] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvNextSubpacketOverflowBytes_reg[11] 
       (.C(clk333_250),
        .CE(recvNextSubpacketOverflowBytes),
        .D(recv_pkt_data_rd_data[19]),
        .Q(\recvNextSubpacketOverflowBytes_reg_n_0_[11] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvNextSubpacketOverflowBytes_reg[12] 
       (.C(clk333_250),
        .CE(recvNextSubpacketOverflowBytes),
        .D(recv_pkt_data_rd_data[20]),
        .Q(\recvNextSubpacketOverflowBytes_reg_n_0_[12] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvNextSubpacketOverflowBytes_reg[13] 
       (.C(clk333_250),
        .CE(recvNextSubpacketOverflowBytes),
        .D(recv_pkt_data_rd_data[21]),
        .Q(\recvNextSubpacketOverflowBytes_reg_n_0_[13] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvNextSubpacketOverflowBytes_reg[14] 
       (.C(clk333_250),
        .CE(recvNextSubpacketOverflowBytes),
        .D(recv_pkt_data_rd_data[22]),
        .Q(\recvNextSubpacketOverflowBytes_reg_n_0_[14] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvNextSubpacketOverflowBytes_reg[15] 
       (.C(clk333_250),
        .CE(recvNextSubpacketOverflowBytes),
        .D(recv_pkt_data_rd_data[23]),
        .Q(\recvNextSubpacketOverflowBytes_reg_n_0_[15] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvNextSubpacketOverflowBytes_reg[16] 
       (.C(clk333_250),
        .CE(recvNextSubpacketOverflowBytes),
        .D(recv_pkt_data_rd_data[24]),
        .Q(\recvNextSubpacketOverflowBytes_reg_n_0_[16] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvNextSubpacketOverflowBytes_reg[17] 
       (.C(clk333_250),
        .CE(recvNextSubpacketOverflowBytes),
        .D(recv_pkt_data_rd_data[25]),
        .Q(\recvNextSubpacketOverflowBytes_reg_n_0_[17] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvNextSubpacketOverflowBytes_reg[18] 
       (.C(clk333_250),
        .CE(recvNextSubpacketOverflowBytes),
        .D(recv_pkt_data_rd_data[26]),
        .Q(\recvNextSubpacketOverflowBytes_reg_n_0_[18] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvNextSubpacketOverflowBytes_reg[19] 
       (.C(clk333_250),
        .CE(recvNextSubpacketOverflowBytes),
        .D(recv_pkt_data_rd_data[27]),
        .Q(\recvNextSubpacketOverflowBytes_reg_n_0_[19] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvNextSubpacketOverflowBytes_reg[1] 
       (.C(clk333_250),
        .CE(recvNextSubpacketOverflowBytes),
        .D(recv_pkt_data_rd_data[9]),
        .Q(\recvNextSubpacketOverflowBytes_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvNextSubpacketOverflowBytes_reg[20] 
       (.C(clk333_250),
        .CE(recvNextSubpacketOverflowBytes),
        .D(recv_pkt_data_rd_data[28]),
        .Q(\recvNextSubpacketOverflowBytes_reg_n_0_[20] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvNextSubpacketOverflowBytes_reg[21] 
       (.C(clk333_250),
        .CE(recvNextSubpacketOverflowBytes),
        .D(recv_pkt_data_rd_data[29]),
        .Q(\recvNextSubpacketOverflowBytes_reg_n_0_[21] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvNextSubpacketOverflowBytes_reg[22] 
       (.C(clk333_250),
        .CE(recvNextSubpacketOverflowBytes),
        .D(recv_pkt_data_rd_data[30]),
        .Q(\recvNextSubpacketOverflowBytes_reg_n_0_[22] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvNextSubpacketOverflowBytes_reg[23] 
       (.C(clk333_250),
        .CE(recvNextSubpacketOverflowBytes),
        .D(recv_pkt_data_rd_data[31]),
        .Q(\recvNextSubpacketOverflowBytes_reg_n_0_[23] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvNextSubpacketOverflowBytes_reg[2] 
       (.C(clk333_250),
        .CE(recvNextSubpacketOverflowBytes),
        .D(recv_pkt_data_rd_data[10]),
        .Q(\recvNextSubpacketOverflowBytes_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvNextSubpacketOverflowBytes_reg[3] 
       (.C(clk333_250),
        .CE(recvNextSubpacketOverflowBytes),
        .D(recv_pkt_data_rd_data[11]),
        .Q(\recvNextSubpacketOverflowBytes_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvNextSubpacketOverflowBytes_reg[4] 
       (.C(clk333_250),
        .CE(recvNextSubpacketOverflowBytes),
        .D(recv_pkt_data_rd_data[12]),
        .Q(\recvNextSubpacketOverflowBytes_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvNextSubpacketOverflowBytes_reg[5] 
       (.C(clk333_250),
        .CE(recvNextSubpacketOverflowBytes),
        .D(recv_pkt_data_rd_data[13]),
        .Q(\recvNextSubpacketOverflowBytes_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvNextSubpacketOverflowBytes_reg[6] 
       (.C(clk333_250),
        .CE(recvNextSubpacketOverflowBytes),
        .D(recv_pkt_data_rd_data[14]),
        .Q(\recvNextSubpacketOverflowBytes_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvNextSubpacketOverflowBytes_reg[7] 
       (.C(clk333_250),
        .CE(recvNextSubpacketOverflowBytes),
        .D(recv_pkt_data_rd_data[15]),
        .Q(\recvNextSubpacketOverflowBytes_reg_n_0_[7] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvNextSubpacketOverflowBytes_reg[8] 
       (.C(clk333_250),
        .CE(recvNextSubpacketOverflowBytes),
        .D(recv_pkt_data_rd_data[16]),
        .Q(\recvNextSubpacketOverflowBytes_reg_n_0_[8] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvNextSubpacketOverflowBytes_reg[9] 
       (.C(clk333_250),
        .CE(recvNextSubpacketOverflowBytes),
        .D(recv_pkt_data_rd_data[17]),
        .Q(\recvNextSubpacketOverflowBytes_reg_n_0_[9] ),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hAAAB0000)) 
    recvPacketAllValid_i_1
       (.I0(\recvPacketHeaderBuffer_reg[0]_0 ),
        .I1(\stat_recv_session_packets_valid[31]_i_4_n_0 ),
        .I2(\stat_recv_session_packets_valid[31]_i_5_n_0 ),
        .I3(\stat_recv_session_packets_valid[31]_i_6_n_0 ),
        .I4(\stat_recv_session_packets_valid[31]_i_3_n_0 ),
        .O(recvPacketAllValid_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    recvPacketAllValid_reg
       (.C(clk333_250),
        .CE(\DBG_recvHeaderChecksum[7]_i_1_n_0 ),
        .D(recvPacketAllValid_i_1_n_0),
        .Q(recvPacketAllValid_reg_n_0),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair134" *) 
  LUT3 #(
    .INIT(8'h04)) 
    recvPacketCanProcess_i_1
       (.I0(\recvPacketHeaderBuffer_reg[0]_0 ),
        .I1(\stat_recv_session_packets_valid[31]_i_3_n_0 ),
        .I2(validPacketsFIFO_prog_full),
        .O(recvPacketCanProcess_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    recvPacketCanProcess_reg
       (.C(clk333_250),
        .CE(\DBG_recvHeaderChecksum[7]_i_1_n_0 ),
        .D(recvPacketCanProcess_i_1_n_0),
        .Q(recvPacketCanProcess),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h00AB)) 
    \recvPacketHeaderBuffer[31]_i_1 
       (.I0(\recvPacketHeaderBuffer[31]_i_3_n_0 ),
        .I1(currentState__0[2]),
        .I2(currentState__0[0]),
        .I3(sendHasRepliedSuccessfulConnection),
        .O(\recvPacketHeaderBuffer[31]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAAABABAB)) 
    \recvPacketHeaderBuffer[31]_i_2 
       (.I0(\recvPacketHeaderBuffer[31]_i_3_n_0 ),
        .I1(currentState__0[2]),
        .I2(currentState__0[0]),
        .I3(\recvPacketHeaderBuffer[31]_i_4_n_0 ),
        .I4(sendHasRepliedSuccessfulConnection),
        .O(\recvPacketHeaderBuffer[31]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000200000000)) 
    \recvPacketHeaderBuffer[31]_i_3 
       (.I0(recvParseState__0[0]),
        .I1(recv_pkt_header_empty),
        .I2(recv_pkt_data_empty),
        .I3(recvParseState__0[2]),
        .I4(recvParseState__0[1]),
        .I5(\recvParseState[2]__0_i_3_n_0 ),
        .O(\recvPacketHeaderBuffer[31]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFEFF)) 
    \recvPacketHeaderBuffer[31]_i_4 
       (.I0(recvSendReplyPacket_reg_0),
        .I1(recvPumpFIFO_reg_n_0),
        .I2(DBG_RecvFIFOState[1]),
        .I3(DBG_RecvFIFOState[0]),
        .I4(recv_pkt_data_empty),
        .I5(recv_pkt_header_empty),
        .O(\recvPacketHeaderBuffer[31]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h01)) 
    \recvPacketHeaderBuffer[63]_i_1 
       (.I0(currentState__0[0]),
        .I1(sendHasRepliedSuccessfulConnection),
        .I2(currentState__0[2]),
        .O(\recvPacketHeaderBuffer[63]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00C0000013D31313)) 
    \recvPacketHeaderBuffer[63]_i_2 
       (.I0(\recvPacketHeaderBuffer[63]_i_3_n_0 ),
        .I1(currentState__0[0]),
        .I2(sendHasRepliedSuccessfulConnection),
        .I3(recvPumpFIFO_reg_n_0),
        .I4(\recvPacketHeaderBuffer[63]_i_4_n_0 ),
        .I5(currentState__0[2]),
        .O(\recvPacketHeaderBuffer[63]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFEFFFF)) 
    \recvPacketHeaderBuffer[63]_i_3 
       (.I0(recvPumpFIFO_reg_n_0),
        .I1(recvSendReplyPacket_reg_0),
        .I2(recv_pkt_header_empty),
        .I3(recv_pkt_data_empty),
        .I4(DBG_RecvFIFOState[1]),
        .I5(DBG_RecvFIFOState[0]),
        .O(\recvPacketHeaderBuffer[63]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT5 #(
    .INIT(32'h00000010)) 
    \recvPacketHeaderBuffer[63]_i_4 
       (.I0(recvParseState__0[2]),
        .I1(recvParseState__0[0]),
        .I2(recvParseState__0[1]),
        .I3(recv_pkt_header_empty),
        .I4(recv_pkt_data_empty),
        .O(\recvPacketHeaderBuffer[63]_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketHeaderBuffer_reg[0] 
       (.C(clk333_250),
        .CE(\recvPacketHeaderBuffer[31]_i_2_n_0 ),
        .D(recv_pkt_data_rd_data[0]),
        .Q(\recvPacketHeaderBuffer_reg[0]_0 ),
        .R(\recvPacketHeaderBuffer[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketHeaderBuffer_reg[10] 
       (.C(clk333_250),
        .CE(\recvPacketHeaderBuffer[31]_i_2_n_0 ),
        .D(recv_pkt_data_rd_data[10]),
        .Q(\recvPacketHeaderBuffer_reg[10]_0 ),
        .R(\recvPacketHeaderBuffer[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketHeaderBuffer_reg[11] 
       (.C(clk333_250),
        .CE(\recvPacketHeaderBuffer[31]_i_2_n_0 ),
        .D(recv_pkt_data_rd_data[11]),
        .Q(DBG_recvPacketData[2]),
        .R(\recvPacketHeaderBuffer[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketHeaderBuffer_reg[12] 
       (.C(clk333_250),
        .CE(\recvPacketHeaderBuffer[31]_i_2_n_0 ),
        .D(recv_pkt_data_rd_data[12]),
        .Q(DBG_recvPacketData[3]),
        .R(\recvPacketHeaderBuffer[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketHeaderBuffer_reg[13] 
       (.C(clk333_250),
        .CE(\recvPacketHeaderBuffer[31]_i_2_n_0 ),
        .D(recv_pkt_data_rd_data[13]),
        .Q(DBG_recvPacketData[4]),
        .R(\recvPacketHeaderBuffer[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketHeaderBuffer_reg[14] 
       (.C(clk333_250),
        .CE(\recvPacketHeaderBuffer[31]_i_2_n_0 ),
        .D(recv_pkt_data_rd_data[14]),
        .Q(\recvPacketHeaderBuffer_reg[14]_0 ),
        .R(\recvPacketHeaderBuffer[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketHeaderBuffer_reg[15] 
       (.C(clk333_250),
        .CE(\recvPacketHeaderBuffer[31]_i_2_n_0 ),
        .D(recv_pkt_data_rd_data[15]),
        .Q(DBG_recvPacketData[5]),
        .R(\recvPacketHeaderBuffer[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketHeaderBuffer_reg[16] 
       (.C(clk333_250),
        .CE(\recvPacketHeaderBuffer[31]_i_2_n_0 ),
        .D(recv_pkt_data_rd_data[16]),
        .Q(\recvPacketHeaderBuffer_reg[16]_0 ),
        .R(\recvPacketHeaderBuffer[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketHeaderBuffer_reg[17] 
       (.C(clk333_250),
        .CE(\recvPacketHeaderBuffer[31]_i_2_n_0 ),
        .D(recv_pkt_data_rd_data[17]),
        .Q(\recvPacketHeaderBuffer_reg[17]_0 ),
        .R(\recvPacketHeaderBuffer[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketHeaderBuffer_reg[18] 
       (.C(clk333_250),
        .CE(\recvPacketHeaderBuffer[31]_i_2_n_0 ),
        .D(recv_pkt_data_rd_data[18]),
        .Q(DBG_recvPacketData[6]),
        .R(\recvPacketHeaderBuffer[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketHeaderBuffer_reg[19] 
       (.C(clk333_250),
        .CE(\recvPacketHeaderBuffer[31]_i_2_n_0 ),
        .D(recv_pkt_data_rd_data[19]),
        .Q(\recvPacketHeaderBuffer_reg[19]_0 ),
        .R(\recvPacketHeaderBuffer[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketHeaderBuffer_reg[1] 
       (.C(clk333_250),
        .CE(\recvPacketHeaderBuffer[31]_i_2_n_0 ),
        .D(recv_pkt_data_rd_data[1]),
        .Q(\recvPacketHeaderBuffer_reg[1]_0 ),
        .R(\recvPacketHeaderBuffer[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketHeaderBuffer_reg[20] 
       (.C(clk333_250),
        .CE(\recvPacketHeaderBuffer[31]_i_2_n_0 ),
        .D(recv_pkt_data_rd_data[20]),
        .Q(DBG_recvPacketData[7]),
        .R(\recvPacketHeaderBuffer[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketHeaderBuffer_reg[21] 
       (.C(clk333_250),
        .CE(\recvPacketHeaderBuffer[31]_i_2_n_0 ),
        .D(recv_pkt_data_rd_data[21]),
        .Q(DBG_recvPacketData[8]),
        .R(\recvPacketHeaderBuffer[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketHeaderBuffer_reg[22] 
       (.C(clk333_250),
        .CE(\recvPacketHeaderBuffer[31]_i_2_n_0 ),
        .D(recv_pkt_data_rd_data[22]),
        .Q(\recvPacketHeaderBuffer_reg[22]_0 ),
        .R(\recvPacketHeaderBuffer[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketHeaderBuffer_reg[23] 
       (.C(clk333_250),
        .CE(\recvPacketHeaderBuffer[31]_i_2_n_0 ),
        .D(recv_pkt_data_rd_data[23]),
        .Q(DBG_recvPacketData[9]),
        .R(\recvPacketHeaderBuffer[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketHeaderBuffer_reg[24] 
       (.C(clk333_250),
        .CE(\recvPacketHeaderBuffer[31]_i_2_n_0 ),
        .D(recv_pkt_data_rd_data[24]),
        .Q(DBG_recvPacketData[10]),
        .R(\recvPacketHeaderBuffer[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketHeaderBuffer_reg[25] 
       (.C(clk333_250),
        .CE(\recvPacketHeaderBuffer[31]_i_2_n_0 ),
        .D(recv_pkt_data_rd_data[25]),
        .Q(DBG_recvPacketData[11]),
        .R(\recvPacketHeaderBuffer[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketHeaderBuffer_reg[26] 
       (.C(clk333_250),
        .CE(\recvPacketHeaderBuffer[31]_i_2_n_0 ),
        .D(recv_pkt_data_rd_data[26]),
        .Q(\recvPacketHeaderBuffer_reg[26]_0 ),
        .R(\recvPacketHeaderBuffer[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketHeaderBuffer_reg[27] 
       (.C(clk333_250),
        .CE(\recvPacketHeaderBuffer[31]_i_2_n_0 ),
        .D(recv_pkt_data_rd_data[27]),
        .Q(\recvPacketHeaderBuffer_reg[27]_0 ),
        .R(\recvPacketHeaderBuffer[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketHeaderBuffer_reg[28] 
       (.C(clk333_250),
        .CE(\recvPacketHeaderBuffer[31]_i_2_n_0 ),
        .D(recv_pkt_data_rd_data[28]),
        .Q(\recvPacketHeaderBuffer_reg[28]_0 ),
        .R(\recvPacketHeaderBuffer[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketHeaderBuffer_reg[29] 
       (.C(clk333_250),
        .CE(\recvPacketHeaderBuffer[31]_i_2_n_0 ),
        .D(recv_pkt_data_rd_data[29]),
        .Q(\recvPacketHeaderBuffer_reg[29]_0 ),
        .R(\recvPacketHeaderBuffer[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketHeaderBuffer_reg[2] 
       (.C(clk333_250),
        .CE(\recvPacketHeaderBuffer[31]_i_2_n_0 ),
        .D(recv_pkt_data_rd_data[2]),
        .Q(\recvPacketHeaderBuffer_reg[2]_0 ),
        .R(\recvPacketHeaderBuffer[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketHeaderBuffer_reg[30] 
       (.C(clk333_250),
        .CE(\recvPacketHeaderBuffer[31]_i_2_n_0 ),
        .D(recv_pkt_data_rd_data[30]),
        .Q(\recvPacketHeaderBuffer_reg[30]_0 ),
        .R(\recvPacketHeaderBuffer[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketHeaderBuffer_reg[31] 
       (.C(clk333_250),
        .CE(\recvPacketHeaderBuffer[31]_i_2_n_0 ),
        .D(recv_pkt_data_rd_data[31]),
        .Q(\recvPacketHeaderBuffer_reg[31]_0 ),
        .R(\recvPacketHeaderBuffer[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketHeaderBuffer_reg[32] 
       (.C(clk333_250),
        .CE(\recvPacketHeaderBuffer[63]_i_2_n_0 ),
        .D(recv_pkt_data_rd_data[0]),
        .Q(\recvPacketHeaderBuffer_reg[32]_0 ),
        .R(\recvPacketHeaderBuffer[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketHeaderBuffer_reg[33] 
       (.C(clk333_250),
        .CE(\recvPacketHeaderBuffer[63]_i_2_n_0 ),
        .D(recv_pkt_data_rd_data[1]),
        .Q(\recvPacketHeaderBuffer_reg[33]_0 ),
        .R(\recvPacketHeaderBuffer[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketHeaderBuffer_reg[34] 
       (.C(clk333_250),
        .CE(\recvPacketHeaderBuffer[63]_i_2_n_0 ),
        .D(recv_pkt_data_rd_data[2]),
        .Q(\recvPacketHeaderBuffer_reg[34]_0 ),
        .R(\recvPacketHeaderBuffer[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketHeaderBuffer_reg[35] 
       (.C(clk333_250),
        .CE(\recvPacketHeaderBuffer[63]_i_2_n_0 ),
        .D(recv_pkt_data_rd_data[3]),
        .Q(\recvPacketHeaderBuffer_reg[35]_0 ),
        .R(\recvPacketHeaderBuffer[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketHeaderBuffer_reg[36] 
       (.C(clk333_250),
        .CE(\recvPacketHeaderBuffer[63]_i_2_n_0 ),
        .D(recv_pkt_data_rd_data[4]),
        .Q(\recvPacketHeaderBuffer_reg[36]_0 ),
        .R(\recvPacketHeaderBuffer[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketHeaderBuffer_reg[37] 
       (.C(clk333_250),
        .CE(\recvPacketHeaderBuffer[63]_i_2_n_0 ),
        .D(recv_pkt_data_rd_data[5]),
        .Q(\recvPacketHeaderBuffer_reg[37]_0 ),
        .R(\recvPacketHeaderBuffer[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketHeaderBuffer_reg[38] 
       (.C(clk333_250),
        .CE(\recvPacketHeaderBuffer[63]_i_2_n_0 ),
        .D(recv_pkt_data_rd_data[6]),
        .Q(\recvPacketHeaderBuffer_reg[38]_0 ),
        .R(\recvPacketHeaderBuffer[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketHeaderBuffer_reg[39] 
       (.C(clk333_250),
        .CE(\recvPacketHeaderBuffer[63]_i_2_n_0 ),
        .D(recv_pkt_data_rd_data[7]),
        .Q(\recvPacketHeaderBuffer_reg[39]_0 ),
        .R(\recvPacketHeaderBuffer[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketHeaderBuffer_reg[3] 
       (.C(clk333_250),
        .CE(\recvPacketHeaderBuffer[31]_i_2_n_0 ),
        .D(recv_pkt_data_rd_data[3]),
        .Q(\recvPacketHeaderBuffer_reg[3]_0 ),
        .R(\recvPacketHeaderBuffer[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketHeaderBuffer_reg[40] 
       (.C(clk333_250),
        .CE(\recvPacketHeaderBuffer[63]_i_2_n_0 ),
        .D(recv_pkt_data_rd_data[8]),
        .Q(\recvPacketHeaderBuffer_reg[40]_0 ),
        .R(\recvPacketHeaderBuffer[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketHeaderBuffer_reg[41] 
       (.C(clk333_250),
        .CE(\recvPacketHeaderBuffer[63]_i_2_n_0 ),
        .D(recv_pkt_data_rd_data[9]),
        .Q(\recvPacketHeaderBuffer_reg[41]_0 ),
        .R(\recvPacketHeaderBuffer[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketHeaderBuffer_reg[42] 
       (.C(clk333_250),
        .CE(\recvPacketHeaderBuffer[63]_i_2_n_0 ),
        .D(recv_pkt_data_rd_data[10]),
        .Q(\recvPacketHeaderBuffer_reg[42]_0 ),
        .R(\recvPacketHeaderBuffer[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketHeaderBuffer_reg[43] 
       (.C(clk333_250),
        .CE(\recvPacketHeaderBuffer[63]_i_2_n_0 ),
        .D(recv_pkt_data_rd_data[11]),
        .Q(\recvPacketHeaderBuffer_reg[43]_0 ),
        .R(\recvPacketHeaderBuffer[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketHeaderBuffer_reg[44] 
       (.C(clk333_250),
        .CE(\recvPacketHeaderBuffer[63]_i_2_n_0 ),
        .D(recv_pkt_data_rd_data[12]),
        .Q(\recvPacketHeaderBuffer_reg[44]_0 ),
        .R(\recvPacketHeaderBuffer[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketHeaderBuffer_reg[45] 
       (.C(clk333_250),
        .CE(\recvPacketHeaderBuffer[63]_i_2_n_0 ),
        .D(recv_pkt_data_rd_data[13]),
        .Q(\recvPacketHeaderBuffer_reg[45]_0 ),
        .R(\recvPacketHeaderBuffer[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketHeaderBuffer_reg[46] 
       (.C(clk333_250),
        .CE(\recvPacketHeaderBuffer[63]_i_2_n_0 ),
        .D(recv_pkt_data_rd_data[14]),
        .Q(\recvPacketHeaderBuffer_reg[46]_0 ),
        .R(\recvPacketHeaderBuffer[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketHeaderBuffer_reg[47] 
       (.C(clk333_250),
        .CE(\recvPacketHeaderBuffer[63]_i_2_n_0 ),
        .D(recv_pkt_data_rd_data[15]),
        .Q(\recvPacketHeaderBuffer_reg[47]_0 ),
        .R(\recvPacketHeaderBuffer[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketHeaderBuffer_reg[48] 
       (.C(clk333_250),
        .CE(\recvPacketHeaderBuffer[63]_i_2_n_0 ),
        .D(recv_pkt_data_rd_data[16]),
        .Q(\recvPacketHeaderBuffer_reg[48]_0 ),
        .R(\recvPacketHeaderBuffer[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketHeaderBuffer_reg[49] 
       (.C(clk333_250),
        .CE(\recvPacketHeaderBuffer[63]_i_2_n_0 ),
        .D(recv_pkt_data_rd_data[17]),
        .Q(\recvPacketHeaderBuffer_reg[49]_0 ),
        .R(\recvPacketHeaderBuffer[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketHeaderBuffer_reg[4] 
       (.C(clk333_250),
        .CE(\recvPacketHeaderBuffer[31]_i_2_n_0 ),
        .D(recv_pkt_data_rd_data[4]),
        .Q(\recvPacketHeaderBuffer_reg[4]_0 ),
        .R(\recvPacketHeaderBuffer[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketHeaderBuffer_reg[50] 
       (.C(clk333_250),
        .CE(\recvPacketHeaderBuffer[63]_i_2_n_0 ),
        .D(recv_pkt_data_rd_data[18]),
        .Q(\recvPacketHeaderBuffer_reg[50]_0 ),
        .R(\recvPacketHeaderBuffer[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketHeaderBuffer_reg[51] 
       (.C(clk333_250),
        .CE(\recvPacketHeaderBuffer[63]_i_2_n_0 ),
        .D(recv_pkt_data_rd_data[19]),
        .Q(\recvPacketHeaderBuffer_reg[51]_0 ),
        .R(\recvPacketHeaderBuffer[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketHeaderBuffer_reg[52] 
       (.C(clk333_250),
        .CE(\recvPacketHeaderBuffer[63]_i_2_n_0 ),
        .D(recv_pkt_data_rd_data[20]),
        .Q(\recvPacketHeaderBuffer_reg[52]_0 ),
        .R(\recvPacketHeaderBuffer[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketHeaderBuffer_reg[53] 
       (.C(clk333_250),
        .CE(\recvPacketHeaderBuffer[63]_i_2_n_0 ),
        .D(recv_pkt_data_rd_data[21]),
        .Q(\recvPacketHeaderBuffer_reg[53]_0 ),
        .R(\recvPacketHeaderBuffer[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketHeaderBuffer_reg[54] 
       (.C(clk333_250),
        .CE(\recvPacketHeaderBuffer[63]_i_2_n_0 ),
        .D(recv_pkt_data_rd_data[22]),
        .Q(\recvPacketHeaderBuffer_reg[54]_0 ),
        .R(\recvPacketHeaderBuffer[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketHeaderBuffer_reg[55] 
       (.C(clk333_250),
        .CE(\recvPacketHeaderBuffer[63]_i_2_n_0 ),
        .D(recv_pkt_data_rd_data[23]),
        .Q(\recvPacketHeaderBuffer_reg[55]_0 ),
        .R(\recvPacketHeaderBuffer[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketHeaderBuffer_reg[56] 
       (.C(clk333_250),
        .CE(\recvPacketHeaderBuffer[63]_i_2_n_0 ),
        .D(recv_pkt_data_rd_data[24]),
        .Q(\recvPacketHeaderBuffer_reg[56]_0 ),
        .R(\recvPacketHeaderBuffer[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketHeaderBuffer_reg[57] 
       (.C(clk333_250),
        .CE(\recvPacketHeaderBuffer[63]_i_2_n_0 ),
        .D(recv_pkt_data_rd_data[25]),
        .Q(\recvPacketHeaderBuffer_reg[57]_0 ),
        .R(\recvPacketHeaderBuffer[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketHeaderBuffer_reg[58] 
       (.C(clk333_250),
        .CE(\recvPacketHeaderBuffer[63]_i_2_n_0 ),
        .D(recv_pkt_data_rd_data[26]),
        .Q(\recvPacketHeaderBuffer_reg[58]_0 ),
        .R(\recvPacketHeaderBuffer[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketHeaderBuffer_reg[59] 
       (.C(clk333_250),
        .CE(\recvPacketHeaderBuffer[63]_i_2_n_0 ),
        .D(recv_pkt_data_rd_data[27]),
        .Q(\recvPacketHeaderBuffer_reg[59]_0 ),
        .R(\recvPacketHeaderBuffer[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketHeaderBuffer_reg[5] 
       (.C(clk333_250),
        .CE(\recvPacketHeaderBuffer[31]_i_2_n_0 ),
        .D(recv_pkt_data_rd_data[5]),
        .Q(\recvPacketHeaderBuffer_reg[5]_0 ),
        .R(\recvPacketHeaderBuffer[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketHeaderBuffer_reg[60] 
       (.C(clk333_250),
        .CE(\recvPacketHeaderBuffer[63]_i_2_n_0 ),
        .D(recv_pkt_data_rd_data[28]),
        .Q(\recvPacketHeaderBuffer_reg[60]_0 ),
        .R(\recvPacketHeaderBuffer[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketHeaderBuffer_reg[61] 
       (.C(clk333_250),
        .CE(\recvPacketHeaderBuffer[63]_i_2_n_0 ),
        .D(recv_pkt_data_rd_data[29]),
        .Q(\recvPacketHeaderBuffer_reg[61]_0 ),
        .R(\recvPacketHeaderBuffer[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketHeaderBuffer_reg[62] 
       (.C(clk333_250),
        .CE(\recvPacketHeaderBuffer[63]_i_2_n_0 ),
        .D(recv_pkt_data_rd_data[30]),
        .Q(\recvPacketHeaderBuffer_reg[62]_0 ),
        .R(\recvPacketHeaderBuffer[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketHeaderBuffer_reg[63] 
       (.C(clk333_250),
        .CE(\recvPacketHeaderBuffer[63]_i_2_n_0 ),
        .D(recv_pkt_data_rd_data[31]),
        .Q(\recvPacketHeaderBuffer_reg[63]_0 ),
        .R(\recvPacketHeaderBuffer[63]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketHeaderBuffer_reg[6] 
       (.C(clk333_250),
        .CE(\recvPacketHeaderBuffer[31]_i_2_n_0 ),
        .D(recv_pkt_data_rd_data[6]),
        .Q(DBG_recvPacketData[0]),
        .R(\recvPacketHeaderBuffer[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketHeaderBuffer_reg[7] 
       (.C(clk333_250),
        .CE(\recvPacketHeaderBuffer[31]_i_2_n_0 ),
        .D(recv_pkt_data_rd_data[7]),
        .Q(\recvPacketHeaderBuffer_reg[7]_0 ),
        .R(\recvPacketHeaderBuffer[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketHeaderBuffer_reg[8] 
       (.C(clk333_250),
        .CE(\recvPacketHeaderBuffer[31]_i_2_n_0 ),
        .D(recv_pkt_data_rd_data[8]),
        .Q(DBG_recvPacketData[1]),
        .R(\recvPacketHeaderBuffer[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketHeaderBuffer_reg[9] 
       (.C(clk333_250),
        .CE(\recvPacketHeaderBuffer[31]_i_2_n_0 ),
        .D(recv_pkt_data_rd_data[9]),
        .Q(\recvPacketHeaderBuffer_reg[9]_0 ),
        .R(\recvPacketHeaderBuffer[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair101" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    \recvPacketSessionValid[0]_i_1 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(recvParseState__0[1]),
        .I2(\stat_recv_session_packets_valid[31]_i_3_n_0 ),
        .I3(\stat_recv_session_packets_valid[31]_i_4_n_0 ),
        .O(recvPacketSessionValid[0]));
  (* SOFT_HLUTNM = "soft_lutpair100" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    \recvPacketSessionValid[1]_i_1 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(recvParseState__0[1]),
        .I2(\stat_recv_session_packets_valid[31]_i_3_n_0 ),
        .I3(\stat_recv_session_packets_valid[31]_i_5_n_0 ),
        .O(recvPacketSessionValid[1]));
  LUT6 #(
    .INIT(64'h20AAAAAAAAAAAAAA)) 
    \recvPacketSessionValid[2]_i_1 
       (.I0(\recvPacketSessionValid[3]_i_2_n_0 ),
        .I1(sendHasRepliedSuccessfulConnection),
        .I2(\currentState[0]_i_1_n_0 ),
        .I3(recvParseState__0[1]),
        .I4(\recvPacketHeaderBuffer_reg[0]_0 ),
        .I5(\stat_recv_session_packets_valid[31]_i_3_n_0 ),
        .O(\recvPacketSessionValid[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair100" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    \recvPacketSessionValid[2]_i_2 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(recvParseState__0[1]),
        .I2(\stat_recv_session_packets_valid[31]_i_3_n_0 ),
        .I3(\stat_recv_session_packets_valid[31]_i_6_n_0 ),
        .O(recvPacketSessionValid[2]));
  LUT5 #(
    .INIT(32'h80FF8000)) 
    \recvPacketSessionValid[3]_i_1 
       (.I0(\stat_recv_session_packets_valid[31]_i_3_n_0 ),
        .I1(recvParseState__0[1]),
        .I2(sendHasRepliedSuccessfulConnection),
        .I3(\recvPacketSessionValid[3]_i_2_n_0 ),
        .I4(DBG_recvValid_Session[3]),
        .O(\recvPacketSessionValid[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAABFAAAAAAAAAA)) 
    \recvPacketSessionValid[3]_i_2 
       (.I0(\recvCurrentSubpacketBuffer[71]_i_3_n_0 ),
        .I1(recvParseState__0[1]),
        .I2(recv_pkt_header_empty),
        .I3(recvParseState__0[0]),
        .I4(recvParseState__0[2]),
        .I5(\recvParseState[2]__0_i_3_n_0 ),
        .O(\recvPacketSessionValid[3]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketSessionValid_reg[0] 
       (.C(clk333_250),
        .CE(\recvPacketSessionValid[2]_i_1_n_0 ),
        .D(recvPacketSessionValid[0]),
        .Q(DBG_recvValid_Session[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketSessionValid_reg[1] 
       (.C(clk333_250),
        .CE(\recvPacketSessionValid[2]_i_1_n_0 ),
        .D(recvPacketSessionValid[1]),
        .Q(DBG_recvValid_Session[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketSessionValid_reg[2] 
       (.C(clk333_250),
        .CE(\recvPacketSessionValid[2]_i_1_n_0 ),
        .D(recvPacketSessionValid[2]),
        .Q(DBG_recvValid_Session[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvPacketSessionValid_reg[3] 
       (.C(clk333_250),
        .CE(1'b1),
        .D(\recvPacketSessionValid[3]_i_1_n_0 ),
        .Q(DBG_recvValid_Session[3]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair135" *) 
  LUT3 #(
    .INIT(8'h0D)) 
    \recvParseState[0]__0_i_1 
       (.I0(DBG_RecvSessionParseState[2]),
        .I1(\recvParseState[2]__0_i_7_n_0 ),
        .I2(DBG_RecvSessionParseState[0]),
        .O(\recvParseState[0]__0_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair135" *) 
  LUT3 #(
    .INIT(8'h31)) 
    \recvParseState[0]_i_1 
       (.I0(recvParseState__0[2]),
        .I1(recvParseState__0[0]),
        .I2(\recvParseState[2]__0_i_7_n_0 ),
        .O(recvParseState__1[0]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT5 #(
    .INIT(32'h000FFF20)) 
    \recvParseState[1]__0_i_1 
       (.I0(recvSessionDisconnectSignal_reg_n_0),
        .I1(\recvParseState[2]__0_i_7_n_0 ),
        .I2(DBG_RecvSessionParseState[2]),
        .I3(DBG_RecvSessionParseState[1]),
        .I4(DBG_RecvSessionParseState[0]),
        .O(\recvParseState[1]__0_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT5 #(
    .INIT(32'h000FFF20)) 
    \recvParseState[1]_i_1 
       (.I0(recvSessionDisconnectSignal_reg_n_0),
        .I1(\recvParseState[2]__0_i_7_n_0 ),
        .I2(recvParseState__0[2]),
        .I3(recvParseState__0[1]),
        .I4(recvParseState__0[0]),
        .O(recvParseState__1[1]));
  LUT6 #(
    .INIT(64'h88888A888A8A8A8A)) 
    \recvParseState[2]__0_i_1 
       (.I0(\recvParseState[2]__0_i_3_n_0 ),
        .I1(\recvParseState[2]__0_i_4_n_0 ),
        .I2(\recvParseState[2]__0_i_5_n_0 ),
        .I3(\recvParseState[2]__0_i_6_n_0 ),
        .I4(recv_pkt_data_empty),
        .I5(\recvParseState[2]__0_i_7_n_0 ),
        .O(recvParseState));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT5 #(
    .INIT(32'hB8B8B8A8)) 
    \recvParseState[2]__0_i_2 
       (.I0(DBG_RecvSessionParseState[0]),
        .I1(DBG_RecvSessionParseState[1]),
        .I2(DBG_RecvSessionParseState[2]),
        .I3(recvSessionDisconnectSignal_reg_n_0),
        .I4(\recvParseState[2]__0_i_7_n_0 ),
        .O(\recvParseState[2]__0_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \recvParseState[2]__0_i_3 
       (.I0(recvPumpFIFO_reg_n_0),
        .I1(sendHasRepliedSuccessfulConnection),
        .I2(currentState__0[0]),
        .O(\recvParseState[2]__0_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT5 #(
    .INIT(32'h88AB888B)) 
    \recvParseState[2]__0_i_4 
       (.I0(recvParseState__0[0]),
        .I1(recvParseState__0[2]),
        .I2(recv_pkt_data_empty),
        .I3(recv_pkt_header_empty),
        .I4(recvParseState__0[1]),
        .O(\recvParseState[2]__0_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair132" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \recvParseState[2]__0_i_5 
       (.I0(recvParseState__0[1]),
        .I1(recvParseState__0[2]),
        .O(\recvParseState[2]__0_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair102" *) 
  LUT4 #(
    .INIT(16'h6662)) 
    \recvParseState[2]__0_i_6 
       (.I0(DBG_recvCurrentSubpacketOffset[3]),
        .I1(DBG_recvCurrentSubpacketOffset[2]),
        .I2(DBG_recvCurrentSubpacketOffset[0]),
        .I3(DBG_recvCurrentSubpacketOffset[1]),
        .O(\recvParseState[2]__0_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF6FF6)) 
    \recvParseState[2]__0_i_7 
       (.I0(DBG_recvCurrentSubpacketIndex[6]),
        .I1(recvCurrentSubpacketCount[6]),
        .I2(DBG_recvCurrentSubpacketIndex[7]),
        .I3(recvCurrentSubpacketCount[7]),
        .I4(\recvParseState[2]__0_i_8_n_0 ),
        .I5(\recvParseState[2]__0_i_9_n_0 ),
        .O(\recvParseState[2]__0_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h6FF6FFFFFFFF6FF6)) 
    \recvParseState[2]__0_i_8 
       (.I0(recvCurrentSubpacketCount[0]),
        .I1(DBG_recvCurrentSubpacketIndex[0]),
        .I2(DBG_recvCurrentSubpacketIndex[2]),
        .I3(recvCurrentSubpacketCount[2]),
        .I4(DBG_recvCurrentSubpacketIndex[1]),
        .I5(recvCurrentSubpacketCount[1]),
        .O(\recvParseState[2]__0_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h6FF6FFFFFFFF6FF6)) 
    \recvParseState[2]__0_i_9 
       (.I0(recvCurrentSubpacketCount[3]),
        .I1(DBG_recvCurrentSubpacketIndex[3]),
        .I2(DBG_recvCurrentSubpacketIndex[4]),
        .I3(recvCurrentSubpacketCount[4]),
        .I4(DBG_recvCurrentSubpacketIndex[5]),
        .I5(recvCurrentSubpacketCount[5]),
        .O(\recvParseState[2]__0_i_9_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT5 #(
    .INIT(32'hFFF000E0)) 
    \recvParseState[2]_i_1 
       (.I0(recvSessionDisconnectSignal_reg_n_0),
        .I1(\recvParseState[2]__0_i_7_n_0 ),
        .I2(recvParseState__0[2]),
        .I3(recvParseState__0[1]),
        .I4(recvParseState__0[0]),
        .O(recvParseState__1[2]));
  (* FSM_ENCODED_STATES = "recvparsesessiondword0:001,recvparsesessiondword1:010,recvparsesessiondword2:011,recvparsesessionremainingdata:100,recvparsesessionpushnewsubpacket:101,recvparsesessionidle:000,recvparsesessionsafetoreset:110" *) 
  (* FSM_ENCODING = "user_encoding" *) 
  FDRE #(
    .INIT(1'b0)) 
    \recvParseState_reg[0] 
       (.C(clk333_250),
        .CE(recvParseState),
        .D(recvParseState__1[0]),
        .Q(recvParseState__0[0]),
        .R(1'b0));
  (* FSM_ENCODING = "user_encoding" *) 
  FDRE #(
    .INIT(1'b0)) 
    \recvParseState_reg[0]__0 
       (.C(clk333_250),
        .CE(recvParseState),
        .D(\recvParseState[0]__0_i_1_n_0 ),
        .Q(DBG_RecvSessionParseState[0]),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "recvparsesessiondword0:001,recvparsesessiondword1:010,recvparsesessiondword2:011,recvparsesessionremainingdata:100,recvparsesessionpushnewsubpacket:101,recvparsesessionidle:000,recvparsesessionsafetoreset:110" *) 
  (* FSM_ENCODING = "user_encoding" *) 
  FDRE #(
    .INIT(1'b0)) 
    \recvParseState_reg[1] 
       (.C(clk333_250),
        .CE(recvParseState),
        .D(recvParseState__1[1]),
        .Q(recvParseState__0[1]),
        .R(1'b0));
  (* FSM_ENCODING = "user_encoding" *) 
  FDRE #(
    .INIT(1'b0)) 
    \recvParseState_reg[1]__0 
       (.C(clk333_250),
        .CE(recvParseState),
        .D(\recvParseState[1]__0_i_1_n_0 ),
        .Q(DBG_RecvSessionParseState[1]),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "recvparsesessiondword0:001,recvparsesessiondword1:010,recvparsesessiondword2:011,recvparsesessionremainingdata:100,recvparsesessionpushnewsubpacket:101,recvparsesessionidle:000,recvparsesessionsafetoreset:110" *) 
  (* FSM_ENCODING = "user_encoding" *) 
  FDRE #(
    .INIT(1'b0)) 
    \recvParseState_reg[2] 
       (.C(clk333_250),
        .CE(recvParseState),
        .D(recvParseState__1[2]),
        .Q(recvParseState__0[2]),
        .R(1'b0));
  (* FSM_ENCODING = "user_encoding" *) 
  FDRE #(
    .INIT(1'b0)) 
    \recvParseState_reg[2]__0 
       (.C(clk333_250),
        .CE(recvParseState),
        .D(\recvParseState[2]__0_i_2_n_0 ),
        .Q(DBG_RecvSessionParseState[2]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hAAAAAAAAAA8ACCCC)) 
    recvPumpFIFO_i_1
       (.I0(recvPumpFIFO),
        .I1(recvPumpFIFO_reg_n_0),
        .I2(sendHasRepliedSuccessfulConnection),
        .I3(recvPumpFIFO_i_3_n_0),
        .I4(\currentState[0]_i_1_n_0 ),
        .I5(recvPumpFIFO_i_4_n_0),
        .O(recvPumpFIFO_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFAA0000EAEA0000)) 
    recvPumpFIFO_i_2
       (.I0(\recvCurrentPacket[hostMACAddress][47]_i_4_n_0 ),
        .I1(DBG_RecvFIFOState[1]),
        .I2(DBG_RecvFIFOState[0]),
        .I3(recvPumpFIFO_i_5_n_0),
        .I4(\recvLastAckedPacketID[15]_i_4_n_0 ),
        .I5(currentState__0[0]),
        .O(recvPumpFIFO));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h05010100)) 
    recvPumpFIFO_i_3
       (.I0(recvSendReplyPacket_reg_0),
        .I1(recv_pkt_data_empty),
        .I2(recv_pkt_header_empty),
        .I3(DBG_RecvFIFOState[0]),
        .I4(DBG_RecvFIFOState[1]),
        .O(recvPumpFIFO_i_3_n_0));
  LUT6 #(
    .INIT(64'h8080808080808880)) 
    recvPumpFIFO_i_4
       (.I0(currentState__0[0]),
        .I1(sendHasRepliedSuccessfulConnection),
        .I2(recvPumpFIFO_i_6_n_0),
        .I3(recvParseState__0[2]),
        .I4(recvParseState__0[1]),
        .I5(\recvCurrentSubpacketOffset[3]_i_4_n_0 ),
        .O(recvPumpFIFO_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair132" *) 
  LUT3 #(
    .INIT(8'hEA)) 
    recvPumpFIFO_i_5
       (.I0(recvParseState__0[2]),
        .I1(recvParseState__0[1]),
        .I2(recvParseState__0[0]),
        .O(recvPumpFIFO_i_5_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFF00400054)) 
    recvPumpFIFO_i_6
       (.I0(recvParseState__0[2]),
        .I1(recvParseState__0[0]),
        .I2(recvParseState__0[1]),
        .I3(recv_pkt_header_empty),
        .I4(recv_pkt_data_empty),
        .I5(recvPumpFIFO_reg_n_0),
        .O(recvPumpFIFO_i_6_n_0));
  FDRE #(
    .INIT(1'b0)) 
    recvPumpFIFO_reg
       (.C(clk333_250),
        .CE(1'b1),
        .D(recvPumpFIFO_i_1_n_0),
        .Q(recvPumpFIFO_reg_n_0),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT5 #(
    .INIT(32'hFFFF40FF)) 
    \recvReplyStatus[0]_i_1 
       (.I0(\recvReplyStatus[2]_i_3_n_0 ),
        .I1(\recvReplyStatus_reg[2]_i_6_n_5 ),
        .I2(\recvReplyStatus[2]_i_5_n_0 ),
        .I3(\recvReplyStatus[2]_i_7_n_0 ),
        .I4(\recvReplyStatus[2]_i_4_n_0 ),
        .O(\recvReplyStatus[0]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hE0)) 
    \recvReplyStatus[1]_i_1 
       (.I0(\recvReplyStatus[2]_i_3_n_0 ),
        .I1(\recvReplyStatus[2]_i_4_n_0 ),
        .I2(\recvReplyStatus[2]_i_7_n_0 ),
        .O(\recvReplyStatus[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000008)) 
    \recvReplyStatus[2]_i_1 
       (.I0(recvSendReplyPacket_i_2_n_0),
        .I1(sendHasRepliedSuccessfulConnection),
        .I2(currentState__0[0]),
        .I3(recvSendReplyPacket_reg_0),
        .I4(recvPumpFIFO_reg_n_0),
        .O(recvReplyStatus));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFD)) 
    \recvReplyStatus[2]_i_10 
       (.I0(\recvLastAckedPacketID[15]_i_3_n_0 ),
        .I1(\recvReplyStatus[2]_i_20_n_0 ),
        .I2(\recvPacketHeaderBuffer_reg[40]_0 ),
        .I3(\recvPacketHeaderBuffer_reg[37]_0 ),
        .I4(\recvPacketHeaderBuffer_reg[45]_0 ),
        .I5(\recvPacketHeaderBuffer_reg[39]_0 ),
        .O(\recvReplyStatus[2]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \recvReplyStatus[2]_i_11 
       (.I0(\recvReplyStatus[2]_i_21_n_0 ),
        .I1(\recvPacketHeaderBuffer_reg[44]_0 ),
        .I2(\recvPacketHeaderBuffer_reg[36]_0 ),
        .I3(\recvPacketHeaderBuffer_reg[51]_0 ),
        .I4(\recvPacketHeaderBuffer_reg[43]_0 ),
        .I5(\recvReplyStatus[2]_i_22_n_0 ),
        .O(\recvReplyStatus[2]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFBFFFFFFF)) 
    \recvReplyStatus[2]_i_12 
       (.I0(\recvReplyStatus[2]_i_23_n_0 ),
        .I1(\recvPacketHeaderBuffer_reg[41]_0 ),
        .I2(\recvPacketHeaderBuffer_reg[38]_0 ),
        .I3(\recvPacketHeaderBuffer_reg[54]_0 ),
        .I4(\recvPacketHeaderBuffer_reg[32]_0 ),
        .I5(\recvReplyStatus[2]_i_24_n_0 ),
        .O(\recvReplyStatus[2]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'h0000000040000000)) 
    \recvReplyStatus[2]_i_13 
       (.I0(\recvReplyStatus[2]_i_25_n_0 ),
        .I1(\recvPacketHeaderBuffer_reg[44]_0 ),
        .I2(\recvPacketHeaderBuffer_reg[43]_0 ),
        .I3(\recvPacketHeaderBuffer_reg[42]_0 ),
        .I4(\recvPacketHeaderBuffer_reg[34]_0 ),
        .I5(\recvReplyStatus[2]_i_26_n_0 ),
        .O(\recvReplyStatus[2]_i_13_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \recvReplyStatus[2]_i_15 
       (.I0(\recvCurrentPacket_reg[hostIPv4Address_n_0_][31] ),
        .I1(\recvPacketHeaderBuffer_reg[63]_0 ),
        .I2(\recvCurrentPacket_reg[hostIPv4Address_n_0_][30] ),
        .I3(\recvPacketHeaderBuffer_reg[62]_0 ),
        .O(\recvReplyStatus[2]_i_15_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \recvReplyStatus[2]_i_16 
       (.I0(\recvPacketHeaderBuffer_reg[61]_0 ),
        .I1(\recvCurrentPacket_reg[hostIPv4Address_n_0_][29] ),
        .I2(\recvPacketHeaderBuffer_reg[59]_0 ),
        .I3(\recvCurrentPacket_reg[hostIPv4Address_n_0_][27] ),
        .I4(\recvCurrentPacket_reg[hostIPv4Address_n_0_][28] ),
        .I5(\recvPacketHeaderBuffer_reg[60]_0 ),
        .O(\recvReplyStatus[2]_i_16_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \recvReplyStatus[2]_i_17 
       (.I0(\recvCurrentPacket_reg[hostIPv4Address_n_0_][25] ),
        .I1(\recvPacketHeaderBuffer_reg[57]_0 ),
        .I2(\recvPacketHeaderBuffer_reg[58]_0 ),
        .I3(\recvCurrentPacket_reg[hostIPv4Address_n_0_][26] ),
        .I4(\recvPacketHeaderBuffer_reg[56]_0 ),
        .I5(\recvCurrentPacket_reg[hostIPv4Address_n_0_][24] ),
        .O(\recvReplyStatus[2]_i_17_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \recvReplyStatus[2]_i_18 
       (.I0(DBG_recvCurrentPacketLength[1]),
        .I1(DBG_recvCurrentPacketLength[0]),
        .I2(DBG_recvCurrentPacketLength[4]),
        .I3(DBG_recvCurrentPacketLength[11]),
        .O(\recvReplyStatus[2]_i_18_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFEFF)) 
    \recvReplyStatus[2]_i_19 
       (.I0(DBG_recvCurrentPacketLength[2]),
        .I1(DBG_recvCurrentPacketLength[7]),
        .I2(DBG_recvCurrentPacketLength[13]),
        .I3(DBG_recvCurrentPacketLength[3]),
        .I4(\recvReplyStatus[2]_i_35_n_0 ),
        .O(\recvReplyStatus[2]_i_19_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT5 #(
    .INIT(32'h11010000)) 
    \recvReplyStatus[2]_i_2 
       (.I0(\recvReplyStatus[2]_i_3_n_0 ),
        .I1(\recvReplyStatus[2]_i_4_n_0 ),
        .I2(\recvReplyStatus[2]_i_5_n_0 ),
        .I3(\recvReplyStatus_reg[2]_i_6_n_5 ),
        .I4(\recvReplyStatus[2]_i_7_n_0 ),
        .O(\recvReplyStatus[2]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \recvReplyStatus[2]_i_20 
       (.I0(\recvPacketHeaderBuffer_reg[49]_0 ),
        .I1(\recvPacketHeaderBuffer_reg[33]_0 ),
        .I2(\recvPacketHeaderBuffer_reg[38]_0 ),
        .I3(\recvPacketHeaderBuffer_reg[35]_0 ),
        .O(\recvReplyStatus[2]_i_20_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \recvReplyStatus[2]_i_21 
       (.I0(\recvPacketHeaderBuffer_reg[48]_0 ),
        .I1(\recvPacketHeaderBuffer_reg[34]_0 ),
        .I2(\recvPacketHeaderBuffer_reg[46]_0 ),
        .I3(\recvPacketHeaderBuffer_reg[41]_0 ),
        .O(\recvReplyStatus[2]_i_21_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \recvReplyStatus[2]_i_22 
       (.I0(\recvPacketHeaderBuffer_reg[47]_0 ),
        .I1(\recvPacketHeaderBuffer_reg[55]_0 ),
        .I2(\recvPacketHeaderBuffer_reg[32]_0 ),
        .I3(\recvPacketHeaderBuffer_reg[42]_0 ),
        .I4(\recvReplyStatus[2]_i_36_n_0 ),
        .O(\recvReplyStatus[2]_i_22_n_0 ));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \recvReplyStatus[2]_i_23 
       (.I0(\recvPacketHeaderBuffer_reg[46]_0 ),
        .I1(\recvPacketHeaderBuffer_reg[45]_0 ),
        .I2(\recvPacketHeaderBuffer_reg[63]_0 ),
        .I3(\recvPacketHeaderBuffer_reg[61]_0 ),
        .O(\recvReplyStatus[2]_i_23_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF7FFF)) 
    \recvReplyStatus[2]_i_24 
       (.I0(\recvPacketHeaderBuffer_reg[58]_0 ),
        .I1(\recvPacketHeaderBuffer_reg[60]_0 ),
        .I2(\recvPacketHeaderBuffer_reg[35]_0 ),
        .I3(\recvPacketHeaderBuffer_reg[36]_0 ),
        .I4(\recvReplyStatus[2]_i_37_n_0 ),
        .O(\recvReplyStatus[2]_i_24_n_0 ));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \recvReplyStatus[2]_i_25 
       (.I0(\recvPacketHeaderBuffer_reg[59]_0 ),
        .I1(\recvPacketHeaderBuffer_reg[52]_0 ),
        .I2(\recvPacketHeaderBuffer_reg[62]_0 ),
        .I3(\recvPacketHeaderBuffer_reg[47]_0 ),
        .O(\recvReplyStatus[2]_i_25_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF7FFF)) 
    \recvReplyStatus[2]_i_26 
       (.I0(\recvPacketHeaderBuffer_reg[50]_0 ),
        .I1(\recvPacketHeaderBuffer_reg[55]_0 ),
        .I2(\recvPacketHeaderBuffer_reg[48]_0 ),
        .I3(\recvPacketHeaderBuffer_reg[53]_0 ),
        .I4(\recvReplyStatus[2]_i_38_n_0 ),
        .O(\recvReplyStatus[2]_i_26_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \recvReplyStatus[2]_i_27 
       (.I0(\recvPacketHeaderBuffer_reg[53]_0 ),
        .I1(\recvCurrentPacket_reg[hostIPv4Address_n_0_][21] ),
        .I2(\recvPacketHeaderBuffer_reg[54]_0 ),
        .I3(\recvCurrentPacket_reg[hostIPv4Address_n_0_][22] ),
        .I4(\recvCurrentPacket_reg[hostIPv4Address_n_0_][23] ),
        .I5(\recvPacketHeaderBuffer_reg[55]_0 ),
        .O(\recvReplyStatus[2]_i_27_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \recvReplyStatus[2]_i_28 
       (.I0(\recvPacketHeaderBuffer_reg[50]_0 ),
        .I1(\recvCurrentPacket_reg[hostIPv4Address_n_0_][18] ),
        .I2(\recvPacketHeaderBuffer_reg[51]_0 ),
        .I3(\recvCurrentPacket_reg[hostIPv4Address_n_0_][19] ),
        .I4(\recvCurrentPacket_reg[hostIPv4Address_n_0_][20] ),
        .I5(\recvPacketHeaderBuffer_reg[52]_0 ),
        .O(\recvReplyStatus[2]_i_28_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \recvReplyStatus[2]_i_29 
       (.I0(\recvPacketHeaderBuffer_reg[47]_0 ),
        .I1(\recvCurrentPacket_reg[hostIPv4Address_n_0_][15] ),
        .I2(\recvPacketHeaderBuffer_reg[48]_0 ),
        .I3(\recvCurrentPacket_reg[hostIPv4Address_n_0_][16] ),
        .I4(\recvCurrentPacket_reg[hostIPv4Address_n_0_][17] ),
        .I5(\recvPacketHeaderBuffer_reg[49]_0 ),
        .O(\recvReplyStatus[2]_i_29_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \recvReplyStatus[2]_i_3 
       (.I0(DBG_recvPacketData[3]),
        .I1(DBG_recvPacketData[4]),
        .I2(DBG_recvPacketData[5]),
        .I3(\recvPacketHeaderBuffer_reg[9]_0 ),
        .I4(\recvReplyStatus[2]_i_8_n_0 ),
        .O(\recvReplyStatus[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \recvReplyStatus[2]_i_30 
       (.I0(\recvCurrentPacket_reg[hostIPv4Address_n_0_][14] ),
        .I1(\recvPacketHeaderBuffer_reg[46]_0 ),
        .I2(\recvPacketHeaderBuffer_reg[44]_0 ),
        .I3(\recvCurrentPacket_reg[hostIPv4Address_n_0_][12] ),
        .I4(\recvPacketHeaderBuffer_reg[45]_0 ),
        .I5(\recvCurrentPacket_reg[hostIPv4Address_n_0_][13] ),
        .O(\recvReplyStatus[2]_i_30_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \recvReplyStatus[2]_i_31 
       (.I0(\recvPacketHeaderBuffer_reg[43]_0 ),
        .I1(\recvCurrentPacket_reg[hostIPv4Address_n_0_][11] ),
        .I2(\recvPacketHeaderBuffer_reg[41]_0 ),
        .I3(\recvCurrentPacket_reg[hostIPv4Address_n_0_][9] ),
        .I4(\recvCurrentPacket_reg[hostIPv4Address_n_0_][10] ),
        .I5(\recvPacketHeaderBuffer_reg[42]_0 ),
        .O(\recvReplyStatus[2]_i_31_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \recvReplyStatus[2]_i_32 
       (.I0(\recvPacketHeaderBuffer_reg[38]_0 ),
        .I1(\recvCurrentPacket_reg[hostIPv4Address_n_0_][6] ),
        .I2(\recvPacketHeaderBuffer_reg[39]_0 ),
        .I3(\recvCurrentPacket_reg[hostIPv4Address_n_0_][7] ),
        .I4(\recvCurrentPacket_reg[hostIPv4Address_n_0_][8] ),
        .I5(\recvPacketHeaderBuffer_reg[40]_0 ),
        .O(\recvReplyStatus[2]_i_32_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \recvReplyStatus[2]_i_33 
       (.I0(\recvPacketHeaderBuffer_reg[35]_0 ),
        .I1(\recvCurrentPacket_reg[hostIPv4Address_n_0_][3] ),
        .I2(\recvPacketHeaderBuffer_reg[36]_0 ),
        .I3(\recvCurrentPacket_reg[hostIPv4Address_n_0_][4] ),
        .I4(\recvCurrentPacket_reg[hostIPv4Address_n_0_][5] ),
        .I5(\recvPacketHeaderBuffer_reg[37]_0 ),
        .O(\recvReplyStatus[2]_i_33_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \recvReplyStatus[2]_i_34 
       (.I0(\recvCurrentPacket_reg[hostIPv4Address_n_0_][2] ),
        .I1(\recvPacketHeaderBuffer_reg[34]_0 ),
        .I2(\recvPacketHeaderBuffer_reg[33]_0 ),
        .I3(\recvCurrentPacket_reg[hostIPv4Address_n_0_][1] ),
        .I4(\recvPacketHeaderBuffer_reg[32]_0 ),
        .I5(\recvCurrentPacket_reg[hostIPv4Address_n_0_][0] ),
        .O(\recvReplyStatus[2]_i_34_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \recvReplyStatus[2]_i_35 
       (.I0(DBG_recvCurrentPacketLength[15]),
        .I1(DBG_recvCurrentPacketLength[14]),
        .I2(DBG_recvCurrentPacketLength[6]),
        .I3(DBG_recvCurrentPacketLength[8]),
        .O(\recvReplyStatus[2]_i_35_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \recvReplyStatus[2]_i_36 
       (.I0(\recvPacketHeaderBuffer_reg[53]_0 ),
        .I1(\recvPacketHeaderBuffer_reg[52]_0 ),
        .I2(\recvPacketHeaderBuffer_reg[54]_0 ),
        .I3(\recvPacketHeaderBuffer_reg[50]_0 ),
        .O(\recvReplyStatus[2]_i_36_n_0 ));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \recvReplyStatus[2]_i_37 
       (.I0(\recvPacketHeaderBuffer_reg[49]_0 ),
        .I1(\recvPacketHeaderBuffer_reg[40]_0 ),
        .I2(\recvPacketHeaderBuffer_reg[39]_0 ),
        .I3(\recvPacketHeaderBuffer_reg[37]_0 ),
        .O(\recvReplyStatus[2]_i_37_n_0 ));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \recvReplyStatus[2]_i_38 
       (.I0(\recvPacketHeaderBuffer_reg[57]_0 ),
        .I1(\recvPacketHeaderBuffer_reg[33]_0 ),
        .I2(\recvPacketHeaderBuffer_reg[56]_0 ),
        .I3(\recvPacketHeaderBuffer_reg[51]_0 ),
        .O(\recvReplyStatus[2]_i_38_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFBFF)) 
    \recvReplyStatus[2]_i_4 
       (.I0(\recvPacketHeaderBuffer_reg[5]_0 ),
        .I1(\recvPacketHeaderBuffer_reg[4]_0 ),
        .I2(\recvPacketHeaderBuffer_reg[0]_0 ),
        .I3(\recvPacketHeaderBuffer_reg[2]_0 ),
        .I4(\recvReplyStatus[2]_i_9_n_0 ),
        .O(\recvReplyStatus[2]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hB0BB)) 
    \recvReplyStatus[2]_i_5 
       (.I0(\recvReplyStatus[2]_i_10_n_0 ),
        .I1(\recvReplyStatus[2]_i_11_n_0 ),
        .I2(\recvReplyStatus[2]_i_12_n_0 ),
        .I3(\recvReplyStatus[2]_i_13_n_0 ),
        .O(\recvReplyStatus[2]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \recvReplyStatus[2]_i_7 
       (.I0(\recvReplyStatus[2]_i_18_n_0 ),
        .I1(DBG_recvCurrentPacketLength[5]),
        .I2(DBG_recvCurrentPacketLength[12]),
        .I3(DBG_recvCurrentPacketLength[9]),
        .I4(DBG_recvCurrentPacketLength[10]),
        .I5(\recvReplyStatus[2]_i_19_n_0 ),
        .O(\recvReplyStatus[2]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair104" *) 
  LUT4 #(
    .INIT(16'hFFEF)) 
    \recvReplyStatus[2]_i_8 
       (.I0(DBG_recvPacketData[2]),
        .I1(\recvPacketHeaderBuffer_reg[10]_0 ),
        .I2(DBG_recvPacketData[1]),
        .I3(\recvPacketHeaderBuffer_reg[14]_0 ),
        .O(\recvReplyStatus[2]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair103" *) 
  LUT4 #(
    .INIT(16'hFFF7)) 
    \recvReplyStatus[2]_i_9 
       (.I0(\recvPacketHeaderBuffer_reg[3]_0 ),
        .I1(\recvPacketHeaderBuffer_reg[1]_0 ),
        .I2(DBG_recvPacketData[0]),
        .I3(\recvPacketHeaderBuffer_reg[7]_0 ),
        .O(\recvReplyStatus[2]_i_9_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \recvReplyStatus_reg[0] 
       (.C(clk333_250),
        .CE(recvReplyStatus),
        .D(\recvReplyStatus[0]_i_1_n_0 ),
        .Q(\recvReplyStatus_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvReplyStatus_reg[1] 
       (.C(clk333_250),
        .CE(recvReplyStatus),
        .D(\recvReplyStatus[1]_i_1_n_0 ),
        .Q(\recvReplyStatus_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \recvReplyStatus_reg[2] 
       (.C(clk333_250),
        .CE(recvReplyStatus),
        .D(\recvReplyStatus[2]_i_2_n_0 ),
        .Q(\recvReplyStatus_reg_n_0_[2] ),
        .R(1'b0));
  CARRY8 \recvReplyStatus_reg[2]_i_14 
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({\recvReplyStatus_reg[2]_i_14_n_0 ,\recvReplyStatus_reg[2]_i_14_n_1 ,\recvReplyStatus_reg[2]_i_14_n_2 ,\recvReplyStatus_reg[2]_i_14_n_3 ,\recvReplyStatus_reg[2]_i_14_n_4 ,\recvReplyStatus_reg[2]_i_14_n_5 ,\recvReplyStatus_reg[2]_i_14_n_6 ,\recvReplyStatus_reg[2]_i_14_n_7 }),
        .DI({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .O(\NLW_recvReplyStatus_reg[2]_i_14_O_UNCONNECTED [7:0]),
        .S({\recvReplyStatus[2]_i_27_n_0 ,\recvReplyStatus[2]_i_28_n_0 ,\recvReplyStatus[2]_i_29_n_0 ,\recvReplyStatus[2]_i_30_n_0 ,\recvReplyStatus[2]_i_31_n_0 ,\recvReplyStatus[2]_i_32_n_0 ,\recvReplyStatus[2]_i_33_n_0 ,\recvReplyStatus[2]_i_34_n_0 }));
  CARRY8 \recvReplyStatus_reg[2]_i_6 
       (.CI(\recvReplyStatus_reg[2]_i_14_n_0 ),
        .CI_TOP(1'b0),
        .CO({\NLW_recvReplyStatus_reg[2]_i_6_CO_UNCONNECTED [7:3],\recvReplyStatus_reg[2]_i_6_n_5 ,\recvReplyStatus_reg[2]_i_6_n_6 ,\recvReplyStatus_reg[2]_i_6_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1}),
        .O(\NLW_recvReplyStatus_reg[2]_i_6_O_UNCONNECTED [7:0]),
        .S({1'b0,1'b0,1'b0,1'b0,1'b0,\recvReplyStatus[2]_i_15_n_0 ,\recvReplyStatus[2]_i_16_n_0 ,\recvReplyStatus[2]_i_17_n_0 }));
  LUT6 #(
    .INIT(64'hF300F3003380F380)) 
    recvSendReplyPacket_i_1
       (.I0(recvSendReplyPacket_i_2_n_0),
        .I1(\currentState[0]_i_1_n_0 ),
        .I2(sendHasRepliedSuccessfulConnection),
        .I3(recvSendReplyPacket_reg_0),
        .I4(sendReplyAck_reg_0),
        .I5(recvPumpFIFO_reg_n_0),
        .O(recvSendReplyPacket_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    recvSendReplyPacket_i_10
       (.I0(recvSendReplyPacket_i_25_n_0),
        .I1(\recvCurrentPacket_reg[hostMACAddress_n_0_][3] ),
        .I2(\recvCurrentPacket_reg[hostMACAddress_n_0_][2] ),
        .I3(\recvCurrentPacket_reg[hostMACAddress_n_0_][1] ),
        .I4(\recvCurrentPacket_reg[hostMACAddress_n_0_][0] ),
        .I5(recvSendReplyPacket_i_26_n_0),
        .O(recvSendReplyPacket_i_10_n_0));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    recvSendReplyPacket_i_11
       (.I0(recvSendReplyPacket_i_27_n_0),
        .I1(\recvCurrentPacket_reg[hostMACAddress_n_0_][34] ),
        .I2(\recvCurrentPacket_reg[hostMACAddress_n_0_][33] ),
        .I3(\recvCurrentPacket_reg[hostMACAddress_n_0_][35] ),
        .I4(\recvCurrentPacket_reg[hostMACAddress_n_0_][32] ),
        .I5(recvSendReplyPacket_i_28_n_0),
        .O(recvSendReplyPacket_i_11_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFBFFFFFFF)) 
    recvSendReplyPacket_i_12
       (.I0(recvSendReplyPacket_i_29_n_0),
        .I1(\recvCurrentPacket_reg[hostMACAddress_n_0_][42] ),
        .I2(\recvCurrentPacket_reg[hostMACAddress_n_0_][41] ),
        .I3(\recvCurrentPacket_reg[hostMACAddress_n_0_][43] ),
        .I4(\recvCurrentPacket_reg[hostMACAddress_n_0_][40] ),
        .I5(recvSendReplyPacket_i_30_n_0),
        .O(recvSendReplyPacket_i_12_n_0));
  LUT6 #(
    .INIT(64'h0000000040000000)) 
    recvSendReplyPacket_i_13
       (.I0(recvSendReplyPacket_i_31_n_0),
        .I1(\recvCurrentPacket_reg[hostMACAddress_n_0_][19] ),
        .I2(\recvCurrentPacket_reg[hostMACAddress_n_0_][16] ),
        .I3(\recvCurrentPacket_reg[hostMACAddress_n_0_][18] ),
        .I4(\recvCurrentPacket_reg[hostMACAddress_n_0_][17] ),
        .I5(recvSendReplyPacket_i_32_n_0),
        .O(recvSendReplyPacket_i_13_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFBFFFFFFF)) 
    recvSendReplyPacket_i_14
       (.I0(recvSendReplyPacket_i_33_n_0),
        .I1(\recvCurrentPacket_reg[hostMACAddress_n_0_][3] ),
        .I2(\recvCurrentPacket_reg[hostMACAddress_n_0_][2] ),
        .I3(\recvCurrentPacket_reg[hostMACAddress_n_0_][1] ),
        .I4(\recvCurrentPacket_reg[hostMACAddress_n_0_][0] ),
        .I5(recvSendReplyPacket_i_34_n_0),
        .O(recvSendReplyPacket_i_14_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    recvSendReplyPacket_i_15
       (.I0(\recvCurrentPacket_reg[hostIPv4Address_n_0_][5] ),
        .I1(\recvCurrentPacket_reg[hostIPv4Address_n_0_][4] ),
        .I2(\recvCurrentPacket_reg[hostIPv4Address_n_0_][7] ),
        .I3(\recvCurrentPacket_reg[hostIPv4Address_n_0_][6] ),
        .O(recvSendReplyPacket_i_15_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    recvSendReplyPacket_i_16
       (.I0(\recvCurrentPacket_reg[hostIPv4Address_n_0_][9] ),
        .I1(\recvCurrentPacket_reg[hostIPv4Address_n_0_][10] ),
        .I2(\recvCurrentPacket_reg[hostIPv4Address_n_0_][8] ),
        .I3(\recvCurrentPacket_reg[hostIPv4Address_n_0_][11] ),
        .I4(recvSendReplyPacket_i_35_n_0),
        .O(recvSendReplyPacket_i_16_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    recvSendReplyPacket_i_17
       (.I0(\recvCurrentPacket_reg[hostIPv4Address_n_0_][31] ),
        .I1(\recvCurrentPacket_reg[hostIPv4Address_n_0_][30] ),
        .I2(\recvCurrentPacket_reg[hostIPv4Address_n_0_][29] ),
        .I3(\recvCurrentPacket_reg[hostIPv4Address_n_0_][28] ),
        .O(recvSendReplyPacket_i_17_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    recvSendReplyPacket_i_18
       (.I0(\recvCurrentPacket_reg[hostIPv4Address_n_0_][16] ),
        .I1(\recvCurrentPacket_reg[hostIPv4Address_n_0_][19] ),
        .I2(\recvCurrentPacket_reg[hostIPv4Address_n_0_][17] ),
        .I3(\recvCurrentPacket_reg[hostIPv4Address_n_0_][18] ),
        .I4(recvSendReplyPacket_i_36_n_0),
        .O(recvSendReplyPacket_i_18_n_0));
  LUT4 #(
    .INIT(16'h7FFF)) 
    recvSendReplyPacket_i_19
       (.I0(\recvCurrentPacket_reg[hostIPv4Address_n_0_][30] ),
        .I1(\recvCurrentPacket_reg[hostIPv4Address_n_0_][29] ),
        .I2(\recvCurrentPacket_reg[hostIPv4Address_n_0_][27] ),
        .I3(\recvCurrentPacket_reg[hostIPv4Address_n_0_][26] ),
        .O(recvSendReplyPacket_i_19_n_0));
  LUT4 #(
    .INIT(16'h08AA)) 
    recvSendReplyPacket_i_2
       (.I0(DBG_RecvFIFOState[2]),
        .I1(recvSendReplyPacket_i_3_n_0),
        .I2(recvSendReplyPacket_i_4_n_0),
        .I3(\recvReplyStatus[2]_i_7_n_0 ),
        .O(recvSendReplyPacket_i_2_n_0));
  LUT5 #(
    .INIT(32'hFFFF7FFF)) 
    recvSendReplyPacket_i_20
       (.I0(\recvCurrentPacket_reg[hostIPv4Address_n_0_][7] ),
        .I1(\recvCurrentPacket_reg[hostIPv4Address_n_0_][14] ),
        .I2(\recvCurrentPacket_reg[hostIPv4Address_n_0_][20] ),
        .I3(\recvCurrentPacket_reg[hostIPv4Address_n_0_][21] ),
        .I4(recvSendReplyPacket_i_37_n_0),
        .O(recvSendReplyPacket_i_20_n_0));
  LUT4 #(
    .INIT(16'h7FFF)) 
    recvSendReplyPacket_i_21
       (.I0(\recvCurrentPacket_reg[hostIPv4Address_n_0_][31] ),
        .I1(\recvCurrentPacket_reg[hostIPv4Address_n_0_][13] ),
        .I2(\recvCurrentPacket_reg[hostIPv4Address_n_0_][28] ),
        .I3(\recvCurrentPacket_reg[hostIPv4Address_n_0_][22] ),
        .O(recvSendReplyPacket_i_21_n_0));
  LUT5 #(
    .INIT(32'hFFFF7FFF)) 
    recvSendReplyPacket_i_22
       (.I0(\recvCurrentPacket_reg[hostIPv4Address_n_0_][23] ),
        .I1(\recvCurrentPacket_reg[hostIPv4Address_n_0_][24] ),
        .I2(\recvCurrentPacket_reg[hostIPv4Address_n_0_][8] ),
        .I3(\recvCurrentPacket_reg[hostIPv4Address_n_0_][9] ),
        .I4(recvSendReplyPacket_i_38_n_0),
        .O(recvSendReplyPacket_i_22_n_0));
  (* SOFT_HLUTNM = "soft_lutpair110" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    recvSendReplyPacket_i_23
       (.I0(\recvCurrentPacket_reg[hostMACAddress_n_0_][21] ),
        .I1(\recvCurrentPacket_reg[hostMACAddress_n_0_][20] ),
        .I2(\recvCurrentPacket_reg[hostMACAddress_n_0_][23] ),
        .I3(\recvCurrentPacket_reg[hostMACAddress_n_0_][22] ),
        .O(recvSendReplyPacket_i_23_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    recvSendReplyPacket_i_24
       (.I0(\recvCurrentPacket_reg[hostMACAddress_n_0_][24] ),
        .I1(\recvCurrentPacket_reg[hostMACAddress_n_0_][27] ),
        .I2(\recvCurrentPacket_reg[hostMACAddress_n_0_][25] ),
        .I3(\recvCurrentPacket_reg[hostMACAddress_n_0_][26] ),
        .I4(recvSendReplyPacket_i_39_n_0),
        .O(recvSendReplyPacket_i_24_n_0));
  (* SOFT_HLUTNM = "soft_lutpair108" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    recvSendReplyPacket_i_25
       (.I0(\recvCurrentPacket_reg[hostMACAddress_n_0_][5] ),
        .I1(\recvCurrentPacket_reg[hostMACAddress_n_0_][4] ),
        .I2(\recvCurrentPacket_reg[hostMACAddress_n_0_][7] ),
        .I3(\recvCurrentPacket_reg[hostMACAddress_n_0_][6] ),
        .O(recvSendReplyPacket_i_25_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    recvSendReplyPacket_i_26
       (.I0(\recvCurrentPacket_reg[hostMACAddress_n_0_][8] ),
        .I1(\recvCurrentPacket_reg[hostMACAddress_n_0_][9] ),
        .I2(\recvCurrentPacket_reg[hostMACAddress_n_0_][10] ),
        .I3(\recvCurrentPacket_reg[hostMACAddress_n_0_][11] ),
        .I4(recvSendReplyPacket_i_40_n_0),
        .O(recvSendReplyPacket_i_26_n_0));
  (* SOFT_HLUTNM = "soft_lutpair105" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    recvSendReplyPacket_i_27
       (.I0(\recvCurrentPacket_reg[hostMACAddress_n_0_][37] ),
        .I1(\recvCurrentPacket_reg[hostMACAddress_n_0_][36] ),
        .I2(\recvCurrentPacket_reg[hostMACAddress_n_0_][39] ),
        .I3(\recvCurrentPacket_reg[hostMACAddress_n_0_][38] ),
        .O(recvSendReplyPacket_i_27_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    recvSendReplyPacket_i_28
       (.I0(\recvCurrentPacket_reg[hostMACAddress_n_0_][40] ),
        .I1(\recvCurrentPacket_reg[hostMACAddress_n_0_][43] ),
        .I2(\recvCurrentPacket_reg[hostMACAddress_n_0_][41] ),
        .I3(\recvCurrentPacket_reg[hostMACAddress_n_0_][42] ),
        .I4(recvSendReplyPacket_i_41_n_0),
        .O(recvSendReplyPacket_i_28_n_0));
  (* SOFT_HLUTNM = "soft_lutpair106" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    recvSendReplyPacket_i_29
       (.I0(\recvCurrentPacket_reg[hostMACAddress_n_0_][46] ),
        .I1(\recvCurrentPacket_reg[hostMACAddress_n_0_][47] ),
        .I2(\recvCurrentPacket_reg[hostMACAddress_n_0_][45] ),
        .I3(\recvCurrentPacket_reg[hostMACAddress_n_0_][44] ),
        .O(recvSendReplyPacket_i_29_n_0));
  LUT4 #(
    .INIT(16'hE0EE)) 
    recvSendReplyPacket_i_3
       (.I0(recvSendReplyPacket_i_5_n_0),
        .I1(recvSendReplyPacket_i_6_n_0),
        .I2(recvSendReplyPacket_i_7_n_0),
        .I3(recvSendReplyPacket_i_8_n_0),
        .O(recvSendReplyPacket_i_3_n_0));
  LUT5 #(
    .INIT(32'hFFFF7FFF)) 
    recvSendReplyPacket_i_30
       (.I0(\recvCurrentPacket_reg[hostMACAddress_n_0_][32] ),
        .I1(\recvCurrentPacket_reg[hostMACAddress_n_0_][35] ),
        .I2(\recvCurrentPacket_reg[hostMACAddress_n_0_][33] ),
        .I3(\recvCurrentPacket_reg[hostMACAddress_n_0_][34] ),
        .I4(recvSendReplyPacket_i_42_n_0),
        .O(recvSendReplyPacket_i_30_n_0));
  (* SOFT_HLUTNM = "soft_lutpair110" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    recvSendReplyPacket_i_31
       (.I0(\recvCurrentPacket_reg[hostMACAddress_n_0_][21] ),
        .I1(\recvCurrentPacket_reg[hostMACAddress_n_0_][20] ),
        .I2(\recvCurrentPacket_reg[hostMACAddress_n_0_][23] ),
        .I3(\recvCurrentPacket_reg[hostMACAddress_n_0_][22] ),
        .O(recvSendReplyPacket_i_31_n_0));
  LUT5 #(
    .INIT(32'hFFFF7FFF)) 
    recvSendReplyPacket_i_32
       (.I0(\recvCurrentPacket_reg[hostMACAddress_n_0_][24] ),
        .I1(\recvCurrentPacket_reg[hostMACAddress_n_0_][25] ),
        .I2(\recvCurrentPacket_reg[hostMACAddress_n_0_][26] ),
        .I3(\recvCurrentPacket_reg[hostMACAddress_n_0_][27] ),
        .I4(recvSendReplyPacket_i_43_n_0),
        .O(recvSendReplyPacket_i_32_n_0));
  (* SOFT_HLUTNM = "soft_lutpair108" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    recvSendReplyPacket_i_33
       (.I0(\recvCurrentPacket_reg[hostMACAddress_n_0_][5] ),
        .I1(\recvCurrentPacket_reg[hostMACAddress_n_0_][4] ),
        .I2(\recvCurrentPacket_reg[hostMACAddress_n_0_][7] ),
        .I3(\recvCurrentPacket_reg[hostMACAddress_n_0_][6] ),
        .O(recvSendReplyPacket_i_33_n_0));
  LUT5 #(
    .INIT(32'hFFFF7FFF)) 
    recvSendReplyPacket_i_34
       (.I0(\recvCurrentPacket_reg[hostMACAddress_n_0_][8] ),
        .I1(\recvCurrentPacket_reg[hostMACAddress_n_0_][9] ),
        .I2(\recvCurrentPacket_reg[hostMACAddress_n_0_][10] ),
        .I3(\recvCurrentPacket_reg[hostMACAddress_n_0_][11] ),
        .I4(recvSendReplyPacket_i_44_n_0),
        .O(recvSendReplyPacket_i_34_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    recvSendReplyPacket_i_35
       (.I0(\recvCurrentPacket_reg[hostIPv4Address_n_0_][13] ),
        .I1(\recvCurrentPacket_reg[hostIPv4Address_n_0_][12] ),
        .I2(\recvCurrentPacket_reg[hostIPv4Address_n_0_][15] ),
        .I3(\recvCurrentPacket_reg[hostIPv4Address_n_0_][14] ),
        .O(recvSendReplyPacket_i_35_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    recvSendReplyPacket_i_36
       (.I0(\recvCurrentPacket_reg[hostIPv4Address_n_0_][21] ),
        .I1(\recvCurrentPacket_reg[hostIPv4Address_n_0_][20] ),
        .I2(\recvCurrentPacket_reg[hostIPv4Address_n_0_][23] ),
        .I3(\recvCurrentPacket_reg[hostIPv4Address_n_0_][22] ),
        .O(recvSendReplyPacket_i_36_n_0));
  LUT4 #(
    .INIT(16'h7FFF)) 
    recvSendReplyPacket_i_37
       (.I0(\recvCurrentPacket_reg[hostIPv4Address_n_0_][5] ),
        .I1(\recvCurrentPacket_reg[hostIPv4Address_n_0_][3] ),
        .I2(\recvCurrentPacket_reg[hostIPv4Address_n_0_][19] ),
        .I3(\recvCurrentPacket_reg[hostIPv4Address_n_0_][4] ),
        .O(recvSendReplyPacket_i_37_n_0));
  LUT4 #(
    .INIT(16'h7FFF)) 
    recvSendReplyPacket_i_38
       (.I0(\recvCurrentPacket_reg[hostIPv4Address_n_0_][15] ),
        .I1(\recvCurrentPacket_reg[hostIPv4Address_n_0_][12] ),
        .I2(\recvCurrentPacket_reg[hostIPv4Address_n_0_][25] ),
        .I3(\recvCurrentPacket_reg[hostIPv4Address_n_0_][16] ),
        .O(recvSendReplyPacket_i_38_n_0));
  (* SOFT_HLUTNM = "soft_lutpair109" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    recvSendReplyPacket_i_39
       (.I0(\recvCurrentPacket_reg[hostMACAddress_n_0_][30] ),
        .I1(\recvCurrentPacket_reg[hostMACAddress_n_0_][29] ),
        .I2(\recvCurrentPacket_reg[hostMACAddress_n_0_][31] ),
        .I3(\recvCurrentPacket_reg[hostMACAddress_n_0_][28] ),
        .O(recvSendReplyPacket_i_39_n_0));
  LUT6 #(
    .INIT(64'h1010101010FF1010)) 
    recvSendReplyPacket_i_4
       (.I0(recvSendReplyPacket_i_9_n_0),
        .I1(recvSendReplyPacket_i_10_n_0),
        .I2(recvSendReplyPacket_i_11_n_0),
        .I3(recvSendReplyPacket_i_12_n_0),
        .I4(recvSendReplyPacket_i_13_n_0),
        .I5(recvSendReplyPacket_i_14_n_0),
        .O(recvSendReplyPacket_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair107" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    recvSendReplyPacket_i_40
       (.I0(\recvCurrentPacket_reg[hostMACAddress_n_0_][13] ),
        .I1(\recvCurrentPacket_reg[hostMACAddress_n_0_][12] ),
        .I2(\recvCurrentPacket_reg[hostMACAddress_n_0_][15] ),
        .I3(\recvCurrentPacket_reg[hostMACAddress_n_0_][14] ),
        .O(recvSendReplyPacket_i_40_n_0));
  (* SOFT_HLUTNM = "soft_lutpair106" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    recvSendReplyPacket_i_41
       (.I0(\recvCurrentPacket_reg[hostMACAddress_n_0_][45] ),
        .I1(\recvCurrentPacket_reg[hostMACAddress_n_0_][44] ),
        .I2(\recvCurrentPacket_reg[hostMACAddress_n_0_][46] ),
        .I3(\recvCurrentPacket_reg[hostMACAddress_n_0_][47] ),
        .O(recvSendReplyPacket_i_41_n_0));
  (* SOFT_HLUTNM = "soft_lutpair105" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    recvSendReplyPacket_i_42
       (.I0(\recvCurrentPacket_reg[hostMACAddress_n_0_][37] ),
        .I1(\recvCurrentPacket_reg[hostMACAddress_n_0_][36] ),
        .I2(\recvCurrentPacket_reg[hostMACAddress_n_0_][39] ),
        .I3(\recvCurrentPacket_reg[hostMACAddress_n_0_][38] ),
        .O(recvSendReplyPacket_i_42_n_0));
  (* SOFT_HLUTNM = "soft_lutpair109" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    recvSendReplyPacket_i_43
       (.I0(\recvCurrentPacket_reg[hostMACAddress_n_0_][30] ),
        .I1(\recvCurrentPacket_reg[hostMACAddress_n_0_][29] ),
        .I2(\recvCurrentPacket_reg[hostMACAddress_n_0_][31] ),
        .I3(\recvCurrentPacket_reg[hostMACAddress_n_0_][28] ),
        .O(recvSendReplyPacket_i_43_n_0));
  (* SOFT_HLUTNM = "soft_lutpair107" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    recvSendReplyPacket_i_44
       (.I0(\recvCurrentPacket_reg[hostMACAddress_n_0_][13] ),
        .I1(\recvCurrentPacket_reg[hostMACAddress_n_0_][12] ),
        .I2(\recvCurrentPacket_reg[hostMACAddress_n_0_][15] ),
        .I3(\recvCurrentPacket_reg[hostMACAddress_n_0_][14] ),
        .O(recvSendReplyPacket_i_44_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    recvSendReplyPacket_i_5
       (.I0(recvSendReplyPacket_i_15_n_0),
        .I1(\recvCurrentPacket_reg[hostIPv4Address_n_0_][2] ),
        .I2(\recvCurrentPacket_reg[hostIPv4Address_n_0_][1] ),
        .I3(\recvCurrentPacket_reg[hostIPv4Address_n_0_][3] ),
        .I4(\recvCurrentPacket_reg[hostIPv4Address_n_0_][0] ),
        .I5(recvSendReplyPacket_i_16_n_0),
        .O(recvSendReplyPacket_i_5_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    recvSendReplyPacket_i_6
       (.I0(recvSendReplyPacket_i_17_n_0),
        .I1(\recvCurrentPacket_reg[hostIPv4Address_n_0_][25] ),
        .I2(\recvCurrentPacket_reg[hostIPv4Address_n_0_][24] ),
        .I3(\recvCurrentPacket_reg[hostIPv4Address_n_0_][27] ),
        .I4(\recvCurrentPacket_reg[hostIPv4Address_n_0_][26] ),
        .I5(recvSendReplyPacket_i_18_n_0),
        .O(recvSendReplyPacket_i_6_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFBFFFFFFF)) 
    recvSendReplyPacket_i_7
       (.I0(recvSendReplyPacket_i_19_n_0),
        .I1(\recvCurrentPacket_reg[hostIPv4Address_n_0_][18] ),
        .I2(\recvCurrentPacket_reg[hostIPv4Address_n_0_][17] ),
        .I3(\recvCurrentPacket_reg[hostIPv4Address_n_0_][6] ),
        .I4(\recvCurrentPacket_reg[hostIPv4Address_n_0_][0] ),
        .I5(recvSendReplyPacket_i_20_n_0),
        .O(recvSendReplyPacket_i_7_n_0));
  LUT6 #(
    .INIT(64'h0000000040000000)) 
    recvSendReplyPacket_i_8
       (.I0(recvSendReplyPacket_i_21_n_0),
        .I1(\recvCurrentPacket_reg[hostIPv4Address_n_0_][11] ),
        .I2(\recvCurrentPacket_reg[hostIPv4Address_n_0_][10] ),
        .I3(\recvCurrentPacket_reg[hostIPv4Address_n_0_][2] ),
        .I4(\recvCurrentPacket_reg[hostIPv4Address_n_0_][1] ),
        .I5(recvSendReplyPacket_i_22_n_0),
        .O(recvSendReplyPacket_i_8_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    recvSendReplyPacket_i_9
       (.I0(recvSendReplyPacket_i_23_n_0),
        .I1(\recvCurrentPacket_reg[hostMACAddress_n_0_][18] ),
        .I2(\recvCurrentPacket_reg[hostMACAddress_n_0_][17] ),
        .I3(\recvCurrentPacket_reg[hostMACAddress_n_0_][19] ),
        .I4(\recvCurrentPacket_reg[hostMACAddress_n_0_][16] ),
        .I5(recvSendReplyPacket_i_24_n_0),
        .O(recvSendReplyPacket_i_9_n_0));
  FDRE #(
    .INIT(1'b0)) 
    recvSendReplyPacket_reg
       (.C(clk333_250),
        .CE(1'b1),
        .D(recvSendReplyPacket_i_1_n_0),
        .Q(recvSendReplyPacket_reg_0),
        .R(1'b0));
  LUT4 #(
    .INIT(16'hFF80)) 
    recvSessionDisconnectSignal_i_1
       (.I0(\recvPacketHeaderBuffer_reg[0]_0 ),
        .I1(\stat_recv_session_packets_valid[31]_i_3_n_0 ),
        .I2(\DBG_recvHeaderChecksum[7]_i_1_n_0 ),
        .I3(recvSessionDisconnectSignal_reg_n_0),
        .O(recvSessionDisconnectSignal_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    recvSessionDisconnectSignal_reg
       (.C(clk333_250),
        .CE(1'b1),
        .D(recvSessionDisconnectSignal_i_1_n_0),
        .Q(recvSessionDisconnectSignal_reg_n_0),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0004FFFF00040000)) 
    recv_pkt_data_rd_en_i_1
       (.I0(recv_pkt_data_rd_en_i_2_n_0),
        .I1(sendHasRepliedSuccessfulConnection),
        .I2(recvPumpFIFO_reg_n_0),
        .I3(recv_pkt_data_rd_en_i_3_n_0),
        .I4(recv_pkt_data_rd_en_i_4_n_0),
        .I5(recv_pkt_data_rd_en),
        .O(recv_pkt_data_rd_en_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h55555501)) 
    recv_pkt_data_rd_en_i_2
       (.I0(currentState__0[0]),
        .I1(DBG_RecvFIFOState[1]),
        .I2(DBG_RecvFIFOState[0]),
        .I3(recv_pkt_header_empty),
        .I4(recv_pkt_data_empty),
        .O(recv_pkt_data_rd_en_i_2_n_0));
  LUT6 #(
    .INIT(64'h40C044CC000004CC)) 
    recv_pkt_data_rd_en_i_3
       (.I0(recvParseState__0[1]),
        .I1(currentState__0[0]),
        .I2(recvParseState__0[0]),
        .I3(\recvCurrentPacket[hostMACAddress][47]_i_4_n_0 ),
        .I4(recv_pkt_data_rd_en_i_5_n_0),
        .I5(recvParseState__0[2]),
        .O(recv_pkt_data_rd_en_i_3_n_0));
  LUT6 #(
    .INIT(64'h00FF00000E0E0F0F)) 
    recv_pkt_data_rd_en_i_4
       (.I0(recvPumpFIFO_reg_n_0),
        .I1(recv_pkt_data_rd_en_i_6_n_0),
        .I2(currentState__0[2]),
        .I3(recv_pkt_data_rd_en_i_7_n_0),
        .I4(sendHasRepliedSuccessfulConnection),
        .I5(currentState__0[0]),
        .O(recv_pkt_data_rd_en_i_4_n_0));
  LUT5 #(
    .INIT(32'h00A8AAA8)) 
    recv_pkt_data_rd_en_i_5
       (.I0(recvParseState__0[2]),
        .I1(DBG_recvCurrentPacketLength[1]),
        .I2(DBG_recvCurrentPacketLength[0]),
        .I3(\recvParseState[2]__0_i_7_n_0 ),
        .I4(recv_pkt_data_empty),
        .O(recv_pkt_data_rd_en_i_5_n_0));
  LUT6 #(
    .INIT(64'h000000010001000F)) 
    recv_pkt_data_rd_en_i_6
       (.I0(recv_pkt_header_empty),
        .I1(recv_pkt_data_empty),
        .I2(recvSendReplyPacket_reg_0),
        .I3(DBG_RecvFIFOState[2]),
        .I4(DBG_RecvFIFOState[1]),
        .I5(DBG_RecvFIFOState[0]),
        .O(recv_pkt_data_rd_en_i_6_n_0));
  LUT6 #(
    .INIT(64'h1515151404040400)) 
    recv_pkt_data_rd_en_i_7
       (.I0(recvPumpFIFO_reg_n_0),
        .I1(recvParseState__0[0]),
        .I2(recvParseState__0[2]),
        .I3(recv_pkt_data_empty),
        .I4(recv_pkt_header_empty),
        .I5(recvParseState__0[1]),
        .O(recv_pkt_data_rd_en_i_7_n_0));
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 recv_pkt_data RD_EN" *) 
  FDRE #(
    .INIT(1'b0)) 
    recv_pkt_data_rd_en_reg
       (.C(clk333_250),
        .CE(1'b1),
        .D(recv_pkt_data_rd_en_i_1_n_0),
        .Q(recv_pkt_data_rd_en),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hEFAAEFEF20AA2020)) 
    recv_pkt_header_rd_en_i_1
       (.I0(recv_pkt_header_rd_en_i_2_n_0),
        .I1(recv_pkt_header_rd_en_i_3_n_0),
        .I2(\currentState[0]_i_1_n_0 ),
        .I3(recv_pkt_header_rd_en_i_4_n_0),
        .I4(currentState__1),
        .I5(recv_pkt_header_rd_en),
        .O(recv_pkt_header_rd_en_i_1_n_0));
  LUT6 #(
    .INIT(64'h00000000EAEAEAFE)) 
    recv_pkt_header_rd_en_i_2
       (.I0(currentState__0[0]),
        .I1(DBG_RecvFIFOState[1]),
        .I2(DBG_RecvFIFOState[0]),
        .I3(recv_pkt_header_empty),
        .I4(recv_pkt_data_empty),
        .I5(recv_pkt_header_rd_en_i_5_n_0),
        .O(recv_pkt_header_rd_en_i_2_n_0));
  LUT6 #(
    .INIT(64'hAAAAAAAA88A8A800)) 
    recv_pkt_header_rd_en_i_3
       (.I0(\recvLastAckedPacketID[15]_i_4_n_0 ),
        .I1(recv_pkt_header_empty),
        .I2(recv_pkt_data_empty),
        .I3(DBG_RecvFIFOState[1]),
        .I4(DBG_RecvFIFOState[0]),
        .I5(recvSendReplyPacket_reg_0),
        .O(recv_pkt_header_rd_en_i_3_n_0));
  LUT6 #(
    .INIT(64'h5550055055500440)) 
    recv_pkt_header_rd_en_i_4
       (.I0(recvPumpFIFO_reg_n_0),
        .I1(recvParseState__0[2]),
        .I2(recvParseState__0[1]),
        .I3(recvParseState__0[0]),
        .I4(recv_pkt_header_empty),
        .I5(recv_pkt_data_empty),
        .O(recv_pkt_header_rd_en_i_4_n_0));
  LUT6 #(
    .INIT(64'hBBBBBBFBBBFBFBFB)) 
    recv_pkt_header_rd_en_i_5
       (.I0(recvPumpFIFO_reg_n_0),
        .I1(sendHasRepliedSuccessfulConnection),
        .I2(currentState__0[0]),
        .I3(recvParseState__0[1]),
        .I4(\recvCurrentPacket[hostMACAddress][47]_i_4_n_0 ),
        .I5(recvParseState__0[0]),
        .O(recv_pkt_header_rd_en_i_5_n_0));
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 recv_pkt_header RD_EN" *) 
  FDRE #(
    .INIT(1'b0)) 
    recv_pkt_header_rd_en_reg
       (.C(clk333_250),
        .CE(1'b1),
        .D(recv_pkt_header_rd_en_i_1_n_0),
        .Q(recv_pkt_header_rd_en),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h4000000000000000)) 
    returnPacketsFIFO_rd_en_i_1
       (.I0(sendPacketState__0),
        .I1(sendHasRepliedSuccessfulConnection),
        .I2(currentState__0[0]),
        .I3(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .I4(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I5(\sendLastSentPacketHeader_reg[subpacketCount_n_0_][0] ),
        .O(returnPacketsFIFO_rd_en_i_1_n_0));
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 returnPacketsFIFO RD_EN" *) 
  FDRE #(
    .INIT(1'b0)) 
    returnPacketsFIFO_rd_en_reg
       (.C(clk333_250),
        .CE(1'b1),
        .D(returnPacketsFIFO_rd_en_i_1_n_0),
        .Q(returnPacketsFIFO_rd_en),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \sendBRAM_addra[0]_i_1 
       (.I0(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .O(\sendBRAM_addra[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000040404000)) 
    \sendBRAM_addra[1]_i_1 
       (.I0(sendPacketState__0),
        .I1(sendHasRepliedSuccessfulConnection),
        .I2(currentState__0[0]),
        .I3(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .I4(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I5(\FSM_sequential_sendPacketState_reg_n_0_[3] ),
        .O(\sendBRAM_addra[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \sendBRAM_addra[1]_i_2 
       (.I0(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .O(\sendBRAM_addra[1]_i_2_n_0 ));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SendPacketBRAMW ADDR" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \sendBRAM_addra_reg[0] 
       (.C(clk333_250),
        .CE(\sendBRAM_addra[1]_i_1_n_0 ),
        .D(\sendBRAM_addra[0]_i_1_n_0 ),
        .Q(sendBRAM_addra[0]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SendPacketBRAMW ADDR" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \sendBRAM_addra_reg[1] 
       (.C(clk333_250),
        .CE(\sendBRAM_addra[1]_i_1_n_0 ),
        .D(\sendBRAM_addra[1]_i_2_n_0 ),
        .Q(sendBRAM_addra[1]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hAAAA2020A8AA2020)) 
    \sendBRAM_addrb[2]_i_1 
       (.I0(currentState__1),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .I2(\FSM_sequential_sendPacketState_reg_n_0_[3] ),
        .I3(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I4(sendPacketState__0),
        .I5(\sendLastSentPacketHeader_reg[subpacketCount_n_0_][0] ),
        .O(\sendBRAM_addrb[2]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SendPacketBRAMR ADDR" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \sendBRAM_addrb_reg[0] 
       (.C(clk333_250),
        .CE(\sendBRAM_addrb[2]_i_1_n_0 ),
        .D(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .Q(sendBRAM_addrb[0]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SendPacketBRAMR ADDR" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \sendBRAM_addrb_reg[1] 
       (.C(clk333_250),
        .CE(\sendBRAM_addrb[2]_i_1_n_0 ),
        .D(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .Q(sendBRAM_addrb[1]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SendPacketBRAMR ADDR" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \sendBRAM_addrb_reg[2] 
       (.C(clk333_250),
        .CE(\sendBRAM_addrb[2]_i_1_n_0 ),
        .D(\FSM_sequential_sendPacketState_reg_n_0_[3] ),
        .Q(sendBRAM_addrb[2]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT5 #(
    .INIT(32'h2200E200)) 
    \sendBRAM_dina[0]_i_1 
       (.I0(returnPacketsFIFO_rd_data[24]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I2(returnPacketsFIFO_rd_data[56]),
        .I3(\sendLastSentPacketHeader_reg[subpacketCount_n_0_][0] ),
        .I4(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .O(\sendBRAM_dina[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h2200E200)) 
    \sendBRAM_dina[10]_i_1 
       (.I0(returnPacketsFIFO_rd_data[18]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I2(returnPacketsFIFO_rd_data[50]),
        .I3(\sendLastSentPacketHeader_reg[subpacketCount_n_0_][0] ),
        .I4(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .O(\sendBRAM_dina[10]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h2200E200)) 
    \sendBRAM_dina[11]_i_1 
       (.I0(returnPacketsFIFO_rd_data[19]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I2(returnPacketsFIFO_rd_data[51]),
        .I3(\sendLastSentPacketHeader_reg[subpacketCount_n_0_][0] ),
        .I4(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .O(\sendBRAM_dina[11]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h2200E200)) 
    \sendBRAM_dina[12]_i_1 
       (.I0(returnPacketsFIFO_rd_data[20]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I2(returnPacketsFIFO_rd_data[52]),
        .I3(\sendLastSentPacketHeader_reg[subpacketCount_n_0_][0] ),
        .I4(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .O(\sendBRAM_dina[12]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h2200E200)) 
    \sendBRAM_dina[13]_i_1 
       (.I0(returnPacketsFIFO_rd_data[21]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I2(returnPacketsFIFO_rd_data[53]),
        .I3(\sendLastSentPacketHeader_reg[subpacketCount_n_0_][0] ),
        .I4(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .O(\sendBRAM_dina[13]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h2200E200)) 
    \sendBRAM_dina[14]_i_1 
       (.I0(returnPacketsFIFO_rd_data[22]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I2(returnPacketsFIFO_rd_data[54]),
        .I3(\sendLastSentPacketHeader_reg[subpacketCount_n_0_][0] ),
        .I4(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .O(\sendBRAM_dina[14]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h2200E200)) 
    \sendBRAM_dina[15]_i_1 
       (.I0(returnPacketsFIFO_rd_data[23]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I2(returnPacketsFIFO_rd_data[55]),
        .I3(\sendLastSentPacketHeader_reg[subpacketCount_n_0_][0] ),
        .I4(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .O(\sendBRAM_dina[15]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h2200E200)) 
    \sendBRAM_dina[16]_i_1 
       (.I0(returnPacketsFIFO_rd_data[8]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I2(returnPacketsFIFO_rd_data[40]),
        .I3(\sendLastSentPacketHeader_reg[subpacketCount_n_0_][0] ),
        .I4(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .O(\sendBRAM_dina[16]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h2200E200)) 
    \sendBRAM_dina[17]_i_1 
       (.I0(returnPacketsFIFO_rd_data[9]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I2(returnPacketsFIFO_rd_data[41]),
        .I3(\sendLastSentPacketHeader_reg[subpacketCount_n_0_][0] ),
        .I4(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .O(\sendBRAM_dina[17]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h2200E200)) 
    \sendBRAM_dina[18]_i_1 
       (.I0(returnPacketsFIFO_rd_data[10]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I2(returnPacketsFIFO_rd_data[42]),
        .I3(\sendLastSentPacketHeader_reg[subpacketCount_n_0_][0] ),
        .I4(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .O(\sendBRAM_dina[18]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h2200E200)) 
    \sendBRAM_dina[19]_i_1 
       (.I0(returnPacketsFIFO_rd_data[11]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I2(returnPacketsFIFO_rd_data[43]),
        .I3(\sendLastSentPacketHeader_reg[subpacketCount_n_0_][0] ),
        .I4(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .O(\sendBRAM_dina[19]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT5 #(
    .INIT(32'h2200E200)) 
    \sendBRAM_dina[1]_i_1 
       (.I0(returnPacketsFIFO_rd_data[25]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I2(returnPacketsFIFO_rd_data[57]),
        .I3(\sendLastSentPacketHeader_reg[subpacketCount_n_0_][0] ),
        .I4(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .O(\sendBRAM_dina[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h2200E200)) 
    \sendBRAM_dina[20]_i_1 
       (.I0(returnPacketsFIFO_rd_data[12]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I2(returnPacketsFIFO_rd_data[44]),
        .I3(\sendLastSentPacketHeader_reg[subpacketCount_n_0_][0] ),
        .I4(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .O(\sendBRAM_dina[20]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h2200E200)) 
    \sendBRAM_dina[21]_i_1 
       (.I0(returnPacketsFIFO_rd_data[13]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I2(returnPacketsFIFO_rd_data[45]),
        .I3(\sendLastSentPacketHeader_reg[subpacketCount_n_0_][0] ),
        .I4(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .O(\sendBRAM_dina[21]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h2200E200)) 
    \sendBRAM_dina[22]_i_1 
       (.I0(returnPacketsFIFO_rd_data[14]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I2(returnPacketsFIFO_rd_data[46]),
        .I3(\sendLastSentPacketHeader_reg[subpacketCount_n_0_][0] ),
        .I4(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .O(\sendBRAM_dina[22]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h2200E200)) 
    \sendBRAM_dina[23]_i_1 
       (.I0(returnPacketsFIFO_rd_data[15]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I2(returnPacketsFIFO_rd_data[47]),
        .I3(\sendLastSentPacketHeader_reg[subpacketCount_n_0_][0] ),
        .I4(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .O(\sendBRAM_dina[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hB8FF0000B8000000)) 
    \sendBRAM_dina[24]_i_1 
       (.I0(returnPacketsFIFO_rd_data[64]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .I2(returnPacketsFIFO_rd_data[32]),
        .I3(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I4(\sendLastSentPacketHeader_reg[subpacketCount_n_0_][0] ),
        .I5(returnPacketsFIFO_rd_data[0]),
        .O(\sendBRAM_dina[24]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE2FF0000E2000000)) 
    \sendBRAM_dina[25]_i_1 
       (.I0(returnPacketsFIFO_rd_data[33]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .I2(returnPacketsFIFO_rd_data[65]),
        .I3(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I4(\sendLastSentPacketHeader_reg[subpacketCount_n_0_][0] ),
        .I5(returnPacketsFIFO_rd_data[1]),
        .O(\sendBRAM_dina[25]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE2FF0000E2000000)) 
    \sendBRAM_dina[26]_i_1 
       (.I0(returnPacketsFIFO_rd_data[34]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .I2(returnPacketsFIFO_rd_data[66]),
        .I3(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I4(\sendLastSentPacketHeader_reg[subpacketCount_n_0_][0] ),
        .I5(returnPacketsFIFO_rd_data[2]),
        .O(\sendBRAM_dina[26]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE2FF0000E2000000)) 
    \sendBRAM_dina[27]_i_1 
       (.I0(returnPacketsFIFO_rd_data[35]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .I2(returnPacketsFIFO_rd_data[67]),
        .I3(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I4(\sendLastSentPacketHeader_reg[subpacketCount_n_0_][0] ),
        .I5(returnPacketsFIFO_rd_data[3]),
        .O(\sendBRAM_dina[27]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE2FF0000E2000000)) 
    \sendBRAM_dina[28]_i_1 
       (.I0(returnPacketsFIFO_rd_data[36]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .I2(returnPacketsFIFO_rd_data[68]),
        .I3(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I4(\sendLastSentPacketHeader_reg[subpacketCount_n_0_][0] ),
        .I5(returnPacketsFIFO_rd_data[4]),
        .O(\sendBRAM_dina[28]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE2FF0000E2000000)) 
    \sendBRAM_dina[29]_i_1 
       (.I0(returnPacketsFIFO_rd_data[37]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .I2(returnPacketsFIFO_rd_data[69]),
        .I3(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I4(\sendLastSentPacketHeader_reg[subpacketCount_n_0_][0] ),
        .I5(returnPacketsFIFO_rd_data[5]),
        .O(\sendBRAM_dina[29]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT5 #(
    .INIT(32'h2200E200)) 
    \sendBRAM_dina[2]_i_1 
       (.I0(returnPacketsFIFO_rd_data[26]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I2(returnPacketsFIFO_rd_data[58]),
        .I3(\sendLastSentPacketHeader_reg[subpacketCount_n_0_][0] ),
        .I4(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .O(\sendBRAM_dina[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE2FF0000E2000000)) 
    \sendBRAM_dina[30]_i_1 
       (.I0(returnPacketsFIFO_rd_data[38]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .I2(returnPacketsFIFO_rd_data[70]),
        .I3(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I4(\sendLastSentPacketHeader_reg[subpacketCount_n_0_][0] ),
        .I5(returnPacketsFIFO_rd_data[6]),
        .O(\sendBRAM_dina[30]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE2FF0000E2000000)) 
    \sendBRAM_dina[31]_i_1 
       (.I0(returnPacketsFIFO_rd_data[39]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .I2(returnPacketsFIFO_rd_data[71]),
        .I3(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I4(\sendLastSentPacketHeader_reg[subpacketCount_n_0_][0] ),
        .I5(returnPacketsFIFO_rd_data[7]),
        .O(\sendBRAM_dina[31]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h2200E200)) 
    \sendBRAM_dina[3]_i_1 
       (.I0(returnPacketsFIFO_rd_data[27]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I2(returnPacketsFIFO_rd_data[59]),
        .I3(\sendLastSentPacketHeader_reg[subpacketCount_n_0_][0] ),
        .I4(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .O(\sendBRAM_dina[3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h2200E200)) 
    \sendBRAM_dina[4]_i_1 
       (.I0(returnPacketsFIFO_rd_data[28]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I2(returnPacketsFIFO_rd_data[60]),
        .I3(\sendLastSentPacketHeader_reg[subpacketCount_n_0_][0] ),
        .I4(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .O(\sendBRAM_dina[4]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h2200E200)) 
    \sendBRAM_dina[5]_i_1 
       (.I0(returnPacketsFIFO_rd_data[29]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I2(returnPacketsFIFO_rd_data[61]),
        .I3(\sendLastSentPacketHeader_reg[subpacketCount_n_0_][0] ),
        .I4(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .O(\sendBRAM_dina[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h2200E200)) 
    \sendBRAM_dina[6]_i_1 
       (.I0(returnPacketsFIFO_rd_data[30]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I2(returnPacketsFIFO_rd_data[62]),
        .I3(\sendLastSentPacketHeader_reg[subpacketCount_n_0_][0] ),
        .I4(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .O(\sendBRAM_dina[6]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h2200E200)) 
    \sendBRAM_dina[7]_i_1 
       (.I0(returnPacketsFIFO_rd_data[31]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I2(returnPacketsFIFO_rd_data[63]),
        .I3(\sendLastSentPacketHeader_reg[subpacketCount_n_0_][0] ),
        .I4(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .O(\sendBRAM_dina[7]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h2200E200)) 
    \sendBRAM_dina[8]_i_1 
       (.I0(returnPacketsFIFO_rd_data[16]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I2(returnPacketsFIFO_rd_data[48]),
        .I3(\sendLastSentPacketHeader_reg[subpacketCount_n_0_][0] ),
        .I4(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .O(\sendBRAM_dina[8]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h2200E200)) 
    \sendBRAM_dina[9]_i_1 
       (.I0(returnPacketsFIFO_rd_data[17]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I2(returnPacketsFIFO_rd_data[49]),
        .I3(\sendLastSentPacketHeader_reg[subpacketCount_n_0_][0] ),
        .I4(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .O(\sendBRAM_dina[9]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SendPacketBRAMW DIN" *) 
  FDRE #(
    .INIT(1'b0)) 
    \sendBRAM_dina_reg[0] 
       (.C(clk333_250),
        .CE(\sendBRAM_addra[1]_i_1_n_0 ),
        .D(\sendBRAM_dina[0]_i_1_n_0 ),
        .Q(sendBRAM_dina[0]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SendPacketBRAMW DIN" *) 
  FDRE #(
    .INIT(1'b0)) 
    \sendBRAM_dina_reg[10] 
       (.C(clk333_250),
        .CE(\sendBRAM_addra[1]_i_1_n_0 ),
        .D(\sendBRAM_dina[10]_i_1_n_0 ),
        .Q(sendBRAM_dina[10]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SendPacketBRAMW DIN" *) 
  FDRE #(
    .INIT(1'b0)) 
    \sendBRAM_dina_reg[11] 
       (.C(clk333_250),
        .CE(\sendBRAM_addra[1]_i_1_n_0 ),
        .D(\sendBRAM_dina[11]_i_1_n_0 ),
        .Q(sendBRAM_dina[11]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SendPacketBRAMW DIN" *) 
  FDRE #(
    .INIT(1'b0)) 
    \sendBRAM_dina_reg[12] 
       (.C(clk333_250),
        .CE(\sendBRAM_addra[1]_i_1_n_0 ),
        .D(\sendBRAM_dina[12]_i_1_n_0 ),
        .Q(sendBRAM_dina[12]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SendPacketBRAMW DIN" *) 
  FDRE #(
    .INIT(1'b0)) 
    \sendBRAM_dina_reg[13] 
       (.C(clk333_250),
        .CE(\sendBRAM_addra[1]_i_1_n_0 ),
        .D(\sendBRAM_dina[13]_i_1_n_0 ),
        .Q(sendBRAM_dina[13]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SendPacketBRAMW DIN" *) 
  FDRE #(
    .INIT(1'b0)) 
    \sendBRAM_dina_reg[14] 
       (.C(clk333_250),
        .CE(\sendBRAM_addra[1]_i_1_n_0 ),
        .D(\sendBRAM_dina[14]_i_1_n_0 ),
        .Q(sendBRAM_dina[14]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SendPacketBRAMW DIN" *) 
  FDRE #(
    .INIT(1'b0)) 
    \sendBRAM_dina_reg[15] 
       (.C(clk333_250),
        .CE(\sendBRAM_addra[1]_i_1_n_0 ),
        .D(\sendBRAM_dina[15]_i_1_n_0 ),
        .Q(sendBRAM_dina[15]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SendPacketBRAMW DIN" *) 
  FDRE #(
    .INIT(1'b0)) 
    \sendBRAM_dina_reg[16] 
       (.C(clk333_250),
        .CE(\sendBRAM_addra[1]_i_1_n_0 ),
        .D(\sendBRAM_dina[16]_i_1_n_0 ),
        .Q(sendBRAM_dina[16]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SendPacketBRAMW DIN" *) 
  FDRE #(
    .INIT(1'b0)) 
    \sendBRAM_dina_reg[17] 
       (.C(clk333_250),
        .CE(\sendBRAM_addra[1]_i_1_n_0 ),
        .D(\sendBRAM_dina[17]_i_1_n_0 ),
        .Q(sendBRAM_dina[17]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SendPacketBRAMW DIN" *) 
  FDRE #(
    .INIT(1'b0)) 
    \sendBRAM_dina_reg[18] 
       (.C(clk333_250),
        .CE(\sendBRAM_addra[1]_i_1_n_0 ),
        .D(\sendBRAM_dina[18]_i_1_n_0 ),
        .Q(sendBRAM_dina[18]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SendPacketBRAMW DIN" *) 
  FDRE #(
    .INIT(1'b0)) 
    \sendBRAM_dina_reg[19] 
       (.C(clk333_250),
        .CE(\sendBRAM_addra[1]_i_1_n_0 ),
        .D(\sendBRAM_dina[19]_i_1_n_0 ),
        .Q(sendBRAM_dina[19]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SendPacketBRAMW DIN" *) 
  FDRE #(
    .INIT(1'b0)) 
    \sendBRAM_dina_reg[1] 
       (.C(clk333_250),
        .CE(\sendBRAM_addra[1]_i_1_n_0 ),
        .D(\sendBRAM_dina[1]_i_1_n_0 ),
        .Q(sendBRAM_dina[1]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SendPacketBRAMW DIN" *) 
  FDRE #(
    .INIT(1'b0)) 
    \sendBRAM_dina_reg[20] 
       (.C(clk333_250),
        .CE(\sendBRAM_addra[1]_i_1_n_0 ),
        .D(\sendBRAM_dina[20]_i_1_n_0 ),
        .Q(sendBRAM_dina[20]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SendPacketBRAMW DIN" *) 
  FDRE #(
    .INIT(1'b0)) 
    \sendBRAM_dina_reg[21] 
       (.C(clk333_250),
        .CE(\sendBRAM_addra[1]_i_1_n_0 ),
        .D(\sendBRAM_dina[21]_i_1_n_0 ),
        .Q(sendBRAM_dina[21]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SendPacketBRAMW DIN" *) 
  FDRE #(
    .INIT(1'b0)) 
    \sendBRAM_dina_reg[22] 
       (.C(clk333_250),
        .CE(\sendBRAM_addra[1]_i_1_n_0 ),
        .D(\sendBRAM_dina[22]_i_1_n_0 ),
        .Q(sendBRAM_dina[22]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SendPacketBRAMW DIN" *) 
  FDRE #(
    .INIT(1'b0)) 
    \sendBRAM_dina_reg[23] 
       (.C(clk333_250),
        .CE(\sendBRAM_addra[1]_i_1_n_0 ),
        .D(\sendBRAM_dina[23]_i_1_n_0 ),
        .Q(sendBRAM_dina[23]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SendPacketBRAMW DIN" *) 
  FDRE #(
    .INIT(1'b0)) 
    \sendBRAM_dina_reg[24] 
       (.C(clk333_250),
        .CE(\sendBRAM_addra[1]_i_1_n_0 ),
        .D(\sendBRAM_dina[24]_i_1_n_0 ),
        .Q(sendBRAM_dina[24]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SendPacketBRAMW DIN" *) 
  FDRE #(
    .INIT(1'b0)) 
    \sendBRAM_dina_reg[25] 
       (.C(clk333_250),
        .CE(\sendBRAM_addra[1]_i_1_n_0 ),
        .D(\sendBRAM_dina[25]_i_1_n_0 ),
        .Q(sendBRAM_dina[25]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SendPacketBRAMW DIN" *) 
  FDRE #(
    .INIT(1'b0)) 
    \sendBRAM_dina_reg[26] 
       (.C(clk333_250),
        .CE(\sendBRAM_addra[1]_i_1_n_0 ),
        .D(\sendBRAM_dina[26]_i_1_n_0 ),
        .Q(sendBRAM_dina[26]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SendPacketBRAMW DIN" *) 
  FDRE #(
    .INIT(1'b0)) 
    \sendBRAM_dina_reg[27] 
       (.C(clk333_250),
        .CE(\sendBRAM_addra[1]_i_1_n_0 ),
        .D(\sendBRAM_dina[27]_i_1_n_0 ),
        .Q(sendBRAM_dina[27]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SendPacketBRAMW DIN" *) 
  FDRE #(
    .INIT(1'b0)) 
    \sendBRAM_dina_reg[28] 
       (.C(clk333_250),
        .CE(\sendBRAM_addra[1]_i_1_n_0 ),
        .D(\sendBRAM_dina[28]_i_1_n_0 ),
        .Q(sendBRAM_dina[28]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SendPacketBRAMW DIN" *) 
  FDRE #(
    .INIT(1'b0)) 
    \sendBRAM_dina_reg[29] 
       (.C(clk333_250),
        .CE(\sendBRAM_addra[1]_i_1_n_0 ),
        .D(\sendBRAM_dina[29]_i_1_n_0 ),
        .Q(sendBRAM_dina[29]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SendPacketBRAMW DIN" *) 
  FDRE #(
    .INIT(1'b0)) 
    \sendBRAM_dina_reg[2] 
       (.C(clk333_250),
        .CE(\sendBRAM_addra[1]_i_1_n_0 ),
        .D(\sendBRAM_dina[2]_i_1_n_0 ),
        .Q(sendBRAM_dina[2]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SendPacketBRAMW DIN" *) 
  FDRE #(
    .INIT(1'b0)) 
    \sendBRAM_dina_reg[30] 
       (.C(clk333_250),
        .CE(\sendBRAM_addra[1]_i_1_n_0 ),
        .D(\sendBRAM_dina[30]_i_1_n_0 ),
        .Q(sendBRAM_dina[30]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SendPacketBRAMW DIN" *) 
  FDRE #(
    .INIT(1'b0)) 
    \sendBRAM_dina_reg[31] 
       (.C(clk333_250),
        .CE(\sendBRAM_addra[1]_i_1_n_0 ),
        .D(\sendBRAM_dina[31]_i_1_n_0 ),
        .Q(sendBRAM_dina[31]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SendPacketBRAMW DIN" *) 
  FDRE #(
    .INIT(1'b0)) 
    \sendBRAM_dina_reg[3] 
       (.C(clk333_250),
        .CE(\sendBRAM_addra[1]_i_1_n_0 ),
        .D(\sendBRAM_dina[3]_i_1_n_0 ),
        .Q(sendBRAM_dina[3]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SendPacketBRAMW DIN" *) 
  FDRE #(
    .INIT(1'b0)) 
    \sendBRAM_dina_reg[4] 
       (.C(clk333_250),
        .CE(\sendBRAM_addra[1]_i_1_n_0 ),
        .D(\sendBRAM_dina[4]_i_1_n_0 ),
        .Q(sendBRAM_dina[4]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SendPacketBRAMW DIN" *) 
  FDRE #(
    .INIT(1'b0)) 
    \sendBRAM_dina_reg[5] 
       (.C(clk333_250),
        .CE(\sendBRAM_addra[1]_i_1_n_0 ),
        .D(\sendBRAM_dina[5]_i_1_n_0 ),
        .Q(sendBRAM_dina[5]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SendPacketBRAMW DIN" *) 
  FDRE #(
    .INIT(1'b0)) 
    \sendBRAM_dina_reg[6] 
       (.C(clk333_250),
        .CE(\sendBRAM_addra[1]_i_1_n_0 ),
        .D(\sendBRAM_dina[6]_i_1_n_0 ),
        .Q(sendBRAM_dina[6]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SendPacketBRAMW DIN" *) 
  FDRE #(
    .INIT(1'b0)) 
    \sendBRAM_dina_reg[7] 
       (.C(clk333_250),
        .CE(\sendBRAM_addra[1]_i_1_n_0 ),
        .D(\sendBRAM_dina[7]_i_1_n_0 ),
        .Q(sendBRAM_dina[7]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SendPacketBRAMW DIN" *) 
  FDRE #(
    .INIT(1'b0)) 
    \sendBRAM_dina_reg[8] 
       (.C(clk333_250),
        .CE(\sendBRAM_addra[1]_i_1_n_0 ),
        .D(\sendBRAM_dina[8]_i_1_n_0 ),
        .Q(sendBRAM_dina[8]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SendPacketBRAMW DIN" *) 
  FDRE #(
    .INIT(1'b0)) 
    \sendBRAM_dina_reg[9] 
       (.C(clk333_250),
        .CE(\sendBRAM_addra[1]_i_1_n_0 ),
        .D(\sendBRAM_dina[9]_i_1_n_0 ),
        .Q(sendBRAM_dina[9]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SendPacketBRAMW WE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \sendBRAM_wea_reg[0] 
       (.C(clk333_250),
        .CE(1'b1),
        .D(\sendBRAM_addra[1]_i_1_n_0 ),
        .Q(sendBRAM_wea),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT5 #(
    .INIT(32'h00000B00)) 
    \sendClocksBetweenBroadcastsWait[0]_i_1 
       (.I0(sendReplyAck_reg_0),
        .I1(recvSendReplyPacket_reg_0),
        .I2(\sendClocksBetweenBroadcastsWait[31]_i_4_n_0 ),
        .I3(sendHasRepliedSuccessfulConnection),
        .I4(\sendClocksBetweenBroadcastsWait_reg_n_0_[0] ),
        .O(\sendClocksBetweenBroadcastsWait[0]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \sendClocksBetweenBroadcastsWait[16]_i_2 
       (.I0(\sendClocksBetweenBroadcastsWait_reg_n_0_[16] ),
        .O(\sendClocksBetweenBroadcastsWait[16]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \sendClocksBetweenBroadcastsWait[16]_i_3 
       (.I0(\sendClocksBetweenBroadcastsWait_reg_n_0_[15] ),
        .O(\sendClocksBetweenBroadcastsWait[16]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \sendClocksBetweenBroadcastsWait[16]_i_4 
       (.I0(\sendClocksBetweenBroadcastsWait_reg_n_0_[14] ),
        .O(\sendClocksBetweenBroadcastsWait[16]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \sendClocksBetweenBroadcastsWait[16]_i_5 
       (.I0(\sendClocksBetweenBroadcastsWait_reg_n_0_[13] ),
        .O(\sendClocksBetweenBroadcastsWait[16]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \sendClocksBetweenBroadcastsWait[16]_i_6 
       (.I0(\sendClocksBetweenBroadcastsWait_reg_n_0_[12] ),
        .O(\sendClocksBetweenBroadcastsWait[16]_i_6_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \sendClocksBetweenBroadcastsWait[16]_i_7 
       (.I0(\sendClocksBetweenBroadcastsWait_reg_n_0_[11] ),
        .O(\sendClocksBetweenBroadcastsWait[16]_i_7_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \sendClocksBetweenBroadcastsWait[16]_i_8 
       (.I0(\sendClocksBetweenBroadcastsWait_reg_n_0_[10] ),
        .O(\sendClocksBetweenBroadcastsWait[16]_i_8_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \sendClocksBetweenBroadcastsWait[16]_i_9 
       (.I0(\sendClocksBetweenBroadcastsWait_reg_n_0_[9] ),
        .O(\sendClocksBetweenBroadcastsWait[16]_i_9_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \sendClocksBetweenBroadcastsWait[21]_i_2 
       (.I0(\sendClocksBetweenBroadcastsWait_reg_n_0_[24] ),
        .O(\sendClocksBetweenBroadcastsWait[21]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \sendClocksBetweenBroadcastsWait[21]_i_3 
       (.I0(\sendClocksBetweenBroadcastsWait_reg_n_0_[23] ),
        .O(\sendClocksBetweenBroadcastsWait[21]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \sendClocksBetweenBroadcastsWait[21]_i_4 
       (.I0(\sendClocksBetweenBroadcastsWait_reg_n_0_[22] ),
        .O(\sendClocksBetweenBroadcastsWait[21]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \sendClocksBetweenBroadcastsWait[21]_i_5 
       (.I0(\sendClocksBetweenBroadcastsWait_reg_n_0_[21] ),
        .O(\sendClocksBetweenBroadcastsWait[21]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \sendClocksBetweenBroadcastsWait[21]_i_6 
       (.I0(\sendClocksBetweenBroadcastsWait_reg_n_0_[20] ),
        .O(\sendClocksBetweenBroadcastsWait[21]_i_6_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \sendClocksBetweenBroadcastsWait[21]_i_7 
       (.I0(\sendClocksBetweenBroadcastsWait_reg_n_0_[19] ),
        .O(\sendClocksBetweenBroadcastsWait[21]_i_7_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \sendClocksBetweenBroadcastsWait[21]_i_8 
       (.I0(\sendClocksBetweenBroadcastsWait_reg_n_0_[18] ),
        .O(\sendClocksBetweenBroadcastsWait[21]_i_8_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \sendClocksBetweenBroadcastsWait[21]_i_9 
       (.I0(\sendClocksBetweenBroadcastsWait_reg_n_0_[17] ),
        .O(\sendClocksBetweenBroadcastsWait[21]_i_9_n_0 ));
  LUT5 #(
    .INIT(32'hF4FF0000)) 
    \sendClocksBetweenBroadcastsWait[31]_i_1 
       (.I0(sendReplyAck_reg_0),
        .I1(recvSendReplyPacket_reg_0),
        .I2(\sendClocksBetweenBroadcastsWait[31]_i_4_n_0 ),
        .I3(sendHasRepliedSuccessfulConnection),
        .I4(\sendClocksBetweenBroadcastsWait[31]_i_2_n_0 ),
        .O(\sendClocksBetweenBroadcastsWait[31]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \sendClocksBetweenBroadcastsWait[31]_i_10 
       (.I0(\sendClocksBetweenBroadcastsWait_reg_n_0_[29] ),
        .O(\sendClocksBetweenBroadcastsWait[31]_i_10_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \sendClocksBetweenBroadcastsWait[31]_i_11 
       (.I0(\sendClocksBetweenBroadcastsWait_reg_n_0_[28] ),
        .O(\sendClocksBetweenBroadcastsWait[31]_i_11_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \sendClocksBetweenBroadcastsWait[31]_i_12 
       (.I0(\sendClocksBetweenBroadcastsWait_reg_n_0_[27] ),
        .O(\sendClocksBetweenBroadcastsWait[31]_i_12_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \sendClocksBetweenBroadcastsWait[31]_i_13 
       (.I0(\sendClocksBetweenBroadcastsWait_reg_n_0_[26] ),
        .O(\sendClocksBetweenBroadcastsWait[31]_i_13_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \sendClocksBetweenBroadcastsWait[31]_i_14 
       (.I0(\sendClocksBetweenBroadcastsWait_reg_n_0_[25] ),
        .O(\sendClocksBetweenBroadcastsWait[31]_i_14_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \sendClocksBetweenBroadcastsWait[31]_i_15 
       (.I0(\sendClocksBetweenBroadcastsWait_reg_n_0_[16] ),
        .I1(\sendClocksBetweenBroadcastsWait_reg_n_0_[17] ),
        .I2(\sendClocksBetweenBroadcastsWait_reg_n_0_[4] ),
        .I3(\sendClocksBetweenBroadcastsWait_reg_n_0_[5] ),
        .O(\sendClocksBetweenBroadcastsWait[31]_i_15_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair95" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \sendClocksBetweenBroadcastsWait[31]_i_16 
       (.I0(\sendClocksBetweenBroadcastsWait_reg_n_0_[19] ),
        .I1(\sendClocksBetweenBroadcastsWait_reg_n_0_[20] ),
        .I2(\sendClocksBetweenBroadcastsWait_reg_n_0_[25] ),
        .I3(\sendClocksBetweenBroadcastsWait_reg_n_0_[26] ),
        .O(\sendClocksBetweenBroadcastsWait[31]_i_16_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair94" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \sendClocksBetweenBroadcastsWait[31]_i_17 
       (.I0(\sendClocksBetweenBroadcastsWait_reg_n_0_[10] ),
        .I1(\sendClocksBetweenBroadcastsWait_reg_n_0_[11] ),
        .I2(\sendClocksBetweenBroadcastsWait_reg_n_0_[13] ),
        .I3(\sendClocksBetweenBroadcastsWait_reg_n_0_[14] ),
        .O(\sendClocksBetweenBroadcastsWait[31]_i_17_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \sendClocksBetweenBroadcastsWait[31]_i_18 
       (.I0(\sendClocksBetweenBroadcastsWait_reg_n_0_[12] ),
        .I1(\sendClocksBetweenBroadcastsWait_reg_n_0_[0] ),
        .I2(\sendClocksBetweenBroadcastsWait_reg_n_0_[21] ),
        .I3(\sendClocksBetweenBroadcastsWait_reg_n_0_[15] ),
        .I4(\sendClocksBetweenBroadcastsWait[31]_i_26_n_0 ),
        .O(\sendClocksBetweenBroadcastsWait[31]_i_18_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \sendClocksBetweenBroadcastsWait[31]_i_19 
       (.I0(\sendClocksBetweenBroadcastsWait_reg_n_0_[24] ),
        .I1(\sendClocksBetweenBroadcastsWait_reg_n_0_[18] ),
        .I2(\sendClocksBetweenBroadcastsWait_reg_n_0_[2] ),
        .I3(\sendClocksBetweenBroadcastsWait_reg_n_0_[1] ),
        .I4(\sendClocksBetweenBroadcastsWait[31]_i_27_n_0 ),
        .I5(\sendClocksBetweenBroadcastsWait[31]_i_28_n_0 ),
        .O(\sendClocksBetweenBroadcastsWait[31]_i_19_n_0 ));
  LUT6 #(
    .INIT(64'h7070707070707050)) 
    \sendClocksBetweenBroadcastsWait[31]_i_2 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(sendHandlingReply_reg_0),
        .I2(\currentState[0]_i_1_n_0 ),
        .I3(\sendClocksBetweenBroadcastsWait[31]_i_5_n_0 ),
        .I4(\sendClocksBetweenBroadcastsWait[31]_i_6_n_0 ),
        .I5(\sendClocksBetweenBroadcastsWait[31]_i_7_n_0 ),
        .O(\sendClocksBetweenBroadcastsWait[31]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hBA)) 
    \sendClocksBetweenBroadcastsWait[31]_i_20 
       (.I0(\sendClocksBetweenBroadcastsWait_reg_n_0_[8] ),
        .I1(\sendClocksBetweenBroadcastsWait_reg_n_0_[7] ),
        .I2(\sendClocksBetweenBroadcastsWait_reg_n_0_[6] ),
        .O(\sendClocksBetweenBroadcastsWait[31]_i_20_n_0 ));
  LUT6 #(
    .INIT(64'h000000000D0D000D)) 
    \sendClocksBetweenBroadcastsWait[31]_i_21 
       (.I0(\sendClocksBetweenBroadcastsWait_reg_n_0_[9] ),
        .I1(\sendClocksBetweenBroadcastsWait_reg_n_0_[10] ),
        .I2(\sendClocksBetweenBroadcastsWait_reg_n_0_[11] ),
        .I3(\sendClocksBetweenBroadcastsWait_reg_n_0_[0] ),
        .I4(\sendClocksBetweenBroadcastsWait_reg_n_0_[1] ),
        .I5(\sendClocksBetweenBroadcastsWait_reg_n_0_[2] ),
        .O(\sendClocksBetweenBroadcastsWait[31]_i_21_n_0 ));
  LUT6 #(
    .INIT(64'h1101110100001101)) 
    \sendClocksBetweenBroadcastsWait[31]_i_22 
       (.I0(\sendClocksBetweenBroadcastsWait_reg_n_0_[17] ),
        .I1(\sendClocksBetweenBroadcastsWait_reg_n_0_[23] ),
        .I2(\sendClocksBetweenBroadcastsWait_reg_n_0_[21] ),
        .I3(\sendClocksBetweenBroadcastsWait_reg_n_0_[22] ),
        .I4(\sendClocksBetweenBroadcastsWait_reg_n_0_[15] ),
        .I5(\sendClocksBetweenBroadcastsWait_reg_n_0_[16] ),
        .O(\sendClocksBetweenBroadcastsWait[31]_i_22_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFEFEE)) 
    \sendClocksBetweenBroadcastsWait[31]_i_23 
       (.I0(\send_pkt_data_wr_data[31]_i_10_n_0 ),
        .I1(\sendClocksBetweenBroadcastsWait_reg_n_0_[26] ),
        .I2(\sendClocksBetweenBroadcastsWait_reg_n_0_[25] ),
        .I3(\sendClocksBetweenBroadcastsWait_reg_n_0_[24] ),
        .I4(\sendCurrentPacket[hostMACAddress][47]_i_7_n_0 ),
        .I5(\sendClocksBetweenBroadcastsWait[31]_i_29_n_0 ),
        .O(\sendClocksBetweenBroadcastsWait[31]_i_23_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \sendClocksBetweenBroadcastsWait[31]_i_24 
       (.I0(\sendClocksBetweenBroadcastsWait_reg_n_0_[10] ),
        .I1(\sendClocksBetweenBroadcastsWait_reg_n_0_[11] ),
        .I2(\sendClocksBetweenBroadcastsWait_reg_n_0_[26] ),
        .I3(\sendClocksBetweenBroadcastsWait_reg_n_0_[25] ),
        .I4(\sendClocksBetweenBroadcastsWait_reg_n_0_[20] ),
        .I5(\sendClocksBetweenBroadcastsWait_reg_n_0_[19] ),
        .O(\sendClocksBetweenBroadcastsWait[31]_i_24_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \sendClocksBetweenBroadcastsWait[31]_i_25 
       (.I0(\sendClocksBetweenBroadcastsWait[31]_i_15_n_0 ),
        .I1(\sendClocksBetweenBroadcastsWait_reg_n_0_[2] ),
        .I2(\sendClocksBetweenBroadcastsWait_reg_n_0_[1] ),
        .I3(\sendClocksBetweenBroadcastsWait_reg_n_0_[8] ),
        .I4(\sendClocksBetweenBroadcastsWait_reg_n_0_[7] ),
        .O(\sendClocksBetweenBroadcastsWait[31]_i_25_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \sendClocksBetweenBroadcastsWait[31]_i_26 
       (.I0(\sendClocksBetweenBroadcastsWait_reg_n_0_[3] ),
        .I1(\sendClocksBetweenBroadcastsWait_reg_n_0_[9] ),
        .I2(\sendClocksBetweenBroadcastsWait_reg_n_0_[6] ),
        .I3(\sendClocksBetweenBroadcastsWait_reg_n_0_[27] ),
        .O(\sendClocksBetweenBroadcastsWait[31]_i_26_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \sendClocksBetweenBroadcastsWait[31]_i_27 
       (.I0(\sendClocksBetweenBroadcastsWait_reg_n_0_[23] ),
        .I1(\sendClocksBetweenBroadcastsWait_reg_n_0_[22] ),
        .O(\sendClocksBetweenBroadcastsWait[31]_i_27_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \sendClocksBetweenBroadcastsWait[31]_i_28 
       (.I0(\sendClocksBetweenBroadcastsWait_reg_n_0_[8] ),
        .I1(\sendClocksBetweenBroadcastsWait_reg_n_0_[7] ),
        .O(\sendClocksBetweenBroadcastsWait[31]_i_28_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair94" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \sendClocksBetweenBroadcastsWait[31]_i_29 
       (.I0(\sendClocksBetweenBroadcastsWait_reg_n_0_[14] ),
        .I1(\sendClocksBetweenBroadcastsWait_reg_n_0_[13] ),
        .I2(\sendClocksBetweenBroadcastsWait_reg_n_0_[12] ),
        .O(\sendClocksBetweenBroadcastsWait[31]_i_29_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \sendClocksBetweenBroadcastsWait[31]_i_4 
       (.I0(\sendClocksBetweenBroadcastsWait[31]_i_15_n_0 ),
        .I1(\sendClocksBetweenBroadcastsWait[31]_i_16_n_0 ),
        .I2(\send_pkt_data_wr_data[31]_i_10_n_0 ),
        .I3(\sendClocksBetweenBroadcastsWait[31]_i_17_n_0 ),
        .I4(\sendClocksBetweenBroadcastsWait[31]_i_18_n_0 ),
        .I5(\sendClocksBetweenBroadcastsWait[31]_i_19_n_0 ),
        .O(\sendClocksBetweenBroadcastsWait[31]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hEFEEFFFFFFFFFFFF)) 
    \sendClocksBetweenBroadcastsWait[31]_i_5 
       (.I0(\sendClocksBetweenBroadcastsWait[31]_i_20_n_0 ),
        .I1(\sendClocksBetweenBroadcastsWait_reg_n_0_[5] ),
        .I2(\sendClocksBetweenBroadcastsWait_reg_n_0_[4] ),
        .I3(\sendClocksBetweenBroadcastsWait_reg_n_0_[3] ),
        .I4(\sendClocksBetweenBroadcastsWait[31]_i_21_n_0 ),
        .I5(\sendClocksBetweenBroadcastsWait[31]_i_22_n_0 ),
        .O(\sendClocksBetweenBroadcastsWait[31]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFBA)) 
    \sendClocksBetweenBroadcastsWait[31]_i_6 
       (.I0(\sendClocksBetweenBroadcastsWait[31]_i_23_n_0 ),
        .I1(\sendClocksBetweenBroadcastsWait_reg_n_0_[28] ),
        .I2(\sendClocksBetweenBroadcastsWait_reg_n_0_[27] ),
        .I3(send_pkt_header_wr_en1),
        .I4(DBG_SendFIFOState[2]),
        .I5(\sendClocksBetweenBroadcastsWait[31]_i_24_n_0 ),
        .O(\sendClocksBetweenBroadcastsWait[31]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \sendClocksBetweenBroadcastsWait[31]_i_7 
       (.I0(\sendClocksBetweenBroadcastsWait[31]_i_25_n_0 ),
        .I1(\sendClocksBetweenBroadcastsWait_reg_n_0_[23] ),
        .I2(\sendClocksBetweenBroadcastsWait_reg_n_0_[22] ),
        .I3(\sendClocksBetweenBroadcastsWait_reg_n_0_[14] ),
        .I4(\sendClocksBetweenBroadcastsWait_reg_n_0_[13] ),
        .O(\sendClocksBetweenBroadcastsWait[31]_i_7_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \sendClocksBetweenBroadcastsWait[31]_i_8 
       (.I0(\sendClocksBetweenBroadcastsWait_reg_n_0_[31] ),
        .O(\sendClocksBetweenBroadcastsWait[31]_i_8_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \sendClocksBetweenBroadcastsWait[31]_i_9 
       (.I0(\sendClocksBetweenBroadcastsWait_reg_n_0_[30] ),
        .O(\sendClocksBetweenBroadcastsWait[31]_i_9_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \sendClocksBetweenBroadcastsWait[5]_i_2 
       (.I0(\sendClocksBetweenBroadcastsWait_reg_n_0_[8] ),
        .O(\sendClocksBetweenBroadcastsWait[5]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \sendClocksBetweenBroadcastsWait[5]_i_3 
       (.I0(\sendClocksBetweenBroadcastsWait_reg_n_0_[7] ),
        .O(\sendClocksBetweenBroadcastsWait[5]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \sendClocksBetweenBroadcastsWait[5]_i_4 
       (.I0(\sendClocksBetweenBroadcastsWait_reg_n_0_[6] ),
        .O(\sendClocksBetweenBroadcastsWait[5]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \sendClocksBetweenBroadcastsWait[5]_i_5 
       (.I0(\sendClocksBetweenBroadcastsWait_reg_n_0_[5] ),
        .O(\sendClocksBetweenBroadcastsWait[5]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \sendClocksBetweenBroadcastsWait[5]_i_6 
       (.I0(\sendClocksBetweenBroadcastsWait_reg_n_0_[4] ),
        .O(\sendClocksBetweenBroadcastsWait[5]_i_6_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \sendClocksBetweenBroadcastsWait[5]_i_7 
       (.I0(\sendClocksBetweenBroadcastsWait_reg_n_0_[3] ),
        .O(\sendClocksBetweenBroadcastsWait[5]_i_7_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \sendClocksBetweenBroadcastsWait[5]_i_8 
       (.I0(\sendClocksBetweenBroadcastsWait_reg_n_0_[2] ),
        .O(\sendClocksBetweenBroadcastsWait[5]_i_8_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \sendClocksBetweenBroadcastsWait[5]_i_9 
       (.I0(\sendClocksBetweenBroadcastsWait_reg_n_0_[1] ),
        .O(\sendClocksBetweenBroadcastsWait[5]_i_9_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendClocksBetweenBroadcastsWait_reg[0] 
       (.C(clk333_250),
        .CE(\sendClocksBetweenBroadcastsWait[31]_i_2_n_0 ),
        .D(\sendClocksBetweenBroadcastsWait[0]_i_1_n_0 ),
        .Q(\sendClocksBetweenBroadcastsWait_reg_n_0_[0] ),
        .R(1'b0));
  FDSE #(
    .INIT(1'b1)) 
    \sendClocksBetweenBroadcastsWait_reg[10] 
       (.C(clk333_250),
        .CE(\sendClocksBetweenBroadcastsWait[31]_i_2_n_0 ),
        .D(\sendClocksBetweenBroadcastsWait_reg[16]_i_1_n_14 ),
        .Q(\sendClocksBetweenBroadcastsWait_reg_n_0_[10] ),
        .S(\sendClocksBetweenBroadcastsWait[31]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \sendClocksBetweenBroadcastsWait_reg[11] 
       (.C(clk333_250),
        .CE(\sendClocksBetweenBroadcastsWait[31]_i_2_n_0 ),
        .D(\sendClocksBetweenBroadcastsWait_reg[16]_i_1_n_13 ),
        .Q(\sendClocksBetweenBroadcastsWait_reg_n_0_[11] ),
        .S(\sendClocksBetweenBroadcastsWait[31]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \sendClocksBetweenBroadcastsWait_reg[12] 
       (.C(clk333_250),
        .CE(\sendClocksBetweenBroadcastsWait[31]_i_2_n_0 ),
        .D(\sendClocksBetweenBroadcastsWait_reg[16]_i_1_n_12 ),
        .Q(\sendClocksBetweenBroadcastsWait_reg_n_0_[12] ),
        .S(\sendClocksBetweenBroadcastsWait[31]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \sendClocksBetweenBroadcastsWait_reg[13] 
       (.C(clk333_250),
        .CE(\sendClocksBetweenBroadcastsWait[31]_i_2_n_0 ),
        .D(\sendClocksBetweenBroadcastsWait_reg[16]_i_1_n_11 ),
        .Q(\sendClocksBetweenBroadcastsWait_reg_n_0_[13] ),
        .S(\sendClocksBetweenBroadcastsWait[31]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \sendClocksBetweenBroadcastsWait_reg[14] 
       (.C(clk333_250),
        .CE(\sendClocksBetweenBroadcastsWait[31]_i_2_n_0 ),
        .D(\sendClocksBetweenBroadcastsWait_reg[16]_i_1_n_10 ),
        .Q(\sendClocksBetweenBroadcastsWait_reg_n_0_[14] ),
        .S(\sendClocksBetweenBroadcastsWait[31]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \sendClocksBetweenBroadcastsWait_reg[15] 
       (.C(clk333_250),
        .CE(\sendClocksBetweenBroadcastsWait[31]_i_2_n_0 ),
        .D(\sendClocksBetweenBroadcastsWait_reg[16]_i_1_n_9 ),
        .Q(\sendClocksBetweenBroadcastsWait_reg_n_0_[15] ),
        .S(\sendClocksBetweenBroadcastsWait[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendClocksBetweenBroadcastsWait_reg[16] 
       (.C(clk333_250),
        .CE(\sendClocksBetweenBroadcastsWait[31]_i_2_n_0 ),
        .D(\sendClocksBetweenBroadcastsWait_reg[16]_i_1_n_8 ),
        .Q(\sendClocksBetweenBroadcastsWait_reg_n_0_[16] ),
        .R(\sendClocksBetweenBroadcastsWait[31]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \sendClocksBetweenBroadcastsWait_reg[16]_i_1 
       (.CI(\sendClocksBetweenBroadcastsWait_reg[5]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\sendClocksBetweenBroadcastsWait_reg[16]_i_1_n_0 ,\sendClocksBetweenBroadcastsWait_reg[16]_i_1_n_1 ,\sendClocksBetweenBroadcastsWait_reg[16]_i_1_n_2 ,\sendClocksBetweenBroadcastsWait_reg[16]_i_1_n_3 ,\sendClocksBetweenBroadcastsWait_reg[16]_i_1_n_4 ,\sendClocksBetweenBroadcastsWait_reg[16]_i_1_n_5 ,\sendClocksBetweenBroadcastsWait_reg[16]_i_1_n_6 ,\sendClocksBetweenBroadcastsWait_reg[16]_i_1_n_7 }),
        .DI({\sendClocksBetweenBroadcastsWait_reg_n_0_[16] ,\sendClocksBetweenBroadcastsWait_reg_n_0_[15] ,\sendClocksBetweenBroadcastsWait_reg_n_0_[14] ,\sendClocksBetweenBroadcastsWait_reg_n_0_[13] ,\sendClocksBetweenBroadcastsWait_reg_n_0_[12] ,\sendClocksBetweenBroadcastsWait_reg_n_0_[11] ,\sendClocksBetweenBroadcastsWait_reg_n_0_[10] ,\sendClocksBetweenBroadcastsWait_reg_n_0_[9] }),
        .O({\sendClocksBetweenBroadcastsWait_reg[16]_i_1_n_8 ,\sendClocksBetweenBroadcastsWait_reg[16]_i_1_n_9 ,\sendClocksBetweenBroadcastsWait_reg[16]_i_1_n_10 ,\sendClocksBetweenBroadcastsWait_reg[16]_i_1_n_11 ,\sendClocksBetweenBroadcastsWait_reg[16]_i_1_n_12 ,\sendClocksBetweenBroadcastsWait_reg[16]_i_1_n_13 ,\sendClocksBetweenBroadcastsWait_reg[16]_i_1_n_14 ,\sendClocksBetweenBroadcastsWait_reg[16]_i_1_n_15 }),
        .S({\sendClocksBetweenBroadcastsWait[16]_i_2_n_0 ,\sendClocksBetweenBroadcastsWait[16]_i_3_n_0 ,\sendClocksBetweenBroadcastsWait[16]_i_4_n_0 ,\sendClocksBetweenBroadcastsWait[16]_i_5_n_0 ,\sendClocksBetweenBroadcastsWait[16]_i_6_n_0 ,\sendClocksBetweenBroadcastsWait[16]_i_7_n_0 ,\sendClocksBetweenBroadcastsWait[16]_i_8_n_0 ,\sendClocksBetweenBroadcastsWait[16]_i_9_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \sendClocksBetweenBroadcastsWait_reg[17] 
       (.C(clk333_250),
        .CE(\sendClocksBetweenBroadcastsWait[31]_i_2_n_0 ),
        .D(\sendClocksBetweenBroadcastsWait_reg[21]_i_1_n_15 ),
        .Q(\sendClocksBetweenBroadcastsWait_reg_n_0_[17] ),
        .R(\sendClocksBetweenBroadcastsWait[31]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \sendClocksBetweenBroadcastsWait_reg[18] 
       (.C(clk333_250),
        .CE(\sendClocksBetweenBroadcastsWait[31]_i_2_n_0 ),
        .D(\sendClocksBetweenBroadcastsWait_reg[21]_i_1_n_14 ),
        .Q(\sendClocksBetweenBroadcastsWait_reg_n_0_[18] ),
        .S(\sendClocksBetweenBroadcastsWait[31]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \sendClocksBetweenBroadcastsWait_reg[19] 
       (.C(clk333_250),
        .CE(\sendClocksBetweenBroadcastsWait[31]_i_2_n_0 ),
        .D(\sendClocksBetweenBroadcastsWait_reg[21]_i_1_n_13 ),
        .Q(\sendClocksBetweenBroadcastsWait_reg_n_0_[19] ),
        .S(\sendClocksBetweenBroadcastsWait[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendClocksBetweenBroadcastsWait_reg[1] 
       (.C(clk333_250),
        .CE(\sendClocksBetweenBroadcastsWait[31]_i_2_n_0 ),
        .D(\sendClocksBetweenBroadcastsWait_reg[5]_i_1_n_15 ),
        .Q(\sendClocksBetweenBroadcastsWait_reg_n_0_[1] ),
        .R(\sendClocksBetweenBroadcastsWait[31]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \sendClocksBetweenBroadcastsWait_reg[20] 
       (.C(clk333_250),
        .CE(\sendClocksBetweenBroadcastsWait[31]_i_2_n_0 ),
        .D(\sendClocksBetweenBroadcastsWait_reg[21]_i_1_n_12 ),
        .Q(\sendClocksBetweenBroadcastsWait_reg_n_0_[20] ),
        .S(\sendClocksBetweenBroadcastsWait[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendClocksBetweenBroadcastsWait_reg[21] 
       (.C(clk333_250),
        .CE(\sendClocksBetweenBroadcastsWait[31]_i_2_n_0 ),
        .D(\sendClocksBetweenBroadcastsWait_reg[21]_i_1_n_11 ),
        .Q(\sendClocksBetweenBroadcastsWait_reg_n_0_[21] ),
        .R(\sendClocksBetweenBroadcastsWait[31]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \sendClocksBetweenBroadcastsWait_reg[21]_i_1 
       (.CI(\sendClocksBetweenBroadcastsWait_reg[16]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\sendClocksBetweenBroadcastsWait_reg[21]_i_1_n_0 ,\sendClocksBetweenBroadcastsWait_reg[21]_i_1_n_1 ,\sendClocksBetweenBroadcastsWait_reg[21]_i_1_n_2 ,\sendClocksBetweenBroadcastsWait_reg[21]_i_1_n_3 ,\sendClocksBetweenBroadcastsWait_reg[21]_i_1_n_4 ,\sendClocksBetweenBroadcastsWait_reg[21]_i_1_n_5 ,\sendClocksBetweenBroadcastsWait_reg[21]_i_1_n_6 ,\sendClocksBetweenBroadcastsWait_reg[21]_i_1_n_7 }),
        .DI({\sendClocksBetweenBroadcastsWait_reg_n_0_[24] ,\sendClocksBetweenBroadcastsWait_reg_n_0_[23] ,\sendClocksBetweenBroadcastsWait_reg_n_0_[22] ,\sendClocksBetweenBroadcastsWait_reg_n_0_[21] ,\sendClocksBetweenBroadcastsWait_reg_n_0_[20] ,\sendClocksBetweenBroadcastsWait_reg_n_0_[19] ,\sendClocksBetweenBroadcastsWait_reg_n_0_[18] ,\sendClocksBetweenBroadcastsWait_reg_n_0_[17] }),
        .O({\sendClocksBetweenBroadcastsWait_reg[21]_i_1_n_8 ,\sendClocksBetweenBroadcastsWait_reg[21]_i_1_n_9 ,\sendClocksBetweenBroadcastsWait_reg[21]_i_1_n_10 ,\sendClocksBetweenBroadcastsWait_reg[21]_i_1_n_11 ,\sendClocksBetweenBroadcastsWait_reg[21]_i_1_n_12 ,\sendClocksBetweenBroadcastsWait_reg[21]_i_1_n_13 ,\sendClocksBetweenBroadcastsWait_reg[21]_i_1_n_14 ,\sendClocksBetweenBroadcastsWait_reg[21]_i_1_n_15 }),
        .S({\sendClocksBetweenBroadcastsWait[21]_i_2_n_0 ,\sendClocksBetweenBroadcastsWait[21]_i_3_n_0 ,\sendClocksBetweenBroadcastsWait[21]_i_4_n_0 ,\sendClocksBetweenBroadcastsWait[21]_i_5_n_0 ,\sendClocksBetweenBroadcastsWait[21]_i_6_n_0 ,\sendClocksBetweenBroadcastsWait[21]_i_7_n_0 ,\sendClocksBetweenBroadcastsWait[21]_i_8_n_0 ,\sendClocksBetweenBroadcastsWait[21]_i_9_n_0 }));
  FDSE #(
    .INIT(1'b1)) 
    \sendClocksBetweenBroadcastsWait_reg[22] 
       (.C(clk333_250),
        .CE(\sendClocksBetweenBroadcastsWait[31]_i_2_n_0 ),
        .D(\sendClocksBetweenBroadcastsWait_reg[21]_i_1_n_10 ),
        .Q(\sendClocksBetweenBroadcastsWait_reg_n_0_[22] ),
        .S(\sendClocksBetweenBroadcastsWait[31]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \sendClocksBetweenBroadcastsWait_reg[23] 
       (.C(clk333_250),
        .CE(\sendClocksBetweenBroadcastsWait[31]_i_2_n_0 ),
        .D(\sendClocksBetweenBroadcastsWait_reg[21]_i_1_n_9 ),
        .Q(\sendClocksBetweenBroadcastsWait_reg_n_0_[23] ),
        .S(\sendClocksBetweenBroadcastsWait[31]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \sendClocksBetweenBroadcastsWait_reg[24] 
       (.C(clk333_250),
        .CE(\sendClocksBetweenBroadcastsWait[31]_i_2_n_0 ),
        .D(\sendClocksBetweenBroadcastsWait_reg[21]_i_1_n_8 ),
        .Q(\sendClocksBetweenBroadcastsWait_reg_n_0_[24] ),
        .S(\sendClocksBetweenBroadcastsWait[31]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \sendClocksBetweenBroadcastsWait_reg[25] 
       (.C(clk333_250),
        .CE(\sendClocksBetweenBroadcastsWait[31]_i_2_n_0 ),
        .D(\sendClocksBetweenBroadcastsWait_reg[31]_i_3_n_15 ),
        .Q(\sendClocksBetweenBroadcastsWait_reg_n_0_[25] ),
        .S(\sendClocksBetweenBroadcastsWait[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendClocksBetweenBroadcastsWait_reg[26] 
       (.C(clk333_250),
        .CE(\sendClocksBetweenBroadcastsWait[31]_i_2_n_0 ),
        .D(\sendClocksBetweenBroadcastsWait_reg[31]_i_3_n_14 ),
        .Q(\sendClocksBetweenBroadcastsWait_reg_n_0_[26] ),
        .R(\sendClocksBetweenBroadcastsWait[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendClocksBetweenBroadcastsWait_reg[27] 
       (.C(clk333_250),
        .CE(\sendClocksBetweenBroadcastsWait[31]_i_2_n_0 ),
        .D(\sendClocksBetweenBroadcastsWait_reg[31]_i_3_n_13 ),
        .Q(\sendClocksBetweenBroadcastsWait_reg_n_0_[27] ),
        .R(\sendClocksBetweenBroadcastsWait[31]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \sendClocksBetweenBroadcastsWait_reg[28] 
       (.C(clk333_250),
        .CE(\sendClocksBetweenBroadcastsWait[31]_i_2_n_0 ),
        .D(\sendClocksBetweenBroadcastsWait_reg[31]_i_3_n_12 ),
        .Q(\sendClocksBetweenBroadcastsWait_reg_n_0_[28] ),
        .S(\sendClocksBetweenBroadcastsWait[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendClocksBetweenBroadcastsWait_reg[29] 
       (.C(clk333_250),
        .CE(\sendClocksBetweenBroadcastsWait[31]_i_2_n_0 ),
        .D(\sendClocksBetweenBroadcastsWait_reg[31]_i_3_n_11 ),
        .Q(\sendClocksBetweenBroadcastsWait_reg_n_0_[29] ),
        .R(\sendClocksBetweenBroadcastsWait[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendClocksBetweenBroadcastsWait_reg[2] 
       (.C(clk333_250),
        .CE(\sendClocksBetweenBroadcastsWait[31]_i_2_n_0 ),
        .D(\sendClocksBetweenBroadcastsWait_reg[5]_i_1_n_14 ),
        .Q(\sendClocksBetweenBroadcastsWait_reg_n_0_[2] ),
        .R(\sendClocksBetweenBroadcastsWait[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendClocksBetweenBroadcastsWait_reg[30] 
       (.C(clk333_250),
        .CE(\sendClocksBetweenBroadcastsWait[31]_i_2_n_0 ),
        .D(\sendClocksBetweenBroadcastsWait_reg[31]_i_3_n_10 ),
        .Q(\sendClocksBetweenBroadcastsWait_reg_n_0_[30] ),
        .R(\sendClocksBetweenBroadcastsWait[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendClocksBetweenBroadcastsWait_reg[31] 
       (.C(clk333_250),
        .CE(\sendClocksBetweenBroadcastsWait[31]_i_2_n_0 ),
        .D(\sendClocksBetweenBroadcastsWait_reg[31]_i_3_n_9 ),
        .Q(\sendClocksBetweenBroadcastsWait_reg_n_0_[31] ),
        .R(\sendClocksBetweenBroadcastsWait[31]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \sendClocksBetweenBroadcastsWait_reg[31]_i_3 
       (.CI(\sendClocksBetweenBroadcastsWait_reg[21]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\NLW_sendClocksBetweenBroadcastsWait_reg[31]_i_3_CO_UNCONNECTED [7:6],\sendClocksBetweenBroadcastsWait_reg[31]_i_3_n_2 ,\sendClocksBetweenBroadcastsWait_reg[31]_i_3_n_3 ,\sendClocksBetweenBroadcastsWait_reg[31]_i_3_n_4 ,\sendClocksBetweenBroadcastsWait_reg[31]_i_3_n_5 ,\sendClocksBetweenBroadcastsWait_reg[31]_i_3_n_6 ,\sendClocksBetweenBroadcastsWait_reg[31]_i_3_n_7 }),
        .DI({1'b0,1'b0,\sendClocksBetweenBroadcastsWait_reg_n_0_[30] ,\sendClocksBetweenBroadcastsWait_reg_n_0_[29] ,\sendClocksBetweenBroadcastsWait_reg_n_0_[28] ,\sendClocksBetweenBroadcastsWait_reg_n_0_[27] ,\sendClocksBetweenBroadcastsWait_reg_n_0_[26] ,\sendClocksBetweenBroadcastsWait_reg_n_0_[25] }),
        .O({\NLW_sendClocksBetweenBroadcastsWait_reg[31]_i_3_O_UNCONNECTED [7],\sendClocksBetweenBroadcastsWait_reg[31]_i_3_n_9 ,\sendClocksBetweenBroadcastsWait_reg[31]_i_3_n_10 ,\sendClocksBetweenBroadcastsWait_reg[31]_i_3_n_11 ,\sendClocksBetweenBroadcastsWait_reg[31]_i_3_n_12 ,\sendClocksBetweenBroadcastsWait_reg[31]_i_3_n_13 ,\sendClocksBetweenBroadcastsWait_reg[31]_i_3_n_14 ,\sendClocksBetweenBroadcastsWait_reg[31]_i_3_n_15 }),
        .S({1'b0,\sendClocksBetweenBroadcastsWait[31]_i_8_n_0 ,\sendClocksBetweenBroadcastsWait[31]_i_9_n_0 ,\sendClocksBetweenBroadcastsWait[31]_i_10_n_0 ,\sendClocksBetweenBroadcastsWait[31]_i_11_n_0 ,\sendClocksBetweenBroadcastsWait[31]_i_12_n_0 ,\sendClocksBetweenBroadcastsWait[31]_i_13_n_0 ,\sendClocksBetweenBroadcastsWait[31]_i_14_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \sendClocksBetweenBroadcastsWait_reg[3] 
       (.C(clk333_250),
        .CE(\sendClocksBetweenBroadcastsWait[31]_i_2_n_0 ),
        .D(\sendClocksBetweenBroadcastsWait_reg[5]_i_1_n_13 ),
        .Q(\sendClocksBetweenBroadcastsWait_reg_n_0_[3] ),
        .R(\sendClocksBetweenBroadcastsWait[31]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \sendClocksBetweenBroadcastsWait_reg[4] 
       (.C(clk333_250),
        .CE(\sendClocksBetweenBroadcastsWait[31]_i_2_n_0 ),
        .D(\sendClocksBetweenBroadcastsWait_reg[5]_i_1_n_12 ),
        .Q(\sendClocksBetweenBroadcastsWait_reg_n_0_[4] ),
        .S(\sendClocksBetweenBroadcastsWait[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendClocksBetweenBroadcastsWait_reg[5] 
       (.C(clk333_250),
        .CE(\sendClocksBetweenBroadcastsWait[31]_i_2_n_0 ),
        .D(\sendClocksBetweenBroadcastsWait_reg[5]_i_1_n_11 ),
        .Q(\sendClocksBetweenBroadcastsWait_reg_n_0_[5] ),
        .R(\sendClocksBetweenBroadcastsWait[31]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \sendClocksBetweenBroadcastsWait_reg[5]_i_1 
       (.CI(\sendClocksBetweenBroadcastsWait_reg_n_0_[0] ),
        .CI_TOP(1'b0),
        .CO({\sendClocksBetweenBroadcastsWait_reg[5]_i_1_n_0 ,\sendClocksBetweenBroadcastsWait_reg[5]_i_1_n_1 ,\sendClocksBetweenBroadcastsWait_reg[5]_i_1_n_2 ,\sendClocksBetweenBroadcastsWait_reg[5]_i_1_n_3 ,\sendClocksBetweenBroadcastsWait_reg[5]_i_1_n_4 ,\sendClocksBetweenBroadcastsWait_reg[5]_i_1_n_5 ,\sendClocksBetweenBroadcastsWait_reg[5]_i_1_n_6 ,\sendClocksBetweenBroadcastsWait_reg[5]_i_1_n_7 }),
        .DI({\sendClocksBetweenBroadcastsWait_reg_n_0_[8] ,\sendClocksBetweenBroadcastsWait_reg_n_0_[7] ,\sendClocksBetweenBroadcastsWait_reg_n_0_[6] ,\sendClocksBetweenBroadcastsWait_reg_n_0_[5] ,\sendClocksBetweenBroadcastsWait_reg_n_0_[4] ,\sendClocksBetweenBroadcastsWait_reg_n_0_[3] ,\sendClocksBetweenBroadcastsWait_reg_n_0_[2] ,\sendClocksBetweenBroadcastsWait_reg_n_0_[1] }),
        .O({\sendClocksBetweenBroadcastsWait_reg[5]_i_1_n_8 ,\sendClocksBetweenBroadcastsWait_reg[5]_i_1_n_9 ,\sendClocksBetweenBroadcastsWait_reg[5]_i_1_n_10 ,\sendClocksBetweenBroadcastsWait_reg[5]_i_1_n_11 ,\sendClocksBetweenBroadcastsWait_reg[5]_i_1_n_12 ,\sendClocksBetweenBroadcastsWait_reg[5]_i_1_n_13 ,\sendClocksBetweenBroadcastsWait_reg[5]_i_1_n_14 ,\sendClocksBetweenBroadcastsWait_reg[5]_i_1_n_15 }),
        .S({\sendClocksBetweenBroadcastsWait[5]_i_2_n_0 ,\sendClocksBetweenBroadcastsWait[5]_i_3_n_0 ,\sendClocksBetweenBroadcastsWait[5]_i_4_n_0 ,\sendClocksBetweenBroadcastsWait[5]_i_5_n_0 ,\sendClocksBetweenBroadcastsWait[5]_i_6_n_0 ,\sendClocksBetweenBroadcastsWait[5]_i_7_n_0 ,\sendClocksBetweenBroadcastsWait[5]_i_8_n_0 ,\sendClocksBetweenBroadcastsWait[5]_i_9_n_0 }));
  FDSE #(
    .INIT(1'b1)) 
    \sendClocksBetweenBroadcastsWait_reg[6] 
       (.C(clk333_250),
        .CE(\sendClocksBetweenBroadcastsWait[31]_i_2_n_0 ),
        .D(\sendClocksBetweenBroadcastsWait_reg[5]_i_1_n_10 ),
        .Q(\sendClocksBetweenBroadcastsWait_reg_n_0_[6] ),
        .S(\sendClocksBetweenBroadcastsWait[31]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \sendClocksBetweenBroadcastsWait_reg[7] 
       (.C(clk333_250),
        .CE(\sendClocksBetweenBroadcastsWait[31]_i_2_n_0 ),
        .D(\sendClocksBetweenBroadcastsWait_reg[5]_i_1_n_9 ),
        .Q(\sendClocksBetweenBroadcastsWait_reg_n_0_[7] ),
        .S(\sendClocksBetweenBroadcastsWait[31]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \sendClocksBetweenBroadcastsWait_reg[8] 
       (.C(clk333_250),
        .CE(\sendClocksBetweenBroadcastsWait[31]_i_2_n_0 ),
        .D(\sendClocksBetweenBroadcastsWait_reg[5]_i_1_n_8 ),
        .Q(\sendClocksBetweenBroadcastsWait_reg_n_0_[8] ),
        .S(\sendClocksBetweenBroadcastsWait[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendClocksBetweenBroadcastsWait_reg[9] 
       (.C(clk333_250),
        .CE(\sendClocksBetweenBroadcastsWait[31]_i_2_n_0 ),
        .D(\sendClocksBetweenBroadcastsWait_reg[16]_i_1_n_15 ),
        .Q(\sendClocksBetweenBroadcastsWait_reg_n_0_[9] ),
        .R(\sendClocksBetweenBroadcastsWait[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair93" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostIPv4Address][0]_i_1 
       (.I0(\recvCurrentPacket_reg[hostIPv4Address_n_0_][0] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostIPv4Address][0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair88" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostIPv4Address][10]_i_1 
       (.I0(\recvCurrentPacket_reg[hostIPv4Address_n_0_][10] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostIPv4Address][10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair88" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostIPv4Address][11]_i_1 
       (.I0(\recvCurrentPacket_reg[hostIPv4Address_n_0_][11] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostIPv4Address][11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair87" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostIPv4Address][12]_i_1 
       (.I0(\recvCurrentPacket_reg[hostIPv4Address_n_0_][12] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostIPv4Address][12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair87" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostIPv4Address][13]_i_1 
       (.I0(\recvCurrentPacket_reg[hostIPv4Address_n_0_][13] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostIPv4Address][13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair86" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostIPv4Address][14]_i_1 
       (.I0(\recvCurrentPacket_reg[hostIPv4Address_n_0_][14] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostIPv4Address][14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair86" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostIPv4Address][15]_i_1 
       (.I0(\recvCurrentPacket_reg[hostIPv4Address_n_0_][15] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostIPv4Address][15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair85" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostIPv4Address][16]_i_1 
       (.I0(\recvCurrentPacket_reg[hostIPv4Address_n_0_][16] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostIPv4Address][16]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair85" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostIPv4Address][17]_i_1 
       (.I0(\recvCurrentPacket_reg[hostIPv4Address_n_0_][17] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostIPv4Address][17]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostIPv4Address][18]_i_1 
       (.I0(\recvCurrentPacket_reg[hostIPv4Address_n_0_][18] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostIPv4Address][18]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostIPv4Address][19]_i_1 
       (.I0(\recvCurrentPacket_reg[hostIPv4Address_n_0_][19] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostIPv4Address][19]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair93" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostIPv4Address][1]_i_1 
       (.I0(\recvCurrentPacket_reg[hostIPv4Address_n_0_][1] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostIPv4Address][1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostIPv4Address][20]_i_1 
       (.I0(\recvCurrentPacket_reg[hostIPv4Address_n_0_][20] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostIPv4Address][20]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostIPv4Address][21]_i_1 
       (.I0(\recvCurrentPacket_reg[hostIPv4Address_n_0_][21] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostIPv4Address][21]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair82" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostIPv4Address][22]_i_1 
       (.I0(\recvCurrentPacket_reg[hostIPv4Address_n_0_][22] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostIPv4Address][22]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair82" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostIPv4Address][23]_i_1 
       (.I0(\recvCurrentPacket_reg[hostIPv4Address_n_0_][23] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostIPv4Address][23]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair81" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostIPv4Address][24]_i_1 
       (.I0(\recvCurrentPacket_reg[hostIPv4Address_n_0_][24] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostIPv4Address][24]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair81" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostIPv4Address][25]_i_1 
       (.I0(\recvCurrentPacket_reg[hostIPv4Address_n_0_][25] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostIPv4Address][25]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostIPv4Address][26]_i_1 
       (.I0(\recvCurrentPacket_reg[hostIPv4Address_n_0_][26] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostIPv4Address][26]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostIPv4Address][27]_i_1 
       (.I0(\recvCurrentPacket_reg[hostIPv4Address_n_0_][27] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostIPv4Address][27]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostIPv4Address][28]_i_1 
       (.I0(\recvCurrentPacket_reg[hostIPv4Address_n_0_][28] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostIPv4Address][28]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostIPv4Address][29]_i_1 
       (.I0(\recvCurrentPacket_reg[hostIPv4Address_n_0_][29] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostIPv4Address][29]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair92" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostIPv4Address][2]_i_1 
       (.I0(\recvCurrentPacket_reg[hostIPv4Address_n_0_][2] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostIPv4Address][2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostIPv4Address][30]_i_1 
       (.I0(\recvCurrentPacket_reg[hostIPv4Address_n_0_][30] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostIPv4Address][30]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostIPv4Address][31]_i_1 
       (.I0(\recvCurrentPacket_reg[hostIPv4Address_n_0_][31] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostIPv4Address][31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair92" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostIPv4Address][3]_i_1 
       (.I0(\recvCurrentPacket_reg[hostIPv4Address_n_0_][3] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostIPv4Address][3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair91" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostIPv4Address][4]_i_1 
       (.I0(\recvCurrentPacket_reg[hostIPv4Address_n_0_][4] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostIPv4Address][4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair91" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostIPv4Address][5]_i_1 
       (.I0(\recvCurrentPacket_reg[hostIPv4Address_n_0_][5] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostIPv4Address][5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair90" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostIPv4Address][6]_i_1 
       (.I0(\recvCurrentPacket_reg[hostIPv4Address_n_0_][6] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostIPv4Address][6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair90" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostIPv4Address][7]_i_1 
       (.I0(\recvCurrentPacket_reg[hostIPv4Address_n_0_][7] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostIPv4Address][7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair89" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostIPv4Address][8]_i_1 
       (.I0(\recvCurrentPacket_reg[hostIPv4Address_n_0_][8] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostIPv4Address][8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair89" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostIPv4Address][9]_i_1 
       (.I0(\recvCurrentPacket_reg[hostIPv4Address_n_0_][9] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostIPv4Address][9]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostMACAddress][0]_i_1 
       (.I0(\recvCurrentPacket_reg[hostMACAddress_n_0_][0] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostMACAddress][0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostMACAddress][10]_i_1 
       (.I0(\recvCurrentPacket_reg[hostMACAddress_n_0_][10] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostMACAddress][10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostMACAddress][11]_i_1 
       (.I0(\recvCurrentPacket_reg[hostMACAddress_n_0_][11] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostMACAddress][11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostMACAddress][12]_i_1 
       (.I0(\recvCurrentPacket_reg[hostMACAddress_n_0_][12] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostMACAddress][12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostMACAddress][13]_i_1 
       (.I0(\recvCurrentPacket_reg[hostMACAddress_n_0_][13] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostMACAddress][13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostMACAddress][14]_i_1 
       (.I0(\recvCurrentPacket_reg[hostMACAddress_n_0_][14] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostMACAddress][14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostMACAddress][15]_i_1 
       (.I0(\recvCurrentPacket_reg[hostMACAddress_n_0_][15] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostMACAddress][15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostMACAddress][16]_i_1 
       (.I0(\recvCurrentPacket_reg[hostMACAddress_n_0_][16] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostMACAddress][16]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostMACAddress][17]_i_1 
       (.I0(\recvCurrentPacket_reg[hostMACAddress_n_0_][17] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostMACAddress][17]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostMACAddress][18]_i_1 
       (.I0(\recvCurrentPacket_reg[hostMACAddress_n_0_][18] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostMACAddress][18]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostMACAddress][19]_i_1 
       (.I0(\recvCurrentPacket_reg[hostMACAddress_n_0_][19] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostMACAddress][19]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostMACAddress][1]_i_1 
       (.I0(\recvCurrentPacket_reg[hostMACAddress_n_0_][1] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostMACAddress][1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostMACAddress][20]_i_1 
       (.I0(\recvCurrentPacket_reg[hostMACAddress_n_0_][20] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostMACAddress][20]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostMACAddress][21]_i_1 
       (.I0(\recvCurrentPacket_reg[hostMACAddress_n_0_][21] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostMACAddress][21]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostMACAddress][22]_i_1 
       (.I0(\recvCurrentPacket_reg[hostMACAddress_n_0_][22] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostMACAddress][22]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostMACAddress][23]_i_1 
       (.I0(\recvCurrentPacket_reg[hostMACAddress_n_0_][23] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostMACAddress][23]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostMACAddress][24]_i_1 
       (.I0(\recvCurrentPacket_reg[hostMACAddress_n_0_][24] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostMACAddress][24]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostMACAddress][25]_i_1 
       (.I0(\recvCurrentPacket_reg[hostMACAddress_n_0_][25] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostMACAddress][25]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostMACAddress][26]_i_1 
       (.I0(\recvCurrentPacket_reg[hostMACAddress_n_0_][26] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostMACAddress][26]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostMACAddress][27]_i_1 
       (.I0(\recvCurrentPacket_reg[hostMACAddress_n_0_][27] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostMACAddress][27]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostMACAddress][28]_i_1 
       (.I0(\recvCurrentPacket_reg[hostMACAddress_n_0_][28] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostMACAddress][28]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostMACAddress][29]_i_1 
       (.I0(\recvCurrentPacket_reg[hostMACAddress_n_0_][29] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostMACAddress][29]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostMACAddress][2]_i_1 
       (.I0(\recvCurrentPacket_reg[hostMACAddress_n_0_][2] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostMACAddress][2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostMACAddress][30]_i_1 
       (.I0(\recvCurrentPacket_reg[hostMACAddress_n_0_][30] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostMACAddress][30]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostMACAddress][31]_i_1 
       (.I0(\recvCurrentPacket_reg[hostMACAddress_n_0_][31] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostMACAddress][31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostMACAddress][32]_i_1 
       (.I0(\recvCurrentPacket_reg[hostMACAddress_n_0_][32] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostMACAddress][32]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostMACAddress][33]_i_1 
       (.I0(\recvCurrentPacket_reg[hostMACAddress_n_0_][33] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostMACAddress][33]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostMACAddress][34]_i_1 
       (.I0(\recvCurrentPacket_reg[hostMACAddress_n_0_][34] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostMACAddress][34]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostMACAddress][35]_i_1 
       (.I0(\recvCurrentPacket_reg[hostMACAddress_n_0_][35] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostMACAddress][35]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostMACAddress][36]_i_1 
       (.I0(\recvCurrentPacket_reg[hostMACAddress_n_0_][36] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostMACAddress][36]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostMACAddress][37]_i_1 
       (.I0(\recvCurrentPacket_reg[hostMACAddress_n_0_][37] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostMACAddress][37]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostMACAddress][38]_i_1 
       (.I0(\recvCurrentPacket_reg[hostMACAddress_n_0_][38] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostMACAddress][38]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostMACAddress][39]_i_1 
       (.I0(\recvCurrentPacket_reg[hostMACAddress_n_0_][39] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostMACAddress][39]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostMACAddress][3]_i_1 
       (.I0(\recvCurrentPacket_reg[hostMACAddress_n_0_][3] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostMACAddress][3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostMACAddress][40]_i_1 
       (.I0(\recvCurrentPacket_reg[hostMACAddress_n_0_][40] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostMACAddress][40]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostMACAddress][41]_i_1 
       (.I0(\recvCurrentPacket_reg[hostMACAddress_n_0_][41] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostMACAddress][41]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostMACAddress][42]_i_1 
       (.I0(\recvCurrentPacket_reg[hostMACAddress_n_0_][42] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostMACAddress][42]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostMACAddress][43]_i_1 
       (.I0(\recvCurrentPacket_reg[hostMACAddress_n_0_][43] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostMACAddress][43]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostMACAddress][44]_i_1 
       (.I0(\recvCurrentPacket_reg[hostMACAddress_n_0_][44] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostMACAddress][44]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostMACAddress][45]_i_1 
       (.I0(\recvCurrentPacket_reg[hostMACAddress_n_0_][45] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostMACAddress][45]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostMACAddress][46]_i_1 
       (.I0(\recvCurrentPacket_reg[hostMACAddress_n_0_][46] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostMACAddress][46]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8888888800008000)) 
    \sendCurrentPacket[hostMACAddress][47]_i_1 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(\sendCurrentPacket[hostMACAddress][47]_i_3_n_0 ),
        .I2(\sendCurrentPacket[hostMACAddress][47]_i_4_n_0 ),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .I4(\sendCurrentPacket[hostMACAddress][47]_i_6_n_0 ),
        .I5(send_pkt_header_wr_en1),
        .O(\sendCurrentPacket[hostMACAddress] ));
  LUT6 #(
    .INIT(64'hFFFFFFFFF2F2FFF2)) 
    \sendCurrentPacket[hostMACAddress][47]_i_10 
       (.I0(\sendClocksBetweenBroadcastsWait_reg_n_0_[0] ),
        .I1(\sendClocksBetweenBroadcastsWait_reg_n_0_[1] ),
        .I2(\sendClocksBetweenBroadcastsWait_reg_n_0_[2] ),
        .I3(\sendClocksBetweenBroadcastsWait_reg_n_0_[3] ),
        .I4(\sendClocksBetweenBroadcastsWait_reg_n_0_[4] ),
        .I5(\sendClocksBetweenBroadcastsWait_reg_n_0_[5] ),
        .O(\sendCurrentPacket[hostMACAddress][47]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFF2F2FFF2)) 
    \sendCurrentPacket[hostMACAddress][47]_i_11 
       (.I0(\sendClocksBetweenBroadcastsWait_reg_n_0_[12] ),
        .I1(\sendClocksBetweenBroadcastsWait_reg_n_0_[13] ),
        .I2(\sendClocksBetweenBroadcastsWait_reg_n_0_[14] ),
        .I3(\sendClocksBetweenBroadcastsWait_reg_n_0_[27] ),
        .I4(\sendClocksBetweenBroadcastsWait_reg_n_0_[28] ),
        .I5(\sendClocksBetweenBroadcastsWait_reg_n_0_[29] ),
        .O(\sendCurrentPacket[hostMACAddress][47]_i_11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostMACAddress][47]_i_2 
       (.I0(\recvCurrentPacket_reg[hostMACAddress_n_0_][47] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostMACAddress][47]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \sendCurrentPacket[hostMACAddress][47]_i_3 
       (.I0(sendHandlingReply_reg_0),
        .I1(currentState__0[0]),
        .O(\sendCurrentPacket[hostMACAddress][47]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00000000000000A2)) 
    \sendCurrentPacket[hostMACAddress][47]_i_4 
       (.I0(\sendClocksBetweenBroadcastsWait[31]_i_22_n_0 ),
        .I1(\sendClocksBetweenBroadcastsWait_reg_n_0_[6] ),
        .I2(\sendClocksBetweenBroadcastsWait_reg_n_0_[7] ),
        .I3(\sendClocksBetweenBroadcastsWait_reg_n_0_[8] ),
        .I4(\sendCurrentPacket[hostMACAddress][47]_i_7_n_0 ),
        .I5(\sendCurrentPacket[hostMACAddress][47]_i_8_n_0 ),
        .O(\sendCurrentPacket[hostMACAddress][47]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \sendCurrentPacket[hostMACAddress][47]_i_5 
       (.I0(send_pkt_header_prog_full),
        .I1(\sendFIFOAccess[2]_i_9_n_0 ),
        .O(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \sendCurrentPacket[hostMACAddress][47]_i_6 
       (.I0(\sendCurrentPacket[hostMACAddress][47]_i_9_n_0 ),
        .I1(\sendClocksBetweenBroadcastsWait[31]_i_25_n_0 ),
        .I2(\sendClocksBetweenBroadcastsWait[31]_i_17_n_0 ),
        .I3(\sendClocksBetweenBroadcastsWait_reg_n_0_[23] ),
        .I4(\sendClocksBetweenBroadcastsWait_reg_n_0_[22] ),
        .I5(\sendCurrentPacket[hostMACAddress][47]_i_10_n_0 ),
        .O(\sendCurrentPacket[hostMACAddress][47]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair95" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \sendCurrentPacket[hostMACAddress][47]_i_7 
       (.I0(\sendClocksBetweenBroadcastsWait_reg_n_0_[20] ),
        .I1(\sendClocksBetweenBroadcastsWait_reg_n_0_[19] ),
        .I2(\sendClocksBetweenBroadcastsWait_reg_n_0_[18] ),
        .O(\sendCurrentPacket[hostMACAddress][47]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hFFF2)) 
    \sendCurrentPacket[hostMACAddress][47]_i_8 
       (.I0(\sendClocksBetweenBroadcastsWait_reg_n_0_[24] ),
        .I1(\sendClocksBetweenBroadcastsWait_reg_n_0_[25] ),
        .I2(\sendClocksBetweenBroadcastsWait_reg_n_0_[26] ),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_11_n_0 ),
        .O(\sendCurrentPacket[hostMACAddress][47]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFDFDD)) 
    \sendCurrentPacket[hostMACAddress][47]_i_9 
       (.I0(\sendFIFOAccess[2]_i_5_n_0 ),
        .I1(\sendClocksBetweenBroadcastsWait_reg_n_0_[11] ),
        .I2(\sendClocksBetweenBroadcastsWait_reg_n_0_[10] ),
        .I3(\sendClocksBetweenBroadcastsWait_reg_n_0_[9] ),
        .I4(\send_pkt_data_wr_data[31]_i_10_n_0 ),
        .I5(\sendClocksBetweenBroadcastsWait[31]_i_16_n_0 ),
        .O(\sendCurrentPacket[hostMACAddress][47]_i_9_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostMACAddress][4]_i_1 
       (.I0(\recvCurrentPacket_reg[hostMACAddress_n_0_][4] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostMACAddress][4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostMACAddress][5]_i_1 
       (.I0(\recvCurrentPacket_reg[hostMACAddress_n_0_][5] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostMACAddress][5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostMACAddress][6]_i_1 
       (.I0(\recvCurrentPacket_reg[hostMACAddress_n_0_][6] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostMACAddress][6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostMACAddress][7]_i_1 
       (.I0(\recvCurrentPacket_reg[hostMACAddress_n_0_][7] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostMACAddress][7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostMACAddress][8]_i_1 
       (.I0(\recvCurrentPacket_reg[hostMACAddress_n_0_][8] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostMACAddress][8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \sendCurrentPacket[hostMACAddress][9]_i_1 
       (.I0(\recvCurrentPacket_reg[hostMACAddress_n_0_][9] ),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .O(\sendCurrentPacket[hostMACAddress][9]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hAA8A)) 
    \sendCurrentPacket[packetLength][15]_i_1 
       (.I0(\sendCurrentPacket[packetLength] ),
        .I1(sendHandlingReply_reg_0),
        .I2(recvSendReplyPacket_reg_0),
        .I3(sendReplyAck_reg_0),
        .O(\sendCurrentPacket[packetLength][15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hABAAAAAAAAAAAAAA)) 
    \sendCurrentPacket[packetLength][15]_i_2 
       (.I0(\sendCurrentPacket[hostMACAddress] ),
        .I1(\sendCurrentPacket[packetLength][15]_i_3_n_0 ),
        .I2(DBG_SendFIFOState[1]),
        .I3(sendHandlingReply_reg_0),
        .I4(\send_pkt_data_wr_data[31]_i_6_n_0 ),
        .I5(\sendFIFOAccess[2]_i_4_n_0 ),
        .O(\sendCurrentPacket[packetLength] ));
  LUT2 #(
    .INIT(4'hE)) 
    \sendCurrentPacket[packetLength][15]_i_3 
       (.I0(DBG_SendFIFOState[0]),
        .I1(DBG_SendFIFOState[2]),
        .O(\sendCurrentPacket[packetLength][15]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFAAAA0C00AAAA)) 
    \sendCurrentPacket[packetLength][1]_i_1 
       (.I0(\sendCurrentPacket_reg[packetLength] [1]),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendReplyAck_reg_0),
        .I3(DBG_recvCurrentPacketLength[1]),
        .I4(\sendCurrentPacket[packetLength] ),
        .I5(sendHandlingReply_reg_0),
        .O(\sendCurrentPacket[packetLength][1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h5545FFFF55450000)) 
    \sendCurrentPacket[packetLength][4]_i_1 
       (.I0(sendHandlingReply_reg_0),
        .I1(DBG_recvCurrentPacketLength[4]),
        .I2(recvSendReplyPacket_reg_0),
        .I3(sendReplyAck_reg_0),
        .I4(\sendCurrentPacket[packetLength] ),
        .I5(\sendCurrentPacket_reg[packetLength] [4]),
        .O(\sendCurrentPacket[packetLength][4]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostIPv4Address][0] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostIPv4Address][0]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostIPv4Address] [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostIPv4Address][10] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostIPv4Address][10]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostIPv4Address] [10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostIPv4Address][11] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostIPv4Address][11]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostIPv4Address] [11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostIPv4Address][12] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostIPv4Address][12]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostIPv4Address] [12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostIPv4Address][13] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostIPv4Address][13]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostIPv4Address] [13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostIPv4Address][14] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostIPv4Address][14]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostIPv4Address] [14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostIPv4Address][15] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostIPv4Address][15]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostIPv4Address] [15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostIPv4Address][16] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostIPv4Address][16]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostIPv4Address] [16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostIPv4Address][17] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostIPv4Address][17]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostIPv4Address] [17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostIPv4Address][18] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostIPv4Address][18]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostIPv4Address] [18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostIPv4Address][19] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostIPv4Address][19]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostIPv4Address] [19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostIPv4Address][1] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostIPv4Address][1]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostIPv4Address] [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostIPv4Address][20] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostIPv4Address][20]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostIPv4Address] [20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostIPv4Address][21] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostIPv4Address][21]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostIPv4Address] [21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostIPv4Address][22] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostIPv4Address][22]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostIPv4Address] [22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostIPv4Address][23] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostIPv4Address][23]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostIPv4Address] [23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostIPv4Address][24] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostIPv4Address][24]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostIPv4Address] [24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostIPv4Address][25] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostIPv4Address][25]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostIPv4Address] [25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostIPv4Address][26] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostIPv4Address][26]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostIPv4Address] [26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostIPv4Address][27] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostIPv4Address][27]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostIPv4Address] [27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostIPv4Address][28] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostIPv4Address][28]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostIPv4Address] [28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostIPv4Address][29] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostIPv4Address][29]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostIPv4Address] [29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostIPv4Address][2] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostIPv4Address][2]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostIPv4Address] [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostIPv4Address][30] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostIPv4Address][30]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostIPv4Address] [30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostIPv4Address][31] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostIPv4Address][31]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostIPv4Address] [31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostIPv4Address][3] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostIPv4Address][3]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostIPv4Address] [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostIPv4Address][4] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostIPv4Address][4]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostIPv4Address] [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostIPv4Address][5] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostIPv4Address][5]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostIPv4Address] [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostIPv4Address][6] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostIPv4Address][6]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostIPv4Address] [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostIPv4Address][7] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostIPv4Address][7]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostIPv4Address] [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostIPv4Address][8] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostIPv4Address][8]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostIPv4Address] [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostIPv4Address][9] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostIPv4Address][9]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostIPv4Address] [9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostMACAddress][0] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostMACAddress][0]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostMACAddress] [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostMACAddress][10] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostMACAddress][10]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostMACAddress] [10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostMACAddress][11] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostMACAddress][11]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostMACAddress] [11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostMACAddress][12] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostMACAddress][12]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostMACAddress] [12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostMACAddress][13] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostMACAddress][13]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostMACAddress] [13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostMACAddress][14] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostMACAddress][14]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostMACAddress] [14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostMACAddress][15] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostMACAddress][15]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostMACAddress] [15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostMACAddress][16] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostMACAddress][16]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostMACAddress] [16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostMACAddress][17] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostMACAddress][17]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostMACAddress] [17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostMACAddress][18] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostMACAddress][18]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostMACAddress] [18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostMACAddress][19] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostMACAddress][19]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostMACAddress] [19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostMACAddress][1] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostMACAddress][1]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostMACAddress] [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostMACAddress][20] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostMACAddress][20]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostMACAddress] [20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostMACAddress][21] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostMACAddress][21]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostMACAddress] [21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostMACAddress][22] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostMACAddress][22]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostMACAddress] [22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostMACAddress][23] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostMACAddress][23]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostMACAddress] [23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostMACAddress][24] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostMACAddress][24]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostMACAddress] [24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostMACAddress][25] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostMACAddress][25]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostMACAddress] [25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostMACAddress][26] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostMACAddress][26]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostMACAddress] [26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostMACAddress][27] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostMACAddress][27]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostMACAddress] [27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostMACAddress][28] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostMACAddress][28]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostMACAddress] [28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostMACAddress][29] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostMACAddress][29]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostMACAddress] [29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostMACAddress][2] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostMACAddress][2]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostMACAddress] [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostMACAddress][30] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostMACAddress][30]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostMACAddress] [30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostMACAddress][31] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostMACAddress][31]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostMACAddress] [31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostMACAddress][32] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostMACAddress][32]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostMACAddress] [32]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostMACAddress][33] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostMACAddress][33]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostMACAddress] [33]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostMACAddress][34] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostMACAddress][34]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostMACAddress] [34]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostMACAddress][35] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostMACAddress][35]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostMACAddress] [35]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostMACAddress][36] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostMACAddress][36]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostMACAddress] [36]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostMACAddress][37] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostMACAddress][37]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostMACAddress] [37]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostMACAddress][38] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostMACAddress][38]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostMACAddress] [38]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostMACAddress][39] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostMACAddress][39]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostMACAddress] [39]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostMACAddress][3] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostMACAddress][3]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostMACAddress] [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostMACAddress][40] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostMACAddress][40]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostMACAddress] [40]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostMACAddress][41] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostMACAddress][41]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostMACAddress] [41]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostMACAddress][42] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostMACAddress][42]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostMACAddress] [42]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostMACAddress][43] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostMACAddress][43]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostMACAddress] [43]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostMACAddress][44] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostMACAddress][44]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostMACAddress] [44]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostMACAddress][45] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostMACAddress][45]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostMACAddress] [45]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostMACAddress][46] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostMACAddress][46]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostMACAddress] [46]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostMACAddress][47] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostMACAddress][47]_i_2_n_0 ),
        .Q(\sendCurrentPacket_reg[hostMACAddress] [47]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostMACAddress][4] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostMACAddress][4]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostMACAddress] [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostMACAddress][5] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostMACAddress][5]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostMACAddress] [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostMACAddress][6] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostMACAddress][6]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostMACAddress] [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostMACAddress][7] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostMACAddress][7]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostMACAddress] [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostMACAddress][8] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostMACAddress][8]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostMACAddress] [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[hostMACAddress][9] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[hostMACAddress] ),
        .D(\sendCurrentPacket[hostMACAddress][9]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[hostMACAddress] [9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[packetLength][0] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[packetLength] ),
        .D(DBG_recvCurrentPacketLength[0]),
        .Q(\sendCurrentPacket_reg[packetLength] [0]),
        .R(\sendCurrentPacket[packetLength][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[packetLength][10] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[packetLength] ),
        .D(DBG_recvCurrentPacketLength[10]),
        .Q(\sendCurrentPacket_reg[packetLength] [10]),
        .R(\sendCurrentPacket[packetLength][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[packetLength][11] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[packetLength] ),
        .D(DBG_recvCurrentPacketLength[11]),
        .Q(\sendCurrentPacket_reg[packetLength] [11]),
        .R(\sendCurrentPacket[packetLength][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[packetLength][12] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[packetLength] ),
        .D(DBG_recvCurrentPacketLength[12]),
        .Q(\sendCurrentPacket_reg[packetLength] [12]),
        .R(\sendCurrentPacket[packetLength][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[packetLength][13] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[packetLength] ),
        .D(DBG_recvCurrentPacketLength[13]),
        .Q(\sendCurrentPacket_reg[packetLength] [13]),
        .R(\sendCurrentPacket[packetLength][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[packetLength][14] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[packetLength] ),
        .D(DBG_recvCurrentPacketLength[14]),
        .Q(\sendCurrentPacket_reg[packetLength] [14]),
        .R(\sendCurrentPacket[packetLength][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[packetLength][15] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[packetLength] ),
        .D(DBG_recvCurrentPacketLength[15]),
        .Q(\sendCurrentPacket_reg[packetLength] [15]),
        .R(\sendCurrentPacket[packetLength][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[packetLength][1] 
       (.C(clk333_250),
        .CE(1'b1),
        .D(\sendCurrentPacket[packetLength][1]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[packetLength] [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[packetLength][2] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[packetLength] ),
        .D(DBG_recvCurrentPacketLength[2]),
        .Q(\sendCurrentPacket_reg[packetLength] [2]),
        .R(\sendCurrentPacket[packetLength][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[packetLength][3] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[packetLength] ),
        .D(DBG_recvCurrentPacketLength[3]),
        .Q(\sendCurrentPacket_reg[packetLength] [3]),
        .R(\sendCurrentPacket[packetLength][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[packetLength][4] 
       (.C(clk333_250),
        .CE(1'b1),
        .D(\sendCurrentPacket[packetLength][4]_i_1_n_0 ),
        .Q(\sendCurrentPacket_reg[packetLength] [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[packetLength][5] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[packetLength] ),
        .D(DBG_recvCurrentPacketLength[5]),
        .Q(\sendCurrentPacket_reg[packetLength] [5]),
        .R(\sendCurrentPacket[packetLength][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[packetLength][6] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[packetLength] ),
        .D(DBG_recvCurrentPacketLength[6]),
        .Q(\sendCurrentPacket_reg[packetLength] [6]),
        .R(\sendCurrentPacket[packetLength][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[packetLength][7] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[packetLength] ),
        .D(DBG_recvCurrentPacketLength[7]),
        .Q(\sendCurrentPacket_reg[packetLength] [7]),
        .R(\sendCurrentPacket[packetLength][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[packetLength][8] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[packetLength] ),
        .D(DBG_recvCurrentPacketLength[8]),
        .Q(\sendCurrentPacket_reg[packetLength] [8]),
        .R(\sendCurrentPacket[packetLength][15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendCurrentPacket_reg[packetLength][9] 
       (.C(clk333_250),
        .CE(\sendCurrentPacket[packetLength] ),
        .D(DBG_recvCurrentPacketLength[9]),
        .Q(\sendCurrentPacket_reg[packetLength] [9]),
        .R(\sendCurrentPacket[packetLength][15]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \sendCyclesBetweenAutoResends[0]_i_1 
       (.I0(DBG_sendCyclesBetweenAutoResends[0]),
        .O(\sendCyclesBetweenAutoResends[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0800)) 
    \sendCyclesBetweenAutoResends[27]_i_1 
       (.I0(sendPacketState__0),
        .I1(currentState__1),
        .I2(\FSM_sequential_sendPacketState_reg_n_0_[3] ),
        .I3(\sendCyclesBetweenAutoResends[27]_i_4_n_0 ),
        .O(\sendCyclesBetweenAutoResends[27]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \sendCyclesBetweenAutoResends[27]_i_10 
       (.I0(DBG_sendCyclesBetweenAutoResends[5]),
        .I1(DBG_sendCyclesBetweenAutoResends[1]),
        .I2(DBG_sendCyclesBetweenAutoResends[3]),
        .I3(DBG_sendCyclesBetweenAutoResends[2]),
        .I4(DBG_sendCyclesBetweenAutoResends[4]),
        .O(\sendCyclesBetweenAutoResends[27]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h0000F80000000000)) 
    \sendCyclesBetweenAutoResends[27]_i_2 
       (.I0(\sendCyclesBetweenAutoResends[27]_i_5_n_0 ),
        .I1(sendHasUnackedSentPacket_reg_0),
        .I2(sendPacketState__0),
        .I3(currentState__1),
        .I4(\FSM_sequential_sendPacketState_reg_n_0_[3] ),
        .I5(\sendCyclesBetweenAutoResends[27]_i_4_n_0 ),
        .O(sendCyclesBetweenAutoResends));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \sendCyclesBetweenAutoResends[27]_i_4 
       (.I0(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .O(\sendCyclesBetweenAutoResends[27]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h000045FF)) 
    \sendCyclesBetweenAutoResends[27]_i_5 
       (.I0(DBG_sendCyclesBetweenAutoResends[17]),
        .I1(\sendCyclesBetweenAutoResends[27]_i_6_n_0 ),
        .I2(DBG_sendCyclesBetweenAutoResends[16]),
        .I3(DBG_sendCyclesBetweenAutoResends[18]),
        .I4(\sendCyclesBetweenAutoResends[27]_i_7_n_0 ),
        .O(\sendCyclesBetweenAutoResends[27]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h000000000000001F)) 
    \sendCyclesBetweenAutoResends[27]_i_6 
       (.I0(DBG_sendCyclesBetweenAutoResends[11]),
        .I1(\sendCyclesBetweenAutoResends[27]_i_8_n_0 ),
        .I2(DBG_sendCyclesBetweenAutoResends[12]),
        .I3(DBG_sendCyclesBetweenAutoResends[14]),
        .I4(DBG_sendCyclesBetweenAutoResends[13]),
        .I5(DBG_sendCyclesBetweenAutoResends[15]),
        .O(\sendCyclesBetweenAutoResends[27]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \sendCyclesBetweenAutoResends[27]_i_7 
       (.I0(DBG_sendCyclesBetweenAutoResends[24]),
        .I1(DBG_sendCyclesBetweenAutoResends[21]),
        .I2(DBG_sendCyclesBetweenAutoResends[20]),
        .I3(DBG_sendCyclesBetweenAutoResends[19]),
        .I4(\sendCyclesBetweenAutoResends[27]_i_9_n_0 ),
        .O(\sendCyclesBetweenAutoResends[27]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hA888888888888888)) 
    \sendCyclesBetweenAutoResends[27]_i_8 
       (.I0(DBG_sendCyclesBetweenAutoResends[10]),
        .I1(DBG_sendCyclesBetweenAutoResends[9]),
        .I2(DBG_sendCyclesBetweenAutoResends[7]),
        .I3(DBG_sendCyclesBetweenAutoResends[6]),
        .I4(DBG_sendCyclesBetweenAutoResends[8]),
        .I5(\sendCyclesBetweenAutoResends[27]_i_10_n_0 ),
        .O(\sendCyclesBetweenAutoResends[27]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \sendCyclesBetweenAutoResends[27]_i_9 
       (.I0(DBG_sendCyclesBetweenAutoResends[27]),
        .I1(DBG_sendCyclesBetweenAutoResends[25]),
        .I2(DBG_sendCyclesBetweenAutoResends[26]),
        .I3(DBG_sendCyclesBetweenAutoResends[22]),
        .I4(DBG_sendCyclesBetweenAutoResends[23]),
        .O(\sendCyclesBetweenAutoResends[27]_i_9_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendCyclesBetweenAutoResends_reg[0] 
       (.C(clk333_250),
        .CE(sendCyclesBetweenAutoResends),
        .D(\sendCyclesBetweenAutoResends[0]_i_1_n_0 ),
        .Q(DBG_sendCyclesBetweenAutoResends[0]),
        .R(\sendCyclesBetweenAutoResends[27]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendCyclesBetweenAutoResends_reg[10] 
       (.C(clk333_250),
        .CE(sendCyclesBetweenAutoResends),
        .D(in17[10]),
        .Q(DBG_sendCyclesBetweenAutoResends[10]),
        .R(\sendCyclesBetweenAutoResends[27]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendCyclesBetweenAutoResends_reg[11] 
       (.C(clk333_250),
        .CE(sendCyclesBetweenAutoResends),
        .D(in17[11]),
        .Q(DBG_sendCyclesBetweenAutoResends[11]),
        .R(\sendCyclesBetweenAutoResends[27]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendCyclesBetweenAutoResends_reg[12] 
       (.C(clk333_250),
        .CE(sendCyclesBetweenAutoResends),
        .D(in17[12]),
        .Q(DBG_sendCyclesBetweenAutoResends[12]),
        .R(\sendCyclesBetweenAutoResends[27]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendCyclesBetweenAutoResends_reg[13] 
       (.C(clk333_250),
        .CE(sendCyclesBetweenAutoResends),
        .D(in17[13]),
        .Q(DBG_sendCyclesBetweenAutoResends[13]),
        .R(\sendCyclesBetweenAutoResends[27]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendCyclesBetweenAutoResends_reg[14] 
       (.C(clk333_250),
        .CE(sendCyclesBetweenAutoResends),
        .D(in17[14]),
        .Q(DBG_sendCyclesBetweenAutoResends[14]),
        .R(\sendCyclesBetweenAutoResends[27]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendCyclesBetweenAutoResends_reg[15] 
       (.C(clk333_250),
        .CE(sendCyclesBetweenAutoResends),
        .D(in17[15]),
        .Q(DBG_sendCyclesBetweenAutoResends[15]),
        .R(\sendCyclesBetweenAutoResends[27]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendCyclesBetweenAutoResends_reg[16] 
       (.C(clk333_250),
        .CE(sendCyclesBetweenAutoResends),
        .D(in17[16]),
        .Q(DBG_sendCyclesBetweenAutoResends[16]),
        .R(\sendCyclesBetweenAutoResends[27]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \sendCyclesBetweenAutoResends_reg[16]_i_1 
       (.CI(\sendCyclesBetweenAutoResends_reg[8]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\sendCyclesBetweenAutoResends_reg[16]_i_1_n_0 ,\sendCyclesBetweenAutoResends_reg[16]_i_1_n_1 ,\sendCyclesBetweenAutoResends_reg[16]_i_1_n_2 ,\sendCyclesBetweenAutoResends_reg[16]_i_1_n_3 ,\sendCyclesBetweenAutoResends_reg[16]_i_1_n_4 ,\sendCyclesBetweenAutoResends_reg[16]_i_1_n_5 ,\sendCyclesBetweenAutoResends_reg[16]_i_1_n_6 ,\sendCyclesBetweenAutoResends_reg[16]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(in17[16:9]),
        .S(DBG_sendCyclesBetweenAutoResends[16:9]));
  FDRE #(
    .INIT(1'b0)) 
    \sendCyclesBetweenAutoResends_reg[17] 
       (.C(clk333_250),
        .CE(sendCyclesBetweenAutoResends),
        .D(in17[17]),
        .Q(DBG_sendCyclesBetweenAutoResends[17]),
        .R(\sendCyclesBetweenAutoResends[27]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendCyclesBetweenAutoResends_reg[18] 
       (.C(clk333_250),
        .CE(sendCyclesBetweenAutoResends),
        .D(in17[18]),
        .Q(DBG_sendCyclesBetweenAutoResends[18]),
        .R(\sendCyclesBetweenAutoResends[27]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendCyclesBetweenAutoResends_reg[19] 
       (.C(clk333_250),
        .CE(sendCyclesBetweenAutoResends),
        .D(in17[19]),
        .Q(DBG_sendCyclesBetweenAutoResends[19]),
        .R(\sendCyclesBetweenAutoResends[27]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendCyclesBetweenAutoResends_reg[1] 
       (.C(clk333_250),
        .CE(sendCyclesBetweenAutoResends),
        .D(in17[1]),
        .Q(DBG_sendCyclesBetweenAutoResends[1]),
        .R(\sendCyclesBetweenAutoResends[27]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendCyclesBetweenAutoResends_reg[20] 
       (.C(clk333_250),
        .CE(sendCyclesBetweenAutoResends),
        .D(in17[20]),
        .Q(DBG_sendCyclesBetweenAutoResends[20]),
        .R(\sendCyclesBetweenAutoResends[27]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendCyclesBetweenAutoResends_reg[21] 
       (.C(clk333_250),
        .CE(sendCyclesBetweenAutoResends),
        .D(in17[21]),
        .Q(DBG_sendCyclesBetweenAutoResends[21]),
        .R(\sendCyclesBetweenAutoResends[27]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendCyclesBetweenAutoResends_reg[22] 
       (.C(clk333_250),
        .CE(sendCyclesBetweenAutoResends),
        .D(in17[22]),
        .Q(DBG_sendCyclesBetweenAutoResends[22]),
        .R(\sendCyclesBetweenAutoResends[27]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendCyclesBetweenAutoResends_reg[23] 
       (.C(clk333_250),
        .CE(sendCyclesBetweenAutoResends),
        .D(in17[23]),
        .Q(DBG_sendCyclesBetweenAutoResends[23]),
        .R(\sendCyclesBetweenAutoResends[27]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendCyclesBetweenAutoResends_reg[24] 
       (.C(clk333_250),
        .CE(sendCyclesBetweenAutoResends),
        .D(in17[24]),
        .Q(DBG_sendCyclesBetweenAutoResends[24]),
        .R(\sendCyclesBetweenAutoResends[27]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \sendCyclesBetweenAutoResends_reg[24]_i_1 
       (.CI(\sendCyclesBetweenAutoResends_reg[16]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\sendCyclesBetweenAutoResends_reg[24]_i_1_n_0 ,\sendCyclesBetweenAutoResends_reg[24]_i_1_n_1 ,\sendCyclesBetweenAutoResends_reg[24]_i_1_n_2 ,\sendCyclesBetweenAutoResends_reg[24]_i_1_n_3 ,\sendCyclesBetweenAutoResends_reg[24]_i_1_n_4 ,\sendCyclesBetweenAutoResends_reg[24]_i_1_n_5 ,\sendCyclesBetweenAutoResends_reg[24]_i_1_n_6 ,\sendCyclesBetweenAutoResends_reg[24]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(in17[24:17]),
        .S(DBG_sendCyclesBetweenAutoResends[24:17]));
  FDRE #(
    .INIT(1'b0)) 
    \sendCyclesBetweenAutoResends_reg[25] 
       (.C(clk333_250),
        .CE(sendCyclesBetweenAutoResends),
        .D(in17[25]),
        .Q(DBG_sendCyclesBetweenAutoResends[25]),
        .R(\sendCyclesBetweenAutoResends[27]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendCyclesBetweenAutoResends_reg[26] 
       (.C(clk333_250),
        .CE(sendCyclesBetweenAutoResends),
        .D(in17[26]),
        .Q(DBG_sendCyclesBetweenAutoResends[26]),
        .R(\sendCyclesBetweenAutoResends[27]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendCyclesBetweenAutoResends_reg[27] 
       (.C(clk333_250),
        .CE(sendCyclesBetweenAutoResends),
        .D(in17[27]),
        .Q(DBG_sendCyclesBetweenAutoResends[27]),
        .R(\sendCyclesBetweenAutoResends[27]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \sendCyclesBetweenAutoResends_reg[27]_i_3 
       (.CI(\sendCyclesBetweenAutoResends_reg[24]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\NLW_sendCyclesBetweenAutoResends_reg[27]_i_3_CO_UNCONNECTED [7:2],\sendCyclesBetweenAutoResends_reg[27]_i_3_n_6 ,\sendCyclesBetweenAutoResends_reg[27]_i_3_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_sendCyclesBetweenAutoResends_reg[27]_i_3_O_UNCONNECTED [7:3],in17[27:25]}),
        .S({1'b0,1'b0,1'b0,1'b0,1'b0,DBG_sendCyclesBetweenAutoResends[27:25]}));
  FDRE #(
    .INIT(1'b0)) 
    \sendCyclesBetweenAutoResends_reg[2] 
       (.C(clk333_250),
        .CE(sendCyclesBetweenAutoResends),
        .D(in17[2]),
        .Q(DBG_sendCyclesBetweenAutoResends[2]),
        .R(\sendCyclesBetweenAutoResends[27]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendCyclesBetweenAutoResends_reg[3] 
       (.C(clk333_250),
        .CE(sendCyclesBetweenAutoResends),
        .D(in17[3]),
        .Q(DBG_sendCyclesBetweenAutoResends[3]),
        .R(\sendCyclesBetweenAutoResends[27]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendCyclesBetweenAutoResends_reg[4] 
       (.C(clk333_250),
        .CE(sendCyclesBetweenAutoResends),
        .D(in17[4]),
        .Q(DBG_sendCyclesBetweenAutoResends[4]),
        .R(\sendCyclesBetweenAutoResends[27]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendCyclesBetweenAutoResends_reg[5] 
       (.C(clk333_250),
        .CE(sendCyclesBetweenAutoResends),
        .D(in17[5]),
        .Q(DBG_sendCyclesBetweenAutoResends[5]),
        .R(\sendCyclesBetweenAutoResends[27]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendCyclesBetweenAutoResends_reg[6] 
       (.C(clk333_250),
        .CE(sendCyclesBetweenAutoResends),
        .D(in17[6]),
        .Q(DBG_sendCyclesBetweenAutoResends[6]),
        .R(\sendCyclesBetweenAutoResends[27]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendCyclesBetweenAutoResends_reg[7] 
       (.C(clk333_250),
        .CE(sendCyclesBetweenAutoResends),
        .D(in17[7]),
        .Q(DBG_sendCyclesBetweenAutoResends[7]),
        .R(\sendCyclesBetweenAutoResends[27]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendCyclesBetweenAutoResends_reg[8] 
       (.C(clk333_250),
        .CE(sendCyclesBetweenAutoResends),
        .D(in17[8]),
        .Q(DBG_sendCyclesBetweenAutoResends[8]),
        .R(\sendCyclesBetweenAutoResends[27]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \sendCyclesBetweenAutoResends_reg[8]_i_1 
       (.CI(DBG_sendCyclesBetweenAutoResends[0]),
        .CI_TOP(1'b0),
        .CO({\sendCyclesBetweenAutoResends_reg[8]_i_1_n_0 ,\sendCyclesBetweenAutoResends_reg[8]_i_1_n_1 ,\sendCyclesBetweenAutoResends_reg[8]_i_1_n_2 ,\sendCyclesBetweenAutoResends_reg[8]_i_1_n_3 ,\sendCyclesBetweenAutoResends_reg[8]_i_1_n_4 ,\sendCyclesBetweenAutoResends_reg[8]_i_1_n_5 ,\sendCyclesBetweenAutoResends_reg[8]_i_1_n_6 ,\sendCyclesBetweenAutoResends_reg[8]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(in17[8:1]),
        .S(DBG_sendCyclesBetweenAutoResends[8:1]));
  FDRE #(
    .INIT(1'b0)) 
    \sendCyclesBetweenAutoResends_reg[9] 
       (.C(clk333_250),
        .CE(sendCyclesBetweenAutoResends),
        .D(in17[9]),
        .Q(DBG_sendCyclesBetweenAutoResends[9]),
        .R(\sendCyclesBetweenAutoResends[27]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair130" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \sendFIFOAccess[0]_i_1 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(DBG_SendFIFOState[2]),
        .I2(DBG_SendFIFOState[0]),
        .O(sendFIFOAccess));
  (* SOFT_HLUTNM = "soft_lutpair118" *) 
  LUT3 #(
    .INIT(8'h60)) 
    \sendFIFOAccess[1]_i_1 
       (.I0(DBG_SendFIFOState[0]),
        .I1(DBG_SendFIFOState[1]),
        .I2(sendHasRepliedSuccessfulConnection),
        .O(\sendFIFOAccess[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAA8AAAAA8A8A8A8A)) 
    \sendFIFOAccess[2]_i_1 
       (.I0(\currentState[0]_i_1_n_0 ),
        .I1(\sendFIFOAccess[2]_i_3_n_0 ),
        .I2(sendHasRepliedSuccessfulConnection),
        .I3(\sendFIFOAccess[2]_i_4_n_0 ),
        .I4(\sendFIFOAccess[2]_i_5_n_0 ),
        .I5(sendHandlingReply_reg_0),
        .O(\sendFIFOAccess[2]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \sendFIFOAccess[2]_i_10 
       (.I0(send_pkt_data_count[8]),
        .I1(send_pkt_data_count[3]),
        .I2(send_pkt_data_count[10]),
        .I3(send_pkt_data_count[9]),
        .O(\sendFIFOAccess[2]_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair117" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \sendFIFOAccess[2]_i_2 
       (.I0(DBG_SendFIFOState[0]),
        .I1(DBG_SendFIFOState[1]),
        .I2(sendHasRepliedSuccessfulConnection),
        .O(\sendFIFOAccess[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h000000000000000D)) 
    \sendFIFOAccess[2]_i_3 
       (.I0(\sendFIFOAccess[2]_i_5_n_0 ),
        .I1(\sendCurrentPacket[hostMACAddress][47]_i_5_n_0 ),
        .I2(\sendClocksBetweenBroadcastsWait[31]_i_5_n_0 ),
        .I3(\sendFIFOAccess[2]_i_6_n_0 ),
        .I4(\sendFIFOAccess[2]_i_7_n_0 ),
        .I5(\sendFIFOAccess[2]_i_8_n_0 ),
        .O(\sendFIFOAccess[2]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h1555)) 
    \sendFIFOAccess[2]_i_4 
       (.I0(send_pkt_header_prog_full),
        .I1(send_pkt_data_count[0]),
        .I2(send_pkt_data_count[1]),
        .I3(\sendFIFOAccess[2]_i_9_n_0 ),
        .O(\sendFIFOAccess[2]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair115" *) 
  LUT3 #(
    .INIT(8'h01)) 
    \sendFIFOAccess[2]_i_5 
       (.I0(DBG_SendFIFOState[1]),
        .I1(DBG_SendFIFOState[2]),
        .I2(DBG_SendFIFOState[0]),
        .O(\sendFIFOAccess[2]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \sendFIFOAccess[2]_i_6 
       (.I0(send_pkt_header_wr_en1),
        .I1(\sendClocksBetweenBroadcastsWait_reg_n_0_[28] ),
        .I2(\sendClocksBetweenBroadcastsWait_reg_n_0_[29] ),
        .I3(\sendClocksBetweenBroadcastsWait_reg_n_0_[31] ),
        .I4(\sendClocksBetweenBroadcastsWait_reg_n_0_[30] ),
        .I5(sendHandlingReply_reg_0),
        .O(\sendFIFOAccess[2]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \sendFIFOAccess[2]_i_7 
       (.I0(\sendClocksBetweenBroadcastsWait[31]_i_24_n_0 ),
        .I1(\sendCurrentPacket[hostMACAddress][47]_i_7_n_0 ),
        .I2(\sendClocksBetweenBroadcastsWait_reg_n_0_[13] ),
        .I3(\sendClocksBetweenBroadcastsWait_reg_n_0_[14] ),
        .I4(\sendClocksBetweenBroadcastsWait_reg_n_0_[22] ),
        .I5(\sendClocksBetweenBroadcastsWait_reg_n_0_[23] ),
        .O(\sendFIFOAccess[2]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \sendFIFOAccess[2]_i_8 
       (.I0(\sendClocksBetweenBroadcastsWait[31]_i_25_n_0 ),
        .I1(\sendCurrentPacket[hostMACAddress][47]_i_8_n_0 ),
        .O(\sendFIFOAccess[2]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h2000000000000000)) 
    \sendFIFOAccess[2]_i_9 
       (.I0(send_pkt_data_count[2]),
        .I1(\sendFIFOAccess[2]_i_10_n_0 ),
        .I2(send_pkt_data_count[6]),
        .I3(send_pkt_data_count[4]),
        .I4(send_pkt_data_count[7]),
        .I5(send_pkt_data_count[5]),
        .O(\sendFIFOAccess[2]_i_9_n_0 ));
  (* FSM_ENCODING = "user_encoding" *) 
  FDRE #(
    .INIT(1'b0)) 
    \sendFIFOAccess_reg[0] 
       (.C(clk333_250),
        .CE(\sendFIFOAccess[2]_i_1_n_0 ),
        .D(sendFIFOAccess),
        .Q(DBG_SendFIFOState[0]),
        .R(1'b0));
  (* FSM_ENCODING = "user_encoding" *) 
  FDRE #(
    .INIT(1'b0)) 
    \sendFIFOAccess_reg[1] 
       (.C(clk333_250),
        .CE(\sendFIFOAccess[2]_i_1_n_0 ),
        .D(\sendFIFOAccess[1]_i_1_n_0 ),
        .Q(DBG_SendFIFOState[1]),
        .R(1'b0));
  (* FSM_ENCODING = "user_encoding" *) 
  FDRE #(
    .INIT(1'b0)) 
    \sendFIFOAccess_reg[2] 
       (.C(clk333_250),
        .CE(\sendFIFOAccess[2]_i_1_n_0 ),
        .D(\sendFIFOAccess[2]_i_2_n_0 ),
        .Q(DBG_SendFIFOState[2]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h5580F58055805580)) 
    sendHandlingReply_i_1
       (.I0(\currentState[0]_i_1_n_0 ),
        .I1(send_pkt_header_wr_en1),
        .I2(sendHasRepliedSuccessfulConnection),
        .I3(sendHandlingReply_reg_0),
        .I4(DBG_SendFIFOState[2]),
        .I5(sendHandlingReply_i_2_n_0),
        .O(sendHandlingReply_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFEF)) 
    sendHandlingReply_i_2
       (.I0(\sendClocksBetweenBroadcastsWait[31]_i_5_n_0 ),
        .I1(\sendFIFOAccess[2]_i_7_n_0 ),
        .I2(DBG_SendFIFOState[2]),
        .I3(sendHandlingReply_reg_0),
        .I4(\send_pkt_data_wr_data[31]_i_10_n_0 ),
        .I5(\sendFIFOAccess[2]_i_8_n_0 ),
        .O(sendHandlingReply_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    sendHandlingReply_reg
       (.C(clk333_250),
        .CE(1'b1),
        .D(sendHandlingReply_i_1_n_0),
        .Q(sendHandlingReply_reg_0),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFFFFAA00000020)) 
    sendHasRepliedSuccessfulConnection_i_1
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(sendReplyAck_i_2_n_0),
        .I2(sendHasRepliedSuccessfulConnection_i_2_n_0),
        .I3(currentState__0[2]),
        .I4(currentState__0[0]),
        .I5(sendHasRepliedSuccessfulConnection_reg_n_0),
        .O(sendHasRepliedSuccessfulConnection_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair128" *) 
  LUT3 #(
    .INIT(8'h01)) 
    sendHasRepliedSuccessfulConnection_i_2
       (.I0(\sendPacketHeaderBuffer_reg_n_0_[9] ),
        .I1(\sendPacketHeaderBuffer_reg_n_0_[8] ),
        .I2(\sendPacketHeaderBuffer_reg_n_0_[10] ),
        .O(sendHasRepliedSuccessfulConnection_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    sendHasRepliedSuccessfulConnection_reg
       (.C(clk333_250),
        .CE(1'b1),
        .D(sendHasRepliedSuccessfulConnection_i_1_n_0),
        .Q(sendHasRepliedSuccessfulConnection_reg_n_0),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hF0F8F0F85050F0F8)) 
    sendHasUnackedSentPacket_i_1
       (.I0(sendHasUnackedSentPacket_i_2_n_0),
        .I1(sendHasUnackedSentPacket_i_3_n_0),
        .I2(sendHasUnackedSentPacket_reg_0),
        .I3(returnPacketsFIFO_empty),
        .I4(sendHasUnackedSentPacket_i_4_n_0),
        .I5(sendHasUnackedSentPacket_i_5_n_0),
        .O(sendHasUnackedSentPacket_i_1_n_0));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAA9AA)) 
    sendHasUnackedSentPacket_i_10
       (.I0(\sendLastSendPacketID_reg_n_0_[10] ),
        .I1(\sendLastSendPacketID_reg_n_0_[9] ),
        .I2(\sendLastSendPacketID_reg_n_0_[7] ),
        .I3(sendHasUnackedSentPacket_i_15_n_0),
        .I4(\sendLastSendPacketID_reg_n_0_[6] ),
        .I5(\sendLastSendPacketID_reg_n_0_[8] ),
        .O(sendHasUnackedSentPacket_i_10_n_0));
  LUT6 #(
    .INIT(64'hEFFDDFEFFEDFFDFE)) 
    sendHasUnackedSentPacket_i_11
       (.I0(DBG_recvLastSendAckedPacketID[8]),
        .I1(sendHasUnackedSentPacket_i_16_n_0),
        .I2(\sendLastSendPacketID_reg_n_0_[9] ),
        .I3(\sendLastSendPacketID_reg_n_0_[8] ),
        .I4(sendHasUnackedSentPacket_i_17_n_0),
        .I5(DBG_recvLastSendAckedPacketID[9]),
        .O(sendHasUnackedSentPacket_i_11_n_0));
  (* SOFT_HLUTNM = "soft_lutpair98" *) 
  LUT3 #(
    .INIT(8'h96)) 
    sendHasUnackedSentPacket_i_12
       (.I0(DBG_recvLastSendAckedPacketID[11]),
        .I1(sendHasUnackedSentPacket_i_13_n_0),
        .I2(\sendLastSendPacketID_reg_n_0_[11] ),
        .O(sendHasUnackedSentPacket_i_12_n_0));
  LUT6 #(
    .INIT(64'h0000000000000010)) 
    sendHasUnackedSentPacket_i_13
       (.I0(\sendLastSendPacketID_reg_n_0_[9] ),
        .I1(\sendLastSendPacketID_reg_n_0_[7] ),
        .I2(sendHasUnackedSentPacket_i_15_n_0),
        .I3(\sendLastSendPacketID_reg_n_0_[6] ),
        .I4(\sendLastSendPacketID_reg_n_0_[8] ),
        .I5(\sendLastSendPacketID_reg_n_0_[10] ),
        .O(sendHasUnackedSentPacket_i_13_n_0));
  (* SOFT_HLUTNM = "soft_lutpair97" *) 
  LUT4 #(
    .INIT(16'h0004)) 
    sendHasUnackedSentPacket_i_14
       (.I0(\sendLastSendPacketID_reg_n_0_[12] ),
        .I1(sendHasUnackedSentPacket_i_13_n_0),
        .I2(\sendLastSendPacketID_reg_n_0_[11] ),
        .I3(\sendLastSendPacketID_reg_n_0_[13] ),
        .O(sendHasUnackedSentPacket_i_14_n_0));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    sendHasUnackedSentPacket_i_15
       (.I0(\sendLastSendPacketID_reg_n_0_[4] ),
        .I1(\sendLastSendPacketID_reg_n_0_[2] ),
        .I2(\sendLastSendPacketID_reg_n_0_[0] ),
        .I3(\sendLastSendPacketID_reg_n_0_[1] ),
        .I4(\sendLastSendPacketID_reg_n_0_[3] ),
        .I5(\sendLastSendPacketID_reg_n_0_[5] ),
        .O(sendHasUnackedSentPacket_i_15_n_0));
  LUT6 #(
    .INIT(64'hEFFDDFEFFEDFFDFE)) 
    sendHasUnackedSentPacket_i_16
       (.I0(DBG_recvLastSendAckedPacketID[6]),
        .I1(sendHasUnackedSentPacket_i_18_n_0),
        .I2(\sendLastSendPacketID_reg_n_0_[7] ),
        .I3(\sendLastSendPacketID_reg_n_0_[6] ),
        .I4(sendHasUnackedSentPacket_i_15_n_0),
        .I5(DBG_recvLastSendAckedPacketID[7]),
        .O(sendHasUnackedSentPacket_i_16_n_0));
  (* SOFT_HLUTNM = "soft_lutpair124" *) 
  LUT3 #(
    .INIT(8'h04)) 
    sendHasUnackedSentPacket_i_17
       (.I0(\sendLastSendPacketID_reg_n_0_[6] ),
        .I1(sendHasUnackedSentPacket_i_15_n_0),
        .I2(\sendLastSendPacketID_reg_n_0_[7] ),
        .O(sendHasUnackedSentPacket_i_17_n_0));
  LUT6 #(
    .INIT(64'hEFFDDFEFFEDFFDFE)) 
    sendHasUnackedSentPacket_i_18
       (.I0(DBG_recvLastSendAckedPacketID[4]),
        .I1(sendHasUnackedSentPacket_i_19_n_0),
        .I2(\sendLastSendPacketID_reg_n_0_[5] ),
        .I3(\sendLastSendPacketID_reg_n_0_[4] ),
        .I4(sendHasUnackedSentPacket_i_20_n_0),
        .I5(DBG_recvLastSendAckedPacketID[5]),
        .O(sendHasUnackedSentPacket_i_18_n_0));
  LUT6 #(
    .INIT(64'hEFFDDFEFFEDFFDFE)) 
    sendHasUnackedSentPacket_i_19
       (.I0(DBG_recvLastSendAckedPacketID[2]),
        .I1(sendHasUnackedSentPacket_i_21_n_0),
        .I2(\sendLastSendPacketID_reg_n_0_[3] ),
        .I3(\sendLastSendPacketID_reg_n_0_[2] ),
        .I4(sendHasUnackedSentPacket_i_22_n_0),
        .I5(DBG_recvLastSendAckedPacketID[3]),
        .O(sendHasUnackedSentPacket_i_19_n_0));
  LUT6 #(
    .INIT(64'h0000000000000040)) 
    sendHasUnackedSentPacket_i_2
       (.I0(sendPacketState__0),
        .I1(sendHasRepliedSuccessfulConnection),
        .I2(currentState__0[0]),
        .I3(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .I4(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I5(\FSM_sequential_sendPacketState_reg_n_0_[3] ),
        .O(sendHasUnackedSentPacket_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair99" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    sendHasUnackedSentPacket_i_20
       (.I0(\sendLastSendPacketID_reg_n_0_[2] ),
        .I1(\sendLastSendPacketID_reg_n_0_[0] ),
        .I2(\sendLastSendPacketID_reg_n_0_[1] ),
        .I3(\sendLastSendPacketID_reg_n_0_[3] ),
        .O(sendHasUnackedSentPacket_i_20_n_0));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT5 #(
    .INIT(32'hBFF7F7BF)) 
    sendHasUnackedSentPacket_i_21
       (.I0(DBG_recvLastSendAckedPacketID[0]),
        .I1(sendHasUnackedSentPacket_reg_0),
        .I2(\sendLastSendPacketID_reg_n_0_[0] ),
        .I3(\sendLastSendPacketID_reg_n_0_[1] ),
        .I4(DBG_recvLastSendAckedPacketID[1]),
        .O(sendHasUnackedSentPacket_i_21_n_0));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'h1)) 
    sendHasUnackedSentPacket_i_22
       (.I0(\sendLastSendPacketID_reg_n_0_[0] ),
        .I1(\sendLastSendPacketID_reg_n_0_[1] ),
        .O(sendHasUnackedSentPacket_i_22_n_0));
  LUT5 #(
    .INIT(32'h01113333)) 
    sendHasUnackedSentPacket_i_3
       (.I0(send_pkt_data_count[2]),
        .I1(send_pkt_header_prog_full),
        .I2(send_pkt_data_count[0]),
        .I3(send_pkt_data_count[1]),
        .I4(sendHasUnackedSentPacket_i_6_n_0),
        .O(sendHasUnackedSentPacket_i_3_n_0));
  LUT5 #(
    .INIT(32'h06909009)) 
    sendHasUnackedSentPacket_i_4
       (.I0(\sendLastSendPacketID_reg_n_0_[14] ),
        .I1(DBG_recvLastSendAckedPacketID[14]),
        .I2(\sendLastSendPacketID_reg_n_0_[13] ),
        .I3(sendHasUnackedSentPacket_i_7_n_0),
        .I4(DBG_recvLastSendAckedPacketID[13]),
        .O(sendHasUnackedSentPacket_i_4_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFEFFE)) 
    sendHasUnackedSentPacket_i_5
       (.I0(sendHasUnackedSentPacket_i_8_n_0),
        .I1(sendHasUnackedSentPacket_i_9_n_0),
        .I2(DBG_recvLastSendAckedPacketID[10]),
        .I3(sendHasUnackedSentPacket_i_10_n_0),
        .I4(sendHasUnackedSentPacket_i_11_n_0),
        .I5(sendHasUnackedSentPacket_i_12_n_0),
        .O(sendHasUnackedSentPacket_i_5_n_0));
  LUT5 #(
    .INIT(32'h00008000)) 
    sendHasUnackedSentPacket_i_6
       (.I0(send_pkt_data_count[5]),
        .I1(send_pkt_data_count[7]),
        .I2(send_pkt_data_count[4]),
        .I3(send_pkt_data_count[6]),
        .I4(\sendFIFOAccess[2]_i_10_n_0 ),
        .O(sendHasUnackedSentPacket_i_6_n_0));
  (* SOFT_HLUTNM = "soft_lutpair97" *) 
  LUT3 #(
    .INIT(8'h04)) 
    sendHasUnackedSentPacket_i_7
       (.I0(\sendLastSendPacketID_reg_n_0_[11] ),
        .I1(sendHasUnackedSentPacket_i_13_n_0),
        .I2(\sendLastSendPacketID_reg_n_0_[12] ),
        .O(sendHasUnackedSentPacket_i_7_n_0));
  LUT4 #(
    .INIT(16'h4BB4)) 
    sendHasUnackedSentPacket_i_8
       (.I0(\sendLastSendPacketID_reg_n_0_[14] ),
        .I1(sendHasUnackedSentPacket_i_14_n_0),
        .I2(DBG_recvLastSendAckedPacketID[15]),
        .I3(\sendLastSendPacketID_reg_n_0_[15] ),
        .O(sendHasUnackedSentPacket_i_8_n_0));
  (* SOFT_HLUTNM = "soft_lutpair98" *) 
  LUT4 #(
    .INIT(16'h59A6)) 
    sendHasUnackedSentPacket_i_9
       (.I0(DBG_recvLastSendAckedPacketID[12]),
        .I1(sendHasUnackedSentPacket_i_13_n_0),
        .I2(\sendLastSendPacketID_reg_n_0_[11] ),
        .I3(\sendLastSendPacketID_reg_n_0_[12] ),
        .O(sendHasUnackedSentPacket_i_9_n_0));
  FDRE #(
    .INIT(1'b0)) 
    sendHasUnackedSentPacket_reg
       (.C(clk333_250),
        .CE(1'b1),
        .D(sendHasUnackedSentPacket_i_1_n_0),
        .Q(sendHasUnackedSentPacket_reg_0),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h1311)) 
    \sendLastAckedPacketID[15]_i_1 
       (.I0(currentState__0[2]),
        .I1(currentState__0[0]),
        .I2(\sendLastAckedPacketID[15]_i_3_n_0 ),
        .I3(\sendLastAckedPacketID[15]_i_4_n_0 ),
        .O(\sendLastAckedPacketID[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h6FF6FFFFFFFF6FF6)) 
    \sendLastAckedPacketID[15]_i_10 
       (.I0(D[9]),
        .I1(RotateByteLeft1_in[4]),
        .I2(RotateByteLeft1_in[6]),
        .I3(D[11]),
        .I4(RotateByteLeft1_in[5]),
        .I5(D[10]),
        .O(\sendLastAckedPacketID[15]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h6FF6FFFFFFFF6FF6)) 
    \sendLastAckedPacketID[15]_i_11 
       (.I0(D[6]),
        .I1(RotateByteRight0_in[4]),
        .I2(RotateByteRight0_in[5]),
        .I3(D[7]),
        .I4(RotateByteLeft1_in[3]),
        .I5(D[8]),
        .O(\sendLastAckedPacketID[15]_i_11_n_0 ));
  LUT4 #(
    .INIT(16'h1F11)) 
    \sendLastAckedPacketID[15]_i_2 
       (.I0(currentState__0[2]),
        .I1(currentState__0[0]),
        .I2(\sendLastAckedPacketID[15]_i_3_n_0 ),
        .I3(\sendLastAckedPacketID[15]_i_4_n_0 ),
        .O(\sendLastAckedPacketID[15]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFEF)) 
    \sendLastAckedPacketID[15]_i_3 
       (.I0(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .I2(sendHasRepliedSuccessfulConnection),
        .I3(currentState__0[2]),
        .I4(sendPacketState__0),
        .I5(\FSM_sequential_sendPacketState_reg_n_0_[3] ),
        .O(\sendLastAckedPacketID[15]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hBBBA)) 
    \sendLastAckedPacketID[15]_i_4 
       (.I0(\sendLastSendPacketID[15]_i_4_n_0 ),
        .I1(\sendLastAckedPacketID[15]_i_5_n_0 ),
        .I2(\sendLastAckedPacketID[15]_i_6_n_0 ),
        .I3(\sendLastAckedPacketID[15]_i_7_n_0 ),
        .O(\sendLastAckedPacketID[15]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT5 #(
    .INIT(32'hFFFFF8FF)) 
    \sendLastAckedPacketID[15]_i_5 
       (.I0(\sendFIFOAccess[2]_i_9_n_0 ),
        .I1(send_pkt_data_count[1]),
        .I2(sendHasUnackedSentPacket_reg_0),
        .I3(returnPacketsFIFO_empty),
        .I4(send_pkt_header_prog_full),
        .O(\sendLastAckedPacketID[15]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFF6)) 
    \sendLastAckedPacketID[15]_i_6 
       (.I0(D[15]),
        .I1(RotateByteLeft1_in[2]),
        .I2(\sendLastAckedPacketID[15]_i_8_n_0 ),
        .I3(\sendLastAckedPacketID[15]_i_9_n_0 ),
        .I4(\sendLastAckedPacketID[15]_i_10_n_0 ),
        .I5(\sendLastAckedPacketID[15]_i_11_n_0 ),
        .O(\sendLastAckedPacketID[15]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h6FF6FFFFFFFF6FF6)) 
    \sendLastAckedPacketID[15]_i_7 
       (.I0(D[12]),
        .I1(RotateByteLeft1_in[7]),
        .I2(RotateByteLeft1_in[0]),
        .I3(D[13]),
        .I4(RotateByteLeft1_in[1]),
        .I5(D[14]),
        .O(\sendLastAckedPacketID[15]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h6FF6FFFFFFFF6FF6)) 
    \sendLastAckedPacketID[15]_i_8 
       (.I0(RotateByteRight0_in[2]),
        .I1(D[4]),
        .I2(RotateByteRight0_in[3]),
        .I3(D[5]),
        .I4(D[3]),
        .I5(RotateByteRight0_in[1]),
        .O(\sendLastAckedPacketID[15]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h6FF6FFFFFFFF6FF6)) 
    \sendLastAckedPacketID[15]_i_9 
       (.I0(D[0]),
        .I1(RotateByteRight0_in[6]),
        .I2(RotateByteRight0_in[0]),
        .I3(D[2]),
        .I4(RotateByteRight0_in[7]),
        .I5(D[1]),
        .O(\sendLastAckedPacketID[15]_i_9_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendLastAckedPacketID_reg[0] 
       (.C(clk333_250),
        .CE(\sendLastAckedPacketID[15]_i_2_n_0 ),
        .D(\sendLastSendPacketID_reg_n_0_[0] ),
        .Q(DBG_sendLastAckedPacketID[0]),
        .R(\sendLastAckedPacketID[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendLastAckedPacketID_reg[10] 
       (.C(clk333_250),
        .CE(\sendLastAckedPacketID[15]_i_2_n_0 ),
        .D(\sendLastSendPacketID_reg_n_0_[10] ),
        .Q(DBG_sendLastAckedPacketID[10]),
        .R(\sendLastAckedPacketID[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendLastAckedPacketID_reg[11] 
       (.C(clk333_250),
        .CE(\sendLastAckedPacketID[15]_i_2_n_0 ),
        .D(\sendLastSendPacketID_reg_n_0_[11] ),
        .Q(DBG_sendLastAckedPacketID[11]),
        .R(\sendLastAckedPacketID[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendLastAckedPacketID_reg[12] 
       (.C(clk333_250),
        .CE(\sendLastAckedPacketID[15]_i_2_n_0 ),
        .D(\sendLastSendPacketID_reg_n_0_[12] ),
        .Q(DBG_sendLastAckedPacketID[12]),
        .R(\sendLastAckedPacketID[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendLastAckedPacketID_reg[13] 
       (.C(clk333_250),
        .CE(\sendLastAckedPacketID[15]_i_2_n_0 ),
        .D(\sendLastSendPacketID_reg_n_0_[13] ),
        .Q(DBG_sendLastAckedPacketID[13]),
        .R(\sendLastAckedPacketID[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendLastAckedPacketID_reg[14] 
       (.C(clk333_250),
        .CE(\sendLastAckedPacketID[15]_i_2_n_0 ),
        .D(\sendLastSendPacketID_reg_n_0_[14] ),
        .Q(DBG_sendLastAckedPacketID[14]),
        .R(\sendLastAckedPacketID[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendLastAckedPacketID_reg[15] 
       (.C(clk333_250),
        .CE(\sendLastAckedPacketID[15]_i_2_n_0 ),
        .D(\sendLastSendPacketID_reg_n_0_[15] ),
        .Q(DBG_sendLastAckedPacketID[15]),
        .R(\sendLastAckedPacketID[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendLastAckedPacketID_reg[1] 
       (.C(clk333_250),
        .CE(\sendLastAckedPacketID[15]_i_2_n_0 ),
        .D(\sendLastSendPacketID_reg_n_0_[1] ),
        .Q(DBG_sendLastAckedPacketID[1]),
        .R(\sendLastAckedPacketID[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendLastAckedPacketID_reg[2] 
       (.C(clk333_250),
        .CE(\sendLastAckedPacketID[15]_i_2_n_0 ),
        .D(\sendLastSendPacketID_reg_n_0_[2] ),
        .Q(DBG_sendLastAckedPacketID[2]),
        .R(\sendLastAckedPacketID[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendLastAckedPacketID_reg[3] 
       (.C(clk333_250),
        .CE(\sendLastAckedPacketID[15]_i_2_n_0 ),
        .D(\sendLastSendPacketID_reg_n_0_[3] ),
        .Q(DBG_sendLastAckedPacketID[3]),
        .R(\sendLastAckedPacketID[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendLastAckedPacketID_reg[4] 
       (.C(clk333_250),
        .CE(\sendLastAckedPacketID[15]_i_2_n_0 ),
        .D(\sendLastSendPacketID_reg_n_0_[4] ),
        .Q(DBG_sendLastAckedPacketID[4]),
        .R(\sendLastAckedPacketID[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendLastAckedPacketID_reg[5] 
       (.C(clk333_250),
        .CE(\sendLastAckedPacketID[15]_i_2_n_0 ),
        .D(\sendLastSendPacketID_reg_n_0_[5] ),
        .Q(DBG_sendLastAckedPacketID[5]),
        .R(\sendLastAckedPacketID[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendLastAckedPacketID_reg[6] 
       (.C(clk333_250),
        .CE(\sendLastAckedPacketID[15]_i_2_n_0 ),
        .D(\sendLastSendPacketID_reg_n_0_[6] ),
        .Q(DBG_sendLastAckedPacketID[6]),
        .R(\sendLastAckedPacketID[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendLastAckedPacketID_reg[7] 
       (.C(clk333_250),
        .CE(\sendLastAckedPacketID[15]_i_2_n_0 ),
        .D(\sendLastSendPacketID_reg_n_0_[7] ),
        .Q(DBG_sendLastAckedPacketID[7]),
        .R(\sendLastAckedPacketID[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendLastAckedPacketID_reg[8] 
       (.C(clk333_250),
        .CE(\sendLastAckedPacketID[15]_i_2_n_0 ),
        .D(\sendLastSendPacketID_reg_n_0_[8] ),
        .Q(DBG_sendLastAckedPacketID[8]),
        .R(\sendLastAckedPacketID[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendLastAckedPacketID_reg[9] 
       (.C(clk333_250),
        .CE(\sendLastAckedPacketID[15]_i_2_n_0 ),
        .D(\sendLastSendPacketID_reg_n_0_[9] ),
        .Q(DBG_sendLastAckedPacketID[9]),
        .R(\sendLastAckedPacketID[15]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \sendLastSendPacketID[0]_i_1 
       (.I0(\sendLastSendPacketID_reg_n_0_[0] ),
        .O(\sendLastSendPacketID[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \sendLastSendPacketID[10]_i_1 
       (.I0(\sendLastSendPacketID_reg_n_0_[10] ),
        .I1(\sendLastSendPacketID_reg_n_0_[9] ),
        .I2(\sendLastSendPacketID_reg_n_0_[7] ),
        .I3(\sendLastSendPacketID[10]_i_2_n_0 ),
        .I4(\sendLastSendPacketID_reg_n_0_[6] ),
        .I5(\sendLastSendPacketID_reg_n_0_[8] ),
        .O(\sendLastSendPacketID[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \sendLastSendPacketID[10]_i_2 
       (.I0(\sendLastSendPacketID_reg_n_0_[4] ),
        .I1(\sendLastSendPacketID_reg_n_0_[2] ),
        .I2(\sendLastSendPacketID_reg_n_0_[0] ),
        .I3(\sendLastSendPacketID_reg_n_0_[1] ),
        .I4(\sendLastSendPacketID_reg_n_0_[3] ),
        .I5(\sendLastSendPacketID_reg_n_0_[5] ),
        .O(\sendLastSendPacketID[10]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair125" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \sendLastSendPacketID[11]_i_1 
       (.I0(\sendLastSendPacketID_reg_n_0_[11] ),
        .I1(\sendLastSendPacketID[15]_i_5_n_0 ),
        .O(\sendLastSendPacketID[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair125" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \sendLastSendPacketID[12]_i_1 
       (.I0(\sendLastSendPacketID_reg_n_0_[12] ),
        .I1(\sendLastSendPacketID_reg_n_0_[11] ),
        .I2(\sendLastSendPacketID[15]_i_5_n_0 ),
        .O(\sendLastSendPacketID[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \sendLastSendPacketID[13]_i_1 
       (.I0(\sendLastSendPacketID_reg_n_0_[13] ),
        .I1(\sendLastSendPacketID_reg_n_0_[12] ),
        .I2(\sendLastSendPacketID[15]_i_5_n_0 ),
        .I3(\sendLastSendPacketID_reg_n_0_[11] ),
        .O(\sendLastSendPacketID[13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \sendLastSendPacketID[14]_i_1 
       (.I0(\sendLastSendPacketID_reg_n_0_[14] ),
        .I1(\sendLastSendPacketID_reg_n_0_[13] ),
        .I2(\sendLastSendPacketID_reg_n_0_[11] ),
        .I3(\sendLastSendPacketID[15]_i_5_n_0 ),
        .I4(\sendLastSendPacketID_reg_n_0_[12] ),
        .O(\sendLastSendPacketID[14]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h1311)) 
    \sendLastSendPacketID[15]_i_1 
       (.I0(currentState__0[2]),
        .I1(currentState__0[0]),
        .I2(\sendLastAckedPacketID[15]_i_3_n_0 ),
        .I3(\sendLastSendPacketID[15]_i_4_n_0 ),
        .O(\sendLastSendPacketID[15]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h1F11)) 
    \sendLastSendPacketID[15]_i_2 
       (.I0(currentState__0[2]),
        .I1(currentState__0[0]),
        .I2(\sendLastAckedPacketID[15]_i_3_n_0 ),
        .I3(\sendLastSendPacketID[15]_i_4_n_0 ),
        .O(\sendLastSendPacketID[15]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \sendLastSendPacketID[15]_i_3 
       (.I0(\sendLastSendPacketID_reg_n_0_[15] ),
        .I1(\sendLastSendPacketID_reg_n_0_[12] ),
        .I2(\sendLastSendPacketID[15]_i_5_n_0 ),
        .I3(\sendLastSendPacketID_reg_n_0_[11] ),
        .I4(\sendLastSendPacketID_reg_n_0_[13] ),
        .I5(\sendLastSendPacketID_reg_n_0_[14] ),
        .O(\sendLastSendPacketID[15]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair133" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \sendLastSendPacketID[15]_i_4 
       (.I0(sendHasUnackedSentPacket_i_3_n_0),
        .I1(sendHasUnackedSentPacket_reg_0),
        .I2(returnPacketsFIFO_empty),
        .O(\sendLastSendPacketID[15]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \sendLastSendPacketID[15]_i_5 
       (.I0(\sendLastSendPacketID_reg_n_0_[9] ),
        .I1(\sendLastSendPacketID_reg_n_0_[7] ),
        .I2(\sendLastSendPacketID[10]_i_2_n_0 ),
        .I3(\sendLastSendPacketID_reg_n_0_[6] ),
        .I4(\sendLastSendPacketID_reg_n_0_[8] ),
        .I5(\sendLastSendPacketID_reg_n_0_[10] ),
        .O(\sendLastSendPacketID[15]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hE0EEECEE0C000000)) 
    \sendLastSendPacketID[1]_i_1 
       (.I0(currentState__0[2]),
        .I1(currentState__0[0]),
        .I2(\sendLastAckedPacketID[15]_i_3_n_0 ),
        .I3(\sendLastSendPacketID[15]_i_4_n_0 ),
        .I4(\sendLastSendPacketID_reg_n_0_[0] ),
        .I5(\sendLastSendPacketID_reg_n_0_[1] ),
        .O(\sendLastSendPacketID[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair99" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \sendLastSendPacketID[2]_i_1 
       (.I0(\sendLastSendPacketID_reg_n_0_[2] ),
        .I1(\sendLastSendPacketID_reg_n_0_[1] ),
        .I2(\sendLastSendPacketID_reg_n_0_[0] ),
        .O(\sendLastSendPacketID[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \sendLastSendPacketID[3]_i_1 
       (.I0(\sendLastSendPacketID_reg_n_0_[3] ),
        .I1(\sendLastSendPacketID_reg_n_0_[2] ),
        .I2(\sendLastSendPacketID_reg_n_0_[0] ),
        .I3(\sendLastSendPacketID_reg_n_0_[1] ),
        .O(\sendLastSendPacketID[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \sendLastSendPacketID[4]_i_1 
       (.I0(\sendLastSendPacketID_reg_n_0_[4] ),
        .I1(\sendLastSendPacketID_reg_n_0_[3] ),
        .I2(\sendLastSendPacketID_reg_n_0_[1] ),
        .I3(\sendLastSendPacketID_reg_n_0_[0] ),
        .I4(\sendLastSendPacketID_reg_n_0_[2] ),
        .O(\sendLastSendPacketID[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \sendLastSendPacketID[5]_i_1 
       (.I0(\sendLastSendPacketID_reg_n_0_[5] ),
        .I1(\sendLastSendPacketID_reg_n_0_[4] ),
        .I2(\sendLastSendPacketID_reg_n_0_[2] ),
        .I3(\sendLastSendPacketID_reg_n_0_[0] ),
        .I4(\sendLastSendPacketID_reg_n_0_[1] ),
        .I5(\sendLastSendPacketID_reg_n_0_[3] ),
        .O(\sendLastSendPacketID[5]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \sendLastSendPacketID[6]_i_1 
       (.I0(\sendLastSendPacketID_reg_n_0_[6] ),
        .I1(\sendLastSendPacketID[10]_i_2_n_0 ),
        .O(\sendLastSendPacketID[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair124" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \sendLastSendPacketID[7]_i_1 
       (.I0(\sendLastSendPacketID_reg_n_0_[7] ),
        .I1(\sendLastSendPacketID_reg_n_0_[6] ),
        .I2(\sendLastSendPacketID[10]_i_2_n_0 ),
        .O(\sendLastSendPacketID[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \sendLastSendPacketID[8]_i_1 
       (.I0(\sendLastSendPacketID_reg_n_0_[8] ),
        .I1(\sendLastSendPacketID_reg_n_0_[7] ),
        .I2(\sendLastSendPacketID[10]_i_2_n_0 ),
        .I3(\sendLastSendPacketID_reg_n_0_[6] ),
        .O(\sendLastSendPacketID[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \sendLastSendPacketID[9]_i_1 
       (.I0(\sendLastSendPacketID_reg_n_0_[9] ),
        .I1(\sendLastSendPacketID_reg_n_0_[8] ),
        .I2(\sendLastSendPacketID_reg_n_0_[6] ),
        .I3(\sendLastSendPacketID[10]_i_2_n_0 ),
        .I4(\sendLastSendPacketID_reg_n_0_[7] ),
        .O(\sendLastSendPacketID[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendLastSendPacketID_reg[0] 
       (.C(clk333_250),
        .CE(\sendLastSendPacketID[15]_i_2_n_0 ),
        .D(\sendLastSendPacketID[0]_i_1_n_0 ),
        .Q(\sendLastSendPacketID_reg_n_0_[0] ),
        .R(\sendLastSendPacketID[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendLastSendPacketID_reg[10] 
       (.C(clk333_250),
        .CE(\sendLastSendPacketID[15]_i_2_n_0 ),
        .D(\sendLastSendPacketID[10]_i_1_n_0 ),
        .Q(\sendLastSendPacketID_reg_n_0_[10] ),
        .R(\sendLastSendPacketID[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendLastSendPacketID_reg[11] 
       (.C(clk333_250),
        .CE(\sendLastSendPacketID[15]_i_2_n_0 ),
        .D(\sendLastSendPacketID[11]_i_1_n_0 ),
        .Q(\sendLastSendPacketID_reg_n_0_[11] ),
        .R(\sendLastSendPacketID[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendLastSendPacketID_reg[12] 
       (.C(clk333_250),
        .CE(\sendLastSendPacketID[15]_i_2_n_0 ),
        .D(\sendLastSendPacketID[12]_i_1_n_0 ),
        .Q(\sendLastSendPacketID_reg_n_0_[12] ),
        .R(\sendLastSendPacketID[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendLastSendPacketID_reg[13] 
       (.C(clk333_250),
        .CE(\sendLastSendPacketID[15]_i_2_n_0 ),
        .D(\sendLastSendPacketID[13]_i_1_n_0 ),
        .Q(\sendLastSendPacketID_reg_n_0_[13] ),
        .R(\sendLastSendPacketID[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendLastSendPacketID_reg[14] 
       (.C(clk333_250),
        .CE(\sendLastSendPacketID[15]_i_2_n_0 ),
        .D(\sendLastSendPacketID[14]_i_1_n_0 ),
        .Q(\sendLastSendPacketID_reg_n_0_[14] ),
        .R(\sendLastSendPacketID[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendLastSendPacketID_reg[15] 
       (.C(clk333_250),
        .CE(\sendLastSendPacketID[15]_i_2_n_0 ),
        .D(\sendLastSendPacketID[15]_i_3_n_0 ),
        .Q(\sendLastSendPacketID_reg_n_0_[15] ),
        .R(\sendLastSendPacketID[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendLastSendPacketID_reg[1] 
       (.C(clk333_250),
        .CE(1'b1),
        .D(\sendLastSendPacketID[1]_i_1_n_0 ),
        .Q(\sendLastSendPacketID_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendLastSendPacketID_reg[2] 
       (.C(clk333_250),
        .CE(\sendLastSendPacketID[15]_i_2_n_0 ),
        .D(\sendLastSendPacketID[2]_i_1_n_0 ),
        .Q(\sendLastSendPacketID_reg_n_0_[2] ),
        .R(\sendLastSendPacketID[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendLastSendPacketID_reg[3] 
       (.C(clk333_250),
        .CE(\sendLastSendPacketID[15]_i_2_n_0 ),
        .D(\sendLastSendPacketID[3]_i_1_n_0 ),
        .Q(\sendLastSendPacketID_reg_n_0_[3] ),
        .R(\sendLastSendPacketID[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendLastSendPacketID_reg[4] 
       (.C(clk333_250),
        .CE(\sendLastSendPacketID[15]_i_2_n_0 ),
        .D(\sendLastSendPacketID[4]_i_1_n_0 ),
        .Q(\sendLastSendPacketID_reg_n_0_[4] ),
        .R(\sendLastSendPacketID[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendLastSendPacketID_reg[5] 
       (.C(clk333_250),
        .CE(\sendLastSendPacketID[15]_i_2_n_0 ),
        .D(\sendLastSendPacketID[5]_i_1_n_0 ),
        .Q(\sendLastSendPacketID_reg_n_0_[5] ),
        .R(\sendLastSendPacketID[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendLastSendPacketID_reg[6] 
       (.C(clk333_250),
        .CE(\sendLastSendPacketID[15]_i_2_n_0 ),
        .D(\sendLastSendPacketID[6]_i_1_n_0 ),
        .Q(\sendLastSendPacketID_reg_n_0_[6] ),
        .R(\sendLastSendPacketID[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendLastSendPacketID_reg[7] 
       (.C(clk333_250),
        .CE(\sendLastSendPacketID[15]_i_2_n_0 ),
        .D(\sendLastSendPacketID[7]_i_1_n_0 ),
        .Q(\sendLastSendPacketID_reg_n_0_[7] ),
        .R(\sendLastSendPacketID[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendLastSendPacketID_reg[8] 
       (.C(clk333_250),
        .CE(\sendLastSendPacketID[15]_i_2_n_0 ),
        .D(\sendLastSendPacketID[8]_i_1_n_0 ),
        .Q(\sendLastSendPacketID_reg_n_0_[8] ),
        .R(\sendLastSendPacketID[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendLastSendPacketID_reg[9] 
       (.C(clk333_250),
        .CE(\sendLastSendPacketID[15]_i_2_n_0 ),
        .D(\sendLastSendPacketID[9]_i_1_n_0 ),
        .Q(\sendLastSendPacketID_reg_n_0_[9] ),
        .R(\sendLastSendPacketID[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h3000000030000020)) 
    \sendLastSentPacketHeader[lastAckedPacketID][15]_i_1 
       (.I0(\sendLastSentPacketHeader[lastAckedPacketID][15]_i_2_n_0 ),
        .I1(sendPacketState__0),
        .I2(currentState__1),
        .I3(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .I4(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I5(\FSM_sequential_sendPacketState_reg_n_0_[3] ),
        .O(\sendLastSentPacketHeader[lastAckedPacketID] ));
  (* SOFT_HLUTNM = "soft_lutpair133" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \sendLastSentPacketHeader[lastAckedPacketID][15]_i_2 
       (.I0(sendHasUnackedSentPacket_reg_0),
        .I1(\sendCyclesBetweenAutoResends[27]_i_5_n_0 ),
        .O(\sendLastSentPacketHeader[lastAckedPacketID][15]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h9996966666696999)) 
    \sendLastSentPacketHeader[packetChecksum][7]_i_10 
       (.I0(RotateByteRight[5]),
        .I1(\sendLastSentPacketHeader[packetChecksum][7]_i_19_n_0 ),
        .I2(\sendLastSentPacketHeader_reg[packetChecksum][7]_i_16_n_15 ),
        .I3(RotateByteRight[4]),
        .I4(\sendLastSentPacketHeader_reg[packetChecksum][7]_i_17_n_11 ),
        .I5(\sendLastSentPacketHeader[packetChecksum][7]_i_3_n_0 ),
        .O(\sendLastSentPacketHeader[packetChecksum][7]_i_10_n_0 ));
  LUT5 #(
    .INIT(32'h3EF8C107)) 
    \sendLastSentPacketHeader[packetChecksum][7]_i_11 
       (.I0(\sendLastSentPacketHeader_reg[packetChecksum][7]_i_17_n_13 ),
        .I1(RotateByteRight[3]),
        .I2(\sendLastSentPacketHeader_reg[packetFlags] ),
        .I3(\sendLastSentPacketHeader_reg[packetChecksum][7]_i_17_n_12 ),
        .I4(\sendLastSentPacketHeader[packetChecksum][7]_i_20_n_0 ),
        .O(\sendLastSentPacketHeader[packetChecksum][7]_i_11_n_0 ));
  LUT5 #(
    .INIT(32'h96699696)) 
    \sendLastSentPacketHeader[packetChecksum][7]_i_12 
       (.I0(\sendLastSentPacketHeader[packetChecksum][7]_i_5_n_0 ),
        .I1(RotateByteRight[3]),
        .I2(\sendLastSentPacketHeader_reg[packetChecksum][7]_i_17_n_12 ),
        .I3(\sendLastSentPacketHeader_reg[packetFlags] ),
        .I4(\sendLastSentPacketHeader_reg[packetChecksum][7]_i_17_n_13 ),
        .O(\sendLastSentPacketHeader[packetChecksum][7]_i_12_n_0 ));
  LUT5 #(
    .INIT(32'h96999969)) 
    \sendLastSentPacketHeader[packetChecksum][7]_i_13 
       (.I0(RotateByteRight[2]),
        .I1(\sendLastSentPacketHeader_reg[packetChecksum][7]_i_17_n_13 ),
        .I2(\sendLastSentPacketHeader_reg[packetFlags] ),
        .I3(RotateByteRight[1]),
        .I4(\sendLastSentPacketHeader_reg[packetChecksum][7]_i_17_n_14 ),
        .O(\sendLastSentPacketHeader[packetChecksum][7]_i_13_n_0 ));
  LUT4 #(
    .INIT(16'h6996)) 
    \sendLastSentPacketHeader[packetChecksum][7]_i_14 
       (.I0(\sendLastSentPacketHeader[packetChecksum][7]_i_7_n_0 ),
        .I1(\sendLastSentPacketHeader_reg[packetFlags] ),
        .I2(\sendLastSentPacketHeader_reg[packetChecksum][7]_i_17_n_14 ),
        .I3(RotateByteRight[1]),
        .O(\sendLastSentPacketHeader[packetChecksum][7]_i_14_n_0 ));
  (* HLUTNM = "lutpair0" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \sendLastSentPacketHeader[packetChecksum][7]_i_15 
       (.I0(\sendLastSentPacketHeader_reg[packetFlags] ),
        .I1(\sendLastSentPacketHeader_reg[packetChecksum][7]_i_17_n_15 ),
        .I2(RotateByteRight[0]),
        .O(\sendLastSentPacketHeader[packetChecksum][7]_i_15_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair156" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \sendLastSentPacketHeader[packetChecksum][7]_i_18 
       (.I0(\sendLastSentPacketHeader_reg[packetChecksum][7]_i_17_n_10 ),
        .I1(\sendLastSentPacketHeader_reg[packetChecksum][7]_i_16_n_14 ),
        .O(\sendLastSentPacketHeader[packetChecksum][7]_i_18_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair156" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \sendLastSentPacketHeader[packetChecksum][7]_i_19 
       (.I0(\sendLastSentPacketHeader_reg[packetChecksum][7]_i_17_n_10 ),
        .I1(\sendLastSentPacketHeader_reg[packetChecksum][7]_i_16_n_14 ),
        .O(\sendLastSentPacketHeader[packetChecksum][7]_i_19_n_0 ));
  LUT6 #(
    .INIT(64'hF9F9F990F9909090)) 
    \sendLastSentPacketHeader[packetChecksum][7]_i_2 
       (.I0(\sendLastSentPacketHeader_reg[packetChecksum][7]_i_16_n_14 ),
        .I1(\sendLastSentPacketHeader_reg[packetChecksum][7]_i_17_n_10 ),
        .I2(RotateByteRight[5]),
        .I3(\sendLastSentPacketHeader_reg[packetChecksum][7]_i_16_n_15 ),
        .I4(RotateByteRight[4]),
        .I5(\sendLastSentPacketHeader_reg[packetChecksum][7]_i_17_n_11 ),
        .O(\sendLastSentPacketHeader[packetChecksum][7]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h69)) 
    \sendLastSentPacketHeader[packetChecksum][7]_i_20 
       (.I0(RotateByteRight[4]),
        .I1(\sendLastSentPacketHeader_reg[packetChecksum][7]_i_16_n_15 ),
        .I2(\sendLastSentPacketHeader_reg[packetChecksum][7]_i_17_n_11 ),
        .O(\sendLastSentPacketHeader[packetChecksum][7]_i_20_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \sendLastSentPacketHeader[packetChecksum][7]_i_21 
       (.I0(\sendLastSentPacketHeader_reg[packetFlags] ),
        .O(\sendLastSentPacketHeader[packetChecksum][7]_i_21_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \sendLastSentPacketHeader[packetChecksum][7]_i_22 
       (.I0(\sendLastSentPacketHeader_reg[subpacketCount_n_0_][0] ),
        .O(\sendLastSentPacketHeader[packetChecksum][7]_i_22_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \sendLastSentPacketHeader[packetChecksum][7]_i_23 
       (.I0(\sendLastSentPacketHeader_reg[subpacketCount_n_0_][0] ),
        .O(\sendLastSentPacketHeader[packetChecksum][7]_i_23_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \sendLastSentPacketHeader[packetChecksum][7]_i_24 
       (.I0(\sendLastSentPacketHeader_reg[subpacketCount_n_0_][0] ),
        .O(\sendLastSentPacketHeader[packetChecksum][7]_i_24_n_0 ));
  LUT3 #(
    .INIT(8'hE8)) 
    \sendLastSentPacketHeader[packetChecksum][7]_i_25 
       (.I0(RotateByteLeft[5]),
        .I1(RotateByteLeft1_in[5]),
        .I2(RotateByteRight0_in[5]),
        .O(\sendLastSentPacketHeader[packetChecksum][7]_i_25_n_0 ));
  LUT3 #(
    .INIT(8'hE8)) 
    \sendLastSentPacketHeader[packetChecksum][7]_i_26 
       (.I0(RotateByteLeft[4]),
        .I1(RotateByteLeft1_in[4]),
        .I2(RotateByteRight0_in[4]),
        .O(\sendLastSentPacketHeader[packetChecksum][7]_i_26_n_0 ));
  LUT3 #(
    .INIT(8'hE8)) 
    \sendLastSentPacketHeader[packetChecksum][7]_i_27 
       (.I0(RotateByteLeft[3]),
        .I1(RotateByteLeft1_in[3]),
        .I2(RotateByteRight0_in[3]),
        .O(\sendLastSentPacketHeader[packetChecksum][7]_i_27_n_0 ));
  LUT3 #(
    .INIT(8'hE8)) 
    \sendLastSentPacketHeader[packetChecksum][7]_i_28 
       (.I0(RotateByteLeft[2]),
        .I1(RotateByteLeft1_in[2]),
        .I2(RotateByteRight0_in[2]),
        .O(\sendLastSentPacketHeader[packetChecksum][7]_i_28_n_0 ));
  LUT3 #(
    .INIT(8'hE8)) 
    \sendLastSentPacketHeader[packetChecksum][7]_i_29 
       (.I0(RotateByteLeft[1]),
        .I1(RotateByteLeft1_in[1]),
        .I2(RotateByteRight0_in[1]),
        .O(\sendLastSentPacketHeader[packetChecksum][7]_i_29_n_0 ));
  LUT6 #(
    .INIT(64'hE80000E800E8E800)) 
    \sendLastSentPacketHeader[packetChecksum][7]_i_3 
       (.I0(RotateByteRight[3]),
        .I1(\sendLastSentPacketHeader_reg[packetFlags] ),
        .I2(\sendLastSentPacketHeader_reg[packetChecksum][7]_i_17_n_12 ),
        .I3(\sendLastSentPacketHeader_reg[packetChecksum][7]_i_17_n_11 ),
        .I4(\sendLastSentPacketHeader_reg[packetChecksum][7]_i_16_n_15 ),
        .I5(RotateByteRight[4]),
        .O(\sendLastSentPacketHeader[packetChecksum][7]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hE8)) 
    \sendLastSentPacketHeader[packetChecksum][7]_i_30 
       (.I0(RotateByteLeft1_in[0]),
        .I1(RotateByteLeft[0]),
        .I2(RotateByteRight0_in[0]),
        .O(\sendLastSentPacketHeader[packetChecksum][7]_i_30_n_0 ));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    \sendLastSentPacketHeader[packetChecksum][7]_i_31 
       (.I0(RotateByteLeft[6]),
        .I1(RotateByteLeft1_in[6]),
        .I2(RotateByteRight0_in[6]),
        .I3(RotateByteLeft[7]),
        .I4(RotateByteRight0_in[7]),
        .I5(RotateByteLeft1_in[7]),
        .O(\sendLastSentPacketHeader[packetChecksum][7]_i_31_n_0 ));
  LUT4 #(
    .INIT(16'h6996)) 
    \sendLastSentPacketHeader[packetChecksum][7]_i_32 
       (.I0(\sendLastSentPacketHeader[packetChecksum][7]_i_25_n_0 ),
        .I1(RotateByteLeft[6]),
        .I2(RotateByteLeft1_in[6]),
        .I3(RotateByteRight0_in[6]),
        .O(\sendLastSentPacketHeader[packetChecksum][7]_i_32_n_0 ));
  LUT4 #(
    .INIT(16'h6996)) 
    \sendLastSentPacketHeader[packetChecksum][7]_i_33 
       (.I0(RotateByteLeft[5]),
        .I1(RotateByteLeft1_in[5]),
        .I2(RotateByteRight0_in[5]),
        .I3(\sendLastSentPacketHeader[packetChecksum][7]_i_26_n_0 ),
        .O(\sendLastSentPacketHeader[packetChecksum][7]_i_33_n_0 ));
  LUT4 #(
    .INIT(16'h6996)) 
    \sendLastSentPacketHeader[packetChecksum][7]_i_34 
       (.I0(RotateByteLeft[4]),
        .I1(RotateByteLeft1_in[4]),
        .I2(RotateByteRight0_in[4]),
        .I3(\sendLastSentPacketHeader[packetChecksum][7]_i_27_n_0 ),
        .O(\sendLastSentPacketHeader[packetChecksum][7]_i_34_n_0 ));
  LUT4 #(
    .INIT(16'h6996)) 
    \sendLastSentPacketHeader[packetChecksum][7]_i_35 
       (.I0(RotateByteLeft[3]),
        .I1(RotateByteLeft1_in[3]),
        .I2(RotateByteRight0_in[3]),
        .I3(\sendLastSentPacketHeader[packetChecksum][7]_i_28_n_0 ),
        .O(\sendLastSentPacketHeader[packetChecksum][7]_i_35_n_0 ));
  LUT4 #(
    .INIT(16'h6996)) 
    \sendLastSentPacketHeader[packetChecksum][7]_i_36 
       (.I0(RotateByteLeft[2]),
        .I1(RotateByteLeft1_in[2]),
        .I2(RotateByteRight0_in[2]),
        .I3(\sendLastSentPacketHeader[packetChecksum][7]_i_29_n_0 ),
        .O(\sendLastSentPacketHeader[packetChecksum][7]_i_36_n_0 ));
  LUT4 #(
    .INIT(16'h6996)) 
    \sendLastSentPacketHeader[packetChecksum][7]_i_37 
       (.I0(RotateByteLeft[1]),
        .I1(RotateByteLeft1_in[1]),
        .I2(RotateByteRight0_in[1]),
        .I3(\sendLastSentPacketHeader[packetChecksum][7]_i_30_n_0 ),
        .O(\sendLastSentPacketHeader[packetChecksum][7]_i_37_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \sendLastSentPacketHeader[packetChecksum][7]_i_38 
       (.I0(RotateByteLeft1_in[0]),
        .I1(RotateByteLeft[0]),
        .I2(RotateByteRight0_in[0]),
        .O(\sendLastSentPacketHeader[packetChecksum][7]_i_38_n_0 ));
  LUT4 #(
    .INIT(16'hC22C)) 
    \sendLastSentPacketHeader[packetChecksum][7]_i_4 
       (.I0(\sendLastSentPacketHeader_reg[packetChecksum][7]_i_17_n_13 ),
        .I1(\sendLastSentPacketHeader_reg[packetFlags] ),
        .I2(\sendLastSentPacketHeader_reg[packetChecksum][7]_i_17_n_12 ),
        .I3(RotateByteRight[3]),
        .O(\sendLastSentPacketHeader[packetChecksum][7]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h82)) 
    \sendLastSentPacketHeader[packetChecksum][7]_i_5 
       (.I0(RotateByteRight[2]),
        .I1(\sendLastSentPacketHeader_reg[packetChecksum][7]_i_17_n_13 ),
        .I2(\sendLastSentPacketHeader_reg[packetFlags] ),
        .O(\sendLastSentPacketHeader[packetChecksum][7]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h69)) 
    \sendLastSentPacketHeader[packetChecksum][7]_i_6 
       (.I0(\sendLastSentPacketHeader_reg[packetChecksum][7]_i_17_n_13 ),
        .I1(\sendLastSentPacketHeader_reg[packetFlags] ),
        .I2(RotateByteRight[2]),
        .O(\sendLastSentPacketHeader[packetChecksum][7]_i_6_n_0 ));
  (* HLUTNM = "lutpair0" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \sendLastSentPacketHeader[packetChecksum][7]_i_7 
       (.I0(\sendLastSentPacketHeader_reg[packetFlags] ),
        .I1(\sendLastSentPacketHeader_reg[packetChecksum][7]_i_17_n_15 ),
        .O(\sendLastSentPacketHeader[packetChecksum][7]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h693C3C963C9696C3)) 
    \sendLastSentPacketHeader[packetChecksum][7]_i_8 
       (.I0(\sendLastSentPacketHeader[packetChecksum][7]_i_18_n_0 ),
        .I1(\sendLastSentPacketHeader_reg[packetChecksum][7]_i_17_n_8 ),
        .I2(RotateByteRight[7]),
        .I3(\sendLastSentPacketHeader_reg[packetChecksum][7]_i_17_n_9 ),
        .I4(RotateByteRight[6]),
        .I5(\sendLastSentPacketHeader_reg[packetChecksum][7]_i_16_n_6 ),
        .O(\sendLastSentPacketHeader[packetChecksum][7]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h9669966996696996)) 
    \sendLastSentPacketHeader[packetChecksum][7]_i_9 
       (.I0(\sendLastSentPacketHeader[packetChecksum][7]_i_2_n_0 ),
        .I1(RotateByteRight[6]),
        .I2(\sendLastSentPacketHeader_reg[packetChecksum][7]_i_16_n_6 ),
        .I3(\sendLastSentPacketHeader_reg[packetChecksum][7]_i_17_n_9 ),
        .I4(\sendLastSentPacketHeader_reg[packetChecksum][7]_i_17_n_10 ),
        .I5(\sendLastSentPacketHeader_reg[packetChecksum][7]_i_16_n_14 ),
        .O(\sendLastSentPacketHeader[packetChecksum][7]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000020000)) 
    \sendLastSentPacketHeader[subpacketCount][0]_i_1 
       (.I0(\sendLastAckedPacketID[15]_i_4_n_0 ),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[3] ),
        .I2(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I3(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .I4(currentState__1),
        .I5(sendPacketState__0),
        .O(\sendLastSentPacketHeader[packetType] ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \sendLastSentPacketHeader[subpacketCount][0]_i_2 
       (.I0(returnPacketsFIFO_empty),
        .O(p_41_in));
  FDRE \sendLastSentPacketHeader_reg[lastAckedPacketID][0] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[lastAckedPacketID] ),
        .D(D[0]),
        .Q(RotateByteRight0_in[6]),
        .R(1'b0));
  FDRE \sendLastSentPacketHeader_reg[lastAckedPacketID][10] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[lastAckedPacketID] ),
        .D(D[10]),
        .Q(RotateByteLeft1_in[5]),
        .R(1'b0));
  FDRE \sendLastSentPacketHeader_reg[lastAckedPacketID][11] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[lastAckedPacketID] ),
        .D(D[11]),
        .Q(RotateByteLeft1_in[6]),
        .R(1'b0));
  FDRE \sendLastSentPacketHeader_reg[lastAckedPacketID][12] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[lastAckedPacketID] ),
        .D(D[12]),
        .Q(RotateByteLeft1_in[7]),
        .R(1'b0));
  FDRE \sendLastSentPacketHeader_reg[lastAckedPacketID][13] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[lastAckedPacketID] ),
        .D(D[13]),
        .Q(RotateByteLeft1_in[0]),
        .R(1'b0));
  FDRE \sendLastSentPacketHeader_reg[lastAckedPacketID][14] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[lastAckedPacketID] ),
        .D(D[14]),
        .Q(RotateByteLeft1_in[1]),
        .R(1'b0));
  FDRE \sendLastSentPacketHeader_reg[lastAckedPacketID][15] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[lastAckedPacketID] ),
        .D(D[15]),
        .Q(RotateByteLeft1_in[2]),
        .R(1'b0));
  FDRE \sendLastSentPacketHeader_reg[lastAckedPacketID][1] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[lastAckedPacketID] ),
        .D(D[1]),
        .Q(RotateByteRight0_in[7]),
        .R(1'b0));
  FDRE \sendLastSentPacketHeader_reg[lastAckedPacketID][2] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[lastAckedPacketID] ),
        .D(D[2]),
        .Q(RotateByteRight0_in[0]),
        .R(1'b0));
  FDRE \sendLastSentPacketHeader_reg[lastAckedPacketID][3] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[lastAckedPacketID] ),
        .D(D[3]),
        .Q(RotateByteRight0_in[1]),
        .R(1'b0));
  FDRE \sendLastSentPacketHeader_reg[lastAckedPacketID][4] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[lastAckedPacketID] ),
        .D(D[4]),
        .Q(RotateByteRight0_in[2]),
        .R(1'b0));
  FDRE \sendLastSentPacketHeader_reg[lastAckedPacketID][5] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[lastAckedPacketID] ),
        .D(D[5]),
        .Q(RotateByteRight0_in[3]),
        .R(1'b0));
  FDRE \sendLastSentPacketHeader_reg[lastAckedPacketID][6] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[lastAckedPacketID] ),
        .D(D[6]),
        .Q(RotateByteRight0_in[4]),
        .R(1'b0));
  FDRE \sendLastSentPacketHeader_reg[lastAckedPacketID][7] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[lastAckedPacketID] ),
        .D(D[7]),
        .Q(RotateByteRight0_in[5]),
        .R(1'b0));
  FDRE \sendLastSentPacketHeader_reg[lastAckedPacketID][8] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[lastAckedPacketID] ),
        .D(D[8]),
        .Q(RotateByteLeft1_in[3]),
        .R(1'b0));
  FDRE \sendLastSentPacketHeader_reg[lastAckedPacketID][9] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[lastAckedPacketID] ),
        .D(D[9]),
        .Q(RotateByteLeft1_in[4]),
        .R(1'b0));
  FDRE \sendLastSentPacketHeader_reg[packetChecksum][0] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[packetChecksum] ),
        .D(\sendLastSentPacketHeader_reg[packetChecksum][7]_i_1_n_15 ),
        .Q(\sendLastSentPacketHeader_reg[packetChecksum] [0]),
        .R(1'b0));
  FDRE \sendLastSentPacketHeader_reg[packetChecksum][1] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[packetChecksum] ),
        .D(\sendLastSentPacketHeader_reg[packetChecksum][7]_i_1_n_14 ),
        .Q(\sendLastSentPacketHeader_reg[packetChecksum] [1]),
        .R(1'b0));
  FDRE \sendLastSentPacketHeader_reg[packetChecksum][2] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[packetChecksum] ),
        .D(\sendLastSentPacketHeader_reg[packetChecksum][7]_i_1_n_13 ),
        .Q(\sendLastSentPacketHeader_reg[packetChecksum] [2]),
        .R(1'b0));
  FDRE \sendLastSentPacketHeader_reg[packetChecksum][3] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[packetChecksum] ),
        .D(\sendLastSentPacketHeader_reg[packetChecksum][7]_i_1_n_12 ),
        .Q(\sendLastSentPacketHeader_reg[packetChecksum] [3]),
        .R(1'b0));
  FDRE \sendLastSentPacketHeader_reg[packetChecksum][4] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[packetChecksum] ),
        .D(\sendLastSentPacketHeader_reg[packetChecksum][7]_i_1_n_11 ),
        .Q(\sendLastSentPacketHeader_reg[packetChecksum] [4]),
        .R(1'b0));
  FDRE \sendLastSentPacketHeader_reg[packetChecksum][5] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[packetChecksum] ),
        .D(\sendLastSentPacketHeader_reg[packetChecksum][7]_i_1_n_10 ),
        .Q(\sendLastSentPacketHeader_reg[packetChecksum] [5]),
        .R(1'b0));
  FDRE \sendLastSentPacketHeader_reg[packetChecksum][6] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[packetChecksum] ),
        .D(\sendLastSentPacketHeader_reg[packetChecksum][7]_i_1_n_9 ),
        .Q(\sendLastSentPacketHeader_reg[packetChecksum] [6]),
        .R(1'b0));
  FDRE \sendLastSentPacketHeader_reg[packetChecksum][7] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[packetChecksum] ),
        .D(\sendLastSentPacketHeader_reg[packetChecksum][7]_i_1_n_8 ),
        .Q(\sendLastSentPacketHeader_reg[packetChecksum] [7]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \sendLastSentPacketHeader_reg[packetChecksum][7]_i_1 
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({\NLW_sendLastSentPacketHeader_reg[packetChecksum][7]_i_1_CO_UNCONNECTED [7],\sendLastSentPacketHeader_reg[packetChecksum][7]_i_1_n_1 ,\sendLastSentPacketHeader_reg[packetChecksum][7]_i_1_n_2 ,\sendLastSentPacketHeader_reg[packetChecksum][7]_i_1_n_3 ,\sendLastSentPacketHeader_reg[packetChecksum][7]_i_1_n_4 ,\sendLastSentPacketHeader_reg[packetChecksum][7]_i_1_n_5 ,\sendLastSentPacketHeader_reg[packetChecksum][7]_i_1_n_6 ,\sendLastSentPacketHeader_reg[packetChecksum][7]_i_1_n_7 }),
        .DI({1'b0,\sendLastSentPacketHeader[packetChecksum][7]_i_2_n_0 ,\sendLastSentPacketHeader[packetChecksum][7]_i_3_n_0 ,\sendLastSentPacketHeader[packetChecksum][7]_i_4_n_0 ,\sendLastSentPacketHeader[packetChecksum][7]_i_5_n_0 ,\sendLastSentPacketHeader[packetChecksum][7]_i_6_n_0 ,\sendLastSentPacketHeader[packetChecksum][7]_i_7_n_0 ,RotateByteRight[0]}),
        .O({\sendLastSentPacketHeader_reg[packetChecksum][7]_i_1_n_8 ,\sendLastSentPacketHeader_reg[packetChecksum][7]_i_1_n_9 ,\sendLastSentPacketHeader_reg[packetChecksum][7]_i_1_n_10 ,\sendLastSentPacketHeader_reg[packetChecksum][7]_i_1_n_11 ,\sendLastSentPacketHeader_reg[packetChecksum][7]_i_1_n_12 ,\sendLastSentPacketHeader_reg[packetChecksum][7]_i_1_n_13 ,\sendLastSentPacketHeader_reg[packetChecksum][7]_i_1_n_14 ,\sendLastSentPacketHeader_reg[packetChecksum][7]_i_1_n_15 }),
        .S({\sendLastSentPacketHeader[packetChecksum][7]_i_8_n_0 ,\sendLastSentPacketHeader[packetChecksum][7]_i_9_n_0 ,\sendLastSentPacketHeader[packetChecksum][7]_i_10_n_0 ,\sendLastSentPacketHeader[packetChecksum][7]_i_11_n_0 ,\sendLastSentPacketHeader[packetChecksum][7]_i_12_n_0 ,\sendLastSentPacketHeader[packetChecksum][7]_i_13_n_0 ,\sendLastSentPacketHeader[packetChecksum][7]_i_14_n_0 ,\sendLastSentPacketHeader[packetChecksum][7]_i_15_n_0 }));
  CARRY8 \sendLastSentPacketHeader_reg[packetChecksum][7]_i_16 
       (.CI(\sendLastSentPacketHeader[packetChecksum][7]_i_21_n_0 ),
        .CI_TOP(1'b0),
        .CO({\NLW_sendLastSentPacketHeader_reg[packetChecksum][7]_i_16_CO_UNCONNECTED [7:2],\sendLastSentPacketHeader_reg[packetChecksum][7]_i_16_n_6 ,\sendLastSentPacketHeader_reg[packetChecksum][7]_i_16_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,\sendLastSentPacketHeader_reg[subpacketCount_n_0_][0] ,\sendLastSentPacketHeader[packetChecksum][7]_i_22_n_0 }),
        .O({\NLW_sendLastSentPacketHeader_reg[packetChecksum][7]_i_16_O_UNCONNECTED [7:2],\sendLastSentPacketHeader_reg[packetChecksum][7]_i_16_n_14 ,\sendLastSentPacketHeader_reg[packetChecksum][7]_i_16_n_15 }),
        .S({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,\sendLastSentPacketHeader[packetChecksum][7]_i_23_n_0 ,\sendLastSentPacketHeader[packetChecksum][7]_i_24_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \sendLastSentPacketHeader_reg[packetChecksum][7]_i_17 
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({\NLW_sendLastSentPacketHeader_reg[packetChecksum][7]_i_17_CO_UNCONNECTED [7],\sendLastSentPacketHeader_reg[packetChecksum][7]_i_17_n_1 ,\sendLastSentPacketHeader_reg[packetChecksum][7]_i_17_n_2 ,\sendLastSentPacketHeader_reg[packetChecksum][7]_i_17_n_3 ,\sendLastSentPacketHeader_reg[packetChecksum][7]_i_17_n_4 ,\sendLastSentPacketHeader_reg[packetChecksum][7]_i_17_n_5 ,\sendLastSentPacketHeader_reg[packetChecksum][7]_i_17_n_6 ,\sendLastSentPacketHeader_reg[packetChecksum][7]_i_17_n_7 }),
        .DI({1'b0,\sendLastSentPacketHeader[packetChecksum][7]_i_25_n_0 ,\sendLastSentPacketHeader[packetChecksum][7]_i_26_n_0 ,\sendLastSentPacketHeader[packetChecksum][7]_i_27_n_0 ,\sendLastSentPacketHeader[packetChecksum][7]_i_28_n_0 ,\sendLastSentPacketHeader[packetChecksum][7]_i_29_n_0 ,\sendLastSentPacketHeader[packetChecksum][7]_i_30_n_0 ,1'b0}),
        .O({\sendLastSentPacketHeader_reg[packetChecksum][7]_i_17_n_8 ,\sendLastSentPacketHeader_reg[packetChecksum][7]_i_17_n_9 ,\sendLastSentPacketHeader_reg[packetChecksum][7]_i_17_n_10 ,\sendLastSentPacketHeader_reg[packetChecksum][7]_i_17_n_11 ,\sendLastSentPacketHeader_reg[packetChecksum][7]_i_17_n_12 ,\sendLastSentPacketHeader_reg[packetChecksum][7]_i_17_n_13 ,\sendLastSentPacketHeader_reg[packetChecksum][7]_i_17_n_14 ,\sendLastSentPacketHeader_reg[packetChecksum][7]_i_17_n_15 }),
        .S({\sendLastSentPacketHeader[packetChecksum][7]_i_31_n_0 ,\sendLastSentPacketHeader[packetChecksum][7]_i_32_n_0 ,\sendLastSentPacketHeader[packetChecksum][7]_i_33_n_0 ,\sendLastSentPacketHeader[packetChecksum][7]_i_34_n_0 ,\sendLastSentPacketHeader[packetChecksum][7]_i_35_n_0 ,\sendLastSentPacketHeader[packetChecksum][7]_i_36_n_0 ,\sendLastSentPacketHeader[packetChecksum][7]_i_37_n_0 ,\sendLastSentPacketHeader[packetChecksum][7]_i_38_n_0 }));
  FDRE \sendLastSentPacketHeader_reg[packetFlags][0] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[packetType] ),
        .D(sendHasUnackedSentPacket_reg_0),
        .Q(\sendLastSentPacketHeader_reg[packetFlags] ),
        .R(1'b0));
  FDRE \sendLastSentPacketHeader_reg[subpacketCount][0] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[packetType] ),
        .D(p_41_in),
        .Q(\sendLastSentPacketHeader_reg[subpacketCount_n_0_][0] ),
        .R(1'b0));
  FDRE \sendLastSentPacketHeader_reg[thisPacketID][0] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[packetType] ),
        .D(\sendLastSendPacketID_reg_n_0_[0] ),
        .Q(RotateByteRight[7]),
        .R(1'b0));
  FDRE \sendLastSentPacketHeader_reg[thisPacketID][10] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[packetType] ),
        .D(\sendLastSendPacketID_reg_n_0_[10] ),
        .Q(RotateByteLeft[4]),
        .R(1'b0));
  FDRE \sendLastSentPacketHeader_reg[thisPacketID][11] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[packetType] ),
        .D(\sendLastSendPacketID_reg_n_0_[11] ),
        .Q(RotateByteLeft[5]),
        .R(1'b0));
  FDRE \sendLastSentPacketHeader_reg[thisPacketID][12] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[packetType] ),
        .D(\sendLastSendPacketID_reg_n_0_[12] ),
        .Q(RotateByteLeft[6]),
        .R(1'b0));
  FDRE \sendLastSentPacketHeader_reg[thisPacketID][13] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[packetType] ),
        .D(\sendLastSendPacketID_reg_n_0_[13] ),
        .Q(RotateByteLeft[7]),
        .R(1'b0));
  FDRE \sendLastSentPacketHeader_reg[thisPacketID][14] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[packetType] ),
        .D(\sendLastSendPacketID_reg_n_0_[14] ),
        .Q(RotateByteLeft[0]),
        .R(1'b0));
  FDRE \sendLastSentPacketHeader_reg[thisPacketID][15] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[packetType] ),
        .D(\sendLastSendPacketID_reg_n_0_[15] ),
        .Q(RotateByteLeft[1]),
        .R(1'b0));
  FDRE \sendLastSentPacketHeader_reg[thisPacketID][1] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[packetType] ),
        .D(\sendLastSendPacketID_reg_n_0_[1] ),
        .Q(RotateByteRight[0]),
        .R(1'b0));
  FDRE \sendLastSentPacketHeader_reg[thisPacketID][2] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[packetType] ),
        .D(\sendLastSendPacketID_reg_n_0_[2] ),
        .Q(RotateByteRight[1]),
        .R(1'b0));
  FDRE \sendLastSentPacketHeader_reg[thisPacketID][3] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[packetType] ),
        .D(\sendLastSendPacketID_reg_n_0_[3] ),
        .Q(RotateByteRight[2]),
        .R(1'b0));
  FDRE \sendLastSentPacketHeader_reg[thisPacketID][4] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[packetType] ),
        .D(\sendLastSendPacketID_reg_n_0_[4] ),
        .Q(RotateByteRight[3]),
        .R(1'b0));
  FDRE \sendLastSentPacketHeader_reg[thisPacketID][5] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[packetType] ),
        .D(\sendLastSendPacketID_reg_n_0_[5] ),
        .Q(RotateByteRight[4]),
        .R(1'b0));
  FDRE \sendLastSentPacketHeader_reg[thisPacketID][6] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[packetType] ),
        .D(\sendLastSendPacketID_reg_n_0_[6] ),
        .Q(RotateByteRight[5]),
        .R(1'b0));
  FDRE \sendLastSentPacketHeader_reg[thisPacketID][7] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[packetType] ),
        .D(\sendLastSendPacketID_reg_n_0_[7] ),
        .Q(RotateByteRight[6]),
        .R(1'b0));
  FDRE \sendLastSentPacketHeader_reg[thisPacketID][8] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[packetType] ),
        .D(\sendLastSendPacketID_reg_n_0_[8] ),
        .Q(RotateByteLeft[2]),
        .R(1'b0));
  FDRE \sendLastSentPacketHeader_reg[thisPacketID][9] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[packetType] ),
        .D(\sendLastSendPacketID_reg_n_0_[9] ),
        .Q(RotateByteLeft[3]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'hAFBA0040)) 
    \sendNumBroadcastsSinceReset[0]_i_1 
       (.I0(currentState__0[2]),
        .I1(\send_pkt_data_wr_data[31]_i_5_n_0 ),
        .I2(sendHasRepliedSuccessfulConnection),
        .I3(currentState__0[0]),
        .I4(\sendNumBroadcastsSinceReset_reg_n_0_[0] ),
        .O(\sendNumBroadcastsSinceReset[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair127" *) 
  LUT3 #(
    .INIT(8'h28)) 
    \sendNumBroadcastsSinceReset[10]_i_1 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(\sendNumBroadcastsSinceReset[10]_i_2_n_0 ),
        .I2(\sendNumBroadcastsSinceReset_reg_n_0_[10] ),
        .O(\sendNumBroadcastsSinceReset[10]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \sendNumBroadcastsSinceReset[10]_i_2 
       (.I0(\sendNumBroadcastsSinceReset_reg_n_0_[8] ),
        .I1(\sendNumBroadcastsSinceReset_reg_n_0_[6] ),
        .I2(\sendNumBroadcastsSinceReset[9]_i_2_n_0 ),
        .I3(\sendNumBroadcastsSinceReset_reg_n_0_[7] ),
        .I4(\sendNumBroadcastsSinceReset_reg_n_0_[9] ),
        .O(\sendNumBroadcastsSinceReset[10]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT3 #(
    .INIT(8'h28)) 
    \sendNumBroadcastsSinceReset[11]_i_1 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(\sendNumBroadcastsSinceReset[14]_i_2_n_0 ),
        .I2(\sendNumBroadcastsSinceReset_reg_n_0_[11] ),
        .O(\sendNumBroadcastsSinceReset[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h2A80)) 
    \sendNumBroadcastsSinceReset[12]_i_1 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(\sendNumBroadcastsSinceReset[14]_i_2_n_0 ),
        .I2(\sendNumBroadcastsSinceReset_reg_n_0_[11] ),
        .I3(\sendNumBroadcastsSinceReset_reg_n_0_[12] ),
        .O(\sendNumBroadcastsSinceReset[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'h2AAA8000)) 
    \sendNumBroadcastsSinceReset[13]_i_1 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(\sendNumBroadcastsSinceReset_reg_n_0_[11] ),
        .I2(\sendNumBroadcastsSinceReset[14]_i_2_n_0 ),
        .I3(\sendNumBroadcastsSinceReset_reg_n_0_[12] ),
        .I4(\sendNumBroadcastsSinceReset_reg_n_0_[13] ),
        .O(\sendNumBroadcastsSinceReset[13]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2AAAAAAA80000000)) 
    \sendNumBroadcastsSinceReset[14]_i_1 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(\sendNumBroadcastsSinceReset_reg_n_0_[12] ),
        .I2(\sendNumBroadcastsSinceReset[14]_i_2_n_0 ),
        .I3(\sendNumBroadcastsSinceReset_reg_n_0_[11] ),
        .I4(\sendNumBroadcastsSinceReset_reg_n_0_[13] ),
        .I5(\sendNumBroadcastsSinceReset_reg_n_0_[14] ),
        .O(\sendNumBroadcastsSinceReset[14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \sendNumBroadcastsSinceReset[14]_i_2 
       (.I0(\sendNumBroadcastsSinceReset_reg_n_0_[9] ),
        .I1(\sendNumBroadcastsSinceReset_reg_n_0_[7] ),
        .I2(\sendNumBroadcastsSinceReset[9]_i_2_n_0 ),
        .I3(\sendNumBroadcastsSinceReset_reg_n_0_[6] ),
        .I4(\sendNumBroadcastsSinceReset_reg_n_0_[8] ),
        .I5(\sendNumBroadcastsSinceReset_reg_n_0_[10] ),
        .O(\sendNumBroadcastsSinceReset[14]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h40)) 
    \sendNumBroadcastsSinceReset[15]_i_1 
       (.I0(currentState__0[2]),
        .I1(sendHasRepliedSuccessfulConnection),
        .I2(currentState__0[0]),
        .O(\sendNumBroadcastsSinceReset[15]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h5045)) 
    \sendNumBroadcastsSinceReset[15]_i_2 
       (.I0(currentState__0[2]),
        .I1(\send_pkt_data_wr_data[31]_i_5_n_0 ),
        .I2(sendHasRepliedSuccessfulConnection),
        .I3(currentState__0[0]),
        .O(\sendNumBroadcastsSinceReset[15]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT4 #(
    .INIT(16'h2A80)) 
    \sendNumBroadcastsSinceReset[15]_i_3 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(\sendNumBroadcastsSinceReset_reg_n_0_[14] ),
        .I2(\sendNumBroadcastsSinceReset[15]_i_4_n_0 ),
        .I3(\sendNumBroadcastsSinceReset_reg_n_0_[15] ),
        .O(\sendNumBroadcastsSinceReset[15]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \sendNumBroadcastsSinceReset[15]_i_4 
       (.I0(\sendNumBroadcastsSinceReset_reg_n_0_[12] ),
        .I1(\sendNumBroadcastsSinceReset[14]_i_2_n_0 ),
        .I2(\sendNumBroadcastsSinceReset_reg_n_0_[11] ),
        .I3(\sendNumBroadcastsSinceReset_reg_n_0_[13] ),
        .O(\sendNumBroadcastsSinceReset[15]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair127" *) 
  LUT3 #(
    .INIT(8'h28)) 
    \sendNumBroadcastsSinceReset[1]_i_1 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(\sendNumBroadcastsSinceReset_reg_n_0_[1] ),
        .I2(\sendNumBroadcastsSinceReset_reg_n_0_[0] ),
        .O(\sendNumBroadcastsSinceReset[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h2A80)) 
    \sendNumBroadcastsSinceReset[2]_i_1 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(\sendNumBroadcastsSinceReset_reg_n_0_[0] ),
        .I2(\sendNumBroadcastsSinceReset_reg_n_0_[1] ),
        .I3(\sendNumBroadcastsSinceReset_reg_n_0_[2] ),
        .O(\sendNumBroadcastsSinceReset[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'h2AAA8000)) 
    \sendNumBroadcastsSinceReset[3]_i_1 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(\sendNumBroadcastsSinceReset_reg_n_0_[1] ),
        .I2(\sendNumBroadcastsSinceReset_reg_n_0_[0] ),
        .I3(\sendNumBroadcastsSinceReset_reg_n_0_[2] ),
        .I4(\sendNumBroadcastsSinceReset_reg_n_0_[3] ),
        .O(\sendNumBroadcastsSinceReset[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2AAAAAAA80000000)) 
    \sendNumBroadcastsSinceReset[4]_i_1 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(\sendNumBroadcastsSinceReset_reg_n_0_[2] ),
        .I2(\sendNumBroadcastsSinceReset_reg_n_0_[0] ),
        .I3(\sendNumBroadcastsSinceReset_reg_n_0_[1] ),
        .I4(\sendNumBroadcastsSinceReset_reg_n_0_[3] ),
        .I5(\sendNumBroadcastsSinceReset_reg_n_0_[4] ),
        .O(\sendNumBroadcastsSinceReset[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair126" *) 
  LUT3 #(
    .INIT(8'h28)) 
    \sendNumBroadcastsSinceReset[5]_i_1 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(\sendNumBroadcastsSinceReset[5]_i_2_n_0 ),
        .I2(\sendNumBroadcastsSinceReset_reg_n_0_[5] ),
        .O(\sendNumBroadcastsSinceReset[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \sendNumBroadcastsSinceReset[5]_i_2 
       (.I0(\sendNumBroadcastsSinceReset_reg_n_0_[3] ),
        .I1(\sendNumBroadcastsSinceReset_reg_n_0_[1] ),
        .I2(\sendNumBroadcastsSinceReset_reg_n_0_[0] ),
        .I3(\sendNumBroadcastsSinceReset_reg_n_0_[2] ),
        .I4(\sendNumBroadcastsSinceReset_reg_n_0_[4] ),
        .O(\sendNumBroadcastsSinceReset[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair126" *) 
  LUT3 #(
    .INIT(8'h28)) 
    \sendNumBroadcastsSinceReset[6]_i_1 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(\sendNumBroadcastsSinceReset[9]_i_2_n_0 ),
        .I2(\sendNumBroadcastsSinceReset_reg_n_0_[6] ),
        .O(\sendNumBroadcastsSinceReset[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h2A80)) 
    \sendNumBroadcastsSinceReset[7]_i_1 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(\sendNumBroadcastsSinceReset[9]_i_2_n_0 ),
        .I2(\sendNumBroadcastsSinceReset_reg_n_0_[6] ),
        .I3(\sendNumBroadcastsSinceReset_reg_n_0_[7] ),
        .O(\sendNumBroadcastsSinceReset[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'h2AAA8000)) 
    \sendNumBroadcastsSinceReset[8]_i_1 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(\sendNumBroadcastsSinceReset_reg_n_0_[6] ),
        .I2(\sendNumBroadcastsSinceReset[9]_i_2_n_0 ),
        .I3(\sendNumBroadcastsSinceReset_reg_n_0_[7] ),
        .I4(\sendNumBroadcastsSinceReset_reg_n_0_[8] ),
        .O(\sendNumBroadcastsSinceReset[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2AAAAAAA80000000)) 
    \sendNumBroadcastsSinceReset[9]_i_1 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(\sendNumBroadcastsSinceReset_reg_n_0_[7] ),
        .I2(\sendNumBroadcastsSinceReset[9]_i_2_n_0 ),
        .I3(\sendNumBroadcastsSinceReset_reg_n_0_[6] ),
        .I4(\sendNumBroadcastsSinceReset_reg_n_0_[8] ),
        .I5(\sendNumBroadcastsSinceReset_reg_n_0_[9] ),
        .O(\sendNumBroadcastsSinceReset[9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \sendNumBroadcastsSinceReset[9]_i_2 
       (.I0(\sendNumBroadcastsSinceReset_reg_n_0_[4] ),
        .I1(\sendNumBroadcastsSinceReset_reg_n_0_[2] ),
        .I2(\sendNumBroadcastsSinceReset_reg_n_0_[0] ),
        .I3(\sendNumBroadcastsSinceReset_reg_n_0_[1] ),
        .I4(\sendNumBroadcastsSinceReset_reg_n_0_[3] ),
        .I5(\sendNumBroadcastsSinceReset_reg_n_0_[5] ),
        .O(\sendNumBroadcastsSinceReset[9]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendNumBroadcastsSinceReset_reg[0] 
       (.C(clk333_250),
        .CE(1'b1),
        .D(\sendNumBroadcastsSinceReset[0]_i_1_n_0 ),
        .Q(\sendNumBroadcastsSinceReset_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendNumBroadcastsSinceReset_reg[10] 
       (.C(clk333_250),
        .CE(\sendNumBroadcastsSinceReset[15]_i_2_n_0 ),
        .D(\sendNumBroadcastsSinceReset[10]_i_1_n_0 ),
        .Q(\sendNumBroadcastsSinceReset_reg_n_0_[10] ),
        .R(\sendNumBroadcastsSinceReset[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendNumBroadcastsSinceReset_reg[11] 
       (.C(clk333_250),
        .CE(\sendNumBroadcastsSinceReset[15]_i_2_n_0 ),
        .D(\sendNumBroadcastsSinceReset[11]_i_1_n_0 ),
        .Q(\sendNumBroadcastsSinceReset_reg_n_0_[11] ),
        .R(\sendNumBroadcastsSinceReset[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendNumBroadcastsSinceReset_reg[12] 
       (.C(clk333_250),
        .CE(\sendNumBroadcastsSinceReset[15]_i_2_n_0 ),
        .D(\sendNumBroadcastsSinceReset[12]_i_1_n_0 ),
        .Q(\sendNumBroadcastsSinceReset_reg_n_0_[12] ),
        .R(\sendNumBroadcastsSinceReset[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendNumBroadcastsSinceReset_reg[13] 
       (.C(clk333_250),
        .CE(\sendNumBroadcastsSinceReset[15]_i_2_n_0 ),
        .D(\sendNumBroadcastsSinceReset[13]_i_1_n_0 ),
        .Q(\sendNumBroadcastsSinceReset_reg_n_0_[13] ),
        .R(\sendNumBroadcastsSinceReset[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendNumBroadcastsSinceReset_reg[14] 
       (.C(clk333_250),
        .CE(\sendNumBroadcastsSinceReset[15]_i_2_n_0 ),
        .D(\sendNumBroadcastsSinceReset[14]_i_1_n_0 ),
        .Q(\sendNumBroadcastsSinceReset_reg_n_0_[14] ),
        .R(\sendNumBroadcastsSinceReset[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendNumBroadcastsSinceReset_reg[15] 
       (.C(clk333_250),
        .CE(\sendNumBroadcastsSinceReset[15]_i_2_n_0 ),
        .D(\sendNumBroadcastsSinceReset[15]_i_3_n_0 ),
        .Q(\sendNumBroadcastsSinceReset_reg_n_0_[15] ),
        .R(\sendNumBroadcastsSinceReset[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendNumBroadcastsSinceReset_reg[1] 
       (.C(clk333_250),
        .CE(\sendNumBroadcastsSinceReset[15]_i_2_n_0 ),
        .D(\sendNumBroadcastsSinceReset[1]_i_1_n_0 ),
        .Q(\sendNumBroadcastsSinceReset_reg_n_0_[1] ),
        .R(\sendNumBroadcastsSinceReset[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendNumBroadcastsSinceReset_reg[2] 
       (.C(clk333_250),
        .CE(\sendNumBroadcastsSinceReset[15]_i_2_n_0 ),
        .D(\sendNumBroadcastsSinceReset[2]_i_1_n_0 ),
        .Q(\sendNumBroadcastsSinceReset_reg_n_0_[2] ),
        .R(\sendNumBroadcastsSinceReset[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendNumBroadcastsSinceReset_reg[3] 
       (.C(clk333_250),
        .CE(\sendNumBroadcastsSinceReset[15]_i_2_n_0 ),
        .D(\sendNumBroadcastsSinceReset[3]_i_1_n_0 ),
        .Q(\sendNumBroadcastsSinceReset_reg_n_0_[3] ),
        .R(\sendNumBroadcastsSinceReset[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendNumBroadcastsSinceReset_reg[4] 
       (.C(clk333_250),
        .CE(\sendNumBroadcastsSinceReset[15]_i_2_n_0 ),
        .D(\sendNumBroadcastsSinceReset[4]_i_1_n_0 ),
        .Q(\sendNumBroadcastsSinceReset_reg_n_0_[4] ),
        .R(\sendNumBroadcastsSinceReset[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendNumBroadcastsSinceReset_reg[5] 
       (.C(clk333_250),
        .CE(\sendNumBroadcastsSinceReset[15]_i_2_n_0 ),
        .D(\sendNumBroadcastsSinceReset[5]_i_1_n_0 ),
        .Q(\sendNumBroadcastsSinceReset_reg_n_0_[5] ),
        .R(\sendNumBroadcastsSinceReset[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendNumBroadcastsSinceReset_reg[6] 
       (.C(clk333_250),
        .CE(\sendNumBroadcastsSinceReset[15]_i_2_n_0 ),
        .D(\sendNumBroadcastsSinceReset[6]_i_1_n_0 ),
        .Q(\sendNumBroadcastsSinceReset_reg_n_0_[6] ),
        .R(\sendNumBroadcastsSinceReset[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendNumBroadcastsSinceReset_reg[7] 
       (.C(clk333_250),
        .CE(\sendNumBroadcastsSinceReset[15]_i_2_n_0 ),
        .D(\sendNumBroadcastsSinceReset[7]_i_1_n_0 ),
        .Q(\sendNumBroadcastsSinceReset_reg_n_0_[7] ),
        .R(\sendNumBroadcastsSinceReset[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendNumBroadcastsSinceReset_reg[8] 
       (.C(clk333_250),
        .CE(\sendNumBroadcastsSinceReset[15]_i_2_n_0 ),
        .D(\sendNumBroadcastsSinceReset[8]_i_1_n_0 ),
        .Q(\sendNumBroadcastsSinceReset_reg_n_0_[8] ),
        .R(\sendNumBroadcastsSinceReset[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendNumBroadcastsSinceReset_reg[9] 
       (.C(clk333_250),
        .CE(\sendNumBroadcastsSinceReset[15]_i_2_n_0 ),
        .D(\sendNumBroadcastsSinceReset[9]_i_1_n_0 ),
        .Q(\sendNumBroadcastsSinceReset_reg_n_0_[9] ),
        .R(\sendNumBroadcastsSinceReset[15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair131" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \sendPacketHeaderBuffer[10]_i_1 
       (.I0(\recvReplyStatus_reg_n_0_[2] ),
        .I1(sendReplyAck_reg_0),
        .I2(recvSendReplyPacket_reg_0),
        .O(\sendPacketHeaderBuffer[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0200020000000200)) 
    \sendPacketHeaderBuffer[119]_i_1 
       (.I0(\sendClocksBetweenBroadcastsWait[31]_i_4_n_0 ),
        .I1(currentState__0[0]),
        .I2(sendHandlingReply_reg_0),
        .I3(sendHasRepliedSuccessfulConnection),
        .I4(recvSendReplyPacket_reg_0),
        .I5(sendReplyAck_reg_0),
        .O(\sendPacketHeaderBuffer[119]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair116" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \sendPacketHeaderBuffer[16]_i_1 
       (.I0(\recvReplyStatus_reg_n_0_[0] ),
        .I1(sendReplyAck_reg_0),
        .I2(recvSendReplyPacket_reg_0),
        .O(\sendPacketHeaderBuffer[16]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h000000000000F400)) 
    \sendPacketHeaderBuffer[28]_i_1 
       (.I0(sendReplyAck_reg_0),
        .I1(recvSendReplyPacket_reg_0),
        .I2(\sendClocksBetweenBroadcastsWait[31]_i_4_n_0 ),
        .I3(sendHasRepliedSuccessfulConnection),
        .I4(sendHandlingReply_reg_0),
        .I5(currentState__0[0]),
        .O(\sendPacketHeaderBuffer[28]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \sendPacketHeaderBuffer[28]_i_2 
       (.I0(recvSendReplyPacket_reg_0),
        .I1(sendReplyAck_reg_0),
        .O(send_pkt_header_wr_en1));
  LUT5 #(
    .INIT(32'hFFCFAAAA)) 
    \sendPacketHeaderBuffer[8]_i_1 
       (.I0(\sendPacketHeaderBuffer_reg_n_0_[8] ),
        .I1(\recvReplyStatus_reg_n_0_[0] ),
        .I2(recvSendReplyPacket_reg_0),
        .I3(sendReplyAck_reg_0),
        .I4(\sendPacketHeaderBuffer[28]_i_1_n_0 ),
        .O(\sendPacketHeaderBuffer[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair131" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \sendPacketHeaderBuffer[9]_i_1 
       (.I0(\recvReplyStatus_reg_n_0_[1] ),
        .I1(sendReplyAck_reg_0),
        .I2(recvSendReplyPacket_reg_0),
        .O(\sendPacketHeaderBuffer[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendPacketHeaderBuffer_reg[104] 
       (.C(clk333_250),
        .CE(\sendPacketHeaderBuffer[119]_i_1_n_0 ),
        .D(\sendNumBroadcastsSinceReset_reg_n_0_[0] ),
        .Q(data3[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendPacketHeaderBuffer_reg[105] 
       (.C(clk333_250),
        .CE(\sendPacketHeaderBuffer[119]_i_1_n_0 ),
        .D(\sendNumBroadcastsSinceReset_reg_n_0_[1] ),
        .Q(data3[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendPacketHeaderBuffer_reg[106] 
       (.C(clk333_250),
        .CE(\sendPacketHeaderBuffer[119]_i_1_n_0 ),
        .D(\sendNumBroadcastsSinceReset_reg_n_0_[2] ),
        .Q(data3[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendPacketHeaderBuffer_reg[107] 
       (.C(clk333_250),
        .CE(\sendPacketHeaderBuffer[119]_i_1_n_0 ),
        .D(\sendNumBroadcastsSinceReset_reg_n_0_[3] ),
        .Q(data3[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendPacketHeaderBuffer_reg[108] 
       (.C(clk333_250),
        .CE(\sendPacketHeaderBuffer[119]_i_1_n_0 ),
        .D(\sendNumBroadcastsSinceReset_reg_n_0_[4] ),
        .Q(data3[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendPacketHeaderBuffer_reg[109] 
       (.C(clk333_250),
        .CE(\sendPacketHeaderBuffer[119]_i_1_n_0 ),
        .D(\sendNumBroadcastsSinceReset_reg_n_0_[5] ),
        .Q(data3[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendPacketHeaderBuffer_reg[10] 
       (.C(clk333_250),
        .CE(\sendPacketHeaderBuffer[28]_i_1_n_0 ),
        .D(\sendPacketHeaderBuffer[10]_i_1_n_0 ),
        .Q(\sendPacketHeaderBuffer_reg_n_0_[10] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendPacketHeaderBuffer_reg[110] 
       (.C(clk333_250),
        .CE(\sendPacketHeaderBuffer[119]_i_1_n_0 ),
        .D(\sendNumBroadcastsSinceReset_reg_n_0_[6] ),
        .Q(data3[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendPacketHeaderBuffer_reg[111] 
       (.C(clk333_250),
        .CE(\sendPacketHeaderBuffer[119]_i_1_n_0 ),
        .D(\sendNumBroadcastsSinceReset_reg_n_0_[7] ),
        .Q(data3[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendPacketHeaderBuffer_reg[112] 
       (.C(clk333_250),
        .CE(\sendPacketHeaderBuffer[119]_i_1_n_0 ),
        .D(\sendNumBroadcastsSinceReset_reg_n_0_[8] ),
        .Q(data3[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendPacketHeaderBuffer_reg[113] 
       (.C(clk333_250),
        .CE(\sendPacketHeaderBuffer[119]_i_1_n_0 ),
        .D(\sendNumBroadcastsSinceReset_reg_n_0_[9] ),
        .Q(data3[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendPacketHeaderBuffer_reg[114] 
       (.C(clk333_250),
        .CE(\sendPacketHeaderBuffer[119]_i_1_n_0 ),
        .D(\sendNumBroadcastsSinceReset_reg_n_0_[10] ),
        .Q(data3[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendPacketHeaderBuffer_reg[115] 
       (.C(clk333_250),
        .CE(\sendPacketHeaderBuffer[119]_i_1_n_0 ),
        .D(\sendNumBroadcastsSinceReset_reg_n_0_[11] ),
        .Q(data3[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendPacketHeaderBuffer_reg[116] 
       (.C(clk333_250),
        .CE(\sendPacketHeaderBuffer[119]_i_1_n_0 ),
        .D(\sendNumBroadcastsSinceReset_reg_n_0_[12] ),
        .Q(data3[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendPacketHeaderBuffer_reg[117] 
       (.C(clk333_250),
        .CE(\sendPacketHeaderBuffer[119]_i_1_n_0 ),
        .D(\sendNumBroadcastsSinceReset_reg_n_0_[13] ),
        .Q(data3[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendPacketHeaderBuffer_reg[118] 
       (.C(clk333_250),
        .CE(\sendPacketHeaderBuffer[119]_i_1_n_0 ),
        .D(\sendNumBroadcastsSinceReset_reg_n_0_[14] ),
        .Q(data3[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendPacketHeaderBuffer_reg[119] 
       (.C(clk333_250),
        .CE(\sendPacketHeaderBuffer[119]_i_1_n_0 ),
        .D(\sendNumBroadcastsSinceReset_reg_n_0_[15] ),
        .Q(data3[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendPacketHeaderBuffer_reg[16] 
       (.C(clk333_250),
        .CE(\sendPacketHeaderBuffer[28]_i_1_n_0 ),
        .D(\sendPacketHeaderBuffer[16]_i_1_n_0 ),
        .Q(\sendPacketHeaderBuffer_reg_n_0_[16] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendPacketHeaderBuffer_reg[28] 
       (.C(clk333_250),
        .CE(\sendPacketHeaderBuffer[28]_i_1_n_0 ),
        .D(send_pkt_header_wr_en1),
        .Q(\sendPacketHeaderBuffer_reg_n_0_[28] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendPacketHeaderBuffer_reg[4] 
       (.C(clk333_250),
        .CE(\sendPacketHeaderBuffer[28]_i_1_n_0 ),
        .D(1'b1),
        .Q(\sendPacketHeaderBuffer_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendPacketHeaderBuffer_reg[71] 
       (.C(clk333_250),
        .CE(\sendPacketHeaderBuffer[119]_i_1_n_0 ),
        .D(1'b1),
        .Q(data2),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendPacketHeaderBuffer_reg[8] 
       (.C(clk333_250),
        .CE(1'b1),
        .D(\sendPacketHeaderBuffer[8]_i_1_n_0 ),
        .Q(\sendPacketHeaderBuffer_reg_n_0_[8] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendPacketHeaderBuffer_reg[9] 
       (.C(clk333_250),
        .CE(\sendPacketHeaderBuffer[28]_i_1_n_0 ),
        .D(\sendPacketHeaderBuffer[9]_i_1_n_0 ),
        .Q(\sendPacketHeaderBuffer_reg_n_0_[9] ),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFFFFFFAAEAFAFA)) 
    \sendPacketState[0]_i_1 
       (.I0(\sendPacketState[0]_i_2_n_0 ),
        .I1(recvSessionDisconnectSignal_reg_n_0),
        .I2(DBG_SendPacketState[2]),
        .I3(DBG_SendPacketState[1]),
        .I4(DBG_SendPacketState[0]),
        .I5(DBG_SendPacketState[3]),
        .O(\sendPacketState[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h1055005510550000)) 
    \sendPacketState[0]_i_2 
       (.I0(DBG_SendPacketState[2]),
        .I1(\sendLastSentPacketHeader_reg[subpacketCount_n_0_][0] ),
        .I2(recvSessionDisconnectSignal_reg_n_0),
        .I3(DBG_SendPacketState[0]),
        .I4(DBG_SendPacketState[1]),
        .I5(sendHasUnackedSentPacket_reg_0),
        .O(\sendPacketState[0]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00551101)) 
    \sendPacketState[1]_i_1 
       (.I0(DBG_SendPacketState[3]),
        .I1(DBG_SendPacketState[2]),
        .I2(sendHasUnackedSentPacket_reg_0),
        .I3(DBG_SendPacketState[0]),
        .I4(DBG_SendPacketState[1]),
        .O(\sendPacketState[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0055400000554005)) 
    \sendPacketState[2]_i_1 
       (.I0(DBG_SendPacketState[3]),
        .I1(\sendLastSentPacketHeader_reg[subpacketCount_n_0_][0] ),
        .I2(DBG_SendPacketState[1]),
        .I3(DBG_SendPacketState[0]),
        .I4(DBG_SendPacketState[2]),
        .I5(sendHasUnackedSentPacket_reg_0),
        .O(\sendPacketState[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8888808888888888)) 
    \sendPacketState[3]_i_1 
       (.I0(\sendPacketState[3]_i_3_n_0 ),
        .I1(currentState__1),
        .I2(sendPacketState__0),
        .I3(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .I4(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I5(\FSM_sequential_sendPacketState_reg_n_0_[3] ),
        .O(sendPacketState));
  LUT6 #(
    .INIT(64'h5400000054004000)) 
    \sendPacketState[3]_i_2 
       (.I0(DBG_SendPacketState[3]),
        .I1(DBG_SendPacketState[1]),
        .I2(recvSessionDisconnectSignal_reg_n_0),
        .I3(DBG_SendPacketState[0]),
        .I4(DBG_SendPacketState[2]),
        .I5(\sendLastSentPacketHeader_reg[subpacketCount_n_0_][0] ),
        .O(\sendPacketState[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \sendPacketState[3]_i_3 
       (.I0(\sendLastSentPacketHeader[lastAckedPacketID][15]_i_2_n_0 ),
        .I1(\sendLastAckedPacketID[15]_i_4_n_0 ),
        .I2(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I3(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .I4(\FSM_sequential_sendPacketState_reg_n_0_[3] ),
        .I5(sendPacketState__0),
        .O(\sendPacketState[3]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sendPacketState_reg[0] 
       (.C(clk333_250),
        .CE(sendPacketState),
        .D(\sendPacketState[0]_i_1_n_0 ),
        .Q(DBG_SendPacketState[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendPacketState_reg[1] 
       (.C(clk333_250),
        .CE(sendPacketState),
        .D(\sendPacketState[1]_i_1_n_0 ),
        .Q(DBG_SendPacketState[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendPacketState_reg[2] 
       (.C(clk333_250),
        .CE(sendPacketState),
        .D(\sendPacketState[2]_i_1_n_0 ),
        .Q(DBG_SendPacketState[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sendPacketState_reg[3] 
       (.C(clk333_250),
        .CE(sendPacketState),
        .D(\sendPacketState[3]_i_2_n_0 ),
        .Q(DBG_SendPacketState[3]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT5 #(
    .INIT(32'hFFF20002)) 
    sendReplyAck_i_1
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(sendReplyAck_i_2_n_0),
        .I2(currentState__0[0]),
        .I3(currentState__0[2]),
        .I4(sendReplyAck_reg_0),
        .O(sendReplyAck_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair130" *) 
  LUT3 #(
    .INIT(8'h07)) 
    sendReplyAck_i_2
       (.I0(DBG_SendFIFOState[2]),
        .I1(sendHandlingReply_reg_0),
        .I2(\send_pkt_data_wr_data[31]_i_5_n_0 ),
        .O(sendReplyAck_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    sendReplyAck_reg
       (.C(clk333_250),
        .CE(1'b1),
        .D(sendReplyAck_i_1_n_0),
        .Q(sendReplyAck_reg_0),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF8A80)) 
    \send_pkt_data_wr_data[0]_i_1 
       (.I0(currentState__0[0]),
        .I1(\send_pkt_data_wr_data[0]_i_2_n_0 ),
        .I2(\send_pkt_data_wr_data[31]_i_8_n_0 ),
        .I3(sendBRAM_doutb[0]),
        .I4(\send_pkt_data_wr_data[4]_i_2_n_0 ),
        .I5(\send_pkt_data_wr_data[30]_i_2_n_0 ),
        .O(send_pkt_data_wr_data0_in[0]));
  LUT6 #(
    .INIT(64'hBBAAFFAF88AA00A0)) 
    \send_pkt_data_wr_data[0]_i_2 
       (.I0(RotateByteRight0_in[6]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I2(\FSM_sequential_sendPacketState_reg_n_0_[3] ),
        .I3(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .I4(sendPacketState__0),
        .I5(\sendLastSentPacketHeader_reg[subpacketCount_n_0_][0] ),
        .O(\send_pkt_data_wr_data[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFEEEAAAEA)) 
    \send_pkt_data_wr_data[10]_i_1 
       (.I0(\send_pkt_data_wr_data[10]_i_2_n_0 ),
        .I1(\send_pkt_data_wr_data[10]_i_3_n_0 ),
        .I2(\sendPacketHeaderBuffer_reg_n_0_[10] ),
        .I3(\send_pkt_data_wr_data[10]_i_4_n_0 ),
        .I4(data3[10]),
        .I5(\send_pkt_data_wr_data[10]_i_5_n_0 ),
        .O(send_pkt_data_wr_data0_in[10]));
  LUT6 #(
    .INIT(64'hB800B800FF000000)) 
    \send_pkt_data_wr_data[10]_i_2 
       (.I0(RotateByteLeft[4]),
        .I1(\send_pkt_data_wr_data[31]_i_7_n_0 ),
        .I2(\sendLastSentPacketHeader_reg[packetFlags] ),
        .I3(currentState__0[0]),
        .I4(sendBRAM_doutb[10]),
        .I5(\send_pkt_data_wr_data[31]_i_8_n_0 ),
        .O(\send_pkt_data_wr_data[10]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT4 #(
    .INIT(16'h1011)) 
    \send_pkt_data_wr_data[10]_i_3 
       (.I0(currentState__0[0]),
        .I1(sendHandlingReply_reg_0),
        .I2(DBG_SendFIFOState[2]),
        .I3(DBG_SendFIFOState[1]),
        .O(\send_pkt_data_wr_data[10]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair118" *) 
  LUT3 #(
    .INIT(8'hEA)) 
    \send_pkt_data_wr_data[10]_i_4 
       (.I0(DBG_SendFIFOState[2]),
        .I1(DBG_SendFIFOState[0]),
        .I2(DBG_SendFIFOState[1]),
        .O(\send_pkt_data_wr_data[10]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair128" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \send_pkt_data_wr_data[10]_i_5 
       (.I0(currentState__0[0]),
        .I1(\sendPacketHeaderBuffer_reg_n_0_[10] ),
        .I2(sendHandlingReply_reg_0),
        .O(\send_pkt_data_wr_data[10]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFAAAEAAAA)) 
    \send_pkt_data_wr_data[11]_i_1 
       (.I0(\send_pkt_data_wr_data[11]_i_2_n_0 ),
        .I1(data3[11]),
        .I2(sendHandlingReply_reg_0),
        .I3(currentState__0[0]),
        .I4(DBG_SendFIFOState[2]),
        .I5(\send_pkt_data_wr_data[30]_i_2_n_0 ),
        .O(send_pkt_data_wr_data0_in[11]));
  LUT6 #(
    .INIT(64'hB800B800FF000000)) 
    \send_pkt_data_wr_data[11]_i_2 
       (.I0(RotateByteLeft[5]),
        .I1(\send_pkt_data_wr_data[31]_i_7_n_0 ),
        .I2(\sendLastSentPacketHeader_reg[packetFlags] ),
        .I3(currentState__0[0]),
        .I4(sendBRAM_doutb[11]),
        .I5(\send_pkt_data_wr_data[31]_i_8_n_0 ),
        .O(\send_pkt_data_wr_data[11]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF0200)) 
    \send_pkt_data_wr_data[12]_i_1 
       (.I0(DBG_SendFIFOState[2]),
        .I1(currentState__0[0]),
        .I2(sendHandlingReply_reg_0),
        .I3(data3[12]),
        .I4(\send_pkt_data_wr_data[12]_i_2_n_0 ),
        .O(send_pkt_data_wr_data0_in[12]));
  LUT6 #(
    .INIT(64'hB800B800FF000000)) 
    \send_pkt_data_wr_data[12]_i_2 
       (.I0(RotateByteLeft[6]),
        .I1(\send_pkt_data_wr_data[31]_i_7_n_0 ),
        .I2(\sendLastSentPacketHeader_reg[packetFlags] ),
        .I3(currentState__0[0]),
        .I4(sendBRAM_doutb[12]),
        .I5(\send_pkt_data_wr_data[31]_i_8_n_0 ),
        .O(\send_pkt_data_wr_data[12]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFAAAEAAAA)) 
    \send_pkt_data_wr_data[13]_i_1 
       (.I0(\send_pkt_data_wr_data[13]_i_2_n_0 ),
        .I1(data3[13]),
        .I2(sendHandlingReply_reg_0),
        .I3(currentState__0[0]),
        .I4(DBG_SendFIFOState[2]),
        .I5(\send_pkt_data_wr_data[30]_i_2_n_0 ),
        .O(send_pkt_data_wr_data0_in[13]));
  LUT6 #(
    .INIT(64'hB800B800FF000000)) 
    \send_pkt_data_wr_data[13]_i_2 
       (.I0(RotateByteLeft[7]),
        .I1(\send_pkt_data_wr_data[31]_i_7_n_0 ),
        .I2(\sendLastSentPacketHeader_reg[packetFlags] ),
        .I3(currentState__0[0]),
        .I4(sendBRAM_doutb[13]),
        .I5(\send_pkt_data_wr_data[31]_i_8_n_0 ),
        .O(\send_pkt_data_wr_data[13]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF0200)) 
    \send_pkt_data_wr_data[14]_i_1 
       (.I0(DBG_SendFIFOState[2]),
        .I1(currentState__0[0]),
        .I2(sendHandlingReply_reg_0),
        .I3(data3[14]),
        .I4(\send_pkt_data_wr_data[14]_i_2_n_0 ),
        .O(send_pkt_data_wr_data0_in[14]));
  LUT6 #(
    .INIT(64'hB800B800FF000000)) 
    \send_pkt_data_wr_data[14]_i_2 
       (.I0(RotateByteLeft[0]),
        .I1(\send_pkt_data_wr_data[31]_i_7_n_0 ),
        .I2(\sendLastSentPacketHeader_reg[packetFlags] ),
        .I3(currentState__0[0]),
        .I4(sendBRAM_doutb[14]),
        .I5(\send_pkt_data_wr_data[31]_i_8_n_0 ),
        .O(\send_pkt_data_wr_data[14]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFAAAEAAAA)) 
    \send_pkt_data_wr_data[15]_i_1 
       (.I0(\send_pkt_data_wr_data[15]_i_2_n_0 ),
        .I1(data3[15]),
        .I2(sendHandlingReply_reg_0),
        .I3(currentState__0[0]),
        .I4(DBG_SendFIFOState[2]),
        .I5(\send_pkt_data_wr_data[30]_i_2_n_0 ),
        .O(send_pkt_data_wr_data0_in[15]));
  LUT6 #(
    .INIT(64'hE400E400FF000000)) 
    \send_pkt_data_wr_data[15]_i_2 
       (.I0(\send_pkt_data_wr_data[31]_i_7_n_0 ),
        .I1(\sendLastSentPacketHeader_reg[packetFlags] ),
        .I2(RotateByteLeft[1]),
        .I3(currentState__0[0]),
        .I4(sendBRAM_doutb[15]),
        .I5(\send_pkt_data_wr_data[31]_i_8_n_0 ),
        .O(\send_pkt_data_wr_data[15]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \send_pkt_data_wr_data[16]_i_1 
       (.I0(\send_pkt_data_wr_data[16]_i_2_n_0 ),
        .I1(currentState__0[0]),
        .I2(\sendPacketHeaderBuffer_reg_n_0_[16] ),
        .I3(sendHandlingReply_reg_0),
        .I4(\send_pkt_data_wr_data[16]_i_3_n_0 ),
        .O(send_pkt_data_wr_data0_in[16]));
  LUT6 #(
    .INIT(64'hFFFFB8FF0000B800)) 
    \send_pkt_data_wr_data[16]_i_2 
       (.I0(RotateByteRight[7]),
        .I1(\send_pkt_data_wr_data[31]_i_7_n_0 ),
        .I2(\sendLastSentPacketHeader_reg[packetChecksum] [0]),
        .I3(sendPacketState__0),
        .I4(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I5(sendBRAM_doutb[16]),
        .O(\send_pkt_data_wr_data[16]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hF303FB0BF000F808)) 
    \send_pkt_data_wr_data[16]_i_3 
       (.I0(data2),
        .I1(DBG_SendFIFOState[1]),
        .I2(DBG_SendFIFOState[2]),
        .I3(data3[16]),
        .I4(DBG_SendFIFOState[0]),
        .I5(\sendPacketHeaderBuffer_reg_n_0_[8] ),
        .O(\send_pkt_data_wr_data[16]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hD888D8CC)) 
    \send_pkt_data_wr_data[17]_i_2 
       (.I0(sendHandlingReply_reg_0),
        .I1(\sendPacketHeaderBuffer_reg_n_0_[9] ),
        .I2(data3[17]),
        .I3(DBG_SendFIFOState[2]),
        .I4(DBG_SendFIFOState[1]),
        .O(\send_pkt_data_wr_data[17]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFB8FF0000B800)) 
    \send_pkt_data_wr_data[17]_i_3 
       (.I0(RotateByteRight[0]),
        .I1(\send_pkt_data_wr_data[31]_i_7_n_0 ),
        .I2(\sendLastSentPacketHeader_reg[packetChecksum] [1]),
        .I3(sendPacketState__0),
        .I4(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I5(sendBRAM_doutb[17]),
        .O(\send_pkt_data_wr_data[17]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFDDDDFCCC)) 
    \send_pkt_data_wr_data[18]_i_1 
       (.I0(\send_pkt_data_wr_data[18]_i_2_n_0 ),
        .I1(\send_pkt_data_wr_data[21]_i_3_n_0 ),
        .I2(sendHandlingReply_reg_0),
        .I3(\sendPacketHeaderBuffer_reg_n_0_[10] ),
        .I4(currentState__0[0]),
        .I5(\send_pkt_data_wr_data[18]_i_3_n_0 ),
        .O(send_pkt_data_wr_data0_in[18]));
  LUT6 #(
    .INIT(64'h00004700FFFF47FF)) 
    \send_pkt_data_wr_data[18]_i_2 
       (.I0(RotateByteRight[1]),
        .I1(\send_pkt_data_wr_data[31]_i_7_n_0 ),
        .I2(\sendLastSentPacketHeader_reg[packetChecksum] [2]),
        .I3(sendPacketState__0),
        .I4(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I5(sendBRAM_doutb[18]),
        .O(\send_pkt_data_wr_data[18]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT5 #(
    .INIT(32'hCC0A0000)) 
    \send_pkt_data_wr_data[18]_i_3 
       (.I0(\sendPacketHeaderBuffer_reg_n_0_[10] ),
        .I1(data3[18]),
        .I2(DBG_SendFIFOState[1]),
        .I3(DBG_SendFIFOState[2]),
        .I4(\sendCurrentPacket[hostMACAddress][47]_i_3_n_0 ),
        .O(\send_pkt_data_wr_data[18]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT5 #(
    .INIT(32'hFF200020)) 
    \send_pkt_data_wr_data[19]_i_1 
       (.I0(DBG_SendFIFOState[2]),
        .I1(sendHandlingReply_reg_0),
        .I2(data3[19]),
        .I3(currentState__0[0]),
        .I4(\send_pkt_data_wr_data[19]_i_2_n_0 ),
        .O(send_pkt_data_wr_data0_in[19]));
  LUT6 #(
    .INIT(64'hFFFFB8FF0000B800)) 
    \send_pkt_data_wr_data[19]_i_2 
       (.I0(RotateByteRight[2]),
        .I1(\send_pkt_data_wr_data[31]_i_7_n_0 ),
        .I2(\sendLastSentPacketHeader_reg[packetChecksum] [3]),
        .I3(sendPacketState__0),
        .I4(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I5(sendBRAM_doutb[19]),
        .O(\send_pkt_data_wr_data[19]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hEFEAAAAAAAAAAAAA)) 
    \send_pkt_data_wr_data[1]_i_1 
       (.I0(\send_pkt_data_wr_data[1]_i_2_n_0 ),
        .I1(RotateByteRight0_in[7]),
        .I2(\send_pkt_data_wr_data[31]_i_8_n_0 ),
        .I3(sendBRAM_doutb[1]),
        .I4(\send_pkt_data_wr_data[31]_i_7_n_0 ),
        .I5(currentState__0[0]),
        .O(send_pkt_data_wr_data0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT5 #(
    .INIT(32'h20202030)) 
    \send_pkt_data_wr_data[1]_i_2 
       (.I0(sendHandlingReply_reg_0),
        .I1(currentState__0[0]),
        .I2(\sendPacketHeaderBuffer_reg_n_0_[28] ),
        .I3(DBG_SendFIFOState[2]),
        .I4(DBG_SendFIFOState[1]),
        .O(\send_pkt_data_wr_data[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFAA0CAA00)) 
    \send_pkt_data_wr_data[20]_i_1 
       (.I0(\send_pkt_data_wr_data[20]_i_2_n_0 ),
        .I1(data3[20]),
        .I2(sendHandlingReply_reg_0),
        .I3(currentState__0[0]),
        .I4(DBG_SendFIFOState[2]),
        .I5(\send_pkt_data_wr_data[21]_i_3_n_0 ),
        .O(send_pkt_data_wr_data0_in[20]));
  LUT6 #(
    .INIT(64'hFFFFB8FF0000B800)) 
    \send_pkt_data_wr_data[20]_i_2 
       (.I0(RotateByteRight[3]),
        .I1(\send_pkt_data_wr_data[31]_i_7_n_0 ),
        .I2(\sendLastSentPacketHeader_reg[packetChecksum] [4]),
        .I3(sendPacketState__0),
        .I4(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I5(sendBRAM_doutb[20]),
        .O(\send_pkt_data_wr_data[20]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFAA0CAA00)) 
    \send_pkt_data_wr_data[21]_i_1 
       (.I0(\send_pkt_data_wr_data[21]_i_2_n_0 ),
        .I1(data3[21]),
        .I2(sendHandlingReply_reg_0),
        .I3(currentState__0[0]),
        .I4(DBG_SendFIFOState[2]),
        .I5(\send_pkt_data_wr_data[21]_i_3_n_0 ),
        .O(send_pkt_data_wr_data0_in[21]));
  LUT6 #(
    .INIT(64'hFFFFB8FF0000B800)) 
    \send_pkt_data_wr_data[21]_i_2 
       (.I0(RotateByteRight[4]),
        .I1(\send_pkt_data_wr_data[31]_i_7_n_0 ),
        .I2(\sendLastSentPacketHeader_reg[packetChecksum] [5]),
        .I3(sendPacketState__0),
        .I4(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I5(sendBRAM_doutb[21]),
        .O(\send_pkt_data_wr_data[21]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000020)) 
    \send_pkt_data_wr_data[21]_i_3 
       (.I0(data2),
        .I1(DBG_SendFIFOState[2]),
        .I2(DBG_SendFIFOState[1]),
        .I3(DBG_SendFIFOState[0]),
        .I4(currentState__0[0]),
        .I5(sendHandlingReply_reg_0),
        .O(\send_pkt_data_wr_data[21]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFAA0CAA00)) 
    \send_pkt_data_wr_data[22]_i_1 
       (.I0(\send_pkt_data_wr_data[22]_i_2_n_0 ),
        .I1(data3[22]),
        .I2(sendHandlingReply_reg_0),
        .I3(currentState__0[0]),
        .I4(DBG_SendFIFOState[2]),
        .I5(\send_pkt_data_wr_data[30]_i_2_n_0 ),
        .O(send_pkt_data_wr_data0_in[22]));
  LUT6 #(
    .INIT(64'hFFFFB8FF0000B800)) 
    \send_pkt_data_wr_data[22]_i_2 
       (.I0(RotateByteRight[5]),
        .I1(\send_pkt_data_wr_data[31]_i_7_n_0 ),
        .I2(\sendLastSentPacketHeader_reg[packetChecksum] [6]),
        .I3(sendPacketState__0),
        .I4(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I5(sendBRAM_doutb[22]),
        .O(\send_pkt_data_wr_data[22]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFAA0CAA00)) 
    \send_pkt_data_wr_data[23]_i_1 
       (.I0(\send_pkt_data_wr_data[23]_i_2_n_0 ),
        .I1(data3[23]),
        .I2(sendHandlingReply_reg_0),
        .I3(currentState__0[0]),
        .I4(DBG_SendFIFOState[2]),
        .I5(\send_pkt_data_wr_data[30]_i_2_n_0 ),
        .O(send_pkt_data_wr_data0_in[23]));
  LUT6 #(
    .INIT(64'hFFFFB8FF0000B800)) 
    \send_pkt_data_wr_data[23]_i_2 
       (.I0(RotateByteRight[6]),
        .I1(\send_pkt_data_wr_data[31]_i_7_n_0 ),
        .I2(\sendLastSentPacketHeader_reg[packetChecksum] [7]),
        .I3(sendPacketState__0),
        .I4(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I5(sendBRAM_doutb[23]),
        .O(\send_pkt_data_wr_data[23]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hBBB8B8B8B8B8B8B8)) 
    \send_pkt_data_wr_data[24]_i_2 
       (.I0(\sendPacketHeaderBuffer_reg_n_0_[28] ),
        .I1(sendHandlingReply_reg_0),
        .I2(\send_pkt_data_wr_data[27]_i_4_n_0 ),
        .I3(DBG_SendFIFOState[0]),
        .I4(data2),
        .I5(\send_pkt_data_wr_data[24]_i_4_n_0 ),
        .O(\send_pkt_data_wr_data[24]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFF8F0080)) 
    \send_pkt_data_wr_data[24]_i_3 
       (.I0(RotateByteLeft1_in[3]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .I2(sendPacketState__0),
        .I3(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I4(sendBRAM_doutb[24]),
        .O(\send_pkt_data_wr_data[24]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \send_pkt_data_wr_data[24]_i_4 
       (.I0(DBG_SendFIFOState[1]),
        .I1(DBG_SendFIFOState[2]),
        .O(\send_pkt_data_wr_data[24]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF08AA0800)) 
    \send_pkt_data_wr_data[25]_i_1 
       (.I0(currentState__0[0]),
        .I1(RotateByteLeft1_in[4]),
        .I2(\send_pkt_data_wr_data[31]_i_7_n_0 ),
        .I3(\send_pkt_data_wr_data[31]_i_8_n_0 ),
        .I4(sendBRAM_doutb[25]),
        .I5(\send_pkt_data_wr_data[25]_i_2_n_0 ),
        .O(send_pkt_data_wr_data0_in[25]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF0200)) 
    \send_pkt_data_wr_data[25]_i_2 
       (.I0(data2),
        .I1(sendHandlingReply_reg_0),
        .I2(currentState__0[0]),
        .I3(DBG_SendFIFOState[2]),
        .I4(\send_pkt_data_wr_data[21]_i_3_n_0 ),
        .I5(\send_pkt_data_wr_data[1]_i_2_n_0 ),
        .O(\send_pkt_data_wr_data[25]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAEAEEEEAAEAAAAA)) 
    \send_pkt_data_wr_data[26]_i_1 
       (.I0(\send_pkt_data_wr_data[28]_i_3_n_0 ),
        .I1(currentState__0[0]),
        .I2(RotateByteLeft1_in[5]),
        .I3(\send_pkt_data_wr_data[31]_i_7_n_0 ),
        .I4(\send_pkt_data_wr_data[31]_i_8_n_0 ),
        .I5(sendBRAM_doutb[26]),
        .O(send_pkt_data_wr_data0_in[26]));
  LUT6 #(
    .INIT(64'hB8BBB8BBB8BBB888)) 
    \send_pkt_data_wr_data[27]_i_1 
       (.I0(\send_pkt_data_wr_data[27]_i_2_n_0 ),
        .I1(currentState__0[0]),
        .I2(\sendPacketHeaderBuffer_reg_n_0_[28] ),
        .I3(sendHandlingReply_reg_0),
        .I4(\send_pkt_data_wr_data[27]_i_3_n_0 ),
        .I5(\send_pkt_data_wr_data[27]_i_4_n_0 ),
        .O(send_pkt_data_wr_data0_in[27]));
  LUT5 #(
    .INIT(32'hFF8F0080)) 
    \send_pkt_data_wr_data[27]_i_2 
       (.I0(RotateByteLeft1_in[6]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .I2(sendPacketState__0),
        .I3(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I4(sendBRAM_doutb[27]),
        .O(\send_pkt_data_wr_data[27]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h0400)) 
    \send_pkt_data_wr_data[27]_i_3 
       (.I0(DBG_SendFIFOState[0]),
        .I1(DBG_SendFIFOState[1]),
        .I2(DBG_SendFIFOState[2]),
        .I3(data2),
        .O(\send_pkt_data_wr_data[27]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair115" *) 
  LUT4 #(
    .INIT(16'hF044)) 
    \send_pkt_data_wr_data[27]_i_4 
       (.I0(DBG_SendFIFOState[1]),
        .I1(\sendPacketHeaderBuffer_reg_n_0_[4] ),
        .I2(data2),
        .I3(DBG_SendFIFOState[2]),
        .O(\send_pkt_data_wr_data[27]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair96" *) 
  LUT4 #(
    .INIT(16'hFFF8)) 
    \send_pkt_data_wr_data[28]_i_1 
       (.I0(currentState__0[0]),
        .I1(\send_pkt_data_wr_data[28]_i_2_n_0 ),
        .I2(\send_pkt_data_wr_data[28]_i_3_n_0 ),
        .I3(\send_pkt_data_wr_data[30]_i_2_n_0 ),
        .O(send_pkt_data_wr_data0_in[28]));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT5 #(
    .INIT(32'hFF8F0080)) 
    \send_pkt_data_wr_data[28]_i_2 
       (.I0(RotateByteLeft1_in[7]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .I2(sendPacketState__0),
        .I3(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I4(sendBRAM_doutb[28]),
        .O(\send_pkt_data_wr_data[28]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00FF000200000002)) 
    \send_pkt_data_wr_data[28]_i_3 
       (.I0(\sendPacketHeaderBuffer_reg_n_0_[4] ),
        .I1(DBG_SendFIFOState[2]),
        .I2(DBG_SendFIFOState[1]),
        .I3(currentState__0[0]),
        .I4(sendHandlingReply_reg_0),
        .I5(\sendPacketHeaderBuffer_reg_n_0_[28] ),
        .O(\send_pkt_data_wr_data[28]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hEFE0FFFFEFE00000)) 
    \send_pkt_data_wr_data[29]_i_1 
       (.I0(RotateByteLeft1_in[0]),
        .I1(\send_pkt_data_wr_data[31]_i_7_n_0 ),
        .I2(\send_pkt_data_wr_data[31]_i_8_n_0 ),
        .I3(sendBRAM_doutb[29]),
        .I4(currentState__0[0]),
        .I5(\send_pkt_data_wr_data[31]_i_9_n_0 ),
        .O(send_pkt_data_wr_data0_in[29]));
  LUT6 #(
    .INIT(64'hEFEAAAAAAAAAAAAA)) 
    \send_pkt_data_wr_data[2]_i_1 
       (.I0(\send_pkt_data_wr_data[4]_i_2_n_0 ),
        .I1(RotateByteRight0_in[0]),
        .I2(\send_pkt_data_wr_data[31]_i_8_n_0 ),
        .I3(sendBRAM_doutb[2]),
        .I4(\send_pkt_data_wr_data[31]_i_7_n_0 ),
        .I5(currentState__0[0]),
        .O(send_pkt_data_wr_data0_in[2]));
  LUT6 #(
    .INIT(64'hAAEAEEEEAAEAAAAA)) 
    \send_pkt_data_wr_data[30]_i_1 
       (.I0(\send_pkt_data_wr_data[30]_i_2_n_0 ),
        .I1(currentState__0[0]),
        .I2(RotateByteLeft1_in[1]),
        .I3(\send_pkt_data_wr_data[31]_i_7_n_0 ),
        .I4(\send_pkt_data_wr_data[31]_i_8_n_0 ),
        .I5(sendBRAM_doutb[30]),
        .O(send_pkt_data_wr_data0_in[30]));
  LUT6 #(
    .INIT(64'h0000100000000000)) 
    \send_pkt_data_wr_data[30]_i_2 
       (.I0(currentState__0[0]),
        .I1(sendHandlingReply_reg_0),
        .I2(DBG_SendFIFOState[0]),
        .I3(data2),
        .I4(DBG_SendFIFOState[2]),
        .I5(DBG_SendFIFOState[1]),
        .O(\send_pkt_data_wr_data[30]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFAEAAAAAAAA)) 
    \send_pkt_data_wr_data[31]_i_1 
       (.I0(\sendBRAM_addrb[2]_i_1_n_0 ),
        .I1(DBG_SendFIFOState[0]),
        .I2(\send_pkt_data_wr_data[31]_i_3_n_0 ),
        .I3(\send_pkt_data_wr_data[31]_i_4_n_0 ),
        .I4(\send_pkt_data_wr_data[31]_i_5_n_0 ),
        .I5(\send_pkt_data_wr_data[31]_i_6_n_0 ),
        .O(\send_pkt_data_wr_data[31]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \send_pkt_data_wr_data[31]_i_10 
       (.I0(\sendClocksBetweenBroadcastsWait_reg_n_0_[28] ),
        .I1(\sendClocksBetweenBroadcastsWait_reg_n_0_[29] ),
        .I2(\sendClocksBetweenBroadcastsWait_reg_n_0_[31] ),
        .I3(\sendClocksBetweenBroadcastsWait_reg_n_0_[30] ),
        .O(\send_pkt_data_wr_data[31]_i_10_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFEEEF)) 
    \send_pkt_data_wr_data[31]_i_11 
       (.I0(\sendCurrentPacket[hostMACAddress][47]_i_10_n_0 ),
        .I1(\sendClocksBetweenBroadcastsWait_reg_n_0_[9] ),
        .I2(DBG_SendFIFOState[0]),
        .I3(DBG_SendFIFOState[1]),
        .I4(\sendClocksBetweenBroadcastsWait[31]_i_24_n_0 ),
        .O(\send_pkt_data_wr_data[31]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'h2F20FFFF2F200000)) 
    \send_pkt_data_wr_data[31]_i_2 
       (.I0(RotateByteLeft1_in[2]),
        .I1(\send_pkt_data_wr_data[31]_i_7_n_0 ),
        .I2(\send_pkt_data_wr_data[31]_i_8_n_0 ),
        .I3(sendBRAM_doutb[31]),
        .I4(currentState__0[0]),
        .I5(\send_pkt_data_wr_data[31]_i_9_n_0 ),
        .O(send_pkt_data_wr_data0_in[31]));
  LUT2 #(
    .INIT(4'hB)) 
    \send_pkt_data_wr_data[31]_i_3 
       (.I0(DBG_SendFIFOState[1]),
        .I1(sendHandlingReply_reg_0),
        .O(\send_pkt_data_wr_data[31]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    \send_pkt_data_wr_data[31]_i_4 
       (.I0(\sendCurrentPacket[hostMACAddress][47]_i_4_n_0 ),
        .I1(sendHandlingReply_reg_0),
        .I2(\send_pkt_data_wr_data[31]_i_10_n_0 ),
        .I3(send_pkt_header_wr_en1),
        .I4(\sendClocksBetweenBroadcastsWait[31]_i_7_n_0 ),
        .I5(\send_pkt_data_wr_data[31]_i_11_n_0 ),
        .O(\send_pkt_data_wr_data[31]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair116" *) 
  LUT3 #(
    .INIT(8'h0B)) 
    \send_pkt_data_wr_data[31]_i_5 
       (.I0(sendReplyAck_reg_0),
        .I1(recvSendReplyPacket_reg_0),
        .I2(sendHandlingReply_i_2_n_0),
        .O(\send_pkt_data_wr_data[31]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \send_pkt_data_wr_data[31]_i_6 
       (.I0(sendHasRepliedSuccessfulConnection),
        .I1(currentState__0[0]),
        .O(\send_pkt_data_wr_data[31]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'hAF0C)) 
    \send_pkt_data_wr_data[31]_i_7 
       (.I0(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[3] ),
        .I2(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .I3(sendPacketState__0),
        .O(\send_pkt_data_wr_data[31]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \send_pkt_data_wr_data[31]_i_8 
       (.I0(sendPacketState__0),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .O(\send_pkt_data_wr_data[31]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h54440000)) 
    \send_pkt_data_wr_data[31]_i_9 
       (.I0(sendHandlingReply_reg_0),
        .I1(DBG_SendFIFOState[2]),
        .I2(DBG_SendFIFOState[0]),
        .I3(DBG_SendFIFOState[1]),
        .I4(data2),
        .O(\send_pkt_data_wr_data[31]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hFEFFFEEEEEEEEEEE)) 
    \send_pkt_data_wr_data[3]_i_1 
       (.I0(\send_pkt_data_wr_data[4]_i_2_n_0 ),
        .I1(\send_pkt_data_wr_data[21]_i_3_n_0 ),
        .I2(RotateByteRight0_in[1]),
        .I3(\send_pkt_data_wr_data[31]_i_8_n_0 ),
        .I4(sendBRAM_doutb[3]),
        .I5(\send_pkt_data_wr_data[4]_i_3_n_0 ),
        .O(send_pkt_data_wr_data0_in[3]));
  LUT6 #(
    .INIT(64'hFEFFFEEEEEEEEEEE)) 
    \send_pkt_data_wr_data[4]_i_1 
       (.I0(\send_pkt_data_wr_data[4]_i_2_n_0 ),
        .I1(\send_pkt_data_wr_data[21]_i_3_n_0 ),
        .I2(RotateByteRight0_in[2]),
        .I3(\send_pkt_data_wr_data[31]_i_8_n_0 ),
        .I4(sendBRAM_doutb[4]),
        .I5(\send_pkt_data_wr_data[4]_i_3_n_0 ),
        .O(send_pkt_data_wr_data0_in[4]));
  LUT6 #(
    .INIT(64'h00000000FF100010)) 
    \send_pkt_data_wr_data[4]_i_2 
       (.I0(DBG_SendFIFOState[1]),
        .I1(DBG_SendFIFOState[2]),
        .I2(\sendPacketHeaderBuffer_reg_n_0_[28] ),
        .I3(sendHandlingReply_reg_0),
        .I4(\sendPacketHeaderBuffer_reg_n_0_[4] ),
        .I5(currentState__0[0]),
        .O(\send_pkt_data_wr_data[4]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hBA320000)) 
    \send_pkt_data_wr_data[4]_i_3 
       (.I0(sendPacketState__0),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .I2(\FSM_sequential_sendPacketState_reg_n_0_[3] ),
        .I3(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I4(currentState__0[0]),
        .O(\send_pkt_data_wr_data[4]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hEFEAAAAAAAAAAAAA)) 
    \send_pkt_data_wr_data[5]_i_1 
       (.I0(\send_pkt_data_wr_data[21]_i_3_n_0 ),
        .I1(RotateByteRight0_in[3]),
        .I2(\send_pkt_data_wr_data[31]_i_8_n_0 ),
        .I3(sendBRAM_doutb[5]),
        .I4(\send_pkt_data_wr_data[31]_i_7_n_0 ),
        .I5(currentState__0[0]),
        .O(send_pkt_data_wr_data0_in[5]));
  LUT6 #(
    .INIT(64'hEFEAAAAAAAAAAAAA)) 
    \send_pkt_data_wr_data[6]_i_1 
       (.I0(\send_pkt_data_wr_data[21]_i_3_n_0 ),
        .I1(RotateByteRight0_in[4]),
        .I2(\send_pkt_data_wr_data[31]_i_8_n_0 ),
        .I3(sendBRAM_doutb[6]),
        .I4(\send_pkt_data_wr_data[31]_i_7_n_0 ),
        .I5(currentState__0[0]),
        .O(send_pkt_data_wr_data0_in[6]));
  LUT6 #(
    .INIT(64'hBA8A000000000000)) 
    \send_pkt_data_wr_data[7]_i_1 
       (.I0(sendBRAM_doutb[7]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I2(sendPacketState__0),
        .I3(RotateByteRight0_in[5]),
        .I4(currentState__0[0]),
        .I5(\send_pkt_data_wr_data[31]_i_7_n_0 ),
        .O(send_pkt_data_wr_data0_in[7]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \send_pkt_data_wr_data[8]_i_1 
       (.I0(\send_pkt_data_wr_data[8]_i_2_n_0 ),
        .I1(currentState__0[0]),
        .I2(\sendPacketHeaderBuffer_reg_n_0_[8] ),
        .I3(sendHandlingReply_reg_0),
        .I4(\send_pkt_data_wr_data[8]_i_3_n_0 ),
        .O(send_pkt_data_wr_data0_in[8]));
  LUT6 #(
    .INIT(64'hFFFFB8FF0000B800)) 
    \send_pkt_data_wr_data[8]_i_2 
       (.I0(RotateByteLeft[2]),
        .I1(\send_pkt_data_wr_data[31]_i_7_n_0 ),
        .I2(\sendLastSentPacketHeader_reg[packetFlags] ),
        .I3(sendPacketState__0),
        .I4(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I5(sendBRAM_doutb[8]),
        .O(\send_pkt_data_wr_data[8]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hF303FB0BF000F808)) 
    \send_pkt_data_wr_data[8]_i_3 
       (.I0(data2),
        .I1(DBG_SendFIFOState[1]),
        .I2(DBG_SendFIFOState[2]),
        .I3(data3[8]),
        .I4(DBG_SendFIFOState[0]),
        .I5(\sendPacketHeaderBuffer_reg_n_0_[16] ),
        .O(\send_pkt_data_wr_data[8]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hEFEEEFEF45444444)) 
    \send_pkt_data_wr_data[9]_i_2 
       (.I0(sendHandlingReply_reg_0),
        .I1(\send_pkt_data_wr_data[27]_i_3_n_0 ),
        .I2(\send_pkt_data_wr_data[24]_i_4_n_0 ),
        .I3(data3[9]),
        .I4(\send_pkt_data_wr_data[10]_i_4_n_0 ),
        .I5(\sendPacketHeaderBuffer_reg_n_0_[9] ),
        .O(\send_pkt_data_wr_data[9]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFB8FF0000B800)) 
    \send_pkt_data_wr_data[9]_i_3 
       (.I0(RotateByteLeft[3]),
        .I1(\send_pkt_data_wr_data[31]_i_7_n_0 ),
        .I2(\sendLastSentPacketHeader_reg[packetFlags] ),
        .I3(sendPacketState__0),
        .I4(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I5(sendBRAM_doutb[9]),
        .O(\send_pkt_data_wr_data[9]_i_3_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_data WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \send_pkt_data_wr_data_reg[0] 
       (.C(clk333_250),
        .CE(\send_pkt_data_wr_data[31]_i_1_n_0 ),
        .D(send_pkt_data_wr_data0_in[0]),
        .Q(send_pkt_data_wr_data[0]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_data WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \send_pkt_data_wr_data_reg[10] 
       (.C(clk333_250),
        .CE(\send_pkt_data_wr_data[31]_i_1_n_0 ),
        .D(send_pkt_data_wr_data0_in[10]),
        .Q(send_pkt_data_wr_data[10]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_data WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \send_pkt_data_wr_data_reg[11] 
       (.C(clk333_250),
        .CE(\send_pkt_data_wr_data[31]_i_1_n_0 ),
        .D(send_pkt_data_wr_data0_in[11]),
        .Q(send_pkt_data_wr_data[11]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_data WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \send_pkt_data_wr_data_reg[12] 
       (.C(clk333_250),
        .CE(\send_pkt_data_wr_data[31]_i_1_n_0 ),
        .D(send_pkt_data_wr_data0_in[12]),
        .Q(send_pkt_data_wr_data[12]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_data WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \send_pkt_data_wr_data_reg[13] 
       (.C(clk333_250),
        .CE(\send_pkt_data_wr_data[31]_i_1_n_0 ),
        .D(send_pkt_data_wr_data0_in[13]),
        .Q(send_pkt_data_wr_data[13]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_data WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \send_pkt_data_wr_data_reg[14] 
       (.C(clk333_250),
        .CE(\send_pkt_data_wr_data[31]_i_1_n_0 ),
        .D(send_pkt_data_wr_data0_in[14]),
        .Q(send_pkt_data_wr_data[14]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_data WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \send_pkt_data_wr_data_reg[15] 
       (.C(clk333_250),
        .CE(\send_pkt_data_wr_data[31]_i_1_n_0 ),
        .D(send_pkt_data_wr_data0_in[15]),
        .Q(send_pkt_data_wr_data[15]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_data WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \send_pkt_data_wr_data_reg[16] 
       (.C(clk333_250),
        .CE(\send_pkt_data_wr_data[31]_i_1_n_0 ),
        .D(send_pkt_data_wr_data0_in[16]),
        .Q(send_pkt_data_wr_data[16]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_data WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \send_pkt_data_wr_data_reg[17] 
       (.C(clk333_250),
        .CE(\send_pkt_data_wr_data[31]_i_1_n_0 ),
        .D(send_pkt_data_wr_data0_in[17]),
        .Q(send_pkt_data_wr_data[17]),
        .R(1'b0));
  MUXF7 \send_pkt_data_wr_data_reg[17]_i_1 
       (.I0(\send_pkt_data_wr_data[17]_i_2_n_0 ),
        .I1(\send_pkt_data_wr_data[17]_i_3_n_0 ),
        .O(send_pkt_data_wr_data0_in[17]),
        .S(currentState__0[0]));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_data WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \send_pkt_data_wr_data_reg[18] 
       (.C(clk333_250),
        .CE(\send_pkt_data_wr_data[31]_i_1_n_0 ),
        .D(send_pkt_data_wr_data0_in[18]),
        .Q(send_pkt_data_wr_data[18]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_data WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \send_pkt_data_wr_data_reg[19] 
       (.C(clk333_250),
        .CE(\send_pkt_data_wr_data[31]_i_1_n_0 ),
        .D(send_pkt_data_wr_data0_in[19]),
        .Q(send_pkt_data_wr_data[19]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_data WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \send_pkt_data_wr_data_reg[1] 
       (.C(clk333_250),
        .CE(\send_pkt_data_wr_data[31]_i_1_n_0 ),
        .D(send_pkt_data_wr_data0_in[1]),
        .Q(send_pkt_data_wr_data[1]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_data WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \send_pkt_data_wr_data_reg[20] 
       (.C(clk333_250),
        .CE(\send_pkt_data_wr_data[31]_i_1_n_0 ),
        .D(send_pkt_data_wr_data0_in[20]),
        .Q(send_pkt_data_wr_data[20]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_data WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \send_pkt_data_wr_data_reg[21] 
       (.C(clk333_250),
        .CE(\send_pkt_data_wr_data[31]_i_1_n_0 ),
        .D(send_pkt_data_wr_data0_in[21]),
        .Q(send_pkt_data_wr_data[21]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_data WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \send_pkt_data_wr_data_reg[22] 
       (.C(clk333_250),
        .CE(\send_pkt_data_wr_data[31]_i_1_n_0 ),
        .D(send_pkt_data_wr_data0_in[22]),
        .Q(send_pkt_data_wr_data[22]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_data WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \send_pkt_data_wr_data_reg[23] 
       (.C(clk333_250),
        .CE(\send_pkt_data_wr_data[31]_i_1_n_0 ),
        .D(send_pkt_data_wr_data0_in[23]),
        .Q(send_pkt_data_wr_data[23]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_data WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \send_pkt_data_wr_data_reg[24] 
       (.C(clk333_250),
        .CE(\send_pkt_data_wr_data[31]_i_1_n_0 ),
        .D(send_pkt_data_wr_data0_in[24]),
        .Q(send_pkt_data_wr_data[24]),
        .R(1'b0));
  MUXF7 \send_pkt_data_wr_data_reg[24]_i_1 
       (.I0(\send_pkt_data_wr_data[24]_i_2_n_0 ),
        .I1(\send_pkt_data_wr_data[24]_i_3_n_0 ),
        .O(send_pkt_data_wr_data0_in[24]),
        .S(currentState__0[0]));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_data WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \send_pkt_data_wr_data_reg[25] 
       (.C(clk333_250),
        .CE(\send_pkt_data_wr_data[31]_i_1_n_0 ),
        .D(send_pkt_data_wr_data0_in[25]),
        .Q(send_pkt_data_wr_data[25]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_data WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \send_pkt_data_wr_data_reg[26] 
       (.C(clk333_250),
        .CE(\send_pkt_data_wr_data[31]_i_1_n_0 ),
        .D(send_pkt_data_wr_data0_in[26]),
        .Q(send_pkt_data_wr_data[26]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_data WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \send_pkt_data_wr_data_reg[27] 
       (.C(clk333_250),
        .CE(\send_pkt_data_wr_data[31]_i_1_n_0 ),
        .D(send_pkt_data_wr_data0_in[27]),
        .Q(send_pkt_data_wr_data[27]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_data WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \send_pkt_data_wr_data_reg[28] 
       (.C(clk333_250),
        .CE(\send_pkt_data_wr_data[31]_i_1_n_0 ),
        .D(send_pkt_data_wr_data0_in[28]),
        .Q(send_pkt_data_wr_data[28]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_data WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \send_pkt_data_wr_data_reg[29] 
       (.C(clk333_250),
        .CE(\send_pkt_data_wr_data[31]_i_1_n_0 ),
        .D(send_pkt_data_wr_data0_in[29]),
        .Q(send_pkt_data_wr_data[29]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_data WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \send_pkt_data_wr_data_reg[2] 
       (.C(clk333_250),
        .CE(\send_pkt_data_wr_data[31]_i_1_n_0 ),
        .D(send_pkt_data_wr_data0_in[2]),
        .Q(send_pkt_data_wr_data[2]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_data WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \send_pkt_data_wr_data_reg[30] 
       (.C(clk333_250),
        .CE(\send_pkt_data_wr_data[31]_i_1_n_0 ),
        .D(send_pkt_data_wr_data0_in[30]),
        .Q(send_pkt_data_wr_data[30]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_data WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \send_pkt_data_wr_data_reg[31] 
       (.C(clk333_250),
        .CE(\send_pkt_data_wr_data[31]_i_1_n_0 ),
        .D(send_pkt_data_wr_data0_in[31]),
        .Q(send_pkt_data_wr_data[31]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_data WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \send_pkt_data_wr_data_reg[3] 
       (.C(clk333_250),
        .CE(\send_pkt_data_wr_data[31]_i_1_n_0 ),
        .D(send_pkt_data_wr_data0_in[3]),
        .Q(send_pkt_data_wr_data[3]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_data WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \send_pkt_data_wr_data_reg[4] 
       (.C(clk333_250),
        .CE(\send_pkt_data_wr_data[31]_i_1_n_0 ),
        .D(send_pkt_data_wr_data0_in[4]),
        .Q(send_pkt_data_wr_data[4]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_data WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \send_pkt_data_wr_data_reg[5] 
       (.C(clk333_250),
        .CE(\send_pkt_data_wr_data[31]_i_1_n_0 ),
        .D(send_pkt_data_wr_data0_in[5]),
        .Q(send_pkt_data_wr_data[5]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_data WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \send_pkt_data_wr_data_reg[6] 
       (.C(clk333_250),
        .CE(\send_pkt_data_wr_data[31]_i_1_n_0 ),
        .D(send_pkt_data_wr_data0_in[6]),
        .Q(send_pkt_data_wr_data[6]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_data WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \send_pkt_data_wr_data_reg[7] 
       (.C(clk333_250),
        .CE(\send_pkt_data_wr_data[31]_i_1_n_0 ),
        .D(send_pkt_data_wr_data0_in[7]),
        .Q(send_pkt_data_wr_data[7]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_data WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \send_pkt_data_wr_data_reg[8] 
       (.C(clk333_250),
        .CE(\send_pkt_data_wr_data[31]_i_1_n_0 ),
        .D(send_pkt_data_wr_data0_in[8]),
        .Q(send_pkt_data_wr_data[8]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_data WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \send_pkt_data_wr_data_reg[9] 
       (.C(clk333_250),
        .CE(\send_pkt_data_wr_data[31]_i_1_n_0 ),
        .D(send_pkt_data_wr_data0_in[9]),
        .Q(send_pkt_data_wr_data[9]),
        .R(1'b0));
  MUXF7 \send_pkt_data_wr_data_reg[9]_i_1 
       (.I0(\send_pkt_data_wr_data[9]_i_2_n_0 ),
        .I1(\send_pkt_data_wr_data[9]_i_3_n_0 ),
        .O(send_pkt_data_wr_data0_in[9]),
        .S(currentState__0[0]));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_data WR_EN" *) 
  FDRE #(
    .INIT(1'b0)) 
    send_pkt_data_wr_en_reg
       (.C(clk333_250),
        .CE(1'b1),
        .D(\send_pkt_data_wr_data[31]_i_1_n_0 ),
        .Q(send_pkt_data_wr_en),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \send_pkt_header_wr_data[0]_i_2 
       (.I0(\sendCurrentPacket_reg[hostIPv4Address] [0]),
        .I1(DBG_SendFIFOState[0]),
        .I2(\sendCurrentPacket_reg[hostMACAddress] [16]),
        .I3(DBG_SendFIFOState[1]),
        .I4(\sendCurrentPacket_reg[packetLength] [0]),
        .O(\send_pkt_header_wr_data[0]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \send_pkt_header_wr_data[0]_i_3 
       (.I0(\currentSessionState_reg[hostIPv4Address] [0]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I2(in9[0]),
        .I3(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .I4(\sendLastSentPacketHeader_reg[subpacketCount_n_0_][0] ),
        .O(\send_pkt_header_wr_data[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hB888FFFFB8880000)) 
    \send_pkt_header_wr_data[10]_i_1 
       (.I0(\currentSessionState_reg[hostIPv4Address] [10]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I2(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .I3(in9[10]),
        .I4(currentState__0[0]),
        .I5(\send_pkt_header_wr_data[10]_i_2_n_0 ),
        .O(send_pkt_header_wr_data0_in[10]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \send_pkt_header_wr_data[10]_i_2 
       (.I0(\sendCurrentPacket_reg[hostIPv4Address] [10]),
        .I1(DBG_SendFIFOState[0]),
        .I2(\sendCurrentPacket_reg[hostMACAddress] [26]),
        .I3(DBG_SendFIFOState[1]),
        .I4(\sendCurrentPacket_reg[packetLength] [10]),
        .O(\send_pkt_header_wr_data[10]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hB888FFFFB8880000)) 
    \send_pkt_header_wr_data[11]_i_1 
       (.I0(\currentSessionState_reg[hostIPv4Address] [11]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I2(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .I3(in9[11]),
        .I4(currentState__0[0]),
        .I5(\send_pkt_header_wr_data[11]_i_2_n_0 ),
        .O(send_pkt_header_wr_data0_in[11]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \send_pkt_header_wr_data[11]_i_2 
       (.I0(\sendCurrentPacket_reg[hostIPv4Address] [11]),
        .I1(DBG_SendFIFOState[0]),
        .I2(\sendCurrentPacket_reg[hostMACAddress] [27]),
        .I3(DBG_SendFIFOState[1]),
        .I4(\sendCurrentPacket_reg[packetLength] [11]),
        .O(\send_pkt_header_wr_data[11]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hB888FFFFB8880000)) 
    \send_pkt_header_wr_data[12]_i_1 
       (.I0(\currentSessionState_reg[hostIPv4Address] [12]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I2(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .I3(in9[12]),
        .I4(currentState__0[0]),
        .I5(\send_pkt_header_wr_data[12]_i_2_n_0 ),
        .O(send_pkt_header_wr_data0_in[12]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \send_pkt_header_wr_data[12]_i_2 
       (.I0(\sendCurrentPacket_reg[hostIPv4Address] [12]),
        .I1(DBG_SendFIFOState[0]),
        .I2(\sendCurrentPacket_reg[hostMACAddress] [28]),
        .I3(DBG_SendFIFOState[1]),
        .I4(\sendCurrentPacket_reg[packetLength] [12]),
        .O(\send_pkt_header_wr_data[12]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hB888FFFFB8880000)) 
    \send_pkt_header_wr_data[13]_i_1 
       (.I0(\currentSessionState_reg[hostIPv4Address] [13]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I2(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .I3(in9[13]),
        .I4(currentState__0[0]),
        .I5(\send_pkt_header_wr_data[13]_i_2_n_0 ),
        .O(send_pkt_header_wr_data0_in[13]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \send_pkt_header_wr_data[13]_i_2 
       (.I0(\sendCurrentPacket_reg[hostIPv4Address] [13]),
        .I1(DBG_SendFIFOState[0]),
        .I2(\sendCurrentPacket_reg[hostMACAddress] [29]),
        .I3(DBG_SendFIFOState[1]),
        .I4(\sendCurrentPacket_reg[packetLength] [13]),
        .O(\send_pkt_header_wr_data[13]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hB888FFFFB8880000)) 
    \send_pkt_header_wr_data[14]_i_1 
       (.I0(\currentSessionState_reg[hostIPv4Address] [14]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I2(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .I3(in9[14]),
        .I4(currentState__0[0]),
        .I5(\send_pkt_header_wr_data[14]_i_2_n_0 ),
        .O(send_pkt_header_wr_data0_in[14]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \send_pkt_header_wr_data[14]_i_2 
       (.I0(\sendCurrentPacket_reg[hostIPv4Address] [14]),
        .I1(DBG_SendFIFOState[0]),
        .I2(\sendCurrentPacket_reg[hostMACAddress] [30]),
        .I3(DBG_SendFIFOState[1]),
        .I4(\sendCurrentPacket_reg[packetLength] [14]),
        .O(\send_pkt_header_wr_data[14]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hB888FFFFB8880000)) 
    \send_pkt_header_wr_data[15]_i_1 
       (.I0(\currentSessionState_reg[hostIPv4Address] [15]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I2(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .I3(in9[15]),
        .I4(currentState__0[0]),
        .I5(\send_pkt_header_wr_data[15]_i_2_n_0 ),
        .O(send_pkt_header_wr_data0_in[15]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \send_pkt_header_wr_data[15]_i_2 
       (.I0(\sendCurrentPacket_reg[hostIPv4Address] [15]),
        .I1(DBG_SendFIFOState[0]),
        .I2(\sendCurrentPacket_reg[hostMACAddress] [31]),
        .I3(DBG_SendFIFOState[1]),
        .I4(\sendCurrentPacket_reg[packetLength] [15]),
        .O(\send_pkt_header_wr_data[15]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \send_pkt_header_wr_data[16]_i_2 
       (.I0(\sendCurrentPacket_reg[hostIPv4Address] [16]),
        .I1(DBG_SendFIFOState[0]),
        .I2(\sendCurrentPacket_reg[hostMACAddress] [32]),
        .I3(DBG_SendFIFOState[1]),
        .I4(\sendCurrentPacket_reg[hostMACAddress] [0]),
        .O(\send_pkt_header_wr_data[16]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \send_pkt_header_wr_data[16]_i_3 
       (.I0(\currentSessionState_reg[hostIPv4Address] [16]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I2(in9[16]),
        .I3(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .I4(data1[16]),
        .O(\send_pkt_header_wr_data[16]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \send_pkt_header_wr_data[17]_i_2 
       (.I0(\sendCurrentPacket_reg[hostIPv4Address] [17]),
        .I1(DBG_SendFIFOState[0]),
        .I2(\sendCurrentPacket_reg[hostMACAddress] [33]),
        .I3(DBG_SendFIFOState[1]),
        .I4(\sendCurrentPacket_reg[hostMACAddress] [1]),
        .O(\send_pkt_header_wr_data[17]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \send_pkt_header_wr_data[17]_i_3 
       (.I0(\currentSessionState_reg[hostIPv4Address] [17]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I2(in9[17]),
        .I3(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .I4(data1[17]),
        .O(\send_pkt_header_wr_data[17]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \send_pkt_header_wr_data[18]_i_2 
       (.I0(\sendCurrentPacket_reg[hostIPv4Address] [18]),
        .I1(DBG_SendFIFOState[0]),
        .I2(\sendCurrentPacket_reg[hostMACAddress] [34]),
        .I3(DBG_SendFIFOState[1]),
        .I4(\sendCurrentPacket_reg[hostMACAddress] [2]),
        .O(\send_pkt_header_wr_data[18]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \send_pkt_header_wr_data[18]_i_3 
       (.I0(\currentSessionState_reg[hostIPv4Address] [18]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I2(in9[18]),
        .I3(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .I4(data1[18]),
        .O(\send_pkt_header_wr_data[18]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \send_pkt_header_wr_data[19]_i_2 
       (.I0(\sendCurrentPacket_reg[hostIPv4Address] [19]),
        .I1(DBG_SendFIFOState[0]),
        .I2(\sendCurrentPacket_reg[hostMACAddress] [35]),
        .I3(DBG_SendFIFOState[1]),
        .I4(\sendCurrentPacket_reg[hostMACAddress] [3]),
        .O(\send_pkt_header_wr_data[19]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \send_pkt_header_wr_data[19]_i_3 
       (.I0(\currentSessionState_reg[hostIPv4Address] [19]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I2(in9[19]),
        .I3(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .I4(data1[19]),
        .O(\send_pkt_header_wr_data[19]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hB888FFFFB8880000)) 
    \send_pkt_header_wr_data[1]_i_1 
       (.I0(\currentSessionState_reg[hostIPv4Address] [1]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I2(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .I3(in9[1]),
        .I4(currentState__0[0]),
        .I5(\send_pkt_header_wr_data[1]_i_2_n_0 ),
        .O(send_pkt_header_wr_data0_in[1]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \send_pkt_header_wr_data[1]_i_2 
       (.I0(\sendCurrentPacket_reg[hostIPv4Address] [1]),
        .I1(DBG_SendFIFOState[0]),
        .I2(\sendCurrentPacket_reg[hostMACAddress] [17]),
        .I3(DBG_SendFIFOState[1]),
        .I4(\sendCurrentPacket_reg[packetLength] [1]),
        .O(\send_pkt_header_wr_data[1]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \send_pkt_header_wr_data[20]_i_2 
       (.I0(\sendCurrentPacket_reg[hostIPv4Address] [20]),
        .I1(DBG_SendFIFOState[0]),
        .I2(\sendCurrentPacket_reg[hostMACAddress] [36]),
        .I3(DBG_SendFIFOState[1]),
        .I4(\sendCurrentPacket_reg[hostMACAddress] [4]),
        .O(\send_pkt_header_wr_data[20]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \send_pkt_header_wr_data[20]_i_3 
       (.I0(\currentSessionState_reg[hostIPv4Address] [20]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I2(in9[20]),
        .I3(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .I4(data1[20]),
        .O(\send_pkt_header_wr_data[20]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \send_pkt_header_wr_data[21]_i_2 
       (.I0(\sendCurrentPacket_reg[hostIPv4Address] [21]),
        .I1(DBG_SendFIFOState[0]),
        .I2(\sendCurrentPacket_reg[hostMACAddress] [37]),
        .I3(DBG_SendFIFOState[1]),
        .I4(\sendCurrentPacket_reg[hostMACAddress] [5]),
        .O(\send_pkt_header_wr_data[21]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \send_pkt_header_wr_data[21]_i_3 
       (.I0(\currentSessionState_reg[hostIPv4Address] [21]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I2(in9[21]),
        .I3(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .I4(data1[21]),
        .O(\send_pkt_header_wr_data[21]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \send_pkt_header_wr_data[22]_i_2 
       (.I0(\sendCurrentPacket_reg[hostIPv4Address] [22]),
        .I1(DBG_SendFIFOState[0]),
        .I2(\sendCurrentPacket_reg[hostMACAddress] [38]),
        .I3(DBG_SendFIFOState[1]),
        .I4(\sendCurrentPacket_reg[hostMACAddress] [6]),
        .O(\send_pkt_header_wr_data[22]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \send_pkt_header_wr_data[22]_i_3 
       (.I0(\currentSessionState_reg[hostIPv4Address] [22]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I2(in9[22]),
        .I3(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .I4(data1[22]),
        .O(\send_pkt_header_wr_data[22]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \send_pkt_header_wr_data[23]_i_2 
       (.I0(\sendCurrentPacket_reg[hostIPv4Address] [23]),
        .I1(DBG_SendFIFOState[0]),
        .I2(\sendCurrentPacket_reg[hostMACAddress] [39]),
        .I3(DBG_SendFIFOState[1]),
        .I4(\sendCurrentPacket_reg[hostMACAddress] [7]),
        .O(\send_pkt_header_wr_data[23]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \send_pkt_header_wr_data[23]_i_3 
       (.I0(\currentSessionState_reg[hostIPv4Address] [23]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I2(in9[23]),
        .I3(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .I4(data1[23]),
        .O(\send_pkt_header_wr_data[23]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \send_pkt_header_wr_data[24]_i_2 
       (.I0(\sendCurrentPacket_reg[hostIPv4Address] [24]),
        .I1(DBG_SendFIFOState[0]),
        .I2(\sendCurrentPacket_reg[hostMACAddress] [40]),
        .I3(DBG_SendFIFOState[1]),
        .I4(\sendCurrentPacket_reg[hostMACAddress] [8]),
        .O(\send_pkt_header_wr_data[24]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \send_pkt_header_wr_data[24]_i_3 
       (.I0(\currentSessionState_reg[hostIPv4Address] [24]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I2(in9[24]),
        .I3(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .I4(data1[24]),
        .O(\send_pkt_header_wr_data[24]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \send_pkt_header_wr_data[25]_i_2 
       (.I0(\sendCurrentPacket_reg[hostIPv4Address] [25]),
        .I1(DBG_SendFIFOState[0]),
        .I2(\sendCurrentPacket_reg[hostMACAddress] [41]),
        .I3(DBG_SendFIFOState[1]),
        .I4(\sendCurrentPacket_reg[hostMACAddress] [9]),
        .O(\send_pkt_header_wr_data[25]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \send_pkt_header_wr_data[25]_i_3 
       (.I0(\currentSessionState_reg[hostIPv4Address] [25]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I2(in9[25]),
        .I3(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .I4(data1[25]),
        .O(\send_pkt_header_wr_data[25]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \send_pkt_header_wr_data[26]_i_2 
       (.I0(\sendCurrentPacket_reg[hostIPv4Address] [26]),
        .I1(DBG_SendFIFOState[0]),
        .I2(\sendCurrentPacket_reg[hostMACAddress] [42]),
        .I3(DBG_SendFIFOState[1]),
        .I4(\sendCurrentPacket_reg[hostMACAddress] [10]),
        .O(\send_pkt_header_wr_data[26]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \send_pkt_header_wr_data[26]_i_3 
       (.I0(\currentSessionState_reg[hostIPv4Address] [26]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I2(in9[26]),
        .I3(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .I4(data1[26]),
        .O(\send_pkt_header_wr_data[26]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \send_pkt_header_wr_data[27]_i_2 
       (.I0(\sendCurrentPacket_reg[hostIPv4Address] [27]),
        .I1(DBG_SendFIFOState[0]),
        .I2(\sendCurrentPacket_reg[hostMACAddress] [43]),
        .I3(DBG_SendFIFOState[1]),
        .I4(\sendCurrentPacket_reg[hostMACAddress] [11]),
        .O(\send_pkt_header_wr_data[27]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \send_pkt_header_wr_data[27]_i_3 
       (.I0(\currentSessionState_reg[hostIPv4Address] [27]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I2(in9[27]),
        .I3(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .I4(data1[27]),
        .O(\send_pkt_header_wr_data[27]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \send_pkt_header_wr_data[28]_i_2 
       (.I0(\sendCurrentPacket_reg[hostIPv4Address] [28]),
        .I1(DBG_SendFIFOState[0]),
        .I2(\sendCurrentPacket_reg[hostMACAddress] [44]),
        .I3(DBG_SendFIFOState[1]),
        .I4(\sendCurrentPacket_reg[hostMACAddress] [12]),
        .O(\send_pkt_header_wr_data[28]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \send_pkt_header_wr_data[28]_i_3 
       (.I0(\currentSessionState_reg[hostIPv4Address] [28]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I2(in9[28]),
        .I3(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .I4(data1[28]),
        .O(\send_pkt_header_wr_data[28]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \send_pkt_header_wr_data[29]_i_2 
       (.I0(\sendCurrentPacket_reg[hostIPv4Address] [29]),
        .I1(DBG_SendFIFOState[0]),
        .I2(\sendCurrentPacket_reg[hostMACAddress] [45]),
        .I3(DBG_SendFIFOState[1]),
        .I4(\sendCurrentPacket_reg[hostMACAddress] [13]),
        .O(\send_pkt_header_wr_data[29]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \send_pkt_header_wr_data[29]_i_3 
       (.I0(\currentSessionState_reg[hostIPv4Address] [29]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I2(in9[29]),
        .I3(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .I4(data1[29]),
        .O(\send_pkt_header_wr_data[29]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hB888FFFFB8880000)) 
    \send_pkt_header_wr_data[2]_i_1 
       (.I0(\currentSessionState_reg[hostIPv4Address] [2]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I2(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .I3(in9[2]),
        .I4(currentState__0[0]),
        .I5(\send_pkt_header_wr_data[2]_i_2_n_0 ),
        .O(send_pkt_header_wr_data0_in[2]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \send_pkt_header_wr_data[2]_i_2 
       (.I0(\sendCurrentPacket_reg[hostIPv4Address] [2]),
        .I1(DBG_SendFIFOState[0]),
        .I2(\sendCurrentPacket_reg[hostMACAddress] [18]),
        .I3(DBG_SendFIFOState[1]),
        .I4(\sendCurrentPacket_reg[packetLength] [2]),
        .O(\send_pkt_header_wr_data[2]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \send_pkt_header_wr_data[30]_i_2 
       (.I0(\sendCurrentPacket_reg[hostIPv4Address] [30]),
        .I1(DBG_SendFIFOState[0]),
        .I2(\sendCurrentPacket_reg[hostMACAddress] [46]),
        .I3(DBG_SendFIFOState[1]),
        .I4(\sendCurrentPacket_reg[hostMACAddress] [14]),
        .O(\send_pkt_header_wr_data[30]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \send_pkt_header_wr_data[30]_i_3 
       (.I0(\currentSessionState_reg[hostIPv4Address] [30]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I2(in9[30]),
        .I3(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .I4(data1[30]),
        .O(\send_pkt_header_wr_data[30]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hBFAAAAAAAAAAAAAA)) 
    \send_pkt_header_wr_data[31]_i_1 
       (.I0(\send_pkt_header_wr_data[31]_i_3_n_0 ),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .I2(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I3(currentState__0[0]),
        .I4(sendHasRepliedSuccessfulConnection),
        .I5(sendPacketState__0),
        .O(\send_pkt_header_wr_data[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000EEEA00000000)) 
    \send_pkt_header_wr_data[31]_i_3 
       (.I0(\send_pkt_data_wr_data[31]_i_4_n_0 ),
        .I1(sendHandlingReply_reg_0),
        .I2(DBG_SendFIFOState[0]),
        .I3(DBG_SendFIFOState[1]),
        .I4(currentState__0[0]),
        .I5(sendHasRepliedSuccessfulConnection),
        .O(\send_pkt_header_wr_data[31]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \send_pkt_header_wr_data[31]_i_4 
       (.I0(\sendCurrentPacket_reg[hostIPv4Address] [31]),
        .I1(DBG_SendFIFOState[0]),
        .I2(\sendCurrentPacket_reg[hostMACAddress] [47]),
        .I3(DBG_SendFIFOState[1]),
        .I4(\sendCurrentPacket_reg[hostMACAddress] [15]),
        .O(\send_pkt_header_wr_data[31]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \send_pkt_header_wr_data[31]_i_5 
       (.I0(\currentSessionState_reg[hostIPv4Address] [31]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I2(in9[31]),
        .I3(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .I4(data1[31]),
        .O(\send_pkt_header_wr_data[31]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \send_pkt_header_wr_data[3]_i_2 
       (.I0(\sendCurrentPacket_reg[hostIPv4Address] [3]),
        .I1(DBG_SendFIFOState[0]),
        .I2(\sendCurrentPacket_reg[hostMACAddress] [19]),
        .I3(DBG_SendFIFOState[1]),
        .I4(\sendCurrentPacket_reg[packetLength] [3]),
        .O(\send_pkt_header_wr_data[3]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB888B8BB)) 
    \send_pkt_header_wr_data[3]_i_3 
       (.I0(\currentSessionState_reg[hostIPv4Address] [3]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I2(in9[3]),
        .I3(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .I4(\sendLastSentPacketHeader_reg[subpacketCount_n_0_][0] ),
        .O(\send_pkt_header_wr_data[3]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \send_pkt_header_wr_data[4]_i_2 
       (.I0(\sendCurrentPacket_reg[hostIPv4Address] [4]),
        .I1(DBG_SendFIFOState[0]),
        .I2(\sendCurrentPacket_reg[hostMACAddress] [20]),
        .I3(DBG_SendFIFOState[1]),
        .I4(\sendCurrentPacket_reg[packetLength] [4]),
        .O(\send_pkt_header_wr_data[4]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \send_pkt_header_wr_data[4]_i_3 
       (.I0(\currentSessionState_reg[hostIPv4Address] [4]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I2(in9[4]),
        .I3(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .I4(\sendLastSentPacketHeader_reg[subpacketCount_n_0_][0] ),
        .O(\send_pkt_header_wr_data[4]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hB888FFFFB8880000)) 
    \send_pkt_header_wr_data[5]_i_1 
       (.I0(\currentSessionState_reg[hostIPv4Address] [5]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I2(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .I3(in9[5]),
        .I4(currentState__0[0]),
        .I5(\send_pkt_header_wr_data[5]_i_2_n_0 ),
        .O(send_pkt_header_wr_data0_in[5]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \send_pkt_header_wr_data[5]_i_2 
       (.I0(\sendCurrentPacket_reg[hostIPv4Address] [5]),
        .I1(DBG_SendFIFOState[0]),
        .I2(\sendCurrentPacket_reg[hostMACAddress] [21]),
        .I3(DBG_SendFIFOState[1]),
        .I4(\sendCurrentPacket_reg[packetLength] [5]),
        .O(\send_pkt_header_wr_data[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hB888FFFFB8880000)) 
    \send_pkt_header_wr_data[6]_i_1 
       (.I0(\currentSessionState_reg[hostIPv4Address] [6]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I2(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .I3(in9[6]),
        .I4(currentState__0[0]),
        .I5(\send_pkt_header_wr_data[6]_i_2_n_0 ),
        .O(send_pkt_header_wr_data0_in[6]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \send_pkt_header_wr_data[6]_i_2 
       (.I0(\sendCurrentPacket_reg[hostIPv4Address] [6]),
        .I1(DBG_SendFIFOState[0]),
        .I2(\sendCurrentPacket_reg[hostMACAddress] [22]),
        .I3(DBG_SendFIFOState[1]),
        .I4(\sendCurrentPacket_reg[packetLength] [6]),
        .O(\send_pkt_header_wr_data[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hB888FFFFB8880000)) 
    \send_pkt_header_wr_data[7]_i_1 
       (.I0(\currentSessionState_reg[hostIPv4Address] [7]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I2(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .I3(in9[7]),
        .I4(currentState__0[0]),
        .I5(\send_pkt_header_wr_data[7]_i_2_n_0 ),
        .O(send_pkt_header_wr_data0_in[7]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \send_pkt_header_wr_data[7]_i_2 
       (.I0(\sendCurrentPacket_reg[hostIPv4Address] [7]),
        .I1(DBG_SendFIFOState[0]),
        .I2(\sendCurrentPacket_reg[hostMACAddress] [23]),
        .I3(DBG_SendFIFOState[1]),
        .I4(\sendCurrentPacket_reg[packetLength] [7]),
        .O(\send_pkt_header_wr_data[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hB888FFFFB8880000)) 
    \send_pkt_header_wr_data[8]_i_1 
       (.I0(\currentSessionState_reg[hostIPv4Address] [8]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I2(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .I3(in9[8]),
        .I4(currentState__0[0]),
        .I5(\send_pkt_header_wr_data[8]_i_2_n_0 ),
        .O(send_pkt_header_wr_data0_in[8]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \send_pkt_header_wr_data[8]_i_2 
       (.I0(\sendCurrentPacket_reg[hostIPv4Address] [8]),
        .I1(DBG_SendFIFOState[0]),
        .I2(\sendCurrentPacket_reg[hostMACAddress] [24]),
        .I3(DBG_SendFIFOState[1]),
        .I4(\sendCurrentPacket_reg[packetLength] [8]),
        .O(\send_pkt_header_wr_data[8]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hB888FFFFB8880000)) 
    \send_pkt_header_wr_data[9]_i_1 
       (.I0(\currentSessionState_reg[hostIPv4Address] [9]),
        .I1(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I2(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .I3(in9[9]),
        .I4(currentState__0[0]),
        .I5(\send_pkt_header_wr_data[9]_i_2_n_0 ),
        .O(send_pkt_header_wr_data0_in[9]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \send_pkt_header_wr_data[9]_i_2 
       (.I0(\sendCurrentPacket_reg[hostIPv4Address] [9]),
        .I1(DBG_SendFIFOState[0]),
        .I2(\sendCurrentPacket_reg[hostMACAddress] [25]),
        .I3(DBG_SendFIFOState[1]),
        .I4(\sendCurrentPacket_reg[packetLength] [9]),
        .O(\send_pkt_header_wr_data[9]_i_2_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_header WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \send_pkt_header_wr_data_reg[0] 
       (.C(clk333_250),
        .CE(\send_pkt_header_wr_data[31]_i_1_n_0 ),
        .D(send_pkt_header_wr_data0_in[0]),
        .Q(send_pkt_header_wr_data[0]),
        .R(1'b0));
  MUXF7 \send_pkt_header_wr_data_reg[0]_i_1 
       (.I0(\send_pkt_header_wr_data[0]_i_2_n_0 ),
        .I1(\send_pkt_header_wr_data[0]_i_3_n_0 ),
        .O(send_pkt_header_wr_data0_in[0]),
        .S(currentState__0[0]));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_header WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \send_pkt_header_wr_data_reg[10] 
       (.C(clk333_250),
        .CE(\send_pkt_header_wr_data[31]_i_1_n_0 ),
        .D(send_pkt_header_wr_data0_in[10]),
        .Q(send_pkt_header_wr_data[10]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_header WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \send_pkt_header_wr_data_reg[11] 
       (.C(clk333_250),
        .CE(\send_pkt_header_wr_data[31]_i_1_n_0 ),
        .D(send_pkt_header_wr_data0_in[11]),
        .Q(send_pkt_header_wr_data[11]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_header WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \send_pkt_header_wr_data_reg[12] 
       (.C(clk333_250),
        .CE(\send_pkt_header_wr_data[31]_i_1_n_0 ),
        .D(send_pkt_header_wr_data0_in[12]),
        .Q(send_pkt_header_wr_data[12]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_header WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \send_pkt_header_wr_data_reg[13] 
       (.C(clk333_250),
        .CE(\send_pkt_header_wr_data[31]_i_1_n_0 ),
        .D(send_pkt_header_wr_data0_in[13]),
        .Q(send_pkt_header_wr_data[13]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_header WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \send_pkt_header_wr_data_reg[14] 
       (.C(clk333_250),
        .CE(\send_pkt_header_wr_data[31]_i_1_n_0 ),
        .D(send_pkt_header_wr_data0_in[14]),
        .Q(send_pkt_header_wr_data[14]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_header WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \send_pkt_header_wr_data_reg[15] 
       (.C(clk333_250),
        .CE(\send_pkt_header_wr_data[31]_i_1_n_0 ),
        .D(send_pkt_header_wr_data0_in[15]),
        .Q(send_pkt_header_wr_data[15]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_header WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \send_pkt_header_wr_data_reg[16] 
       (.C(clk333_250),
        .CE(\send_pkt_header_wr_data[31]_i_1_n_0 ),
        .D(send_pkt_header_wr_data0_in[16]),
        .Q(send_pkt_header_wr_data[16]),
        .R(1'b0));
  MUXF7 \send_pkt_header_wr_data_reg[16]_i_1 
       (.I0(\send_pkt_header_wr_data[16]_i_2_n_0 ),
        .I1(\send_pkt_header_wr_data[16]_i_3_n_0 ),
        .O(send_pkt_header_wr_data0_in[16]),
        .S(currentState__0[0]));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_header WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \send_pkt_header_wr_data_reg[17] 
       (.C(clk333_250),
        .CE(\send_pkt_header_wr_data[31]_i_1_n_0 ),
        .D(send_pkt_header_wr_data0_in[17]),
        .Q(send_pkt_header_wr_data[17]),
        .R(1'b0));
  MUXF7 \send_pkt_header_wr_data_reg[17]_i_1 
       (.I0(\send_pkt_header_wr_data[17]_i_2_n_0 ),
        .I1(\send_pkt_header_wr_data[17]_i_3_n_0 ),
        .O(send_pkt_header_wr_data0_in[17]),
        .S(currentState__0[0]));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_header WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \send_pkt_header_wr_data_reg[18] 
       (.C(clk333_250),
        .CE(\send_pkt_header_wr_data[31]_i_1_n_0 ),
        .D(send_pkt_header_wr_data0_in[18]),
        .Q(send_pkt_header_wr_data[18]),
        .R(1'b0));
  MUXF7 \send_pkt_header_wr_data_reg[18]_i_1 
       (.I0(\send_pkt_header_wr_data[18]_i_2_n_0 ),
        .I1(\send_pkt_header_wr_data[18]_i_3_n_0 ),
        .O(send_pkt_header_wr_data0_in[18]),
        .S(currentState__0[0]));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_header WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \send_pkt_header_wr_data_reg[19] 
       (.C(clk333_250),
        .CE(\send_pkt_header_wr_data[31]_i_1_n_0 ),
        .D(send_pkt_header_wr_data0_in[19]),
        .Q(send_pkt_header_wr_data[19]),
        .R(1'b0));
  MUXF7 \send_pkt_header_wr_data_reg[19]_i_1 
       (.I0(\send_pkt_header_wr_data[19]_i_2_n_0 ),
        .I1(\send_pkt_header_wr_data[19]_i_3_n_0 ),
        .O(send_pkt_header_wr_data0_in[19]),
        .S(currentState__0[0]));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_header WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \send_pkt_header_wr_data_reg[1] 
       (.C(clk333_250),
        .CE(\send_pkt_header_wr_data[31]_i_1_n_0 ),
        .D(send_pkt_header_wr_data0_in[1]),
        .Q(send_pkt_header_wr_data[1]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_header WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \send_pkt_header_wr_data_reg[20] 
       (.C(clk333_250),
        .CE(\send_pkt_header_wr_data[31]_i_1_n_0 ),
        .D(send_pkt_header_wr_data0_in[20]),
        .Q(send_pkt_header_wr_data[20]),
        .R(1'b0));
  MUXF7 \send_pkt_header_wr_data_reg[20]_i_1 
       (.I0(\send_pkt_header_wr_data[20]_i_2_n_0 ),
        .I1(\send_pkt_header_wr_data[20]_i_3_n_0 ),
        .O(send_pkt_header_wr_data0_in[20]),
        .S(currentState__0[0]));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_header WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \send_pkt_header_wr_data_reg[21] 
       (.C(clk333_250),
        .CE(\send_pkt_header_wr_data[31]_i_1_n_0 ),
        .D(send_pkt_header_wr_data0_in[21]),
        .Q(send_pkt_header_wr_data[21]),
        .R(1'b0));
  MUXF7 \send_pkt_header_wr_data_reg[21]_i_1 
       (.I0(\send_pkt_header_wr_data[21]_i_2_n_0 ),
        .I1(\send_pkt_header_wr_data[21]_i_3_n_0 ),
        .O(send_pkt_header_wr_data0_in[21]),
        .S(currentState__0[0]));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_header WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \send_pkt_header_wr_data_reg[22] 
       (.C(clk333_250),
        .CE(\send_pkt_header_wr_data[31]_i_1_n_0 ),
        .D(send_pkt_header_wr_data0_in[22]),
        .Q(send_pkt_header_wr_data[22]),
        .R(1'b0));
  MUXF7 \send_pkt_header_wr_data_reg[22]_i_1 
       (.I0(\send_pkt_header_wr_data[22]_i_2_n_0 ),
        .I1(\send_pkt_header_wr_data[22]_i_3_n_0 ),
        .O(send_pkt_header_wr_data0_in[22]),
        .S(currentState__0[0]));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_header WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \send_pkt_header_wr_data_reg[23] 
       (.C(clk333_250),
        .CE(\send_pkt_header_wr_data[31]_i_1_n_0 ),
        .D(send_pkt_header_wr_data0_in[23]),
        .Q(send_pkt_header_wr_data[23]),
        .R(1'b0));
  MUXF7 \send_pkt_header_wr_data_reg[23]_i_1 
       (.I0(\send_pkt_header_wr_data[23]_i_2_n_0 ),
        .I1(\send_pkt_header_wr_data[23]_i_3_n_0 ),
        .O(send_pkt_header_wr_data0_in[23]),
        .S(currentState__0[0]));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_header WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \send_pkt_header_wr_data_reg[24] 
       (.C(clk333_250),
        .CE(\send_pkt_header_wr_data[31]_i_1_n_0 ),
        .D(send_pkt_header_wr_data0_in[24]),
        .Q(send_pkt_header_wr_data[24]),
        .R(1'b0));
  MUXF7 \send_pkt_header_wr_data_reg[24]_i_1 
       (.I0(\send_pkt_header_wr_data[24]_i_2_n_0 ),
        .I1(\send_pkt_header_wr_data[24]_i_3_n_0 ),
        .O(send_pkt_header_wr_data0_in[24]),
        .S(currentState__0[0]));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_header WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \send_pkt_header_wr_data_reg[25] 
       (.C(clk333_250),
        .CE(\send_pkt_header_wr_data[31]_i_1_n_0 ),
        .D(send_pkt_header_wr_data0_in[25]),
        .Q(send_pkt_header_wr_data[25]),
        .R(1'b0));
  MUXF7 \send_pkt_header_wr_data_reg[25]_i_1 
       (.I0(\send_pkt_header_wr_data[25]_i_2_n_0 ),
        .I1(\send_pkt_header_wr_data[25]_i_3_n_0 ),
        .O(send_pkt_header_wr_data0_in[25]),
        .S(currentState__0[0]));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_header WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \send_pkt_header_wr_data_reg[26] 
       (.C(clk333_250),
        .CE(\send_pkt_header_wr_data[31]_i_1_n_0 ),
        .D(send_pkt_header_wr_data0_in[26]),
        .Q(send_pkt_header_wr_data[26]),
        .R(1'b0));
  MUXF7 \send_pkt_header_wr_data_reg[26]_i_1 
       (.I0(\send_pkt_header_wr_data[26]_i_2_n_0 ),
        .I1(\send_pkt_header_wr_data[26]_i_3_n_0 ),
        .O(send_pkt_header_wr_data0_in[26]),
        .S(currentState__0[0]));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_header WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \send_pkt_header_wr_data_reg[27] 
       (.C(clk333_250),
        .CE(\send_pkt_header_wr_data[31]_i_1_n_0 ),
        .D(send_pkt_header_wr_data0_in[27]),
        .Q(send_pkt_header_wr_data[27]),
        .R(1'b0));
  MUXF7 \send_pkt_header_wr_data_reg[27]_i_1 
       (.I0(\send_pkt_header_wr_data[27]_i_2_n_0 ),
        .I1(\send_pkt_header_wr_data[27]_i_3_n_0 ),
        .O(send_pkt_header_wr_data0_in[27]),
        .S(currentState__0[0]));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_header WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \send_pkt_header_wr_data_reg[28] 
       (.C(clk333_250),
        .CE(\send_pkt_header_wr_data[31]_i_1_n_0 ),
        .D(send_pkt_header_wr_data0_in[28]),
        .Q(send_pkt_header_wr_data[28]),
        .R(1'b0));
  MUXF7 \send_pkt_header_wr_data_reg[28]_i_1 
       (.I0(\send_pkt_header_wr_data[28]_i_2_n_0 ),
        .I1(\send_pkt_header_wr_data[28]_i_3_n_0 ),
        .O(send_pkt_header_wr_data0_in[28]),
        .S(currentState__0[0]));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_header WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \send_pkt_header_wr_data_reg[29] 
       (.C(clk333_250),
        .CE(\send_pkt_header_wr_data[31]_i_1_n_0 ),
        .D(send_pkt_header_wr_data0_in[29]),
        .Q(send_pkt_header_wr_data[29]),
        .R(1'b0));
  MUXF7 \send_pkt_header_wr_data_reg[29]_i_1 
       (.I0(\send_pkt_header_wr_data[29]_i_2_n_0 ),
        .I1(\send_pkt_header_wr_data[29]_i_3_n_0 ),
        .O(send_pkt_header_wr_data0_in[29]),
        .S(currentState__0[0]));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_header WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \send_pkt_header_wr_data_reg[2] 
       (.C(clk333_250),
        .CE(\send_pkt_header_wr_data[31]_i_1_n_0 ),
        .D(send_pkt_header_wr_data0_in[2]),
        .Q(send_pkt_header_wr_data[2]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_header WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \send_pkt_header_wr_data_reg[30] 
       (.C(clk333_250),
        .CE(\send_pkt_header_wr_data[31]_i_1_n_0 ),
        .D(send_pkt_header_wr_data0_in[30]),
        .Q(send_pkt_header_wr_data[30]),
        .R(1'b0));
  MUXF7 \send_pkt_header_wr_data_reg[30]_i_1 
       (.I0(\send_pkt_header_wr_data[30]_i_2_n_0 ),
        .I1(\send_pkt_header_wr_data[30]_i_3_n_0 ),
        .O(send_pkt_header_wr_data0_in[30]),
        .S(currentState__0[0]));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_header WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \send_pkt_header_wr_data_reg[31] 
       (.C(clk333_250),
        .CE(\send_pkt_header_wr_data[31]_i_1_n_0 ),
        .D(send_pkt_header_wr_data0_in[31]),
        .Q(send_pkt_header_wr_data[31]),
        .R(1'b0));
  MUXF7 \send_pkt_header_wr_data_reg[31]_i_2 
       (.I0(\send_pkt_header_wr_data[31]_i_4_n_0 ),
        .I1(\send_pkt_header_wr_data[31]_i_5_n_0 ),
        .O(send_pkt_header_wr_data0_in[31]),
        .S(currentState__0[0]));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_header WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \send_pkt_header_wr_data_reg[3] 
       (.C(clk333_250),
        .CE(\send_pkt_header_wr_data[31]_i_1_n_0 ),
        .D(send_pkt_header_wr_data0_in[3]),
        .Q(send_pkt_header_wr_data[3]),
        .R(1'b0));
  MUXF7 \send_pkt_header_wr_data_reg[3]_i_1 
       (.I0(\send_pkt_header_wr_data[3]_i_2_n_0 ),
        .I1(\send_pkt_header_wr_data[3]_i_3_n_0 ),
        .O(send_pkt_header_wr_data0_in[3]),
        .S(currentState__0[0]));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_header WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \send_pkt_header_wr_data_reg[4] 
       (.C(clk333_250),
        .CE(\send_pkt_header_wr_data[31]_i_1_n_0 ),
        .D(send_pkt_header_wr_data0_in[4]),
        .Q(send_pkt_header_wr_data[4]),
        .R(1'b0));
  MUXF7 \send_pkt_header_wr_data_reg[4]_i_1 
       (.I0(\send_pkt_header_wr_data[4]_i_2_n_0 ),
        .I1(\send_pkt_header_wr_data[4]_i_3_n_0 ),
        .O(send_pkt_header_wr_data0_in[4]),
        .S(currentState__0[0]));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_header WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \send_pkt_header_wr_data_reg[5] 
       (.C(clk333_250),
        .CE(\send_pkt_header_wr_data[31]_i_1_n_0 ),
        .D(send_pkt_header_wr_data0_in[5]),
        .Q(send_pkt_header_wr_data[5]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_header WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \send_pkt_header_wr_data_reg[6] 
       (.C(clk333_250),
        .CE(\send_pkt_header_wr_data[31]_i_1_n_0 ),
        .D(send_pkt_header_wr_data0_in[6]),
        .Q(send_pkt_header_wr_data[6]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_header WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \send_pkt_header_wr_data_reg[7] 
       (.C(clk333_250),
        .CE(\send_pkt_header_wr_data[31]_i_1_n_0 ),
        .D(send_pkt_header_wr_data0_in[7]),
        .Q(send_pkt_header_wr_data[7]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_header WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \send_pkt_header_wr_data_reg[8] 
       (.C(clk333_250),
        .CE(\send_pkt_header_wr_data[31]_i_1_n_0 ),
        .D(send_pkt_header_wr_data0_in[8]),
        .Q(send_pkt_header_wr_data[8]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_header WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \send_pkt_header_wr_data_reg[9] 
       (.C(clk333_250),
        .CE(\send_pkt_header_wr_data[31]_i_1_n_0 ),
        .D(send_pkt_header_wr_data0_in[9]),
        .Q(send_pkt_header_wr_data[9]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 send_pkt_header WR_EN" *) 
  FDRE #(
    .INIT(1'b0)) 
    send_pkt_header_wr_en_reg
       (.C(clk333_250),
        .CE(1'b1),
        .D(\send_pkt_header_wr_data[31]_i_1_n_0 ),
        .Q(send_pkt_header_wr_en),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h4000)) 
    \stat_recv_session_packets_dropped[31]_i_1 
       (.I0(\recvPacketHeaderBuffer_reg[0]_0 ),
        .I1(\stat_recv_session_packets_valid[31]_i_3_n_0 ),
        .I2(\DBG_recvHeaderChecksum[7]_i_1_n_0 ),
        .I3(validPacketsFIFO_prog_full),
        .O(stat_recv_session_packets_dropped));
  LUT1 #(
    .INIT(2'h1)) 
    \stat_recv_session_packets_dropped[7]_i_2 
       (.I0(STAT_RecvSessionPacketsDropped[0]),
        .O(\stat_recv_session_packets_dropped[7]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_dropped_reg[0] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_dropped),
        .D(\stat_recv_session_packets_dropped_reg[7]_i_1_n_15 ),
        .Q(STAT_RecvSessionPacketsDropped[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_dropped_reg[10] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_dropped),
        .D(\stat_recv_session_packets_dropped_reg[15]_i_1_n_13 ),
        .Q(STAT_RecvSessionPacketsDropped[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_dropped_reg[11] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_dropped),
        .D(\stat_recv_session_packets_dropped_reg[15]_i_1_n_12 ),
        .Q(STAT_RecvSessionPacketsDropped[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_dropped_reg[12] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_dropped),
        .D(\stat_recv_session_packets_dropped_reg[15]_i_1_n_11 ),
        .Q(STAT_RecvSessionPacketsDropped[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_dropped_reg[13] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_dropped),
        .D(\stat_recv_session_packets_dropped_reg[15]_i_1_n_10 ),
        .Q(STAT_RecvSessionPacketsDropped[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_dropped_reg[14] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_dropped),
        .D(\stat_recv_session_packets_dropped_reg[15]_i_1_n_9 ),
        .Q(STAT_RecvSessionPacketsDropped[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_dropped_reg[15] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_dropped),
        .D(\stat_recv_session_packets_dropped_reg[15]_i_1_n_8 ),
        .Q(STAT_RecvSessionPacketsDropped[15]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \stat_recv_session_packets_dropped_reg[15]_i_1 
       (.CI(\stat_recv_session_packets_dropped_reg[7]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\stat_recv_session_packets_dropped_reg[15]_i_1_n_0 ,\stat_recv_session_packets_dropped_reg[15]_i_1_n_1 ,\stat_recv_session_packets_dropped_reg[15]_i_1_n_2 ,\stat_recv_session_packets_dropped_reg[15]_i_1_n_3 ,\stat_recv_session_packets_dropped_reg[15]_i_1_n_4 ,\stat_recv_session_packets_dropped_reg[15]_i_1_n_5 ,\stat_recv_session_packets_dropped_reg[15]_i_1_n_6 ,\stat_recv_session_packets_dropped_reg[15]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\stat_recv_session_packets_dropped_reg[15]_i_1_n_8 ,\stat_recv_session_packets_dropped_reg[15]_i_1_n_9 ,\stat_recv_session_packets_dropped_reg[15]_i_1_n_10 ,\stat_recv_session_packets_dropped_reg[15]_i_1_n_11 ,\stat_recv_session_packets_dropped_reg[15]_i_1_n_12 ,\stat_recv_session_packets_dropped_reg[15]_i_1_n_13 ,\stat_recv_session_packets_dropped_reg[15]_i_1_n_14 ,\stat_recv_session_packets_dropped_reg[15]_i_1_n_15 }),
        .S(STAT_RecvSessionPacketsDropped[15:8]));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_dropped_reg[16] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_dropped),
        .D(\stat_recv_session_packets_dropped_reg[23]_i_1_n_15 ),
        .Q(STAT_RecvSessionPacketsDropped[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_dropped_reg[17] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_dropped),
        .D(\stat_recv_session_packets_dropped_reg[23]_i_1_n_14 ),
        .Q(STAT_RecvSessionPacketsDropped[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_dropped_reg[18] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_dropped),
        .D(\stat_recv_session_packets_dropped_reg[23]_i_1_n_13 ),
        .Q(STAT_RecvSessionPacketsDropped[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_dropped_reg[19] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_dropped),
        .D(\stat_recv_session_packets_dropped_reg[23]_i_1_n_12 ),
        .Q(STAT_RecvSessionPacketsDropped[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_dropped_reg[1] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_dropped),
        .D(\stat_recv_session_packets_dropped_reg[7]_i_1_n_14 ),
        .Q(STAT_RecvSessionPacketsDropped[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_dropped_reg[20] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_dropped),
        .D(\stat_recv_session_packets_dropped_reg[23]_i_1_n_11 ),
        .Q(STAT_RecvSessionPacketsDropped[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_dropped_reg[21] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_dropped),
        .D(\stat_recv_session_packets_dropped_reg[23]_i_1_n_10 ),
        .Q(STAT_RecvSessionPacketsDropped[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_dropped_reg[22] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_dropped),
        .D(\stat_recv_session_packets_dropped_reg[23]_i_1_n_9 ),
        .Q(STAT_RecvSessionPacketsDropped[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_dropped_reg[23] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_dropped),
        .D(\stat_recv_session_packets_dropped_reg[23]_i_1_n_8 ),
        .Q(STAT_RecvSessionPacketsDropped[23]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \stat_recv_session_packets_dropped_reg[23]_i_1 
       (.CI(\stat_recv_session_packets_dropped_reg[15]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\stat_recv_session_packets_dropped_reg[23]_i_1_n_0 ,\stat_recv_session_packets_dropped_reg[23]_i_1_n_1 ,\stat_recv_session_packets_dropped_reg[23]_i_1_n_2 ,\stat_recv_session_packets_dropped_reg[23]_i_1_n_3 ,\stat_recv_session_packets_dropped_reg[23]_i_1_n_4 ,\stat_recv_session_packets_dropped_reg[23]_i_1_n_5 ,\stat_recv_session_packets_dropped_reg[23]_i_1_n_6 ,\stat_recv_session_packets_dropped_reg[23]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\stat_recv_session_packets_dropped_reg[23]_i_1_n_8 ,\stat_recv_session_packets_dropped_reg[23]_i_1_n_9 ,\stat_recv_session_packets_dropped_reg[23]_i_1_n_10 ,\stat_recv_session_packets_dropped_reg[23]_i_1_n_11 ,\stat_recv_session_packets_dropped_reg[23]_i_1_n_12 ,\stat_recv_session_packets_dropped_reg[23]_i_1_n_13 ,\stat_recv_session_packets_dropped_reg[23]_i_1_n_14 ,\stat_recv_session_packets_dropped_reg[23]_i_1_n_15 }),
        .S(STAT_RecvSessionPacketsDropped[23:16]));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_dropped_reg[24] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_dropped),
        .D(\stat_recv_session_packets_dropped_reg[31]_i_2_n_15 ),
        .Q(STAT_RecvSessionPacketsDropped[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_dropped_reg[25] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_dropped),
        .D(\stat_recv_session_packets_dropped_reg[31]_i_2_n_14 ),
        .Q(STAT_RecvSessionPacketsDropped[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_dropped_reg[26] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_dropped),
        .D(\stat_recv_session_packets_dropped_reg[31]_i_2_n_13 ),
        .Q(STAT_RecvSessionPacketsDropped[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_dropped_reg[27] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_dropped),
        .D(\stat_recv_session_packets_dropped_reg[31]_i_2_n_12 ),
        .Q(STAT_RecvSessionPacketsDropped[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_dropped_reg[28] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_dropped),
        .D(\stat_recv_session_packets_dropped_reg[31]_i_2_n_11 ),
        .Q(STAT_RecvSessionPacketsDropped[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_dropped_reg[29] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_dropped),
        .D(\stat_recv_session_packets_dropped_reg[31]_i_2_n_10 ),
        .Q(STAT_RecvSessionPacketsDropped[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_dropped_reg[2] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_dropped),
        .D(\stat_recv_session_packets_dropped_reg[7]_i_1_n_13 ),
        .Q(STAT_RecvSessionPacketsDropped[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_dropped_reg[30] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_dropped),
        .D(\stat_recv_session_packets_dropped_reg[31]_i_2_n_9 ),
        .Q(STAT_RecvSessionPacketsDropped[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_dropped_reg[31] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_dropped),
        .D(\stat_recv_session_packets_dropped_reg[31]_i_2_n_8 ),
        .Q(STAT_RecvSessionPacketsDropped[31]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \stat_recv_session_packets_dropped_reg[31]_i_2 
       (.CI(\stat_recv_session_packets_dropped_reg[23]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\NLW_stat_recv_session_packets_dropped_reg[31]_i_2_CO_UNCONNECTED [7],\stat_recv_session_packets_dropped_reg[31]_i_2_n_1 ,\stat_recv_session_packets_dropped_reg[31]_i_2_n_2 ,\stat_recv_session_packets_dropped_reg[31]_i_2_n_3 ,\stat_recv_session_packets_dropped_reg[31]_i_2_n_4 ,\stat_recv_session_packets_dropped_reg[31]_i_2_n_5 ,\stat_recv_session_packets_dropped_reg[31]_i_2_n_6 ,\stat_recv_session_packets_dropped_reg[31]_i_2_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\stat_recv_session_packets_dropped_reg[31]_i_2_n_8 ,\stat_recv_session_packets_dropped_reg[31]_i_2_n_9 ,\stat_recv_session_packets_dropped_reg[31]_i_2_n_10 ,\stat_recv_session_packets_dropped_reg[31]_i_2_n_11 ,\stat_recv_session_packets_dropped_reg[31]_i_2_n_12 ,\stat_recv_session_packets_dropped_reg[31]_i_2_n_13 ,\stat_recv_session_packets_dropped_reg[31]_i_2_n_14 ,\stat_recv_session_packets_dropped_reg[31]_i_2_n_15 }),
        .S(STAT_RecvSessionPacketsDropped[31:24]));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_dropped_reg[3] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_dropped),
        .D(\stat_recv_session_packets_dropped_reg[7]_i_1_n_12 ),
        .Q(STAT_RecvSessionPacketsDropped[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_dropped_reg[4] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_dropped),
        .D(\stat_recv_session_packets_dropped_reg[7]_i_1_n_11 ),
        .Q(STAT_RecvSessionPacketsDropped[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_dropped_reg[5] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_dropped),
        .D(\stat_recv_session_packets_dropped_reg[7]_i_1_n_10 ),
        .Q(STAT_RecvSessionPacketsDropped[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_dropped_reg[6] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_dropped),
        .D(\stat_recv_session_packets_dropped_reg[7]_i_1_n_9 ),
        .Q(STAT_RecvSessionPacketsDropped[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_dropped_reg[7] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_dropped),
        .D(\stat_recv_session_packets_dropped_reg[7]_i_1_n_8 ),
        .Q(STAT_RecvSessionPacketsDropped[7]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \stat_recv_session_packets_dropped_reg[7]_i_1 
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({\stat_recv_session_packets_dropped_reg[7]_i_1_n_0 ,\stat_recv_session_packets_dropped_reg[7]_i_1_n_1 ,\stat_recv_session_packets_dropped_reg[7]_i_1_n_2 ,\stat_recv_session_packets_dropped_reg[7]_i_1_n_3 ,\stat_recv_session_packets_dropped_reg[7]_i_1_n_4 ,\stat_recv_session_packets_dropped_reg[7]_i_1_n_5 ,\stat_recv_session_packets_dropped_reg[7]_i_1_n_6 ,\stat_recv_session_packets_dropped_reg[7]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1}),
        .O({\stat_recv_session_packets_dropped_reg[7]_i_1_n_8 ,\stat_recv_session_packets_dropped_reg[7]_i_1_n_9 ,\stat_recv_session_packets_dropped_reg[7]_i_1_n_10 ,\stat_recv_session_packets_dropped_reg[7]_i_1_n_11 ,\stat_recv_session_packets_dropped_reg[7]_i_1_n_12 ,\stat_recv_session_packets_dropped_reg[7]_i_1_n_13 ,\stat_recv_session_packets_dropped_reg[7]_i_1_n_14 ,\stat_recv_session_packets_dropped_reg[7]_i_1_n_15 }),
        .S({STAT_RecvSessionPacketsDropped[7:1],\stat_recv_session_packets_dropped[7]_i_2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_dropped_reg[8] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_dropped),
        .D(\stat_recv_session_packets_dropped_reg[15]_i_1_n_15 ),
        .Q(STAT_RecvSessionPacketsDropped[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_dropped_reg[9] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_dropped),
        .D(\stat_recv_session_packets_dropped_reg[15]_i_1_n_14 ),
        .Q(STAT_RecvSessionPacketsDropped[9]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0808080808080800)) 
    \stat_recv_session_packets_invalid[31]_i_1 
       (.I0(\DBG_recvHeaderChecksum[7]_i_1_n_0 ),
        .I1(\stat_recv_session_packets_valid[31]_i_3_n_0 ),
        .I2(\recvPacketHeaderBuffer_reg[0]_0 ),
        .I3(\stat_recv_session_packets_valid[31]_i_4_n_0 ),
        .I4(\stat_recv_session_packets_valid[31]_i_5_n_0 ),
        .I5(\stat_recv_session_packets_valid[31]_i_6_n_0 ),
        .O(stat_recv_session_packets_invalid));
  LUT1 #(
    .INIT(2'h1)) 
    \stat_recv_session_packets_invalid[7]_i_2 
       (.I0(STAT_RecvSessionPacketsInvalid[0]),
        .O(\stat_recv_session_packets_invalid[7]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_invalid_reg[0] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_invalid),
        .D(\stat_recv_session_packets_invalid_reg[7]_i_1_n_15 ),
        .Q(STAT_RecvSessionPacketsInvalid[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_invalid_reg[10] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_invalid),
        .D(\stat_recv_session_packets_invalid_reg[15]_i_1_n_13 ),
        .Q(STAT_RecvSessionPacketsInvalid[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_invalid_reg[11] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_invalid),
        .D(\stat_recv_session_packets_invalid_reg[15]_i_1_n_12 ),
        .Q(STAT_RecvSessionPacketsInvalid[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_invalid_reg[12] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_invalid),
        .D(\stat_recv_session_packets_invalid_reg[15]_i_1_n_11 ),
        .Q(STAT_RecvSessionPacketsInvalid[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_invalid_reg[13] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_invalid),
        .D(\stat_recv_session_packets_invalid_reg[15]_i_1_n_10 ),
        .Q(STAT_RecvSessionPacketsInvalid[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_invalid_reg[14] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_invalid),
        .D(\stat_recv_session_packets_invalid_reg[15]_i_1_n_9 ),
        .Q(STAT_RecvSessionPacketsInvalid[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_invalid_reg[15] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_invalid),
        .D(\stat_recv_session_packets_invalid_reg[15]_i_1_n_8 ),
        .Q(STAT_RecvSessionPacketsInvalid[15]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \stat_recv_session_packets_invalid_reg[15]_i_1 
       (.CI(\stat_recv_session_packets_invalid_reg[7]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\stat_recv_session_packets_invalid_reg[15]_i_1_n_0 ,\stat_recv_session_packets_invalid_reg[15]_i_1_n_1 ,\stat_recv_session_packets_invalid_reg[15]_i_1_n_2 ,\stat_recv_session_packets_invalid_reg[15]_i_1_n_3 ,\stat_recv_session_packets_invalid_reg[15]_i_1_n_4 ,\stat_recv_session_packets_invalid_reg[15]_i_1_n_5 ,\stat_recv_session_packets_invalid_reg[15]_i_1_n_6 ,\stat_recv_session_packets_invalid_reg[15]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\stat_recv_session_packets_invalid_reg[15]_i_1_n_8 ,\stat_recv_session_packets_invalid_reg[15]_i_1_n_9 ,\stat_recv_session_packets_invalid_reg[15]_i_1_n_10 ,\stat_recv_session_packets_invalid_reg[15]_i_1_n_11 ,\stat_recv_session_packets_invalid_reg[15]_i_1_n_12 ,\stat_recv_session_packets_invalid_reg[15]_i_1_n_13 ,\stat_recv_session_packets_invalid_reg[15]_i_1_n_14 ,\stat_recv_session_packets_invalid_reg[15]_i_1_n_15 }),
        .S(STAT_RecvSessionPacketsInvalid[15:8]));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_invalid_reg[16] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_invalid),
        .D(\stat_recv_session_packets_invalid_reg[23]_i_1_n_15 ),
        .Q(STAT_RecvSessionPacketsInvalid[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_invalid_reg[17] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_invalid),
        .D(\stat_recv_session_packets_invalid_reg[23]_i_1_n_14 ),
        .Q(STAT_RecvSessionPacketsInvalid[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_invalid_reg[18] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_invalid),
        .D(\stat_recv_session_packets_invalid_reg[23]_i_1_n_13 ),
        .Q(STAT_RecvSessionPacketsInvalid[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_invalid_reg[19] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_invalid),
        .D(\stat_recv_session_packets_invalid_reg[23]_i_1_n_12 ),
        .Q(STAT_RecvSessionPacketsInvalid[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_invalid_reg[1] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_invalid),
        .D(\stat_recv_session_packets_invalid_reg[7]_i_1_n_14 ),
        .Q(STAT_RecvSessionPacketsInvalid[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_invalid_reg[20] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_invalid),
        .D(\stat_recv_session_packets_invalid_reg[23]_i_1_n_11 ),
        .Q(STAT_RecvSessionPacketsInvalid[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_invalid_reg[21] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_invalid),
        .D(\stat_recv_session_packets_invalid_reg[23]_i_1_n_10 ),
        .Q(STAT_RecvSessionPacketsInvalid[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_invalid_reg[22] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_invalid),
        .D(\stat_recv_session_packets_invalid_reg[23]_i_1_n_9 ),
        .Q(STAT_RecvSessionPacketsInvalid[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_invalid_reg[23] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_invalid),
        .D(\stat_recv_session_packets_invalid_reg[23]_i_1_n_8 ),
        .Q(STAT_RecvSessionPacketsInvalid[23]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \stat_recv_session_packets_invalid_reg[23]_i_1 
       (.CI(\stat_recv_session_packets_invalid_reg[15]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\stat_recv_session_packets_invalid_reg[23]_i_1_n_0 ,\stat_recv_session_packets_invalid_reg[23]_i_1_n_1 ,\stat_recv_session_packets_invalid_reg[23]_i_1_n_2 ,\stat_recv_session_packets_invalid_reg[23]_i_1_n_3 ,\stat_recv_session_packets_invalid_reg[23]_i_1_n_4 ,\stat_recv_session_packets_invalid_reg[23]_i_1_n_5 ,\stat_recv_session_packets_invalid_reg[23]_i_1_n_6 ,\stat_recv_session_packets_invalid_reg[23]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\stat_recv_session_packets_invalid_reg[23]_i_1_n_8 ,\stat_recv_session_packets_invalid_reg[23]_i_1_n_9 ,\stat_recv_session_packets_invalid_reg[23]_i_1_n_10 ,\stat_recv_session_packets_invalid_reg[23]_i_1_n_11 ,\stat_recv_session_packets_invalid_reg[23]_i_1_n_12 ,\stat_recv_session_packets_invalid_reg[23]_i_1_n_13 ,\stat_recv_session_packets_invalid_reg[23]_i_1_n_14 ,\stat_recv_session_packets_invalid_reg[23]_i_1_n_15 }),
        .S(STAT_RecvSessionPacketsInvalid[23:16]));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_invalid_reg[24] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_invalid),
        .D(\stat_recv_session_packets_invalid_reg[31]_i_2_n_15 ),
        .Q(STAT_RecvSessionPacketsInvalid[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_invalid_reg[25] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_invalid),
        .D(\stat_recv_session_packets_invalid_reg[31]_i_2_n_14 ),
        .Q(STAT_RecvSessionPacketsInvalid[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_invalid_reg[26] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_invalid),
        .D(\stat_recv_session_packets_invalid_reg[31]_i_2_n_13 ),
        .Q(STAT_RecvSessionPacketsInvalid[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_invalid_reg[27] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_invalid),
        .D(\stat_recv_session_packets_invalid_reg[31]_i_2_n_12 ),
        .Q(STAT_RecvSessionPacketsInvalid[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_invalid_reg[28] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_invalid),
        .D(\stat_recv_session_packets_invalid_reg[31]_i_2_n_11 ),
        .Q(STAT_RecvSessionPacketsInvalid[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_invalid_reg[29] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_invalid),
        .D(\stat_recv_session_packets_invalid_reg[31]_i_2_n_10 ),
        .Q(STAT_RecvSessionPacketsInvalid[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_invalid_reg[2] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_invalid),
        .D(\stat_recv_session_packets_invalid_reg[7]_i_1_n_13 ),
        .Q(STAT_RecvSessionPacketsInvalid[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_invalid_reg[30] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_invalid),
        .D(\stat_recv_session_packets_invalid_reg[31]_i_2_n_9 ),
        .Q(STAT_RecvSessionPacketsInvalid[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_invalid_reg[31] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_invalid),
        .D(\stat_recv_session_packets_invalid_reg[31]_i_2_n_8 ),
        .Q(STAT_RecvSessionPacketsInvalid[31]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \stat_recv_session_packets_invalid_reg[31]_i_2 
       (.CI(\stat_recv_session_packets_invalid_reg[23]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\NLW_stat_recv_session_packets_invalid_reg[31]_i_2_CO_UNCONNECTED [7],\stat_recv_session_packets_invalid_reg[31]_i_2_n_1 ,\stat_recv_session_packets_invalid_reg[31]_i_2_n_2 ,\stat_recv_session_packets_invalid_reg[31]_i_2_n_3 ,\stat_recv_session_packets_invalid_reg[31]_i_2_n_4 ,\stat_recv_session_packets_invalid_reg[31]_i_2_n_5 ,\stat_recv_session_packets_invalid_reg[31]_i_2_n_6 ,\stat_recv_session_packets_invalid_reg[31]_i_2_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\stat_recv_session_packets_invalid_reg[31]_i_2_n_8 ,\stat_recv_session_packets_invalid_reg[31]_i_2_n_9 ,\stat_recv_session_packets_invalid_reg[31]_i_2_n_10 ,\stat_recv_session_packets_invalid_reg[31]_i_2_n_11 ,\stat_recv_session_packets_invalid_reg[31]_i_2_n_12 ,\stat_recv_session_packets_invalid_reg[31]_i_2_n_13 ,\stat_recv_session_packets_invalid_reg[31]_i_2_n_14 ,\stat_recv_session_packets_invalid_reg[31]_i_2_n_15 }),
        .S(STAT_RecvSessionPacketsInvalid[31:24]));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_invalid_reg[3] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_invalid),
        .D(\stat_recv_session_packets_invalid_reg[7]_i_1_n_12 ),
        .Q(STAT_RecvSessionPacketsInvalid[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_invalid_reg[4] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_invalid),
        .D(\stat_recv_session_packets_invalid_reg[7]_i_1_n_11 ),
        .Q(STAT_RecvSessionPacketsInvalid[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_invalid_reg[5] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_invalid),
        .D(\stat_recv_session_packets_invalid_reg[7]_i_1_n_10 ),
        .Q(STAT_RecvSessionPacketsInvalid[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_invalid_reg[6] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_invalid),
        .D(\stat_recv_session_packets_invalid_reg[7]_i_1_n_9 ),
        .Q(STAT_RecvSessionPacketsInvalid[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_invalid_reg[7] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_invalid),
        .D(\stat_recv_session_packets_invalid_reg[7]_i_1_n_8 ),
        .Q(STAT_RecvSessionPacketsInvalid[7]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \stat_recv_session_packets_invalid_reg[7]_i_1 
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({\stat_recv_session_packets_invalid_reg[7]_i_1_n_0 ,\stat_recv_session_packets_invalid_reg[7]_i_1_n_1 ,\stat_recv_session_packets_invalid_reg[7]_i_1_n_2 ,\stat_recv_session_packets_invalid_reg[7]_i_1_n_3 ,\stat_recv_session_packets_invalid_reg[7]_i_1_n_4 ,\stat_recv_session_packets_invalid_reg[7]_i_1_n_5 ,\stat_recv_session_packets_invalid_reg[7]_i_1_n_6 ,\stat_recv_session_packets_invalid_reg[7]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1}),
        .O({\stat_recv_session_packets_invalid_reg[7]_i_1_n_8 ,\stat_recv_session_packets_invalid_reg[7]_i_1_n_9 ,\stat_recv_session_packets_invalid_reg[7]_i_1_n_10 ,\stat_recv_session_packets_invalid_reg[7]_i_1_n_11 ,\stat_recv_session_packets_invalid_reg[7]_i_1_n_12 ,\stat_recv_session_packets_invalid_reg[7]_i_1_n_13 ,\stat_recv_session_packets_invalid_reg[7]_i_1_n_14 ,\stat_recv_session_packets_invalid_reg[7]_i_1_n_15 }),
        .S({STAT_RecvSessionPacketsInvalid[7:1],\stat_recv_session_packets_invalid[7]_i_2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_invalid_reg[8] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_invalid),
        .D(\stat_recv_session_packets_invalid_reg[15]_i_1_n_15 ),
        .Q(STAT_RecvSessionPacketsInvalid[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_invalid_reg[9] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_invalid),
        .D(\stat_recv_session_packets_invalid_reg[15]_i_1_n_14 ),
        .Q(STAT_RecvSessionPacketsInvalid[9]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hA2A2A2A2A2A2A2AA)) 
    \stat_recv_session_packets_valid[31]_i_1 
       (.I0(\DBG_recvHeaderChecksum[7]_i_1_n_0 ),
        .I1(\stat_recv_session_packets_valid[31]_i_3_n_0 ),
        .I2(\recvPacketHeaderBuffer_reg[0]_0 ),
        .I3(\stat_recv_session_packets_valid[31]_i_4_n_0 ),
        .I4(\stat_recv_session_packets_valid[31]_i_5_n_0 ),
        .I5(\stat_recv_session_packets_valid[31]_i_6_n_0 ),
        .O(stat_recv_session_packets_valid));
  (* SOFT_HLUTNM = "soft_lutpair111" *) 
  LUT4 #(
    .INIT(16'h956A)) 
    \stat_recv_session_packets_valid[31]_i_10 
       (.I0(DBG_recvPacketData[7]),
        .I1(D[11]),
        .I2(\stat_recv_session_packets_valid[31]_i_21_n_0 ),
        .I3(D[12]),
        .O(\stat_recv_session_packets_valid[31]_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \stat_recv_session_packets_valid[31]_i_11 
       (.I0(D[14]),
        .I1(D[12]),
        .I2(\stat_recv_session_packets_valid[31]_i_21_n_0 ),
        .I3(D[11]),
        .I4(D[13]),
        .O(\stat_recv_session_packets_valid[31]_i_11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair139" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \stat_recv_session_packets_valid[31]_i_12 
       (.I0(DBG_recvPacketData[9]),
        .I1(D[15]),
        .O(\stat_recv_session_packets_valid[31]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'hFEDFDFEFEFFDFDFE)) 
    \stat_recv_session_packets_valid[31]_i_13 
       (.I0(\recvPacketHeaderBuffer_reg[17]_0 ),
        .I1(\stat_recv_session_packets_valid[31]_i_22_n_0 ),
        .I2(D[10]),
        .I3(\stat_recv_session_packets_valid[31]_i_23_n_0 ),
        .I4(D[9]),
        .I5(DBG_recvPacketData[6]),
        .O(\stat_recv_session_packets_valid[31]_i_13_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair111" *) 
  LUT3 #(
    .INIT(8'h96)) 
    \stat_recv_session_packets_valid[31]_i_14 
       (.I0(\recvPacketHeaderBuffer_reg[19]_0 ),
        .I1(\stat_recv_session_packets_valid[31]_i_21_n_0 ),
        .I2(D[11]),
        .O(\stat_recv_session_packets_valid[31]_i_14_n_0 ));
  LUT5 #(
    .INIT(32'hE77BBDDE)) 
    \stat_recv_session_packets_valid[31]_i_15 
       (.I0(DBG_recvPacketData[8]),
        .I1(D[14]),
        .I2(\stat_recv_session_packets_valid[31]_i_24_n_0 ),
        .I3(D[13]),
        .I4(\recvPacketHeaderBuffer_reg[22]_0 ),
        .O(\stat_recv_session_packets_valid[31]_i_15_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \stat_recv_session_packets_valid[31]_i_16 
       (.I0(\recvPacketHeaderBuffer_reg[60]_0 ),
        .I1(\recvPacketHeaderBuffer_reg[57]_0 ),
        .I2(\recvPacketHeaderBuffer_reg[59]_0 ),
        .I3(\recvPacketHeaderBuffer_reg[58]_0 ),
        .O(\stat_recv_session_packets_valid[31]_i_16_n_0 ));
  LUT6 #(
    .INIT(64'h6FF6FFFFFFFF6FF6)) 
    \stat_recv_session_packets_valid[31]_i_17 
       (.I0(\DBG_recvHeaderChecksum[0]_i_1_n_0 ),
        .I1(\recvPacketHeaderBuffer_reg[40]_0 ),
        .I2(\recvPacketHeaderBuffer_reg[42]_0 ),
        .I3(CalcNetSessionPacketHeaderChecksum[2]),
        .I4(\recvPacketHeaderBuffer_reg[41]_0 ),
        .I5(CalcNetSessionPacketHeaderChecksum[1]),
        .O(\stat_recv_session_packets_valid[31]_i_17_n_0 ));
  LUT6 #(
    .INIT(64'h6AA955599556AAA6)) 
    \stat_recv_session_packets_valid[31]_i_18 
       (.I0(\recvPacketHeaderBuffer_reg[44]_0 ),
        .I1(\stat_recv_session_packets_valid[31]_i_25_n_0 ),
        .I2(\DBG_recvHeaderChecksum[4]_i_5_n_0 ),
        .I3(\DBG_recvHeaderChecksum[4]_i_4_n_0 ),
        .I4(\stat_recv_session_packets_valid[31]_i_26_n_0 ),
        .I5(\DBG_recvHeaderChecksum[4]_i_2_n_0 ),
        .O(\stat_recv_session_packets_valid[31]_i_18_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h69969669)) 
    \stat_recv_session_packets_valid[31]_i_19 
       (.I0(\DBG_recvHeaderChecksum[5]_i_6_n_0 ),
        .I1(\recvPacketHeaderBuffer_reg[14]_0 ),
        .I2(\DBG_recvHeaderChecksum[5]_i_4_n_0 ),
        .I3(\DBG_recvHeaderChecksum[5]_i_3_n_0 ),
        .I4(\DBG_recvHeaderChecksum[5]_i_2_n_0 ),
        .O(\stat_recv_session_packets_valid[31]_i_19_n_0 ));
  LUT5 #(
    .INIT(32'h96696996)) 
    \stat_recv_session_packets_valid[31]_i_20 
       (.I0(\recvPacketHeaderBuffer_reg[43]_0 ),
        .I1(\DBG_recvHeaderChecksum[4]_i_6_n_0 ),
        .I2(\stat_recv_session_packets_valid[31]_i_27_n_0 ),
        .I3(\DBG_recvHeaderChecksum[4]_i_4_n_0 ),
        .I4(\DBG_recvHeaderChecksum[4]_i_5_n_0 ),
        .O(\stat_recv_session_packets_valid[31]_i_20_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \stat_recv_session_packets_valid[31]_i_21 
       (.I0(D[10]),
        .I1(D[8]),
        .I2(D[6]),
        .I3(\stat_recv_session_packets_valid[31]_i_28_n_0 ),
        .I4(D[7]),
        .I5(D[9]),
        .O(\stat_recv_session_packets_valid[31]_i_21_n_0 ));
  LUT6 #(
    .INIT(64'hFEDFDFEFEFFDFDFE)) 
    \stat_recv_session_packets_valid[31]_i_22 
       (.I0(DBG_recvPacketData[5]),
        .I1(\stat_recv_session_packets_valid[31]_i_29_n_0 ),
        .I2(D[8]),
        .I3(\stat_recv_session_packets_valid[31]_i_30_n_0 ),
        .I4(D[7]),
        .I5(\recvPacketHeaderBuffer_reg[16]_0 ),
        .O(\stat_recv_session_packets_valid[31]_i_22_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair112" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \stat_recv_session_packets_valid[31]_i_23 
       (.I0(D[8]),
        .I1(D[6]),
        .I2(\stat_recv_session_packets_valid[31]_i_28_n_0 ),
        .I3(D[7]),
        .O(\stat_recv_session_packets_valid[31]_i_23_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \stat_recv_session_packets_valid[31]_i_24 
       (.I0(D[12]),
        .I1(\stat_recv_session_packets_valid[31]_i_21_n_0 ),
        .I2(D[11]),
        .O(\stat_recv_session_packets_valid[31]_i_24_n_0 ));
  LUT6 #(
    .INIT(64'hEFFFEFEFFFFFEFFF)) 
    \stat_recv_session_packets_valid[31]_i_25 
       (.I0(\DBG_recvHeaderChecksum[3]_i_3_n_0 ),
        .I1(\DBG_recvHeaderChecksum[2]_i_4_n_0 ),
        .I2(DBG_recvPacketData[2]),
        .I3(\DBG_recvHeaderChecksum[2]_i_3_n_0 ),
        .I4(\DBG_recvHeaderChecksum[2]_i_2_n_0 ),
        .I5(\recvPacketHeaderBuffer_reg[10]_0 ),
        .O(\stat_recv_session_packets_valid[31]_i_25_n_0 ));
  LUT6 #(
    .INIT(64'hDF4DDFDF4D4DDF4D)) 
    \stat_recv_session_packets_valid[31]_i_26 
       (.I0(\DBG_recvHeaderChecksum[2]_i_4_n_0 ),
        .I1(DBG_recvPacketData[2]),
        .I2(\DBG_recvHeaderChecksum[3]_i_3_n_0 ),
        .I3(\recvPacketHeaderBuffer_reg[10]_0 ),
        .I4(\DBG_recvHeaderChecksum[2]_i_2_n_0 ),
        .I5(\DBG_recvHeaderChecksum[2]_i_3_n_0 ),
        .O(\stat_recv_session_packets_valid[31]_i_26_n_0 ));
  LUT6 #(
    .INIT(64'hB2FF00B200B2B2FF)) 
    \stat_recv_session_packets_valid[31]_i_27 
       (.I0(\DBG_recvHeaderChecksum[2]_i_3_n_0 ),
        .I1(\DBG_recvHeaderChecksum[2]_i_2_n_0 ),
        .I2(\recvPacketHeaderBuffer_reg[10]_0 ),
        .I3(\DBG_recvHeaderChecksum[3]_i_3_n_0 ),
        .I4(DBG_recvPacketData[2]),
        .I5(\DBG_recvHeaderChecksum[2]_i_4_n_0 ),
        .O(\stat_recv_session_packets_valid[31]_i_27_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \stat_recv_session_packets_valid[31]_i_28 
       (.I0(D[5]),
        .I1(D[3]),
        .I2(D[0]),
        .I3(D[1]),
        .I4(D[2]),
        .I5(D[4]),
        .O(\stat_recv_session_packets_valid[31]_i_28_n_0 ));
  LUT6 #(
    .INIT(64'hFEBFBFEFEFFBFBFE)) 
    \stat_recv_session_packets_valid[31]_i_29 
       (.I0(\stat_recv_session_packets_valid[31]_i_31_n_0 ),
        .I1(DBG_recvPacketData[4]),
        .I2(D[6]),
        .I3(\stat_recv_session_packets_valid[31]_i_32_n_0 ),
        .I4(D[5]),
        .I5(\recvPacketHeaderBuffer_reg[14]_0 ),
        .O(\stat_recv_session_packets_valid[31]_i_29_n_0 ));
  LUT5 #(
    .INIT(32'h00000002)) 
    \stat_recv_session_packets_valid[31]_i_3 
       (.I0(\recvPacketHeaderBuffer_reg[5]_0 ),
        .I1(\recvPacketHeaderBuffer_reg[1]_0 ),
        .I2(\recvPacketHeaderBuffer_reg[2]_0 ),
        .I3(\recvPacketHeaderBuffer_reg[3]_0 ),
        .I4(\recvPacketHeaderBuffer_reg[4]_0 ),
        .O(\stat_recv_session_packets_valid[31]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair112" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \stat_recv_session_packets_valid[31]_i_30 
       (.I0(D[6]),
        .I1(\stat_recv_session_packets_valid[31]_i_28_n_0 ),
        .O(\stat_recv_session_packets_valid[31]_i_30_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFF96F6FF6)) 
    \stat_recv_session_packets_valid[31]_i_31 
       (.I0(D[4]),
        .I1(DBG_recvPacketData[3]),
        .I2(DBG_recvPacketData[2]),
        .I3(\stat_recv_session_packets_valid[31]_i_33_n_0 ),
        .I4(D[3]),
        .I5(\stat_recv_session_packets_valid[31]_i_34_n_0 ),
        .O(\stat_recv_session_packets_valid[31]_i_31_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \stat_recv_session_packets_valid[31]_i_32 
       (.I0(D[4]),
        .I1(D[2]),
        .I2(D[1]),
        .I3(D[0]),
        .I4(D[3]),
        .O(\stat_recv_session_packets_valid[31]_i_32_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \stat_recv_session_packets_valid[31]_i_33 
       (.I0(D[2]),
        .I1(D[1]),
        .I2(D[0]),
        .O(\stat_recv_session_packets_valid[31]_i_33_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF6FF6DBBDFFFF)) 
    \stat_recv_session_packets_valid[31]_i_34 
       (.I0(\recvPacketHeaderBuffer_reg[9]_0 ),
        .I1(D[1]),
        .I2(\recvPacketHeaderBuffer_reg[10]_0 ),
        .I3(D[2]),
        .I4(D[0]),
        .I5(DBG_recvPacketData[1]),
        .O(\stat_recv_session_packets_valid[31]_i_34_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFF9696FF)) 
    \stat_recv_session_packets_valid[31]_i_4 
       (.I0(\stat_recv_session_packets_valid[31]_i_7_n_0 ),
        .I1(\stat_recv_session_packets_valid[31]_i_8_n_0 ),
        .I2(\recvPacketHeaderBuffer_reg[47]_0 ),
        .I3(\recvPacketHeaderBuffer_reg[46]_0 ),
        .I4(\DBG_recvHeaderChecksum[6]_i_2_n_0 ),
        .I5(\stat_recv_session_packets_valid[31]_i_9_n_0 ),
        .O(\stat_recv_session_packets_valid[31]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFBE)) 
    \stat_recv_session_packets_valid[31]_i_5 
       (.I0(\stat_recv_session_packets_valid[31]_i_10_n_0 ),
        .I1(\stat_recv_session_packets_valid[31]_i_11_n_0 ),
        .I2(\stat_recv_session_packets_valid[31]_i_12_n_0 ),
        .I3(\stat_recv_session_packets_valid[31]_i_13_n_0 ),
        .I4(\stat_recv_session_packets_valid[31]_i_14_n_0 ),
        .I5(\stat_recv_session_packets_valid[31]_i_15_n_0 ),
        .O(\stat_recv_session_packets_valid[31]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT4 #(
    .INIT(16'hE0A0)) 
    \stat_recv_session_packets_valid[31]_i_6 
       (.I0(\recvPacketHeaderBuffer_reg[62]_0 ),
        .I1(\recvPacketHeaderBuffer_reg[61]_0 ),
        .I2(\recvPacketHeaderBuffer_reg[63]_0 ),
        .I3(\stat_recv_session_packets_valid[31]_i_16_n_0 ),
        .O(\stat_recv_session_packets_valid[31]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h10515175517575F7)) 
    \stat_recv_session_packets_valid[31]_i_7 
       (.I0(\DBG_recvHeaderChecksum[6]_i_3_n_0 ),
        .I1(\DBG_recvHeaderChecksum[5]_i_6_n_0 ),
        .I2(\DBG_recvHeaderChecksum[5]_i_2_n_0 ),
        .I3(\DBG_recvHeaderChecksum[6]_i_4_n_0 ),
        .I4(\recvPacketHeaderBuffer_reg[14]_0 ),
        .I5(\DBG_recvHeaderChecksum[5]_i_5_n_0 ),
        .O(\stat_recv_session_packets_valid[31]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h693CC369C36996C3)) 
    \stat_recv_session_packets_valid[31]_i_8 
       (.I0(\DBG_recvHeaderChecksum[7]_i_6_n_0 ),
        .I1(\DBG_recvHeaderChecksum[7]_i_11_n_0 ),
        .I2(\DBG_recvHeaderChecksum[7]_i_10_n_0 ),
        .I3(DBG_recvPacketData[5]),
        .I4(\DBG_recvHeaderChecksum[7]_i_9_n_0 ),
        .I5(\DBG_recvHeaderChecksum[7]_i_8_n_0 ),
        .O(\stat_recv_session_packets_valid[31]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFEEFEFFE)) 
    \stat_recv_session_packets_valid[31]_i_9 
       (.I0(\stat_recv_session_packets_valid[31]_i_17_n_0 ),
        .I1(\stat_recv_session_packets_valid[31]_i_18_n_0 ),
        .I2(\DBG_recvHeaderChecksum[5]_i_5_n_0 ),
        .I3(\stat_recv_session_packets_valid[31]_i_19_n_0 ),
        .I4(\recvPacketHeaderBuffer_reg[45]_0 ),
        .I5(\stat_recv_session_packets_valid[31]_i_20_n_0 ),
        .O(\stat_recv_session_packets_valid[31]_i_9_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \stat_recv_session_packets_valid[7]_i_2 
       (.I0(STAT_RecvSessionPacketsValid[0]),
        .O(\stat_recv_session_packets_valid[7]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_valid_reg[0] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_valid),
        .D(\stat_recv_session_packets_valid_reg[7]_i_1_n_15 ),
        .Q(STAT_RecvSessionPacketsValid[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_valid_reg[10] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_valid),
        .D(\stat_recv_session_packets_valid_reg[15]_i_1_n_13 ),
        .Q(STAT_RecvSessionPacketsValid[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_valid_reg[11] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_valid),
        .D(\stat_recv_session_packets_valid_reg[15]_i_1_n_12 ),
        .Q(STAT_RecvSessionPacketsValid[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_valid_reg[12] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_valid),
        .D(\stat_recv_session_packets_valid_reg[15]_i_1_n_11 ),
        .Q(STAT_RecvSessionPacketsValid[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_valid_reg[13] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_valid),
        .D(\stat_recv_session_packets_valid_reg[15]_i_1_n_10 ),
        .Q(STAT_RecvSessionPacketsValid[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_valid_reg[14] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_valid),
        .D(\stat_recv_session_packets_valid_reg[15]_i_1_n_9 ),
        .Q(STAT_RecvSessionPacketsValid[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_valid_reg[15] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_valid),
        .D(\stat_recv_session_packets_valid_reg[15]_i_1_n_8 ),
        .Q(STAT_RecvSessionPacketsValid[15]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \stat_recv_session_packets_valid_reg[15]_i_1 
       (.CI(\stat_recv_session_packets_valid_reg[7]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\stat_recv_session_packets_valid_reg[15]_i_1_n_0 ,\stat_recv_session_packets_valid_reg[15]_i_1_n_1 ,\stat_recv_session_packets_valid_reg[15]_i_1_n_2 ,\stat_recv_session_packets_valid_reg[15]_i_1_n_3 ,\stat_recv_session_packets_valid_reg[15]_i_1_n_4 ,\stat_recv_session_packets_valid_reg[15]_i_1_n_5 ,\stat_recv_session_packets_valid_reg[15]_i_1_n_6 ,\stat_recv_session_packets_valid_reg[15]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\stat_recv_session_packets_valid_reg[15]_i_1_n_8 ,\stat_recv_session_packets_valid_reg[15]_i_1_n_9 ,\stat_recv_session_packets_valid_reg[15]_i_1_n_10 ,\stat_recv_session_packets_valid_reg[15]_i_1_n_11 ,\stat_recv_session_packets_valid_reg[15]_i_1_n_12 ,\stat_recv_session_packets_valid_reg[15]_i_1_n_13 ,\stat_recv_session_packets_valid_reg[15]_i_1_n_14 ,\stat_recv_session_packets_valid_reg[15]_i_1_n_15 }),
        .S(STAT_RecvSessionPacketsValid[15:8]));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_valid_reg[16] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_valid),
        .D(\stat_recv_session_packets_valid_reg[23]_i_1_n_15 ),
        .Q(STAT_RecvSessionPacketsValid[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_valid_reg[17] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_valid),
        .D(\stat_recv_session_packets_valid_reg[23]_i_1_n_14 ),
        .Q(STAT_RecvSessionPacketsValid[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_valid_reg[18] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_valid),
        .D(\stat_recv_session_packets_valid_reg[23]_i_1_n_13 ),
        .Q(STAT_RecvSessionPacketsValid[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_valid_reg[19] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_valid),
        .D(\stat_recv_session_packets_valid_reg[23]_i_1_n_12 ),
        .Q(STAT_RecvSessionPacketsValid[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_valid_reg[1] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_valid),
        .D(\stat_recv_session_packets_valid_reg[7]_i_1_n_14 ),
        .Q(STAT_RecvSessionPacketsValid[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_valid_reg[20] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_valid),
        .D(\stat_recv_session_packets_valid_reg[23]_i_1_n_11 ),
        .Q(STAT_RecvSessionPacketsValid[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_valid_reg[21] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_valid),
        .D(\stat_recv_session_packets_valid_reg[23]_i_1_n_10 ),
        .Q(STAT_RecvSessionPacketsValid[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_valid_reg[22] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_valid),
        .D(\stat_recv_session_packets_valid_reg[23]_i_1_n_9 ),
        .Q(STAT_RecvSessionPacketsValid[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_valid_reg[23] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_valid),
        .D(\stat_recv_session_packets_valid_reg[23]_i_1_n_8 ),
        .Q(STAT_RecvSessionPacketsValid[23]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \stat_recv_session_packets_valid_reg[23]_i_1 
       (.CI(\stat_recv_session_packets_valid_reg[15]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\stat_recv_session_packets_valid_reg[23]_i_1_n_0 ,\stat_recv_session_packets_valid_reg[23]_i_1_n_1 ,\stat_recv_session_packets_valid_reg[23]_i_1_n_2 ,\stat_recv_session_packets_valid_reg[23]_i_1_n_3 ,\stat_recv_session_packets_valid_reg[23]_i_1_n_4 ,\stat_recv_session_packets_valid_reg[23]_i_1_n_5 ,\stat_recv_session_packets_valid_reg[23]_i_1_n_6 ,\stat_recv_session_packets_valid_reg[23]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\stat_recv_session_packets_valid_reg[23]_i_1_n_8 ,\stat_recv_session_packets_valid_reg[23]_i_1_n_9 ,\stat_recv_session_packets_valid_reg[23]_i_1_n_10 ,\stat_recv_session_packets_valid_reg[23]_i_1_n_11 ,\stat_recv_session_packets_valid_reg[23]_i_1_n_12 ,\stat_recv_session_packets_valid_reg[23]_i_1_n_13 ,\stat_recv_session_packets_valid_reg[23]_i_1_n_14 ,\stat_recv_session_packets_valid_reg[23]_i_1_n_15 }),
        .S(STAT_RecvSessionPacketsValid[23:16]));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_valid_reg[24] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_valid),
        .D(\stat_recv_session_packets_valid_reg[31]_i_2_n_15 ),
        .Q(STAT_RecvSessionPacketsValid[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_valid_reg[25] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_valid),
        .D(\stat_recv_session_packets_valid_reg[31]_i_2_n_14 ),
        .Q(STAT_RecvSessionPacketsValid[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_valid_reg[26] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_valid),
        .D(\stat_recv_session_packets_valid_reg[31]_i_2_n_13 ),
        .Q(STAT_RecvSessionPacketsValid[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_valid_reg[27] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_valid),
        .D(\stat_recv_session_packets_valid_reg[31]_i_2_n_12 ),
        .Q(STAT_RecvSessionPacketsValid[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_valid_reg[28] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_valid),
        .D(\stat_recv_session_packets_valid_reg[31]_i_2_n_11 ),
        .Q(STAT_RecvSessionPacketsValid[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_valid_reg[29] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_valid),
        .D(\stat_recv_session_packets_valid_reg[31]_i_2_n_10 ),
        .Q(STAT_RecvSessionPacketsValid[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_valid_reg[2] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_valid),
        .D(\stat_recv_session_packets_valid_reg[7]_i_1_n_13 ),
        .Q(STAT_RecvSessionPacketsValid[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_valid_reg[30] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_valid),
        .D(\stat_recv_session_packets_valid_reg[31]_i_2_n_9 ),
        .Q(STAT_RecvSessionPacketsValid[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_valid_reg[31] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_valid),
        .D(\stat_recv_session_packets_valid_reg[31]_i_2_n_8 ),
        .Q(STAT_RecvSessionPacketsValid[31]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \stat_recv_session_packets_valid_reg[31]_i_2 
       (.CI(\stat_recv_session_packets_valid_reg[23]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\NLW_stat_recv_session_packets_valid_reg[31]_i_2_CO_UNCONNECTED [7],\stat_recv_session_packets_valid_reg[31]_i_2_n_1 ,\stat_recv_session_packets_valid_reg[31]_i_2_n_2 ,\stat_recv_session_packets_valid_reg[31]_i_2_n_3 ,\stat_recv_session_packets_valid_reg[31]_i_2_n_4 ,\stat_recv_session_packets_valid_reg[31]_i_2_n_5 ,\stat_recv_session_packets_valid_reg[31]_i_2_n_6 ,\stat_recv_session_packets_valid_reg[31]_i_2_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\stat_recv_session_packets_valid_reg[31]_i_2_n_8 ,\stat_recv_session_packets_valid_reg[31]_i_2_n_9 ,\stat_recv_session_packets_valid_reg[31]_i_2_n_10 ,\stat_recv_session_packets_valid_reg[31]_i_2_n_11 ,\stat_recv_session_packets_valid_reg[31]_i_2_n_12 ,\stat_recv_session_packets_valid_reg[31]_i_2_n_13 ,\stat_recv_session_packets_valid_reg[31]_i_2_n_14 ,\stat_recv_session_packets_valid_reg[31]_i_2_n_15 }),
        .S(STAT_RecvSessionPacketsValid[31:24]));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_valid_reg[3] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_valid),
        .D(\stat_recv_session_packets_valid_reg[7]_i_1_n_12 ),
        .Q(STAT_RecvSessionPacketsValid[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_valid_reg[4] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_valid),
        .D(\stat_recv_session_packets_valid_reg[7]_i_1_n_11 ),
        .Q(STAT_RecvSessionPacketsValid[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_valid_reg[5] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_valid),
        .D(\stat_recv_session_packets_valid_reg[7]_i_1_n_10 ),
        .Q(STAT_RecvSessionPacketsValid[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_valid_reg[6] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_valid),
        .D(\stat_recv_session_packets_valid_reg[7]_i_1_n_9 ),
        .Q(STAT_RecvSessionPacketsValid[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_valid_reg[7] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_valid),
        .D(\stat_recv_session_packets_valid_reg[7]_i_1_n_8 ),
        .Q(STAT_RecvSessionPacketsValid[7]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \stat_recv_session_packets_valid_reg[7]_i_1 
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({\stat_recv_session_packets_valid_reg[7]_i_1_n_0 ,\stat_recv_session_packets_valid_reg[7]_i_1_n_1 ,\stat_recv_session_packets_valid_reg[7]_i_1_n_2 ,\stat_recv_session_packets_valid_reg[7]_i_1_n_3 ,\stat_recv_session_packets_valid_reg[7]_i_1_n_4 ,\stat_recv_session_packets_valid_reg[7]_i_1_n_5 ,\stat_recv_session_packets_valid_reg[7]_i_1_n_6 ,\stat_recv_session_packets_valid_reg[7]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1}),
        .O({\stat_recv_session_packets_valid_reg[7]_i_1_n_8 ,\stat_recv_session_packets_valid_reg[7]_i_1_n_9 ,\stat_recv_session_packets_valid_reg[7]_i_1_n_10 ,\stat_recv_session_packets_valid_reg[7]_i_1_n_11 ,\stat_recv_session_packets_valid_reg[7]_i_1_n_12 ,\stat_recv_session_packets_valid_reg[7]_i_1_n_13 ,\stat_recv_session_packets_valid_reg[7]_i_1_n_14 ,\stat_recv_session_packets_valid_reg[7]_i_1_n_15 }),
        .S({STAT_RecvSessionPacketsValid[7:1],\stat_recv_session_packets_valid[7]_i_2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_valid_reg[8] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_valid),
        .D(\stat_recv_session_packets_valid_reg[15]_i_1_n_15 ),
        .Q(STAT_RecvSessionPacketsValid[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_recv_session_packets_valid_reg[9] 
       (.C(clk333_250),
        .CE(stat_recv_session_packets_valid),
        .D(\stat_recv_session_packets_valid_reg[15]_i_1_n_14 ),
        .Q(STAT_RecvSessionPacketsValid[9]),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h00000080)) 
    \stat_send_session_packets[31]_i_1 
       (.I0(sendPacketState__0),
        .I1(sendHasRepliedSuccessfulConnection),
        .I2(currentState__0[0]),
        .I3(\FSM_sequential_sendPacketState_reg_n_0_[1] ),
        .I4(\FSM_sequential_sendPacketState_reg_n_0_[0] ),
        .O(\sendLastSentPacketHeader[packetChecksum] ));
  LUT1 #(
    .INIT(2'h1)) 
    \stat_send_session_packets[7]_i_2 
       (.I0(STAT_SendSessionPackets[0]),
        .O(\stat_send_session_packets[7]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \stat_send_session_packets_reg[0] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[packetChecksum] ),
        .D(\stat_send_session_packets_reg[7]_i_1_n_15 ),
        .Q(STAT_SendSessionPackets[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_send_session_packets_reg[10] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[packetChecksum] ),
        .D(\stat_send_session_packets_reg[15]_i_1_n_13 ),
        .Q(STAT_SendSessionPackets[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_send_session_packets_reg[11] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[packetChecksum] ),
        .D(\stat_send_session_packets_reg[15]_i_1_n_12 ),
        .Q(STAT_SendSessionPackets[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_send_session_packets_reg[12] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[packetChecksum] ),
        .D(\stat_send_session_packets_reg[15]_i_1_n_11 ),
        .Q(STAT_SendSessionPackets[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_send_session_packets_reg[13] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[packetChecksum] ),
        .D(\stat_send_session_packets_reg[15]_i_1_n_10 ),
        .Q(STAT_SendSessionPackets[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_send_session_packets_reg[14] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[packetChecksum] ),
        .D(\stat_send_session_packets_reg[15]_i_1_n_9 ),
        .Q(STAT_SendSessionPackets[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_send_session_packets_reg[15] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[packetChecksum] ),
        .D(\stat_send_session_packets_reg[15]_i_1_n_8 ),
        .Q(STAT_SendSessionPackets[15]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \stat_send_session_packets_reg[15]_i_1 
       (.CI(\stat_send_session_packets_reg[7]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\stat_send_session_packets_reg[15]_i_1_n_0 ,\stat_send_session_packets_reg[15]_i_1_n_1 ,\stat_send_session_packets_reg[15]_i_1_n_2 ,\stat_send_session_packets_reg[15]_i_1_n_3 ,\stat_send_session_packets_reg[15]_i_1_n_4 ,\stat_send_session_packets_reg[15]_i_1_n_5 ,\stat_send_session_packets_reg[15]_i_1_n_6 ,\stat_send_session_packets_reg[15]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\stat_send_session_packets_reg[15]_i_1_n_8 ,\stat_send_session_packets_reg[15]_i_1_n_9 ,\stat_send_session_packets_reg[15]_i_1_n_10 ,\stat_send_session_packets_reg[15]_i_1_n_11 ,\stat_send_session_packets_reg[15]_i_1_n_12 ,\stat_send_session_packets_reg[15]_i_1_n_13 ,\stat_send_session_packets_reg[15]_i_1_n_14 ,\stat_send_session_packets_reg[15]_i_1_n_15 }),
        .S(STAT_SendSessionPackets[15:8]));
  FDRE #(
    .INIT(1'b0)) 
    \stat_send_session_packets_reg[16] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[packetChecksum] ),
        .D(\stat_send_session_packets_reg[23]_i_1_n_15 ),
        .Q(STAT_SendSessionPackets[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_send_session_packets_reg[17] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[packetChecksum] ),
        .D(\stat_send_session_packets_reg[23]_i_1_n_14 ),
        .Q(STAT_SendSessionPackets[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_send_session_packets_reg[18] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[packetChecksum] ),
        .D(\stat_send_session_packets_reg[23]_i_1_n_13 ),
        .Q(STAT_SendSessionPackets[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_send_session_packets_reg[19] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[packetChecksum] ),
        .D(\stat_send_session_packets_reg[23]_i_1_n_12 ),
        .Q(STAT_SendSessionPackets[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_send_session_packets_reg[1] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[packetChecksum] ),
        .D(\stat_send_session_packets_reg[7]_i_1_n_14 ),
        .Q(STAT_SendSessionPackets[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_send_session_packets_reg[20] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[packetChecksum] ),
        .D(\stat_send_session_packets_reg[23]_i_1_n_11 ),
        .Q(STAT_SendSessionPackets[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_send_session_packets_reg[21] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[packetChecksum] ),
        .D(\stat_send_session_packets_reg[23]_i_1_n_10 ),
        .Q(STAT_SendSessionPackets[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_send_session_packets_reg[22] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[packetChecksum] ),
        .D(\stat_send_session_packets_reg[23]_i_1_n_9 ),
        .Q(STAT_SendSessionPackets[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_send_session_packets_reg[23] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[packetChecksum] ),
        .D(\stat_send_session_packets_reg[23]_i_1_n_8 ),
        .Q(STAT_SendSessionPackets[23]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \stat_send_session_packets_reg[23]_i_1 
       (.CI(\stat_send_session_packets_reg[15]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\stat_send_session_packets_reg[23]_i_1_n_0 ,\stat_send_session_packets_reg[23]_i_1_n_1 ,\stat_send_session_packets_reg[23]_i_1_n_2 ,\stat_send_session_packets_reg[23]_i_1_n_3 ,\stat_send_session_packets_reg[23]_i_1_n_4 ,\stat_send_session_packets_reg[23]_i_1_n_5 ,\stat_send_session_packets_reg[23]_i_1_n_6 ,\stat_send_session_packets_reg[23]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\stat_send_session_packets_reg[23]_i_1_n_8 ,\stat_send_session_packets_reg[23]_i_1_n_9 ,\stat_send_session_packets_reg[23]_i_1_n_10 ,\stat_send_session_packets_reg[23]_i_1_n_11 ,\stat_send_session_packets_reg[23]_i_1_n_12 ,\stat_send_session_packets_reg[23]_i_1_n_13 ,\stat_send_session_packets_reg[23]_i_1_n_14 ,\stat_send_session_packets_reg[23]_i_1_n_15 }),
        .S(STAT_SendSessionPackets[23:16]));
  FDRE #(
    .INIT(1'b0)) 
    \stat_send_session_packets_reg[24] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[packetChecksum] ),
        .D(\stat_send_session_packets_reg[31]_i_2_n_15 ),
        .Q(STAT_SendSessionPackets[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_send_session_packets_reg[25] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[packetChecksum] ),
        .D(\stat_send_session_packets_reg[31]_i_2_n_14 ),
        .Q(STAT_SendSessionPackets[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_send_session_packets_reg[26] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[packetChecksum] ),
        .D(\stat_send_session_packets_reg[31]_i_2_n_13 ),
        .Q(STAT_SendSessionPackets[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_send_session_packets_reg[27] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[packetChecksum] ),
        .D(\stat_send_session_packets_reg[31]_i_2_n_12 ),
        .Q(STAT_SendSessionPackets[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_send_session_packets_reg[28] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[packetChecksum] ),
        .D(\stat_send_session_packets_reg[31]_i_2_n_11 ),
        .Q(STAT_SendSessionPackets[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_send_session_packets_reg[29] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[packetChecksum] ),
        .D(\stat_send_session_packets_reg[31]_i_2_n_10 ),
        .Q(STAT_SendSessionPackets[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_send_session_packets_reg[2] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[packetChecksum] ),
        .D(\stat_send_session_packets_reg[7]_i_1_n_13 ),
        .Q(STAT_SendSessionPackets[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_send_session_packets_reg[30] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[packetChecksum] ),
        .D(\stat_send_session_packets_reg[31]_i_2_n_9 ),
        .Q(STAT_SendSessionPackets[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_send_session_packets_reg[31] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[packetChecksum] ),
        .D(\stat_send_session_packets_reg[31]_i_2_n_8 ),
        .Q(STAT_SendSessionPackets[31]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \stat_send_session_packets_reg[31]_i_2 
       (.CI(\stat_send_session_packets_reg[23]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\NLW_stat_send_session_packets_reg[31]_i_2_CO_UNCONNECTED [7],\stat_send_session_packets_reg[31]_i_2_n_1 ,\stat_send_session_packets_reg[31]_i_2_n_2 ,\stat_send_session_packets_reg[31]_i_2_n_3 ,\stat_send_session_packets_reg[31]_i_2_n_4 ,\stat_send_session_packets_reg[31]_i_2_n_5 ,\stat_send_session_packets_reg[31]_i_2_n_6 ,\stat_send_session_packets_reg[31]_i_2_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\stat_send_session_packets_reg[31]_i_2_n_8 ,\stat_send_session_packets_reg[31]_i_2_n_9 ,\stat_send_session_packets_reg[31]_i_2_n_10 ,\stat_send_session_packets_reg[31]_i_2_n_11 ,\stat_send_session_packets_reg[31]_i_2_n_12 ,\stat_send_session_packets_reg[31]_i_2_n_13 ,\stat_send_session_packets_reg[31]_i_2_n_14 ,\stat_send_session_packets_reg[31]_i_2_n_15 }),
        .S(STAT_SendSessionPackets[31:24]));
  FDRE #(
    .INIT(1'b0)) 
    \stat_send_session_packets_reg[3] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[packetChecksum] ),
        .D(\stat_send_session_packets_reg[7]_i_1_n_12 ),
        .Q(STAT_SendSessionPackets[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_send_session_packets_reg[4] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[packetChecksum] ),
        .D(\stat_send_session_packets_reg[7]_i_1_n_11 ),
        .Q(STAT_SendSessionPackets[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_send_session_packets_reg[5] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[packetChecksum] ),
        .D(\stat_send_session_packets_reg[7]_i_1_n_10 ),
        .Q(STAT_SendSessionPackets[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_send_session_packets_reg[6] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[packetChecksum] ),
        .D(\stat_send_session_packets_reg[7]_i_1_n_9 ),
        .Q(STAT_SendSessionPackets[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_send_session_packets_reg[7] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[packetChecksum] ),
        .D(\stat_send_session_packets_reg[7]_i_1_n_8 ),
        .Q(STAT_SendSessionPackets[7]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \stat_send_session_packets_reg[7]_i_1 
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({\stat_send_session_packets_reg[7]_i_1_n_0 ,\stat_send_session_packets_reg[7]_i_1_n_1 ,\stat_send_session_packets_reg[7]_i_1_n_2 ,\stat_send_session_packets_reg[7]_i_1_n_3 ,\stat_send_session_packets_reg[7]_i_1_n_4 ,\stat_send_session_packets_reg[7]_i_1_n_5 ,\stat_send_session_packets_reg[7]_i_1_n_6 ,\stat_send_session_packets_reg[7]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1}),
        .O({\stat_send_session_packets_reg[7]_i_1_n_8 ,\stat_send_session_packets_reg[7]_i_1_n_9 ,\stat_send_session_packets_reg[7]_i_1_n_10 ,\stat_send_session_packets_reg[7]_i_1_n_11 ,\stat_send_session_packets_reg[7]_i_1_n_12 ,\stat_send_session_packets_reg[7]_i_1_n_13 ,\stat_send_session_packets_reg[7]_i_1_n_14 ,\stat_send_session_packets_reg[7]_i_1_n_15 }),
        .S({STAT_SendSessionPackets[7:1],\stat_send_session_packets[7]_i_2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \stat_send_session_packets_reg[8] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[packetChecksum] ),
        .D(\stat_send_session_packets_reg[15]_i_1_n_15 ),
        .Q(STAT_SendSessionPackets[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stat_send_session_packets_reg[9] 
       (.C(clk333_250),
        .CE(\sendLastSentPacketHeader[packetChecksum] ),
        .D(\stat_send_session_packets_reg[15]_i_1_n_14 ),
        .Q(STAT_SendSessionPackets[9]),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h08000000)) 
    \validPacketsFIFO_wr_data[87]_i_1 
       (.I0(currentState__0[0]),
        .I1(sendHasRepliedSuccessfulConnection),
        .I2(recvPumpFIFO_reg_n_0),
        .I3(recvParseState__0[2]),
        .I4(recvParseState__0[0]),
        .O(\validPacketsFIFO_wr_data[87]_i_1_n_0 ));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[16] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[0]),
        .Q(validPacketsFIFO_wr_data[1]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[17] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[1]),
        .Q(validPacketsFIFO_wr_data[2]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[18] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[2]),
        .Q(validPacketsFIFO_wr_data[3]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[19] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[3]),
        .Q(validPacketsFIFO_wr_data[4]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[20] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[4]),
        .Q(validPacketsFIFO_wr_data[5]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[21] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[5]),
        .Q(validPacketsFIFO_wr_data[6]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[22] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[6]),
        .Q(validPacketsFIFO_wr_data[7]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[23] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[7]),
        .Q(validPacketsFIFO_wr_data[8]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[24] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[8]),
        .Q(validPacketsFIFO_wr_data[9]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[25] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[9]),
        .Q(validPacketsFIFO_wr_data[10]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[26] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[10]),
        .Q(validPacketsFIFO_wr_data[11]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[27] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[11]),
        .Q(validPacketsFIFO_wr_data[12]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[28] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[12]),
        .Q(validPacketsFIFO_wr_data[13]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[29] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[13]),
        .Q(validPacketsFIFO_wr_data[14]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[30] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[14]),
        .Q(validPacketsFIFO_wr_data[15]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[31] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[15]),
        .Q(validPacketsFIFO_wr_data[16]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[32] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[16]),
        .Q(validPacketsFIFO_wr_data[17]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[33] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[17]),
        .Q(validPacketsFIFO_wr_data[18]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[34] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[18]),
        .Q(validPacketsFIFO_wr_data[19]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[35] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[19]),
        .Q(validPacketsFIFO_wr_data[20]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[36] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[20]),
        .Q(validPacketsFIFO_wr_data[21]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[37] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[21]),
        .Q(validPacketsFIFO_wr_data[22]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[38] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[22]),
        .Q(validPacketsFIFO_wr_data[23]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[39] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[23]),
        .Q(validPacketsFIFO_wr_data[24]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[40] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[24]),
        .Q(validPacketsFIFO_wr_data[25]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[41] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[25]),
        .Q(validPacketsFIFO_wr_data[26]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[42] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[26]),
        .Q(validPacketsFIFO_wr_data[27]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[43] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[27]),
        .Q(validPacketsFIFO_wr_data[28]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[44] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[28]),
        .Q(validPacketsFIFO_wr_data[29]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[45] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[29]),
        .Q(validPacketsFIFO_wr_data[30]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[46] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[30]),
        .Q(validPacketsFIFO_wr_data[31]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[47] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[31]),
        .Q(validPacketsFIFO_wr_data[32]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[48] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[32]),
        .Q(validPacketsFIFO_wr_data[33]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[49] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[33]),
        .Q(validPacketsFIFO_wr_data[34]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[50] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[34]),
        .Q(validPacketsFIFO_wr_data[35]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[51] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[35]),
        .Q(validPacketsFIFO_wr_data[36]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[52] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[36]),
        .Q(validPacketsFIFO_wr_data[37]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[53] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[37]),
        .Q(validPacketsFIFO_wr_data[38]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[54] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[38]),
        .Q(validPacketsFIFO_wr_data[39]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[55] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[39]),
        .Q(validPacketsFIFO_wr_data[40]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[56] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[40]),
        .Q(validPacketsFIFO_wr_data[41]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[57] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[41]),
        .Q(validPacketsFIFO_wr_data[42]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[58] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[42]),
        .Q(validPacketsFIFO_wr_data[43]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[59] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[43]),
        .Q(validPacketsFIFO_wr_data[44]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[60] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[44]),
        .Q(validPacketsFIFO_wr_data[45]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[61] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[45]),
        .Q(validPacketsFIFO_wr_data[46]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[62] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[46]),
        .Q(validPacketsFIFO_wr_data[47]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[63] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[47]),
        .Q(validPacketsFIFO_wr_data[48]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[64] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[48]),
        .Q(validPacketsFIFO_wr_data[49]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[65] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[49]),
        .Q(validPacketsFIFO_wr_data[50]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[66] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[50]),
        .Q(validPacketsFIFO_wr_data[51]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[67] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[51]),
        .Q(validPacketsFIFO_wr_data[52]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[68] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[52]),
        .Q(validPacketsFIFO_wr_data[53]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[69] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[53]),
        .Q(validPacketsFIFO_wr_data[54]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[6] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(1'b1),
        .Q(validPacketsFIFO_wr_data[0]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[70] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[54]),
        .Q(validPacketsFIFO_wr_data[55]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[71] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[55]),
        .Q(validPacketsFIFO_wr_data[56]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[72] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[56]),
        .Q(validPacketsFIFO_wr_data[57]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[73] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[57]),
        .Q(validPacketsFIFO_wr_data[58]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[74] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[58]),
        .Q(validPacketsFIFO_wr_data[59]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[75] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[59]),
        .Q(validPacketsFIFO_wr_data[60]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[76] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[60]),
        .Q(validPacketsFIFO_wr_data[61]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[77] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[61]),
        .Q(validPacketsFIFO_wr_data[62]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[78] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[62]),
        .Q(validPacketsFIFO_wr_data[63]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[79] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[63]),
        .Q(validPacketsFIFO_wr_data[64]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[80] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[64]),
        .Q(validPacketsFIFO_wr_data[65]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[81] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[65]),
        .Q(validPacketsFIFO_wr_data[66]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[82] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[66]),
        .Q(validPacketsFIFO_wr_data[67]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[83] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[67]),
        .Q(validPacketsFIFO_wr_data[68]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[84] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[68]),
        .Q(validPacketsFIFO_wr_data[69]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[85] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[69]),
        .Q(validPacketsFIFO_wr_data[70]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[86] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[70]),
        .Q(validPacketsFIFO_wr_data[71]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA" *) 
  (* x_interface_mode = "master" *) 
  FDRE #(
    .INIT(1'b0)) 
    \validPacketsFIFO_wr_data_reg[87] 
       (.C(clk333_250),
        .CE(\validPacketsFIFO_wr_data[87]_i_1_n_0 ),
        .D(DBG_recvCurrentSubpacket[71]),
        .Q(validPacketsFIFO_wr_data[72]),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h80FF8000)) 
    validPacketsFIFO_wr_en_i_1
       (.I0(recvParseState__0[0]),
        .I1(recvPacketAllValid_reg_n_0),
        .I2(recvPacketCanProcess),
        .I3(validPacketsFIFO_wr_en_i_2_n_0),
        .I4(validPacketsFIFO_wr_en),
        .O(validPacketsFIFO_wr_en_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT5 #(
    .INIT(32'h00000800)) 
    validPacketsFIFO_wr_en_i_2
       (.I0(currentState__0[0]),
        .I1(sendHasRepliedSuccessfulConnection),
        .I2(recvPumpFIFO_reg_n_0),
        .I3(recvParseState__0[2]),
        .I4(recvParseState__0[1]),
        .O(validPacketsFIFO_wr_en_i_2_n_0));
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_EN" *) 
  FDRE #(
    .INIT(1'b0)) 
    validPacketsFIFO_wr_en_reg
       (.C(clk333_250),
        .CE(1'b1),
        .D(validPacketsFIFO_wr_en_i_1_n_0),
        .Q(validPacketsFIFO_wr_en),
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
