// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Sat Apr 26 19:22:49 2025
// Host        : Dragon2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_NetProtoPacketProces_0_0/design_1_NetProtoPacketProces_0_0_stub.v
// Design      : design_1_NetProtoPacketProces_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "NetProtoPacketProcessor,Vivado 2018.1_AR73068" *)
module design_1_NetProtoPacketProces_0_0(clk333_250, recv_pkt_header_empty, 
  recv_pkt_header_rd_data, recv_pkt_header_rd_en, recv_pkt_data_empty, 
  recv_pkt_data_rd_data, recv_pkt_data_rd_en, send_pkt_header_prog_full, 
  send_pkt_header_wr_data, send_pkt_header_wr_en, send_pkt_data_count, 
  send_pkt_data_wr_data, send_pkt_data_wr_en, ETHCTRL_SendReady, ETHCTRL_RecvReady, 
  validPacketsFIFO_wr_data, validPacketsFIFO_full, validPacketsFIFO_prog_full, 
  validPacketsFIFO_wr_en, returnPacketsFIFO_empty, returnPacketsFIFO_rd_data, 
  returnPacketsFIFO_rd_en, sendBRAM_addra, sendBRAM_clka, sendBRAM_dina, sendBRAM_ena, 
  sendBRAM_wea, sendBRAM_addrb, sendBRAM_clkb, sendBRAM_doutb, sendBRAM_enb, 
  STAT_SendSessionPackets, STAT_RecvSessionPacketsValid, 
  STAT_RecvSessionPacketsInvalid, STAT_RecvSessionPacketsDropped, DBG_NetPkt_State, 
  DBG_SendFIFOState, DBG_RecvFIFOState, DBG_RecvSessionParseState, DBG_SendPacketState, 
  DBG_recvSendReplyPacket, DBG_sendReplyAck, DBG_sendHandlingReply, DBG_recvPacketData, 
  DBG_recvCurrentSubpacketOffset, DBG_recvCurrentSubpacket, DBG_recvValid_Session, 
  DBG_recvHeaderChecksum, DBG_discardPacketReason, DBG_sendLastAckedPacketID, 
  DBG_recvLastSendAckedPacketID, DBG_recvLastAckedPacketID, 
  DBG_sendCyclesBetweenAutoResends, DBG_recvCurrentSubpacketIndex, 
  DBG_recvCurrentPacketLength, DBG_returnPacketsFIFO_empty, 
  DBG_returnPacketsFIFO_rd_en, DBG_returnPacketsFIFO_rd_data, 
  DBG_sendHasUnackedSentPacket, DBG_send_pkt_header_prog_full)
/* synthesis syn_black_box black_box_pad_pin="clk333_250,recv_pkt_header_empty,recv_pkt_header_rd_data[31:0],recv_pkt_header_rd_en,recv_pkt_data_empty,recv_pkt_data_rd_data[31:0],recv_pkt_data_rd_en,send_pkt_header_prog_full,send_pkt_header_wr_data[31:0],send_pkt_header_wr_en,send_pkt_data_count[10:0],send_pkt_data_wr_data[31:0],send_pkt_data_wr_en,ETHCTRL_SendReady,ETHCTRL_RecvReady,validPacketsFIFO_wr_data[87:0],validPacketsFIFO_full,validPacketsFIFO_prog_full,validPacketsFIFO_wr_en,returnPacketsFIFO_empty,returnPacketsFIFO_rd_data[87:0],returnPacketsFIFO_rd_en,sendBRAM_addra[8:0],sendBRAM_clka,sendBRAM_dina[31:0],sendBRAM_ena,sendBRAM_wea[0:0],sendBRAM_addrb[8:0],sendBRAM_clkb,sendBRAM_doutb[31:0],sendBRAM_enb,STAT_SendSessionPackets[31:0],STAT_RecvSessionPacketsValid[31:0],STAT_RecvSessionPacketsInvalid[31:0],STAT_RecvSessionPacketsDropped[31:0],DBG_NetPkt_State[4:0],DBG_SendFIFOState[4:0],DBG_RecvFIFOState[4:0],DBG_RecvSessionParseState[4:0],DBG_SendPacketState[4:0],DBG_recvSendReplyPacket,DBG_sendReplyAck,DBG_sendHandlingReply,DBG_recvPacketData[63:0],DBG_recvCurrentSubpacketOffset[3:0],DBG_recvCurrentSubpacket[71:0],DBG_recvValid_Session[3:0],DBG_recvHeaderChecksum[7:0],DBG_discardPacketReason[3:0],DBG_sendLastAckedPacketID[15:0],DBG_recvLastSendAckedPacketID[15:0],DBG_recvLastAckedPacketID[15:0],DBG_sendCyclesBetweenAutoResends[27:0],DBG_recvCurrentSubpacketIndex[7:0],DBG_recvCurrentPacketLength[15:0],DBG_returnPacketsFIFO_empty,DBG_returnPacketsFIFO_rd_en,DBG_returnPacketsFIFO_rd_data[87:0],DBG_sendHasUnackedSentPacket,DBG_send_pkt_header_prog_full" */;
  input clk333_250;
  input recv_pkt_header_empty;
  input [31:0]recv_pkt_header_rd_data;
  output recv_pkt_header_rd_en;
  input recv_pkt_data_empty;
  input [31:0]recv_pkt_data_rd_data;
  output recv_pkt_data_rd_en;
  input send_pkt_header_prog_full;
  output [31:0]send_pkt_header_wr_data;
  output send_pkt_header_wr_en;
  input [10:0]send_pkt_data_count;
  output [31:0]send_pkt_data_wr_data;
  output send_pkt_data_wr_en;
  input ETHCTRL_SendReady;
  input ETHCTRL_RecvReady;
  output [87:0]validPacketsFIFO_wr_data;
  input validPacketsFIFO_full;
  input validPacketsFIFO_prog_full;
  output validPacketsFIFO_wr_en;
  input returnPacketsFIFO_empty;
  input [87:0]returnPacketsFIFO_rd_data;
  output returnPacketsFIFO_rd_en;
  output [8:0]sendBRAM_addra;
  output sendBRAM_clka;
  output [31:0]sendBRAM_dina;
  output sendBRAM_ena;
  output [0:0]sendBRAM_wea;
  output [8:0]sendBRAM_addrb;
  output sendBRAM_clkb;
  input [31:0]sendBRAM_doutb;
  output sendBRAM_enb;
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
endmodule
