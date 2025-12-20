// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Mon Dec  8 18:20:30 2025
// Host        : Dragon3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_NetProtoPacketProces_0_0/MainDesign_NetProtoPacketProces_0_0_stub.v
// Design      : MainDesign_NetProtoPacketProces_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "MainDesign_NetProtoPacketProces_0_0,NetProtoPacketProcessor,{}" *) (* core_generation_info = "MainDesign_NetProtoPacketProces_0_0,NetProtoPacketProcessor,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=NetProtoPacketProcessor,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL,NET_PROTOCOL_MAJOR_VERSION=1,NET_PROTOCOL_MINOR_VERSION=0,SEND_PKT_DATA_CAPACITY_DWORDS=2048}" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* ip_definition_source = "module_ref" *) (* x_core_info = "NetProtoPacketProcessor,Vivado 2025.2" *) 
module MainDesign_NetProtoPacketProces_0_0(clk333_250, recv_pkt_header_empty, 
  recv_pkt_header_almost_empty, recv_pkt_header_rd_data, recv_pkt_header_rd_en, 
  recv_pkt_data_empty, recv_pkt_data_almost_empty, recv_pkt_data_rd_data, 
  recv_pkt_data_rd_en, send_pkt_header_prog_full, send_pkt_header_wr_data, 
  send_pkt_header_wr_en, send_pkt_data_count, send_pkt_data_wr_data, send_pkt_data_wr_en, 
  ETHCTRL_SendReady, ETHCTRL_RecvReady, validPacketsFIFO_wr_data, validPacketsFIFO_full, 
  validPacketsFIFO_prog_full, validPacketsFIFO_wr_en, returnPacketsFIFO_empty, 
  returnPacketsFIFO_almost_empty, returnPacketsFIFO_rd_data, returnPacketsFIFO_rd_en, 
  sendBRAM_addra, sendBRAM_clka, sendBRAM_dina, sendBRAM_ena, sendBRAM_wea, sendBRAM_addrb, 
  sendBRAM_clkb, sendBRAM_doutb, sendBRAM_enb, STAT_SendSessionPackets, 
  STAT_RecvSessionPacketsValid, STAT_RecvSessionPacketsInvalid, 
  STAT_RecvSessionPacketsDropped, DBG_NetPkt_State, DBG_SendFIFOState, DBG_RecvFIFOState, 
  DBG_RecvSessionParseState, DBG_SendPacketState, DBG_recvSendReplyPacket, 
  DBG_sendReplyAck, DBG_sendHandlingReply, DBG_recvPacketData, 
  DBG_recvCurrentSubpacketOffset, DBG_recvCurrentSubpacket, DBG_recvValid_Session, 
  DBG_recvHeaderChecksum, DBG_discardPacketReason, DBG_sendLastAckedPacketID, 
  DBG_recvLastSendAckedPacketID, DBG_recvLastAckedPacketID, 
  DBG_sendCyclesBetweenAutoResends, DBG_recvCurrentSubpacketIndex, 
  DBG_recvCurrentPacketLength, DBG_returnPacketsFIFO_empty, 
  DBG_returnPacketsFIFO_rd_en, DBG_returnPacketsFIFO_rd_data, 
  DBG_sendHasUnackedSentPacket, DBG_send_pkt_header_prog_full)
/* synthesis syn_black_box black_box_pad_pin="recv_pkt_header_empty,recv_pkt_header_almost_empty,recv_pkt_header_rd_data[31:0],recv_pkt_header_rd_en,recv_pkt_data_empty,recv_pkt_data_almost_empty,recv_pkt_data_rd_data[31:0],recv_pkt_data_rd_en,send_pkt_header_prog_full,send_pkt_header_wr_data[31:0],send_pkt_header_wr_en,send_pkt_data_count[10:0],send_pkt_data_wr_data[31:0],send_pkt_data_wr_en,ETHCTRL_SendReady,ETHCTRL_RecvReady,validPacketsFIFO_wr_data[87:0],validPacketsFIFO_full,validPacketsFIFO_prog_full,validPacketsFIFO_wr_en,returnPacketsFIFO_empty,returnPacketsFIFO_almost_empty,returnPacketsFIFO_rd_data[87:0],returnPacketsFIFO_rd_en,sendBRAM_addra[8:0],sendBRAM_dina[31:0],sendBRAM_ena,sendBRAM_wea[0:0],sendBRAM_addrb[8:0],sendBRAM_doutb[31:0],sendBRAM_enb,STAT_SendSessionPackets[31:0],STAT_RecvSessionPacketsValid[31:0],STAT_RecvSessionPacketsInvalid[31:0],STAT_RecvSessionPacketsDropped[31:0],DBG_NetPkt_State[4:0],DBG_SendFIFOState[4:0],DBG_RecvFIFOState[4:0],DBG_RecvSessionParseState[4:0],DBG_SendPacketState[4:0],DBG_recvSendReplyPacket,DBG_sendReplyAck,DBG_sendHandlingReply,DBG_recvPacketData[63:0],DBG_recvCurrentSubpacketOffset[3:0],DBG_recvCurrentSubpacket[71:0],DBG_recvValid_Session[3:0],DBG_recvHeaderChecksum[7:0],DBG_discardPacketReason[3:0],DBG_sendLastAckedPacketID[15:0],DBG_recvLastSendAckedPacketID[15:0],DBG_recvLastAckedPacketID[15:0],DBG_sendCyclesBetweenAutoResends[27:0],DBG_recvCurrentSubpacketIndex[7:0],DBG_recvCurrentPacketLength[15:0],DBG_returnPacketsFIFO_empty,DBG_returnPacketsFIFO_rd_en,DBG_returnPacketsFIFO_rd_data[87:0],DBG_sendHasUnackedSentPacket,DBG_send_pkt_header_prog_full" */
/* synthesis syn_force_seq_prim="clk333_250" */
/* synthesis syn_force_seq_prim="sendBRAM_clka" */
/* synthesis syn_force_seq_prim="sendBRAM_clkb" */;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk333_250 CLK" *) (* x_interface_mode = "slave clk333_250" *) (* x_interface_parameter = "XIL_INTERFACENAME clk333_250, FREQ_HZ 333250000, ASSOCIATED_BUSIF recv_pkt_header:recv_pkt_data:send_pkt_header:send_pkt_data:validPacketsFIFO:returnPacketsFIFO:SendPacketBRAMW:SendPacketBRAMR, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0" *) input clk333_250 /* synthesis syn_isclock = 1 */;
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
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SendPacketBRAMW CLK" *) output sendBRAM_clka /* synthesis syn_isclock = 1 */;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SendPacketBRAMW DIN" *) output [31:0]sendBRAM_dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SendPacketBRAMW EN" *) output sendBRAM_ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SendPacketBRAMW WE" *) output [0:0]sendBRAM_wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SendPacketBRAMR ADDR" *) (* x_interface_mode = "master SendPacketBRAMR" *) (* x_interface_parameter = "XIL_INTERFACENAME SendPacketBRAMR, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) output [8:0]sendBRAM_addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SendPacketBRAMR CLK" *) output sendBRAM_clkb /* synthesis syn_isclock = 1 */;
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
endmodule
