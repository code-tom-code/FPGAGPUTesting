-- (c) Copyright 1995-2024 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:module_ref:EthernetController3:1.0
-- IP Revision: 1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY design_1_EthernetController3_0_0 IS
  PORT (
    clk125 : IN STD_LOGIC;
    tx_en : OUT STD_LOGIC;
    tx_er : OUT STD_LOGIC;
    tx_data : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    rx_dv : IN STD_LOGIC;
    rx_er : IN STD_LOGIC;
    rx_data : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    mac_address : OUT STD_LOGIC_VECTOR(47 DOWNTO 0);
    speed_override : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    recv_pkt_header_prog_full : IN STD_LOGIC;
    recv_pkt_header_wr_data : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    recv_pkt_header_wr_en : OUT STD_LOGIC;
    recv_pkt_data_count : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
    recv_pkt_data_wr_data : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    recv_pkt_data_wr_en : OUT STD_LOGIC;
    send_pkt_header_empty : IN STD_LOGIC;
    send_pkt_header_rd_data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    send_pkt_header_rd_en : OUT STD_LOGIC;
    send_pkt_data_empty : IN STD_LOGIC;
    send_pkt_data_rd_data : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    send_pkt_data_rd_en : OUT STD_LOGIC;
    recv_scratch_addra : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
    recv_scratch_clka125 : OUT STD_LOGIC;
    recv_scratch_dina : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    recv_scratch_ena : OUT STD_LOGIC;
    recv_scratch_wea : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    recv_scratch_addrb : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
    recv_scratch_clkb125 : OUT STD_LOGIC;
    recv_scratch_doutb : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    recv_scratch_enb : OUT STD_LOGIC;
    signal_detect : OUT STD_LOGIC;
    gmii_isolate : IN STD_LOGIC;
    speed_is_10_100 : OUT STD_LOGIC;
    speed_is_100 : OUT STD_LOGIC;
    pcs_rst_out : OUT STD_LOGIC;
    phyaddr : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
    configuration_vector : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
    configuration_valid : OUT STD_LOGIC;
    an_adv_config_vector : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    an_adv_config_val : OUT STD_LOGIC;
    an_restart_config : OUT STD_LOGIC;
    phyBringupComplete : IN STD_LOGIC;
    status_vector : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    rx_locked : IN STD_LOGIC;
    tx_locked : IN STD_LOGIC;
    riu_valid_1 : OUT STD_LOGIC;
    riu_prsnt_1 : OUT STD_LOGIC;
    riu_rddata_1 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    riu_valid_2 : OUT STD_LOGIC;
    riu_prsnt_2 : OUT STD_LOGIC;
    riu_rddata_2 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    riu_valid_3 : OUT STD_LOGIC;
    riu_prsnt_3 : OUT STD_LOGIC;
    riu_rddata_3 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    tx_dly_rdy_1 : OUT STD_LOGIC;
    rx_dly_rdy_1 : OUT STD_LOGIC;
    tx_vtc_rdy_1 : OUT STD_LOGIC;
    rx_vtc_rdy_1 : OUT STD_LOGIC;
    tx_dly_rdy_2 : OUT STD_LOGIC;
    rx_dly_rdy_2 : OUT STD_LOGIC;
    tx_vtc_rdy_2 : OUT STD_LOGIC;
    rx_vtc_rdy_2 : OUT STD_LOGIC;
    tx_dly_rdy_3 : OUT STD_LOGIC;
    rx_dly_rdy_3 : OUT STD_LOGIC;
    tx_vtc_rdy_3 : OUT STD_LOGIC;
    rx_vtc_rdy_3 : OUT STD_LOGIC;
    NETPKT_SendReady : OUT STD_LOGIC;
    NETPKT_RecvReady : OUT STD_LOGIC;
    STAT_CountSendUdpPackets : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    STAT_CountValidRecvUdpPackets : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    STAT_CountValidRecvArpPackets : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    STAT_CountInvalidRecvPackets : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    STAT_CountDroppedRecvPackets : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    DBG_EthConfig_State : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
    DBG_EthSend_State : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
    DBG_EthRecv_State : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
    DBG_RecvFifoPush_State : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
    DBG_RecvValid_MAC : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    DBG_RecvValid_IPv4 : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
    DBG_RecvValid_UDP : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    DBG_RecvValid_Payload : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    DBG_RecvValid_ARP : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
    DBG_ARPPacketTPA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    DBG_DeviceTPA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    DBG_SendType : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    DBG_RecvPacketFCS : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    DBG_RecvComputedCRC32 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    DBG_Recv_pkt_header_prog_full : OUT STD_LOGIC;
    DBG_RecvPacketSizeDWORDs : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
    DBG_RecvFIFOAvailableBytes : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
    DBG_RecvFIFOCount : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
    DBG_RecvFIFOCurrentPushDWORD : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
    DBG_RecvFIFOPktLengthDWORDs : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
    DBG_SendPacketRemainingFIFOPumpBytes : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    DBG_PacketSendPtr : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
    DBG_send_pkt_data_rd_en : OUT STD_LOGIC;
    DBG_SendPacketHeaderData : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    DBG_SendPacketBodyData : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    DBG_SendUDPPacketCount : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
  );
