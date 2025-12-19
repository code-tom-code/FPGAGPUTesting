-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
-- Date        : Sat Oct 19 20:53:57 2024
-- Host        : Dragon2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_EthernetController3_0_0/design_1_EthernetController3_0_0_stub.vhdl
-- Design      : design_1_EthernetController3_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_EthernetController3_0_0 is
  Port ( 
    clk125 : in STD_LOGIC;
    tx_en : out STD_LOGIC;
    tx_er : out STD_LOGIC;
    tx_data : out STD_LOGIC_VECTOR ( 7 downto 0 );
    rx_dv : in STD_LOGIC;
    rx_er : in STD_LOGIC;
    rx_data : in STD_LOGIC_VECTOR ( 7 downto 0 );
    mac_address : out STD_LOGIC_VECTOR ( 47 downto 0 );
    speed_override : out STD_LOGIC_VECTOR ( 1 downto 0 );
    recv_pkt_header_prog_full : in STD_LOGIC;
    recv_pkt_header_wr_data : out STD_LOGIC_VECTOR ( 31 downto 0 );
    recv_pkt_header_wr_en : out STD_LOGIC;
    recv_pkt_data_count : in STD_LOGIC_VECTOR ( 10 downto 0 );
    recv_pkt_data_wr_data : out STD_LOGIC_VECTOR ( 31 downto 0 );
    recv_pkt_data_wr_en : out STD_LOGIC;
    send_pkt_header_empty : in STD_LOGIC;
    send_pkt_header_rd_data : in STD_LOGIC_VECTOR ( 31 downto 0 );
    send_pkt_header_rd_en : out STD_LOGIC;
    send_pkt_data_empty : in STD_LOGIC;
    send_pkt_data_rd_data : in STD_LOGIC_VECTOR ( 7 downto 0 );
    send_pkt_data_rd_en : out STD_LOGIC;
    recv_scratch_addra : out STD_LOGIC_VECTOR ( 10 downto 0 );
    recv_scratch_clka125 : out STD_LOGIC;
    recv_scratch_dina : out STD_LOGIC_VECTOR ( 7 downto 0 );
    recv_scratch_ena : out STD_LOGIC;
    recv_scratch_wea : out STD_LOGIC_VECTOR ( 0 to 0 );
    recv_scratch_addrb : out STD_LOGIC_VECTOR ( 8 downto 0 );
    recv_scratch_clkb125 : out STD_LOGIC;
    recv_scratch_doutb : in STD_LOGIC_VECTOR ( 31 downto 0 );
    recv_scratch_enb : out STD_LOGIC;
    signal_detect : out STD_LOGIC;
    gmii_isolate : in STD_LOGIC;
    speed_is_10_100 : out STD_LOGIC;
    speed_is_100 : out STD_LOGIC;
    pcs_rst_out : out STD_LOGIC;
    phyaddr : out STD_LOGIC_VECTOR ( 4 downto 0 );
    configuration_vector : out STD_LOGIC_VECTOR ( 4 downto 0 );
    configuration_valid : out STD_LOGIC;
    an_adv_config_vector : out STD_LOGIC_VECTOR ( 15 downto 0 );
    an_adv_config_val : out STD_LOGIC;
    an_restart_config : out STD_LOGIC;
    phyBringupComplete : in STD_LOGIC;
    status_vector : in STD_LOGIC_VECTOR ( 15 downto 0 );
    rx_locked : in STD_LOGIC;
    tx_locked : in STD_LOGIC;
    riu_valid_1 : out STD_LOGIC;
    riu_prsnt_1 : out STD_LOGIC;
    riu_rddata_1 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    riu_valid_2 : out STD_LOGIC;
    riu_prsnt_2 : out STD_LOGIC;
    riu_rddata_2 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    riu_valid_3 : out STD_LOGIC;
    riu_prsnt_3 : out STD_LOGIC;
    riu_rddata_3 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    tx_dly_rdy_1 : out STD_LOGIC;
    rx_dly_rdy_1 : out STD_LOGIC;
    tx_vtc_rdy_1 : out STD_LOGIC;
    rx_vtc_rdy_1 : out STD_LOGIC;
    tx_dly_rdy_2 : out STD_LOGIC;
    rx_dly_rdy_2 : out STD_LOGIC;
    tx_vtc_rdy_2 : out STD_LOGIC;
    rx_vtc_rdy_2 : out STD_LOGIC;
    tx_dly_rdy_3 : out STD_LOGIC;
    rx_dly_rdy_3 : out STD_LOGIC;
    tx_vtc_rdy_3 : out STD_LOGIC;
    rx_vtc_rdy_3 : out STD_LOGIC;
    NETPKT_SendReady : out STD_LOGIC;
    NETPKT_RecvReady : out STD_LOGIC;
    STAT_CountSendUdpPackets : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CountValidRecvUdpPackets : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CountValidRecvArpPackets : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CountInvalidRecvPackets : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CountDroppedRecvPackets : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_EthConfig_State : out STD_LOGIC_VECTOR ( 4 downto 0 );
    DBG_EthSend_State : out STD_LOGIC_VECTOR ( 4 downto 0 );
    DBG_EthRecv_State : out STD_LOGIC_VECTOR ( 4 downto 0 );
    DBG_RecvFifoPush_State : out STD_LOGIC_VECTOR ( 4 downto 0 );
    DBG_RecvValid_MAC : out STD_LOGIC_VECTOR ( 2 downto 0 );
    DBG_RecvValid_IPv4 : out STD_LOGIC_VECTOR ( 5 downto 0 );
    DBG_RecvValid_UDP : out STD_LOGIC_VECTOR ( 0 to 0 );
    DBG_RecvValid_Payload : out STD_LOGIC_VECTOR ( 0 to 0 );
    DBG_RecvValid_ARP : out STD_LOGIC_VECTOR ( 6 downto 0 );
    DBG_ARPPacketTPA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_DeviceTPA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_SendType : out STD_LOGIC_VECTOR ( 1 downto 0 );
    DBG_RecvPacketFCS : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_RecvComputedCRC32 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_Recv_pkt_header_prog_full : out STD_LOGIC;
    DBG_RecvPacketSizeDWORDs : out STD_LOGIC_VECTOR ( 11 downto 0 );
    DBG_RecvFIFOAvailableBytes : out STD_LOGIC_VECTOR ( 10 downto 0 );
    DBG_RecvFIFOCount : out STD_LOGIC_VECTOR ( 10 downto 0 );
    DBG_RecvFIFOCurrentPushDWORD : out STD_LOGIC_VECTOR ( 8 downto 0 );
    DBG_RecvFIFOPktLengthDWORDs : out STD_LOGIC_VECTOR ( 11 downto 0 );
    DBG_SendPacketRemainingFIFOPumpBytes : out STD_LOGIC_VECTOR ( 1 downto 0 );
    DBG_PacketSendPtr : out STD_LOGIC_VECTOR ( 11 downto 0 );
    DBG_send_pkt_data_rd_en : out STD_LOGIC;
    DBG_SendPacketHeaderData : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_SendPacketBodyData : out STD_LOGIC_VECTOR ( 7 downto 0 );
    DBG_SendUDPPacketCount : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );

