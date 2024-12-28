// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Sat Oct 19 20:53:57 2024
// Host        : Dragon2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_EthernetController3_0_0/design_1_EthernetController3_0_0_stub.v
// Design      : design_1_EthernetController3_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "EthernetController3,Vivado 2018.1_AR73068" *)
module design_1_EthernetController3_0_0(clk125, tx_en, tx_er, tx_data, rx_dv, rx_er, rx_data, 
  mac_address, speed_override, recv_pkt_header_prog_full, recv_pkt_header_wr_data, 
  recv_pkt_header_wr_en, recv_pkt_data_count, recv_pkt_data_wr_data, recv_pkt_data_wr_en, 
  send_pkt_header_empty, send_pkt_header_rd_data, send_pkt_header_rd_en, 
  send_pkt_data_empty, send_pkt_data_rd_data, send_pkt_data_rd_en, recv_scratch_addra, 
  recv_scratch_clka125, recv_scratch_dina, recv_scratch_ena, recv_scratch_wea, 
  recv_scratch_addrb, recv_scratch_clkb125, recv_scratch_doutb, recv_scratch_enb, 
  signal_detect, gmii_isolate, speed_is_10_100, speed_is_100, pcs_rst_out, phyaddr, 
  configuration_vector, configuration_valid, an_adv_config_vector, an_adv_config_val, 
  an_restart_config, phyBringupComplete, status_vector, rx_locked, tx_locked, riu_valid_1, 
  riu_prsnt_1, riu_rddata_1, riu_valid_2, riu_prsnt_2, riu_rddata_2, riu_valid_3, riu_prsnt_3, 
  riu_rddata_3, tx_dly_rdy_1, rx_dly_rdy_1, tx_vtc_rdy_1, rx_vtc_rdy_1, tx_dly_rdy_2, 
  rx_dly_rdy_2, tx_vtc_rdy_2, rx_vtc_rdy_2, tx_dly_rdy_3, rx_dly_rdy_3, tx_vtc_rdy_3, 
  rx_vtc_rdy_3, NETPKT_SendReady, NETPKT_RecvReady, STAT_CountSendUdpPackets, 
  STAT_CountValidRecvUdpPackets, STAT_CountValidRecvArpPackets, 
  STAT_CountInvalidRecvPackets, STAT_CountDroppedRecvPackets, DBG_EthConfig_State, 
  DBG_EthSend_State, DBG_EthRecv_State, DBG_RecvFifoPush_State, DBG_RecvValid_MAC, 
  DBG_RecvValid_IPv4, DBG_RecvValid_UDP, DBG_RecvValid_Payload, DBG_RecvValid_ARP, 
  DBG_ARPPacketTPA, DBG_DeviceTPA, DBG_SendType, DBG_RecvPacketFCS, DBG_RecvComputedCRC32, 
  DBG_Recv_pkt_header_prog_full, DBG_RecvPacketSizeDWORDs, DBG_RecvFIFOAvailableBytes, 
  DBG_RecvFIFOCount, DBG_RecvFIFOCurrentPushDWORD, DBG_RecvFIFOPktLengthDWORDs, 
  DBG_SendPacketRemainingFIFOPumpBytes, DBG_PacketSendPtr, DBG_send_pkt_data_rd_en, 
  DBG_SendPacketHeaderData, DBG_SendPacketBodyData, DBG_SendUDPPacketCount)
