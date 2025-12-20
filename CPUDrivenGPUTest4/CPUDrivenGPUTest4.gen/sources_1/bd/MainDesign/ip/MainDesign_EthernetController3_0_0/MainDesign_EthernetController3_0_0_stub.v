// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Thu Dec 11 01:35:53 2025
// Host        : Dragon3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_EthernetController3_0_0/MainDesign_EthernetController3_0_0_stub.v
// Design      : MainDesign_EthernetController3_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "MainDesign_EthernetController3_0_0,EthernetController3,{}" *) (* core_generation_info = "MainDesign_EthernetController3_0_0,EthernetController3,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=EthernetController3,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL,TX_INTER_PACKET_GAP_BYTES=12,RX_INTER_PACKET_GAP_BYTES=1,PAYLOAD_MAGIC_HEADER_BYTE=0xA5,RX_ALLOW_BAD_FCS_CHECKSUM_FRAMES=false,RX_ALLOW_BAD_IPv4_CHECKSUM_FRAMES=false,RX_DISABLE_MAC_ADDR_FILTERING=false,RX_DISABLE_IPv4_ADDR_FILTERING=false,DEVICE_MAC_ADDRESS_OCTET_0=0x00,DEVICE_MAC_ADDRESS_OCTET_1=0x0A,DEVICE_MAC_ADDRESS_OCTET_2=0x35,DEVICE_MAC_ADDRESS_OCTET_3=0x03,DEVICE_MAC_ADDRESS_OCTET_4=0x78,DEVICE_MAC_ADDRESS_OCTET_5=0xF1,DEVICE_IPv4_ADDRESS_OCTET_0=0xC0,DEVICE_IPv4_ADDRESS_OCTET_1=0xA8,DEVICE_IPv4_ADDRESS_OCTET_2=0x01,DEVICE_IPv4_ADDRESS_OCTET_3=0xAB,UDP_PROTOCOL_PORT_D2H=3128,UDP_PROTOCOL_PORT_H2D=3129,RECV_PKT_DATA_DWORD_CAPACITY=2048}" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* ip_definition_source = "module_ref" *) (* x_core_info = "EthernetController3,Vivado 2025.2" *) 
module MainDesign_EthernetController3_0_0(clk125, tx_en, tx_er, tx_data, rx_dv, rx_er, rx_data, 
  mac_address, speed_override, recv_pkt_header_prog_full, recv_pkt_header_wr_data, 
  recv_pkt_header_wr_en, recv_pkt_data_count, recv_pkt_data_wr_data, recv_pkt_data_wr_en, 
  send_pkt_header_empty, send_pkt_header_almost_empty, send_pkt_header_rd_data, 
  send_pkt_header_rd_en, send_pkt_data_empty, send_pkt_data_almost_empty, 
  send_pkt_data_rd_data, send_pkt_data_rd_en, recv_scratch_addra, recv_scratch_clka125, 
  recv_scratch_dina, recv_scratch_ena, recv_scratch_wea, recv_scratch_addrb, 
  recv_scratch_clkb125, recv_scratch_doutb, recv_scratch_enb, signal_detect, gmii_isolate, 
  speed_is_10_100, speed_is_100, pcs_rst_out, phyaddr, configuration_vector, 
  configuration_valid, an_adv_config_vector, an_adv_config_val, an_restart_config, 
  phyBringupComplete, status_vector, rx_locked, tx_locked, riu_valid_1, riu_prsnt_1, 
  riu_rddata_1, riu_valid_2, riu_prsnt_2, riu_rddata_2, riu_valid_3, riu_prsnt_3, riu_rddata_3, 
  tx_dly_rdy_1, rx_dly_rdy_1, tx_vtc_rdy_1, rx_vtc_rdy_1, tx_dly_rdy_2, rx_dly_rdy_2, 
  tx_vtc_rdy_2, rx_vtc_rdy_2, tx_dly_rdy_3, rx_dly_rdy_3, tx_vtc_rdy_3, rx_vtc_rdy_3, 
  NETPKT_SendReady, NETPKT_RecvReady, STAT_CountSendUdpPackets, 
  STAT_CountValidRecvUdpPackets, STAT_CountValidRecvArpPackets, 
  STAT_CountInvalidRecvPackets, STAT_CountDroppedRecvPackets, DBG_EthConfig_State, 
  DBG_EthSend_State, DBG_EthRecv_State, DBG_RecvFifoPush_State, DBG_RecvValid_MAC, 
  DBG_RecvValid_IPv4, DBG_RecvValid_UDP, DBG_RecvValid_Payload, DBG_RecvValid_ARP, 
  DBG_ARPPacketTPA, DBG_DeviceTPA, DBG_SendType, DBG_RecvPacketFCS, DBG_RecvComputedCRC32, 
  DBG_Recv_pkt_header_prog_full, DBG_RecvPacketSizeDWORDs, DBG_RecvFIFOAvailableBytes, 
  DBG_RecvFIFOCount, DBG_RecvFIFOCurrentPushDWORD, DBG_RecvFIFOPktLengthDWORDs, 
  DBG_SendPacketRemainingFIFOPumpBytes, DBG_PacketSendPtr, DBG_send_pkt_data_rd_en, 
  DBG_SendPacketHeaderData, DBG_SendPacketBodyData, DBG_SendUDPPacketCount)
