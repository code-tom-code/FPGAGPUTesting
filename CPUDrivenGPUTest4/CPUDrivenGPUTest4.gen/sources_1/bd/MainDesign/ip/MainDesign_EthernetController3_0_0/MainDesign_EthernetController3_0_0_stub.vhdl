-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
-- Date        : Sun Dec 21 17:59:20 2025
-- Host        : TomTop3 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/Tom/Documents/repos/FPGAGPUTesting/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_EthernetController3_0_0/MainDesign_EthernetController3_0_0_stub.vhdl
-- Design      : MainDesign_EthernetController3_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MainDesign_EthernetController3_0_0 is
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
    send_pkt_header_almost_empty : in STD_LOGIC;
    send_pkt_header_rd_data : in STD_LOGIC_VECTOR ( 31 downto 0 );
    send_pkt_header_rd_en : out STD_LOGIC;
    send_pkt_data_empty : in STD_LOGIC;
    send_pkt_data_almost_empty : in STD_LOGIC;
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

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of MainDesign_EthernetController3_0_0 : entity is "MainDesign_EthernetController3_0_0,EthernetController3,{}";
  attribute core_generation_info : string;
  attribute core_generation_info of MainDesign_EthernetController3_0_0 : entity is "MainDesign_EthernetController3_0_0,EthernetController3,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=EthernetController3,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL,TX_INTER_PACKET_GAP_BYTES=12,RX_INTER_PACKET_GAP_BYTES=1,PAYLOAD_MAGIC_HEADER_BYTE=0xA5,RX_ALLOW_BAD_FCS_CHECKSUM_FRAMES=false,RX_ALLOW_BAD_IPv4_CHECKSUM_FRAMES=false,RX_DISABLE_MAC_ADDR_FILTERING=false,RX_DISABLE_IPv4_ADDR_FILTERING=false,DEVICE_MAC_ADDRESS_OCTET_0=0x00,DEVICE_MAC_ADDRESS_OCTET_1=0x0A,DEVICE_MAC_ADDRESS_OCTET_2=0x35,DEVICE_MAC_ADDRESS_OCTET_3=0x03,DEVICE_MAC_ADDRESS_OCTET_4=0x78,DEVICE_MAC_ADDRESS_OCTET_5=0xF1,DEVICE_IPv4_ADDRESS_OCTET_0=0xC0,DEVICE_IPv4_ADDRESS_OCTET_1=0xA8,DEVICE_IPv4_ADDRESS_OCTET_2=0x01,DEVICE_IPv4_ADDRESS_OCTET_3=0xAB,UDP_PROTOCOL_PORT_D2H=3128,UDP_PROTOCOL_PORT_H2D=3129,RECV_PKT_DATA_DWORD_CAPACITY=2048}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of MainDesign_EthernetController3_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of MainDesign_EthernetController3_0_0 : entity is "module_ref";
end MainDesign_EthernetController3_0_0;