/* synthesis syn_black_box black_box_pad_pin="clk125,tx_en,tx_er,tx_data[7:0],rx_dv,rx_er,rx_data[7:0],mac_address[47:0],speed_override[1:0],recv_pkt_header_prog_full,recv_pkt_header_wr_data[31:0],recv_pkt_header_wr_en,recv_pkt_data_count[10:0],recv_pkt_data_wr_data[31:0],recv_pkt_data_wr_en,send_pkt_header_empty,send_pkt_header_rd_data[31:0],send_pkt_header_rd_en,send_pkt_data_empty,send_pkt_data_rd_data[7:0],send_pkt_data_rd_en,recv_scratch_addra[10:0],recv_scratch_clka125,recv_scratch_dina[7:0],recv_scratch_ena,recv_scratch_wea[0:0],recv_scratch_addrb[8:0],recv_scratch_clkb125,recv_scratch_doutb[31:0],recv_scratch_enb,signal_detect,gmii_isolate,speed_is_10_100,speed_is_100,pcs_rst_out,phyaddr[4:0],configuration_vector[4:0],configuration_valid,an_adv_config_vector[15:0],an_adv_config_val,an_restart_config,phyBringupComplete,status_vector[15:0],rx_locked,tx_locked,riu_valid_1,riu_prsnt_1,riu_rddata_1[15:0],riu_valid_2,riu_prsnt_2,riu_rddata_2[15:0],riu_valid_3,riu_prsnt_3,riu_rddata_3[15:0],tx_dly_rdy_1,rx_dly_rdy_1,tx_vtc_rdy_1,rx_vtc_rdy_1,tx_dly_rdy_2,rx_dly_rdy_2,tx_vtc_rdy_2,rx_vtc_rdy_2,tx_dly_rdy_3,rx_dly_rdy_3,tx_vtc_rdy_3,rx_vtc_rdy_3,NETPKT_SendReady,NETPKT_RecvReady,STAT_CountSendUdpPackets[31:0],STAT_CountValidRecvUdpPackets[31:0],STAT_CountValidRecvArpPackets[31:0],STAT_CountInvalidRecvPackets[31:0],STAT_CountDroppedRecvPackets[31:0],DBG_EthConfig_State[4:0],DBG_EthSend_State[4:0],DBG_EthRecv_State[4:0],DBG_RecvFifoPush_State[4:0],DBG_RecvValid_MAC[2:0],DBG_RecvValid_IPv4[5:0],DBG_RecvValid_UDP[0:0],DBG_RecvValid_Payload[0:0],DBG_RecvValid_ARP[6:0],DBG_ARPPacketTPA[31:0],DBG_DeviceTPA[31:0],DBG_SendType[1:0],DBG_RecvPacketFCS[31:0],DBG_RecvComputedCRC32[31:0],DBG_Recv_pkt_header_prog_full,DBG_RecvPacketSizeDWORDs[11:0],DBG_RecvFIFOAvailableBytes[10:0],DBG_RecvFIFOCount[10:0],DBG_RecvFIFOCurrentPushDWORD[8:0],DBG_RecvFIFOPktLengthDWORDs[11:0],DBG_SendPacketRemainingFIFOPumpBytes[1:0],DBG_PacketSendPtr[11:0],DBG_send_pkt_data_rd_en,DBG_SendPacketHeaderData[31:0],DBG_SendPacketBodyData[7:0],DBG_SendUDPPacketCount[7:0]" */;
  input clk125;
  output tx_en;
  output tx_er;
  output [7:0]tx_data;
  input rx_dv;
  input rx_er;
  input [7:0]rx_data;
  output [47:0]mac_address;
  output [1:0]speed_override;
  input recv_pkt_header_prog_full;
  output [31:0]recv_pkt_header_wr_data;
  output recv_pkt_header_wr_en;
  input [10:0]recv_pkt_data_count;
  output [31:0]recv_pkt_data_wr_data;
  output recv_pkt_data_wr_en;
  input send_pkt_header_empty;
  input [31:0]send_pkt_header_rd_data;
  output send_pkt_header_rd_en;
  input send_pkt_data_empty;
  input [7:0]send_pkt_data_rd_data;
  output send_pkt_data_rd_en;
  output [10:0]recv_scratch_addra;
  output recv_scratch_clka125;
  output [7:0]recv_scratch_dina;
  output recv_scratch_ena;
  output [0:0]recv_scratch_wea;
  output [8:0]recv_scratch_addrb;
  output recv_scratch_clkb125;
  input [31:0]recv_scratch_doutb;
  output recv_scratch_enb;
  output signal_detect;
  input gmii_isolate;
  output speed_is_10_100;
  output speed_is_100;
  output pcs_rst_out;
  output [4:0]phyaddr;
  output [4:0]configuration_vector;
  output configuration_valid;
  output [15:0]an_adv_config_vector;
  output an_adv_config_val;
  output an_restart_config;
  input phyBringupComplete;
  input [15:0]status_vector;
  input rx_locked;
  input tx_locked;
  output riu_valid_1;
  output riu_prsnt_1;
  output [15:0]riu_rddata_1;
  output riu_valid_2;
  output riu_prsnt_2;
  output [15:0]riu_rddata_2;
  output riu_valid_3;
  output riu_prsnt_3;
  output [15:0]riu_rddata_3;
  output tx_dly_rdy_1;
  output rx_dly_rdy_1;
  output tx_vtc_rdy_1;
  output rx_vtc_rdy_1;
  output tx_dly_rdy_2;
  output rx_dly_rdy_2;
  output tx_vtc_rdy_2;
  output rx_vtc_rdy_2;
  output tx_dly_rdy_3;
  output rx_dly_rdy_3;
  output tx_vtc_rdy_3;
  output rx_vtc_rdy_3;
  output NETPKT_SendReady;
  output NETPKT_RecvReady;
  output [31:0]STAT_CountSendUdpPackets;
  output [31:0]STAT_CountValidRecvUdpPackets;
  output [31:0]STAT_CountValidRecvArpPackets;
  output [31:0]STAT_CountInvalidRecvPackets;
  output [31:0]STAT_CountDroppedRecvPackets;
  output [4:0]DBG_EthConfig_State;
  output [4:0]DBG_EthSend_State;
  output [4:0]DBG_EthRecv_State;
  output [4:0]DBG_RecvFifoPush_State;
  output [2:0]DBG_RecvValid_MAC;
  output [5:0]DBG_RecvValid_IPv4;
  output [0:0]DBG_RecvValid_UDP;
  output [0:0]DBG_RecvValid_Payload;
  output [6:0]DBG_RecvValid_ARP;
  output [31:0]DBG_ARPPacketTPA;
  output [31:0]DBG_DeviceTPA;
  output [1:0]DBG_SendType;
  output [31:0]DBG_RecvPacketFCS;
  output [31:0]DBG_RecvComputedCRC32;
  output DBG_Recv_pkt_header_prog_full;
  output [11:0]DBG_RecvPacketSizeDWORDs;
  output [10:0]DBG_RecvFIFOAvailableBytes;
  output [10:0]DBG_RecvFIFOCount;
  output [8:0]DBG_RecvFIFOCurrentPushDWORD;
  output [11:0]DBG_RecvFIFOPktLengthDWORDs;
  output [1:0]DBG_SendPacketRemainingFIFOPumpBytes;
  output [11:0]DBG_PacketSendPtr;
  output DBG_send_pkt_data_rd_en;
  output [31:0]DBG_SendPacketHeaderData;
  output [7:0]DBG_SendPacketBodyData;
  output [7:0]DBG_SendUDPPacketCount;
endmodule
