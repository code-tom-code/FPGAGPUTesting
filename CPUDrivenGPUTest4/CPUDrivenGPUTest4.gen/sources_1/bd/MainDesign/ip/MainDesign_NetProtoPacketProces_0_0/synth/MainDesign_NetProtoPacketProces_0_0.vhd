-- (c) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- (c) Copyright 2022-2025 Advanced Micro Devices, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of AMD and is protected under U.S. and international copyright
-- and other intellectual property laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- AMD, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) AMD shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or AMD had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- AMD products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of AMD products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:module_ref:NetProtoPacketProcessor:1.0
-- IP Revision: 1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY MainDesign_NetProtoPacketProces_0_0 IS
  PORT (
    clk333_250 : IN STD_LOGIC;
    recv_pkt_header_empty : IN STD_LOGIC;
    recv_pkt_header_almost_empty : IN STD_LOGIC;
    recv_pkt_header_rd_data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    recv_pkt_header_rd_en : OUT STD_LOGIC;
    recv_pkt_data_empty : IN STD_LOGIC;
    recv_pkt_data_almost_empty : IN STD_LOGIC;
    recv_pkt_data_rd_data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    recv_pkt_data_rd_en : OUT STD_LOGIC;
    send_pkt_header_prog_full : IN STD_LOGIC;
    send_pkt_header_wr_data : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    send_pkt_header_wr_en : OUT STD_LOGIC;
    send_pkt_data_count : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
    send_pkt_data_wr_data : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    send_pkt_data_wr_en : OUT STD_LOGIC;
    ETHCTRL_SendReady : IN STD_LOGIC;
    ETHCTRL_RecvReady : IN STD_LOGIC;
    validPacketsFIFO_wr_data : OUT STD_LOGIC_VECTOR(87 DOWNTO 0);
    validPacketsFIFO_full : IN STD_LOGIC;
    validPacketsFIFO_prog_full : IN STD_LOGIC;
    validPacketsFIFO_wr_en : OUT STD_LOGIC;
    returnPacketsFIFO_empty : IN STD_LOGIC;
    returnPacketsFIFO_almost_empty : IN STD_LOGIC;
    returnPacketsFIFO_rd_data : IN STD_LOGIC_VECTOR(87 DOWNTO 0);
    returnPacketsFIFO_rd_en : OUT STD_LOGIC;
    sendBRAM_addra : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
    sendBRAM_clka : OUT STD_LOGIC;
    sendBRAM_dina : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    sendBRAM_ena : OUT STD_LOGIC;
    sendBRAM_wea : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    sendBRAM_addrb : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
    sendBRAM_clkb : OUT STD_LOGIC;
    sendBRAM_doutb : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    sendBRAM_enb : OUT STD_LOGIC;
    STAT_SendSessionPackets : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    STAT_RecvSessionPacketsValid : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    STAT_RecvSessionPacketsInvalid : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    STAT_RecvSessionPacketsDropped : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    DBG_NetPkt_State : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
    DBG_SendFIFOState : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
    DBG_RecvFIFOState : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
    DBG_RecvSessionParseState : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
    DBG_SendPacketState : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
    DBG_recvSendReplyPacket : OUT STD_LOGIC;
    DBG_sendReplyAck : OUT STD_LOGIC;
    DBG_sendHandlingReply : OUT STD_LOGIC;
    DBG_recvPacketData : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    DBG_recvCurrentSubpacketOffset : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    DBG_recvCurrentSubpacket : OUT STD_LOGIC_VECTOR(71 DOWNTO 0);
    DBG_recvValid_Session : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    DBG_recvHeaderChecksum : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    DBG_discardPacketReason : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    DBG_sendLastAckedPacketID : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    DBG_recvLastSendAckedPacketID : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    DBG_recvLastAckedPacketID : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    DBG_sendCyclesBetweenAutoResends : OUT STD_LOGIC_VECTOR(27 DOWNTO 0);
    DBG_recvCurrentSubpacketIndex : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    DBG_recvCurrentPacketLength : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    DBG_returnPacketsFIFO_empty : OUT STD_LOGIC;
    DBG_returnPacketsFIFO_rd_en : OUT STD_LOGIC;
    DBG_returnPacketsFIFO_rd_data : OUT STD_LOGIC_VECTOR(87 DOWNTO 0);
    DBG_sendHasUnackedSentPacket : OUT STD_LOGIC;
    DBG_send_pkt_header_prog_full : OUT STD_LOGIC
  );
