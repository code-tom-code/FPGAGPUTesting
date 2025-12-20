-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
-- Date        : Mon Dec  8 18:20:30 2025
-- Host        : Dragon3 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_NetProtoPacketProces_0_0/MainDesign_NetProtoPacketProces_0_0_stub.vhdl
-- Design      : MainDesign_NetProtoPacketProces_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MainDesign_NetProtoPacketProces_0_0 is
  Port ( 
    clk333_250 : in STD_LOGIC;
    recv_pkt_header_empty : in STD_LOGIC;
    recv_pkt_header_almost_empty : in STD_LOGIC;
    recv_pkt_header_rd_data : in STD_LOGIC_VECTOR ( 31 downto 0 );
    recv_pkt_header_rd_en : out STD_LOGIC;
    recv_pkt_data_empty : in STD_LOGIC;
    recv_pkt_data_almost_empty : in STD_LOGIC;
    recv_pkt_data_rd_data : in STD_LOGIC_VECTOR ( 31 downto 0 );
    recv_pkt_data_rd_en : out STD_LOGIC;
    send_pkt_header_prog_full : in STD_LOGIC;
    send_pkt_header_wr_data : out STD_LOGIC_VECTOR ( 31 downto 0 );
    send_pkt_header_wr_en : out STD_LOGIC;
    send_pkt_data_count : in STD_LOGIC_VECTOR ( 10 downto 0 );
    send_pkt_data_wr_data : out STD_LOGIC_VECTOR ( 31 downto 0 );
    send_pkt_data_wr_en : out STD_LOGIC;
    ETHCTRL_SendReady : in STD_LOGIC;
    ETHCTRL_RecvReady : in STD_LOGIC;
    validPacketsFIFO_wr_data : out STD_LOGIC_VECTOR ( 87 downto 0 );
    validPacketsFIFO_full : in STD_LOGIC;
    validPacketsFIFO_prog_full : in STD_LOGIC;
    validPacketsFIFO_wr_en : out STD_LOGIC;
    returnPacketsFIFO_empty : in STD_LOGIC;
    returnPacketsFIFO_almost_empty : in STD_LOGIC;
    returnPacketsFIFO_rd_data : in STD_LOGIC_VECTOR ( 87 downto 0 );
    returnPacketsFIFO_rd_en : out STD_LOGIC;
    sendBRAM_addra : out STD_LOGIC_VECTOR ( 8 downto 0 );
    sendBRAM_clka : out STD_LOGIC;
    sendBRAM_dina : out STD_LOGIC_VECTOR ( 31 downto 0 );
    sendBRAM_ena : out STD_LOGIC;
    sendBRAM_wea : out STD_LOGIC_VECTOR ( 0 to 0 );
    sendBRAM_addrb : out STD_LOGIC_VECTOR ( 8 downto 0 );
    sendBRAM_clkb : out STD_LOGIC;
    sendBRAM_doutb : in STD_LOGIC_VECTOR ( 31 downto 0 );
    sendBRAM_enb : out STD_LOGIC;
    STAT_SendSessionPackets : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_RecvSessionPacketsValid : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_RecvSessionPacketsInvalid : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_RecvSessionPacketsDropped : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_NetPkt_State : out STD_LOGIC_VECTOR ( 4 downto 0 );
    DBG_SendFIFOState : out STD_LOGIC_VECTOR ( 4 downto 0 );
    DBG_RecvFIFOState : out STD_LOGIC_VECTOR ( 4 downto 0 );
    DBG_RecvSessionParseState : out STD_LOGIC_VECTOR ( 4 downto 0 );
    DBG_SendPacketState : out STD_LOGIC_VECTOR ( 4 downto 0 );
    DBG_recvSendReplyPacket : out STD_LOGIC;
    DBG_sendReplyAck : out STD_LOGIC;
    DBG_sendHandlingReply : out STD_LOGIC;
    DBG_recvPacketData : out STD_LOGIC_VECTOR ( 63 downto 0 );
    DBG_recvCurrentSubpacketOffset : out STD_LOGIC_VECTOR ( 3 downto 0 );
    DBG_recvCurrentSubpacket : out STD_LOGIC_VECTOR ( 71 downto 0 );
    DBG_recvValid_Session : out STD_LOGIC_VECTOR ( 3 downto 0 );
    DBG_recvHeaderChecksum : out STD_LOGIC_VECTOR ( 7 downto 0 );
    DBG_discardPacketReason : out STD_LOGIC_VECTOR ( 3 downto 0 );
    DBG_sendLastAckedPacketID : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_recvLastSendAckedPacketID : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_recvLastAckedPacketID : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_sendCyclesBetweenAutoResends : out STD_LOGIC_VECTOR ( 27 downto 0 );
    DBG_recvCurrentSubpacketIndex : out STD_LOGIC_VECTOR ( 7 downto 0 );
    DBG_recvCurrentPacketLength : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_returnPacketsFIFO_empty : out STD_LOGIC;
    DBG_returnPacketsFIFO_rd_en : out STD_LOGIC;
    DBG_returnPacketsFIFO_rd_data : out STD_LOGIC_VECTOR ( 87 downto 0 );
    DBG_sendHasUnackedSentPacket : out STD_LOGIC;
    DBG_send_pkt_header_prog_full : out STD_LOGIC
  );

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of MainDesign_NetProtoPacketProces_0_0 : entity is "MainDesign_NetProtoPacketProces_0_0,NetProtoPacketProcessor,{}";
  attribute core_generation_info : string;
  attribute core_generation_info of MainDesign_NetProtoPacketProces_0_0 : entity is "MainDesign_NetProtoPacketProces_0_0,NetProtoPacketProcessor,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=NetProtoPacketProcessor,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL,NET_PROTOCOL_MAJOR_VERSION=1,NET_PROTOCOL_MINOR_VERSION=0,SEND_PKT_DATA_CAPACITY_DWORDS=2048}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of MainDesign_NetProtoPacketProces_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of MainDesign_NetProtoPacketProces_0_0 : entity is "module_ref";
