-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
-- Date        : Sat Apr 26 19:22:49 2025
-- Host        : Dragon2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_NetProtoPacketProces_0_0/design_1_NetProtoPacketProces_0_0_stub.vhdl
-- Design      : design_1_NetProtoPacketProces_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_NetProtoPacketProces_0_0 is
  Port ( 
    clk333_250 : in STD_LOGIC;
    recv_pkt_header_empty : in STD_LOGIC;
    recv_pkt_header_rd_data : in STD_LOGIC_VECTOR ( 31 downto 0 );
    recv_pkt_header_rd_en : out STD_LOGIC;
    recv_pkt_data_empty : in STD_LOGIC;
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

end design_1_NetProtoPacketProces_0_0;

architecture stub of design_1_NetProtoPacketProces_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk333_250,recv_pkt_header_empty,recv_pkt_header_rd_data[31:0],recv_pkt_header_rd_en,recv_pkt_data_empty,recv_pkt_data_rd_data[31:0],recv_pkt_data_rd_en,send_pkt_header_prog_full,send_pkt_header_wr_data[31:0],send_pkt_header_wr_en,send_pkt_data_count[10:0],send_pkt_data_wr_data[31:0],send_pkt_data_wr_en,ETHCTRL_SendReady,ETHCTRL_RecvReady,validPacketsFIFO_wr_data[87:0],validPacketsFIFO_full,validPacketsFIFO_prog_full,validPacketsFIFO_wr_en,returnPacketsFIFO_empty,returnPacketsFIFO_rd_data[87:0],returnPacketsFIFO_rd_en,sendBRAM_addra[8:0],sendBRAM_clka,sendBRAM_dina[31:0],sendBRAM_ena,sendBRAM_wea[0:0],sendBRAM_addrb[8:0],sendBRAM_clkb,sendBRAM_doutb[31:0],sendBRAM_enb,STAT_SendSessionPackets[31:0],STAT_RecvSessionPacketsValid[31:0],STAT_RecvSessionPacketsInvalid[31:0],STAT_RecvSessionPacketsDropped[31:0],DBG_NetPkt_State[4:0],DBG_SendFIFOState[4:0],DBG_RecvFIFOState[4:0],DBG_RecvSessionParseState[4:0],DBG_SendPacketState[4:0],DBG_recvSendReplyPacket,DBG_sendReplyAck,DBG_sendHandlingReply,DBG_recvPacketData[63:0],DBG_recvCurrentSubpacketOffset[3:0],DBG_recvCurrentSubpacket[71:0],DBG_recvValid_Session[3:0],DBG_recvHeaderChecksum[7:0],DBG_discardPacketReason[3:0],DBG_sendLastAckedPacketID[15:0],DBG_recvLastSendAckedPacketID[15:0],DBG_recvLastAckedPacketID[15:0],DBG_sendCyclesBetweenAutoResends[27:0],DBG_recvCurrentSubpacketIndex[7:0],DBG_recvCurrentPacketLength[15:0],DBG_returnPacketsFIFO_empty,DBG_returnPacketsFIFO_rd_en,DBG_returnPacketsFIFO_rd_data[87:0],DBG_sendHasUnackedSentPacket,DBG_send_pkt_header_prog_full";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "NetProtoPacketProcessor,Vivado 2018.1_AR73068";
begin
end;