END MainDesign_NetProtoPacketProces_0_0;

ARCHITECTURE MainDesign_NetProtoPacketProces_0_0_arch OF MainDesign_NetProtoPacketProces_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF MainDesign_NetProtoPacketProces_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT NetProtoPacketProcessor IS
    GENERIC (
      NET_PROTOCOL_MAJOR_VERSION : INTEGER;
      NET_PROTOCOL_MINOR_VERSION : INTEGER;
      SEND_PKT_DATA_CAPACITY_DWORDS : INTEGER
    );
    PORT (
      clk333_250 : IN STD_LOGIC;
      recv_pkt_header_empty : IN STD_LOGIC;
      recv_pkt_header_almost_empty : IN STD_LOGIC;
      recv_pkt_header_rd_data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      recv_pkt_header_rd_en : OUT STD_LOGIC;
      recv_pkt_data_empty : IN STD_LOGIC;
      recv_pkt_data_almost_empty : IN STD_LOGIC;
      recv_pkt_data_rd_data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      recv_pkt_data_rd_en : OUT STD_LOGIC;
      send_pkt_header_prog_full : IN STD_LOGIC;
      send_pkt_header_wr_data : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      send_pkt_header_wr_en : OUT STD_LOGIC;
      send_pkt_data_count : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
      send_pkt_data_wr_data : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      send_pkt_data_wr_en : OUT STD_LOGIC;
      ETHCTRL_SendReady : IN STD_LOGIC;
      ETHCTRL_RecvReady : IN STD_LOGIC;
      validPacketsFIFO_wr_data : OUT STD_LOGIC_VECTOR(87 DOWNTO 0);
      validPacketsFIFO_full : IN STD_LOGIC;
      validPacketsFIFO_prog_full : IN STD_LOGIC;
      validPacketsFIFO_wr_en : OUT STD_LOGIC;
      returnPacketsFIFO_empty : IN STD_LOGIC;
      returnPacketsFIFO_almost_empty : IN STD_LOGIC;
      returnPacketsFIFO_rd_data : IN STD_LOGIC_VECTOR(87 DOWNTO 0);
      returnPacketsFIFO_rd_en : OUT STD_LOGIC;
      sendBRAM_addra : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
      sendBRAM_clka : OUT STD_LOGIC;
      sendBRAM_dina : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      sendBRAM_ena : OUT STD_LOGIC;
      sendBRAM_wea : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      sendBRAM_addrb : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
      sendBRAM_clkb : OUT STD_LOGIC;
      sendBRAM_doutb : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      sendBRAM_enb : OUT STD_LOGIC;
      STAT_SendSessionPackets : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      STAT_RecvSessionPacketsValid : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      STAT_RecvSessionPacketsInvalid : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      STAT_RecvSessionPacketsDropped : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      DBG_NetPkt_State : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
      DBG_SendFIFOState : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
      DBG_RecvFIFOState : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
      DBG_RecvSessionParseState : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
      DBG_SendPacketState : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
      DBG_recvSendReplyPacket : OUT STD_LOGIC;
      DBG_sendReplyAck : OUT STD_LOGIC;
      DBG_sendHandlingReply : OUT STD_LOGIC;
      DBG_recvPacketData : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
      DBG_recvCurrentSubpacketOffset : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      DBG_recvCurrentSubpacket : OUT STD_LOGIC_VECTOR(71 DOWNTO 0);
      DBG_recvValid_Session : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      DBG_recvHeaderChecksum : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      DBG_discardPacketReason : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      DBG_sendLastAckedPacketID : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      DBG_recvLastSendAckedPacketID : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      DBG_recvLastAckedPacketID : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      DBG_sendCyclesBetweenAutoResends : OUT STD_LOGIC_VECTOR(27 DOWNTO 0);
      DBG_recvCurrentSubpacketIndex : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      DBG_recvCurrentPacketLength : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      DBG_returnPacketsFIFO_empty : OUT STD_LOGIC;
      DBG_returnPacketsFIFO_rd_en : OUT STD_LOGIC;
      DBG_returnPacketsFIFO_rd_data : OUT STD_LOGIC_VECTOR(87 DOWNTO 0);
      DBG_sendHasUnackedSentPacket : OUT STD_LOGIC;
      DBG_send_pkt_header_prog_full : OUT STD_LOGIC
    );
  END COMPONENT NetProtoPacketProcessor;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF MainDesign_NetProtoPacketProces_0_0_arch: ARCHITECTURE IS "NetProtoPacketProcessor,Vivado 2025.2";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF MainDesign_NetProtoPacketProces_0_0_arch : ARCHITECTURE IS "MainDesign_NetProtoPacketProces_0_0,NetProtoPacketProcessor,{}";
  ATTRIBUTE CORE_GENERATION_INFO : STRING;
  ATTRIBUTE CORE_GENERATION_INFO OF MainDesign_NetProtoPacketProces_0_0_arch: ARCHITECTURE IS "MainDesign_NetProtoPacketProces_0_0,NetProtoPacketProcessor,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=NetProtoPacketProcessor,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL,NET_PROTOCOL_MAJOR_VERSION=1,NET_PROTOCOL_MINOR_VERSION=0,SEND_PKT_DATA_CAPACITY_DWORDS=2048}";
  ATTRIBUTE IP_DEFINITION_SOURCE : STRING;
  ATTRIBUTE IP_DEFINITION_SOURCE OF MainDesign_NetProtoPacketProces_0_0_arch: ARCHITECTURE IS "module_ref";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_MODE : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF clk333_250: SIGNAL IS "xilinx.com:signal:clock:1.0 clk333_250 CLK";
  ATTRIBUTE X_INTERFACE_MODE OF clk333_250: SIGNAL IS "slave clk333_250";
  ATTRIBUTE X_INTERFACE_PARAMETER OF clk333_250: SIGNAL IS "XIL_INTERFACENAME clk333_250, FREQ_HZ 333250000, ASSOCIATED_BUSIF recv_pkt_header:recv_pkt_data:send_pkt_header:send_pkt_data:validPacketsFIFO:returnPacketsFIFO:SendPacketBRAMW:SendPacketBRAMR, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF recv_pkt_data_almost_empty: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 recv_pkt_data ALMOST_EMPTY";
  ATTRIBUTE X_INTERFACE_INFO OF recv_pkt_data_empty: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 recv_pkt_data EMPTY";
  ATTRIBUTE X_INTERFACE_MODE OF recv_pkt_data_empty: SIGNAL IS "master recv_pkt_data";
  ATTRIBUTE X_INTERFACE_INFO OF recv_pkt_data_rd_data: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 recv_pkt_data RD_DATA";
  ATTRIBUTE X_INTERFACE_INFO OF recv_pkt_data_rd_en: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 recv_pkt_data RD_EN";
  ATTRIBUTE X_INTERFACE_INFO OF recv_pkt_header_almost_empty: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 recv_pkt_header ALMOST_EMPTY";
  ATTRIBUTE X_INTERFACE_INFO OF recv_pkt_header_empty: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 recv_pkt_header EMPTY";
  ATTRIBUTE X_INTERFACE_MODE OF recv_pkt_header_empty: SIGNAL IS "master recv_pkt_header";
  ATTRIBUTE X_INTERFACE_INFO OF recv_pkt_header_rd_data: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 recv_pkt_header RD_DATA";
  ATTRIBUTE X_INTERFACE_INFO OF recv_pkt_header_rd_en: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 recv_pkt_header RD_EN";
  ATTRIBUTE X_INTERFACE_INFO OF returnPacketsFIFO_almost_empty: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 returnPacketsFIFO ALMOST_EMPTY";
  ATTRIBUTE X_INTERFACE_INFO OF returnPacketsFIFO_empty: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 returnPacketsFIFO EMPTY";
  ATTRIBUTE X_INTERFACE_MODE OF returnPacketsFIFO_empty: SIGNAL IS "master returnPacketsFIFO";
  ATTRIBUTE X_INTERFACE_INFO OF returnPacketsFIFO_rd_data: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 returnPacketsFIFO RD_DATA";
  ATTRIBUTE X_INTERFACE_INFO OF returnPacketsFIFO_rd_en: SIGNAL IS "xilinx.com:interface:fifo_read:1.0 returnPacketsFIFO RD_EN";
  ATTRIBUTE X_INTERFACE_INFO OF sendBRAM_addra: SIGNAL IS "xilinx.com:interface:bram:1.0 SendPacketBRAMW ADDR";
  ATTRIBUTE X_INTERFACE_MODE OF sendBRAM_addra: SIGNAL IS "master SendPacketBRAMW";
  ATTRIBUTE X_INTERFACE_PARAMETER OF sendBRAM_addra: SIGNAL IS "XIL_INTERFACENAME SendPacketBRAMW, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1";
  ATTRIBUTE X_INTERFACE_INFO OF sendBRAM_addrb: SIGNAL IS "xilinx.com:interface:bram:1.0 SendPacketBRAMR ADDR";
  ATTRIBUTE X_INTERFACE_MODE OF sendBRAM_addrb: SIGNAL IS "master SendPacketBRAMR";
  ATTRIBUTE X_INTERFACE_PARAMETER OF sendBRAM_addrb: SIGNAL IS "XIL_INTERFACENAME SendPacketBRAMR, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1";
  ATTRIBUTE X_INTERFACE_INFO OF sendBRAM_clka: SIGNAL IS "xilinx.com:interface:bram:1.0 SendPacketBRAMW CLK";
  ATTRIBUTE X_INTERFACE_INFO OF sendBRAM_clkb: SIGNAL IS "xilinx.com:interface:bram:1.0 SendPacketBRAMR CLK";
  ATTRIBUTE X_INTERFACE_INFO OF sendBRAM_dina: SIGNAL IS "xilinx.com:interface:bram:1.0 SendPacketBRAMW DIN";
  ATTRIBUTE X_INTERFACE_INFO OF sendBRAM_doutb: SIGNAL IS "xilinx.com:interface:bram:1.0 SendPacketBRAMR DOUT";
  ATTRIBUTE X_INTERFACE_INFO OF sendBRAM_ena: SIGNAL IS "xilinx.com:interface:bram:1.0 SendPacketBRAMW EN";
  ATTRIBUTE X_INTERFACE_INFO OF sendBRAM_enb: SIGNAL IS "xilinx.com:interface:bram:1.0 SendPacketBRAMR EN";
  ATTRIBUTE X_INTERFACE_INFO OF sendBRAM_wea: SIGNAL IS "xilinx.com:interface:bram:1.0 SendPacketBRAMW WE";
  ATTRIBUTE X_INTERFACE_INFO OF send_pkt_data_wr_data: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 send_pkt_data WR_DATA";
  ATTRIBUTE X_INTERFACE_MODE OF send_pkt_data_wr_data: SIGNAL IS "master send_pkt_data";
  ATTRIBUTE X_INTERFACE_INFO OF send_pkt_data_wr_en: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 send_pkt_data WR_EN";
  ATTRIBUTE X_INTERFACE_INFO OF send_pkt_header_wr_data: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 send_pkt_header WR_DATA";
  ATTRIBUTE X_INTERFACE_MODE OF send_pkt_header_wr_data: SIGNAL IS "master send_pkt_header";
  ATTRIBUTE X_INTERFACE_INFO OF send_pkt_header_wr_en: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 send_pkt_header WR_EN";
  ATTRIBUTE X_INTERFACE_INFO OF validPacketsFIFO_full: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO FULL";
  ATTRIBUTE X_INTERFACE_INFO OF validPacketsFIFO_prog_full: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO ALMOST_FULL";
  ATTRIBUTE X_INTERFACE_INFO OF validPacketsFIFO_wr_data: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA";
  ATTRIBUTE X_INTERFACE_MODE OF validPacketsFIFO_wr_data: SIGNAL IS "master validPacketsFIFO";
  ATTRIBUTE X_INTERFACE_INFO OF validPacketsFIFO_wr_en: SIGNAL IS "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_EN";