architecture stub of MainDesign_EthernetController3_0_0 is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "clk125,tx_en,tx_er,tx_data[7:0],rx_dv,rx_er,rx_data[7:0],mac_address[47:0],speed_override[1:0],recv_pkt_header_prog_full,recv_pkt_header_wr_data[31:0],recv_pkt_header_wr_en,recv_pkt_data_count[10:0],recv_pkt_data_wr_data[31:0],recv_pkt_data_wr_en,send_pkt_header_empty,send_pkt_header_almost_empty,send_pkt_header_rd_data[31:0],send_pkt_header_rd_en,send_pkt_data_empty,send_pkt_data_almost_empty,send_pkt_data_rd_data[7:0],send_pkt_data_rd_en,recv_scratch_addra[10:0],recv_scratch_clka125,recv_scratch_dina[7:0],recv_scratch_ena,recv_scratch_wea[0:0],recv_scratch_addrb[8:0],recv_scratch_clkb125,recv_scratch_doutb[31:0],recv_scratch_enb,signal_detect,gmii_isolate,speed_is_10_100,speed_is_100,pcs_rst_out,phyaddr[4:0],configuration_vector[4:0],configuration_valid,an_adv_config_vector[15:0],an_adv_config_val,an_restart_config,phyBringupComplete,status_vector[15:0],rx_locked,tx_locked,riu_valid_1,riu_prsnt_1,riu_rddata_1[15:0],riu_valid_2,riu_prsnt_2,riu_rddata_2[15:0],riu_valid_3,riu_prsnt_3,riu_rddata_3[15:0],tx_dly_rdy_1,rx_dly_rdy_1,tx_vtc_rdy_1,rx_vtc_rdy_1,tx_dly_rdy_2,rx_dly_rdy_2,tx_vtc_rdy_2,rx_vtc_rdy_2,tx_dly_rdy_3,rx_dly_rdy_3,tx_vtc_rdy_3,rx_vtc_rdy_3,NETPKT_SendReady,NETPKT_RecvReady,STAT_CountSendUdpPackets[31:0],STAT_CountValidRecvUdpPackets[31:0],STAT_CountValidRecvArpPackets[31:0],STAT_CountInvalidRecvPackets[31:0],STAT_CountDroppedRecvPackets[31:0],DBG_EthConfig_State[4:0],DBG_EthSend_State[4:0],DBG_EthRecv_State[4:0],DBG_RecvFifoPush_State[4:0],DBG_RecvValid_MAC[2:0],DBG_RecvValid_IPv4[5:0],DBG_RecvValid_UDP[0:0],DBG_RecvValid_Payload[0:0],DBG_RecvValid_ARP[6:0],DBG_ARPPacketTPA[31:0],DBG_DeviceTPA[31:0],DBG_SendType[1:0],DBG_RecvPacketFCS[31:0],DBG_RecvComputedCRC32[31:0],DBG_Recv_pkt_header_prog_full,DBG_RecvPacketSizeDWORDs[11:0],DBG_RecvFIFOAvailableBytes[10:0],DBG_RecvFIFOCount[10:0],DBG_RecvFIFOCurrentPushDWORD[8:0],DBG_RecvFIFOPktLengthDWORDs[11:0],DBG_SendPacketRemainingFIFOPumpBytes[1:0],DBG_PacketSendPtr[11:0],DBG_send_pkt_data_rd_en,DBG_SendPacketHeaderData[31:0],DBG_SendPacketBodyData[7:0],DBG_SendUDPPacketCount[7:0]";
  attribute x_interface_info : string;
  attribute x_interface_info of clk125 : signal is "xilinx.com:signal:clock:1.0 clk125 CLK";
  attribute x_interface_mode : string;
  attribute x_interface_mode of clk125 : signal is "slave clk125";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk125 : signal is "XIL_INTERFACENAME clk125, FREQ_HZ 125000000, ASSOCIATED_BUSIF GMII:send_pkt_header:send_pkt_data:recv_pkt_header:recv_pkt_data:RecvScratchWRA:RecvScratchRDB, FREQ_TOLERANCE_HZ 0, PHASE 0, CLK_DOMAIN MainDesign_gig_ethernet_pcs_pma_0_0_clk125_out, INSERT_VIP 0";
  attribute x_interface_info of tx_en : signal is "xilinx.com:interface:gmii:1.0 GMII TX_EN";
  attribute x_interface_mode of tx_en : signal is "master GMII";
  attribute x_interface_info of tx_er : signal is "xilinx.com:interface:gmii:1.0 GMII TX_ER";
  attribute x_interface_info of tx_data : signal is "xilinx.com:interface:gmii:1.0 GMII TXD";
  attribute x_interface_info of rx_dv : signal is "xilinx.com:interface:gmii:1.0 GMII RX_DV";
  attribute x_interface_info of rx_er : signal is "xilinx.com:interface:gmii:1.0 GMII RX_ER";
  attribute x_interface_info of rx_data : signal is "xilinx.com:interface:gmii:1.0 GMII RXD";
  attribute x_interface_info of recv_pkt_header_wr_data : signal is "xilinx.com:interface:fifo_write:1.0 recv_pkt_header WR_DATA";
  attribute x_interface_mode of recv_pkt_header_wr_data : signal is "master recv_pkt_header";
  attribute x_interface_info of recv_pkt_header_wr_en : signal is "xilinx.com:interface:fifo_write:1.0 recv_pkt_header WR_EN";
  attribute x_interface_info of recv_pkt_data_wr_data : signal is "xilinx.com:interface:fifo_write:1.0 recv_pkt_data WR_DATA";
  attribute x_interface_mode of recv_pkt_data_wr_data : signal is "master recv_pkt_data";
  attribute x_interface_info of recv_pkt_data_wr_en : signal is "xilinx.com:interface:fifo_write:1.0 recv_pkt_data WR_EN";
  attribute x_interface_info of send_pkt_header_empty : signal is "xilinx.com:interface:fifo_read:1.0 send_pkt_header EMPTY";
  attribute x_interface_mode of send_pkt_header_empty : signal is "master send_pkt_header";
  attribute x_interface_info of send_pkt_header_almost_empty : signal is "xilinx.com:interface:fifo_read:1.0 send_pkt_header ALMOST_EMPTY";
  attribute x_interface_info of send_pkt_header_rd_data : signal is "xilinx.com:interface:fifo_read:1.0 send_pkt_header RD_DATA";
  attribute x_interface_mode of send_pkt_header_rd_data : signal is "master";
  attribute x_interface_info of send_pkt_header_rd_en : signal is "xilinx.com:interface:fifo_read:1.0 send_pkt_header RD_EN";
  attribute x_interface_info of send_pkt_data_empty : signal is "xilinx.com:interface:fifo_read:1.0 send_pkt_data EMPTY";
  attribute x_interface_mode of send_pkt_data_empty : signal is "master send_pkt_data";
  attribute x_interface_info of send_pkt_data_almost_empty : signal is "xilinx.com:interface:fifo_read:1.0 send_pkt_data ALMOST_EMPTY";
  attribute x_interface_info of send_pkt_data_rd_data : signal is "xilinx.com:interface:fifo_read:1.0 send_pkt_data RD_DATA";
  attribute x_interface_mode of send_pkt_data_rd_data : signal is "master";
  attribute x_interface_info of send_pkt_data_rd_en : signal is "xilinx.com:interface:fifo_read:1.0 send_pkt_data RD_EN";
  attribute x_interface_info of recv_scratch_addra : signal is "xilinx.com:interface:bram:1.0 RecvScratchWRA ADDR";
  attribute x_interface_mode of recv_scratch_addra : signal is "master RecvScratchWRA";
  attribute x_interface_parameter of recv_scratch_addra : signal is "XIL_INTERFACENAME RecvScratchWRA, FREQ_HZ 125000000, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1";
  attribute x_interface_info of recv_scratch_clka125 : signal is "xilinx.com:interface:bram:1.0 RecvScratchWRA CLK";
  attribute x_interface_info of recv_scratch_dina : signal is "xilinx.com:interface:bram:1.0 RecvScratchWRA DIN";
  attribute x_interface_info of recv_scratch_ena : signal is "xilinx.com:interface:bram:1.0 RecvScratchWRA EN";
  attribute x_interface_info of recv_scratch_wea : signal is "xilinx.com:interface:bram:1.0 RecvScratchWRA WE";
  attribute x_interface_info of recv_scratch_addrb : signal is "xilinx.com:interface:bram:1.0 RecvScratchRDB ADDR";
  attribute x_interface_mode of recv_scratch_addrb : signal is "master RecvScratchRDB";
  attribute x_interface_parameter of recv_scratch_addrb : signal is "XIL_INTERFACENAME RecvScratchRDB, FREQ_HZ 125000000, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1";
  attribute x_interface_info of recv_scratch_clkb125 : signal is "xilinx.com:interface:bram:1.0 RecvScratchRDB CLK";
  attribute x_interface_info of recv_scratch_doutb : signal is "xilinx.com:interface:bram:1.0 RecvScratchRDB DOUT";
  attribute x_interface_info of recv_scratch_enb : signal is "xilinx.com:interface:bram:1.0 RecvScratchRDB EN";
  attribute x_core_info : string;
  attribute x_core_info of stub : architecture is "EthernetController3,Vivado 2025.2";
begin
end;