end MainDesign_NetProtoPacketProces_0_0;

architecture stub of MainDesign_NetProtoPacketProces_0_0 is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "clk333_250,recv_pkt_header_empty,recv_pkt_header_almost_empty,recv_pkt_header_rd_data[31:0],recv_pkt_header_rd_en,recv_pkt_data_empty,recv_pkt_data_almost_empty,recv_pkt_data_rd_data[31:0],recv_pkt_data_rd_en,send_pkt_header_prog_full,send_pkt_header_wr_data[31:0],send_pkt_header_wr_en,send_pkt_data_count[10:0],send_pkt_data_wr_data[31:0],send_pkt_data_wr_en,ETHCTRL_SendReady,ETHCTRL_RecvReady,validPacketsFIFO_wr_data[87:0],validPacketsFIFO_full,validPacketsFIFO_prog_full,validPacketsFIFO_wr_en,returnPacketsFIFO_empty,returnPacketsFIFO_almost_empty,returnPacketsFIFO_rd_data[87:0],returnPacketsFIFO_rd_en,sendBRAM_addra[8:0],sendBRAM_clka,sendBRAM_dina[31:0],sendBRAM_ena,sendBRAM_wea[0:0],sendBRAM_addrb[8:0],sendBRAM_clkb,sendBRAM_doutb[31:0],sendBRAM_enb,STAT_SendSessionPackets[31:0],STAT_RecvSessionPacketsValid[31:0],STAT_RecvSessionPacketsInvalid[31:0],STAT_RecvSessionPacketsDropped[31:0],DBG_NetPkt_State[4:0],DBG_SendFIFOState[4:0],DBG_RecvFIFOState[4:0],DBG_RecvSessionParseState[4:0],DBG_SendPacketState[4:0],DBG_recvSendReplyPacket,DBG_sendReplyAck,DBG_sendHandlingReply,DBG_recvPacketData[63:0],DBG_recvCurrentSubpacketOffset[3:0],DBG_recvCurrentSubpacket[71:0],DBG_recvValid_Session[3:0],DBG_recvHeaderChecksum[7:0],DBG_discardPacketReason[3:0],DBG_sendLastAckedPacketID[15:0],DBG_recvLastSendAckedPacketID[15:0],DBG_recvLastAckedPacketID[15:0],DBG_sendCyclesBetweenAutoResends[27:0],DBG_recvCurrentSubpacketIndex[7:0],DBG_recvCurrentPacketLength[15:0],DBG_returnPacketsFIFO_empty,DBG_returnPacketsFIFO_rd_en,DBG_returnPacketsFIFO_rd_data[87:0],DBG_sendHasUnackedSentPacket,DBG_send_pkt_header_prog_full";
  attribute x_interface_info : string;
  attribute x_interface_info of clk333_250 : signal is "xilinx.com:signal:clock:1.0 clk333_250 CLK";
  attribute x_interface_mode : string;
  attribute x_interface_mode of clk333_250 : signal is "slave clk333_250";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk333_250 : signal is "XIL_INTERFACENAME clk333_250, FREQ_HZ 333250000, ASSOCIATED_BUSIF recv_pkt_header:recv_pkt_data:send_pkt_header:send_pkt_data:validPacketsFIFO:returnPacketsFIFO:SendPacketBRAMW:SendPacketBRAMR, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0";
  attribute x_interface_info of recv_pkt_header_empty : signal is "xilinx.com:interface:fifo_read:1.0 recv_pkt_header EMPTY";
  attribute x_interface_mode of recv_pkt_header_empty : signal is "master recv_pkt_header";
  attribute x_interface_info of recv_pkt_header_almost_empty : signal is "xilinx.com:interface:fifo_read:1.0 recv_pkt_header ALMOST_EMPTY";
  attribute x_interface_info of recv_pkt_header_rd_data : signal is "xilinx.com:interface:fifo_read:1.0 recv_pkt_header RD_DATA";
  attribute x_interface_mode of recv_pkt_header_rd_data : signal is "master";
  attribute x_interface_info of recv_pkt_header_rd_en : signal is "xilinx.com:interface:fifo_read:1.0 recv_pkt_header RD_EN";
  attribute x_interface_info of recv_pkt_data_empty : signal is "xilinx.com:interface:fifo_read:1.0 recv_pkt_data EMPTY";
  attribute x_interface_mode of recv_pkt_data_empty : signal is "master recv_pkt_data";
  attribute x_interface_info of recv_pkt_data_almost_empty : signal is "xilinx.com:interface:fifo_read:1.0 recv_pkt_data ALMOST_EMPTY";
  attribute x_interface_info of recv_pkt_data_rd_data : signal is "xilinx.com:interface:fifo_read:1.0 recv_pkt_data RD_DATA";
  attribute x_interface_mode of recv_pkt_data_rd_data : signal is "master";
  attribute x_interface_info of recv_pkt_data_rd_en : signal is "xilinx.com:interface:fifo_read:1.0 recv_pkt_data RD_EN";
  attribute x_interface_info of send_pkt_header_wr_data : signal is "xilinx.com:interface:fifo_write:1.0 send_pkt_header WR_DATA";
  attribute x_interface_mode of send_pkt_header_wr_data : signal is "master send_pkt_header";
  attribute x_interface_info of send_pkt_header_wr_en : signal is "xilinx.com:interface:fifo_write:1.0 send_pkt_header WR_EN";
  attribute x_interface_info of send_pkt_data_wr_data : signal is "xilinx.com:interface:fifo_write:1.0 send_pkt_data WR_DATA";
  attribute x_interface_mode of send_pkt_data_wr_data : signal is "master send_pkt_data";
  attribute x_interface_info of send_pkt_data_wr_en : signal is "xilinx.com:interface:fifo_write:1.0 send_pkt_data WR_EN";
  attribute x_interface_info of validPacketsFIFO_wr_data : signal is "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_DATA";
  attribute x_interface_mode of validPacketsFIFO_wr_data : signal is "master validPacketsFIFO";
  attribute x_interface_info of validPacketsFIFO_full : signal is "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO FULL";
  attribute x_interface_info of validPacketsFIFO_prog_full : signal is "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO ALMOST_FULL";
  attribute x_interface_info of validPacketsFIFO_wr_en : signal is "xilinx.com:interface:fifo_write:1.0 validPacketsFIFO WR_EN";
  attribute x_interface_info of returnPacketsFIFO_empty : signal is "xilinx.com:interface:fifo_read:1.0 returnPacketsFIFO EMPTY";
  attribute x_interface_mode of returnPacketsFIFO_empty : signal is "master returnPacketsFIFO";
  attribute x_interface_info of returnPacketsFIFO_almost_empty : signal is "xilinx.com:interface:fifo_read:1.0 returnPacketsFIFO ALMOST_EMPTY";
  attribute x_interface_info of returnPacketsFIFO_rd_data : signal is "xilinx.com:interface:fifo_read:1.0 returnPacketsFIFO RD_DATA";
  attribute x_interface_info of returnPacketsFIFO_rd_en : signal is "xilinx.com:interface:fifo_read:1.0 returnPacketsFIFO RD_EN";
  attribute x_interface_info of sendBRAM_addra : signal is "xilinx.com:interface:bram:1.0 SendPacketBRAMW ADDR";
  attribute x_interface_mode of sendBRAM_addra : signal is "master SendPacketBRAMW";
  attribute x_interface_parameter of sendBRAM_addra : signal is "XIL_INTERFACENAME SendPacketBRAMW, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1";
  attribute x_interface_info of sendBRAM_clka : signal is "xilinx.com:interface:bram:1.0 SendPacketBRAMW CLK";
  attribute x_interface_info of sendBRAM_dina : signal is "xilinx.com:interface:bram:1.0 SendPacketBRAMW DIN";
  attribute x_interface_info of sendBRAM_ena : signal is "xilinx.com:interface:bram:1.0 SendPacketBRAMW EN";
  attribute x_interface_info of sendBRAM_wea : signal is "xilinx.com:interface:bram:1.0 SendPacketBRAMW WE";
  attribute x_interface_info of sendBRAM_addrb : signal is "xilinx.com:interface:bram:1.0 SendPacketBRAMR ADDR";
  attribute x_interface_mode of sendBRAM_addrb : signal is "master SendPacketBRAMR";
  attribute x_interface_parameter of sendBRAM_addrb : signal is "XIL_INTERFACENAME SendPacketBRAMR, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1";
  attribute x_interface_info of sendBRAM_clkb : signal is "xilinx.com:interface:bram:1.0 SendPacketBRAMR CLK";
  attribute x_interface_info of sendBRAM_doutb : signal is "xilinx.com:interface:bram:1.0 SendPacketBRAMR DOUT";
  attribute x_interface_info of sendBRAM_enb : signal is "xilinx.com:interface:bram:1.0 SendPacketBRAMR EN";
  attribute x_core_info : string;
  attribute x_core_info of stub : architecture is "NetProtoPacketProcessor,Vivado 2025.2";
begin
end;