BEGIN
  U0 : NetProtoPacketProcessor
    GENERIC MAP (
      NET_PROTOCOL_MAJOR_VERSION => 1,
      NET_PROTOCOL_MINOR_VERSION => 0,
      SEND_PKT_DATA_CAPACITY_DWORDS => 2048
    )
    PORT MAP (
      clk333_250 => clk333_250,
      recv_pkt_header_empty => recv_pkt_header_empty,
      recv_pkt_header_almost_empty => recv_pkt_header_almost_empty,
      recv_pkt_header_rd_data => recv_pkt_header_rd_data,
      recv_pkt_header_rd_en => recv_pkt_header_rd_en,
      recv_pkt_data_empty => recv_pkt_data_empty,
      recv_pkt_data_almost_empty => recv_pkt_data_almost_empty,
      recv_pkt_data_rd_data => recv_pkt_data_rd_data,
      recv_pkt_data_rd_en => recv_pkt_data_rd_en,
      send_pkt_header_prog_full => send_pkt_header_prog_full,
      send_pkt_header_wr_data => send_pkt_header_wr_data,
      send_pkt_header_wr_en => send_pkt_header_wr_en,
      send_pkt_data_count => send_pkt_data_count,
      send_pkt_data_wr_data => send_pkt_data_wr_data,
      send_pkt_data_wr_en => send_pkt_data_wr_en,
      ETHCTRL_SendReady => ETHCTRL_SendReady,
      ETHCTRL_RecvReady => ETHCTRL_RecvReady,
      validPacketsFIFO_wr_data => validPacketsFIFO_wr_data,
      validPacketsFIFO_full => validPacketsFIFO_full,
      validPacketsFIFO_prog_full => validPacketsFIFO_prog_full,
      validPacketsFIFO_wr_en => validPacketsFIFO_wr_en,
      returnPacketsFIFO_empty => returnPacketsFIFO_empty,
      returnPacketsFIFO_almost_empty => returnPacketsFIFO_almost_empty,
      returnPacketsFIFO_rd_data => returnPacketsFIFO_rd_data,
      returnPacketsFIFO_rd_en => returnPacketsFIFO_rd_en,
      sendBRAM_addra => sendBRAM_addra,
      sendBRAM_clka => sendBRAM_clka,
      sendBRAM_dina => sendBRAM_dina,
      sendBRAM_ena => sendBRAM_ena,
      sendBRAM_wea => sendBRAM_wea,
      sendBRAM_addrb => sendBRAM_addrb,
      sendBRAM_clkb => sendBRAM_clkb,
      sendBRAM_doutb => sendBRAM_doutb,
      sendBRAM_enb => sendBRAM_enb,
      STAT_SendSessionPackets => STAT_SendSessionPackets,
      STAT_RecvSessionPacketsValid => STAT_RecvSessionPacketsValid,
      STAT_RecvSessionPacketsInvalid => STAT_RecvSessionPacketsInvalid,
      STAT_RecvSessionPacketsDropped => STAT_RecvSessionPacketsDropped,
      DBG_NetPkt_State => DBG_NetPkt_State,
      DBG_SendFIFOState => DBG_SendFIFOState,
      DBG_RecvFIFOState => DBG_RecvFIFOState,
      DBG_RecvSessionParseState => DBG_RecvSessionParseState,
      DBG_SendPacketState => DBG_SendPacketState,
      DBG_recvSendReplyPacket => DBG_recvSendReplyPacket,
      DBG_sendReplyAck => DBG_sendReplyAck,
      DBG_sendHandlingReply => DBG_sendHandlingReply,
      DBG_recvPacketData => DBG_recvPacketData,
      DBG_recvCurrentSubpacketOffset => DBG_recvCurrentSubpacketOffset,
      DBG_recvCurrentSubpacket => DBG_recvCurrentSubpacket,
      DBG_recvValid_Session => DBG_recvValid_Session,
      DBG_recvHeaderChecksum => DBG_recvHeaderChecksum,
      DBG_discardPacketReason => DBG_discardPacketReason,
      DBG_sendLastAckedPacketID => DBG_sendLastAckedPacketID,
      DBG_recvLastSendAckedPacketID => DBG_recvLastSendAckedPacketID,
      DBG_recvLastAckedPacketID => DBG_recvLastAckedPacketID,
      DBG_sendCyclesBetweenAutoResends => DBG_sendCyclesBetweenAutoResends,
      DBG_recvCurrentSubpacketIndex => DBG_recvCurrentSubpacketIndex,
      DBG_recvCurrentPacketLength => DBG_recvCurrentPacketLength,
      DBG_returnPacketsFIFO_empty => DBG_returnPacketsFIFO_empty,
      DBG_returnPacketsFIFO_rd_en => DBG_returnPacketsFIFO_rd_en,
      DBG_returnPacketsFIFO_rd_data => DBG_returnPacketsFIFO_rd_data,
      DBG_sendHasUnackedSentPacket => DBG_sendHasUnackedSentPacket,
      DBG_send_pkt_header_prog_full => DBG_send_pkt_header_prog_full
    );
END MainDesign_NetProtoPacketProces_0_0_arch;