/* synthesis syn_black_box black_box_pad_pin="tx_en,tx_er,tx_data[7:0],rx_dv,rx_er,rx_data[7:0],mac_address[47:0],speed_override[1:0],recv_pkt_header_prog_full,recv_pkt_header_wr_data[31:0],recv_pkt_header_wr_en,recv_pkt_data_count[10:0],recv_pkt_data_wr_data[31:0],recv_pkt_data_wr_en,send_pkt_header_empty,send_pkt_header_almost_empty,send_pkt_header_rd_data[31:0],send_pkt_header_rd_en,send_pkt_data_empty,send_pkt_data_almost_empty,send_pkt_data_rd_data[7:0],send_pkt_data_rd_en,recv_scratch_addra[10:0],recv_scratch_dina[7:0],recv_scratch_ena,recv_scratch_wea[0:0],recv_scratch_addrb[8:0],recv_scratch_doutb[31:0],recv_scratch_enb,signal_detect,gmii_isolate,speed_is_10_100,speed_is_100,pcs_rst_out,phyaddr[4:0],configuration_vector[4:0],configuration_valid,an_adv_config_vector[15:0],an_adv_config_val,an_restart_config,phyBringupComplete,status_vector[15:0],rx_locked,tx_locked,riu_valid_1,riu_prsnt_1,riu_rddata_1[15:0],riu_valid_2,riu_prsnt_2,riu_rddata_2[15:0],riu_valid_3,riu_prsnt_3,riu_rddata_3[15:0],tx_dly_rdy_1,rx_dly_rdy_1,tx_vtc_rdy_1,rx_vtc_rdy_1,tx_dly_rdy_2,rx_dly_rdy_2,tx_vtc_rdy_2,rx_vtc_rdy_2,tx_dly_rdy_3,rx_dly_rdy_3,tx_vtc_rdy_3,rx_vtc_rdy_3,NETPKT_SendReady,NETPKT_RecvReady,STAT_CountSendUdpPackets[31:0],STAT_CountValidRecvUdpPackets[31:0],STAT_CountValidRecvArpPackets[31:0],STAT_CountInvalidRecvPackets[31:0],STAT_CountDroppedRecvPackets[31:0],DBG_EthConfig_State[4:0],DBG_EthSend_State[4:0],DBG_EthRecv_State[4:0],DBG_RecvFifoPush_State[4:0],DBG_RecvValid_MAC[2:0],DBG_RecvValid_IPv4[5:0],DBG_RecvValid_UDP[0:0],DBG_RecvValid_Payload[0:0],DBG_RecvValid_ARP[6:0],DBG_ARPPacketTPA[31:0],DBG_DeviceTPA[31:0],DBG_SendType[1:0],DBG_RecvPacketFCS[31:0],DBG_RecvComputedCRC32[31:0],DBG_Recv_pkt_header_prog_full,DBG_RecvPacketSizeDWORDs[11:0],DBG_RecvFIFOAvailableBytes[10:0],DBG_RecvFIFOCount[10:0],DBG_RecvFIFOCurrentPushDWORD[8:0],DBG_RecvFIFOPktLengthDWORDs[11:0],DBG_SendPacketRemainingFIFOPumpBytes[1:0],DBG_PacketSendPtr[11:0],DBG_send_pkt_data_rd_en,DBG_SendPacketHeaderData[31:0],DBG_SendPacketBodyData[7:0],DBG_SendUDPPacketCount[7:0]" */
/* synthesis syn_force_seq_prim="clk125" */
/* synthesis syn_force_seq_prim="recv_scratch_clka125" */
/* synthesis syn_force_seq_prim="recv_scratch_clkb125" */;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk125 CLK" *) (* x_interface_mode = "slave clk125" *) (* x_interface_parameter = "XIL_INTERFACENAME clk125, FREQ_HZ 125000000, ASSOCIATED_BUSIF GMII:send_pkt_header:send_pkt_data:recv_pkt_header:recv_pkt_data:RecvScratchWRA:RecvScratchRDB, FREQ_TOLERANCE_HZ 0, PHASE 0, CLK_DOMAIN MainDesign_gig_ethernet_pcs_pma_0_0_clk125_out, INSERT_VIP 0" *) input clk125 /* synthesis syn_isclock = 1 */;
  (* x_interface_info = "xilinx.com:interface:gmii:1.0 GMII TX_EN" *) (* x_interface_mode = "master GMII" *) output tx_en;
  (* x_interface_info = "xilinx.com:interface:gmii:1.0 GMII TX_ER" *) output tx_er;
  (* x_interface_info = "xilinx.com:interface:gmii:1.0 GMII TXD" *) output [7:0]tx_data;
  (* x_interface_info = "xilinx.com:interface:gmii:1.0 GMII RX_DV" *) input rx_dv;
  (* x_interface_info = "xilinx.com:interface:gmii:1.0 GMII RX_ER" *) input rx_er;
  (* x_interface_info = "xilinx.com:interface:gmii:1.0 GMII RXD" *) input [7:0]rx_data;
  output [47:0]mac_address;
  output [1:0]speed_override;
  input recv_pkt_header_prog_full;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 recv_pkt_header WR_DATA" *) (* x_interface_mode = "master recv_pkt_header" *) output [31:0]recv_pkt_header_wr_data;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 recv_pkt_header WR_EN" *) output recv_pkt_header_wr_en;
  input [10:0]recv_pkt_data_count;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 recv_pkt_data WR_DATA" *) (* x_interface_mode = "master recv_pkt_data" *) output [31:0]recv_pkt_data_wr_data;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 recv_pkt_data WR_EN" *) output recv_pkt_data_wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 send_pkt_header EMPTY" *) (* x_interface_mode = "master send_pkt_header" *) input send_pkt_header_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 send_pkt_header ALMOST_EMPTY" *) input send_pkt_header_almost_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 send_pkt_header RD_DATA" *) (* x_interface_mode = "master" *) input [31:0]send_pkt_header_rd_data;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 send_pkt_header RD_EN" *) output send_pkt_header_rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 send_pkt_data EMPTY" *) (* x_interface_mode = "master send_pkt_data" *) input send_pkt_data_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 send_pkt_data ALMOST_EMPTY" *) input send_pkt_data_almost_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 send_pkt_data RD_DATA" *) (* x_interface_mode = "master" *) input [7:0]send_pkt_data_rd_data;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 send_pkt_data RD_EN" *) output send_pkt_data_rd_en;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 RecvScratchWRA ADDR" *) (* x_interface_mode = "master RecvScratchWRA" *) (* x_interface_parameter = "XIL_INTERFACENAME RecvScratchWRA, FREQ_HZ 125000000, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) output [10:0]recv_scratch_addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 RecvScratchWRA CLK" *) output recv_scratch_clka125 /* synthesis syn_isclock = 1 */;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 RecvScratchWRA DIN" *) output [7:0]recv_scratch_dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 RecvScratchWRA EN" *) output recv_scratch_ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 RecvScratchWRA WE" *) output [0:0]recv_scratch_wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 RecvScratchRDB ADDR" *) (* x_interface_mode = "master RecvScratchRDB" *) (* x_interface_parameter = "XIL_INTERFACENAME RecvScratchRDB, FREQ_HZ 125000000, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) output [8:0]recv_scratch_addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 RecvScratchRDB CLK" *) output recv_scratch_clkb125 /* synthesis syn_isclock = 1 */;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 RecvScratchRDB DOUT" *) input [31:0]recv_scratch_doutb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 RecvScratchRDB EN" *) output recv_scratch_enb;
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