END design_1_EthernetController3_0_0;

ARCHITECTURE design_1_EthernetController3_0_0_arch OF design_1_EthernetController3_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF design_1_EthernetController3_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT EthernetController3 IS
    GENERIC (
      TX_INTER_PACKET_GAP_BYTES : INTEGER;
      RX_INTER_PACKET_GAP_BYTES : INTEGER;
      PAYLOAD_MAGIC_HEADER_BYTE : STD_LOGIC_VECTOR(7 DOWNTO 0);
      RX_ALLOW_BAD_FCS_CHECKSUM_FRAMES : BOOLEAN;
      RX_ALLOW_BAD_IPv4_CHECKSUM_FRAMES : BOOLEAN;
      RX_DISABLE_MAC_ADDR_FILTERING : BOOLEAN;
      RX_DISABLE_IPv4_ADDR_FILTERING : BOOLEAN;
      DEVICE_MAC_ADDRESS_OCTET_0 : STD_LOGIC_VECTOR(7 DOWNTO 0);
      DEVICE_MAC_ADDRESS_OCTET_1 : STD_LOGIC_VECTOR(7 DOWNTO 0);
      DEVICE_MAC_ADDRESS_OCTET_2 : STD_LOGIC_VECTOR(7 DOWNTO 0);
      DEVICE_MAC_ADDRESS_OCTET_3 : STD_LOGIC_VECTOR(7 DOWNTO 0);
      DEVICE_MAC_ADDRESS_OCTET_4 : STD_LOGIC_VECTOR(7 DOWNTO 0);
      DEVICE_MAC_ADDRESS_OCTET_5 : STD_LOGIC_VECTOR(7 DOWNTO 0);
      DEVICE_IPv4_ADDRESS_OCTET_0 : STD_LOGIC_VECTOR(7 DOWNTO 0);
      DEVICE_IPv4_ADDRESS_OCTET_1 : STD_LOGIC_VECTOR(7 DOWNTO 0);
      DEVICE_IPv4_ADDRESS_OCTET_2 : STD_LOGIC_VECTOR(7 DOWNTO 0);
      DEVICE_IPv4_ADDRESS_OCTET_3 : STD_LOGIC_VECTOR(7 DOWNTO 0);
      UDP_PROTOCOL_PORT_D2H : INTEGER;
      UDP_PROTOCOL_PORT_H2D : INTEGER;
      RECV_PKT_DATA_DWORD_CAPACITY : INTEGER
    );
    PORT (
      clk125 : IN STD_LOGIC;
      tx_en : OUT STD_LOGIC;
      tx_er : OUT STD_LOGIC;
      tx_data : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      rx_dv : IN STD_LOGIC;
      rx_er : IN STD_LOGIC;
      rx_data : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      mac_address : OUT STD_LOGIC_VECTOR(47 DOWNTO 0);
      speed_override : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      recv_pkt_header_prog_full : IN STD_LOGIC;
      recv_pkt_header_wr_data : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      recv_pkt_header_wr_en : OUT STD_LOGIC;
      recv_pkt_data_count : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
      recv_pkt_data_wr_data : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      recv_pkt_data_wr_en : OUT STD_LOGIC;
      send_pkt_header_empty : IN STD_LOGIC;
      send_pkt_header_rd_data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      send_pkt_header_rd_en : OUT STD_LOGIC;
      send_pkt_data_empty : IN STD_LOGIC;
      send_pkt_data_rd_data : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      send_pkt_data_rd_en : OUT STD_LOGIC;
      recv_scratch_addra : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
      recv_scratch_clka125 : OUT STD_LOGIC;
      recv_scratch_dina : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      recv_scratch_ena : OUT STD_LOGIC;
      recv_scratch_wea : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      recv_scratch_addrb : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
      recv_scratch_clkb125 : OUT STD_LOGIC;
      recv_scratch_doutb : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      recv_scratch_enb : OUT STD_LOGIC;
      signal_detect : OUT STD_LOGIC;
      gmii_isolate : IN STD_LOGIC;
      speed_is_10_100 : OUT STD_LOGIC;
      speed_is_100 : OUT STD_LOGIC;
      pcs_rst_out : OUT STD_LOGIC;
      phyaddr : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
      configuration_vector : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
      configuration_valid : OUT STD_LOGIC;
      an_adv_config_vector : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      an_adv_config_val : OUT STD_LOGIC;
      an_restart_config : OUT STD_LOGIC;
      phyBringupComplete : IN STD_LOGIC;
      status_vector : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      rx_locked : IN STD_LOGIC;
      tx_locked : IN STD_LOGIC;
      riu_valid_1 : OUT STD_LOGIC;
      riu_prsnt_1 : OUT STD_LOGIC;
      riu_rddata_1 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      riu_valid_2 : OUT STD_LOGIC;
      riu_prsnt_2 : OUT STD_LOGIC;
      riu_rddata_2 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      riu_valid_3 : OUT STD_LOGIC;
      riu_prsnt_3 : OUT STD_LOGIC;
      riu_rddata_3 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      tx_dly_rdy_1 : OUT STD_LOGIC;
      rx_dly_rdy_1 : OUT STD_LOGIC;
      tx_vtc_rdy_1 : OUT STD_LOGIC;
      rx_vtc_rdy_1 : OUT STD_LOGIC;
      tx_dly_rdy_2 : OUT STD_LOGIC;
      rx_dly_rdy_2 : OUT STD_LOGIC;
      tx_vtc_rdy_2 : OUT STD_LOGIC;
      rx_vtc_rdy_2 : OUT STD_LOGIC;
      tx_dly_rdy_3 : OUT STD_LOGIC;
      rx_dly_rdy_3 : OUT STD_LOGIC;
      tx_vtc_rdy_3 : OUT STD_LOGIC;
      rx_vtc_rdy_3 : OUT STD_LOGIC;
      NETPKT_SendReady : OUT STD_LOGIC;
      NETPKT_RecvReady : OUT STD_LOGIC;
      STAT_CountSendUdpPackets : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      STAT_CountValidRecvUdpPackets : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      STAT_CountValidRecvArpPackets : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      STAT_CountInvalidRecvPackets : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      STAT_CountDroppedRecvPackets : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      DBG_EthConfig_State : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
      DBG_EthSend_State : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
      DBG_EthRecv_State : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
      DBG_RecvFifoPush_State : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
      DBG_RecvValid_MAC : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      DBG_RecvValid_IPv4 : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
      DBG_RecvValid_UDP : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      DBG_RecvValid_Payload : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      DBG_RecvValid_ARP : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
      DBG_ARPPacketTPA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      DBG_DeviceTPA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      DBG_SendType : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      DBG_RecvPacketFCS : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      DBG_RecvComputedCRC32 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      DBG_Recv_pkt_header_prog_full : OUT STD_LOGIC;
      DBG_RecvPacketSizeDWORDs : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
      DBG_RecvFIFOAvailableBytes : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
      DBG_RecvFIFOCount : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
      DBG_RecvFIFOCurrentPushDWORD : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
      DBG_RecvFIFOPktLengthDWORDs : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
      DBG_SendPacketRemainingFIFOPumpBytes : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      DBG_PacketSendPtr : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
      DBG_send_pkt_data_rd_en : OUT STD_LOGIC;
      DBG_SendPacketHeaderData : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      DBG_SendPacketBodyData : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      DBG_SendUDPPacketCount : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
  END COMPONENT EthernetController3;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF design_1_EthernetController3_0_0_arch: ARCHITECTURE IS "EthernetController3,Vivado 2018.1_AR73068";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF design_1_EthernetController3_0_0_arch : ARCHITECTURE IS "design_1_EthernetController3_0_0,EthernetController3,{}";
  ATTRIBUTE CORE_GENERATION_INFO : STRING;
  ATTRIBUTE CORE_GENERATION_INFO OF design_1_EthernetController3_0_0_arch: ARCHITECTURE IS "design_1_EthernetController3_0_0,EthernetController3,{x_ipProduct=Vivado 2018.1_AR73068,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=EthernetController3,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL,TX_INTER_PACKET_GAP_BYTES=12,RX_INTER_PACKET_GAP_BYTES=1,PAYLOAD_MAGIC_HEADER_BYTE=0xA5,RX_ALLOW_BAD_FCS_CHECKSUM_FRAMES=false,RX_ALLOW_BAD_IPv4_CHECKSUM_FRAMES=false,RX_DISABLE_MAC_ADDR_FILTERING=false,RX_DISABLE_IPv4_ADDR_FILTERING=false,DEVICE_MAC_ADDRESS_OCTET" & 
"_0=0x00,DEVICE_MAC_ADDRESS_OCTET_1=0x0A,DEVICE_MAC_ADDRESS_OCTET_2=0x35,DEVICE_MAC_ADDRESS_OCTET_3=0x03,DEVICE_MAC_ADDRESS_OCTET_4=0x78,DEVICE_MAC_ADDRESS_OCTET_5=0xF1,DEVICE_IPv4_ADDRESS_OCTET_0=0xC0,DEVICE_IPv4_ADDRESS_OCTET_1=0xA8,DEVICE_IPv4_ADDRESS_OCTET_2=0x01,DEVICE_IPv4_ADDRESS_OCTET_3=0xAB,UDP_PROTOCOL_PORT_D2H=3128,UDP_PROTOCOL_PORT_H2D=3129,RECV_PKT_DATA_DWORD_CAPACITY=2048}";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF recv_scratch_enb: SIGNAL IS "xilinx.com:interface:bram:1.0 RecvScratchRDB EN";
  ATTRIBUTE X_INTERFACE_INFO OF recv_scratch_doutb: SIGNAL IS "xilinx.com:interface:bram:1.0 RecvScratchRDB DOUT";
  ATTRIBUTE X_INTERFACE_INFO OF recv_scratch_clkb125: SIGNAL IS "xilinx.com:interface:bram:1.0 RecvScratchRDB CLK";
  ATTRIBUTE X_INTERFACE_PARAMETER OF recv_scratch_addrb: SIGNAL IS "XIL_INTERFACENAME RecvScratchRDB, FREQ_HZ 125000000, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER";
  ATTRIBUTE X_INTERFACE_INFO OF recv_scratch_addrb: SIGNAL IS "xilinx.com:interface:bram:1.0 RecvScratchRDB ADDR";
  ATTRIBUTE X_INTERFACE_INFO OF recv_scratch_wea: SIGNAL IS "xilinx.com:interface:bram:1.0 RecvScratchWRA WE";
  ATTRIBUTE X_INTERFACE_INFO OF recv_scratch_ena: SIGNAL IS "xilinx.com:interface:bram:1.0 RecvScratchWRA EN";
  ATTRIBUTE X_INTERFACE_INFO OF recv_scratch_dina: SIGNAL IS "xilinx.com:interface:bram:1.0 RecvScratchWRA DIN";
  ATTRIBUTE X_INTERFACE_INFO OF recv_scratch_clka125: SIGNAL IS "xilinx.com:interface:bram:1.0 RecvScratchWRA CLK";
  ATTRIBUTE X_INTERFACE_PARAMETER OF recv_scratch_addra: SIGNAL IS "XIL_INTERFACENAME RecvScratchWRA, FREQ_HZ 125000000, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER";
  ATTRIBUTE X_INTERFACE_INFO OF recv_scratch_addra: SIGNAL IS "xilinx.com:interface:bram:1.0 RecvScratchWRA ADDR";
  ATTRIBUTE X_INTERFACE_INFO OF send_pkt_data_rd_en: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 send_pkt_data RD_EN";
  ATTRIBUTE X_INTERFACE_INFO OF send_pkt_data_rd_data: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 send_pkt_data RD_DATA";
  ATTRIBUTE X_INTERFACE_INFO OF send_pkt_data_empty: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 send_pkt_data EMPTY";
  ATTRIBUTE X_INTERFACE_INFO OF send_pkt_header_rd_en: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 send_pkt_header RD_EN";
  ATTRIBUTE X_INTERFACE_INFO OF send_pkt_header_rd_data: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 send_pkt_header RD_DATA";
  ATTRIBUTE X_INTERFACE_INFO OF send_pkt_header_empty: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 send_pkt_header EMPTY";
  ATTRIBUTE X_INTERFACE_INFO OF recv_pkt_data_wr_en: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 recv_pkt_data WR_EN";
  ATTRIBUTE X_INTERFACE_INFO OF recv_pkt_data_wr_data: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 recv_pkt_data WR_DATA";
  ATTRIBUTE X_INTERFACE_INFO OF recv_pkt_header_wr_en: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 recv_pkt_header WR_EN";
  ATTRIBUTE X_INTERFACE_INFO OF recv_pkt_header_wr_data: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 recv_pkt_header WR_DATA";
  ATTRIBUTE X_INTERFACE_INFO OF rx_data: SIGNAL IS "xilinx.com:interface:gmii:1.0 GMII RXD";
  ATTRIBUTE X_INTERFACE_INFO OF rx_er: SIGNAL IS "xilinx.com:interface:gmii:1.0 GMII RX_ER";
  ATTRIBUTE X_INTERFACE_INFO OF rx_dv: SIGNAL IS "xilinx.com:interface:gmii:1.0 GMII RX_DV";
  ATTRIBUTE X_INTERFACE_INFO OF tx_data: SIGNAL IS "xilinx.com:interface:gmii:1.0 GMII TXD";
  ATTRIBUTE X_INTERFACE_INFO OF tx_er: SIGNAL IS "xilinx.com:interface:gmii:1.0 GMII TX_ER";
  ATTRIBUTE X_INTERFACE_INFO OF tx_en: SIGNAL IS "xilinx.com:interface:gmii:1.0 GMII TX_EN";
  ATTRIBUTE X_INTERFACE_PARAMETER OF clk125: SIGNAL IS "XIL_INTERFACENAME clk125, FREQ_HZ 125000000, PHASE 0, CLK_DOMAIN design_1_gig_ethernet_pcs_pma_0_0_clk125_out";
  ATTRIBUTE X_INTERFACE_INFO OF clk125: SIGNAL IS "xilinx.com:signal:clock:1.0 clk125 CLK";
BEGIN
  U0 : EthernetController3
    GENERIC MAP (
      TX_INTER_PACKET_GAP_BYTES => 12,
      RX_INTER_PACKET_GAP_BYTES => 1,
      PAYLOAD_MAGIC_HEADER_BYTE => X"A5",
      RX_ALLOW_BAD_FCS_CHECKSUM_FRAMES => false,
      RX_ALLOW_BAD_IPv4_CHECKSUM_FRAMES => false,
      RX_DISABLE_MAC_ADDR_FILTERING => false,
      RX_DISABLE_IPv4_ADDR_FILTERING => false,
      DEVICE_MAC_ADDRESS_OCTET_0 => X"00",
      DEVICE_MAC_ADDRESS_OCTET_1 => X"0A",
      DEVICE_MAC_ADDRESS_OCTET_2 => X"35",
      DEVICE_MAC_ADDRESS_OCTET_3 => X"03",
      DEVICE_MAC_ADDRESS_OCTET_4 => X"78",
      DEVICE_MAC_ADDRESS_OCTET_5 => X"F1",
      DEVICE_IPv4_ADDRESS_OCTET_0 => X"C0",
      DEVICE_IPv4_ADDRESS_OCTET_1 => X"A8",
      DEVICE_IPv4_ADDRESS_OCTET_2 => X"01",
      DEVICE_IPv4_ADDRESS_OCTET_3 => X"AB",
      UDP_PROTOCOL_PORT_D2H => 3128,
      UDP_PROTOCOL_PORT_H2D => 3129,
      RECV_PKT_DATA_DWORD_CAPACITY => 2048
    )
    PORT MAP (
      clk125 => clk125,
      tx_en => tx_en,
      tx_er => tx_er,
      tx_data => tx_data,
      rx_dv => rx_dv,
      rx_er => rx_er,
      rx_data => rx_data,
      mac_address => mac_address,
      speed_override => speed_override,
      recv_pkt_header_prog_full => recv_pkt_header_prog_full,
      recv_pkt_header_wr_data => recv_pkt_header_wr_data,
      recv_pkt_header_wr_en => recv_pkt_header_wr_en,
      recv_pkt_data_count => recv_pkt_data_count,
      recv_pkt_data_wr_data => recv_pkt_data_wr_data,
      recv_pkt_data_wr_en => recv_pkt_data_wr_en,
      send_pkt_header_empty => send_pkt_header_empty,
      send_pkt_header_rd_data => send_pkt_header_rd_data,
      send_pkt_header_rd_en => send_pkt_header_rd_en,
      send_pkt_data_empty => send_pkt_data_empty,
      send_pkt_data_rd_data => send_pkt_data_rd_data,
      send_pkt_data_rd_en => send_pkt_data_rd_en,
      recv_scratch_addra => recv_scratch_addra,
      recv_scratch_clka125 => recv_scratch_clka125,
      recv_scratch_dina => recv_scratch_dina,
      recv_scratch_ena => recv_scratch_ena,
      recv_scratch_wea => recv_scratch_wea,
      recv_scratch_addrb => recv_scratch_addrb,
      recv_scratch_clkb125 => recv_scratch_clkb125,
      recv_scratch_doutb => recv_scratch_doutb,
      recv_scratch_enb => recv_scratch_enb,
      signal_detect => signal_detect,
      gmii_isolate => gmii_isolate,
      speed_is_10_100 => speed_is_10_100,
      speed_is_100 => speed_is_100,
      pcs_rst_out => pcs_rst_out,
      phyaddr => phyaddr,
      configuration_vector => configuration_vector,
      configuration_valid => configuration_valid,
      an_adv_config_vector => an_adv_config_vector,
      an_adv_config_val => an_adv_config_val,
      an_restart_config => an_restart_config,
      phyBringupComplete => phyBringupComplete,
      status_vector => status_vector,
      rx_locked => rx_locked,
      tx_locked => tx_locked,
      riu_valid_1 => riu_valid_1,
      riu_prsnt_1 => riu_prsnt_1,
      riu_rddata_1 => riu_rddata_1,
      riu_valid_2 => riu_valid_2,
      riu_prsnt_2 => riu_prsnt_2,
      riu_rddata_2 => riu_rddata_2,
      riu_valid_3 => riu_valid_3,
      riu_prsnt_3 => riu_prsnt_3,
      riu_rddata_3 => riu_rddata_3,
      tx_dly_rdy_1 => tx_dly_rdy_1,
      rx_dly_rdy_1 => rx_dly_rdy_1,
      tx_vtc_rdy_1 => tx_vtc_rdy_1,
      rx_vtc_rdy_1 => rx_vtc_rdy_1,
      tx_dly_rdy_2 => tx_dly_rdy_2,
      rx_dly_rdy_2 => rx_dly_rdy_2,
      tx_vtc_rdy_2 => tx_vtc_rdy_2,
      rx_vtc_rdy_2 => rx_vtc_rdy_2,
      tx_dly_rdy_3 => tx_dly_rdy_3,
      rx_dly_rdy_3 => rx_dly_rdy_3,
      tx_vtc_rdy_3 => tx_vtc_rdy_3,
      rx_vtc_rdy_3 => rx_vtc_rdy_3,
      NETPKT_SendReady => NETPKT_SendReady,
      NETPKT_RecvReady => NETPKT_RecvReady,
      STAT_CountSendUdpPackets => STAT_CountSendUdpPackets,
      STAT_CountValidRecvUdpPackets => STAT_CountValidRecvUdpPackets,
      STAT_CountValidRecvArpPackets => STAT_CountValidRecvArpPackets,
      STAT_CountInvalidRecvPackets => STAT_CountInvalidRecvPackets,
      STAT_CountDroppedRecvPackets => STAT_CountDroppedRecvPackets,
      DBG_EthConfig_State => DBG_EthConfig_State,
      DBG_EthSend_State => DBG_EthSend_State,
      DBG_EthRecv_State => DBG_EthRecv_State,
      DBG_RecvFifoPush_State => DBG_RecvFifoPush_State,
      DBG_RecvValid_MAC => DBG_RecvValid_MAC,
      DBG_RecvValid_IPv4 => DBG_RecvValid_IPv4,
      DBG_RecvValid_UDP => DBG_RecvValid_UDP,
      DBG_RecvValid_Payload => DBG_RecvValid_Payload,
      DBG_RecvValid_ARP => DBG_RecvValid_ARP,
      DBG_ARPPacketTPA => DBG_ARPPacketTPA,
      DBG_DeviceTPA => DBG_DeviceTPA,
      DBG_SendType => DBG_SendType,
      DBG_RecvPacketFCS => DBG_RecvPacketFCS,
      DBG_RecvComputedCRC32 => DBG_RecvComputedCRC32,
      DBG_Recv_pkt_header_prog_full => DBG_Recv_pkt_header_prog_full,
      DBG_RecvPacketSizeDWORDs => DBG_RecvPacketSizeDWORDs,
      DBG_RecvFIFOAvailableBytes => DBG_RecvFIFOAvailableBytes,
      DBG_RecvFIFOCount => DBG_RecvFIFOCount,
      DBG_RecvFIFOCurrentPushDWORD => DBG_RecvFIFOCurrentPushDWORD,
      DBG_RecvFIFOPktLengthDWORDs => DBG_RecvFIFOPktLengthDWORDs,
      DBG_SendPacketRemainingFIFOPumpBytes => DBG_SendPacketRemainingFIFOPumpBytes,
      DBG_PacketSendPtr => DBG_PacketSendPtr,
      DBG_send_pkt_data_rd_en => DBG_send_pkt_data_rd_en,
      DBG_SendPacketHeaderData => DBG_SendPacketHeaderData,
      DBG_SendPacketBodyData => DBG_SendPacketBodyData,
      DBG_SendUDPPacketCount => DBG_SendUDPPacketCount
    );
END design_1_EthernetController3_0_0_arch;