end design_1_EthernetController3_0_0;

architecture stub of design_1_EthernetController3_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk125,tx_en,tx_er,tx_data[7:0],rx_dv,rx_er,rx_data[7:0],mac_address[47:0],speed_override[1:0],recv_pkt_header_prog_full,recv_pkt_header_wr_data[31:0],recv_pkt_header_wr_en,recv_pkt_data_count[10:0],recv_pkt_data_wr_data[31:0],recv_pkt_data_wr_en,send_pkt_header_empty,send_pkt_header_rd_data[31:0],send_pkt_header_rd_en,send_pkt_data_empty,send_pkt_data_rd_data[7:0],send_pkt_data_rd_en,recv_scratch_addra[10:0],recv_scratch_clka125,recv_scratch_dina[7:0],recv_scratch_ena,recv_scratch_wea[0:0],recv_scratch_addrb[8:0],recv_scratch_clkb125,recv_scratch_doutb[31:0],recv_scratch_enb,signal_detect,gmii_isolate,speed_is_10_100,speed_is_100,pcs_rst_out,phyaddr[4:0],configuration_vector[4:0],configuration_valid,an_adv_config_vector[15:0],an_adv_config_val,an_restart_config,phyBringupComplete,status_vector[15:0],rx_locked,tx_locked,riu_valid_1,riu_prsnt_1,riu_rddata_1[15:0],riu_valid_2,riu_prsnt_2,riu_rddata_2[15:0],riu_valid_3,riu_prsnt_3,riu_rddata_3[15:0],tx_dly_rdy_1,rx_dly_rdy_1,tx_vtc_rdy_1,rx_vtc_rdy_1,tx_dly_rdy_2,rx_dly_rdy_2,tx_vtc_rdy_2,rx_vtc_rdy_2,tx_dly_rdy_3,rx_dly_rdy_3,tx_vtc_rdy_3,rx_vtc_rdy_3,NETPKT_SendReady,NETPKT_RecvReady,STAT_CountSendUdpPackets[31:0],STAT_CountValidRecvUdpPackets[31:0],STAT_CountValidRecvArpPackets[31:0],STAT_CountInvalidRecvPackets[31:0],STAT_CountDroppedRecvPackets[31:0],DBG_EthConfig_State[4:0],DBG_EthSend_State[4:0],DBG_EthRecv_State[4:0],DBG_RecvFifoPush_State[4:0],DBG_RecvValid_MAC[2:0],DBG_RecvValid_IPv4[5:0],DBG_RecvValid_UDP[0:0],DBG_RecvValid_Payload[0:0],DBG_RecvValid_ARP[6:0],DBG_ARPPacketTPA[31:0],DBG_DeviceTPA[31:0],DBG_SendType[1:0],DBG_RecvPacketFCS[31:0],DBG_RecvComputedCRC32[31:0],DBG_Recv_pkt_header_prog_full,DBG_RecvPacketSizeDWORDs[11:0],DBG_RecvFIFOAvailableBytes[10:0],DBG_RecvFIFOCount[10:0],DBG_RecvFIFOCurrentPushDWORD[8:0],DBG_RecvFIFOPktLengthDWORDs[11:0],DBG_SendPacketRemainingFIFOPumpBytes[1:0],DBG_PacketSendPtr[11:0],DBG_send_pkt_data_rd_en,DBG_SendPacketHeaderData[31:0],DBG_SendPacketBodyData[7:0],DBG_SendUDPPacketCount[7:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "EthernetController3,Vivado 2018.1_AR73068";
begin
end;
