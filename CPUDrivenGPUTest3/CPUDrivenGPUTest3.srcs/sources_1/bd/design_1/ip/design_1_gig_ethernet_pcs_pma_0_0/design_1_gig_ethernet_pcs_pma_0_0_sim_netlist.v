// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Sun Oct 13 16:47:48 2024
// Host        : Dragon2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_gig_ethernet_pcs_pma_0_0/design_1_gig_ethernet_pcs_pma_0_0_sim_netlist.v
// Design      : design_1_gig_ethernet_pcs_pma_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* DowngradeIPIdentifiedWarnings = "yes" *) (* EXAMPLE_SIMULATION = "0" *) 
(* NotValidForBitStream *)
module design_1_gig_ethernet_pcs_pma_0_0
   (txp_0,
    txn_0,
    rxp_0,
    rxn_0,
    signal_detect_0,
    gmii_txd_0,
    gmii_tx_en_0,
    gmii_tx_er_0,
    gmii_rxd_0,
    gmii_rx_dv_0,
    gmii_rx_er_0,
    gmii_isolate_0,
    sgmii_clk_r_0,
    sgmii_clk_f_0,
    sgmii_clk_en_0,
    speed_is_10_100_0,
    speed_is_100_0,
    an_interrupt_0,
    an_adv_config_vector_0,
    an_adv_config_val_0,
    an_restart_config_0,
    status_vector_0,
    ext_mdc_0,
    ext_mdio_i_0,
    ext_mdio_o_0,
    ext_mdio_t_0,
    mdio_t_in_0,
    mdc_0,
    mdio_i_0,
    mdio_o_0,
    mdio_t_0,
    phyaddr_0,
    configuration_vector_0,
    configuration_valid_0,
    refclk625_p,
    refclk625_n,
    clk125_out,
    clk312_out,
    rst_125_out,
    tx_logic_reset,
    rx_logic_reset,
    rx_locked,
    tx_locked,
    tx_bsc_rst_out,
    rx_bsc_rst_out,
    tx_bs_rst_out,
    rx_bs_rst_out,
    tx_rst_dly_out,
    rx_rst_dly_out,
    tx_bsc_en_vtc_out,
    rx_bsc_en_vtc_out,
    tx_bs_en_vtc_out,
    rx_bs_en_vtc_out,
    riu_clk_out,
    riu_addr_out,
    riu_wr_data_out,
    riu_wr_en_out,
    riu_nibble_sel_out,
    riu_rddata_3,
    riu_valid_3,
    riu_prsnt_3,
    riu_rddata_2,
    riu_valid_2,
    riu_prsnt_2,
    riu_rddata_1,
    riu_valid_1,
    riu_prsnt_1,
    rx_btval_3,
    rx_btval_2,
    rx_btval_1,
    tx_dly_rdy_1,
    rx_dly_rdy_1,
    rx_vtc_rdy_1,
    tx_vtc_rdy_1,
    tx_dly_rdy_2,
    rx_dly_rdy_2,
    rx_vtc_rdy_2,
    tx_vtc_rdy_2,
    tx_dly_rdy_3,
    rx_dly_rdy_3,
    rx_vtc_rdy_3,
    tx_vtc_rdy_3,
    tx_pll_clk_out,
    rx_pll_clk_out,
    tx_rdclk_out,
    reset);
  output txp_0;
  output txn_0;
  input rxp_0;
  input rxn_0;
  input signal_detect_0;
  input [7:0]gmii_txd_0;
  input gmii_tx_en_0;
  input gmii_tx_er_0;
  output [7:0]gmii_rxd_0;
  output gmii_rx_dv_0;
  output gmii_rx_er_0;
  output gmii_isolate_0;
  output sgmii_clk_r_0;
  output sgmii_clk_f_0;
  output sgmii_clk_en_0;
  input speed_is_10_100_0;
  input speed_is_100_0;
  output an_interrupt_0;
  input [15:0]an_adv_config_vector_0;
  input an_adv_config_val_0;
  input an_restart_config_0;
  output [15:0]status_vector_0;
  output ext_mdc_0;
  input ext_mdio_i_0;
  output ext_mdio_o_0;
  output ext_mdio_t_0;
  input mdio_t_in_0;
  input mdc_0;
  input mdio_i_0;
  output mdio_o_0;
  output mdio_t_0;
  input [4:0]phyaddr_0;
  input [4:0]configuration_vector_0;
  input configuration_valid_0;
  input refclk625_p;
  input refclk625_n;
  output clk125_out;
  output clk312_out;
  output rst_125_out;
  output tx_logic_reset;
  output rx_logic_reset;
  output rx_locked;
  output tx_locked;
  output tx_bsc_rst_out;
  output rx_bsc_rst_out;
  output tx_bs_rst_out;
  output rx_bs_rst_out;
  output tx_rst_dly_out;
  output rx_rst_dly_out;
  output tx_bsc_en_vtc_out;
  output rx_bsc_en_vtc_out;
  output tx_bs_en_vtc_out;
  output rx_bs_en_vtc_out;
  output riu_clk_out;
  output [5:0]riu_addr_out;
  output [15:0]riu_wr_data_out;
  output riu_wr_en_out;
  output [1:0]riu_nibble_sel_out;
  input [15:0]riu_rddata_3;
  input riu_valid_3;
  input riu_prsnt_3;
  input [15:0]riu_rddata_2;
  input riu_valid_2;
  input riu_prsnt_2;
  input [15:0]riu_rddata_1;
  input riu_valid_1;
  input riu_prsnt_1;
  output [8:0]rx_btval_3;
  output [8:0]rx_btval_2;
  output [8:0]rx_btval_1;
  input tx_dly_rdy_1;
  input rx_dly_rdy_1;
  input rx_vtc_rdy_1;
  input tx_vtc_rdy_1;
  input tx_dly_rdy_2;
  input rx_dly_rdy_2;
  input rx_vtc_rdy_2;
  input tx_vtc_rdy_2;
  input tx_dly_rdy_3;
  input rx_dly_rdy_3;
  input rx_vtc_rdy_3;
  input tx_vtc_rdy_3;
  output tx_pll_clk_out;
  output rx_pll_clk_out;
  output tx_rdclk_out;
  input reset;

  wire an_adv_config_val_0;
  wire [15:0]an_adv_config_vector_0;
  wire an_interrupt_0;
  wire an_restart_config_0;
  wire clk125_out;
  wire clk312_out;
  wire configuration_valid_0;
  wire [4:0]configuration_vector_0;
  wire ext_mdc_0;
  wire ext_mdio_i_0;
  wire ext_mdio_o_0;
  wire ext_mdio_t_0;
  wire gmii_isolate_0;
  wire gmii_rx_dv_0;
  wire gmii_rx_er_0;
  wire [7:0]gmii_rxd_0;
  wire gmii_tx_en_0;
  wire gmii_tx_er_0;
  wire [7:0]gmii_txd_0;
  wire mdc_0;
  wire mdio_i_0;
  wire mdio_o_0;
  wire mdio_t_0;
  wire mdio_t_in_0;
  wire [4:0]phyaddr_0;
  (* IBUF_LOW_PWR = 0 *) wire refclk625_n;
  (* IBUF_LOW_PWR = 0 *) wire refclk625_p;
  wire reset;
  wire [5:0]riu_addr_out;
  wire riu_clk_out;
  wire [1:0]riu_nibble_sel_out;
  wire riu_prsnt_1;
  wire riu_prsnt_2;
  wire riu_prsnt_3;
  wire [15:0]riu_rddata_1;
  wire [15:0]riu_rddata_2;
  wire [15:0]riu_rddata_3;
  wire riu_valid_1;
  wire riu_valid_2;
  wire riu_valid_3;
  wire [15:0]riu_wr_data_out;
  wire riu_wr_en_out;
  wire rst_125_out;
  wire rx_bs_en_vtc_out;
  wire rx_bs_rst_out;
  wire rx_bsc_en_vtc_out;
  wire rx_bsc_rst_out;
  wire [8:0]rx_btval_1;
  wire [8:0]rx_btval_2;
  wire [8:0]rx_btval_3;
  wire rx_dly_rdy_1;
  wire rx_dly_rdy_2;
  wire rx_dly_rdy_3;
  wire rx_locked;
  wire rx_logic_reset;
  wire rx_pll_clk_out;
  wire rx_rst_dly_out;
  wire rx_vtc_rdy_1;
  wire rx_vtc_rdy_2;
  wire rx_vtc_rdy_3;
  (* IBUF_LOW_PWR = 0 *) wire rxn_0;
  (* IBUF_LOW_PWR = 0 *) wire rxp_0;
  wire sgmii_clk_en_0;
  wire sgmii_clk_f_0;
  wire sgmii_clk_r_0;
  wire signal_detect_0;
  wire speed_is_100_0;
  wire speed_is_10_100_0;
  wire [15:0]status_vector_0;
  wire tx_bs_en_vtc_out;
  wire tx_bs_rst_out;
  wire tx_bsc_en_vtc_out;
  wire tx_bsc_rst_out;
  wire tx_dly_rdy_1;
  wire tx_dly_rdy_2;
  wire tx_dly_rdy_3;
  wire tx_locked;
  wire tx_logic_reset;
  wire tx_pll_clk_out;
  wire tx_rdclk_out;
  wire tx_rst_dly_out;
  wire tx_vtc_rdy_1;
  wire tx_vtc_rdy_2;
  wire tx_vtc_rdy_3;
  (* SLEW = "SLOW" *) wire txn_0;
  (* SLEW = "SLOW" *) wire txp_0;

  (* EXAMPLE_SIMULATION = "0" *) 
  (* X_CORE_INFO = "gig_ethernet_pcs_pma_v16_1_3,Vivado 2018.1_AR73068" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_support inst
       (.an_adv_config_val_0(an_adv_config_val_0),
        .an_adv_config_vector_0(an_adv_config_vector_0),
        .an_interrupt_0(an_interrupt_0),
        .an_restart_config_0(an_restart_config_0),
        .clk125_out(clk125_out),
        .clk312_out(clk312_out),
        .configuration_valid_0(configuration_valid_0),
        .configuration_vector_0(configuration_vector_0),
        .ext_mdc_0(ext_mdc_0),
        .ext_mdio_i_0(ext_mdio_i_0),
        .ext_mdio_o_0(ext_mdio_o_0),
        .ext_mdio_t_0(ext_mdio_t_0),
        .gmii_isolate_0(gmii_isolate_0),
        .gmii_rx_dv_0(gmii_rx_dv_0),
        .gmii_rx_er_0(gmii_rx_er_0),
        .gmii_rxd_0(gmii_rxd_0),
        .gmii_tx_en_0(gmii_tx_en_0),
        .gmii_tx_er_0(gmii_tx_er_0),
        .gmii_txd_0(gmii_txd_0),
        .mdc_0(mdc_0),
        .mdio_i_0(mdio_i_0),
        .mdio_o_0(mdio_o_0),
        .mdio_t_0(mdio_t_0),
        .mdio_t_in_0(mdio_t_in_0),
        .phyaddr_0(phyaddr_0),
        .refclk625_n(refclk625_n),
        .refclk625_p(refclk625_p),
        .reset(reset),
        .riu_addr_out(riu_addr_out),
        .riu_clk_out(riu_clk_out),
        .riu_nibble_sel_out(riu_nibble_sel_out),
        .riu_prsnt_1(riu_prsnt_1),
        .riu_prsnt_2(riu_prsnt_2),
        .riu_prsnt_3(riu_prsnt_3),
        .riu_rddata_1(riu_rddata_1),
        .riu_rddata_2(riu_rddata_2),
        .riu_rddata_3(riu_rddata_3),
        .riu_valid_1(riu_valid_1),
        .riu_valid_2(riu_valid_2),
        .riu_valid_3(riu_valid_3),
        .riu_wr_data_out(riu_wr_data_out),
        .riu_wr_en_out(riu_wr_en_out),
        .rst_125_out(rst_125_out),
        .rx_bs_en_vtc_out(rx_bs_en_vtc_out),
        .rx_bs_rst_out(rx_bs_rst_out),
        .rx_bsc_en_vtc_out(rx_bsc_en_vtc_out),
        .rx_bsc_rst_out(rx_bsc_rst_out),
        .rx_btval_1(rx_btval_1),
        .rx_btval_2(rx_btval_2),
        .rx_btval_3(rx_btval_3),
        .rx_dly_rdy_1(rx_dly_rdy_1),
        .rx_dly_rdy_2(rx_dly_rdy_2),
        .rx_dly_rdy_3(rx_dly_rdy_3),
        .rx_locked(rx_locked),
        .rx_logic_reset(rx_logic_reset),
        .rx_pll_clk_out(rx_pll_clk_out),
        .rx_rst_dly_out(rx_rst_dly_out),
        .rx_vtc_rdy_1(rx_vtc_rdy_1),
        .rx_vtc_rdy_2(rx_vtc_rdy_2),
        .rx_vtc_rdy_3(rx_vtc_rdy_3),
        .rxn_0(rxn_0),
        .rxp_0(rxp_0),
        .sgmii_clk_en_0(sgmii_clk_en_0),
        .sgmii_clk_f_0(sgmii_clk_f_0),
        .sgmii_clk_r_0(sgmii_clk_r_0),
        .signal_detect_0(signal_detect_0),
        .speed_is_100_0(speed_is_100_0),
        .speed_is_10_100_0(speed_is_10_100_0),
        .status_vector_0(status_vector_0),
        .tx_bs_en_vtc_out(tx_bs_en_vtc_out),
        .tx_bs_rst_out(tx_bs_rst_out),
        .tx_bsc_en_vtc_out(tx_bsc_en_vtc_out),
        .tx_bsc_rst_out(tx_bsc_rst_out),
        .tx_dly_rdy_1(tx_dly_rdy_1),
        .tx_dly_rdy_2(tx_dly_rdy_2),
        .tx_dly_rdy_3(tx_dly_rdy_3),
        .tx_locked(tx_locked),
        .tx_logic_reset(tx_logic_reset),
        .tx_pll_clk_out(tx_pll_clk_out),
        .tx_rdclk_out(tx_rdclk_out),
        .tx_rst_dly_out(tx_rst_dly_out),
        .tx_vtc_rdy_1(tx_vtc_rdy_1),
        .tx_vtc_rdy_2(tx_vtc_rdy_2),
        .tx_vtc_rdy_3(tx_vtc_rdy_3),
        .txn_0(txn_0),
        .txp_0(txp_0));
endmodule

(* C_BytePosition = "0" *) (* C_IoBank = "44" *) (* C_Part = "XCKU060" *) 
(* C_Rx_BtslcNulType = "SERIAL" *) (* C_Rx_Data_Width = "4" *) (* C_Rx_Delay_Format = "COUNT" *) 
(* C_Rx_Delay_Type = "VAR_LOAD" *) (* C_Rx_Delay_Value = "0" *) (* C_Rx_RefClk_Frequency = "312.500000" *) 
(* C_Rx_Self_Calibrate = "ENABLE" *) (* C_Rx_Serial_Mode = "TRUE" *) (* C_Rx_UsedBitslices = "7'b0000011" *) 
(* C_TxInUpperNibble = "0" *) (* C_Tx_BtslceTr = "T" *) (* C_Tx_BtslceUsedAsT = "7'b0000000" *) 
(* C_Tx_Data_Width = "8" *) (* C_Tx_Delay_Format = "TIME" *) (* C_Tx_Delay_Type = "FIXED" *) 
(* C_Tx_Delay_Value = "0" *) (* C_Tx_RefClk_Frequency = "1250.000000" *) (* C_Tx_Self_Calibrate = "ENABLE" *) 
(* C_Tx_Serial_Mode = "FALSE" *) (* C_Tx_UsedBitslices = "7'b0010000" *) (* C_UseRxRiu = "1" *) 
(* C_UseTxRiu = "1" *) (* ORIG_REF_NAME = "design_1_gig_ethernet_pcs_pma_0_0_BaseX_Byte" *) (* dont_touch = "true" *) 
module design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_BaseX_Byte
   (BaseX_Tx_Bsc_Rst,
    BaseX_Rx_Bsc_Rst,
    BaseX_Tx_Bs_Rst,
    BaseX_Rx_Bs_Rst,
    BaseX_Tx_Rst_Dly,
    BaseX_Rx_Rst_Dly,
    BaseX_Tx_Bsc_En_Vtc,
    BaseX_Rx_Bsc_En_Vtc,
    BaseX_Tx_Bs_En_Vtc,
    BaseX_Rx_Bs_En_Vtc,
    BaseX_Riu_Clk,
    BaseX_Riu_Addr,
    BaseX_Riu_Wr_Data,
    BaseX_Riu_Rd_Data,
    BaseX_Riu_Valid,
    BaseX_Riu_Prsnt,
    BaseX_Riu_Wr_En,
    BaseX_Riu_Nibble_Sel,
    BaseX_Tx_Pll_Clk,
    BaseX_Rx_Pll_Clk,
    BaseX_Tx_Dly_Rdy,
    BaseX_Rx_Dly_Rdy,
    BaseX_Tx_Vtc_Rdy,
    BaseX_Rx_Vtc_Rdy,
    BaseX_Tx_Phy_Rden,
    BaseX_Rx_Phy_Rden,
    BaseX_Rx_Fifo_Rd_Clk,
    BaseX_Rx_Fifo_Rd_En,
    BaseX_Rx_Fifo_Empty,
    BaseX_Dly_Clk,
    BaseX_Idly_Ce,
    BaseX_Idly_Inc,
    BaseX_Idly_Load,
    BaseX_Idly_CntValueIn,
    BaseX_Idly_CntValueOut,
    BaseX_Odly_Ce,
    BaseX_Odly_Inc,
    BaseX_Odly_Load,
    BaseX_Odly_CntValueIn,
    BaseX_Odly_CntValueOut,
    BaseX_TriOdly_Ce,
    BaseX_TriOdly_Inc,
    BaseX_TriOdly_Load,
    BaseX_TriOdly_CntValueIn,
    BaseX_TriOdly_CntValueOut,
    BaseX_Tx_TbyteIn,
    BaseX_Tx_T_In,
    BaseX_Tx_D_In,
    BaseX_Rx_Q_Out,
    BaseX_Rx_Q_CombOut,
    BaseX_Tx_Tri_Out,
    BaseX_Tx_Data_Out,
    BaseX_Rx_Data_In,
    Tx_RdClk);
  input BaseX_Tx_Bsc_Rst;
  input BaseX_Rx_Bsc_Rst;
  input BaseX_Tx_Bs_Rst;
  input BaseX_Rx_Bs_Rst;
  input BaseX_Tx_Rst_Dly;
  input BaseX_Rx_Rst_Dly;
  input BaseX_Tx_Bsc_En_Vtc;
  input BaseX_Rx_Bsc_En_Vtc;
  input BaseX_Tx_Bs_En_Vtc;
  input BaseX_Rx_Bs_En_Vtc;
  input BaseX_Riu_Clk;
  input [5:0]BaseX_Riu_Addr;
  input [15:0]BaseX_Riu_Wr_Data;
  output [15:0]BaseX_Riu_Rd_Data;
  output BaseX_Riu_Valid;
  output BaseX_Riu_Prsnt;
  input BaseX_Riu_Wr_En;
  input [1:0]BaseX_Riu_Nibble_Sel;
  input BaseX_Tx_Pll_Clk;
  input BaseX_Rx_Pll_Clk;
  output BaseX_Tx_Dly_Rdy;
  output BaseX_Rx_Dly_Rdy;
  output BaseX_Tx_Vtc_Rdy;
  output BaseX_Rx_Vtc_Rdy;
  input [3:0]BaseX_Tx_Phy_Rden;
  input [3:0]BaseX_Rx_Phy_Rden;
  input BaseX_Rx_Fifo_Rd_Clk;
  input [6:0]BaseX_Rx_Fifo_Rd_En;
  output [6:0]BaseX_Rx_Fifo_Empty;
  input BaseX_Dly_Clk;
  input [6:0]BaseX_Idly_Ce;
  input [6:0]BaseX_Idly_Inc;
  input [6:0]BaseX_Idly_Load;
  input [62:0]BaseX_Idly_CntValueIn;
  output [62:0]BaseX_Idly_CntValueOut;
  input [5:0]BaseX_Odly_Ce;
  input [5:0]BaseX_Odly_Inc;
  input [5:0]BaseX_Odly_Load;
  input [53:0]BaseX_Odly_CntValueIn;
  output [53:0]BaseX_Odly_CntValueOut;
  input BaseX_TriOdly_Ce;
  input BaseX_TriOdly_Inc;
  input BaseX_TriOdly_Load;
  input [8:0]BaseX_TriOdly_CntValueIn;
  output [8:0]BaseX_TriOdly_CntValueOut;
  input [3:0]BaseX_Tx_TbyteIn;
  input [5:0]BaseX_Tx_T_In;
  input [47:0]BaseX_Tx_D_In;
  output [27:0]BaseX_Rx_Q_Out;
  output [6:0]BaseX_Rx_Q_CombOut;
  output [5:0]BaseX_Tx_Tri_Out;
  output [5:0]BaseX_Tx_Data_Out;
  input [6:0]BaseX_Rx_Data_In;
  input Tx_RdClk;

  wire BaseX_Dly_Clk;
  wire [6:0]BaseX_Idly_Ce;
  wire [62:0]BaseX_Idly_CntValueIn;
  wire [62:0]BaseX_Idly_CntValueOut;
  wire [6:0]BaseX_Idly_Inc;
  wire [6:0]BaseX_Idly_Load;
  wire [5:0]BaseX_Odly_Ce;
  wire [53:0]BaseX_Odly_CntValueIn;
  wire [53:0]BaseX_Odly_CntValueOut;
  wire [5:0]BaseX_Odly_Inc;
  wire [5:0]BaseX_Odly_Load;
  wire [5:0]BaseX_Riu_Addr;
  wire BaseX_Riu_Clk;
  wire [1:0]BaseX_Riu_Nibble_Sel;
  wire BaseX_Riu_Prsnt;
  wire [15:0]BaseX_Riu_Rd_Data;
  wire BaseX_Riu_Valid;
  wire [15:0]BaseX_Riu_Wr_Data;
  wire BaseX_Riu_Wr_En;
  wire BaseX_Rx_Bs_En_Vtc;
  wire BaseX_Rx_Bs_Rst;
  wire BaseX_Rx_Bsc_En_Vtc;
  wire BaseX_Rx_Bsc_Rst;
  wire [6:0]BaseX_Rx_Data_In;
  wire BaseX_Rx_Dly_Rdy;
  wire [6:0]BaseX_Rx_Fifo_Empty;
  wire BaseX_Rx_Fifo_Rd_Clk;
  wire [6:0]BaseX_Rx_Fifo_Rd_En;
  wire [3:0]BaseX_Rx_Phy_Rden;
  wire BaseX_Rx_Pll_Clk;
  wire [6:0]BaseX_Rx_Q_CombOut;
  wire [27:0]BaseX_Rx_Q_Out;
  wire BaseX_Rx_Rst_Dly;
  wire BaseX_Rx_Vtc_Rdy;
  wire BaseX_TriOdly_Ce;
  wire [8:0]BaseX_TriOdly_CntValueIn;
  wire [8:0]BaseX_TriOdly_CntValueOut;
  wire BaseX_TriOdly_Inc;
  wire BaseX_TriOdly_Load;
  wire BaseX_Tx_Bs_En_Vtc;
  wire BaseX_Tx_Bs_Rst;
  wire BaseX_Tx_Bsc_En_Vtc;
  wire BaseX_Tx_Bsc_Rst;
  wire [47:0]BaseX_Tx_D_In;
  wire [5:0]BaseX_Tx_Data_Out;
  wire BaseX_Tx_Dly_Rdy;
  wire [3:0]BaseX_Tx_Phy_Rden;
  wire BaseX_Tx_Pll_Clk;
  wire BaseX_Tx_Rst_Dly;
  wire [5:0]BaseX_Tx_T_In;
  wire [5:0]BaseX_Tx_Tri_Out;
  wire BaseX_Tx_Vtc_Rdy;
  wire [1:1]IntActTx_TByteinPip;
  wire [0:0]IntActTx_TByteinPip__0;
  wire [15:0]IntRx_Riu_Rd_Data;
  wire IntRx_Riu_Valid;
  wire [15:0]IntTx_Riu_Rd_Data;
  wire IntTx_Riu_Valid;
  wire Tx_RdClk;
  wire NLW_BaseX_Byte_I_Rx_Nibble_Fifo_Wrclk_Out_UNCONNECTED;
  wire NLW_BaseX_Byte_I_Rx_Nibble_Rx_Clk_To_Ext_North_UNCONNECTED;
  wire NLW_BaseX_Byte_I_Rx_Nibble_Rx_Clk_To_Ext_South_UNCONNECTED;
  wire NLW_BaseX_Byte_I_Rx_Nibble_Rx_Nclk_Nibble_Out_UNCONNECTED;
  wire NLW_BaseX_Byte_I_Rx_Nibble_Rx_Pclk_Nibble_Out_UNCONNECTED;
  wire [62:0]NLW_BaseX_Byte_I_Rx_Nibble_Rx_CntValueOut_Ext_UNCONNECTED;
  wire [6:0]NLW_BaseX_Byte_I_Rx_Nibble_Rx_Dyn_Dci_UNCONNECTED;
  wire NLW_BaseX_Byte_I_Tx_Nibble_Tx_Clk_To_Ext_North_UNCONNECTED;
  wire NLW_BaseX_Byte_I_Tx_Nibble_Tx_Clk_To_Ext_South_UNCONNECTED;
  wire NLW_BaseX_Byte_I_Tx_Nibble_Tx_Nclk_Nibble_Out_UNCONNECTED;
  wire NLW_BaseX_Byte_I_Tx_Nibble_Tx_Pclk_Nibble_Out_UNCONNECTED;
  wire [6:0]NLW_BaseX_Byte_I_Tx_Nibble_Tx_Dyn_Dci_UNCONNECTED;

  (* C_BtslcNulType = "SERIAL" *) 
  (* C_BusRxBitCtrlIn = "40" *) 
  (* C_BusRxBitCtrlOut = "40" *) 
  (* C_BusTxBitCtrlIn = "40" *) 
  (* C_BusTxBitCtrlInTri = "40" *) 
  (* C_BusTxBitCtrlOut = "40" *) 
  (* C_BusTxBitCtrlOutTri = "40" *) 
  (* C_BytePosition = "0" *) 
  (* C_Cascade = "FALSE" *) 
  (* C_CntValue = "9" *) 
  (* C_Ctrl_Clk = "EXTERNAL" *) 
  (* C_Delay_Format = "COUNT" *) 
  (* C_Delay_Type = "VAR_LOAD" *) 
  (* C_Delay_Value = "0" *) 
  (* C_Delay_Value_Ext = "0" *) 
  (* C_Div_Mode = "DIV2" *) 
  (* C_En_Clk_To_Ext_North = "DISABLE" *) 
  (* C_En_Clk_To_Ext_South = "DISABLE" *) 
  (* C_En_Dyn_Odly_Mode = "FALSE" *) 
  (* C_En_Other_Nclk = "FALSE" *) 
  (* C_En_Other_Pclk = "FALSE" *) 
  (* C_Fifo_Sync_Mode = "FALSE" *) 
  (* C_Idly_Vt_Track = "TRUE" *) 
  (* C_Inv_Rxclk = "FALSE" *) 
  (* C_IoBank = "44" *) 
  (* C_Is_Clk_Ext_Inverted = "1'b0" *) 
  (* C_Is_Clk_Inverted = "1'b0" *) 
  (* C_Is_Rst_Dly_Ext_Inverted = "1'b0" *) 
  (* C_Is_Rst_Dly_Inverted = "1'b0" *) 
  (* C_Is_Rst_Inverted = "1'b0" *) 
  (* C_NibbleType = "7" *) 
  (* C_Odly_Vt_Track = "TRUE" *) 
  (* C_Part = "XCKU060" *) 
  (* C_Qdly_Vt_Track = "TRUE" *) 
  (* C_Read_Idle_Count = "6'b000000" *) 
  (* C_RefClk_Frequency = "312.500000" *) 
  (* C_RefClk_Src = "PLLCLK" *) 
  (* C_Rounding_Factor = "16" *) 
  (* C_RxGate_Extend = "FALSE" *) 
  (* C_Rx_Clk_Phase_n = "SHIFT_90" *) 
  (* C_Rx_Clk_Phase_p = "SHIFT_90" *) 
  (* C_Rx_Data_Width = "4" *) 
  (* C_Rx_Gating = "DISABLE" *) 
  (* C_Self_Calibrate = "ENABLE" *) 
  (* C_Serial_Mode = "TRUE" *) 
  (* C_Tx_Gating = "DISABLE" *) 
  (* C_Update_Mode = "ASYNC" *) 
  (* C_Update_Mode_Ext = "ASYNC" *) 
  (* C_UsedBitslices = "7'b0000011" *) 
  design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_Rx_Nibble BaseX_Byte_I_Rx_Nibble
       (.Fifo_Empty(BaseX_Rx_Fifo_Empty),
        .Fifo_Rd_Clk({BaseX_Rx_Fifo_Rd_Clk,BaseX_Rx_Fifo_Rd_Clk,BaseX_Rx_Fifo_Rd_Clk,BaseX_Rx_Fifo_Rd_Clk,BaseX_Rx_Fifo_Rd_Clk,BaseX_Rx_Fifo_Rd_Clk,BaseX_Rx_Fifo_Rd_Clk}),
        .Fifo_Rd_En(BaseX_Rx_Fifo_Rd_En),
        .Fifo_Wrclk_Out(NLW_BaseX_Byte_I_Rx_Nibble_Fifo_Wrclk_Out_UNCONNECTED),
        .Rx_Bs_En_Vtc(BaseX_Rx_Bs_En_Vtc),
        .Rx_Bs_Rst(BaseX_Rx_Bs_Rst),
        .Rx_Bsc_En_Vtc(BaseX_Rx_Bsc_En_Vtc),
        .Rx_Bsc_Rst(BaseX_Rx_Bsc_Rst),
        .Rx_Ce(BaseX_Idly_Ce),
        .Rx_Ce_Ext({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .Rx_Clk(BaseX_Dly_Clk),
        .Rx_Clk_From_Ext(1'b1),
        .Rx_Clk_To_Ext_North(NLW_BaseX_Byte_I_Rx_Nibble_Rx_Clk_To_Ext_North_UNCONNECTED),
        .Rx_Clk_To_Ext_South(NLW_BaseX_Byte_I_Rx_Nibble_Rx_Clk_To_Ext_South_UNCONNECTED),
        .Rx_CntValueIn(BaseX_Idly_CntValueIn),
        .Rx_CntValueIn_Ext({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .Rx_CntValueOut(BaseX_Idly_CntValueOut),
        .Rx_CntValueOut_Ext(NLW_BaseX_Byte_I_Rx_Nibble_Rx_CntValueOut_Ext_UNCONNECTED[62:0]),
        .Rx_Data_In(BaseX_Rx_Data_In),
        .Rx_Dly_Rdy(BaseX_Rx_Dly_Rdy),
        .Rx_Dyn_Dci(NLW_BaseX_Byte_I_Rx_Nibble_Rx_Dyn_Dci_UNCONNECTED[6:0]),
        .Rx_Inc(BaseX_Idly_Inc),
        .Rx_Inc_Ext({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .Rx_Load(BaseX_Idly_Load),
        .Rx_Load_Ext({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .Rx_Nclk_Nibble_In(1'b1),
        .Rx_Nclk_Nibble_Out(NLW_BaseX_Byte_I_Rx_Nibble_Rx_Nclk_Nibble_Out_UNCONNECTED),
        .Rx_Pclk_Nibble_In(1'b1),
        .Rx_Pclk_Nibble_Out(NLW_BaseX_Byte_I_Rx_Nibble_Rx_Pclk_Nibble_Out_UNCONNECTED),
        .Rx_Phy_Rden(BaseX_Rx_Phy_Rden),
        .Rx_Pll_Clk(BaseX_Rx_Pll_Clk),
        .Rx_Q_CombOut(BaseX_Rx_Q_CombOut),
        .Rx_Q_Out(BaseX_Rx_Q_Out),
        .Rx_RefClk(1'b0),
        .Rx_Riu_Addr(BaseX_Riu_Addr),
        .Rx_Riu_Clk(BaseX_Riu_Clk),
        .Rx_Riu_Nibble_Sel(BaseX_Riu_Nibble_Sel[0]),
        .Rx_Riu_Prsnt(BaseX_Riu_Prsnt),
        .Rx_Riu_Rd_Data(IntRx_Riu_Rd_Data),
        .Rx_Riu_Valid(IntRx_Riu_Valid),
        .Rx_Riu_Wr_Data(BaseX_Riu_Wr_Data),
        .Rx_Riu_Wr_En(BaseX_Riu_Wr_En),
        .Rx_Rst_Dly(BaseX_Rx_Rst_Dly),
        .Rx_Tbyte_In({1'b0,1'b0,1'b0,1'b0}),
        .Rx_Vtc_Rdy(BaseX_Rx_Vtc_Rdy));
  (* C_BtslceUsedAsT = "7'b0000000" *) 
  (* C_BusRxBitCtrlIn = "40" *) 
  (* C_BusRxBitCtrlOut = "40" *) 
  (* C_BusTxBitCtrlIn = "40" *) 
  (* C_BusTxBitCtrlInTri = "40" *) 
  (* C_BusTxBitCtrlOut = "40" *) 
  (* C_BusTxBitCtrlOutTri = "40" *) 
  (* C_BytePosition = "0" *) 
  (* C_CntValue = "9" *) 
  (* C_Ctrl_Clk = "EXTERNAL" *) 
  (* C_Data_Type = "DATA" *) 
  (* C_Delay_Format = "TIME" *) 
  (* C_Delay_Type = "FIXED" *) 
  (* C_Delay_Value = "0" *) 
  (* C_Div_Mode = "DIV4" *) 
  (* C_En_Clk_To_Ext_North = "DISABLE" *) 
  (* C_En_Clk_To_Ext_South = "DISABLE" *) 
  (* C_En_Dyn_Odly_Mode = "FALSE" *) 
  (* C_En_Other_Nclk = "FALSE" *) 
  (* C_En_Other_Pclk = "FALSE" *) 
  (* C_Enable_Pre_Emphasis = "FALSE" *) 
  (* C_Idly_Vt_Track = "FALSE" *) 
  (* C_Init = "1'b0" *) 
  (* C_Inv_Rxclk = "FALSE" *) 
  (* C_IoBank = "44" *) 
  (* C_Is_Clk_Inverted = "1'b0" *) 
  (* C_Is_Rst_Dly_Inverted = "1'b0" *) 
  (* C_Is_Rst_Inverted = "1'b0" *) 
  (* C_Native_Odelay_Bypass = "FALSE" *) 
  (* C_NibbleType = "6" *) 
  (* C_Odly_Vt_Track = "FALSE" *) 
  (* C_Output_Phase_90 = "TRUE" *) 
  (* C_Part = "XCKU060" *) 
  (* C_Qdly_Vt_Track = "FALSE" *) 
  (* C_Read_Idle_Count = "6'b000000" *) 
  (* C_RefClk_Frequency = "1250.000000" *) 
  (* C_RefClk_Src = "PLLCLK" *) 
  (* C_Rounding_Factor = "16" *) 
  (* C_RxGate_Extend = "FALSE" *) 
  (* C_Rx_Clk_Phase_n = "SHIFT_0" *) 
  (* C_Rx_Clk_Phase_p = "SHIFT_0" *) 
  (* C_Rx_Gating = "DISABLE" *) 
  (* C_Self_Calibrate = "ENABLE" *) 
  (* C_Serial_Mode = "FALSE" *) 
  (* C_Tx_BtslceTr = "T" *) 
  (* C_Tx_Data_Width = "8" *) 
  (* C_Tx_Gating = "ENABLE" *) 
  (* C_Update_Mode = "ASYNC" *) 
  (* C_UsedBitslices = "7'b0010000" *) 
  design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_Tx_Nibble BaseX_Byte_I_Tx_Nibble
       (.TxTri_Ce(BaseX_TriOdly_Ce),
        .TxTri_Clk(BaseX_Dly_Clk),
        .TxTri_CntValueIn(BaseX_TriOdly_CntValueIn),
        .TxTri_CntValueOut(BaseX_TriOdly_CntValueOut),
        .TxTri_Inc(BaseX_TriOdly_Inc),
        .TxTri_Load(BaseX_TriOdly_Load),
        .Tx_Bs_En_Vtc(BaseX_Tx_Bs_En_Vtc),
        .Tx_Bs_Rst(BaseX_Tx_Bs_Rst),
        .Tx_Bsc_En_Vtc(BaseX_Tx_Bsc_En_Vtc),
        .Tx_Bsc_Rst(BaseX_Tx_Bsc_Rst),
        .Tx_Ce(BaseX_Odly_Ce),
        .Tx_Clk(BaseX_Dly_Clk),
        .Tx_Clk_From_Ext(1'b1),
        .Tx_Clk_To_Ext_North(NLW_BaseX_Byte_I_Tx_Nibble_Tx_Clk_To_Ext_North_UNCONNECTED),
        .Tx_Clk_To_Ext_South(NLW_BaseX_Byte_I_Tx_Nibble_Tx_Clk_To_Ext_South_UNCONNECTED),
        .Tx_CntValueIn(BaseX_Odly_CntValueIn),
        .Tx_CntValueOut(BaseX_Odly_CntValueOut),
        .Tx_D_In(BaseX_Tx_D_In),
        .Tx_Data_Out(BaseX_Tx_Data_Out),
        .Tx_Dly_Rdy(BaseX_Tx_Dly_Rdy),
        .Tx_Dyn_Dci(NLW_BaseX_Byte_I_Tx_Nibble_Tx_Dyn_Dci_UNCONNECTED[6:0]),
        .Tx_Inc(BaseX_Odly_Inc),
        .Tx_Load(BaseX_Odly_Load),
        .Tx_Nclk_Nibble_In(1'b1),
        .Tx_Nclk_Nibble_Out(NLW_BaseX_Byte_I_Tx_Nibble_Tx_Nclk_Nibble_Out_UNCONNECTED),
        .Tx_Pclk_Nibble_In(1'b1),
        .Tx_Pclk_Nibble_Out(NLW_BaseX_Byte_I_Tx_Nibble_Tx_Pclk_Nibble_Out_UNCONNECTED),
        .Tx_Phy_Rden(BaseX_Tx_Phy_Rden),
        .Tx_Pll_Clk(BaseX_Tx_Pll_Clk),
        .Tx_RefClk(1'b0),
        .Tx_Riu_Addr(BaseX_Riu_Addr),
        .Tx_Riu_Clk(BaseX_Riu_Clk),
        .Tx_Riu_Nibble_Sel(BaseX_Riu_Nibble_Sel[1]),
        .Tx_Riu_Rd_Data(IntTx_Riu_Rd_Data),
        .Tx_Riu_Valid(IntTx_Riu_Valid),
        .Tx_Riu_Wr_Data(BaseX_Riu_Wr_Data),
        .Tx_Riu_Wr_En(BaseX_Riu_Wr_En),
        .Tx_Rst_Dly(BaseX_Tx_Rst_Dly),
        .Tx_T_In(BaseX_Tx_T_In),
        .Tx_Tbyte_In({IntActTx_TByteinPip,IntActTx_TByteinPip,IntActTx_TByteinPip,IntActTx_TByteinPip}),
        .Tx_Tri_Out(BaseX_Tx_Tri_Out),
        .Tx_Vtc_Rdy(BaseX_Tx_Vtc_Rdy));
  (* box_type = "PRIMITIVE" *) 
  RIU_OR #(
    .SIM_DEVICE("ULTRASCALE_PLUS_ES1"),
    .SIM_VERSION(2.000000)) 
    \Gen_0.BaseX_Byte_I_Riu_Or_TxLow 
       (.RIU_RD_DATA(BaseX_Riu_Rd_Data),
        .RIU_RD_DATA_LOW(IntTx_Riu_Rd_Data),
        .RIU_RD_DATA_UPP(IntRx_Riu_Rd_Data),
        .RIU_RD_VALID(BaseX_Riu_Valid),
        .RIU_RD_VALID_LOW(IntTx_Riu_Valid),
        .RIU_RD_VALID_UPP(IntRx_Riu_Valid));
  FDCE \IntActTx_TByteinPip_reg[0] 
       (.C(Tx_RdClk),
        .CE(1'b1),
        .CLR(BaseX_Tx_Bsc_Rst),
        .D(BaseX_Tx_Vtc_Rdy),
        .Q(IntActTx_TByteinPip__0));
  FDCE \IntActTx_TByteinPip_reg[1] 
       (.C(Tx_RdClk),
        .CE(1'b1),
        .CLR(BaseX_Tx_Bsc_Rst),
        .D(IntActTx_TByteinPip__0),
        .Q(IntActTx_TByteinPip));
endmodule

(* C_IoBank = "44" *) (* C_Part = "XCKU060" *) (* EXAMPLE_SIMULATION = "0" *) 
(* ORIG_REF_NAME = "design_1_gig_ethernet_pcs_pma_0_0_Clock_Reset" *) (* dont_touch = "yes" *) 
module design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_Clock_Reset
   (ClockIn_p,
    ClockIn_n,
    ClockIn_se_out,
    ResetIn,
    Tx_Dly_Rdy,
    Tx_Vtc_Rdy,
    Tx_Bsc_EnVtc,
    Tx_Bs_EnVtc,
    Rx_Dly_Rdy,
    Rx_Vtc_Rdy,
    Rx_Bsc_EnVtc,
    Rx_Bs_EnVtc,
    Tx_SysClk,
    Tx_WrClk,
    Tx_ClkOutPhy,
    Rx_SysClk,
    Rx_RiuClk,
    Rx_ClkOutPhy,
    Tx_Locked,
    Tx_Bs_RstDly,
    Tx_Bs_Rst,
    Tx_Bsc_Rst,
    Tx_LogicRst,
    Rx_Locked,
    Rx_Bs_RstDly,
    Rx_Bs_Rst,
    Rx_Bsc_Rst,
    Rx_LogicRst,
    Riu_Addr,
    Riu_WrData,
    Riu_Wr_En,
    Riu_Nibble_Sel,
    Riu_RdData_3,
    Riu_Valid_3,
    Riu_Prsnt_3,
    Riu_RdData_2,
    Riu_Valid_2,
    Riu_Prsnt_2,
    Riu_RdData_1,
    Riu_Valid_1,
    Riu_Prsnt_1,
    Riu_RdData_0,
    Riu_Valid_0,
    Riu_Prsnt_0,
    Rx_BtVal_3,
    Rx_BtVal_2,
    Rx_BtVal_1,
    Rx_BtVal_0,
    Debug_Out);
  input ClockIn_p;
  input ClockIn_n;
  output ClockIn_se_out;
  input ResetIn;
  input Tx_Dly_Rdy;
  input Tx_Vtc_Rdy;
  output Tx_Bsc_EnVtc;
  output Tx_Bs_EnVtc;
  input Rx_Dly_Rdy;
  input Rx_Vtc_Rdy;
  output Rx_Bsc_EnVtc;
  output Rx_Bs_EnVtc;
  output Tx_SysClk;
  output Tx_WrClk;
  output Tx_ClkOutPhy;
  output Rx_SysClk;
  output Rx_RiuClk;
  output Rx_ClkOutPhy;
  output Tx_Locked;
  output Tx_Bs_RstDly;
  output Tx_Bs_Rst;
  output Tx_Bsc_Rst;
  output Tx_LogicRst;
  output Rx_Locked;
  output Rx_Bs_RstDly;
  output Rx_Bs_Rst;
  output Rx_Bsc_Rst;
  output Rx_LogicRst;
  output [5:0]Riu_Addr;
  output [15:0]Riu_WrData;
  output Riu_Wr_En;
  output [1:0]Riu_Nibble_Sel;
  input [15:0]Riu_RdData_3;
  input Riu_Valid_3;
  input Riu_Prsnt_3;
  input [15:0]Riu_RdData_2;
  input Riu_Valid_2;
  input Riu_Prsnt_2;
  input [15:0]Riu_RdData_1;
  input Riu_Valid_1;
  input Riu_Prsnt_1;
  input [15:0]Riu_RdData_0;
  input Riu_Valid_0;
  input Riu_Prsnt_0;
  output [8:0]Rx_BtVal_3;
  output [8:0]Rx_BtVal_2;
  output [8:0]Rx_BtVal_1;
  output [8:0]Rx_BtVal_0;
  output [7:0]Debug_Out;

  wire \<const0> ;
  wire \<const1> ;
  wire CLKOUTPHYEN;
  wire ClockIn_n;
  wire ClockIn_p;
  wire ClockIn_se_out;
  wire [7:0]Debug_Out;
  wire IntCtrl_Reset;
  (* async_reg = "true" *) wire [1:0]IntCtrl_RxDlyRdy;
  (* async_reg = "true" *) wire [1:0]IntCtrl_RxLocked;
  wire IntCtrl_RxLogicRst_i_1_n_0;
  wire IntCtrl_RxLogicRst_reg_n_0;
  wire IntCtrl_RxPllClkOutPhyEn_i_1_n_0;
  wire IntCtrl_RxPllClkOutPhyEn_i_2_n_0;
  wire IntCtrl_RxPllClkOutPhyEn_i_3_n_0;
  wire IntCtrl_RxPllClkOutPhyEn_reg_n_0;
  (* async_reg = "true" *) wire [1:0]IntCtrl_RxVtcRdy;
  wire IntCtrl_State;
  wire \IntCtrl_State[0]_i_1_n_0 ;
  wire \IntCtrl_State[1]_i_1_n_0 ;
  wire \IntCtrl_State[2]_i_1_n_0 ;
  wire \IntCtrl_State[3]_i_1_n_0 ;
  wire \IntCtrl_State[4]_i_1_n_0 ;
  wire \IntCtrl_State[5]_i_1_n_0 ;
  wire \IntCtrl_State[5]_i_2_n_0 ;
  wire \IntCtrl_State[6]_i_1_n_0 ;
  wire \IntCtrl_State[6]_i_2_n_0 ;
  wire \IntCtrl_State[7]_i_2_n_0 ;
  wire \IntCtrl_State[7]_i_3_n_0 ;
  wire \IntCtrl_State[7]_i_4_n_0 ;
  wire \IntCtrl_State[7]_i_5_n_0 ;
  wire \IntCtrl_State[7]_i_6_n_0 ;
  wire \IntCtrl_State[7]_i_7_n_0 ;
  wire \IntCtrl_State[7]_i_8_n_0 ;
  wire \IntCtrl_State[8]_i_1_n_0 ;
  wire \IntCtrl_State_reg_n_0_[8] ;
  (* async_reg = "true" *) wire [1:0]IntCtrl_TxDlyRdy;
  (* async_reg = "true" *) wire [1:0]IntCtrl_TxLocked;
  wire IntCtrl_TxLogicRst_i_1_n_0;
  wire IntCtrl_TxLogicRst_i_2_n_0;
  wire IntCtrl_TxLogicRst_i_3_n_0;
  wire IntCtrl_TxLogicRst_reg_n_0;
  wire IntCtrl_TxPllClkOutPhyEn_i_1_n_0;
  wire IntCtrl_TxPllClkOutPhyEn_i_2_n_0;
  wire IntCtrl_TxPllClkOutPhyEn_i_3_n_0;
  wire IntCtrl_TxPllClkOutPhyEn_i_4_n_0;
  wire IntCtrl_TxPllClkOutPhyEn_i_5_n_0;
  wire IntCtrl_TxPllRst_i_1_n_0;
  wire IntCtrl_TxPllRst_i_2_n_0;
  (* async_reg = "true" *) wire [1:0]IntCtrl_TxVtcRdy;
  wire IntRx_ClkOut0;
  wire IntTx_ClkOut0;
  wire IntTx_ClkOut1;
  wire RST;
  wire ResetIn;
  wire [4:0]\^Riu_Addr ;
  wire [5:0]Riu_Addr0_in;
  wire \Riu_Addr[0]_i_2_n_0 ;
  wire \Riu_Addr[1]_i_2_n_0 ;
  wire \Riu_Addr[5]_i_1_n_0 ;
  wire \Riu_Addr[5]_i_3_n_0 ;
  wire \Riu_Addr[5]_i_4_n_0 ;
  wire \Riu_Addr[5]_i_5_n_0 ;
  wire \Riu_Addr[5]_i_6_n_0 ;
  wire \Riu_Addr[5]_i_7_n_0 ;
  wire [0:0]\^Riu_Nibble_Sel ;
  wire \Riu_Nibble_Sel[0]_i_1_n_0 ;
  wire Riu_Prsnt_0;
  wire Riu_Prsnt_1;
  wire Riu_Prsnt_2;
  wire Riu_Prsnt_3;
  wire [15:0]Riu_RdData_0;
  wire [15:0]Riu_RdData_1;
  wire [15:0]Riu_RdData_2;
  wire [15:0]Riu_RdData_3;
  wire \Riu_WrData[3]_i_1_n_0 ;
  wire \Riu_WrData[3]_i_2_n_0 ;
  wire Riu_Wr_En;
  wire Rx_Bs_EnVtc;
  wire Rx_Bs_EnVtc_i_1_n_0;
  wire Rx_Bs_EnVtc_i_2_n_0;
  wire Rx_Bs_EnVtc_i_3_n_0;
  wire Rx_Bs_EnVtc_i_4_n_0;
  wire Rx_Bs_Rst;
  wire Rx_Bs_RstDly;
  wire Rx_Bs_Rst_i_1_n_0;
  wire Rx_Bs_Rst_i_2_n_0;
  wire Rx_Bs_Rst_i_3_n_0;
  wire Rx_Bsc_Rst;
  wire [8:0]Rx_BtVal_0;
  wire [8:0]Rx_BtVal_1;
  wire [8:0]Rx_BtVal_2;
  wire [8:0]Rx_BtVal_3;
  wire \Rx_BtVal_3[8]_i_10_n_0 ;
  wire \Rx_BtVal_3[8]_i_11_n_0 ;
  wire \Rx_BtVal_3[8]_i_12_n_0 ;
  wire \Rx_BtVal_3[8]_i_13_n_0 ;
  wire \Rx_BtVal_3[8]_i_14_n_0 ;
  wire \Rx_BtVal_3[8]_i_15_n_0 ;
  wire \Rx_BtVal_3[8]_i_16_n_0 ;
  wire \Rx_BtVal_3[8]_i_17_n_0 ;
  wire \Rx_BtVal_3[8]_i_18_n_0 ;
  wire \Rx_BtVal_3[8]_i_19_n_0 ;
  wire \Rx_BtVal_3[8]_i_1_n_0 ;
  wire \Rx_BtVal_3[8]_i_20_n_0 ;
  wire \Rx_BtVal_3[8]_i_2_n_0 ;
  wire \Rx_BtVal_3[8]_i_3_n_0 ;
  wire \Rx_BtVal_3[8]_i_4_n_0 ;
  wire \Rx_BtVal_3[8]_i_5_n_0 ;
  wire \Rx_BtVal_3[8]_i_6_n_0 ;
  wire \Rx_BtVal_3[8]_i_7_n_0 ;
  wire \Rx_BtVal_3[8]_i_8_n_0 ;
  wire \Rx_BtVal_3[8]_i_9_n_0 ;
  wire Rx_ClkOutPhy;
  wire Rx_Dly_Rdy;
  wire Rx_Locked;
  wire Rx_LogicRst;
  wire Rx_RiuClk;
  wire Rx_SysClk;
  wire Rx_Vtc_Rdy;
  wire Tx_Bs_Rst;
  wire Tx_Bs_RstDly_i_1_n_0;
  wire Tx_Bs_RstDly_i_2_n_0;
  wire Tx_Bs_Rst_i_1_n_0;
  wire Tx_Bsc_EnVtc;
  wire Tx_Bsc_EnVtc_i_1_n_0;
  wire Tx_Bsc_EnVtc_i_2_n_0;
  wire Tx_Bsc_EnVtc_i_3_n_0;
  wire Tx_Bsc_EnVtc_i_4_n_0;
  wire Tx_Bsc_Rst_i_1_n_0;
  wire Tx_Bsc_Rst_i_2_n_0;
  wire Tx_Bsc_Rst_i_3_n_0;
  wire Tx_ClkOutPhy;
  wire Tx_Dly_Rdy;
  wire Tx_Locked;
  wire Tx_LogicRst;
  wire Tx_SysClk;
  wire Tx_Vtc_Rdy;
  wire Tx_WrClk;
  wire NLW_Clk_Rst_I_Plle3_Rx_CLKFBIN_UNCONNECTED;
  wire NLW_Clk_Rst_I_Plle3_Rx_CLKFBOUT_UNCONNECTED;
  wire NLW_Clk_Rst_I_Plle3_Rx_CLKOUT0B_UNCONNECTED;
  wire NLW_Clk_Rst_I_Plle3_Rx_CLKOUT1_UNCONNECTED;
  wire NLW_Clk_Rst_I_Plle3_Rx_CLKOUT1B_UNCONNECTED;
  wire NLW_Clk_Rst_I_Plle3_Rx_DRDY_UNCONNECTED;
  wire [15:0]NLW_Clk_Rst_I_Plle3_Rx_DO_UNCONNECTED;
  wire NLW_Clk_Rst_I_Plle3_Tx_CLKFBIN_UNCONNECTED;
  wire NLW_Clk_Rst_I_Plle3_Tx_CLKFBOUT_UNCONNECTED;
  wire NLW_Clk_Rst_I_Plle3_Tx_CLKOUT0B_UNCONNECTED;
  wire NLW_Clk_Rst_I_Plle3_Tx_CLKOUT1B_UNCONNECTED;
  wire NLW_Clk_Rst_I_Plle3_Tx_DRDY_UNCONNECTED;
  wire [15:0]NLW_Clk_Rst_I_Plle3_Tx_DO_UNCONNECTED;

  assign Riu_Addr[5] = \^Riu_Addr [4];
  assign Riu_Addr[4] = \^Riu_Addr [4];
  assign Riu_Addr[3] = \^Riu_Addr [4];
  assign Riu_Addr[2] = \<const0> ;
  assign Riu_Addr[1:0] = \^Riu_Addr [1:0];
  assign Riu_Nibble_Sel[1] = \<const0> ;
  assign Riu_Nibble_Sel[0] = \^Riu_Nibble_Sel [0];
  assign Riu_WrData[15] = \<const0> ;
  assign Riu_WrData[14] = \<const0> ;
  assign Riu_WrData[13] = \<const0> ;
  assign Riu_WrData[12] = \<const0> ;
  assign Riu_WrData[11] = \<const0> ;
  assign Riu_WrData[10] = \<const0> ;
  assign Riu_WrData[9] = \<const0> ;
  assign Riu_WrData[8] = \<const0> ;
  assign Riu_WrData[7] = \<const0> ;
  assign Riu_WrData[6] = \<const0> ;
  assign Riu_WrData[5] = \<const0> ;
  assign Riu_WrData[4] = \<const0> ;
  assign Riu_WrData[3] = Riu_Wr_En;
  assign Riu_WrData[2] = Riu_Wr_En;
  assign Riu_WrData[1] = \<const0> ;
  assign Riu_WrData[0] = \<const0> ;
  assign Rx_Bsc_EnVtc = \<const0> ;
  assign Tx_Bs_EnVtc = \<const1> ;
  assign Tx_Bs_RstDly = Rx_Bs_RstDly;
  assign Tx_Bsc_Rst = Rx_Bsc_Rst;
  (* box_type = "PRIMITIVE" *) 
  BUFGCE_DIV #(
    .BUFGCE_DIVIDE(4),
    .IS_CE_INVERTED(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_I_INVERTED(1'b0)) 
    Bufg_CtrlClk
       (.CE(1'b1),
        .CLR(1'b0),
        .I(ClockIn_se_out),
        .O(Rx_RiuClk));
  (* box_type = "PRIMITIVE" *) 
  BUFGCE #(
    .CE_TYPE("SYNC"),
    .IS_CE_INVERTED(1'b0),
    .IS_I_INVERTED(1'b0)) 
    Clk_Rst_I_Bufg_RxSysClk
       (.CE(Rx_Locked),
        .I(IntRx_ClkOut0),
        .O(Rx_SysClk));
  (* box_type = "PRIMITIVE" *) 
  BUFGCE #(
    .CE_TYPE("SYNC"),
    .IS_CE_INVERTED(1'b0),
    .IS_I_INVERTED(1'b0)) 
    Clk_Rst_I_Bufg_TxSysClk
       (.CE(Tx_Locked),
        .I(IntTx_ClkOut0),
        .O(Tx_SysClk));
  (* box_type = "PRIMITIVE" *) 
  BUFGCE #(
    .CE_TYPE("SYNC"),
    .IS_CE_INVERTED(1'b0),
    .IS_I_INVERTED(1'b0)) 
    Clk_Rst_I_Bufg_TxWrClk
       (.CE(Tx_Locked),
        .I(IntTx_ClkOut1),
        .O(Tx_WrClk));
  (* XILINX_LEGACY_PRIM = "PLLE3_ADV" *) 
  (* box_type = "PRIMITIVE" *) 
  PLLE4_ADV #(
    .CLKFBOUT_MULT(2),
    .CLKFBOUT_PHASE(0.000000),
    .CLKIN_PERIOD(1.600000),
    .CLKOUT0_DIVIDE(4),
    .CLKOUT0_DUTY_CYCLE(0.500000),
    .CLKOUT0_PHASE(0.000000),
    .CLKOUT1_DIVIDE(8),
    .CLKOUT1_DUTY_CYCLE(0.500000),
    .CLKOUT1_PHASE(0.000000),
    .CLKOUTPHY_MODE("VCO_HALF"),
    .COMPENSATION("INTERNAL"),
    .DIVCLK_DIVIDE(1),
    .IS_CLKFBIN_INVERTED(1'b0),
    .IS_CLKIN_INVERTED(1'b0),
    .IS_PWRDWN_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b0),
    .REF_JITTER(0.010000),
    .STARTUP_WAIT("FALSE")) 
    Clk_Rst_I_Plle3_Rx
       (.CLKFBIN(NLW_Clk_Rst_I_Plle3_Rx_CLKFBIN_UNCONNECTED),
        .CLKFBOUT(NLW_Clk_Rst_I_Plle3_Rx_CLKFBOUT_UNCONNECTED),
        .CLKIN(ClockIn_se_out),
        .CLKOUT0(IntRx_ClkOut0),
        .CLKOUT0B(NLW_Clk_Rst_I_Plle3_Rx_CLKOUT0B_UNCONNECTED),
        .CLKOUT1(NLW_Clk_Rst_I_Plle3_Rx_CLKOUT1_UNCONNECTED),
        .CLKOUT1B(NLW_Clk_Rst_I_Plle3_Rx_CLKOUT1B_UNCONNECTED),
        .CLKOUTPHY(Rx_ClkOutPhy),
        .CLKOUTPHYEN(IntCtrl_RxPllClkOutPhyEn_reg_n_0),
        .DADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DCLK(1'b0),
        .DEN(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DO(NLW_Clk_Rst_I_Plle3_Rx_DO_UNCONNECTED[15:0]),
        .DRDY(NLW_Clk_Rst_I_Plle3_Rx_DRDY_UNCONNECTED),
        .DWE(1'b0),
        .LOCKED(Rx_Locked),
        .PWRDWN(1'b0),
        .RST(ResetIn));
  (* XILINX_LEGACY_PRIM = "PLLE3_ADV" *) 
  (* box_type = "PRIMITIVE" *) 
  PLLE4_ADV #(
    .CLKFBOUT_MULT(2),
    .CLKFBOUT_PHASE(0.000000),
    .CLKIN_PERIOD(1.600000),
    .CLKOUT0_DIVIDE(8),
    .CLKOUT0_DUTY_CYCLE(0.500000),
    .CLKOUT0_PHASE(0.000000),
    .CLKOUT1_DIVIDE(10),
    .CLKOUT1_DUTY_CYCLE(0.500000),
    .CLKOUT1_PHASE(0.000000),
    .CLKOUTPHY_MODE("VCO"),
    .COMPENSATION("INTERNAL"),
    .DIVCLK_DIVIDE(1),
    .IS_CLKFBIN_INVERTED(1'b0),
    .IS_CLKIN_INVERTED(1'b0),
    .IS_PWRDWN_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b0),
    .REF_JITTER(0.010000),
    .STARTUP_WAIT("FALSE")) 
    Clk_Rst_I_Plle3_Tx
       (.CLKFBIN(NLW_Clk_Rst_I_Plle3_Tx_CLKFBIN_UNCONNECTED),
        .CLKFBOUT(NLW_Clk_Rst_I_Plle3_Tx_CLKFBOUT_UNCONNECTED),
        .CLKIN(ClockIn_se_out),
        .CLKOUT0(IntTx_ClkOut0),
        .CLKOUT0B(NLW_Clk_Rst_I_Plle3_Tx_CLKOUT0B_UNCONNECTED),
        .CLKOUT1(IntTx_ClkOut1),
        .CLKOUT1B(NLW_Clk_Rst_I_Plle3_Tx_CLKOUT1B_UNCONNECTED),
        .CLKOUTPHY(Tx_ClkOutPhy),
        .CLKOUTPHYEN(CLKOUTPHYEN),
        .DADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DCLK(1'b0),
        .DEN(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DO(NLW_Clk_Rst_I_Plle3_Tx_DO_UNCONNECTED[15:0]),
        .DRDY(NLW_Clk_Rst_I_Plle3_Tx_DRDY_UNCONNECTED),
        .DWE(1'b0),
        .LOCKED(Tx_Locked),
        .PWRDWN(1'b0),
        .RST(RST));
  GND GND
       (.G(\<const0> ));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE \IntCtrl_RxDlyRdy_reg[0] 
       (.C(Rx_RiuClk),
        .CE(1'b1),
        .D(Rx_Dly_Rdy),
        .Q(IntCtrl_RxDlyRdy[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE \IntCtrl_RxDlyRdy_reg[1] 
       (.C(Rx_RiuClk),
        .CE(1'b1),
        .D(IntCtrl_RxDlyRdy[0]),
        .Q(IntCtrl_RxDlyRdy[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE \IntCtrl_RxLocked_reg[0] 
       (.C(Rx_RiuClk),
        .CE(1'b1),
        .D(Rx_Locked),
        .Q(IntCtrl_RxLocked[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE \IntCtrl_RxLocked_reg[1] 
       (.C(Rx_RiuClk),
        .CE(1'b1),
        .D(IntCtrl_RxLocked[0]),
        .Q(IntCtrl_RxLocked[1]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h2)) 
    IntCtrl_RxLogicRst_i_1
       (.I0(IntCtrl_RxLogicRst_reg_n_0),
        .I1(\IntCtrl_State[5]_i_2_n_0 ),
        .O(IntCtrl_RxLogicRst_i_1_n_0));
  FDSE IntCtrl_RxLogicRst_reg
       (.C(Rx_RiuClk),
        .CE(1'b1),
        .D(IntCtrl_RxLogicRst_i_1_n_0),
        .Q(IntCtrl_RxLogicRst_reg_n_0),
        .S(IntCtrl_Reset));
  LUT5 #(
    .INIT(32'hFFBF00B0)) 
    IntCtrl_RxPllClkOutPhyEn_i_1
       (.I0(\IntCtrl_State_reg_n_0_[8] ),
        .I1(Debug_Out[4]),
        .I2(IntCtrl_RxPllClkOutPhyEn_i_2_n_0),
        .I3(IntCtrl_RxPllClkOutPhyEn_i_3_n_0),
        .I4(IntCtrl_RxPllClkOutPhyEn_reg_n_0),
        .O(IntCtrl_RxPllClkOutPhyEn_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h10000001)) 
    IntCtrl_RxPllClkOutPhyEn_i_2
       (.I0(Debug_Out[0]),
        .I1(Debug_Out[1]),
        .I2(Debug_Out[4]),
        .I3(Debug_Out[2]),
        .I4(Debug_Out[3]),
        .O(IntCtrl_RxPllClkOutPhyEn_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hFF7FF6FF)) 
    IntCtrl_RxPllClkOutPhyEn_i_3
       (.I0(Debug_Out[5]),
        .I1(Debug_Out[4]),
        .I2(\IntCtrl_State_reg_n_0_[8] ),
        .I3(Debug_Out[7]),
        .I4(Debug_Out[6]),
        .O(IntCtrl_RxPllClkOutPhyEn_i_3_n_0));
  FDRE IntCtrl_RxPllClkOutPhyEn_reg
       (.C(Rx_RiuClk),
        .CE(1'b1),
        .D(IntCtrl_RxPllClkOutPhyEn_i_1_n_0),
        .Q(IntCtrl_RxPllClkOutPhyEn_reg_n_0),
        .R(IntCtrl_Reset));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE \IntCtrl_RxVtcRdy_reg[0] 
       (.C(Rx_RiuClk),
        .CE(1'b1),
        .D(Rx_Vtc_Rdy),
        .Q(IntCtrl_RxVtcRdy[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE \IntCtrl_RxVtcRdy_reg[1] 
       (.C(Rx_RiuClk),
        .CE(1'b1),
        .D(IntCtrl_RxVtcRdy[0]),
        .Q(IntCtrl_RxVtcRdy[1]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \IntCtrl_State[0]_i_1 
       (.I0(\IntCtrl_State[5]_i_2_n_0 ),
        .I1(Debug_Out[0]),
        .O(\IntCtrl_State[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hBE)) 
    \IntCtrl_State[1]_i_1 
       (.I0(\IntCtrl_State[5]_i_2_n_0 ),
        .I1(Debug_Out[0]),
        .I2(Debug_Out[1]),
        .O(\IntCtrl_State[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hBFEA)) 
    \IntCtrl_State[2]_i_1 
       (.I0(\IntCtrl_State[5]_i_2_n_0 ),
        .I1(Debug_Out[1]),
        .I2(Debug_Out[0]),
        .I3(Debug_Out[2]),
        .O(\IntCtrl_State[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hBFFFEAAA)) 
    \IntCtrl_State[3]_i_1 
       (.I0(\IntCtrl_State[5]_i_2_n_0 ),
        .I1(Debug_Out[2]),
        .I2(Debug_Out[0]),
        .I3(Debug_Out[1]),
        .I4(Debug_Out[3]),
        .O(\IntCtrl_State[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBFFFFFFFEAAAAAAA)) 
    \IntCtrl_State[4]_i_1 
       (.I0(\IntCtrl_State[5]_i_2_n_0 ),
        .I1(Debug_Out[0]),
        .I2(Debug_Out[1]),
        .I3(Debug_Out[3]),
        .I4(Debug_Out[2]),
        .I5(Debug_Out[4]),
        .O(\IntCtrl_State[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFBFFFAAAAEAAA)) 
    \IntCtrl_State[5]_i_1 
       (.I0(\IntCtrl_State[5]_i_2_n_0 ),
        .I1(Debug_Out[4]),
        .I2(Debug_Out[2]),
        .I3(Debug_Out[3]),
        .I4(\Riu_Addr[5]_i_4_n_0 ),
        .I5(Debug_Out[5]),
        .O(\IntCtrl_State[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \IntCtrl_State[5]_i_2 
       (.I0(Debug_Out[7]),
        .I1(\IntCtrl_State_reg_n_0_[8] ),
        .I2(\IntCtrl_State[7]_i_5_n_0 ),
        .O(\IntCtrl_State[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'hD999)) 
    \IntCtrl_State[6]_i_1 
       (.I0(\IntCtrl_State[6]_i_2_n_0 ),
        .I1(Debug_Out[6]),
        .I2(\IntCtrl_State_reg_n_0_[8] ),
        .I3(Debug_Out[7]),
        .O(\IntCtrl_State[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \IntCtrl_State[6]_i_2 
       (.I0(Debug_Out[5]),
        .I1(Debug_Out[4]),
        .I2(Debug_Out[1]),
        .I3(Debug_Out[0]),
        .I4(Debug_Out[3]),
        .I5(Debug_Out[2]),
        .O(\IntCtrl_State[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF8000)) 
    \IntCtrl_State[7]_i_1 
       (.I0(Debug_Out[4]),
        .I1(Debug_Out[3]),
        .I2(Debug_Out[5]),
        .I3(\Rx_BtVal_3[8]_i_2_n_0 ),
        .I4(\IntCtrl_State[7]_i_3_n_0 ),
        .I5(\IntCtrl_State[7]_i_4_n_0 ),
        .O(IntCtrl_State));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hE5)) 
    \IntCtrl_State[7]_i_2 
       (.I0(\IntCtrl_State[7]_i_5_n_0 ),
        .I1(\IntCtrl_State_reg_n_0_[8] ),
        .I2(Debug_Out[7]),
        .O(\IntCtrl_State[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFE000)) 
    \IntCtrl_State[7]_i_3 
       (.I0(Debug_Out[3]),
        .I1(Rx_Bs_EnVtc_i_2_n_0),
        .I2(Debug_Out[2]),
        .I3(Debug_Out[4]),
        .I4(\IntCtrl_State[7]_i_6_n_0 ),
        .I5(\IntCtrl_State[7]_i_7_n_0 ),
        .O(\IntCtrl_State[7]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hF44FFFFF4FF44444)) 
    \IntCtrl_State[7]_i_4 
       (.I0(\IntCtrl_State[7]_i_8_n_0 ),
        .I1(\Riu_Addr[5]_i_6_n_0 ),
        .I2(Debug_Out[3]),
        .I3(Debug_Out[2]),
        .I4(Debug_Out[5]),
        .I5(Debug_Out[0]),
        .O(\IntCtrl_State[7]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hF7FFFFFFFFFFFFFF)) 
    \IntCtrl_State[7]_i_5 
       (.I0(Debug_Out[2]),
        .I1(Debug_Out[3]),
        .I2(\Riu_Addr[5]_i_4_n_0 ),
        .I3(Debug_Out[4]),
        .I4(Debug_Out[5]),
        .I5(Debug_Out[6]),
        .O(\IntCtrl_State[7]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h2F2222226F6F6F6F)) 
    \IntCtrl_State[7]_i_6 
       (.I0(Debug_Out[1]),
        .I1(Debug_Out[0]),
        .I2(Debug_Out[4]),
        .I3(IntCtrl_TxDlyRdy[1]),
        .I4(IntCtrl_RxDlyRdy[1]),
        .I5(Debug_Out[2]),
        .O(\IntCtrl_State[7]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h003F223FFFFF223F)) 
    \IntCtrl_State[7]_i_7 
       (.I0(IntCtrl_TxVtcRdy[1]),
        .I1(Debug_Out[3]),
        .I2(Debug_Out[5]),
        .I3(Debug_Out[4]),
        .I4(Debug_Out[2]),
        .I5(\Riu_Addr[5]_i_4_n_0 ),
        .O(\IntCtrl_State[7]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h0000020002000200)) 
    \IntCtrl_State[7]_i_8 
       (.I0(Tx_Bsc_Rst_i_3_n_0),
        .I1(Debug_Out[5]),
        .I2(Debug_Out[6]),
        .I3(Debug_Out[3]),
        .I4(IntCtrl_RxLocked[1]),
        .I5(IntCtrl_TxLocked[1]),
        .O(\IntCtrl_State[7]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \IntCtrl_State[8]_i_1 
       (.I0(\IntCtrl_State_reg_n_0_[8] ),
        .I1(\IntCtrl_State[7]_i_5_n_0 ),
        .I2(Debug_Out[7]),
        .O(\IntCtrl_State[8]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \IntCtrl_State_reg[0] 
       (.C(Rx_RiuClk),
        .CE(IntCtrl_State),
        .D(\IntCtrl_State[0]_i_1_n_0 ),
        .Q(Debug_Out[0]),
        .R(IntCtrl_Reset));
  FDRE #(
    .INIT(1'b0)) 
    \IntCtrl_State_reg[1] 
       (.C(Rx_RiuClk),
        .CE(IntCtrl_State),
        .D(\IntCtrl_State[1]_i_1_n_0 ),
        .Q(Debug_Out[1]),
        .R(IntCtrl_Reset));
  FDRE #(
    .INIT(1'b0)) 
    \IntCtrl_State_reg[2] 
       (.C(Rx_RiuClk),
        .CE(IntCtrl_State),
        .D(\IntCtrl_State[2]_i_1_n_0 ),
        .Q(Debug_Out[2]),
        .R(IntCtrl_Reset));
  FDRE #(
    .INIT(1'b0)) 
    \IntCtrl_State_reg[3] 
       (.C(Rx_RiuClk),
        .CE(IntCtrl_State),
        .D(\IntCtrl_State[3]_i_1_n_0 ),
        .Q(Debug_Out[3]),
        .R(IntCtrl_Reset));
  FDRE #(
    .INIT(1'b0)) 
    \IntCtrl_State_reg[4] 
       (.C(Rx_RiuClk),
        .CE(IntCtrl_State),
        .D(\IntCtrl_State[4]_i_1_n_0 ),
        .Q(Debug_Out[4]),
        .R(IntCtrl_Reset));
  FDRE #(
    .INIT(1'b0)) 
    \IntCtrl_State_reg[5] 
       (.C(Rx_RiuClk),
        .CE(IntCtrl_State),
        .D(\IntCtrl_State[5]_i_1_n_0 ),
        .Q(Debug_Out[5]),
        .R(IntCtrl_Reset));
  FDRE #(
    .INIT(1'b0)) 
    \IntCtrl_State_reg[6] 
       (.C(Rx_RiuClk),
        .CE(IntCtrl_State),
        .D(\IntCtrl_State[6]_i_1_n_0 ),
        .Q(Debug_Out[6]),
        .R(IntCtrl_Reset));
  FDRE #(
    .INIT(1'b0)) 
    \IntCtrl_State_reg[7] 
       (.C(Rx_RiuClk),
        .CE(IntCtrl_State),
        .D(\IntCtrl_State[7]_i_2_n_0 ),
        .Q(Debug_Out[7]),
        .R(IntCtrl_Reset));
  FDRE #(
    .INIT(1'b0)) 
    \IntCtrl_State_reg[8] 
       (.C(Rx_RiuClk),
        .CE(IntCtrl_State),
        .D(\IntCtrl_State[8]_i_1_n_0 ),
        .Q(\IntCtrl_State_reg_n_0_[8] ),
        .R(IntCtrl_Reset));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE \IntCtrl_TxDlyRdy_reg[0] 
       (.C(Rx_RiuClk),
        .CE(1'b1),
        .D(Tx_Dly_Rdy),
        .Q(IntCtrl_TxDlyRdy[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE \IntCtrl_TxDlyRdy_reg[1] 
       (.C(Rx_RiuClk),
        .CE(1'b1),
        .D(IntCtrl_TxDlyRdy[0]),
        .Q(IntCtrl_TxDlyRdy[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE \IntCtrl_TxLocked_reg[0] 
       (.C(Rx_RiuClk),
        .CE(1'b1),
        .D(Tx_Locked),
        .Q(IntCtrl_TxLocked[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE \IntCtrl_TxLocked_reg[1] 
       (.C(Rx_RiuClk),
        .CE(1'b1),
        .D(IntCtrl_TxLocked[0]),
        .Q(IntCtrl_TxLocked[1]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hAA8AAAAAAAAAAAAA)) 
    IntCtrl_TxLogicRst_i_1
       (.I0(IntCtrl_TxLogicRst_reg_n_0),
        .I1(Debug_Out[1]),
        .I2(Debug_Out[7]),
        .I3(Debug_Out[6]),
        .I4(IntCtrl_TxLogicRst_i_2_n_0),
        .I5(IntCtrl_TxLogicRst_i_3_n_0),
        .O(IntCtrl_TxLogicRst_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h8)) 
    IntCtrl_TxLogicRst_i_2
       (.I0(Debug_Out[2]),
        .I1(Debug_Out[4]),
        .O(IntCtrl_TxLogicRst_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h0010)) 
    IntCtrl_TxLogicRst_i_3
       (.I0(\IntCtrl_State_reg_n_0_[8] ),
        .I1(Debug_Out[0]),
        .I2(Debug_Out[5]),
        .I3(Debug_Out[3]),
        .O(IntCtrl_TxLogicRst_i_3_n_0));
  FDSE IntCtrl_TxLogicRst_reg
       (.C(Rx_RiuClk),
        .CE(1'b1),
        .D(IntCtrl_TxLogicRst_i_1_n_0),
        .Q(IntCtrl_TxLogicRst_reg_n_0),
        .S(IntCtrl_Reset));
  LUT6 #(
    .INIT(64'hFFFFFFFF00008000)) 
    IntCtrl_TxPllClkOutPhyEn_i_1
       (.I0(IntCtrl_TxPllClkOutPhyEn_i_2_n_0),
        .I1(IntCtrl_TxPllClkOutPhyEn_i_3_n_0),
        .I2(IntCtrl_TxPllClkOutPhyEn_i_4_n_0),
        .I3(IntCtrl_TxPllClkOutPhyEn_i_5_n_0),
        .I4(Debug_Out[3]),
        .I5(CLKOUTPHYEN),
        .O(IntCtrl_TxPllClkOutPhyEn_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h1)) 
    IntCtrl_TxPllClkOutPhyEn_i_2
       (.I0(Debug_Out[1]),
        .I1(Debug_Out[0]),
        .O(IntCtrl_TxPllClkOutPhyEn_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h1)) 
    IntCtrl_TxPllClkOutPhyEn_i_3
       (.I0(Debug_Out[5]),
        .I1(Debug_Out[6]),
        .O(IntCtrl_TxPllClkOutPhyEn_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h2)) 
    IntCtrl_TxPllClkOutPhyEn_i_4
       (.I0(Debug_Out[7]),
        .I1(\IntCtrl_State_reg_n_0_[8] ),
        .O(IntCtrl_TxPllClkOutPhyEn_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h1)) 
    IntCtrl_TxPllClkOutPhyEn_i_5
       (.I0(Debug_Out[2]),
        .I1(Debug_Out[4]),
        .O(IntCtrl_TxPllClkOutPhyEn_i_5_n_0));
  FDRE IntCtrl_TxPllClkOutPhyEn_reg
       (.C(Rx_RiuClk),
        .CE(1'b1),
        .D(IntCtrl_TxPllClkOutPhyEn_i_1_n_0),
        .Q(CLKOUTPHYEN),
        .R(IntCtrl_Reset));
  LUT6 #(
    .INIT(64'hF7FFFFFF10000000)) 
    IntCtrl_TxPllRst_i_1
       (.I0(Debug_Out[4]),
        .I1(Debug_Out[2]),
        .I2(Debug_Out[3]),
        .I3(IntCtrl_TxPllClkOutPhyEn_i_2_n_0),
        .I4(IntCtrl_TxPllRst_i_2_n_0),
        .I5(RST),
        .O(IntCtrl_TxPllRst_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    IntCtrl_TxPllRst_i_2
       (.I0(Debug_Out[6]),
        .I1(Debug_Out[5]),
        .I2(Debug_Out[7]),
        .I3(\IntCtrl_State_reg_n_0_[8] ),
        .O(IntCtrl_TxPllRst_i_2_n_0));
  FDRE IntCtrl_TxPllRst_reg
       (.C(Rx_RiuClk),
        .CE(1'b1),
        .D(IntCtrl_TxPllRst_i_1_n_0),
        .Q(RST),
        .R(IntCtrl_Reset));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE \IntCtrl_TxVtcRdy_reg[0] 
       (.C(Rx_RiuClk),
        .CE(1'b1),
        .D(Tx_Vtc_Rdy),
        .Q(IntCtrl_TxVtcRdy[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE \IntCtrl_TxVtcRdy_reg[1] 
       (.C(Rx_RiuClk),
        .CE(1'b1),
        .D(IntCtrl_TxVtcRdy[0]),
        .Q(IntCtrl_TxVtcRdy[1]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h00000080)) 
    \Riu_Addr[0]_i_1 
       (.I0(\Riu_Addr[0]_i_2_n_0 ),
        .I1(Debug_Out[3]),
        .I2(Debug_Out[1]),
        .I3(Debug_Out[2]),
        .I4(Debug_Out[6]),
        .O(Riu_Addr0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \Riu_Addr[0]_i_2 
       (.I0(\IntCtrl_State_reg_n_0_[8] ),
        .I1(Debug_Out[7]),
        .I2(Debug_Out[4]),
        .I3(Debug_Out[5]),
        .O(\Riu_Addr[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \Riu_Addr[1]_i_1 
       (.I0(\Riu_Addr[1]_i_2_n_0 ),
        .I1(Debug_Out[2]),
        .I2(Debug_Out[7]),
        .I3(Debug_Out[5]),
        .I4(Debug_Out[4]),
        .O(Riu_Addr0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \Riu_Addr[1]_i_2 
       (.I0(\IntCtrl_State_reg_n_0_[8] ),
        .I1(Debug_Out[6]),
        .I2(Debug_Out[1]),
        .I3(Debug_Out[3]),
        .O(\Riu_Addr[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFEAAAEAEA)) 
    \Riu_Addr[5]_i_1 
       (.I0(\Riu_Addr[5]_i_3_n_0 ),
        .I1(Debug_Out[7]),
        .I2(\IntCtrl_State_reg_n_0_[8] ),
        .I3(\Riu_Addr[5]_i_4_n_0 ),
        .I4(Debug_Out[6]),
        .I5(\Riu_Addr[5]_i_5_n_0 ),
        .O(\Riu_Addr[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000008002800)) 
    \Riu_Addr[5]_i_2 
       (.I0(Debug_Out[1]),
        .I1(Debug_Out[3]),
        .I2(Debug_Out[2]),
        .I3(Debug_Out[4]),
        .I4(Debug_Out[0]),
        .I5(\Riu_Addr[5]_i_6_n_0 ),
        .O(Riu_Addr0_in[5]));
  LUT6 #(
    .INIT(64'h5CCC5DCC7FFFFFFF)) 
    \Riu_Addr[5]_i_3 
       (.I0(Debug_Out[3]),
        .I1(\IntCtrl_State_reg_n_0_[8] ),
        .I2(Debug_Out[2]),
        .I3(Debug_Out[5]),
        .I4(Debug_Out[7]),
        .I5(IntCtrl_TxPllClkOutPhyEn_i_2_n_0),
        .O(\Riu_Addr[5]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \Riu_Addr[5]_i_4 
       (.I0(Debug_Out[1]),
        .I1(Debug_Out[0]),
        .O(\Riu_Addr[5]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF3E007E00)) 
    \Riu_Addr[5]_i_5 
       (.I0(Debug_Out[7]),
        .I1(Debug_Out[2]),
        .I2(Debug_Out[4]),
        .I3(Debug_Out[6]),
        .I4(\IntCtrl_State_reg_n_0_[8] ),
        .I5(\Riu_Addr[5]_i_7_n_0 ),
        .O(\Riu_Addr[5]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'hFFF7)) 
    \Riu_Addr[5]_i_6 
       (.I0(Debug_Out[7]),
        .I1(Debug_Out[5]),
        .I2(\IntCtrl_State_reg_n_0_[8] ),
        .I3(Debug_Out[6]),
        .O(\Riu_Addr[5]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h3A00FFA80FFFFAA8)) 
    \Riu_Addr[5]_i_7 
       (.I0(Debug_Out[3]),
        .I1(Debug_Out[6]),
        .I2(Debug_Out[2]),
        .I3(Debug_Out[7]),
        .I4(Debug_Out[5]),
        .I5(Debug_Out[4]),
        .O(\Riu_Addr[5]_i_7_n_0 ));
  FDRE \Riu_Addr_reg[0] 
       (.C(Rx_RiuClk),
        .CE(\Riu_Addr[5]_i_1_n_0 ),
        .D(Riu_Addr0_in[0]),
        .Q(\^Riu_Addr [0]),
        .R(IntCtrl_Reset));
  FDRE \Riu_Addr_reg[1] 
       (.C(Rx_RiuClk),
        .CE(\Riu_Addr[5]_i_1_n_0 ),
        .D(Riu_Addr0_in[1]),
        .Q(\^Riu_Addr [1]),
        .R(IntCtrl_Reset));
  FDRE \Riu_Addr_reg[5] 
       (.C(Rx_RiuClk),
        .CE(\Riu_Addr[5]_i_1_n_0 ),
        .D(Riu_Addr0_in[5]),
        .Q(\^Riu_Addr [4]),
        .R(IntCtrl_Reset));
  LUT6 #(
    .INIT(64'h00070A0000000000)) 
    \Riu_Nibble_Sel[0]_i_1 
       (.I0(Debug_Out[1]),
        .I1(Debug_Out[0]),
        .I2(Debug_Out[6]),
        .I3(Debug_Out[3]),
        .I4(Debug_Out[2]),
        .I5(\Riu_Addr[0]_i_2_n_0 ),
        .O(\Riu_Nibble_Sel[0]_i_1_n_0 ));
  FDRE \Riu_Nibble_Sel_reg[0] 
       (.C(Rx_RiuClk),
        .CE(\Riu_Addr[5]_i_1_n_0 ),
        .D(\Riu_Nibble_Sel[0]_i_1_n_0 ),
        .Q(\^Riu_Nibble_Sel ),
        .R(IntCtrl_Reset));
  LUT6 #(
    .INIT(64'h0004000000000000)) 
    \Riu_WrData[3]_i_1 
       (.I0(Debug_Out[3]),
        .I1(Debug_Out[5]),
        .I2(Debug_Out[0]),
        .I3(\IntCtrl_State_reg_n_0_[8] ),
        .I4(\Riu_WrData[3]_i_2_n_0 ),
        .I5(Debug_Out[1]),
        .O(\Riu_WrData[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h0800)) 
    \Riu_WrData[3]_i_2 
       (.I0(Debug_Out[4]),
        .I1(Debug_Out[2]),
        .I2(Debug_Out[6]),
        .I3(Debug_Out[7]),
        .O(\Riu_WrData[3]_i_2_n_0 ));
  FDRE \Riu_WrData_reg[3] 
       (.C(Rx_RiuClk),
        .CE(\Riu_Addr[5]_i_1_n_0 ),
        .D(\Riu_WrData[3]_i_1_n_0 ),
        .Q(Riu_Wr_En),
        .R(IntCtrl_Reset));
  LUT5 #(
    .INIT(32'hFF5D0051)) 
    Rx_Bs_EnVtc_i_1
       (.I0(Debug_Out[0]),
        .I1(Debug_Out[7]),
        .I2(Rx_Bs_EnVtc_i_2_n_0),
        .I3(Rx_Bs_EnVtc_i_3_n_0),
        .I4(Rx_Bs_EnVtc),
        .O(Rx_Bs_EnVtc_i_1_n_0));
  LUT5 #(
    .INIT(32'h0000D0DD)) 
    Rx_Bs_EnVtc_i_2
       (.I0(Riu_Prsnt_3),
        .I1(Riu_RdData_3[11]),
        .I2(Riu_RdData_0[11]),
        .I3(Riu_Prsnt_0),
        .I4(Rx_Bs_EnVtc_i_4_n_0),
        .O(Rx_Bs_EnVtc_i_2_n_0));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFD)) 
    Rx_Bs_EnVtc_i_3
       (.I0(\Riu_Addr[1]_i_2_n_0 ),
        .I1(Debug_Out[4]),
        .I2(Debug_Out[5]),
        .I3(Debug_Out[7]),
        .I4(Debug_Out[0]),
        .I5(Debug_Out[2]),
        .O(Rx_Bs_EnVtc_i_3_n_0));
  LUT4 #(
    .INIT(16'h4F44)) 
    Rx_Bs_EnVtc_i_4
       (.I0(Riu_RdData_2[11]),
        .I1(Riu_Prsnt_2),
        .I2(Riu_RdData_1[11]),
        .I3(Riu_Prsnt_1),
        .O(Rx_Bs_EnVtc_i_4_n_0));
  FDSE Rx_Bs_EnVtc_reg
       (.C(Rx_RiuClk),
        .CE(1'b1),
        .D(Rx_Bs_EnVtc_i_1_n_0),
        .Q(Rx_Bs_EnVtc),
        .S(IntCtrl_Reset));
  LUT6 #(
    .INIT(64'hFFFFBFFF00008003)) 
    Rx_Bs_Rst_i_1
       (.I0(Debug_Out[7]),
        .I1(Debug_Out[2]),
        .I2(Debug_Out[3]),
        .I3(Debug_Out[5]),
        .I4(Rx_Bs_Rst_i_2_n_0),
        .I5(Rx_Bs_Rst),
        .O(Rx_Bs_Rst_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFDFFFFF4)) 
    Rx_Bs_Rst_i_2
       (.I0(Debug_Out[5]),
        .I1(\IntCtrl_State_reg_n_0_[8] ),
        .I2(Debug_Out[1]),
        .I3(Debug_Out[6]),
        .I4(Debug_Out[7]),
        .I5(Rx_Bs_Rst_i_3_n_0),
        .O(Rx_Bs_Rst_i_2_n_0));
  LUT2 #(
    .INIT(4'hB)) 
    Rx_Bs_Rst_i_3
       (.I0(Debug_Out[0]),
        .I1(Debug_Out[4]),
        .O(Rx_Bs_Rst_i_3_n_0));
  FDSE Rx_Bs_Rst_reg
       (.C(Rx_RiuClk),
        .CE(1'b1),
        .D(Rx_Bs_Rst_i_1_n_0),
        .Q(Rx_Bs_Rst),
        .S(IntCtrl_Reset));
  FDRE \Rx_BtVal_0_reg[0] 
       (.C(Rx_RiuClk),
        .CE(\Rx_BtVal_3[8]_i_1_n_0 ),
        .D(Riu_RdData_0[1]),
        .Q(Rx_BtVal_0[0]),
        .R(IntCtrl_Reset));
  FDRE \Rx_BtVal_0_reg[1] 
       (.C(Rx_RiuClk),
        .CE(\Rx_BtVal_3[8]_i_1_n_0 ),
        .D(Riu_RdData_0[2]),
        .Q(Rx_BtVal_0[1]),
        .R(IntCtrl_Reset));
  FDRE \Rx_BtVal_0_reg[2] 
       (.C(Rx_RiuClk),
        .CE(\Rx_BtVal_3[8]_i_1_n_0 ),
        .D(Riu_RdData_0[3]),
        .Q(Rx_BtVal_0[2]),
        .R(IntCtrl_Reset));
  FDRE \Rx_BtVal_0_reg[3] 
       (.C(Rx_RiuClk),
        .CE(\Rx_BtVal_3[8]_i_1_n_0 ),
        .D(Riu_RdData_0[4]),
        .Q(Rx_BtVal_0[3]),
        .R(IntCtrl_Reset));
  FDRE \Rx_BtVal_0_reg[4] 
       (.C(Rx_RiuClk),
        .CE(\Rx_BtVal_3[8]_i_1_n_0 ),
        .D(Riu_RdData_0[5]),
        .Q(Rx_BtVal_0[4]),
        .R(IntCtrl_Reset));
  FDRE \Rx_BtVal_0_reg[5] 
       (.C(Rx_RiuClk),
        .CE(\Rx_BtVal_3[8]_i_1_n_0 ),
        .D(Riu_RdData_0[6]),
        .Q(Rx_BtVal_0[5]),
        .R(IntCtrl_Reset));
  FDRE \Rx_BtVal_0_reg[6] 
       (.C(Rx_RiuClk),
        .CE(\Rx_BtVal_3[8]_i_1_n_0 ),
        .D(Riu_RdData_0[7]),
        .Q(Rx_BtVal_0[6]),
        .R(IntCtrl_Reset));
  FDRE \Rx_BtVal_0_reg[7] 
       (.C(Rx_RiuClk),
        .CE(\Rx_BtVal_3[8]_i_1_n_0 ),
        .D(Riu_RdData_0[8]),
        .Q(Rx_BtVal_0[7]),
        .R(IntCtrl_Reset));
  FDRE \Rx_BtVal_0_reg[8] 
       (.C(Rx_RiuClk),
        .CE(\Rx_BtVal_3[8]_i_1_n_0 ),
        .D(Riu_RdData_0[9]),
        .Q(Rx_BtVal_0[8]),
        .R(IntCtrl_Reset));
  FDRE \Rx_BtVal_1_reg[0] 
       (.C(Rx_RiuClk),
        .CE(\Rx_BtVal_3[8]_i_1_n_0 ),
        .D(Riu_RdData_1[1]),
        .Q(Rx_BtVal_1[0]),
        .R(IntCtrl_Reset));
  FDRE \Rx_BtVal_1_reg[1] 
       (.C(Rx_RiuClk),
        .CE(\Rx_BtVal_3[8]_i_1_n_0 ),
        .D(Riu_RdData_1[2]),
        .Q(Rx_BtVal_1[1]),
        .R(IntCtrl_Reset));
  FDRE \Rx_BtVal_1_reg[2] 
       (.C(Rx_RiuClk),
        .CE(\Rx_BtVal_3[8]_i_1_n_0 ),
        .D(Riu_RdData_1[3]),
        .Q(Rx_BtVal_1[2]),
        .R(IntCtrl_Reset));
  FDRE \Rx_BtVal_1_reg[3] 
       (.C(Rx_RiuClk),
        .CE(\Rx_BtVal_3[8]_i_1_n_0 ),
        .D(Riu_RdData_1[4]),
        .Q(Rx_BtVal_1[3]),
        .R(IntCtrl_Reset));
  FDRE \Rx_BtVal_1_reg[4] 
       (.C(Rx_RiuClk),
        .CE(\Rx_BtVal_3[8]_i_1_n_0 ),
        .D(Riu_RdData_1[5]),
        .Q(Rx_BtVal_1[4]),
        .R(IntCtrl_Reset));
  FDRE \Rx_BtVal_1_reg[5] 
       (.C(Rx_RiuClk),
        .CE(\Rx_BtVal_3[8]_i_1_n_0 ),
        .D(Riu_RdData_1[6]),
        .Q(Rx_BtVal_1[5]),
        .R(IntCtrl_Reset));
  FDRE \Rx_BtVal_1_reg[6] 
       (.C(Rx_RiuClk),
        .CE(\Rx_BtVal_3[8]_i_1_n_0 ),
        .D(Riu_RdData_1[7]),
        .Q(Rx_BtVal_1[6]),
        .R(IntCtrl_Reset));
  FDRE \Rx_BtVal_1_reg[7] 
       (.C(Rx_RiuClk),
        .CE(\Rx_BtVal_3[8]_i_1_n_0 ),
        .D(Riu_RdData_1[8]),
        .Q(Rx_BtVal_1[7]),
        .R(IntCtrl_Reset));
  FDRE \Rx_BtVal_1_reg[8] 
       (.C(Rx_RiuClk),
        .CE(\Rx_BtVal_3[8]_i_1_n_0 ),
        .D(Riu_RdData_1[9]),
        .Q(Rx_BtVal_1[8]),
        .R(IntCtrl_Reset));
  FDRE \Rx_BtVal_2_reg[0] 
       (.C(Rx_RiuClk),
        .CE(\Rx_BtVal_3[8]_i_1_n_0 ),
        .D(Riu_RdData_2[1]),
        .Q(Rx_BtVal_2[0]),
        .R(IntCtrl_Reset));
  FDRE \Rx_BtVal_2_reg[1] 
       (.C(Rx_RiuClk),
        .CE(\Rx_BtVal_3[8]_i_1_n_0 ),
        .D(Riu_RdData_2[2]),
        .Q(Rx_BtVal_2[1]),
        .R(IntCtrl_Reset));
  FDRE \Rx_BtVal_2_reg[2] 
       (.C(Rx_RiuClk),
        .CE(\Rx_BtVal_3[8]_i_1_n_0 ),
        .D(Riu_RdData_2[3]),
        .Q(Rx_BtVal_2[2]),
        .R(IntCtrl_Reset));
  FDRE \Rx_BtVal_2_reg[3] 
       (.C(Rx_RiuClk),
        .CE(\Rx_BtVal_3[8]_i_1_n_0 ),
        .D(Riu_RdData_2[4]),
        .Q(Rx_BtVal_2[3]),
        .R(IntCtrl_Reset));
  FDRE \Rx_BtVal_2_reg[4] 
       (.C(Rx_RiuClk),
        .CE(\Rx_BtVal_3[8]_i_1_n_0 ),
        .D(Riu_RdData_2[5]),
        .Q(Rx_BtVal_2[4]),
        .R(IntCtrl_Reset));
  FDRE \Rx_BtVal_2_reg[5] 
       (.C(Rx_RiuClk),
        .CE(\Rx_BtVal_3[8]_i_1_n_0 ),
        .D(Riu_RdData_2[6]),
        .Q(Rx_BtVal_2[5]),
        .R(IntCtrl_Reset));
  FDRE \Rx_BtVal_2_reg[6] 
       (.C(Rx_RiuClk),
        .CE(\Rx_BtVal_3[8]_i_1_n_0 ),
        .D(Riu_RdData_2[7]),
        .Q(Rx_BtVal_2[6]),
        .R(IntCtrl_Reset));
  FDRE \Rx_BtVal_2_reg[7] 
       (.C(Rx_RiuClk),
        .CE(\Rx_BtVal_3[8]_i_1_n_0 ),
        .D(Riu_RdData_2[8]),
        .Q(Rx_BtVal_2[7]),
        .R(IntCtrl_Reset));
  FDRE \Rx_BtVal_2_reg[8] 
       (.C(Rx_RiuClk),
        .CE(\Rx_BtVal_3[8]_i_1_n_0 ),
        .D(Riu_RdData_2[9]),
        .Q(Rx_BtVal_2[8]),
        .R(IntCtrl_Reset));
  LUT6 #(
    .INIT(64'h0000000000008000)) 
    \Rx_BtVal_3[8]_i_1 
       (.I0(\Rx_BtVal_3[8]_i_2_n_0 ),
        .I1(\Rx_BtVal_3[8]_i_3_n_0 ),
        .I2(Debug_Out[3]),
        .I3(Debug_Out[7]),
        .I4(Debug_Out[2]),
        .I5(\Rx_BtVal_3[8]_i_4_n_0 ),
        .O(\Rx_BtVal_3[8]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \Rx_BtVal_3[8]_i_10 
       (.I0(Riu_RdData_1[10]),
        .I1(Riu_RdData_1[11]),
        .I2(Riu_RdData_1[7]),
        .I3(Riu_RdData_1[2]),
        .O(\Rx_BtVal_3[8]_i_10_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \Rx_BtVal_3[8]_i_11 
       (.I0(Riu_RdData_1[12]),
        .I1(Riu_RdData_1[0]),
        .I2(Riu_RdData_1[13]),
        .I3(Riu_RdData_1[6]),
        .O(\Rx_BtVal_3[8]_i_11_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \Rx_BtVal_3[8]_i_12 
       (.I0(Riu_RdData_2[10]),
        .I1(Riu_RdData_2[3]),
        .I2(Riu_RdData_2[8]),
        .I3(Riu_RdData_2[1]),
        .O(\Rx_BtVal_3[8]_i_12_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \Rx_BtVal_3[8]_i_13 
       (.I0(Riu_RdData_2[14]),
        .I1(Riu_RdData_2[5]),
        .I2(Riu_RdData_2[15]),
        .I3(Riu_RdData_2[2]),
        .O(\Rx_BtVal_3[8]_i_13_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000004)) 
    \Rx_BtVal_3[8]_i_14 
       (.I0(Riu_RdData_2[11]),
        .I1(Riu_Prsnt_2),
        .I2(Riu_RdData_2[0]),
        .I3(Riu_RdData_2[13]),
        .I4(Riu_RdData_2[7]),
        .I5(Riu_RdData_2[9]),
        .O(\Rx_BtVal_3[8]_i_14_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \Rx_BtVal_3[8]_i_15 
       (.I0(Riu_RdData_0[2]),
        .I1(Riu_RdData_0[1]),
        .I2(Riu_RdData_0[5]),
        .I3(Riu_RdData_0[14]),
        .I4(Riu_RdData_0[6]),
        .I5(Riu_RdData_0[7]),
        .O(\Rx_BtVal_3[8]_i_15_n_0 ));
  LUT4 #(
    .INIT(16'hFFFD)) 
    \Rx_BtVal_3[8]_i_16 
       (.I0(Riu_Prsnt_0),
        .I1(Riu_RdData_0[9]),
        .I2(Riu_RdData_0[15]),
        .I3(Riu_RdData_0[10]),
        .O(\Rx_BtVal_3[8]_i_16_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \Rx_BtVal_3[8]_i_17 
       (.I0(Riu_RdData_0[13]),
        .I1(Riu_RdData_0[0]),
        .I2(Riu_RdData_0[12]),
        .I3(Riu_RdData_0[8]),
        .O(\Rx_BtVal_3[8]_i_17_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \Rx_BtVal_3[8]_i_18 
       (.I0(Riu_RdData_3[7]),
        .I1(Riu_RdData_3[2]),
        .I2(Riu_RdData_3[1]),
        .I3(Riu_RdData_3[5]),
        .I4(Riu_RdData_3[6]),
        .I5(Riu_RdData_3[14]),
        .O(\Rx_BtVal_3[8]_i_18_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \Rx_BtVal_3[8]_i_19 
       (.I0(Riu_RdData_3[15]),
        .I1(Riu_RdData_3[0]),
        .I2(Riu_RdData_3[10]),
        .I3(Riu_RdData_3[9]),
        .O(\Rx_BtVal_3[8]_i_19_n_0 ));
  LUT4 #(
    .INIT(16'h0004)) 
    \Rx_BtVal_3[8]_i_2 
       (.I0(\Rx_BtVal_3[8]_i_5_n_0 ),
        .I1(\Rx_BtVal_3[8]_i_6_n_0 ),
        .I2(\Rx_BtVal_3[8]_i_7_n_0 ),
        .I3(\Rx_BtVal_3[8]_i_8_n_0 ),
        .O(\Rx_BtVal_3[8]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hFFEF)) 
    \Rx_BtVal_3[8]_i_20 
       (.I0(Riu_RdData_3[8]),
        .I1(Riu_RdData_3[4]),
        .I2(Riu_Prsnt_3),
        .I3(Riu_RdData_3[12]),
        .O(\Rx_BtVal_3[8]_i_20_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \Rx_BtVal_3[8]_i_3 
       (.I0(Debug_Out[6]),
        .I1(\IntCtrl_State_reg_n_0_[8] ),
        .O(\Rx_BtVal_3[8]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    \Rx_BtVal_3[8]_i_4 
       (.I0(Debug_Out[0]),
        .I1(Debug_Out[1]),
        .I2(Debug_Out[4]),
        .I3(Debug_Out[5]),
        .O(\Rx_BtVal_3[8]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    \Rx_BtVal_3[8]_i_5 
       (.I0(\Rx_BtVal_3[8]_i_9_n_0 ),
        .I1(\Rx_BtVal_3[8]_i_10_n_0 ),
        .I2(\Rx_BtVal_3[8]_i_11_n_0 ),
        .I3(Riu_RdData_1[3]),
        .I4(Riu_RdData_1[8]),
        .I5(Riu_RdData_1[4]),
        .O(\Rx_BtVal_3[8]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFEFFFFFFFF)) 
    \Rx_BtVal_3[8]_i_6 
       (.I0(\Rx_BtVal_3[8]_i_12_n_0 ),
        .I1(\Rx_BtVal_3[8]_i_13_n_0 ),
        .I2(Riu_RdData_2[6]),
        .I3(Riu_RdData_2[12]),
        .I4(Riu_RdData_2[4]),
        .I5(\Rx_BtVal_3[8]_i_14_n_0 ),
        .O(\Rx_BtVal_3[8]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    \Rx_BtVal_3[8]_i_7 
       (.I0(\Rx_BtVal_3[8]_i_15_n_0 ),
        .I1(\Rx_BtVal_3[8]_i_16_n_0 ),
        .I2(\Rx_BtVal_3[8]_i_17_n_0 ),
        .I3(Riu_RdData_0[11]),
        .I4(Riu_RdData_0[4]),
        .I5(Riu_RdData_0[3]),
        .O(\Rx_BtVal_3[8]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    \Rx_BtVal_3[8]_i_8 
       (.I0(\Rx_BtVal_3[8]_i_18_n_0 ),
        .I1(\Rx_BtVal_3[8]_i_19_n_0 ),
        .I2(\Rx_BtVal_3[8]_i_20_n_0 ),
        .I3(Riu_RdData_3[3]),
        .I4(Riu_RdData_3[13]),
        .I5(Riu_RdData_3[11]),
        .O(\Rx_BtVal_3[8]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h0000000100000000)) 
    \Rx_BtVal_3[8]_i_9 
       (.I0(Riu_RdData_1[14]),
        .I1(Riu_RdData_1[5]),
        .I2(Riu_RdData_1[1]),
        .I3(Riu_RdData_1[15]),
        .I4(Riu_RdData_1[9]),
        .I5(Riu_Prsnt_1),
        .O(\Rx_BtVal_3[8]_i_9_n_0 ));
  FDRE \Rx_BtVal_3_reg[0] 
       (.C(Rx_RiuClk),
        .CE(\Rx_BtVal_3[8]_i_1_n_0 ),
        .D(Riu_RdData_3[1]),
        .Q(Rx_BtVal_3[0]),
        .R(IntCtrl_Reset));
  FDRE \Rx_BtVal_3_reg[1] 
       (.C(Rx_RiuClk),
        .CE(\Rx_BtVal_3[8]_i_1_n_0 ),
        .D(Riu_RdData_3[2]),
        .Q(Rx_BtVal_3[1]),
        .R(IntCtrl_Reset));
  FDRE \Rx_BtVal_3_reg[2] 
       (.C(Rx_RiuClk),
        .CE(\Rx_BtVal_3[8]_i_1_n_0 ),
        .D(Riu_RdData_3[3]),
        .Q(Rx_BtVal_3[2]),
        .R(IntCtrl_Reset));
  FDRE \Rx_BtVal_3_reg[3] 
       (.C(Rx_RiuClk),
        .CE(\Rx_BtVal_3[8]_i_1_n_0 ),
        .D(Riu_RdData_3[4]),
        .Q(Rx_BtVal_3[3]),
        .R(IntCtrl_Reset));
  FDRE \Rx_BtVal_3_reg[4] 
       (.C(Rx_RiuClk),
        .CE(\Rx_BtVal_3[8]_i_1_n_0 ),
        .D(Riu_RdData_3[5]),
        .Q(Rx_BtVal_3[4]),
        .R(IntCtrl_Reset));
  FDRE \Rx_BtVal_3_reg[5] 
       (.C(Rx_RiuClk),
        .CE(\Rx_BtVal_3[8]_i_1_n_0 ),
        .D(Riu_RdData_3[6]),
        .Q(Rx_BtVal_3[5]),
        .R(IntCtrl_Reset));
  FDRE \Rx_BtVal_3_reg[6] 
       (.C(Rx_RiuClk),
        .CE(\Rx_BtVal_3[8]_i_1_n_0 ),
        .D(Riu_RdData_3[7]),
        .Q(Rx_BtVal_3[6]),
        .R(IntCtrl_Reset));
  FDRE \Rx_BtVal_3_reg[7] 
       (.C(Rx_RiuClk),
        .CE(\Rx_BtVal_3[8]_i_1_n_0 ),
        .D(Riu_RdData_3[8]),
        .Q(Rx_BtVal_3[7]),
        .R(IntCtrl_Reset));
  FDRE \Rx_BtVal_3_reg[8] 
       (.C(Rx_RiuClk),
        .CE(\Rx_BtVal_3[8]_i_1_n_0 ),
        .D(Riu_RdData_3[9]),
        .Q(Rx_BtVal_3[8]),
        .R(IntCtrl_Reset));
  LUT5 #(
    .INIT(32'hFF7F0002)) 
    Tx_Bs_RstDly_i_1
       (.I0(Tx_Bs_RstDly_i_2_n_0),
        .I1(Debug_Out[5]),
        .I2(Debug_Out[3]),
        .I3(Debug_Out[2]),
        .I4(Rx_Bs_RstDly),
        .O(Tx_Bs_RstDly_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000000000100)) 
    Tx_Bs_RstDly_i_2
       (.I0(Debug_Out[7]),
        .I1(\IntCtrl_State_reg_n_0_[8] ),
        .I2(Debug_Out[0]),
        .I3(Debug_Out[4]),
        .I4(Debug_Out[1]),
        .I5(Debug_Out[6]),
        .O(Tx_Bs_RstDly_i_2_n_0));
  FDSE Tx_Bs_RstDly_reg
       (.C(Rx_RiuClk),
        .CE(1'b1),
        .D(Tx_Bs_RstDly_i_1_n_0),
        .Q(Rx_Bs_RstDly),
        .S(IntCtrl_Reset));
  LUT5 #(
    .INIT(32'h7FFF0002)) 
    Tx_Bs_Rst_i_1
       (.I0(Tx_Bs_RstDly_i_2_n_0),
        .I1(Debug_Out[2]),
        .I2(Debug_Out[3]),
        .I3(Debug_Out[5]),
        .I4(Tx_Bs_Rst),
        .O(Tx_Bs_Rst_i_1_n_0));
  FDSE Tx_Bs_Rst_reg
       (.C(Rx_RiuClk),
        .CE(1'b1),
        .D(Tx_Bs_Rst_i_1_n_0),
        .Q(Tx_Bs_Rst),
        .S(IntCtrl_Reset));
  LUT5 #(
    .INIT(32'hFFFF0008)) 
    Tx_Bsc_EnVtc_i_1
       (.I0(IntCtrl_RxDlyRdy[1]),
        .I1(IntCtrl_TxDlyRdy[1]),
        .I2(Debug_Out[4]),
        .I3(Tx_Bsc_EnVtc_i_2_n_0),
        .I4(Tx_Bsc_EnVtc),
        .O(Tx_Bsc_EnVtc_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFDFFFFFFFFFFFF)) 
    Tx_Bsc_EnVtc_i_2
       (.I0(Tx_Bsc_EnVtc_i_3_n_0),
        .I1(Debug_Out[0]),
        .I2(\IntCtrl_State_reg_n_0_[8] ),
        .I3(Tx_Bsc_EnVtc_i_4_n_0),
        .I4(Debug_Out[5]),
        .I5(Debug_Out[3]),
        .O(Tx_Bsc_EnVtc_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h2)) 
    Tx_Bsc_EnVtc_i_3
       (.I0(Debug_Out[7]),
        .I1(Debug_Out[6]),
        .O(Tx_Bsc_EnVtc_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'hB)) 
    Tx_Bsc_EnVtc_i_4
       (.I0(Debug_Out[1]),
        .I1(Debug_Out[2]),
        .O(Tx_Bsc_EnVtc_i_4_n_0));
  FDRE Tx_Bsc_EnVtc_reg
       (.C(Rx_RiuClk),
        .CE(1'b1),
        .D(Tx_Bsc_EnVtc_i_1_n_0),
        .Q(Tx_Bsc_EnVtc),
        .R(IntCtrl_Reset));
  LUT6 #(
    .INIT(64'hFFF7FFFF00040000)) 
    Tx_Bsc_Rst_i_1
       (.I0(Debug_Out[6]),
        .I1(Tx_Bsc_Rst_i_2_n_0),
        .I2(Debug_Out[5]),
        .I3(Debug_Out[0]),
        .I4(Tx_Bsc_Rst_i_3_n_0),
        .I5(Rx_Bsc_Rst),
        .O(Tx_Bsc_Rst_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h00000110)) 
    Tx_Bsc_Rst_i_2
       (.I0(Debug_Out[3]),
        .I1(Debug_Out[2]),
        .I2(Debug_Out[6]),
        .I3(Debug_Out[4]),
        .I4(Debug_Out[1]),
        .O(Tx_Bsc_Rst_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h1)) 
    Tx_Bsc_Rst_i_3
       (.I0(\IntCtrl_State_reg_n_0_[8] ),
        .I1(Debug_Out[7]),
        .O(Tx_Bsc_Rst_i_3_n_0));
  FDSE Tx_Bsc_Rst_reg
       (.C(Rx_RiuClk),
        .CE(1'b1),
        .D(Tx_Bsc_Rst_i_1_n_0),
        .Q(Rx_Bsc_Rst),
        .S(IntCtrl_Reset));
  VCC VCC
       (.P(\<const1> ));
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* XILINX_LEGACY_PRIM = "IBUFGDS" *) 
  (* box_type = "PRIMITIVE" *) 
  IBUFDS #(
    .DIFF_TERM("FALSE"),
    .IOSTANDARD("DEFAULT")) 
    iclkbuf
       (.I(ClockIn_p),
        .IB(ClockIn_n),
        .O(ClockIn_se_out));
  design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_reset_sync_26 reset_sync_ctrl_rst
       (.ResetIn(ResetIn),
        .refclk625_n(Rx_RiuClk),
        .reset_out(IntCtrl_Reset));
  design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_reset_sync_27 reset_sync_rx_cdc_rst
       (.Rx_LogicRst(Rx_LogicRst),
        .Rx_SysClk(Rx_SysClk),
        .reset_in(IntCtrl_RxLogicRst_reg_n_0));
  design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_reset_sync_28 reset_sync_tx_cdc_rst
       (.Tx_LogicRst(Tx_LogicRst),
        .Tx_WrClk(Tx_WrClk),
        .reset_in(IntCtrl_TxLogicRst_reg_n_0));
endmodule

(* C_BtslcNulType = "SERIAL" *) (* C_BusRxBitCtrlIn = "40" *) (* C_BusRxBitCtrlOut = "40" *) 
(* C_BusTxBitCtrlIn = "40" *) (* C_BusTxBitCtrlInTri = "40" *) (* C_BusTxBitCtrlOut = "40" *) 
(* C_BusTxBitCtrlOutTri = "40" *) (* C_BytePosition = "0" *) (* C_Cascade = "FALSE" *) 
(* C_CntValue = "9" *) (* C_Ctrl_Clk = "EXTERNAL" *) (* C_Delay_Format = "COUNT" *) 
(* C_Delay_Type = "VAR_LOAD" *) (* C_Delay_Value = "0" *) (* C_Delay_Value_Ext = "0" *) 
(* C_Div_Mode = "DIV2" *) (* C_En_Clk_To_Ext_North = "DISABLE" *) (* C_En_Clk_To_Ext_South = "DISABLE" *) 
(* C_En_Dyn_Odly_Mode = "FALSE" *) (* C_En_Other_Nclk = "FALSE" *) (* C_En_Other_Pclk = "FALSE" *) 
(* C_Fifo_Sync_Mode = "FALSE" *) (* C_Idly_Vt_Track = "TRUE" *) (* C_Inv_Rxclk = "FALSE" *) 
(* C_IoBank = "44" *) (* C_Is_Clk_Ext_Inverted = "1'b0" *) (* C_Is_Clk_Inverted = "1'b0" *) 
(* C_Is_Rst_Dly_Ext_Inverted = "1'b0" *) (* C_Is_Rst_Dly_Inverted = "1'b0" *) (* C_Is_Rst_Inverted = "1'b0" *) 
(* C_NibbleType = "7" *) (* C_Odly_Vt_Track = "TRUE" *) (* C_Part = "XCKU060" *) 
(* C_Qdly_Vt_Track = "TRUE" *) (* C_Read_Idle_Count = "6'b000000" *) (* C_RefClk_Frequency = "312.500000" *) 
(* C_RefClk_Src = "PLLCLK" *) (* C_Rounding_Factor = "16" *) (* C_RxGate_Extend = "FALSE" *) 
(* C_Rx_Clk_Phase_n = "SHIFT_90" *) (* C_Rx_Clk_Phase_p = "SHIFT_90" *) (* C_Rx_Data_Width = "4" *) 
(* C_Rx_Gating = "DISABLE" *) (* C_Self_Calibrate = "ENABLE" *) (* C_Serial_Mode = "TRUE" *) 
(* C_Tx_Gating = "DISABLE" *) (* C_Update_Mode = "ASYNC" *) (* C_Update_Mode_Ext = "ASYNC" *) 
(* C_UsedBitslices = "7'b0000011" *) (* ORIG_REF_NAME = "design_1_gig_ethernet_pcs_pma_0_0_Rx_Nibble" *) 
module design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_Rx_Nibble
   (Rx_Bsc_Rst,
    Rx_Bs_Rst,
    Rx_Rst_Dly,
    Rx_Bsc_En_Vtc,
    Rx_Bs_En_Vtc,
    Rx_Riu_Clk,
    Rx_Riu_Addr,
    Rx_Riu_Wr_Data,
    Rx_Riu_Rd_Data,
    Rx_Riu_Valid,
    Rx_Riu_Prsnt,
    Rx_Riu_Wr_En,
    Rx_Riu_Nibble_Sel,
    Rx_Pll_Clk,
    Rx_RefClk,
    Rx_Dly_Rdy,
    Rx_Vtc_Rdy,
    Rx_Dyn_Dci,
    Rx_Tbyte_In,
    Rx_Phy_Rden,
    Rx_Clk_From_Ext,
    Rx_Pclk_Nibble_In,
    Rx_Nclk_Nibble_In,
    Rx_Nclk_Nibble_Out,
    Rx_Pclk_Nibble_Out,
    Rx_Clk_To_Ext_North,
    Rx_Clk_To_Ext_South,
    Rx_Data_In,
    Rx_Q_Out,
    Rx_Q_CombOut,
    Fifo_Rd_Clk,
    Fifo_Wrclk_Out,
    Fifo_Rd_En,
    Fifo_Empty,
    Rx_Ce,
    Rx_Clk,
    Rx_Inc,
    Rx_Load,
    Rx_CntValueIn,
    Rx_CntValueOut,
    Rx_Ce_Ext,
    Rx_Inc_Ext,
    Rx_Load_Ext,
    Rx_CntValueIn_Ext,
    Rx_CntValueOut_Ext);
  input Rx_Bsc_Rst;
  input Rx_Bs_Rst;
  input Rx_Rst_Dly;
  input Rx_Bsc_En_Vtc;
  input Rx_Bs_En_Vtc;
  input Rx_Riu_Clk;
  input [5:0]Rx_Riu_Addr;
  input [15:0]Rx_Riu_Wr_Data;
  output [15:0]Rx_Riu_Rd_Data;
  output Rx_Riu_Valid;
  output Rx_Riu_Prsnt;
  input Rx_Riu_Wr_En;
  input Rx_Riu_Nibble_Sel;
  input Rx_Pll_Clk;
  input Rx_RefClk;
  output Rx_Dly_Rdy;
  output Rx_Vtc_Rdy;
  output [6:0]Rx_Dyn_Dci;
  input [3:0]Rx_Tbyte_In;
  input [3:0]Rx_Phy_Rden;
  input Rx_Clk_From_Ext;
  input Rx_Pclk_Nibble_In;
  input Rx_Nclk_Nibble_In;
  output Rx_Nclk_Nibble_Out;
  output Rx_Pclk_Nibble_Out;
  output Rx_Clk_To_Ext_North;
  output Rx_Clk_To_Ext_South;
  input [6:0]Rx_Data_In;
  (* dont_touch = "true" *) output [27:0]Rx_Q_Out;
  (* dont_touch = "true" *) output [6:0]Rx_Q_CombOut;
  input [6:0]Fifo_Rd_Clk;
  output Fifo_Wrclk_Out;
  input [6:0]Fifo_Rd_En;
  output [6:0]Fifo_Empty;
  input [6:0]Rx_Ce;
  input Rx_Clk;
  input [6:0]Rx_Inc;
  input [6:0]Rx_Load;
  input [62:0]Rx_CntValueIn;
  output [62:0]Rx_CntValueOut;
  input [6:0]Rx_Ce_Ext;
  input [6:0]Rx_Inc_Ext;
  input [6:0]Rx_Load_Ext;
  input [62:0]Rx_CntValueIn_Ext;
  output [62:0]Rx_CntValueOut_Ext;

  wire \<const0> ;
  wire \<const1> ;
  wire [1:0]\^Fifo_Empty ;
  wire [6:0]Fifo_Rd_Clk;
  wire [6:0]Fifo_Rd_En;
  wire Fifo_Wrclk_Out;
  wire [39:0]IntBtslcCtrl_RxBitCtrlOut_0;
  wire [39:0]IntBtslcCtrl_RxBitCtrlOut_40;
  wire [39:0]IntBtslcCtrl_TxBitCtrlOut_0;
  wire [39:0]IntBtslcCtrl_TxBitCtrlOut_40;
  wire [39:0]RX_BIT_CTRL_IN0;
  wire [39:0]RX_BIT_CTRL_IN1;
  wire Rx_Bs_En_Vtc;
  wire Rx_Bs_Rst;
  wire Rx_Bsc_En_Vtc;
  wire Rx_Bsc_Rst;
  wire [6:0]Rx_Ce;
  wire [6:0]Rx_Ce_Ext;
  wire Rx_Clk;
  wire Rx_Clk_From_Ext;
  wire Rx_Clk_To_Ext_North;
  wire Rx_Clk_To_Ext_South;
  wire [62:0]Rx_CntValueIn;
  wire [62:0]Rx_CntValueIn_Ext;
  wire [17:0]\^Rx_CntValueOut ;
  wire [17:0]\^Rx_CntValueOut_Ext ;
  wire [6:0]Rx_Data_In;
  wire Rx_Dly_Rdy;
  wire [6:0]Rx_Dyn_Dci;
  wire [6:0]Rx_Inc;
  wire [6:0]Rx_Inc_Ext;
  wire [6:0]Rx_Load;
  wire [6:0]Rx_Load_Ext;
  wire Rx_Nclk_Nibble_In;
  wire Rx_Nclk_Nibble_Out;
  wire Rx_Pclk_Nibble_In;
  wire Rx_Pclk_Nibble_Out;
  wire [3:0]Rx_Phy_Rden;
  wire Rx_Pll_Clk;
  (* DONT_TOUCH *) wire [6:0]Rx_Q_CombOut;
  (* DONT_TOUCH *) wire [27:0]Rx_Q_Out;
  wire Rx_RefClk;
  wire [5:0]Rx_Riu_Addr;
  wire Rx_Riu_Clk;
  wire Rx_Riu_Nibble_Sel;
  wire [15:0]Rx_Riu_Rd_Data;
  wire Rx_Riu_Valid;
  wire [15:0]Rx_Riu_Wr_Data;
  wire Rx_Riu_Wr_En;
  wire Rx_Rst_Dly;
  wire [3:0]Rx_Tbyte_In;
  wire Rx_Vtc_Rdy;
  wire [39:0]TX_BIT_CTRL_IN0;
  wire [39:0]TX_BIT_CTRL_IN1;
  wire [39:0]\NLW_Gen_1.Nibble_I_BitsliceCntrl_RX_BIT_CTRL_OUT2_UNCONNECTED ;
  wire [39:0]\NLW_Gen_1.Nibble_I_BitsliceCntrl_RX_BIT_CTRL_OUT3_UNCONNECTED ;
  wire [39:0]\NLW_Gen_1.Nibble_I_BitsliceCntrl_RX_BIT_CTRL_OUT4_UNCONNECTED ;
  wire [39:0]\NLW_Gen_1.Nibble_I_BitsliceCntrl_RX_BIT_CTRL_OUT5_UNCONNECTED ;
  wire [39:0]\NLW_Gen_1.Nibble_I_BitsliceCntrl_RX_BIT_CTRL_OUT6_UNCONNECTED ;
  wire [39:0]\NLW_Gen_1.Nibble_I_BitsliceCntrl_TX_BIT_CTRL_OUT2_UNCONNECTED ;
  wire [39:0]\NLW_Gen_1.Nibble_I_BitsliceCntrl_TX_BIT_CTRL_OUT3_UNCONNECTED ;
  wire [39:0]\NLW_Gen_1.Nibble_I_BitsliceCntrl_TX_BIT_CTRL_OUT4_UNCONNECTED ;
  wire [39:0]\NLW_Gen_1.Nibble_I_BitsliceCntrl_TX_BIT_CTRL_OUT5_UNCONNECTED ;
  wire [39:0]\NLW_Gen_1.Nibble_I_BitsliceCntrl_TX_BIT_CTRL_OUT6_UNCONNECTED ;
  wire [39:0]\NLW_Gen_1.Nibble_I_BitsliceCntrl_TX_BIT_CTRL_OUT_TRI_UNCONNECTED ;
  wire [7:4]\NLW_Gen_5[1].Gen_5_1.Gen_5_1_1.Nibble_I_RxBitslice_0_Q_UNCONNECTED ;
  wire \NLW_Gen_5[2].Gen_5_1.Gen_5_1_0.Nibble_I_RxBitslice_n_FIFO_WRCLK_OUT_UNCONNECTED ;
  wire [7:4]\NLW_Gen_5[2].Gen_5_1.Gen_5_1_0.Nibble_I_RxBitslice_n_Q_UNCONNECTED ;

  assign Fifo_Empty[6] = \<const0> ;
  assign Fifo_Empty[5] = \<const0> ;
  assign Fifo_Empty[4] = \<const0> ;
  assign Fifo_Empty[3] = \<const0> ;
  assign Fifo_Empty[2] = \<const0> ;
  assign Fifo_Empty[1:0] = \^Fifo_Empty [1:0];
  assign Rx_CntValueOut[62] = \<const0> ;
  assign Rx_CntValueOut[61] = \<const0> ;
  assign Rx_CntValueOut[60] = \<const0> ;
  assign Rx_CntValueOut[59] = \<const0> ;
  assign Rx_CntValueOut[58] = \<const0> ;
  assign Rx_CntValueOut[57] = \<const0> ;
  assign Rx_CntValueOut[56] = \<const0> ;
  assign Rx_CntValueOut[55] = \<const0> ;
  assign Rx_CntValueOut[54] = \<const0> ;
  assign Rx_CntValueOut[53] = \<const0> ;
  assign Rx_CntValueOut[52] = \<const0> ;
  assign Rx_CntValueOut[51] = \<const0> ;
  assign Rx_CntValueOut[50] = \<const0> ;
  assign Rx_CntValueOut[49] = \<const0> ;
  assign Rx_CntValueOut[48] = \<const0> ;
  assign Rx_CntValueOut[47] = \<const0> ;
  assign Rx_CntValueOut[46] = \<const0> ;
  assign Rx_CntValueOut[45] = \<const0> ;
  assign Rx_CntValueOut[44] = \<const0> ;
  assign Rx_CntValueOut[43] = \<const0> ;
  assign Rx_CntValueOut[42] = \<const0> ;
  assign Rx_CntValueOut[41] = \<const0> ;
  assign Rx_CntValueOut[40] = \<const0> ;
  assign Rx_CntValueOut[39] = \<const0> ;
  assign Rx_CntValueOut[38] = \<const0> ;
  assign Rx_CntValueOut[37] = \<const0> ;
  assign Rx_CntValueOut[36] = \<const0> ;
  assign Rx_CntValueOut[35] = \<const0> ;
  assign Rx_CntValueOut[34] = \<const0> ;
  assign Rx_CntValueOut[33] = \<const0> ;
  assign Rx_CntValueOut[32] = \<const0> ;
  assign Rx_CntValueOut[31] = \<const0> ;
  assign Rx_CntValueOut[30] = \<const0> ;
  assign Rx_CntValueOut[29] = \<const0> ;
  assign Rx_CntValueOut[28] = \<const0> ;
  assign Rx_CntValueOut[27] = \<const0> ;
  assign Rx_CntValueOut[26] = \<const0> ;
  assign Rx_CntValueOut[25] = \<const0> ;
  assign Rx_CntValueOut[24] = \<const0> ;
  assign Rx_CntValueOut[23] = \<const0> ;
  assign Rx_CntValueOut[22] = \<const0> ;
  assign Rx_CntValueOut[21] = \<const0> ;
  assign Rx_CntValueOut[20] = \<const0> ;
  assign Rx_CntValueOut[19] = \<const0> ;
  assign Rx_CntValueOut[18] = \<const0> ;
  assign Rx_CntValueOut[17:0] = \^Rx_CntValueOut [17:0];
  assign Rx_CntValueOut_Ext[62] = \<const0> ;
  assign Rx_CntValueOut_Ext[61] = \<const0> ;
  assign Rx_CntValueOut_Ext[60] = \<const0> ;
  assign Rx_CntValueOut_Ext[59] = \<const0> ;
  assign Rx_CntValueOut_Ext[58] = \<const0> ;
  assign Rx_CntValueOut_Ext[57] = \<const0> ;
  assign Rx_CntValueOut_Ext[56] = \<const0> ;
  assign Rx_CntValueOut_Ext[55] = \<const0> ;
  assign Rx_CntValueOut_Ext[54] = \<const0> ;
  assign Rx_CntValueOut_Ext[53] = \<const0> ;
  assign Rx_CntValueOut_Ext[52] = \<const0> ;
  assign Rx_CntValueOut_Ext[51] = \<const0> ;
  assign Rx_CntValueOut_Ext[50] = \<const0> ;
  assign Rx_CntValueOut_Ext[49] = \<const0> ;
  assign Rx_CntValueOut_Ext[48] = \<const0> ;
  assign Rx_CntValueOut_Ext[47] = \<const0> ;
  assign Rx_CntValueOut_Ext[46] = \<const0> ;
  assign Rx_CntValueOut_Ext[45] = \<const0> ;
  assign Rx_CntValueOut_Ext[44] = \<const0> ;
  assign Rx_CntValueOut_Ext[43] = \<const0> ;
  assign Rx_CntValueOut_Ext[42] = \<const0> ;
  assign Rx_CntValueOut_Ext[41] = \<const0> ;
  assign Rx_CntValueOut_Ext[40] = \<const0> ;
  assign Rx_CntValueOut_Ext[39] = \<const0> ;
  assign Rx_CntValueOut_Ext[38] = \<const0> ;
  assign Rx_CntValueOut_Ext[37] = \<const0> ;
  assign Rx_CntValueOut_Ext[36] = \<const0> ;
  assign Rx_CntValueOut_Ext[35] = \<const0> ;
  assign Rx_CntValueOut_Ext[34] = \<const0> ;
  assign Rx_CntValueOut_Ext[33] = \<const0> ;
  assign Rx_CntValueOut_Ext[32] = \<const0> ;
  assign Rx_CntValueOut_Ext[31] = \<const0> ;
  assign Rx_CntValueOut_Ext[30] = \<const0> ;
  assign Rx_CntValueOut_Ext[29] = \<const0> ;
  assign Rx_CntValueOut_Ext[28] = \<const0> ;
  assign Rx_CntValueOut_Ext[27] = \<const0> ;
  assign Rx_CntValueOut_Ext[26] = \<const0> ;
  assign Rx_CntValueOut_Ext[25] = \<const0> ;
  assign Rx_CntValueOut_Ext[24] = \<const0> ;
  assign Rx_CntValueOut_Ext[23] = \<const0> ;
  assign Rx_CntValueOut_Ext[22] = \<const0> ;
  assign Rx_CntValueOut_Ext[21] = \<const0> ;
  assign Rx_CntValueOut_Ext[20] = \<const0> ;
  assign Rx_CntValueOut_Ext[19] = \<const0> ;
  assign Rx_CntValueOut_Ext[18] = \<const0> ;
  assign Rx_CntValueOut_Ext[17:0] = \^Rx_CntValueOut_Ext [17:0];
  assign Rx_Riu_Prsnt = \<const1> ;
  GND GND
       (.G(\<const0> ));
  (* box_type = "PRIMITIVE" *) 
  BITSLICE_CONTROL #(
    .CTRL_CLK("EXTERNAL"),
    .DIV_MODE("DIV2"),
    .EN_CLK_TO_EXT_NORTH("DISABLE"),
    .EN_CLK_TO_EXT_SOUTH("DISABLE"),
    .EN_DYN_ODLY_MODE("FALSE"),
    .EN_OTHER_NCLK("FALSE"),
    .EN_OTHER_PCLK("FALSE"),
    .IDLY_VT_TRACK("TRUE"),
    .INV_RXCLK("FALSE"),
    .ODLY_VT_TRACK("TRUE"),
    .QDLY_VT_TRACK("TRUE"),
    .READ_IDLE_COUNT(6'h00),
    .REFCLK_SRC("PLLCLK"),
    .ROUNDING_FACTOR(16),
    .RXGATE_EXTEND("FALSE"),
    .RX_CLK_PHASE_N("SHIFT_90"),
    .RX_CLK_PHASE_P("SHIFT_90"),
    .RX_GATING("DISABLE"),
    .SELF_CALIBRATE("ENABLE"),
    .SERIAL_MODE("TRUE"),
    .SIM_DEVICE("ULTRASCALE_PLUS_ES1"),
    .SIM_SPEEDUP("FAST"),
    .SIM_VERSION(2.000000),
    .TX_GATING("DISABLE")) 
    \Gen_1.Nibble_I_BitsliceCntrl 
       (.CLK_FROM_EXT(Rx_Clk_From_Ext),
        .CLK_TO_EXT_NORTH(Rx_Clk_To_Ext_North),
        .CLK_TO_EXT_SOUTH(Rx_Clk_To_Ext_South),
        .DLY_RDY(Rx_Dly_Rdy),
        .DYN_DCI(Rx_Dyn_Dci),
        .EN_VTC(Rx_Bsc_En_Vtc),
        .NCLK_NIBBLE_IN(Rx_Nclk_Nibble_In),
        .NCLK_NIBBLE_OUT(Rx_Nclk_Nibble_Out),
        .PCLK_NIBBLE_IN(Rx_Pclk_Nibble_In),
        .PCLK_NIBBLE_OUT(Rx_Pclk_Nibble_Out),
        .PHY_RDCS0({1'b0,1'b0,1'b0,1'b0}),
        .PHY_RDCS1({1'b0,1'b0,1'b0,1'b0}),
        .PHY_RDEN(Rx_Phy_Rden),
        .PHY_WRCS0({1'b0,1'b0,1'b0,1'b0}),
        .PHY_WRCS1({1'b0,1'b0,1'b0,1'b0}),
        .PLL_CLK(Rx_Pll_Clk),
        .REFCLK(Rx_RefClk),
        .RIU_ADDR(Rx_Riu_Addr),
        .RIU_CLK(Rx_Riu_Clk),
        .RIU_NIBBLE_SEL(Rx_Riu_Nibble_Sel),
        .RIU_RD_DATA(Rx_Riu_Rd_Data),
        .RIU_VALID(Rx_Riu_Valid),
        .RIU_WR_DATA(Rx_Riu_Wr_Data),
        .RIU_WR_EN(Rx_Riu_Wr_En),
        .RST(Rx_Bsc_Rst),
        .RX_BIT_CTRL_IN0(RX_BIT_CTRL_IN0),
        .RX_BIT_CTRL_IN1(RX_BIT_CTRL_IN1),
        .RX_BIT_CTRL_IN2({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .RX_BIT_CTRL_IN3({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .RX_BIT_CTRL_IN4({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .RX_BIT_CTRL_IN5({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .RX_BIT_CTRL_IN6({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .RX_BIT_CTRL_OUT0(IntBtslcCtrl_RxBitCtrlOut_0),
        .RX_BIT_CTRL_OUT1(IntBtslcCtrl_RxBitCtrlOut_40),
        .RX_BIT_CTRL_OUT2(\NLW_Gen_1.Nibble_I_BitsliceCntrl_RX_BIT_CTRL_OUT2_UNCONNECTED [39:0]),
        .RX_BIT_CTRL_OUT3(\NLW_Gen_1.Nibble_I_BitsliceCntrl_RX_BIT_CTRL_OUT3_UNCONNECTED [39:0]),
        .RX_BIT_CTRL_OUT4(\NLW_Gen_1.Nibble_I_BitsliceCntrl_RX_BIT_CTRL_OUT4_UNCONNECTED [39:0]),
        .RX_BIT_CTRL_OUT5(\NLW_Gen_1.Nibble_I_BitsliceCntrl_RX_BIT_CTRL_OUT5_UNCONNECTED [39:0]),
        .RX_BIT_CTRL_OUT6(\NLW_Gen_1.Nibble_I_BitsliceCntrl_RX_BIT_CTRL_OUT6_UNCONNECTED [39:0]),
        .TBYTE_IN(Rx_Tbyte_In),
        .TX_BIT_CTRL_IN0(TX_BIT_CTRL_IN0),
        .TX_BIT_CTRL_IN1(TX_BIT_CTRL_IN1),
        .TX_BIT_CTRL_IN2({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TX_BIT_CTRL_IN3({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TX_BIT_CTRL_IN4({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TX_BIT_CTRL_IN5({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TX_BIT_CTRL_IN6({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TX_BIT_CTRL_IN_TRI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TX_BIT_CTRL_OUT0(IntBtslcCtrl_TxBitCtrlOut_0),
        .TX_BIT_CTRL_OUT1(IntBtslcCtrl_TxBitCtrlOut_40),
        .TX_BIT_CTRL_OUT2(\NLW_Gen_1.Nibble_I_BitsliceCntrl_TX_BIT_CTRL_OUT2_UNCONNECTED [39:0]),
        .TX_BIT_CTRL_OUT3(\NLW_Gen_1.Nibble_I_BitsliceCntrl_TX_BIT_CTRL_OUT3_UNCONNECTED [39:0]),
        .TX_BIT_CTRL_OUT4(\NLW_Gen_1.Nibble_I_BitsliceCntrl_TX_BIT_CTRL_OUT4_UNCONNECTED [39:0]),
        .TX_BIT_CTRL_OUT5(\NLW_Gen_1.Nibble_I_BitsliceCntrl_TX_BIT_CTRL_OUT5_UNCONNECTED [39:0]),
        .TX_BIT_CTRL_OUT6(\NLW_Gen_1.Nibble_I_BitsliceCntrl_TX_BIT_CTRL_OUT6_UNCONNECTED [39:0]),
        .TX_BIT_CTRL_OUT_TRI(\NLW_Gen_1.Nibble_I_BitsliceCntrl_TX_BIT_CTRL_OUT_TRI_UNCONNECTED [39:0]),
        .VTC_RDY(Rx_Vtc_Rdy));
  (* DONT_TOUCH *) 
  (* box_type = "PRIMITIVE" *) 
  RX_BITSLICE #(
    .CASCADE("FALSE"),
    .DATA_TYPE("SERIAL"),
    .DATA_WIDTH(4),
    .DELAY_FORMAT("COUNT"),
    .DELAY_TYPE("VAR_LOAD"),
    .DELAY_VALUE(0),
    .DELAY_VALUE_EXT(0),
    .FIFO_SYNC_MODE("FALSE"),
    .IS_CLK_EXT_INVERTED(1'b0),
    .IS_CLK_INVERTED(1'b0),
    .IS_RST_DLY_EXT_INVERTED(1'b0),
    .IS_RST_DLY_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b0),
    .REFCLK_FREQUENCY(312.500000),
    .SIM_DEVICE("ULTRASCALE_PLUS_ES1"),
    .SIM_VERSION(2.000000),
    .UPDATE_MODE("ASYNC"),
    .UPDATE_MODE_EXT("ASYNC")) 
    \Gen_5[1].Gen_5_1.Gen_5_1_1.Nibble_I_RxBitslice_0 
       (.CE(Rx_Ce[0]),
        .CE_EXT(Rx_Ce_Ext[0]),
        .CLK(Rx_Clk),
        .CLK_EXT(Rx_Clk),
        .CNTVALUEIN(Rx_CntValueIn[8:0]),
        .CNTVALUEIN_EXT(Rx_CntValueIn_Ext[8:0]),
        .CNTVALUEOUT(\^Rx_CntValueOut [8:0]),
        .CNTVALUEOUT_EXT(\^Rx_CntValueOut_Ext [8:0]),
        .DATAIN(Rx_Data_In[0]),
        .EN_VTC(Rx_Bs_En_Vtc),
        .EN_VTC_EXT(Rx_Bs_En_Vtc),
        .FIFO_EMPTY(\^Fifo_Empty [0]),
        .FIFO_RD_CLK(Fifo_Rd_Clk[0]),
        .FIFO_RD_EN(Fifo_Rd_En[0]),
        .FIFO_WRCLK_OUT(Fifo_Wrclk_Out),
        .INC(Rx_Inc[0]),
        .INC_EXT(Rx_Inc_Ext[0]),
        .LOAD(Rx_Load[0]),
        .LOAD_EXT(Rx_Load_Ext[0]),
        .Q({\NLW_Gen_5[1].Gen_5_1.Gen_5_1_1.Nibble_I_RxBitslice_0_Q_UNCONNECTED [7:6],Rx_Q_CombOut[0],\NLW_Gen_5[1].Gen_5_1.Gen_5_1_1.Nibble_I_RxBitslice_0_Q_UNCONNECTED [4],Rx_Q_Out[3:0]}),
        .RST(Rx_Bs_Rst),
        .RST_DLY(Rx_Rst_Dly),
        .RST_DLY_EXT(Rx_Rst_Dly),
        .RX_BIT_CTRL_IN(IntBtslcCtrl_RxBitCtrlOut_0),
        .RX_BIT_CTRL_OUT(RX_BIT_CTRL_IN0),
        .TX_BIT_CTRL_IN(IntBtslcCtrl_TxBitCtrlOut_0),
        .TX_BIT_CTRL_OUT(TX_BIT_CTRL_IN0));
  (* box_type = "PRIMITIVE" *) 
  RX_BITSLICE #(
    .CASCADE("FALSE"),
    .DATA_TYPE("SERIAL"),
    .DATA_WIDTH(4),
    .DELAY_FORMAT("COUNT"),
    .DELAY_TYPE("VAR_LOAD"),
    .DELAY_VALUE(0),
    .DELAY_VALUE_EXT(0),
    .FIFO_SYNC_MODE("FALSE"),
    .IS_CLK_EXT_INVERTED(1'b0),
    .IS_CLK_INVERTED(1'b0),
    .IS_RST_DLY_EXT_INVERTED(1'b0),
    .IS_RST_DLY_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b0),
    .REFCLK_FREQUENCY(312.500000),
    .SIM_DEVICE("ULTRASCALE_PLUS_ES1"),
    .SIM_VERSION(2.000000),
    .UPDATE_MODE("ASYNC"),
    .UPDATE_MODE_EXT("ASYNC")) 
    \Gen_5[2].Gen_5_1.Gen_5_1_0.Nibble_I_RxBitslice_n 
       (.CE(Rx_Ce[1]),
        .CE_EXT(Rx_Ce_Ext[1]),
        .CLK(Rx_Clk),
        .CLK_EXT(Rx_Clk),
        .CNTVALUEIN(Rx_CntValueIn[17:9]),
        .CNTVALUEIN_EXT(Rx_CntValueIn_Ext[17:9]),
        .CNTVALUEOUT(\^Rx_CntValueOut [17:9]),
        .CNTVALUEOUT_EXT(\^Rx_CntValueOut_Ext [17:9]),
        .DATAIN(Rx_Data_In[1]),
        .EN_VTC(Rx_Bs_En_Vtc),
        .EN_VTC_EXT(Rx_Bs_En_Vtc),
        .FIFO_EMPTY(\^Fifo_Empty [1]),
        .FIFO_RD_CLK(Fifo_Rd_Clk[1]),
        .FIFO_RD_EN(Fifo_Rd_En[1]),
        .FIFO_WRCLK_OUT(\NLW_Gen_5[2].Gen_5_1.Gen_5_1_0.Nibble_I_RxBitslice_n_FIFO_WRCLK_OUT_UNCONNECTED ),
        .INC(Rx_Inc[1]),
        .INC_EXT(Rx_Inc_Ext[1]),
        .LOAD(Rx_Load[1]),
        .LOAD_EXT(Rx_Load_Ext[1]),
        .Q({\NLW_Gen_5[2].Gen_5_1.Gen_5_1_0.Nibble_I_RxBitslice_n_Q_UNCONNECTED [7:6],Rx_Q_CombOut[1],\NLW_Gen_5[2].Gen_5_1.Gen_5_1_0.Nibble_I_RxBitslice_n_Q_UNCONNECTED [4],Rx_Q_Out[7:4]}),
        .RST(Rx_Bs_Rst),
        .RST_DLY(Rx_Rst_Dly),
        .RST_DLY_EXT(Rx_Rst_Dly),
        .RX_BIT_CTRL_IN(IntBtslcCtrl_RxBitCtrlOut_40),
        .RX_BIT_CTRL_OUT(RX_BIT_CTRL_IN1),
        .TX_BIT_CTRL_IN(IntBtslcCtrl_TxBitCtrlOut_40),
        .TX_BIT_CTRL_OUT(TX_BIT_CTRL_IN1));
  VCC VCC
       (.P(\<const1> ));
  LUT1 #(
    .INIT(2'h2)) 
    i_0
       (.I0(1'b0),
        .O(Rx_Q_Out[27]));
  LUT1 #(
    .INIT(2'h2)) 
    i_1
       (.I0(1'b0),
        .O(Rx_Q_Out[26]));
  LUT1 #(
    .INIT(2'h2)) 
    i_10
       (.I0(1'b0),
        .O(Rx_Q_Out[17]));
  LUT1 #(
    .INIT(2'h2)) 
    i_11
       (.I0(1'b0),
        .O(Rx_Q_Out[16]));
  LUT1 #(
    .INIT(2'h2)) 
    i_12
       (.I0(1'b0),
        .O(Rx_Q_Out[15]));
  LUT1 #(
    .INIT(2'h2)) 
    i_13
       (.I0(1'b0),
        .O(Rx_Q_Out[14]));
  LUT1 #(
    .INIT(2'h2)) 
    i_14
       (.I0(1'b0),
        .O(Rx_Q_Out[13]));
  LUT1 #(
    .INIT(2'h2)) 
    i_15
       (.I0(1'b0),
        .O(Rx_Q_Out[12]));
  LUT1 #(
    .INIT(2'h2)) 
    i_16
       (.I0(1'b0),
        .O(Rx_Q_Out[11]));
  LUT1 #(
    .INIT(2'h2)) 
    i_17
       (.I0(1'b0),
        .O(Rx_Q_Out[10]));
  LUT1 #(
    .INIT(2'h2)) 
    i_18
       (.I0(1'b0),
        .O(Rx_Q_Out[9]));
  LUT1 #(
    .INIT(2'h2)) 
    i_19
       (.I0(1'b0),
        .O(Rx_Q_Out[8]));
  LUT1 #(
    .INIT(2'h2)) 
    i_2
       (.I0(1'b0),
        .O(Rx_Q_Out[25]));
  LUT1 #(
    .INIT(2'h2)) 
    i_20
       (.I0(1'b0),
        .O(Rx_Q_CombOut[6]));
  LUT1 #(
    .INIT(2'h2)) 
    i_21
       (.I0(1'b0),
        .O(Rx_Q_CombOut[5]));
  LUT1 #(
    .INIT(2'h2)) 
    i_22
       (.I0(1'b0),
        .O(Rx_Q_CombOut[4]));
  LUT1 #(
    .INIT(2'h2)) 
    i_23
       (.I0(1'b0),
        .O(Rx_Q_CombOut[3]));
  LUT1 #(
    .INIT(2'h2)) 
    i_24
       (.I0(1'b0),
        .O(Rx_Q_CombOut[2]));
  LUT1 #(
    .INIT(2'h2)) 
    i_3
       (.I0(1'b0),
        .O(Rx_Q_Out[24]));
  LUT1 #(
    .INIT(2'h2)) 
    i_4
       (.I0(1'b0),
        .O(Rx_Q_Out[23]));
  LUT1 #(
    .INIT(2'h2)) 
    i_5
       (.I0(1'b0),
        .O(Rx_Q_Out[22]));
  LUT1 #(
    .INIT(2'h2)) 
    i_6
       (.I0(1'b0),
        .O(Rx_Q_Out[21]));
  LUT1 #(
    .INIT(2'h2)) 
    i_7
       (.I0(1'b0),
        .O(Rx_Q_Out[20]));
  LUT1 #(
    .INIT(2'h2)) 
    i_8
       (.I0(1'b0),
        .O(Rx_Q_Out[19]));
  LUT1 #(
    .INIT(2'h2)) 
    i_9
       (.I0(1'b0),
        .O(Rx_Q_Out[18]));
endmodule

(* C_BtslceUsedAsT = "7'b0000000" *) (* C_BusRxBitCtrlIn = "40" *) (* C_BusRxBitCtrlOut = "40" *) 
(* C_BusTxBitCtrlIn = "40" *) (* C_BusTxBitCtrlInTri = "40" *) (* C_BusTxBitCtrlOut = "40" *) 
(* C_BusTxBitCtrlOutTri = "40" *) (* C_BytePosition = "0" *) (* C_CntValue = "9" *) 
(* C_Ctrl_Clk = "EXTERNAL" *) (* C_Data_Type = "DATA" *) (* C_Delay_Format = "TIME" *) 
(* C_Delay_Type = "FIXED" *) (* C_Delay_Value = "0" *) (* C_Div_Mode = "DIV4" *) 
(* C_En_Clk_To_Ext_North = "DISABLE" *) (* C_En_Clk_To_Ext_South = "DISABLE" *) (* C_En_Dyn_Odly_Mode = "FALSE" *) 
(* C_En_Other_Nclk = "FALSE" *) (* C_En_Other_Pclk = "FALSE" *) (* C_Enable_Pre_Emphasis = "FALSE" *) 
(* C_Idly_Vt_Track = "FALSE" *) (* C_Init = "1'b0" *) (* C_Inv_Rxclk = "FALSE" *) 
(* C_IoBank = "44" *) (* C_Is_Clk_Inverted = "1'b0" *) (* C_Is_Rst_Dly_Inverted = "1'b0" *) 
(* C_Is_Rst_Inverted = "1'b0" *) (* C_Native_Odelay_Bypass = "FALSE" *) (* C_NibbleType = "6" *) 
(* C_Odly_Vt_Track = "FALSE" *) (* C_Output_Phase_90 = "TRUE" *) (* C_Part = "XCKU060" *) 
(* C_Qdly_Vt_Track = "FALSE" *) (* C_Read_Idle_Count = "6'b000000" *) (* C_RefClk_Frequency = "1250.000000" *) 
(* C_RefClk_Src = "PLLCLK" *) (* C_Rounding_Factor = "16" *) (* C_RxGate_Extend = "FALSE" *) 
(* C_Rx_Clk_Phase_n = "SHIFT_0" *) (* C_Rx_Clk_Phase_p = "SHIFT_0" *) (* C_Rx_Gating = "DISABLE" *) 
(* C_Self_Calibrate = "ENABLE" *) (* C_Serial_Mode = "FALSE" *) (* C_Tx_BtslceTr = "T" *) 
(* C_Tx_Data_Width = "8" *) (* C_Tx_Gating = "ENABLE" *) (* C_Update_Mode = "ASYNC" *) 
(* C_UsedBitslices = "7'b0010000" *) (* ORIG_REF_NAME = "design_1_gig_ethernet_pcs_pma_0_0_Tx_Nibble" *) 
module design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_Tx_Nibble
   (Tx_Bsc_Rst,
    Tx_Bs_Rst,
    Tx_Rst_Dly,
    Tx_Bsc_En_Vtc,
    Tx_Bs_En_Vtc,
    Tx_Riu_Clk,
    Tx_Riu_Addr,
    Tx_Riu_Wr_Data,
    Tx_Riu_Rd_Data,
    Tx_Riu_Valid,
    Tx_Riu_Wr_En,
    Tx_Riu_Nibble_Sel,
    Tx_Pll_Clk,
    Tx_RefClk,
    Tx_Dly_Rdy,
    Tx_Vtc_Rdy,
    Tx_Dyn_Dci,
    Tx_Tbyte_In,
    Tx_Phy_Rden,
    Tx_Clk_From_Ext,
    Tx_Pclk_Nibble_In,
    Tx_Nclk_Nibble_In,
    Tx_Nclk_Nibble_Out,
    Tx_Pclk_Nibble_Out,
    Tx_Clk_To_Ext_North,
    Tx_Clk_To_Ext_South,
    Tx_Tri_Out,
    Tx_Data_Out,
    Tx_T_In,
    Tx_D_In,
    Tx_Ce,
    Tx_Clk,
    Tx_Inc,
    Tx_Load,
    Tx_CntValueIn,
    Tx_CntValueOut,
    TxTri_Ce,
    TxTri_Clk,
    TxTri_Inc,
    TxTri_Load,
    TxTri_CntValueIn,
    TxTri_CntValueOut);
  input Tx_Bsc_Rst;
  input Tx_Bs_Rst;
  input Tx_Rst_Dly;
  input Tx_Bsc_En_Vtc;
  input Tx_Bs_En_Vtc;
  input Tx_Riu_Clk;
  input [5:0]Tx_Riu_Addr;
  input [15:0]Tx_Riu_Wr_Data;
  output [15:0]Tx_Riu_Rd_Data;
  output Tx_Riu_Valid;
  input Tx_Riu_Wr_En;
  input Tx_Riu_Nibble_Sel;
  input Tx_Pll_Clk;
  input Tx_RefClk;
  output Tx_Dly_Rdy;
  output Tx_Vtc_Rdy;
  output [6:0]Tx_Dyn_Dci;
  input [3:0]Tx_Tbyte_In;
  input [3:0]Tx_Phy_Rden;
  input Tx_Clk_From_Ext;
  input Tx_Pclk_Nibble_In;
  input Tx_Nclk_Nibble_In;
  output Tx_Nclk_Nibble_Out;
  output Tx_Pclk_Nibble_Out;
  output Tx_Clk_To_Ext_North;
  output Tx_Clk_To_Ext_South;
  output [5:0]Tx_Tri_Out;
  output [5:0]Tx_Data_Out;
  input [5:0]Tx_T_In;
  input [47:0]Tx_D_In;
  input [5:0]Tx_Ce;
  input Tx_Clk;
  input [5:0]Tx_Inc;
  input [5:0]Tx_Load;
  input [53:0]Tx_CntValueIn;
  output [53:0]Tx_CntValueOut;
  input TxTri_Ce;
  input TxTri_Clk;
  input TxTri_Inc;
  input TxTri_Load;
  input [8:0]TxTri_CntValueIn;
  output [8:0]TxTri_CntValueOut;

  wire \<const0> ;
  wire [199:160]IntBtslcCtrl_RxBitCtrlIn;
  wire [199:160]IntBtslcCtrl_TxBitCtrlIn;
  wire [39:0]RX_BIT_CTRL_IN;
  wire [39:0]TX_BIT_CTRL_IN;
  wire Tx_Bs_En_Vtc;
  wire Tx_Bs_Rst;
  wire Tx_Bsc_En_Vtc;
  wire Tx_Bsc_Rst;
  wire [5:0]Tx_Ce;
  wire Tx_Clk;
  wire Tx_Clk_From_Ext;
  wire Tx_Clk_To_Ext_North;
  wire Tx_Clk_To_Ext_South;
  wire [53:0]Tx_CntValueIn;
  wire [44:36]\^Tx_CntValueOut ;
  wire [47:0]Tx_D_In;
  wire [4:4]\^Tx_Data_Out ;
  wire Tx_Dly_Rdy;
  wire [6:0]Tx_Dyn_Dci;
  wire [5:0]Tx_Inc;
  wire [5:0]Tx_Load;
  wire Tx_Nclk_Nibble_In;
  wire Tx_Nclk_Nibble_Out;
  wire Tx_Pclk_Nibble_In;
  wire Tx_Pclk_Nibble_Out;
  wire Tx_Pll_Clk;
  wire Tx_RefClk;
  wire [5:0]Tx_Riu_Addr;
  wire Tx_Riu_Clk;
  wire Tx_Riu_Nibble_Sel;
  wire [15:0]Tx_Riu_Rd_Data;
  wire Tx_Riu_Valid;
  wire [15:0]Tx_Riu_Wr_Data;
  wire Tx_Riu_Wr_En;
  wire Tx_Rst_Dly;
  wire [5:0]Tx_T_In;
  wire [3:0]Tx_Tbyte_In;
  wire [4:4]\^Tx_Tri_Out ;
  wire Tx_Vtc_Rdy;
  wire [39:0]\NLW_Gen_1.Nibble_I_BitsliceCntrl_RX_BIT_CTRL_IN6_UNCONNECTED ;
  wire [39:0]\NLW_Gen_1.Nibble_I_BitsliceCntrl_RX_BIT_CTRL_OUT0_UNCONNECTED ;
  wire [39:0]\NLW_Gen_1.Nibble_I_BitsliceCntrl_RX_BIT_CTRL_OUT1_UNCONNECTED ;
  wire [39:0]\NLW_Gen_1.Nibble_I_BitsliceCntrl_RX_BIT_CTRL_OUT2_UNCONNECTED ;
  wire [39:0]\NLW_Gen_1.Nibble_I_BitsliceCntrl_RX_BIT_CTRL_OUT3_UNCONNECTED ;
  wire [39:0]\NLW_Gen_1.Nibble_I_BitsliceCntrl_RX_BIT_CTRL_OUT5_UNCONNECTED ;
  wire [39:0]\NLW_Gen_1.Nibble_I_BitsliceCntrl_RX_BIT_CTRL_OUT6_UNCONNECTED ;
  wire [39:0]\NLW_Gen_1.Nibble_I_BitsliceCntrl_TX_BIT_CTRL_IN6_UNCONNECTED ;
  wire [39:0]\NLW_Gen_1.Nibble_I_BitsliceCntrl_TX_BIT_CTRL_OUT0_UNCONNECTED ;
  wire [39:0]\NLW_Gen_1.Nibble_I_BitsliceCntrl_TX_BIT_CTRL_OUT1_UNCONNECTED ;
  wire [39:0]\NLW_Gen_1.Nibble_I_BitsliceCntrl_TX_BIT_CTRL_OUT2_UNCONNECTED ;
  wire [39:0]\NLW_Gen_1.Nibble_I_BitsliceCntrl_TX_BIT_CTRL_OUT3_UNCONNECTED ;
  wire [39:0]\NLW_Gen_1.Nibble_I_BitsliceCntrl_TX_BIT_CTRL_OUT5_UNCONNECTED ;
  wire [39:0]\NLW_Gen_1.Nibble_I_BitsliceCntrl_TX_BIT_CTRL_OUT6_UNCONNECTED ;
  wire [39:0]\NLW_Gen_1.Nibble_I_BitsliceCntrl_TX_BIT_CTRL_OUT_TRI_UNCONNECTED ;

  assign TxTri_CntValueOut[8] = \<const0> ;
  assign TxTri_CntValueOut[7] = \<const0> ;
  assign TxTri_CntValueOut[6] = \<const0> ;
  assign TxTri_CntValueOut[5] = \<const0> ;
  assign TxTri_CntValueOut[4] = \<const0> ;
  assign TxTri_CntValueOut[3] = \<const0> ;
  assign TxTri_CntValueOut[2] = \<const0> ;
  assign TxTri_CntValueOut[1] = \<const0> ;
  assign TxTri_CntValueOut[0] = \<const0> ;
  assign Tx_CntValueOut[53] = \<const0> ;
  assign Tx_CntValueOut[52] = \<const0> ;
  assign Tx_CntValueOut[51] = \<const0> ;
  assign Tx_CntValueOut[50] = \<const0> ;
  assign Tx_CntValueOut[49] = \<const0> ;
  assign Tx_CntValueOut[48] = \<const0> ;
  assign Tx_CntValueOut[47] = \<const0> ;
  assign Tx_CntValueOut[46] = \<const0> ;
  assign Tx_CntValueOut[45] = \<const0> ;
  assign Tx_CntValueOut[44:36] = \^Tx_CntValueOut [44:36];
  assign Tx_CntValueOut[35] = \<const0> ;
  assign Tx_CntValueOut[34] = \<const0> ;
  assign Tx_CntValueOut[33] = \<const0> ;
  assign Tx_CntValueOut[32] = \<const0> ;
  assign Tx_CntValueOut[31] = \<const0> ;
  assign Tx_CntValueOut[30] = \<const0> ;
  assign Tx_CntValueOut[29] = \<const0> ;
  assign Tx_CntValueOut[28] = \<const0> ;
  assign Tx_CntValueOut[27] = \<const0> ;
  assign Tx_CntValueOut[26] = \<const0> ;
  assign Tx_CntValueOut[25] = \<const0> ;
  assign Tx_CntValueOut[24] = \<const0> ;
  assign Tx_CntValueOut[23] = \<const0> ;
  assign Tx_CntValueOut[22] = \<const0> ;
  assign Tx_CntValueOut[21] = \<const0> ;
  assign Tx_CntValueOut[20] = \<const0> ;
  assign Tx_CntValueOut[19] = \<const0> ;
  assign Tx_CntValueOut[18] = \<const0> ;
  assign Tx_CntValueOut[17] = \<const0> ;
  assign Tx_CntValueOut[16] = \<const0> ;
  assign Tx_CntValueOut[15] = \<const0> ;
  assign Tx_CntValueOut[14] = \<const0> ;
  assign Tx_CntValueOut[13] = \<const0> ;
  assign Tx_CntValueOut[12] = \<const0> ;
  assign Tx_CntValueOut[11] = \<const0> ;
  assign Tx_CntValueOut[10] = \<const0> ;
  assign Tx_CntValueOut[9] = \<const0> ;
  assign Tx_CntValueOut[8] = \<const0> ;
  assign Tx_CntValueOut[7] = \<const0> ;
  assign Tx_CntValueOut[6] = \<const0> ;
  assign Tx_CntValueOut[5] = \<const0> ;
  assign Tx_CntValueOut[4] = \<const0> ;
  assign Tx_CntValueOut[3] = \<const0> ;
  assign Tx_CntValueOut[2] = \<const0> ;
  assign Tx_CntValueOut[1] = \<const0> ;
  assign Tx_CntValueOut[0] = \<const0> ;
  assign Tx_Data_Out[5] = \<const0> ;
  assign Tx_Data_Out[4] = \^Tx_Data_Out [4];
  assign Tx_Data_Out[3] = \<const0> ;
  assign Tx_Data_Out[2] = \<const0> ;
  assign Tx_Data_Out[1] = \<const0> ;
  assign Tx_Data_Out[0] = \<const0> ;
  assign Tx_Tri_Out[5] = \<const0> ;
  assign Tx_Tri_Out[4] = \^Tx_Tri_Out [4];
  assign Tx_Tri_Out[3] = \<const0> ;
  assign Tx_Tri_Out[2] = \<const0> ;
  assign Tx_Tri_Out[1] = \<const0> ;
  assign Tx_Tri_Out[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* box_type = "PRIMITIVE" *) 
  BITSLICE_CONTROL #(
    .CTRL_CLK("EXTERNAL"),
    .DIV_MODE("DIV4"),
    .EN_CLK_TO_EXT_NORTH("DISABLE"),
    .EN_CLK_TO_EXT_SOUTH("DISABLE"),
    .EN_DYN_ODLY_MODE("FALSE"),
    .EN_OTHER_NCLK("FALSE"),
    .EN_OTHER_PCLK("FALSE"),
    .IDLY_VT_TRACK("FALSE"),
    .INV_RXCLK("FALSE"),
    .ODLY_VT_TRACK("FALSE"),
    .QDLY_VT_TRACK("FALSE"),
    .READ_IDLE_COUNT(6'h00),
    .REFCLK_SRC("PLLCLK"),
    .ROUNDING_FACTOR(16),
    .RXGATE_EXTEND("FALSE"),
    .RX_CLK_PHASE_N("SHIFT_0"),
    .RX_CLK_PHASE_P("SHIFT_0"),
    .RX_GATING("DISABLE"),
    .SELF_CALIBRATE("ENABLE"),
    .SERIAL_MODE("FALSE"),
    .SIM_DEVICE("ULTRASCALE_PLUS_ES1"),
    .SIM_SPEEDUP("FAST"),
    .SIM_VERSION(2.000000),
    .TX_GATING("ENABLE")) 
    \Gen_1.Nibble_I_BitsliceCntrl 
       (.CLK_FROM_EXT(Tx_Clk_From_Ext),
        .CLK_TO_EXT_NORTH(Tx_Clk_To_Ext_North),
        .CLK_TO_EXT_SOUTH(Tx_Clk_To_Ext_South),
        .DLY_RDY(Tx_Dly_Rdy),
        .DYN_DCI(Tx_Dyn_Dci),
        .EN_VTC(Tx_Bsc_En_Vtc),
        .NCLK_NIBBLE_IN(Tx_Nclk_Nibble_In),
        .NCLK_NIBBLE_OUT(Tx_Nclk_Nibble_Out),
        .PCLK_NIBBLE_IN(Tx_Pclk_Nibble_In),
        .PCLK_NIBBLE_OUT(Tx_Pclk_Nibble_Out),
        .PHY_RDCS0({1'b0,1'b0,1'b0,1'b0}),
        .PHY_RDCS1({1'b0,1'b0,1'b0,1'b0}),
        .PHY_RDEN({1'b0,1'b0,1'b0,1'b0}),
        .PHY_WRCS0({1'b0,1'b0,1'b0,1'b0}),
        .PHY_WRCS1({1'b0,1'b0,1'b0,1'b0}),
        .PLL_CLK(Tx_Pll_Clk),
        .REFCLK(Tx_RefClk),
        .RIU_ADDR(Tx_Riu_Addr),
        .RIU_CLK(Tx_Riu_Clk),
        .RIU_NIBBLE_SEL(Tx_Riu_Nibble_Sel),
        .RIU_RD_DATA(Tx_Riu_Rd_Data),
        .RIU_VALID(Tx_Riu_Valid),
        .RIU_WR_DATA(Tx_Riu_Wr_Data),
        .RIU_WR_EN(Tx_Riu_Wr_En),
        .RST(Tx_Bsc_Rst),
        .RX_BIT_CTRL_IN0({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .RX_BIT_CTRL_IN1({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .RX_BIT_CTRL_IN2({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .RX_BIT_CTRL_IN3({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .RX_BIT_CTRL_IN4(IntBtslcCtrl_RxBitCtrlIn),
        .RX_BIT_CTRL_IN5({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .RX_BIT_CTRL_IN6(\NLW_Gen_1.Nibble_I_BitsliceCntrl_RX_BIT_CTRL_IN6_UNCONNECTED [39:0]),
        .RX_BIT_CTRL_OUT0(\NLW_Gen_1.Nibble_I_BitsliceCntrl_RX_BIT_CTRL_OUT0_UNCONNECTED [39:0]),
        .RX_BIT_CTRL_OUT1(\NLW_Gen_1.Nibble_I_BitsliceCntrl_RX_BIT_CTRL_OUT1_UNCONNECTED [39:0]),
        .RX_BIT_CTRL_OUT2(\NLW_Gen_1.Nibble_I_BitsliceCntrl_RX_BIT_CTRL_OUT2_UNCONNECTED [39:0]),
        .RX_BIT_CTRL_OUT3(\NLW_Gen_1.Nibble_I_BitsliceCntrl_RX_BIT_CTRL_OUT3_UNCONNECTED [39:0]),
        .RX_BIT_CTRL_OUT4(RX_BIT_CTRL_IN),
        .RX_BIT_CTRL_OUT5(\NLW_Gen_1.Nibble_I_BitsliceCntrl_RX_BIT_CTRL_OUT5_UNCONNECTED [39:0]),
        .RX_BIT_CTRL_OUT6(\NLW_Gen_1.Nibble_I_BitsliceCntrl_RX_BIT_CTRL_OUT6_UNCONNECTED [39:0]),
        .TBYTE_IN(Tx_Tbyte_In),
        .TX_BIT_CTRL_IN0({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TX_BIT_CTRL_IN1({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TX_BIT_CTRL_IN2({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TX_BIT_CTRL_IN3({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TX_BIT_CTRL_IN4(IntBtslcCtrl_TxBitCtrlIn),
        .TX_BIT_CTRL_IN5({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TX_BIT_CTRL_IN6(\NLW_Gen_1.Nibble_I_BitsliceCntrl_TX_BIT_CTRL_IN6_UNCONNECTED [39:0]),
        .TX_BIT_CTRL_IN_TRI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TX_BIT_CTRL_OUT0(\NLW_Gen_1.Nibble_I_BitsliceCntrl_TX_BIT_CTRL_OUT0_UNCONNECTED [39:0]),
        .TX_BIT_CTRL_OUT1(\NLW_Gen_1.Nibble_I_BitsliceCntrl_TX_BIT_CTRL_OUT1_UNCONNECTED [39:0]),
        .TX_BIT_CTRL_OUT2(\NLW_Gen_1.Nibble_I_BitsliceCntrl_TX_BIT_CTRL_OUT2_UNCONNECTED [39:0]),
        .TX_BIT_CTRL_OUT3(\NLW_Gen_1.Nibble_I_BitsliceCntrl_TX_BIT_CTRL_OUT3_UNCONNECTED [39:0]),
        .TX_BIT_CTRL_OUT4(TX_BIT_CTRL_IN),
        .TX_BIT_CTRL_OUT5(\NLW_Gen_1.Nibble_I_BitsliceCntrl_TX_BIT_CTRL_OUT5_UNCONNECTED [39:0]),
        .TX_BIT_CTRL_OUT6(\NLW_Gen_1.Nibble_I_BitsliceCntrl_TX_BIT_CTRL_OUT6_UNCONNECTED [39:0]),
        .TX_BIT_CTRL_OUT_TRI(\NLW_Gen_1.Nibble_I_BitsliceCntrl_TX_BIT_CTRL_OUT_TRI_UNCONNECTED [39:0]),
        .VTC_RDY(Tx_Vtc_Rdy));
  (* box_type = "PRIMITIVE" *) 
  TX_BITSLICE #(
    .DATA_WIDTH(8),
    .DELAY_FORMAT("TIME"),
    .DELAY_TYPE("FIXED"),
    .DELAY_VALUE(0),
    .ENABLE_PRE_EMPHASIS("FALSE"),
    .INIT(1'b0),
    .IS_CLK_INVERTED(1'b0),
    .IS_RST_DLY_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b0),
    .NATIVE_ODELAY_BYPASS("FALSE"),
    .OUTPUT_PHASE_90("TRUE"),
    .REFCLK_FREQUENCY(1250.000000),
    .SIM_DEVICE("ULTRASCALE_PLUS_ES1"),
    .SIM_VERSION(2.000000),
    .TBYTE_CTL("T"),
    .UPDATE_MODE("ASYNC")) 
    \Gen_7[5].Gen_7_1.Nibble_I_TxBitslice 
       (.CE(Tx_Ce[4]),
        .CLK(Tx_Clk),
        .CNTVALUEIN(Tx_CntValueIn[44:36]),
        .CNTVALUEOUT(\^Tx_CntValueOut ),
        .D(Tx_D_In[39:32]),
        .EN_VTC(Tx_Bs_En_Vtc),
        .INC(Tx_Inc[4]),
        .LOAD(Tx_Load[4]),
        .O(\^Tx_Data_Out ),
        .RST(Tx_Bs_Rst),
        .RST_DLY(Tx_Rst_Dly),
        .RX_BIT_CTRL_IN(RX_BIT_CTRL_IN),
        .RX_BIT_CTRL_OUT(IntBtslcCtrl_RxBitCtrlIn),
        .T(Tx_T_In[4]),
        .TBYTE_IN(1'b0),
        .TX_BIT_CTRL_IN(TX_BIT_CTRL_IN),
        .TX_BIT_CTRL_OUT(IntBtslcCtrl_TxBitCtrlIn),
        .T_OUT(\^Tx_Tri_Out ));
endmodule

(* ORIG_REF_NAME = "design_1_gig_ethernet_pcs_pma_0_0_block" *) 
module design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_block
   (Tx_Dly_Rdy,
    Tx_Vtc_Rdy,
    Rx_Dly_Rdy,
    Rx_Vtc_Rdy,
    riu_rd_data,
    riu_valid,
    riu_prsnt,
    sgmii_clk_r_0,
    sgmii_clk_en_0,
    gmii_rxd_0,
    gmii_rx_dv_0,
    gmii_rx_er_0,
    sgmii_clk_f_0,
    gmii_isolate_0,
    an_interrupt_0,
    mdio_t_0,
    status_vector_0,
    txp_0,
    txn_0,
    mdio_o_0,
    Rx_SysClk,
    tx_dly_rdy_3,
    tx_dly_rdy_1,
    tx_dly_rdy_2,
    tx_vtc_rdy_3,
    tx_vtc_rdy_1,
    tx_vtc_rdy_2,
    rx_dly_rdy_3,
    rx_dly_rdy_1,
    rx_dly_rdy_2,
    rx_vtc_rdy_3,
    rx_vtc_rdy_1,
    rx_vtc_rdy_2,
    tx_bsc_rst_out,
    rx_bsc_rst_out,
    tx_bs_rst_out,
    rx_bs_rst_out,
    tx_rst_dly_out,
    rx_rst_dly_out,
    tx_bsc_en_vtc_out,
    rx_bsc_en_vtc_out,
    tx_bs_en_vtc_out,
    rx_bs_en_vtc_out,
    riu_clk_out,
    riu_addr_out,
    riu_wr_data_out,
    riu_wr_en_out,
    riu_nibble_sel_out,
    tx_pll_clk_out,
    rx_pll_clk_out,
    CLK,
    Tx_WrClk,
    speed_is_10_100_0,
    speed_is_100_0,
    gmii_txd_0,
    gmii_tx_en_0,
    gmii_tx_er_0,
    reset_out,
    signal_detect_0,
    phyaddr_0,
    mdc_0,
    mdio_i_0,
    an_restart_config_0,
    configuration_vector_0,
    configuration_valid_0,
    D,
    rxp_0,
    rxn_0,
    ext_mdio_i_0);
  output Tx_Dly_Rdy;
  output Tx_Vtc_Rdy;
  output Rx_Dly_Rdy;
  output Rx_Vtc_Rdy;
  output [15:0]riu_rd_data;
  output riu_valid;
  output riu_prsnt;
  output sgmii_clk_r_0;
  output sgmii_clk_en_0;
  output [7:0]gmii_rxd_0;
  output gmii_rx_dv_0;
  output gmii_rx_er_0;
  output sgmii_clk_f_0;
  output gmii_isolate_0;
  output an_interrupt_0;
  output mdio_t_0;
  output [12:0]status_vector_0;
  output txp_0;
  output txn_0;
  output mdio_o_0;
  input Rx_SysClk;
  input tx_dly_rdy_3;
  input tx_dly_rdy_1;
  input tx_dly_rdy_2;
  input tx_vtc_rdy_3;
  input tx_vtc_rdy_1;
  input tx_vtc_rdy_2;
  input rx_dly_rdy_3;
  input rx_dly_rdy_1;
  input rx_dly_rdy_2;
  input rx_vtc_rdy_3;
  input rx_vtc_rdy_1;
  input rx_vtc_rdy_2;
  input tx_bsc_rst_out;
  input rx_bsc_rst_out;
  input tx_bs_rst_out;
  input rx_bs_rst_out;
  input tx_rst_dly_out;
  input rx_rst_dly_out;
  input tx_bsc_en_vtc_out;
  input rx_bsc_en_vtc_out;
  input tx_bs_en_vtc_out;
  input rx_bs_en_vtc_out;
  input riu_clk_out;
  input [5:0]riu_addr_out;
  input [15:0]riu_wr_data_out;
  input riu_wr_en_out;
  input [1:0]riu_nibble_sel_out;
  input tx_pll_clk_out;
  input rx_pll_clk_out;
  input CLK;
  input Tx_WrClk;
  input speed_is_10_100_0;
  input speed_is_100_0;
  input [7:0]gmii_txd_0;
  input gmii_tx_en_0;
  input gmii_tx_er_0;
  input reset_out;
  input signal_detect_0;
  input [4:0]phyaddr_0;
  input mdc_0;
  input mdio_i_0;
  input an_restart_config_0;
  input [4:0]configuration_vector_0;
  input configuration_valid_0;
  input [5:0]D;
  input rxp_0;
  input rxn_0;
  input ext_mdio_i_0;

  wire ActiveIsSlve_i_1_n_0;
  wire Aligned_i_1_n_0;
  wire [7:0]BaseX_Rx_Q_Out;
  wire [39:32]BaseX_Tx_D_In;
  wire [4:4]BaseX_Tx_Data_Out;
  wire CLK;
  wire [5:0]D;
  wire IntRdEna_i_1_n_0;
  wire LossOfSignal_i_1_n_0;
  wire Mstr_Load_i_1_n_0;
  wire Rx_Dly_Rdy;
  wire Rx_Dly_Rdy_Int;
  wire Rx_SysClk;
  wire Rx_Vtc_Rdy;
  wire Rx_Vtc_Rdy_Int;
  wire Slve_Load_i_1_n_0;
  wire Tx_Dly_Rdy;
  wire Tx_Dly_Rdy_Int;
  wire Tx_Vtc_Rdy;
  wire Tx_Vtc_Rdy_Int;
  wire Tx_WrClk;
  wire WrapToZero_i_1_n_0;
  wire al_rx_valid_out;
  wire an_interrupt_0;
  wire an_restart_config_0;
  wire configuration_valid_0;
  wire [4:0]configuration_vector_0;
  wire ext_mdio_i_0;
  wire [1:0]fifo_empty;
  wire fifo_read_0;
  wire \gb_out_inst/IntRdEna ;
  wire [3:0]\gb_out_inst/IntWrAddr_reg ;
  wire \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_1 ;
  wire \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_100 ;
  wire \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_101 ;
  wire \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_102 ;
  wire \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_103 ;
  wire \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_104 ;
  wire \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_105 ;
  wire \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_106 ;
  wire \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_24 ;
  wire \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_25 ;
  wire \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_27 ;
  wire \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_28 ;
  wire \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_29 ;
  wire \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_3 ;
  wire \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_30 ;
  wire \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_31 ;
  wire \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_33 ;
  wire \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_36 ;
  wire \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_37 ;
  wire \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_38 ;
  wire \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_39 ;
  wire \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_40 ;
  wire \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_41 ;
  wire \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_42 ;
  wire \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_43 ;
  wire \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_49 ;
  wire \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_50 ;
  wire \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_51 ;
  wire \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_52 ;
  wire \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_53 ;
  wire \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_55 ;
  wire \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_56 ;
  wire \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_57 ;
  wire \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_58 ;
  wire \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_59 ;
  wire \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_60 ;
  wire \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_61 ;
  wire \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_62 ;
  wire \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_63 ;
  wire \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_64 ;
  wire \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_65 ;
  wire \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_66 ;
  wire \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_67 ;
  wire \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_92 ;
  wire \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_93 ;
  wire \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_94 ;
  wire \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_95 ;
  wire \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_96 ;
  wire \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_97 ;
  wire \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_98 ;
  wire \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_99 ;
  wire \gen_lvds_transceiver.gen_lvds_transceiver_logic_gate__0_n_0 ;
  wire \gen_lvds_transceiver.gen_lvds_transceiver_logic_gate_n_0 ;
  wire \gen_lvds_transceiver.gen_lvds_transceiver_logic_r_0_n_0 ;
  wire \gen_lvds_transceiver.gen_lvds_transceiver_logic_r_1_n_0 ;
  wire \gen_lvds_transceiver.gen_lvds_transceiver_logic_r_n_0 ;
  wire gmii_isolate_0;
  wire gmii_rx_dv_0;
  wire gmii_rx_dv_int;
  wire gmii_rx_er_0;
  wire gmii_rx_er_int;
  wire [7:0]gmii_rxd_0;
  wire [7:0]gmii_rxd_int;
  wire gmii_tx_en_0;
  wire gmii_tx_en_int;
  wire gmii_tx_er_0;
  wire gmii_tx_er_int;
  wire [7:0]gmii_txd_0;
  wire [7:0]gmii_txd_int;
  wire initialize_ram_complete_i_1_n_0;
  wire insert3_i_1_n_0;
  wire insert5_i_1_n_0;
  wire mdc_0;
  wire mdio_i_0;
  wire mdio_o_0;
  wire mdio_t_0;
  wire mgt_rx_reset;
  wire mgt_tx_reset_0;
  wire mload;
  wire monitor_late_i_1_n_0;
  wire p_0_in_0;
  wire pd_ovflw_down_i_1_n_0;
  wire pd_ovflw_up_i_1_n_0;
  wire [4:0]phyaddr_0;
  wire reset_out;
  wire [5:0]riu_addr_out;
  wire riu_clk_out;
  wire [1:0]riu_nibble_sel_out;
  wire riu_prsnt;
  wire [15:0]riu_rd_data;
  wire riu_valid;
  wire [15:0]riu_wr_data_out;
  wire riu_wr_en_out;
  wire rx_bs_en_vtc_out;
  wire rx_bs_rst_out;
  wire rx_bsc_en_vtc_out;
  wire rx_bsc_rst_out;
  wire rx_dly_rdy_1;
  wire rx_dly_rdy_2;
  wire rx_dly_rdy_3;
  wire \rx_elastic_buffer_inst/initialize_ram_complete ;
  wire \rx_elastic_buffer_inst/initialize_ram_complete_pulse ;
  wire \rx_elastic_buffer_inst/initialize_ram_complete_sync ;
  wire \rx_elastic_buffer_inst/initialize_ram_complete_sync_reg1 ;
  wire \rx_elastic_buffer_inst/initialize_ram_complete_sync_ris_edg0 ;
  wire [4:2]\rx_elastic_buffer_inst/rd_occupancy ;
  wire \rx_elastic_buffer_inst/remove_idle ;
  wire \rx_elastic_buffer_inst/remove_idle_reg ;
  wire rx_pll_clk_out;
  wire rx_rst_dly_out;
  wire rx_vtc_rdy_1;
  wire rx_vtc_rdy_2;
  wire rx_vtc_rdy_3;
  wire rxbuferr;
  wire rxbuferr_i_1_n_0;
  wire rxchariscomma;
  wire rxcharisk;
  wire [2:0]rxclkcorcnt;
  wire [7:0]rxdata;
  wire rxdisperr;
  wire rxn_0;
  wire rxn_diffout;
  wire rxnotintable;
  wire rxp_0;
  wire rxp_diffout;
  wire rxrecreset0;
  wire rxrundisp;
  wire \serdes_1_to_10_i/ActCnt_GE_HalfBT ;
  wire \serdes_1_to_10_i/ActiveIsSlve ;
  wire \serdes_1_to_10_i/Aligned ;
  wire \serdes_1_to_10_i/FifoRd_2__0 ;
  wire \serdes_1_to_10_i/FifoRd_3__0 ;
  wire \serdes_1_to_10_i/LossOfSignal ;
  wire \serdes_1_to_10_i/WrapToZero ;
  wire [5:5]\serdes_1_to_10_i/act_count_reg ;
  wire \serdes_1_to_10_i/p_0_in ;
  wire [4:0]\serdes_1_to_10_i/pd_count ;
  wire sgmii_clk_en_0;
  wire sgmii_clk_f_0;
  wire sgmii_clk_r_0;
  wire signal_detect_0;
  wire sload;
  wire speed_is_100_0;
  wire speed_is_10_100_0;
  wire [12:0]status_vector_0;
  wire tx_bs_en_vtc_out;
  wire tx_bs_rst_out;
  wire tx_bsc_en_vtc_out;
  wire tx_bsc_rst_out;
  wire tx_dly_rdy_1;
  wire tx_dly_rdy_2;
  wire tx_dly_rdy_3;
  wire tx_pll_clk_out;
  wire tx_rst_dly_out;
  wire tx_vtc_rdy_1;
  wire tx_vtc_rdy_2;
  wire tx_vtc_rdy_3;
  wire txchardispmode;
  wire txchardispval;
  wire txcharisk;
  wire [7:0]txdata;
  wire txn_0;
  wire txp_0;
  wire \wr_addr[6]_i_2_n_0 ;
  wire [62:0]NLW_gen_io_logic_BaseX_Idly_CntValueOut_UNCONNECTED;
  wire [53:0]NLW_gen_io_logic_BaseX_Odly_CntValueOut_UNCONNECTED;
  wire [6:2]NLW_gen_io_logic_BaseX_Rx_Fifo_Empty_UNCONNECTED;
  wire [6:0]NLW_gen_io_logic_BaseX_Rx_Q_CombOut_UNCONNECTED;
  wire [27:8]NLW_gen_io_logic_BaseX_Rx_Q_Out_UNCONNECTED;
  wire [8:0]NLW_gen_io_logic_BaseX_TriOdly_CntValueOut_UNCONNECTED;
  wire [5:0]NLW_gen_io_logic_BaseX_Tx_Data_Out_UNCONNECTED;
  wire [5:0]NLW_gen_io_logic_BaseX_Tx_Tri_Out_UNCONNECTED;
  wire \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core_an_enable_UNCONNECTED ;
  wire \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core_drp_den_UNCONNECTED ;
  wire \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core_drp_dwe_UNCONNECTED ;
  wire \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core_drp_req_UNCONNECTED ;
  wire \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core_en_cdet_UNCONNECTED ;
  wire \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core_enablealign_UNCONNECTED ;
  wire \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core_ewrap_UNCONNECTED ;
  wire \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core_loc_ref_UNCONNECTED ;
  wire \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core_powerdown_UNCONNECTED ;
  wire \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core_s_axi_arready_UNCONNECTED ;
  wire \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core_s_axi_awready_UNCONNECTED ;
  wire \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core_s_axi_bvalid_UNCONNECTED ;
  wire \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core_s_axi_rvalid_UNCONNECTED ;
  wire \NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core_s_axi_wready_UNCONNECTED ;
  wire [9:0]\NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core_drp_daddr_UNCONNECTED ;
  wire [15:0]\NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core_drp_di_UNCONNECTED ;
  wire [63:0]\NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core_rxphy_correction_timer_UNCONNECTED ;
  wire [31:0]\NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core_rxphy_ns_field_UNCONNECTED ;
  wire [47:0]\NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core_rxphy_s_field_UNCONNECTED ;
  wire [1:0]\NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core_s_axi_bresp_UNCONNECTED ;
  wire [31:0]\NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core_s_axi_rdata_UNCONNECTED ;
  wire [1:0]\NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core_s_axi_rresp_UNCONNECTED ;
  wire [1:0]\NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core_speed_selection_UNCONNECTED ;
  wire [15:8]\NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core_status_vector_UNCONNECTED ;
  wire [9:0]\NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core_tx_code_group_UNCONNECTED ;

  LUT6 #(
    .INIT(64'hFFFFFFDF00000020)) 
    ActiveIsSlve_i_1
       (.I0(\serdes_1_to_10_i/p_0_in ),
        .I1(\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_104 ),
        .I2(\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_55 ),
        .I3(\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_53 ),
        .I4(\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_52 ),
        .I5(\serdes_1_to_10_i/ActiveIsSlve ),
        .O(ActiveIsSlve_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFE0000)) 
    Aligned_i_1
       (.I0(\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_50 ),
        .I1(\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_51 ),
        .I2(\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_100 ),
        .I3(\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_49 ),
        .I4(\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_33 ),
        .I5(\serdes_1_to_10_i/Aligned ),
        .O(Aligned_i_1_n_0));
  LUT5 #(
    .INIT(32'hFFFF0010)) 
    IntRdEna_i_1
       (.I0(\gb_out_inst/IntWrAddr_reg [2]),
        .I1(\gb_out_inst/IntWrAddr_reg [3]),
        .I2(\gb_out_inst/IntWrAddr_reg [1]),
        .I3(\gb_out_inst/IntWrAddr_reg [0]),
        .I4(\gb_out_inst/IntRdEna ),
        .O(IntRdEna_i_1_n_0));
  LUT5 #(
    .INIT(32'hFABB0A88)) 
    LossOfSignal_i_1
       (.I0(\serdes_1_to_10_i/LossOfSignal ),
        .I1(\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_99 ),
        .I2(\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_97 ),
        .I3(\serdes_1_to_10_i/act_count_reg ),
        .I4(\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_98 ),
        .O(LossOfSignal_i_1_n_0));
  LUT6 #(
    .INIT(64'hBAAABBAB8AAA88A8)) 
    Mstr_Load_i_1
       (.I0(\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_92 ),
        .I1(\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_93 ),
        .I2(\serdes_1_to_10_i/ActiveIsSlve ),
        .I3(\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_102 ),
        .I4(\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_96 ),
        .I5(\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_25 ),
        .O(Mstr_Load_i_1_n_0));
  LUT6 #(
    .INIT(64'hAAAAAEFEAAAAA202)) 
    Slve_Load_i_1
       (.I0(\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_92 ),
        .I1(\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_102 ),
        .I2(\serdes_1_to_10_i/ActiveIsSlve ),
        .I3(\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_96 ),
        .I4(\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_93 ),
        .I5(\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_24 ),
        .O(Slve_Load_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFEE00000100)) 
    WrapToZero_i_1
       (.I0(\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_53 ),
        .I1(\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_95 ),
        .I2(\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_56 ),
        .I3(\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_57 ),
        .I4(\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_52 ),
        .I5(\serdes_1_to_10_i/WrapToZero ),
        .O(WrapToZero_i_1_n_0));
  LUT4 #(
    .INIT(16'h8000)) 
    clock_reset_i_i_1
       (.I0(tx_dly_rdy_3),
        .I1(Tx_Dly_Rdy_Int),
        .I2(tx_dly_rdy_1),
        .I3(tx_dly_rdy_2),
        .O(Tx_Dly_Rdy));
  LUT4 #(
    .INIT(16'h8000)) 
    clock_reset_i_i_2
       (.I0(tx_vtc_rdy_3),
        .I1(Tx_Vtc_Rdy_Int),
        .I2(tx_vtc_rdy_1),
        .I3(tx_vtc_rdy_2),
        .O(Tx_Vtc_Rdy));
  LUT4 #(
    .INIT(16'h8000)) 
    clock_reset_i_i_3
       (.I0(rx_dly_rdy_3),
        .I1(Rx_Dly_Rdy_Int),
        .I2(rx_dly_rdy_1),
        .I3(rx_dly_rdy_2),
        .O(Rx_Dly_Rdy));
  LUT4 #(
    .INIT(16'h8000)) 
    clock_reset_i_i_4
       (.I0(rx_vtc_rdy_3),
        .I1(Rx_Vtc_Rdy_Int),
        .I2(rx_vtc_rdy_1),
        .I3(rx_vtc_rdy_2),
        .O(Rx_Vtc_Rdy));
  (* box_type = "PRIMITIVE" *) 
  IBUFDS_DIFF_OUT #(
    .DIFF_TERM("FALSE"),
    .IOSTANDARD("DEFAULT")) 
    \gen_IOB.gen_IOB[0].data_in 
       (.I(rxp_0),
        .IB(rxn_0),
        .O(rxp_diffout),
        .OB(rxn_diffout));
  (* CAPACITANCE = "DONT_CARE" *) 
  (* XILINX_LEGACY_PRIM = "OBUFDS" *) 
  (* box_type = "PRIMITIVE" *) 
  OBUFDS #(
    .IOSTANDARD("DEFAULT")) 
    \gen_IOB.gen_IOB[0].io_data_out 
       (.I(BaseX_Tx_Data_Out),
        .O(txp_0),
        .OB(txn_0));
  (* C_BytePosition = "0" *) 
  (* C_IoBank = "44" *) 
  (* C_Part = "XCKU060" *) 
  (* C_Rx_BtslcNulType = "SERIAL" *) 
  (* C_Rx_Data_Width = "4" *) 
  (* C_Rx_Delay_Format = "COUNT" *) 
  (* C_Rx_Delay_Type = "VAR_LOAD" *) 
  (* C_Rx_Delay_Value = "0" *) 
  (* C_Rx_RefClk_Frequency = "312.500000" *) 
  (* C_Rx_Self_Calibrate = "ENABLE" *) 
  (* C_Rx_Serial_Mode = "TRUE" *) 
  (* C_Rx_UsedBitslices = "7'b0000011" *) 
  (* C_TxInUpperNibble = "0" *) 
  (* C_Tx_BtslceTr = "T" *) 
  (* C_Tx_BtslceUsedAsT = "7'b0000000" *) 
  (* C_Tx_Data_Width = "8" *) 
  (* C_Tx_Delay_Format = "TIME" *) 
  (* C_Tx_Delay_Type = "FIXED" *) 
  (* C_Tx_Delay_Value = "0" *) 
  (* C_Tx_RefClk_Frequency = "1250.000000" *) 
  (* C_Tx_Self_Calibrate = "ENABLE" *) 
  (* C_Tx_Serial_Mode = "FALSE" *) 
  (* C_Tx_UsedBitslices = "7'b0010000" *) 
  (* C_UseRxRiu = "1" *) 
  (* C_UseTxRiu = "1" *) 
  (* DONT_TOUCH *) 
  design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_BaseX_Byte gen_io_logic
       (.BaseX_Dly_Clk(Rx_SysClk),
        .BaseX_Idly_Ce({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BaseX_Idly_CntValueIn({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_59 ,\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_60 ,\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_61 ,\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_62 ,\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_63 ,\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_64 ,\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_65 ,\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_66 ,\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_67 ,\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_36 ,\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_37 ,\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_38 ,\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_39 ,\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_40 ,\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_41 ,\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_58 ,\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_42 ,\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_43 }),
        .BaseX_Idly_CntValueOut(NLW_gen_io_logic_BaseX_Idly_CntValueOut_UNCONNECTED[62:0]),
        .BaseX_Idly_Inc({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BaseX_Idly_Load({1'b0,1'b0,1'b0,1'b0,1'b0,sload,mload}),
        .BaseX_Odly_Ce({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BaseX_Odly_CntValueIn({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BaseX_Odly_CntValueOut(NLW_gen_io_logic_BaseX_Odly_CntValueOut_UNCONNECTED[53:0]),
        .BaseX_Odly_Inc({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BaseX_Odly_Load({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BaseX_Riu_Addr(riu_addr_out),
        .BaseX_Riu_Clk(riu_clk_out),
        .BaseX_Riu_Nibble_Sel(riu_nibble_sel_out),
        .BaseX_Riu_Prsnt(riu_prsnt),
        .BaseX_Riu_Rd_Data(riu_rd_data),
        .BaseX_Riu_Valid(riu_valid),
        .BaseX_Riu_Wr_Data(riu_wr_data_out),
        .BaseX_Riu_Wr_En(riu_wr_en_out),
        .BaseX_Rx_Bs_En_Vtc(rx_bs_en_vtc_out),
        .BaseX_Rx_Bs_Rst(rx_bs_rst_out),
        .BaseX_Rx_Bsc_En_Vtc(rx_bsc_en_vtc_out),
        .BaseX_Rx_Bsc_Rst(rx_bsc_rst_out),
        .BaseX_Rx_Data_In({1'b0,1'b0,1'b0,1'b0,1'b0,rxn_diffout,rxp_diffout}),
        .BaseX_Rx_Dly_Rdy(Rx_Dly_Rdy_Int),
        .BaseX_Rx_Fifo_Empty({NLW_gen_io_logic_BaseX_Rx_Fifo_Empty_UNCONNECTED[6:2],fifo_empty}),
        .BaseX_Rx_Fifo_Rd_Clk(Rx_SysClk),
        .BaseX_Rx_Fifo_Rd_En({1'b0,1'b0,1'b0,1'b0,1'b0,fifo_read_0,fifo_read_0}),
        .BaseX_Rx_Phy_Rden({1'b1,1'b1,1'b1,1'b1}),
        .BaseX_Rx_Pll_Clk(rx_pll_clk_out),
        .BaseX_Rx_Q_CombOut(NLW_gen_io_logic_BaseX_Rx_Q_CombOut_UNCONNECTED[6:0]),
        .BaseX_Rx_Q_Out({NLW_gen_io_logic_BaseX_Rx_Q_Out_UNCONNECTED[27:8],BaseX_Rx_Q_Out}),
        .BaseX_Rx_Rst_Dly(rx_rst_dly_out),
        .BaseX_Rx_Vtc_Rdy(Rx_Vtc_Rdy_Int),
        .BaseX_TriOdly_Ce(1'b0),
        .BaseX_TriOdly_CntValueIn({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BaseX_TriOdly_CntValueOut(NLW_gen_io_logic_BaseX_TriOdly_CntValueOut_UNCONNECTED[8:0]),
        .BaseX_TriOdly_Inc(1'b0),
        .BaseX_TriOdly_Load(1'b0),
        .BaseX_Tx_Bs_En_Vtc(tx_bs_en_vtc_out),
        .BaseX_Tx_Bs_Rst(tx_bs_rst_out),
        .BaseX_Tx_Bsc_En_Vtc(tx_bsc_en_vtc_out),
        .BaseX_Tx_Bsc_Rst(tx_bsc_rst_out),
        .BaseX_Tx_D_In({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,BaseX_Tx_D_In,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BaseX_Tx_Data_Out({NLW_gen_io_logic_BaseX_Tx_Data_Out_UNCONNECTED[5],BaseX_Tx_Data_Out,NLW_gen_io_logic_BaseX_Tx_Data_Out_UNCONNECTED[3:0]}),
        .BaseX_Tx_Dly_Rdy(Tx_Dly_Rdy_Int),
        .BaseX_Tx_Phy_Rden({1'b0,1'b0,1'b0,1'b0}),
        .BaseX_Tx_Pll_Clk(tx_pll_clk_out),
        .BaseX_Tx_Rst_Dly(tx_rst_dly_out),
        .BaseX_Tx_T_In({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BaseX_Tx_TbyteIn({1'b0,1'b0,1'b0,1'b0}),
        .BaseX_Tx_Tri_Out(NLW_gen_io_logic_BaseX_Tx_Tri_Out_UNCONNECTED[5:0]),
        .BaseX_Tx_Vtc_Rdy(Tx_Vtc_Rdy_Int),
        .Tx_RdClk(CLK));
  LUT2 #(
    .INIT(4'hE)) 
    gen_io_logic_i_1
       (.I0(\serdes_1_to_10_i/FifoRd_2__0 ),
        .I1(\serdes_1_to_10_i/FifoRd_3__0 ),
        .O(fifo_read_0));
  (* B_SHIFTER_ADDR = "10'b0101001110" *) 
  (* C_1588 = "0" *) 
  (* C_2_5G = "FALSE" *) 
  (* C_COMPONENT_NAME = "design_1_gig_ethernet_pcs_pma_0_0" *) 
  (* C_DYNAMIC_SWITCHING = "FALSE" *) 
  (* C_ELABORATION_TRANSIENT_DIR = "BlankString" *) 
  (* C_FAMILY = "kintexuplus" *) 
  (* C_HAS_AN = "TRUE" *) 
  (* C_HAS_AXIL = "FALSE" *) 
  (* C_HAS_MDIO = "TRUE" *) 
  (* C_HAS_TEMAC = "TRUE" *) 
  (* C_IS_SGMII = "TRUE" *) 
  (* C_RX_GMII_CLK = "TXOUTCLK" *) 
  (* C_SGMII_FABRIC_BUFFER = "TRUE" *) 
  (* C_SGMII_PHY_MODE = "FALSE" *) 
  (* C_USE_LVDS = "TRUE" *) 
  (* C_USE_TBI = "FALSE" *) 
  (* C_USE_TRANSCEIVER = "FALSE" *) 
  (* GT_RX_BYTE_WIDTH = "1" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  design_1_gig_ethernet_pcs_pma_0_0_gig_ethernet_pcs_pma_v16_1_3 \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core 
       (.an_adv_config_val(1'b0),
        .an_adv_config_vector({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .an_enable(\NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core_an_enable_UNCONNECTED ),
        .an_interrupt(an_interrupt_0),
        .an_restart_config(an_restart_config_0),
        .basex_or_sgmii(1'b0),
        .configuration_valid(configuration_valid_0),
        .configuration_vector(configuration_vector_0),
        .correction_timer({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dcm_locked(1'b0),
        .drp_daddr(\NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core_drp_daddr_UNCONNECTED [9:0]),
        .drp_dclk(1'b0),
        .drp_den(\NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core_drp_den_UNCONNECTED ),
        .drp_di(\NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core_drp_di_UNCONNECTED [15:0]),
        .drp_do({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .drp_drdy(1'b0),
        .drp_dwe(\NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core_drp_dwe_UNCONNECTED ),
        .drp_gnt(1'b0),
        .drp_req(\NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core_drp_req_UNCONNECTED ),
        .en_cdet(\NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core_en_cdet_UNCONNECTED ),
        .enablealign(\NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core_enablealign_UNCONNECTED ),
        .ewrap(\NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core_ewrap_UNCONNECTED ),
        .gmii_isolate(gmii_isolate_0),
        .gmii_rx_dv(gmii_rx_dv_int),
        .gmii_rx_er(gmii_rx_er_int),
        .gmii_rxd(gmii_rxd_int),
        .gmii_tx_en(gmii_tx_en_int),
        .gmii_tx_er(gmii_tx_er_int),
        .gmii_txd(gmii_txd_int),
        .gtx_clk(1'b0),
        .link_timer_basex({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .link_timer_sgmii({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .link_timer_value({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .loc_ref(\NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core_loc_ref_UNCONNECTED ),
        .mdc(mdc_0),
        .mdio_in(mdio_i_0),
        .mdio_out(p_0_in_0),
        .mdio_tri(mdio_t_0),
        .mgt_rx_reset(mgt_rx_reset),
        .mgt_tx_reset(mgt_tx_reset_0),
        .phyad(phyaddr_0),
        .pma_rx_clk0(1'b0),
        .pma_rx_clk1(1'b0),
        .powerdown(\NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core_powerdown_UNCONNECTED ),
        .reset(reset_out),
        .reset_done(1'b0),
        .rx_code_group0({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rx_code_group1({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rx_gt_nominal_latency({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b0,1'b0,1'b1,1'b0,1'b0,1'b0}),
        .rxbufstatus({rxbuferr,1'b0}),
        .rxchariscomma(rxchariscomma),
        .rxcharisk(rxcharisk),
        .rxclkcorcnt({rxclkcorcnt[2],1'b0,rxclkcorcnt[0]}),
        .rxdata(rxdata),
        .rxdisperr(rxdisperr),
        .rxnotintable(rxnotintable),
        .rxphy_correction_timer(\NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core_rxphy_correction_timer_UNCONNECTED [63:0]),
        .rxphy_ns_field(\NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core_rxphy_ns_field_UNCONNECTED [31:0]),
        .rxphy_s_field(\NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core_rxphy_s_field_UNCONNECTED [47:0]),
        .rxrecclk(1'b0),
        .rxrundisp(rxrundisp),
        .s_axi_aclk(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(\NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core_s_axi_arready_UNCONNECTED ),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(\NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core_s_axi_awready_UNCONNECTED ),
        .s_axi_awvalid(1'b0),
        .s_axi_bready(1'b0),
        .s_axi_bresp(\NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core_s_axi_bresp_UNCONNECTED [1:0]),
        .s_axi_bvalid(\NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core_s_axi_bvalid_UNCONNECTED ),
        .s_axi_rdata(\NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core_s_axi_rdata_UNCONNECTED [31:0]),
        .s_axi_resetn(1'b0),
        .s_axi_rready(1'b0),
        .s_axi_rresp(\NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core_s_axi_rresp_UNCONNECTED [1:0]),
        .s_axi_rvalid(\NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core_s_axi_rvalid_UNCONNECTED ),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wready(\NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core_s_axi_wready_UNCONNECTED ),
        .s_axi_wvalid(1'b0),
        .signal_detect(signal_detect_0),
        .speed_is_100(1'b0),
        .speed_is_10_100(1'b0),
        .speed_selection(\NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core_speed_selection_UNCONNECTED [1:0]),
        .status_vector({\NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core_status_vector_UNCONNECTED [15:14],status_vector_0[12:8],\NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core_status_vector_UNCONNECTED [8],status_vector_0[7:0]}),
        .systemtimer_ns_field({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .systemtimer_s_field({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .tx_code_group(\NLW_gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core_tx_code_group_UNCONNECTED [9:0]),
        .txbuferr(1'b0),
        .txchardispmode(txchardispmode),
        .txchardispval(txchardispval),
        .txcharisk(txcharisk),
        .txdata(txdata),
        .userclk(1'b0),
        .userclk2(Tx_WrClk));
  design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_lvds_transceiver \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst 
       (.ActCnt_GE_HalfBT(\serdes_1_to_10_i/ActCnt_GE_HalfBT ),
        .ActiveIsSlve(\serdes_1_to_10_i/ActiveIsSlve ),
        .ActiveIsSlve_reg(Slve_Load_i_1_n_0),
        .ActiveIsSlve_reg_0(Mstr_Load_i_1_n_0),
        .Aligned(\serdes_1_to_10_i/Aligned ),
        .BaseX_Idly_Load({sload,mload}),
        .BaseX_Rx_Fifo_Empty(fifo_empty[0]),
        .BaseX_Rx_Q_Out(BaseX_Rx_Q_Out),
        .CLK(CLK),
        .D(\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_24 ),
        .FifoRd_0({\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_36 ,\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_37 ,\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_38 ,\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_39 ,\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_40 ,\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_41 ,\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_42 ,\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_43 }),
        .FifoRd_2__0(\serdes_1_to_10_i/FifoRd_2__0 ),
        .FifoRd_3__0(\serdes_1_to_10_i/FifoRd_3__0 ),
        .\IntActTx_TByteinPip_reg[0] (BaseX_Tx_D_In),
        .\IntRdEna_Sync_reg[0] (\gb_out_inst/IntRdEna ),
        .\IntWrAddr_reg[2] (IntRdEna_i_1_n_0),
        .LossOfSignal(\serdes_1_to_10_i/LossOfSignal ),
        .LossOfSignal_reg(\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_97 ),
        .LossOfSignal_reg_0(\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_99 ),
        .LossOfSignal_reg_1(LossOfSignal_i_1_n_0),
        .\Mstr_CntValIn_Out_reg[0] (\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_67 ),
        .\Mstr_CntValIn_Out_reg[1] (\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_66 ),
        .\Mstr_CntValIn_Out_reg[2] (\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_58 ),
        .\Mstr_Load_dly_reg[0] (\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_25 ),
        .Mstr_Load_reg(\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_92 ),
        .Mstr_Load_reg_0(\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_93 ),
        .Mstr_Load_reg_1(\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_102 ),
        .Q(\gb_out_inst/IntWrAddr_reg ),
        .\Rx_BtVal_0_reg[8] (D),
        .Rx_SysClk(Rx_SysClk),
        .Rx_Valid_Int_reg(Aligned_i_1_n_0),
        .\Slve_CntValIn_Out_reg[1] ({\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_52 ,\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_53 ,\serdes_1_to_10_i/p_0_in ,\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_55 ,\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_56 ,\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_57 }),
        .\Slve_CntValIn_Out_reg[1]_0 (\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_104 ),
        .\Slve_CntValIn_Out_reg[8] ({\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_59 ,\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_60 ,\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_61 ,\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_62 ,\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_63 ,\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_64 ,\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_65 }),
        .\Slve_CntValIn_Out_reg[8]_0 (\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_96 ),
        .Tx_WrClk(Tx_WrClk),
        .\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISCOMMA_INT_reg (rxchariscomma),
        .\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISK_INT_reg (rxcharisk),
        .\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg[7] (rxdata),
        .WrapToZero(\serdes_1_to_10_i/WrapToZero ),
        .WrapToZero_reg(monitor_late_i_1_n_0),
        .\act_count_reg[0] (\serdes_1_to_10_i/act_count_reg ),
        .\act_count_reg[1] (\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_98 ),
        .al_rx_valid_out(al_rx_valid_out),
        .\d21p5_wr_pipe_reg[2]_pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_1 (\gen_lvds_transceiver.gen_lvds_transceiver_logic_gate__0_n_0 ),
        .\d21p5_wr_pipe_reg[3] (\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_3 ),
        .\d2p2_wr_pipe_reg[2]_pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_1 (\gen_lvds_transceiver.gen_lvds_transceiver_logic_gate_n_0 ),
        .\d2p2_wr_pipe_reg[3] (\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_1 ),
        .data_out(\rx_elastic_buffer_inst/initialize_ram_complete_sync ),
        .\holdreg_reg[1] (\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_28 ),
        .\holdreg_reg[1]_0 (\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_29 ),
        .\initialize_counter_reg[0] (\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_101 ),
        .initialize_ram_complete(\rx_elastic_buffer_inst/initialize_ram_complete ),
        .initialize_ram_complete_pulse(\rx_elastic_buffer_inst/initialize_ram_complete_pulse ),
        .initialize_ram_complete_reg(initialize_ram_complete_i_1_n_0),
        .initialize_ram_complete_reg_0(\wr_addr[6]_i_2_n_0 ),
        .initialize_ram_complete_sync_reg1(\rx_elastic_buffer_inst/initialize_ram_complete_sync_reg1 ),
        .initialize_ram_complete_sync_ris_edg0(\rx_elastic_buffer_inst/initialize_ram_complete_sync_ris_edg0 ),
        .insert3_reg(\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_103 ),
        .mgt_rx_reset(mgt_rx_reset),
        .monitor_late_reg(\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_27 ),
        .monitor_late_reg_0(\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_94 ),
        .\mpx_reg[0] (\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_100 ),
        .\mpx_reg[1] (\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_49 ),
        .\mpx_reg[1]_0 (\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_50 ),
        .\mpx_reg[3] (\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_51 ),
        .\pd_count_reg[0] (\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_95 ),
        .\pd_count_reg[3] (pd_ovflw_down_i_1_n_0),
        .\pd_count_reg[4] (\serdes_1_to_10_i/pd_count ),
        .\pd_count_reg[4]_0 (pd_ovflw_up_i_1_n_0),
        .\rd_occupancy_reg[2] (rxbuferr_i_1_n_0),
        .remove_idle(\rx_elastic_buffer_inst/remove_idle ),
        .remove_idle_reg2_reg(\rx_elastic_buffer_inst/remove_idle_reg ),
        .reset_out(reset_out),
        .rxbuferr_reg(\rx_elastic_buffer_inst/rd_occupancy ),
        .rxbuferr_reg_0(\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_105 ),
        .rxbuferr_reg_1(\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_106 ),
        .rxbufstatus(rxbuferr),
        .rxclkcorcnt({rxclkcorcnt[2],rxclkcorcnt[0]}),
        .\rxdh_reg[0] (\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_33 ),
        .rxdisperr(rxdisperr),
        .rxnotintable(rxnotintable),
        .rxrecreset0(rxrecreset0),
        .rxrundisp(rxrundisp),
        .\s_state_reg[0] (\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_30 ),
        .\s_state_reg[0]_0 (\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_31 ),
        .\s_state_reg[3] (ActiveIsSlve_i_1_n_0),
        .\s_state_reg[3]_0 (insert5_i_1_n_0),
        .\s_state_reg[4] (WrapToZero_i_1_n_0),
        .\s_state_reg[4]_0 (insert3_i_1_n_0),
        .txchardispmode(txchardispmode),
        .txchardispval(txchardispval),
        .txcharisk(txcharisk),
        .txdata(txdata));
  design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_sgmii_adapt \gen_lvds_transceiver.gen_lvds_transceiver_logic[0].sgmii_logic 
       (.Tx_WrClk(Tx_WrClk),
        .gmii_rx_dv(gmii_rx_dv_int),
        .gmii_rx_dv_0(gmii_rx_dv_0),
        .gmii_rx_er_0(gmii_rx_er_0),
        .gmii_rx_er_in(gmii_rx_er_int),
        .gmii_rxd(gmii_rxd_int),
        .gmii_rxd_0(gmii_rxd_0),
        .gmii_tx_en_0(gmii_tx_en_0),
        .gmii_tx_en_out(gmii_tx_en_int),
        .gmii_tx_er_0(gmii_tx_er_0),
        .gmii_tx_er_out(gmii_tx_er_int),
        .gmii_txd_0(gmii_txd_0),
        .gmii_txd_out(gmii_txd_int),
        .mgt_tx_reset(mgt_tx_reset_0),
        .sgmii_clk_en(sgmii_clk_en_0),
        .sgmii_clk_f_0(sgmii_clk_f_0),
        .sgmii_clk_r_0(sgmii_clk_r_0),
        .speed_is_100_0(speed_is_100_0),
        .speed_is_10_100_0(speed_is_10_100_0));
  (* SOFT_HLUTNM = "soft_lutpair184" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \gen_lvds_transceiver.gen_lvds_transceiver_logic_gate 
       (.I0(\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_1 ),
        .I1(\gen_lvds_transceiver.gen_lvds_transceiver_logic_r_1_n_0 ),
        .O(\gen_lvds_transceiver.gen_lvds_transceiver_logic_gate_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair184" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \gen_lvds_transceiver.gen_lvds_transceiver_logic_gate__0 
       (.I0(\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_3 ),
        .I1(\gen_lvds_transceiver.gen_lvds_transceiver_logic_r_1_n_0 ),
        .O(\gen_lvds_transceiver.gen_lvds_transceiver_logic_gate__0_n_0 ));
  FDRE \gen_lvds_transceiver.gen_lvds_transceiver_logic_r 
       (.C(Rx_SysClk),
        .CE(al_rx_valid_out),
        .D(1'b1),
        .Q(\gen_lvds_transceiver.gen_lvds_transceiver_logic_r_n_0 ),
        .R(rxrecreset0));
  FDRE \gen_lvds_transceiver.gen_lvds_transceiver_logic_r_0 
       (.C(Rx_SysClk),
        .CE(al_rx_valid_out),
        .D(\gen_lvds_transceiver.gen_lvds_transceiver_logic_r_n_0 ),
        .Q(\gen_lvds_transceiver.gen_lvds_transceiver_logic_r_0_n_0 ),
        .R(rxrecreset0));
  FDRE \gen_lvds_transceiver.gen_lvds_transceiver_logic_r_1 
       (.C(Rx_SysClk),
        .CE(al_rx_valid_out),
        .D(\gen_lvds_transceiver.gen_lvds_transceiver_logic_r_0_n_0 ),
        .Q(\gen_lvds_transceiver.gen_lvds_transceiver_logic_r_1_n_0 ),
        .R(rxrecreset0));
  LUT2 #(
    .INIT(4'hE)) 
    initialize_ram_complete_i_1
       (.I0(\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_101 ),
        .I1(\rx_elastic_buffer_inst/initialize_ram_complete ),
        .O(initialize_ram_complete_i_1_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    initialize_ram_complete_sync_ris_edg_i_1
       (.I0(\rx_elastic_buffer_inst/initialize_ram_complete_sync ),
        .I1(\rx_elastic_buffer_inst/initialize_ram_complete_sync_reg1 ),
        .O(\rx_elastic_buffer_inst/initialize_ram_complete_sync_ris_edg0 ));
  LUT6 #(
    .INIT(64'hFFFFF5F50020A0A0)) 
    insert3_i_1
       (.I0(\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_103 ),
        .I1(\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_53 ),
        .I2(\serdes_1_to_10_i/p_0_in ),
        .I3(\serdes_1_to_10_i/WrapToZero ),
        .I4(\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_55 ),
        .I5(\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_29 ),
        .O(insert3_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFD5D500808080)) 
    insert5_i_1
       (.I0(\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_103 ),
        .I1(\serdes_1_to_10_i/p_0_in ),
        .I2(\serdes_1_to_10_i/WrapToZero ),
        .I3(\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_53 ),
        .I4(\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_55 ),
        .I5(\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_28 ),
        .O(insert5_i_1_n_0));
  LUT3 #(
    .INIT(8'hB8)) 
    mdio_o_0_INST_0
       (.I0(ext_mdio_i_0),
        .I1(mdio_t_0),
        .I2(p_0_in_0),
        .O(mdio_o_0));
  LUT5 #(
    .INIT(32'h8BFF8B00)) 
    monitor_late_i_1
       (.I0(\serdes_1_to_10_i/WrapToZero ),
        .I1(\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_53 ),
        .I2(\serdes_1_to_10_i/ActCnt_GE_HalfBT ),
        .I3(\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_94 ),
        .I4(\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_27 ),
        .O(monitor_late_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFF11111113)) 
    pd_ovflw_down_i_1
       (.I0(\serdes_1_to_10_i/pd_count [3]),
        .I1(\serdes_1_to_10_i/pd_count [4]),
        .I2(\serdes_1_to_10_i/pd_count [1]),
        .I3(\serdes_1_to_10_i/pd_count [0]),
        .I4(\serdes_1_to_10_i/pd_count [2]),
        .I5(\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_30 ),
        .O(pd_ovflw_down_i_1_n_0));
  LUT3 #(
    .INIT(8'hF8)) 
    pd_ovflw_up_i_1
       (.I0(\serdes_1_to_10_i/pd_count [4]),
        .I1(\serdes_1_to_10_i/pd_count [3]),
        .I2(\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_31 ),
        .O(pd_ovflw_up_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFC0020002)) 
    rxbuferr_i_1
       (.I0(\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_105 ),
        .I1(\rx_elastic_buffer_inst/rd_occupancy [2]),
        .I2(\rx_elastic_buffer_inst/rd_occupancy [3]),
        .I3(\rx_elastic_buffer_inst/rd_occupancy [4]),
        .I4(\gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst_n_106 ),
        .I5(rxbuferr),
        .O(rxbuferr_i_1_n_0));
  LUT5 #(
    .INIT(32'hFFFF5575)) 
    \wr_addr[6]_i_2 
       (.I0(\rx_elastic_buffer_inst/initialize_ram_complete ),
        .I1(\rx_elastic_buffer_inst/remove_idle ),
        .I2(al_rx_valid_out),
        .I3(\rx_elastic_buffer_inst/remove_idle_reg ),
        .I4(\rx_elastic_buffer_inst/initialize_ram_complete_pulse ),
        .O(\wr_addr[6]_i_2_n_0 ));
endmodule

(* ORIG_REF_NAME = "design_1_gig_ethernet_pcs_pma_0_0_clk_gen" *) 
module design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_clk_gen
   (sgmii_clk_r_0,
    sgmii_clk_en_0,
    sgmii_clk_f_0,
    Tx_WrClk,
    reset_out,
    data_out,
    data_sync_reg6);
  output sgmii_clk_r_0;
  output sgmii_clk_en_0;
  output sgmii_clk_f_0;
  input Tx_WrClk;
  input reset_out;
  input data_out;
  input data_sync_reg6;

  wire Tx_WrClk;
  wire clk12_5;
  wire clk12_5_reg;
  wire clk1_25;
  wire clk1_25_reg;
  wire clk_div_stage1_n_3;
  wire clk_en;
  wire clk_en0;
  wire clk_en_12_5_fall;
  wire clk_en_12_5_fall0;
  wire clk_en_1_25_fall;
  wire clk_en_1_25_fall0;
  wire data_out;
  wire data_sync_reg6;
  wire reset_fall;
  wire reset_out;
  wire sgmii_clk_en_0;
  wire sgmii_clk_en_i_1_n_0;
  wire sgmii_clk_f_0;
  wire sgmii_clk_r0_out;
  wire sgmii_clk_r_0;
  wire speed_is_100_fall;
  wire speed_is_10_100_fall;

  FDRE clk12_5_reg_reg
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(clk12_5),
        .Q(clk12_5_reg),
        .R(reset_out));
  FDRE clk1_25_reg_reg
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(clk1_25),
        .Q(clk1_25_reg),
        .R(reset_out));
  design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_johnson_cntr clk_div_stage1
       (.Tx_WrClk(Tx_WrClk),
        .clk12_5(clk12_5),
        .clk12_5_reg(clk12_5_reg),
        .clk1_25(clk1_25),
        .clk_en0(clk_en0),
        .clk_en_12_5_fall0(clk_en_12_5_fall0),
        .reset_fall(reset_fall),
        .reset_out(reset_out),
        .sgmii_clk_f_reg(clk_div_stage1_n_3),
        .speed_is_100_fall(speed_is_100_fall),
        .speed_is_10_100_fall(speed_is_10_100_fall));
  design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_johnson_cntr_2 clk_div_stage2
       (.Tx_WrClk(Tx_WrClk),
        .clk12_5(clk12_5),
        .clk1_25(clk1_25),
        .clk1_25_reg(clk1_25_reg),
        .clk_en(clk_en),
        .clk_en_1_25_fall0(clk_en_1_25_fall0),
        .data_out(data_out),
        .data_sync_reg6(data_sync_reg6),
        .reset_out(reset_out),
        .sgmii_clk_r0_out(sgmii_clk_r0_out));
  FDRE clk_en_12_5_fall_reg
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(clk_en_12_5_fall0),
        .Q(clk_en_12_5_fall),
        .R(reset_out));
  FDRE clk_en_12_5_rise_reg
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(clk_en0),
        .Q(clk_en),
        .R(reset_out));
  FDRE clk_en_1_25_fall_reg
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(clk_en_1_25_fall0),
        .Q(clk_en_1_25_fall),
        .R(reset_out));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    reset_fall_reg
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(reset_out),
        .Q(reset_fall),
        .R(1'b0));
  LUT4 #(
    .INIT(16'hE2FF)) 
    sgmii_clk_en_i_1
       (.I0(clk_en_1_25_fall),
        .I1(data_out),
        .I2(clk_en_12_5_fall),
        .I3(data_sync_reg6),
        .O(sgmii_clk_en_i_1_n_0));
  FDRE sgmii_clk_en_reg
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(sgmii_clk_en_i_1_n_0),
        .Q(sgmii_clk_en_0),
        .R(reset_out));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    sgmii_clk_f_reg
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(clk_div_stage1_n_3),
        .Q(sgmii_clk_f_0),
        .R(1'b0));
  FDRE sgmii_clk_r_reg
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(sgmii_clk_r0_out),
        .Q(sgmii_clk_r_0),
        .R(reset_out));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    speed_is_100_fall_reg
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(data_out),
        .Q(speed_is_100_fall),
        .R(1'b0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    speed_is_10_100_fall_reg
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(data_sync_reg6),
        .Q(speed_is_10_100_fall),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "design_1_gig_ethernet_pcs_pma_0_0_decode_8b10b_lut_base" *) 
module design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_decode_8b10b_lut_base
   (D,
    E,
    k,
    Rx_SysClk,
    code_err_i,
    \grdni.run_disp_i_reg_0 ,
    \grdni.run_disp_i_reg_1 ,
    b3,
    out);
  output [11:0]D;
  input [0:0]E;
  input k;
  input Rx_SysClk;
  input code_err_i;
  input \grdni.run_disp_i_reg_0 ;
  input \grdni.run_disp_i_reg_1 ;
  input [7:5]b3;
  input [4:0]out;

  wire [11:0]D;
  wire [0:0]E;
  wire Rx_SysClk;
  wire [7:5]b3;
  wire code_err_i;
  wire \grdni.run_disp_i_reg_0 ;
  wire \grdni.run_disp_i_reg_1 ;
  wire k;
  wire [4:0]out;

  FDRE #(
    .INIT(1'b0)) 
    \dout_i_reg[0] 
       (.C(Rx_SysClk),
        .CE(E),
        .D(out[0]),
        .Q(D[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dout_i_reg[1] 
       (.C(Rx_SysClk),
        .CE(E),
        .D(out[1]),
        .Q(D[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dout_i_reg[2] 
       (.C(Rx_SysClk),
        .CE(E),
        .D(out[2]),
        .Q(D[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dout_i_reg[3] 
       (.C(Rx_SysClk),
        .CE(E),
        .D(out[3]),
        .Q(D[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dout_i_reg[4] 
       (.C(Rx_SysClk),
        .CE(E),
        .D(out[4]),
        .Q(D[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dout_i_reg[5] 
       (.C(Rx_SysClk),
        .CE(E),
        .D(b3[5]),
        .Q(D[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dout_i_reg[6] 
       (.C(Rx_SysClk),
        .CE(E),
        .D(b3[6]),
        .Q(D[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \dout_i_reg[7] 
       (.C(Rx_SysClk),
        .CE(E),
        .D(b3[7]),
        .Q(D[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gcerr.CODE_ERR_reg 
       (.C(Rx_SysClk),
        .CE(E),
        .D(code_err_i),
        .Q(D[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gde.gdeni.DISP_ERR_reg 
       (.C(Rx_SysClk),
        .CE(E),
        .D(\grdni.run_disp_i_reg_1 ),
        .Q(D[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \grdni.run_disp_i_reg 
       (.C(Rx_SysClk),
        .CE(E),
        .D(\grdni.run_disp_i_reg_0 ),
        .Q(D[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    kout_i_reg
       (.C(Rx_SysClk),
        .CE(E),
        .D(k),
        .Q(D[11]),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "design_1_gig_ethernet_pcs_pma_0_0_encode_8b10b_lut_base" *) 
module design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_encode_8b10b_lut_base
   (tx_data_10b,
    Tx_WrClk,
    txchardispval,
    txchardispmode,
    txdata,
    txcharisk);
  output [9:0]tx_data_10b;
  input Tx_WrClk;
  input txchardispval;
  input txchardispmode;
  input [7:0]txdata;
  input txcharisk;

  wire \DOUT[0]_i_1_n_0 ;
  wire \DOUT[1]_i_1_n_0 ;
  wire \DOUT[2]_i_1_n_0 ;
  wire \DOUT[3]_i_1_n_0 ;
  wire \DOUT[4]_i_1_n_0 ;
  wire \DOUT[5]_i_1_n_0 ;
  wire \DOUT[5]_i_2_n_0 ;
  wire \DOUT[9]_i_2_n_0 ;
  wire \DOUT[9]_i_6_n_0 ;
  wire \DOUT[9]_i_7_n_0 ;
  wire \DOUT[9]_i_8_n_0 ;
  wire Tx_WrClk;
  wire [3:0]b4;
  wire [5:0]b6;
  wire disp_in_i__0;
  wire k28;
  wire \ngdb.disp_run_reg_n_0 ;
  wire pdes4;
  wire pdes6__13;
  wire [9:0]tx_data_10b;
  wire txchardispmode;
  wire txchardispval;
  wire txcharisk;
  wire [7:0]txdata;

  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \DOUT[0]_i_1 
       (.I0(txchardispval),
        .I1(txchardispmode),
        .I2(\ngdb.disp_run_reg_n_0 ),
        .I3(k28),
        .I4(b6[0]),
        .O(\DOUT[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2D807F017F01FE4B)) 
    \DOUT[0]_i_2 
       (.I0(txdata[3]),
        .I1(txdata[4]),
        .I2(disp_in_i__0),
        .I3(txdata[0]),
        .I4(txdata[1]),
        .I5(txdata[2]),
        .O(b6[0]));
  (* SOFT_HLUTNM = "soft_lutpair85" *) 
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \DOUT[1]_i_1 
       (.I0(txchardispval),
        .I1(txchardispmode),
        .I2(\ngdb.disp_run_reg_n_0 ),
        .I3(k28),
        .I4(b6[1]),
        .O(\DOUT[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h987170F170F171E6)) 
    \DOUT[1]_i_2 
       (.I0(txdata[0]),
        .I1(disp_in_i__0),
        .I2(txdata[1]),
        .I3(txdata[2]),
        .I4(txdata[4]),
        .I5(txdata[3]),
        .O(b6[1]));
  (* SOFT_HLUTNM = "soft_lutpair87" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \DOUT[2]_i_1 
       (.I0(b6[2]),
        .I1(k28),
        .O(\DOUT[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h47807F09BF01FE16)) 
    \DOUT[2]_i_2 
       (.I0(txdata[4]),
        .I1(txdata[3]),
        .I2(txdata[1]),
        .I3(txdata[2]),
        .I4(txdata[0]),
        .I5(disp_in_i__0),
        .O(b6[2]));
  (* SOFT_HLUTNM = "soft_lutpair86" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \DOUT[3]_i_1 
       (.I0(b6[3]),
        .I1(k28),
        .O(\DOUT[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hB44C4CCD4CCDCED1)) 
    \DOUT[3]_i_2 
       (.I0(txdata[4]),
        .I1(txdata[3]),
        .I2(txdata[0]),
        .I3(disp_in_i__0),
        .I4(txdata[1]),
        .I5(txdata[2]),
        .O(b6[3]));
  (* SOFT_HLUTNM = "soft_lutpair86" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \DOUT[4]_i_1 
       (.I0(b6[4]),
        .I1(k28),
        .O(\DOUT[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h1F6F08107FEF9061)) 
    \DOUT[4]_i_2 
       (.I0(txdata[2]),
        .I1(txdata[1]),
        .I2(disp_in_i__0),
        .I3(txdata[0]),
        .I4(txdata[4]),
        .I5(txdata[3]),
        .O(b6[4]));
  LUT4 #(
    .INIT(16'h02A2)) 
    \DOUT[5]_i_1 
       (.I0(k28),
        .I1(\ngdb.disp_run_reg_n_0 ),
        .I2(txchardispmode),
        .I3(txchardispval),
        .O(\DOUT[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair87" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \DOUT[5]_i_2 
       (.I0(b6[5]),
        .I1(k28),
        .O(\DOUT[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h59969660A117177F)) 
    \DOUT[5]_i_3 
       (.I0(txdata[3]),
        .I1(txdata[4]),
        .I2(txdata[2]),
        .I3(txdata[1]),
        .I4(txdata[0]),
        .I5(disp_in_i__0),
        .O(b6[5]));
  LUT6 #(
    .INIT(64'h8F8F0000B0BFFF0F)) 
    \DOUT[6]_i_1 
       (.I0(\DOUT[9]_i_2_n_0 ),
        .I1(txdata[7]),
        .I2(txdata[6]),
        .I3(k28),
        .I4(txdata[5]),
        .I5(pdes6__13),
        .O(b4[0]));
  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT5 #(
    .INIT(32'h5B5B0D58)) 
    \DOUT[7]_i_1 
       (.I0(txdata[5]),
        .I1(k28),
        .I2(pdes6__13),
        .I3(txdata[7]),
        .I4(txdata[6]),
        .O(b4[1]));
  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT5 #(
    .INIT(32'h66AA9A59)) 
    \DOUT[8]_i_1 
       (.I0(txdata[7]),
        .I1(txdata[6]),
        .I2(k28),
        .I3(txdata[5]),
        .I4(pdes6__13),
        .O(b4[2]));
  LUT6 #(
    .INIT(64'h737330304C43CF3F)) 
    \DOUT[9]_i_1 
       (.I0(\DOUT[9]_i_2_n_0 ),
        .I1(txdata[7]),
        .I2(txdata[6]),
        .I3(k28),
        .I4(txdata[5]),
        .I5(pdes6__13),
        .O(b4[3]));
  LUT6 #(
    .INIT(64'h727272727272728D)) 
    \DOUT[9]_i_2 
       (.I0(k28),
        .I1(disp_in_i__0),
        .I2(\DOUT[9]_i_6_n_0 ),
        .I3(\DOUT[9]_i_7_n_0 ),
        .I4(\DOUT[9]_i_8_n_0 ),
        .I5(txcharisk),
        .O(\DOUT[9]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0020000000000000)) 
    \DOUT[9]_i_3 
       (.I0(txdata[2]),
        .I1(txdata[1]),
        .I2(txcharisk),
        .I3(txdata[0]),
        .I4(txdata[3]),
        .I5(txdata[4]),
        .O(k28));
  LUT5 #(
    .INIT(32'h303FAAAA)) 
    \DOUT[9]_i_4 
       (.I0(\DOUT[9]_i_6_n_0 ),
        .I1(txchardispval),
        .I2(txchardispmode),
        .I3(\ngdb.disp_run_reg_n_0 ),
        .I4(k28),
        .O(pdes6__13));
  (* SOFT_HLUTNM = "soft_lutpair85" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \DOUT[9]_i_5 
       (.I0(txchardispval),
        .I1(txchardispmode),
        .I2(\ngdb.disp_run_reg_n_0 ),
        .O(disp_in_i__0));
  LUT6 #(
    .INIT(64'h56696AA96AA9A995)) 
    \DOUT[9]_i_6 
       (.I0(disp_in_i__0),
        .I1(txdata[2]),
        .I2(txdata[1]),
        .I3(txdata[0]),
        .I4(txdata[4]),
        .I5(txdata[3]),
        .O(\DOUT[9]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h0040400040000000)) 
    \DOUT[9]_i_7 
       (.I0(txdata[4]),
        .I1(disp_in_i__0),
        .I2(txdata[3]),
        .I3(txdata[2]),
        .I4(txdata[0]),
        .I5(txdata[1]),
        .O(\DOUT[9]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h0000000400040400)) 
    \DOUT[9]_i_8 
       (.I0(disp_in_i__0),
        .I1(txdata[4]),
        .I2(txdata[3]),
        .I3(txdata[2]),
        .I4(txdata[0]),
        .I5(txdata[1]),
        .O(\DOUT[9]_i_8_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \DOUT_reg[0] 
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(\DOUT[0]_i_1_n_0 ),
        .Q(tx_data_10b[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DOUT_reg[1] 
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(\DOUT[1]_i_1_n_0 ),
        .Q(tx_data_10b[1]),
        .R(1'b0));
  FDSE #(
    .INIT(1'b0)) 
    \DOUT_reg[2] 
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(\DOUT[2]_i_1_n_0 ),
        .Q(tx_data_10b[2]),
        .S(\DOUT[5]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \DOUT_reg[3] 
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(\DOUT[3]_i_1_n_0 ),
        .Q(tx_data_10b[3]),
        .S(\DOUT[5]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \DOUT_reg[4] 
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(\DOUT[4]_i_1_n_0 ),
        .Q(tx_data_10b[4]),
        .S(\DOUT[5]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \DOUT_reg[5] 
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(\DOUT[5]_i_2_n_0 ),
        .Q(tx_data_10b[5]),
        .S(\DOUT[5]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \DOUT_reg[6] 
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(b4[0]),
        .Q(tx_data_10b[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DOUT_reg[7] 
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(b4[1]),
        .Q(tx_data_10b[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DOUT_reg[8] 
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(b4[2]),
        .Q(tx_data_10b[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DOUT_reg[9] 
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(b4[3]),
        .Q(tx_data_10b[9]),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h7C83)) 
    \ngdb.disp_run_i_1 
       (.I0(txdata[7]),
        .I1(txdata[6]),
        .I2(txdata[5]),
        .I3(pdes6__13),
        .O(pdes4));
  FDRE #(
    .INIT(1'b1)) 
    \ngdb.disp_run_reg 
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(pdes4),
        .Q(\ngdb.disp_run_reg_n_0 ),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "design_1_gig_ethernet_pcs_pma_0_0_johnson_cntr" *) 
module design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_johnson_cntr
   (clk12_5,
    clk_en_12_5_fall0,
    clk_en0,
    sgmii_clk_f_reg,
    Tx_WrClk,
    reset_out,
    clk12_5_reg,
    speed_is_10_100_fall,
    speed_is_100_fall,
    clk1_25,
    reset_fall);
  output clk12_5;
  output clk_en_12_5_fall0;
  output clk_en0;
  output sgmii_clk_f_reg;
  input Tx_WrClk;
  input reset_out;
  input clk12_5_reg;
  input speed_is_10_100_fall;
  input speed_is_100_fall;
  input clk1_25;
  input reset_fall;

  wire Tx_WrClk;
  wire clk12_5;
  wire clk12_5_reg;
  wire clk1_25;
  wire clk_en0;
  wire clk_en_12_5_fall0;
  wire p_0_in;
  wire reg1;
  wire reg2;
  wire reg4;
  wire reg5;
  wire reg5_reg_n_0;
  wire reset_fall;
  wire reset_out;
  wire sgmii_clk_f_reg;
  wire speed_is_100_fall;
  wire speed_is_10_100_fall;

  (* SOFT_HLUTNM = "soft_lutpair177" *) 
  LUT2 #(
    .INIT(4'h2)) 
    clk_en_12_5_fall_i_1
       (.I0(clk12_5_reg),
        .I1(clk12_5),
        .O(clk_en_12_5_fall0));
  (* SOFT_HLUTNM = "soft_lutpair177" *) 
  LUT2 #(
    .INIT(4'h2)) 
    clk_en_12_5_rise_i_1
       (.I0(clk12_5),
        .I1(clk12_5_reg),
        .O(clk_en0));
  LUT1 #(
    .INIT(2'h1)) 
    reg1_i_1
       (.I0(reg5_reg_n_0),
        .O(p_0_in));
  FDRE reg1_reg
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(p_0_in),
        .Q(reg1),
        .R(reg5));
  FDRE reg2_reg
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(reg1),
        .Q(reg2),
        .R(reg5));
  FDRE reg3_reg
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(reg2),
        .Q(clk12_5),
        .R(reg5));
  FDRE reg4_reg
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(clk12_5),
        .Q(reg4),
        .R(reg5));
  LUT3 #(
    .INIT(8'hF4)) 
    reg5_i_1
       (.I0(reg4),
        .I1(reg5_reg_n_0),
        .I2(reset_out),
        .O(reg5));
  FDRE reg5_reg
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(reg4),
        .Q(reg5_reg_n_0),
        .R(reg5));
  LUT5 #(
    .INIT(32'h0000DFD5)) 
    sgmii_clk_f_i_1
       (.I0(speed_is_10_100_fall),
        .I1(clk12_5),
        .I2(speed_is_100_fall),
        .I3(clk1_25),
        .I4(reset_fall),
        .O(sgmii_clk_f_reg));
endmodule

(* ORIG_REF_NAME = "design_1_gig_ethernet_pcs_pma_0_0_johnson_cntr" *) 
module design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_johnson_cntr_2
   (clk1_25,
    sgmii_clk_r0_out,
    clk_en_1_25_fall0,
    clk_en,
    Tx_WrClk,
    reset_out,
    data_sync_reg6,
    data_out,
    clk12_5,
    clk1_25_reg);
  output clk1_25;
  output sgmii_clk_r0_out;
  output clk_en_1_25_fall0;
  input clk_en;
  input Tx_WrClk;
  input reset_out;
  input data_sync_reg6;
  input data_out;
  input clk12_5;
  input clk1_25_reg;

  wire Tx_WrClk;
  wire clk12_5;
  wire clk1_25;
  wire clk1_25_reg;
  wire clk_en;
  wire clk_en_1_25_fall0;
  wire data_out;
  wire data_sync_reg6;
  wire reg1_i_1__0_n_0;
  wire reg1_reg_n_0;
  wire reg2_reg_n_0;
  wire reg4;
  wire reg5;
  wire reg5_reg_n_0;
  wire reset_out;
  wire sgmii_clk_r0_out;

  (* SOFT_HLUTNM = "soft_lutpair178" *) 
  LUT2 #(
    .INIT(4'h2)) 
    clk_en_1_25_fall_i_1
       (.I0(clk1_25_reg),
        .I1(clk1_25),
        .O(clk_en_1_25_fall0));
  LUT1 #(
    .INIT(2'h1)) 
    reg1_i_1__0
       (.I0(reg5_reg_n_0),
        .O(reg1_i_1__0_n_0));
  FDRE reg1_reg
       (.C(Tx_WrClk),
        .CE(clk_en),
        .D(reg1_i_1__0_n_0),
        .Q(reg1_reg_n_0),
        .R(reg5));
  FDRE reg2_reg
       (.C(Tx_WrClk),
        .CE(clk_en),
        .D(reg1_reg_n_0),
        .Q(reg2_reg_n_0),
        .R(reg5));
  FDRE reg3_reg
       (.C(Tx_WrClk),
        .CE(clk_en),
        .D(reg2_reg_n_0),
        .Q(clk1_25),
        .R(reg5));
  FDRE reg4_reg
       (.C(Tx_WrClk),
        .CE(clk_en),
        .D(clk1_25),
        .Q(reg4),
        .R(reg5));
  LUT4 #(
    .INIT(16'hFF40)) 
    reg5_i_1__0
       (.I0(reg4),
        .I1(clk_en),
        .I2(reg5_reg_n_0),
        .I3(reset_out),
        .O(reg5));
  FDRE reg5_reg
       (.C(Tx_WrClk),
        .CE(clk_en),
        .D(reg4),
        .Q(reg5_reg_n_0),
        .R(reg5));
  (* SOFT_HLUTNM = "soft_lutpair178" *) 
  LUT4 #(
    .INIT(16'hA808)) 
    sgmii_clk_r_i_1
       (.I0(data_sync_reg6),
        .I1(clk1_25),
        .I2(data_out),
        .I3(clk12_5),
        .O(sgmii_clk_r0_out));
endmodule

(* ORIG_REF_NAME = "design_1_gig_ethernet_pcs_pma_0_0_lvds_transceiver" *) 
module design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_lvds_transceiver
   (al_rx_valid_out,
    \d2p2_wr_pipe_reg[3] ,
    rxrecreset0,
    \d21p5_wr_pipe_reg[3] ,
    FifoRd_2__0,
    FifoRd_3__0,
    ActCnt_GE_HalfBT,
    LossOfSignal,
    initialize_ram_complete_sync_reg1,
    data_out,
    remove_idle,
    remove_idle_reg2_reg,
    rxdisperr,
    rxnotintable,
    rxrundisp,
    rxclkcorcnt,
    initialize_ram_complete,
    initialize_ram_complete_pulse,
    Q,
    ActiveIsSlve,
    D,
    \Mstr_Load_dly_reg[0] ,
    WrapToZero,
    monitor_late_reg,
    \holdreg_reg[1] ,
    \holdreg_reg[1]_0 ,
    \s_state_reg[0] ,
    \s_state_reg[0]_0 ,
    Aligned,
    \rxdh_reg[0] ,
    rxbufstatus,
    \IntRdEna_Sync_reg[0] ,
    FifoRd_0,
    \pd_count_reg[4] ,
    \mpx_reg[1] ,
    \mpx_reg[1]_0 ,
    \mpx_reg[3] ,
    \Slve_CntValIn_Out_reg[1] ,
    \Mstr_CntValIn_Out_reg[2] ,
    \Slve_CntValIn_Out_reg[8] ,
    \Mstr_CntValIn_Out_reg[1] ,
    \Mstr_CntValIn_Out_reg[0] ,
    BaseX_Idly_Load,
    rxbuferr_reg,
    \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISCOMMA_INT_reg ,
    \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISK_INT_reg ,
    \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg[7] ,
    \IntActTx_TByteinPip_reg[0] ,
    \act_count_reg[0] ,
    Mstr_Load_reg,
    Mstr_Load_reg_0,
    monitor_late_reg_0,
    \pd_count_reg[0] ,
    \Slve_CntValIn_Out_reg[8]_0 ,
    LossOfSignal_reg,
    \act_count_reg[1] ,
    LossOfSignal_reg_0,
    \mpx_reg[0] ,
    \initialize_counter_reg[0] ,
    Mstr_Load_reg_1,
    insert3_reg,
    \Slve_CntValIn_Out_reg[1]_0 ,
    rxbuferr_reg_0,
    rxbuferr_reg_1,
    Rx_SysClk,
    \d2p2_wr_pipe_reg[2]_pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_1 ,
    \d21p5_wr_pipe_reg[2]_pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_1 ,
    BaseX_Rx_Fifo_Empty,
    Tx_WrClk,
    initialize_ram_complete_sync_ris_edg0,
    reset_out,
    LossOfSignal_reg_1,
    \s_state_reg[3] ,
    ActiveIsSlve_reg,
    ActiveIsSlve_reg_0,
    \s_state_reg[4] ,
    WrapToZero_reg,
    \s_state_reg[3]_0 ,
    \s_state_reg[4]_0 ,
    \pd_count_reg[3] ,
    \pd_count_reg[4]_0 ,
    Rx_Valid_Int_reg,
    initialize_ram_complete_reg,
    \rd_occupancy_reg[2] ,
    \IntWrAddr_reg[2] ,
    CLK,
    \Rx_BtVal_0_reg[8] ,
    initialize_ram_complete_reg_0,
    txchardispval,
    txchardispmode,
    txdata,
    txcharisk,
    BaseX_Rx_Q_Out,
    mgt_rx_reset);
  output al_rx_valid_out;
  output \d2p2_wr_pipe_reg[3] ;
  output rxrecreset0;
  output \d21p5_wr_pipe_reg[3] ;
  output FifoRd_2__0;
  output FifoRd_3__0;
  output ActCnt_GE_HalfBT;
  output LossOfSignal;
  output initialize_ram_complete_sync_reg1;
  output data_out;
  output remove_idle;
  output remove_idle_reg2_reg;
  output [0:0]rxdisperr;
  output [0:0]rxnotintable;
  output [0:0]rxrundisp;
  output [1:0]rxclkcorcnt;
  output initialize_ram_complete;
  output initialize_ram_complete_pulse;
  output [3:0]Q;
  output ActiveIsSlve;
  output [0:0]D;
  output [0:0]\Mstr_Load_dly_reg[0] ;
  output WrapToZero;
  output monitor_late_reg;
  output \holdreg_reg[1] ;
  output \holdreg_reg[1]_0 ;
  output \s_state_reg[0] ;
  output \s_state_reg[0]_0 ;
  output Aligned;
  output \rxdh_reg[0] ;
  output [0:0]rxbufstatus;
  output [0:0]\IntRdEna_Sync_reg[0] ;
  output [7:0]FifoRd_0;
  output [4:0]\pd_count_reg[4] ;
  output \mpx_reg[1] ;
  output \mpx_reg[1]_0 ;
  output \mpx_reg[3] ;
  output [5:0]\Slve_CntValIn_Out_reg[1] ;
  output \Mstr_CntValIn_Out_reg[2] ;
  output [6:0]\Slve_CntValIn_Out_reg[8] ;
  output \Mstr_CntValIn_Out_reg[1] ;
  output \Mstr_CntValIn_Out_reg[0] ;
  output [1:0]BaseX_Idly_Load;
  output [2:0]rxbuferr_reg;
  output \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISCOMMA_INT_reg ;
  output \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISK_INT_reg ;
  output [7:0]\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg[7] ;
  output [7:0]\IntActTx_TByteinPip_reg[0] ;
  output [0:0]\act_count_reg[0] ;
  output Mstr_Load_reg;
  output Mstr_Load_reg_0;
  output monitor_late_reg_0;
  output \pd_count_reg[0] ;
  output \Slve_CntValIn_Out_reg[8]_0 ;
  output LossOfSignal_reg;
  output \act_count_reg[1] ;
  output LossOfSignal_reg_0;
  output \mpx_reg[0] ;
  output \initialize_counter_reg[0] ;
  output Mstr_Load_reg_1;
  output insert3_reg;
  output \Slve_CntValIn_Out_reg[1]_0 ;
  output rxbuferr_reg_0;
  output rxbuferr_reg_1;
  input Rx_SysClk;
  input \d2p2_wr_pipe_reg[2]_pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_1 ;
  input \d21p5_wr_pipe_reg[2]_pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_1 ;
  input [0:0]BaseX_Rx_Fifo_Empty;
  input Tx_WrClk;
  input initialize_ram_complete_sync_ris_edg0;
  input reset_out;
  input LossOfSignal_reg_1;
  input \s_state_reg[3] ;
  input ActiveIsSlve_reg;
  input ActiveIsSlve_reg_0;
  input \s_state_reg[4] ;
  input WrapToZero_reg;
  input \s_state_reg[3]_0 ;
  input \s_state_reg[4]_0 ;
  input \pd_count_reg[3] ;
  input \pd_count_reg[4]_0 ;
  input Rx_Valid_Int_reg;
  input initialize_ram_complete_reg;
  input \rd_occupancy_reg[2] ;
  input \IntWrAddr_reg[2] ;
  input CLK;
  input [5:0]\Rx_BtVal_0_reg[8] ;
  input initialize_ram_complete_reg_0;
  input txchardispval;
  input txchardispmode;
  input [7:0]txdata;
  input txcharisk;
  input [7:0]BaseX_Rx_Q_Out;
  input mgt_rx_reset;

  wire ActCnt_GE_HalfBT;
  wire ActiveIsSlve;
  wire ActiveIsSlve_reg;
  wire ActiveIsSlve_reg_0;
  wire Aligned;
  wire [1:0]BaseX_Idly_Load;
  wire [0:0]BaseX_Rx_Fifo_Empty;
  wire [7:0]BaseX_Rx_Q_Out;
  wire CLK;
  wire [0:0]D;
  wire [7:0]FifoRd_0;
  wire FifoRd_2__0;
  wire FifoRd_3__0;
  wire [7:0]\IntActTx_TByteinPip_reg[0] ;
  wire [0:0]\IntRdEna_Sync_reg[0] ;
  wire \IntWrAddr_reg[2] ;
  wire LossOfSignal;
  wire LossOfSignal_reg;
  wire LossOfSignal_reg_0;
  wire LossOfSignal_reg_1;
  wire \Mstr_CntValIn_Out_reg[0] ;
  wire \Mstr_CntValIn_Out_reg[1] ;
  wire \Mstr_CntValIn_Out_reg[2] ;
  wire [0:0]\Mstr_Load_dly_reg[0] ;
  wire Mstr_Load_reg;
  wire Mstr_Load_reg_0;
  wire Mstr_Load_reg_1;
  wire [3:0]Q;
  wire [5:0]\Rx_BtVal_0_reg[8] ;
  wire Rx_SysClk;
  wire Rx_Valid_Int_reg;
  wire [5:0]\Slve_CntValIn_Out_reg[1] ;
  wire \Slve_CntValIn_Out_reg[1]_0 ;
  wire [6:0]\Slve_CntValIn_Out_reg[8] ;
  wire \Slve_CntValIn_Out_reg[8]_0 ;
  wire Tx_WrClk;
  wire \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISCOMMA_INT_reg ;
  wire \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISK_INT_reg ;
  wire [7:0]\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg[7] ;
  wire WrapToZero;
  wire WrapToZero_reg;
  wire [0:0]\act_count_reg[0] ;
  wire \act_count_reg[1] ;
  wire al_rx_valid_out;
  wire [7:5]b3;
  wire code_err_i;
  wire counter_flag;
  wire counter_flag_i_2_n_0;
  wire counter_flag_i_3_n_0;
  wire counter_flag_reg_n_0;
  wire counter_stg0_carry__0_n_6;
  wire counter_stg0_carry__0_n_7;
  wire counter_stg0_carry_n_0;
  wire counter_stg0_carry_n_1;
  wire counter_stg0_carry_n_2;
  wire counter_stg0_carry_n_3;
  wire counter_stg0_carry_n_5;
  wire counter_stg0_carry_n_6;
  wire counter_stg0_carry_n_7;
  wire [11:0]counter_stg_reg__0;
  wire \d21p5_wr_pipe_reg[2]_pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_1 ;
  wire \d21p5_wr_pipe_reg[3] ;
  wire \d2p2_wr_pipe_reg[2]_pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_1 ;
  wire \d2p2_wr_pipe_reg[3] ;
  wire data_out;
  wire decoded_rxchariscomma;
  wire decoded_rxchariscomma0;
  wire decoded_rxcharisk;
  wire [7:0]decoded_rxdata;
  wire decoded_rxdisperr;
  wire decoded_rxnotintable;
  wire decoded_rxrundisp;
  wire elastic_buffer_rst_125;
  wire elastic_buffer_rst_312;
  wire \holdreg_reg[1] ;
  wire \holdreg_reg[1]_0 ;
  wire \initialize_counter_reg[0] ;
  wire initialize_ram_complete;
  wire initialize_ram_complete_pulse;
  wire initialize_ram_complete_reg;
  wire initialize_ram_complete_reg_0;
  wire initialize_ram_complete_sync_reg1;
  wire initialize_ram_complete_sync_ris_edg0;
  wire insert3_reg;
  wire k;
  wire mgt_rx_reset;
  wire monitor_late_reg;
  wire monitor_late_reg_0;
  wire \mpx_reg[0] ;
  wire \mpx_reg[1] ;
  wire \mpx_reg[1]_0 ;
  wire \mpx_reg[3] ;
  wire [11:0]p_0_in__3;
  wire [4:0]p_2_out;
  wire \pd_count_reg[0] ;
  wire \pd_count_reg[3] ;
  wire [4:0]\pd_count_reg[4] ;
  wire \pd_count_reg[4]_0 ;
  wire \rd_occupancy_reg[2] ;
  wire remove_idle;
  wire remove_idle_reg2_reg;
  wire reset_out;
  wire reset_sync_312_rxelastic_buffer_n_0;
  wire rx_rst_312;
  wire [2:0]rxbuferr_reg;
  wire rxbuferr_reg_0;
  wire rxbuferr_reg_1;
  wire [0:0]rxbufstatus;
  wire [1:0]rxclkcorcnt;
  wire \rxdh_reg[0] ;
  wire [0:0]rxdisperr;
  wire [0:0]rxnotintable;
  wire rxrecreset0;
  wire [0:0]rxrundisp;
  wire \s_state_reg[0] ;
  wire \s_state_reg[0]_0 ;
  wire \s_state_reg[3] ;
  wire \s_state_reg[3]_0 ;
  wire \s_state_reg[4] ;
  wire \s_state_reg[4]_0 ;
  wire sel;
  wire serdes_1_to_10_i_n_69;
  wire serdes_1_to_10_i_n_70;
  wire [9:0]tx_data_10b;
  wire [7:0]tx_data_8b_int;
  wire tx_rst_125;
  wire tx_rst_156;
  wire txchardispmode;
  wire txchardispval;
  wire txcharisk;
  wire [7:0]txdata;
  wire [3:3]NLW_counter_stg0_carry_CO_UNCONNECTED;
  wire [7:2]NLW_counter_stg0_carry__0_CO_UNCONNECTED;
  wire [7:3]NLW_counter_stg0_carry__0_O_UNCONNECTED;

  LUT6 #(
    .INIT(64'h8000000000000000)) 
    counter_flag_i_1
       (.I0(counter_flag_i_2_n_0),
        .I1(counter_stg_reg__0[11]),
        .I2(counter_stg_reg__0[10]),
        .I3(counter_stg_reg__0[9]),
        .I4(counter_stg_reg__0[8]),
        .I5(counter_flag_i_3_n_0),
        .O(counter_flag));
  LUT4 #(
    .INIT(16'h8000)) 
    counter_flag_i_2
       (.I0(counter_stg_reg__0[7]),
        .I1(counter_stg_reg__0[6]),
        .I2(counter_stg_reg__0[5]),
        .I3(counter_stg_reg__0[4]),
        .O(counter_flag_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair176" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    counter_flag_i_3
       (.I0(counter_stg_reg__0[1]),
        .I1(counter_stg_reg__0[0]),
        .I2(counter_stg_reg__0[3]),
        .I3(counter_stg_reg__0[2]),
        .O(counter_flag_i_3_n_0));
  FDRE counter_flag_reg
       (.C(Tx_WrClk),
        .CE(counter_flag),
        .D(counter_flag),
        .Q(counter_flag_reg_n_0),
        .R(reset_out));
  CARRY8 counter_stg0_carry
       (.CI(counter_stg_reg__0[0]),
        .CI_TOP(1'b0),
        .CO({counter_stg0_carry_n_0,counter_stg0_carry_n_1,counter_stg0_carry_n_2,counter_stg0_carry_n_3,NLW_counter_stg0_carry_CO_UNCONNECTED[3],counter_stg0_carry_n_5,counter_stg0_carry_n_6,counter_stg0_carry_n_7}),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(p_0_in__3[8:1]),
        .S(counter_stg_reg__0[8:1]));
  CARRY8 counter_stg0_carry__0
       (.CI(counter_stg0_carry_n_0),
        .CI_TOP(1'b0),
        .CO({NLW_counter_stg0_carry__0_CO_UNCONNECTED[7:2],counter_stg0_carry__0_n_6,counter_stg0_carry__0_n_7}),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_counter_stg0_carry__0_O_UNCONNECTED[7:3],p_0_in__3[11:9]}),
        .S({1'b0,1'b0,1'b0,1'b0,1'b0,counter_stg_reg__0[11:9]}));
  (* SOFT_HLUTNM = "soft_lutpair176" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \counter_stg[0]_i_1 
       (.I0(counter_stg_reg__0[0]),
        .O(p_0_in__3[0]));
  LUT1 #(
    .INIT(2'h1)) 
    \counter_stg[11]_i_1 
       (.I0(counter_flag_reg_n_0),
        .O(sel));
  FDRE \counter_stg_reg[0] 
       (.C(Tx_WrClk),
        .CE(sel),
        .D(p_0_in__3[0]),
        .Q(counter_stg_reg__0[0]),
        .R(reset_out));
  FDRE \counter_stg_reg[10] 
       (.C(Tx_WrClk),
        .CE(sel),
        .D(p_0_in__3[10]),
        .Q(counter_stg_reg__0[10]),
        .R(reset_out));
  FDRE \counter_stg_reg[11] 
       (.C(Tx_WrClk),
        .CE(sel),
        .D(p_0_in__3[11]),
        .Q(counter_stg_reg__0[11]),
        .R(reset_out));
  FDRE \counter_stg_reg[1] 
       (.C(Tx_WrClk),
        .CE(sel),
        .D(p_0_in__3[1]),
        .Q(counter_stg_reg__0[1]),
        .R(reset_out));
  FDRE \counter_stg_reg[2] 
       (.C(Tx_WrClk),
        .CE(sel),
        .D(p_0_in__3[2]),
        .Q(counter_stg_reg__0[2]),
        .R(reset_out));
  FDRE \counter_stg_reg[3] 
       (.C(Tx_WrClk),
        .CE(sel),
        .D(p_0_in__3[3]),
        .Q(counter_stg_reg__0[3]),
        .R(reset_out));
  FDRE \counter_stg_reg[4] 
       (.C(Tx_WrClk),
        .CE(sel),
        .D(p_0_in__3[4]),
        .Q(counter_stg_reg__0[4]),
        .R(reset_out));
  FDRE \counter_stg_reg[5] 
       (.C(Tx_WrClk),
        .CE(sel),
        .D(p_0_in__3[5]),
        .Q(counter_stg_reg__0[5]),
        .R(reset_out));
  FDRE \counter_stg_reg[6] 
       (.C(Tx_WrClk),
        .CE(sel),
        .D(p_0_in__3[6]),
        .Q(counter_stg_reg__0[6]),
        .R(reset_out));
  FDRE \counter_stg_reg[7] 
       (.C(Tx_WrClk),
        .CE(sel),
        .D(p_0_in__3[7]),
        .Q(counter_stg_reg__0[7]),
        .R(reset_out));
  FDRE \counter_stg_reg[8] 
       (.C(Tx_WrClk),
        .CE(sel),
        .D(p_0_in__3[8]),
        .Q(counter_stg_reg__0[8]),
        .R(reset_out));
  FDRE \counter_stg_reg[9] 
       (.C(Tx_WrClk),
        .CE(sel),
        .D(p_0_in__3[9]),
        .Q(counter_stg_reg__0[9]),
        .R(reset_out));
  design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_decode_8b10b_lut_base decode_8b10b
       (.D({decoded_rxcharisk,decoded_rxdisperr,decoded_rxnotintable,decoded_rxrundisp,decoded_rxdata}),
        .E(al_rx_valid_out),
        .Rx_SysClk(Rx_SysClk),
        .b3(b3),
        .code_err_i(code_err_i),
        .\grdni.run_disp_i_reg_0 (serdes_1_to_10_i_n_70),
        .\grdni.run_disp_i_reg_1 (serdes_1_to_10_i_n_69),
        .k(k),
        .out(p_2_out));
  FDRE decoded_rxchariscomma_reg
       (.C(Rx_SysClk),
        .CE(al_rx_valid_out),
        .D(decoded_rxchariscomma0),
        .Q(decoded_rxchariscomma),
        .R(1'b0));
  FDSE elastic_buffer_rst_125_reg
       (.C(Tx_WrClk),
        .CE(counter_flag),
        .D(1'b0),
        .Q(elastic_buffer_rst_125),
        .S(reset_out));
  design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_encode_8b10b_lut_base encode_8b10b
       (.Tx_WrClk(Tx_WrClk),
        .tx_data_10b(tx_data_10b),
        .txchardispmode(txchardispmode),
        .txchardispval(txchardispval),
        .txcharisk(txcharisk),
        .txdata(txdata));
  design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_tx_ten_to_eight gb_out_inst
       (.CLK(CLK),
        .\IntRdEna_Sync_reg[0]_0 (\IntRdEna_Sync_reg[0] ),
        .\IntWrAddr_reg[2]_0 (\IntWrAddr_reg[2] ),
        .Q(Q),
        .Tx_WrClk(Tx_WrClk),
        .reset_out(tx_rst_125),
        .tx_data_10b(tx_data_10b),
        .\tx_data_8b_reg[7] (tx_data_8b_int));
  design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_reset_sync_3 reset_sync_125_tx
       (.IntRdEna_reg(tx_rst_125),
        .Tx_WrClk(Tx_WrClk),
        .reset_out(reset_out));
  design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_reset_sync_4 reset_sync_312_rx
       (.Rx_SysClk(Rx_SysClk),
        .SR(rxrecreset0),
        .reset_out(rx_rst_312),
        .reset_sync6_0(elastic_buffer_rst_312),
        .reset_sync6_1(reset_out));
  design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_reset_sync_5 reset_sync_312_rxelastic_buffer
       (.Rx_SysClk(Rx_SysClk),
        .SR(reset_sync_312_rxelastic_buffer_n_0),
        .data_in(initialize_ram_complete),
        .elastic_buffer_rst_125(elastic_buffer_rst_125),
        .mgt_rx_reset(mgt_rx_reset),
        .reset_out(elastic_buffer_rst_312),
        .reset_sync6_0(rx_rst_312));
  design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_reset_sync_6 reset_sync_312_tx
       (.CLK(CLK),
        .reset_out(reset_out),
        .\tx_data_8b_reg[0] (tx_rst_156));
  design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_rx_elastic_buffer rx_elastic_buffer_inst
       (.D(remove_idle),
        .E(al_rx_valid_out),
        .Rx_SysClk(Rx_SysClk),
        .SR(rxrecreset0),
        .Tx_WrClk(Tx_WrClk),
        .\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISCOMMA_INT_reg (\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISCOMMA_INT_reg ),
        .\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISK_INT_reg (\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISK_INT_reg ),
        .\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg[7] (\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg[7] ),
        .\d21p5_wr_pipe_reg[2]_pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_1_0 (\d21p5_wr_pipe_reg[2]_pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_1 ),
        .\d21p5_wr_pipe_reg[3]_0 (\d21p5_wr_pipe_reg[3] ),
        .\d2p2_wr_pipe_reg[2]_pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_1_0 (\d2p2_wr_pipe_reg[2]_pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_1 ),
        .\d2p2_wr_pipe_reg[3]_0 (\d2p2_wr_pipe_reg[3] ),
        .data_in(initialize_ram_complete),
        .data_out(data_out),
        .decoded_rxchariscomma_reg({decoded_rxchariscomma,decoded_rxcharisk,decoded_rxdisperr,decoded_rxnotintable,decoded_rxrundisp,decoded_rxdata}),
        .elastic_buffer_rst_125(elastic_buffer_rst_125),
        .\initialize_counter_reg[0]_0 (\initialize_counter_reg[0] ),
        .initialize_ram_complete_reg_0(initialize_ram_complete_reg),
        .initialize_ram_complete_reg_1(initialize_ram_complete_reg_0),
        .initialize_ram_complete_sync_reg1(initialize_ram_complete_sync_reg1),
        .initialize_ram_complete_sync_ris_edg0(initialize_ram_complete_sync_ris_edg0),
        .mgt_rx_reset(mgt_rx_reset),
        .\rd_occupancy_reg[2]_0 (\rd_occupancy_reg[2] ),
        .remove_idle_reg2_reg_0(remove_idle_reg2_reg),
        .reset_out(elastic_buffer_rst_312),
        .reset_sync6(rx_rst_312),
        .reset_sync6_0(reset_out),
        .reset_sync6_1(reset_sync_312_rxelastic_buffer_n_0),
        .rxbuferr_reg_0(rxbuferr_reg_0),
        .rxbuferr_reg_1(rxbuferr_reg),
        .rxbuferr_reg_2(rxbuferr_reg_1),
        .rxbufstatus(rxbufstatus),
        .rxclkcorcnt(rxclkcorcnt),
        .rxdisperr(rxdisperr),
        .rxnotintable(rxnotintable),
        .rxrundisp(rxrundisp),
        .\wr_addr_plus1_reg[5]_0 (initialize_ram_complete_pulse));
  design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_serdes_1_to_10 serdes_1_to_10_i
       (.ActiveIsSlve_reg_0(ActiveIsSlve_reg),
        .ActiveIsSlve_reg_1(ActiveIsSlve_reg_0),
        .Aligned(Aligned),
        .BaseX_Idly_Load(BaseX_Idly_Load),
        .BaseX_Rx_Fifo_Empty(BaseX_Rx_Fifo_Empty),
        .BaseX_Rx_Q_Out(BaseX_Rx_Q_Out),
        .D(D),
        .DI(\Mstr_CntValIn_Out_reg[2] ),
        .E(al_rx_valid_out),
        .FifoRd_0_0(FifoRd_0),
        .FifoRd_2__0(FifoRd_2__0),
        .FifoRd_3__0(FifoRd_3__0),
        .LossOfSignal_reg_0(LossOfSignal_reg),
        .LossOfSignal_reg_1(LossOfSignal_reg_0),
        .LossOfSignal_reg_2(LossOfSignal_reg_1),
        .\Mstr_CntValIn_Out_reg[0]_0 (\Mstr_CntValIn_Out_reg[0] ),
        .\Mstr_CntValIn_Out_reg[1]_0 (\Mstr_CntValIn_Out_reg[1] ),
        .\Mstr_Load_dly_reg[0]_0 (\Mstr_Load_dly_reg[0] ),
        .Mstr_Load_reg_0(Mstr_Load_reg),
        .Mstr_Load_reg_1(Mstr_Load_reg_0),
        .Mstr_Load_reg_2(Mstr_Load_reg_1),
        .Q(\Slve_CntValIn_Out_reg[8] ),
        .\Rx_BtVal_0_reg[8] (\Rx_BtVal_0_reg[8] ),
        .Rx_SysClk(Rx_SysClk),
        .Rx_Valid_Int_reg_0(Rx_Valid_Int_reg),
        .SR(LossOfSignal),
        .\Slve_CntValIn_Out_reg[1]_0 (\Slve_CntValIn_Out_reg[1] ),
        .\Slve_CntValIn_Out_reg[1]_1 (\Slve_CntValIn_Out_reg[1]_0 ),
        .\Slve_CntValIn_Out_reg[8]_0 (\Slve_CntValIn_Out_reg[8]_0 ),
        .WrapToZero(WrapToZero),
        .WrapToZero_reg_0(WrapToZero_reg),
        .\act_count_reg[0]_0 (\act_count_reg[0] ),
        .\act_count_reg[1]_0 (\act_count_reg[1] ),
        .\active_reg[4]_0 (ActiveIsSlve),
        .b3(b3),
        .code_err_i(code_err_i),
        .decoded_rxchariscomma0(decoded_rxchariscomma0),
        .\gde.gdeni.DISP_ERR_reg (serdes_1_to_10_i_n_69),
        .\grdni.run_disp_i_reg (serdes_1_to_10_i_n_70),
        .\grdni.run_disp_i_reg_0 (decoded_rxrundisp),
        .\holdreg_reg[1]_0 (\holdreg_reg[1] ),
        .\holdreg_reg[1]_1 (\holdreg_reg[1]_0 ),
        .insert3_reg_0(insert3_reg),
        .k(k),
        .monitor_late_reg_0(ActCnt_GE_HalfBT),
        .monitor_late_reg_1(monitor_late_reg),
        .monitor_late_reg_2(monitor_late_reg_0),
        .\mpx_reg[0]_0 (\mpx_reg[0] ),
        .\mpx_reg[1]_0 (\mpx_reg[1] ),
        .\mpx_reg[1]_1 (\mpx_reg[1]_0 ),
        .\mpx_reg[3]_0 (\mpx_reg[3] ),
        .out(p_2_out),
        .\pd_count_reg[0]_0 (\pd_count_reg[0] ),
        .\pd_count_reg[3]_0 (\pd_count_reg[3] ),
        .\pd_count_reg[4]_0 (\pd_count_reg[4] ),
        .\pd_count_reg[4]_1 (\pd_count_reg[4]_0 ),
        .reset_sync6(rx_rst_312),
        .\rxdh_reg[0]_0 (\rxdh_reg[0] ),
        .\s_state_reg[0]_0 (\s_state_reg[0] ),
        .\s_state_reg[0]_1 (\s_state_reg[0]_0 ),
        .\s_state_reg[3]_0 (\s_state_reg[3] ),
        .\s_state_reg[3]_1 (\s_state_reg[3]_0 ),
        .\s_state_reg[4]_0 (\s_state_reg[4] ),
        .\s_state_reg[4]_1 (\s_state_reg[4]_0 ));
  FDRE \tx_data_8b_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(tx_data_8b_int[0]),
        .Q(\IntActTx_TByteinPip_reg[0] [0]),
        .R(tx_rst_156));
  FDRE \tx_data_8b_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(tx_data_8b_int[1]),
        .Q(\IntActTx_TByteinPip_reg[0] [1]),
        .R(tx_rst_156));
  FDRE \tx_data_8b_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .D(tx_data_8b_int[2]),
        .Q(\IntActTx_TByteinPip_reg[0] [2]),
        .R(tx_rst_156));
  FDRE \tx_data_8b_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .D(tx_data_8b_int[3]),
        .Q(\IntActTx_TByteinPip_reg[0] [3]),
        .R(tx_rst_156));
  FDRE \tx_data_8b_reg[4] 
       (.C(CLK),
        .CE(1'b1),
        .D(tx_data_8b_int[4]),
        .Q(\IntActTx_TByteinPip_reg[0] [4]),
        .R(tx_rst_156));
  FDRE \tx_data_8b_reg[5] 
       (.C(CLK),
        .CE(1'b1),
        .D(tx_data_8b_int[5]),
        .Q(\IntActTx_TByteinPip_reg[0] [5]),
        .R(tx_rst_156));
  FDRE \tx_data_8b_reg[6] 
       (.C(CLK),
        .CE(1'b1),
        .D(tx_data_8b_int[6]),
        .Q(\IntActTx_TByteinPip_reg[0] [6]),
        .R(tx_rst_156));
  FDRE \tx_data_8b_reg[7] 
       (.C(CLK),
        .CE(1'b1),
        .D(tx_data_8b_int[7]),
        .Q(\IntActTx_TByteinPip_reg[0] [7]),
        .R(tx_rst_156));
endmodule

(* ORIG_REF_NAME = "design_1_gig_ethernet_pcs_pma_0_0_reset_sync" *) 
module design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_reset_sync
   (rst_125_out,
    tx_logic_reset,
    rx_logic_reset,
    Tx_WrClk);
  output rst_125_out;
  input tx_logic_reset;
  input rx_logic_reset;
  input Tx_WrClk;

  wire Tx_WrClk;
  wire logic_reset;
  wire reset_sync_reg1;
  wire reset_sync_reg2;
  wire reset_sync_reg3;
  wire reset_sync_reg4;
  wire reset_sync_reg5;
  wire rst_125_out;
  wire rx_logic_reset;
  wire tx_logic_reset;

  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync1
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(1'b0),
        .PRE(logic_reset),
        .Q(reset_sync_reg1));
  LUT2 #(
    .INIT(4'hE)) 
    reset_sync1_i_1__0
       (.I0(tx_logic_reset),
        .I1(rx_logic_reset),
        .O(logic_reset));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync2
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(reset_sync_reg1),
        .PRE(logic_reset),
        .Q(reset_sync_reg2));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync3
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(reset_sync_reg2),
        .PRE(logic_reset),
        .Q(reset_sync_reg3));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync4
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(reset_sync_reg3),
        .PRE(logic_reset),
        .Q(reset_sync_reg4));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync5
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(reset_sync_reg4),
        .PRE(logic_reset),
        .Q(reset_sync_reg5));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync6
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(reset_sync_reg5),
        .PRE(1'b0),
        .Q(rst_125_out));
endmodule

(* ORIG_REF_NAME = "design_1_gig_ethernet_pcs_pma_0_0_reset_sync" *) 
module design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_reset_sync_0
   (reset_out,
    Tx_WrClk,
    mgt_tx_reset);
  output reset_out;
  input Tx_WrClk;
  input mgt_tx_reset;

  wire Tx_WrClk;
  wire mgt_tx_reset;
  wire reset_out;
  wire reset_sync_reg1;
  wire reset_sync_reg2;
  wire reset_sync_reg3;
  wire reset_sync_reg4;
  wire reset_sync_reg5;

  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync1
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(1'b0),
        .PRE(mgt_tx_reset),
        .Q(reset_sync_reg1));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync2
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(reset_sync_reg1),
        .PRE(mgt_tx_reset),
        .Q(reset_sync_reg2));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync3
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(reset_sync_reg2),
        .PRE(mgt_tx_reset),
        .Q(reset_sync_reg3));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync4
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(reset_sync_reg3),
        .PRE(mgt_tx_reset),
        .Q(reset_sync_reg4));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync5
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(reset_sync_reg4),
        .PRE(mgt_tx_reset),
        .Q(reset_sync_reg5));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync6
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(reset_sync_reg5),
        .PRE(1'b0),
        .Q(reset_out));
endmodule

(* ORIG_REF_NAME = "design_1_gig_ethernet_pcs_pma_0_0_reset_sync" *) 
module design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_reset_sync_26
   (reset_out,
    refclk625_n,
    ResetIn);
  output reset_out;
  input refclk625_n;
  input ResetIn;

  wire ResetIn;
  wire refclk625_n;
  wire reset_out;
  wire reset_sync_reg1;
  wire reset_sync_reg2;
  wire reset_sync_reg3;
  wire reset_sync_reg4;
  wire reset_sync_reg5;

  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync1
       (.C(refclk625_n),
        .CE(1'b1),
        .D(1'b0),
        .PRE(ResetIn),
        .Q(reset_sync_reg1));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync2
       (.C(refclk625_n),
        .CE(1'b1),
        .D(reset_sync_reg1),
        .PRE(ResetIn),
        .Q(reset_sync_reg2));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync3
       (.C(refclk625_n),
        .CE(1'b1),
        .D(reset_sync_reg2),
        .PRE(ResetIn),
        .Q(reset_sync_reg3));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync4
       (.C(refclk625_n),
        .CE(1'b1),
        .D(reset_sync_reg3),
        .PRE(ResetIn),
        .Q(reset_sync_reg4));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync5
       (.C(refclk625_n),
        .CE(1'b1),
        .D(reset_sync_reg4),
        .PRE(ResetIn),
        .Q(reset_sync_reg5));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync6
       (.C(refclk625_n),
        .CE(1'b1),
        .D(reset_sync_reg5),
        .PRE(1'b0),
        .Q(reset_out));
endmodule

(* ORIG_REF_NAME = "design_1_gig_ethernet_pcs_pma_0_0_reset_sync" *) 
module design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_reset_sync_27
   (Rx_LogicRst,
    Rx_SysClk,
    reset_in);
  output Rx_LogicRst;
  input Rx_SysClk;
  input reset_in;

  wire Rx_LogicRst;
  wire Rx_SysClk;
  wire reset_in;
  wire reset_sync_reg1;
  wire reset_sync_reg2;
  wire reset_sync_reg3;
  wire reset_sync_reg4;
  wire reset_sync_reg5;

  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync1
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(1'b0),
        .PRE(reset_in),
        .Q(reset_sync_reg1));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync2
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(reset_sync_reg1),
        .PRE(reset_in),
        .Q(reset_sync_reg2));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync3
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(reset_sync_reg2),
        .PRE(reset_in),
        .Q(reset_sync_reg3));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync4
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(reset_sync_reg3),
        .PRE(reset_in),
        .Q(reset_sync_reg4));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync5
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(reset_sync_reg4),
        .PRE(reset_in),
        .Q(reset_sync_reg5));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync6
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(reset_sync_reg5),
        .PRE(1'b0),
        .Q(Rx_LogicRst));
endmodule

(* ORIG_REF_NAME = "design_1_gig_ethernet_pcs_pma_0_0_reset_sync" *) 
module design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_reset_sync_28
   (Tx_LogicRst,
    Tx_WrClk,
    reset_in);
  output Tx_LogicRst;
  input Tx_WrClk;
  input reset_in;

  wire Tx_LogicRst;
  wire Tx_WrClk;
  wire reset_in;
  wire reset_sync_reg1;
  wire reset_sync_reg2;
  wire reset_sync_reg3;
  wire reset_sync_reg4;
  wire reset_sync_reg5;

  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync1
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(1'b0),
        .PRE(reset_in),
        .Q(reset_sync_reg1));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync2
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(reset_sync_reg1),
        .PRE(reset_in),
        .Q(reset_sync_reg2));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync3
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(reset_sync_reg2),
        .PRE(reset_in),
        .Q(reset_sync_reg3));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync4
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(reset_sync_reg3),
        .PRE(reset_in),
        .Q(reset_sync_reg4));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync5
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(reset_sync_reg4),
        .PRE(reset_in),
        .Q(reset_sync_reg5));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync6
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(reset_sync_reg5),
        .PRE(1'b0),
        .Q(Tx_LogicRst));
endmodule

(* ORIG_REF_NAME = "design_1_gig_ethernet_pcs_pma_0_0_reset_sync" *) 
module design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_reset_sync_3
   (IntRdEna_reg,
    Tx_WrClk,
    reset_out);
  output IntRdEna_reg;
  input Tx_WrClk;
  input reset_out;

  wire IntRdEna_reg;
  wire Tx_WrClk;
  wire reset_out;
  wire reset_sync_reg1;
  wire reset_sync_reg2;
  wire reset_sync_reg3;
  wire reset_sync_reg4;
  wire reset_sync_reg5;

  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync1
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(1'b0),
        .PRE(reset_out),
        .Q(reset_sync_reg1));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync2
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(reset_sync_reg1),
        .PRE(reset_out),
        .Q(reset_sync_reg2));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync3
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(reset_sync_reg2),
        .PRE(reset_out),
        .Q(reset_sync_reg3));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync4
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(reset_sync_reg3),
        .PRE(reset_out),
        .Q(reset_sync_reg4));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync5
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(reset_sync_reg4),
        .PRE(reset_out),
        .Q(reset_sync_reg5));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync6
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(reset_sync_reg5),
        .PRE(1'b0),
        .Q(IntRdEna_reg));
endmodule

(* ORIG_REF_NAME = "design_1_gig_ethernet_pcs_pma_0_0_reset_sync" *) 
module design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_reset_sync_4
   (SR,
    reset_out,
    reset_sync6_0,
    Rx_SysClk,
    reset_sync6_1);
  output [0:0]SR;
  output reset_out;
  input reset_sync6_0;
  input Rx_SysClk;
  input reset_sync6_1;

  wire Rx_SysClk;
  wire [0:0]SR;
  wire reset_out;
  wire reset_sync6_0;
  wire reset_sync6_1;
  wire reset_sync_reg1;
  wire reset_sync_reg2;
  wire reset_sync_reg3;
  wire reset_sync_reg4;
  wire reset_sync_reg5;

  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync1
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(1'b0),
        .PRE(reset_sync6_1),
        .Q(reset_sync_reg1));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync2
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(reset_sync_reg1),
        .PRE(reset_sync6_1),
        .Q(reset_sync_reg2));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync3
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(reset_sync_reg2),
        .PRE(reset_sync6_1),
        .Q(reset_sync_reg3));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync4
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(reset_sync_reg3),
        .PRE(reset_sync6_1),
        .Q(reset_sync_reg4));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync5
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(reset_sync_reg4),
        .PRE(reset_sync6_1),
        .Q(reset_sync_reg5));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync6
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(reset_sync_reg5),
        .PRE(1'b0),
        .Q(reset_out));
  LUT2 #(
    .INIT(4'hE)) 
    \wr_addr[6]_i_1 
       (.I0(reset_out),
        .I1(reset_sync6_0),
        .O(SR));
endmodule

(* ORIG_REF_NAME = "design_1_gig_ethernet_pcs_pma_0_0_reset_sync" *) 
module design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_reset_sync_5
   (SR,
    reset_out,
    reset_sync6_0,
    data_in,
    mgt_rx_reset,
    elastic_buffer_rst_125,
    Rx_SysClk);
  output [0:0]SR;
  output reset_out;
  input reset_sync6_0;
  input data_in;
  input mgt_rx_reset;
  input elastic_buffer_rst_125;
  input Rx_SysClk;

  wire Rx_SysClk;
  wire [0:0]SR;
  wire data_in;
  wire elastic_buffer_rst_125;
  wire mgt_rx_reset;
  wire reset_in0;
  wire reset_out;
  wire reset_sync6_0;
  wire reset_sync_reg1;
  wire reset_sync_reg2;
  wire reset_sync_reg3;
  wire reset_sync_reg4;
  wire reset_sync_reg5;

  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync1
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(1'b0),
        .PRE(reset_in0),
        .Q(reset_sync_reg1));
  LUT2 #(
    .INIT(4'hE)) 
    reset_sync1_i_1
       (.I0(mgt_rx_reset),
        .I1(elastic_buffer_rst_125),
        .O(reset_in0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync2
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(reset_sync_reg1),
        .PRE(reset_in0),
        .Q(reset_sync_reg2));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync3
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(reset_sync_reg2),
        .PRE(reset_in0),
        .Q(reset_sync_reg3));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync4
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(reset_sync_reg3),
        .PRE(reset_in0),
        .Q(reset_sync_reg4));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync5
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(reset_sync_reg4),
        .PRE(reset_in0),
        .Q(reset_sync_reg5));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync6
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(reset_sync_reg5),
        .PRE(1'b0),
        .Q(reset_out));
  LUT3 #(
    .INIT(8'hEF)) 
    \wr_data_reg_reg[13]_i_1 
       (.I0(reset_out),
        .I1(reset_sync6_0),
        .I2(data_in),
        .O(SR));
endmodule

(* ORIG_REF_NAME = "design_1_gig_ethernet_pcs_pma_0_0_reset_sync" *) 
module design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_reset_sync_6
   (\tx_data_8b_reg[0] ,
    CLK,
    reset_out);
  output \tx_data_8b_reg[0] ;
  input CLK;
  input reset_out;

  wire CLK;
  wire reset_out;
  wire reset_sync_reg1;
  wire reset_sync_reg2;
  wire reset_sync_reg3;
  wire reset_sync_reg4;
  wire reset_sync_reg5;
  wire \tx_data_8b_reg[0] ;

  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync1
       (.C(CLK),
        .CE(1'b1),
        .D(1'b0),
        .PRE(reset_out),
        .Q(reset_sync_reg1));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync2
       (.C(CLK),
        .CE(1'b1),
        .D(reset_sync_reg1),
        .PRE(reset_out),
        .Q(reset_sync_reg2));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync3
       (.C(CLK),
        .CE(1'b1),
        .D(reset_sync_reg2),
        .PRE(reset_out),
        .Q(reset_sync_reg3));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync4
       (.C(CLK),
        .CE(1'b1),
        .D(reset_sync_reg3),
        .PRE(reset_out),
        .Q(reset_sync_reg4));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync5
       (.C(CLK),
        .CE(1'b1),
        .D(reset_sync_reg4),
        .PRE(reset_out),
        .Q(reset_sync_reg5));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync6
       (.C(CLK),
        .CE(1'b1),
        .D(reset_sync_reg5),
        .PRE(1'b0),
        .Q(\tx_data_8b_reg[0] ));
endmodule

(* ORIG_REF_NAME = "design_1_gig_ethernet_pcs_pma_0_0_rx_elastic_buffer" *) 
module design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_rx_elastic_buffer
   (\d2p2_wr_pipe_reg[3]_0 ,
    \d21p5_wr_pipe_reg[3]_0 ,
    initialize_ram_complete_sync_reg1,
    data_out,
    D,
    remove_idle_reg2_reg_0,
    rxdisperr,
    rxnotintable,
    rxrundisp,
    rxclkcorcnt,
    data_in,
    \wr_addr_plus1_reg[5]_0 ,
    rxbufstatus,
    \initialize_counter_reg[0]_0 ,
    rxbuferr_reg_0,
    rxbuferr_reg_1,
    rxbuferr_reg_2,
    \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISCOMMA_INT_reg ,
    \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISK_INT_reg ,
    \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg[7] ,
    E,
    Rx_SysClk,
    SR,
    \d2p2_wr_pipe_reg[2]_pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_1_0 ,
    \d21p5_wr_pipe_reg[2]_pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_1_0 ,
    Tx_WrClk,
    initialize_ram_complete_sync_ris_edg0,
    initialize_ram_complete_reg_0,
    \rd_occupancy_reg[2]_0 ,
    reset_out,
    reset_sync6,
    reset_sync6_0,
    mgt_rx_reset,
    elastic_buffer_rst_125,
    initialize_ram_complete_reg_1,
    reset_sync6_1,
    decoded_rxchariscomma_reg);
  output \d2p2_wr_pipe_reg[3]_0 ;
  output \d21p5_wr_pipe_reg[3]_0 ;
  output initialize_ram_complete_sync_reg1;
  output data_out;
  output [0:0]D;
  output remove_idle_reg2_reg_0;
  output [0:0]rxdisperr;
  output [0:0]rxnotintable;
  output [0:0]rxrundisp;
  output [1:0]rxclkcorcnt;
  output data_in;
  output \wr_addr_plus1_reg[5]_0 ;
  output [0:0]rxbufstatus;
  output \initialize_counter_reg[0]_0 ;
  output rxbuferr_reg_0;
  output [2:0]rxbuferr_reg_1;
  output rxbuferr_reg_2;
  output \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISCOMMA_INT_reg ;
  output \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISK_INT_reg ;
  output [7:0]\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg[7] ;
  input [0:0]E;
  input Rx_SysClk;
  input [0:0]SR;
  input \d2p2_wr_pipe_reg[2]_pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_1_0 ;
  input \d21p5_wr_pipe_reg[2]_pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_1_0 ;
  input Tx_WrClk;
  input initialize_ram_complete_sync_ris_edg0;
  input initialize_ram_complete_reg_0;
  input \rd_occupancy_reg[2]_0 ;
  input reset_out;
  input reset_sync6;
  input reset_sync6_0;
  input mgt_rx_reset;
  input elastic_buffer_rst_125;
  input initialize_ram_complete_reg_1;
  input [0:0]reset_sync6_1;
  input [12:0]decoded_rxchariscomma_reg;

  wire [0:0]D;
  wire [0:0]E;
  wire Rx_SysClk;
  wire [0:0]SR;
  wire Tx_WrClk;
  wire \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISCOMMA_INT_reg ;
  wire \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISK_INT_reg ;
  wire [7:0]\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg[7] ;
  wire \__1/ram_reg_64_127_0_6_i_1_n_0 ;
  wire d16p2_wr;
  wire \d16p2_wr_pipe[0]_i_2_n_0 ;
  wire \d16p2_wr_pipe_reg_n_0_[0] ;
  wire d21p5_wr;
  wire [3:3]d21p5_wr_pipe;
  wire \d21p5_wr_pipe_reg[1]_srl2___pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_0_i_2_n_0 ;
  wire \d21p5_wr_pipe_reg[1]_srl2___pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_0_n_0 ;
  wire \d21p5_wr_pipe_reg[2]_pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_1_0 ;
  wire \d21p5_wr_pipe_reg[3]_0 ;
  wire d2p2_wr;
  wire [3:3]d2p2_wr_pipe;
  wire \d2p2_wr_pipe_reg[1]_srl2___pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_0_n_0 ;
  wire \d2p2_wr_pipe_reg[2]_pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_1_0 ;
  wire \d2p2_wr_pipe_reg[3]_0 ;
  wire data_in;
  wire data_out;
  wire [12:0]decoded_rxchariscomma_reg;
  wire [13:0]dpo;
  wire elastic_buffer_rst_125;
  wire even;
  wire even0;
  wire even_i_1_n_0;
  wire initialize_counter0;
  wire \initialize_counter_reg[0]_0 ;
  wire [5:0]initialize_counter_reg__0;
  wire initialize_ram;
  wire initialize_ram0;
  wire initialize_ram_complete_pulse0;
  wire initialize_ram_complete_reg_0;
  wire initialize_ram_complete_reg_1;
  wire initialize_ram_complete_reg__0;
  wire initialize_ram_complete_sync_reg1;
  wire initialize_ram_complete_sync_ris_edg;
  wire initialize_ram_complete_sync_ris_edg0;
  wire initialize_ram_i_1_n_0;
  wire insert_idle;
  wire insert_idle_i_10_n_0;
  wire insert_idle_i_2_n_0;
  wire insert_idle_i_3_n_0;
  wire insert_idle_i_4_n_0;
  wire insert_idle_i_5_n_0;
  wire insert_idle_i_6_n_0;
  wire insert_idle_i_7_n_0;
  wire insert_idle_i_8_n_0;
  wire insert_idle_i_9_n_0;
  wire insert_idle_reg__0;
  wire \k28p5_wr_pipe[0]_i_2_n_0 ;
  wire \k28p5_wr_pipe_reg_n_0_[0] ;
  wire \k28p5_wr_pipe_reg_n_0_[1] ;
  wire \k28p5_wr_pipe_reg_n_0_[2] ;
  wire \k28p5_wr_pipe_reg_n_0_[3] ;
  wire \k28p5_wr_pipe_reg_n_0_[4] ;
  wire mgt_rx_reset;
  wire p_0_in;
  wire [5:0]p_0_in__0;
  wire [6:0]p_0_in__1;
  wire p_1_in;
  wire p_1_in28_in;
  wire p_1_in3_in;
  wire p_1_out;
  wire p_2_in;
  wire p_2_in20_in;
  wire p_2_in29_in;
  wire p_2_out;
  wire p_3_in;
  wire p_3_in31_in;
  wire [0:0]p_3_out;
  wire p_4_in23_in;
  wire p_4_in33_in;
  wire p_4_in9_in;
  wire p_4_out;
  wire p_5_in;
  wire p_5_in35_in;
  wire p_5_out;
  wire [5:1]p_6_out;
  wire ram_reg_0_63_0_6_i_1_n_0;
  wire ram_reg_0_63_0_6_n_0;
  wire ram_reg_0_63_0_6_n_1;
  wire ram_reg_0_63_0_6_n_2;
  wire ram_reg_0_63_0_6_n_3;
  wire ram_reg_0_63_0_6_n_4;
  wire ram_reg_0_63_0_6_n_5;
  wire ram_reg_0_63_0_6_n_6;
  wire ram_reg_0_63_7_13_n_0;
  wire ram_reg_0_63_7_13_n_1;
  wire ram_reg_0_63_7_13_n_2;
  wire ram_reg_0_63_7_13_n_3;
  wire ram_reg_0_63_7_13_n_4;
  wire ram_reg_0_63_7_13_n_5;
  wire ram_reg_0_63_7_13_n_6;
  wire ram_reg_64_127_0_6_n_0;
  wire ram_reg_64_127_0_6_n_1;
  wire ram_reg_64_127_0_6_n_2;
  wire ram_reg_64_127_0_6_n_3;
  wire ram_reg_64_127_0_6_n_4;
  wire ram_reg_64_127_0_6_n_5;
  wire ram_reg_64_127_0_6_n_6;
  wire ram_reg_64_127_7_13_n_0;
  wire ram_reg_64_127_7_13_n_1;
  wire ram_reg_64_127_7_13_n_2;
  wire ram_reg_64_127_7_13_n_3;
  wire ram_reg_64_127_7_13_n_4;
  wire ram_reg_64_127_7_13_n_5;
  wire ram_reg_64_127_7_13_n_6;
  wire [6:0]rd_addr;
  wire [5:0]rd_addr_gray;
  wire \rd_addr_gray[0]_i_1_n_0 ;
  wire \rd_addr_gray[1]_i_1_n_0 ;
  wire \rd_addr_gray[2]_i_1_n_0 ;
  wire \rd_addr_gray[3]_i_1_n_0 ;
  wire \rd_addr_gray[4]_i_1_n_0 ;
  wire \rd_addr_gray[5]_i_1_n_0 ;
  wire [6:0]rd_addr_plus1;
  wire \rd_addr_plus2[6]_i_2_n_0 ;
  wire \rd_addr_plus2_reg_n_0_[0] ;
  wire \rd_addr_plus2_reg_n_0_[6] ;
  wire \rd_data_reg_n_0_[0] ;
  wire \rd_data_reg_n_0_[10] ;
  wire \rd_data_reg_n_0_[11] ;
  wire \rd_data_reg_n_0_[12] ;
  wire \rd_data_reg_n_0_[13] ;
  wire \rd_data_reg_n_0_[1] ;
  wire \rd_data_reg_n_0_[2] ;
  wire \rd_data_reg_n_0_[3] ;
  wire \rd_data_reg_n_0_[4] ;
  wire \rd_data_reg_n_0_[5] ;
  wire \rd_data_reg_n_0_[6] ;
  wire \rd_data_reg_n_0_[7] ;
  wire \rd_data_reg_n_0_[9] ;
  wire \rd_data_reg_reg_n_0_[0] ;
  wire \rd_data_reg_reg_n_0_[10] ;
  wire \rd_data_reg_reg_n_0_[12] ;
  wire \rd_data_reg_reg_n_0_[13] ;
  wire \rd_data_reg_reg_n_0_[1] ;
  wire \rd_data_reg_reg_n_0_[2] ;
  wire \rd_data_reg_reg_n_0_[3] ;
  wire \rd_data_reg_reg_n_0_[4] ;
  wire \rd_data_reg_reg_n_0_[5] ;
  wire \rd_data_reg_reg_n_0_[6] ;
  wire \rd_data_reg_reg_n_0_[7] ;
  wire \rd_data_reg_reg_n_0_[8] ;
  wire \rd_data_reg_reg_n_0_[9] ;
  wire rd_enable;
  wire rd_enable_reg;
  wire [6:0]rd_occupancy;
  wire [6:0]rd_occupancy01_out;
  wire rd_occupancy0_carry_n_2;
  wire rd_occupancy0_carry_n_3;
  wire rd_occupancy0_carry_n_5;
  wire rd_occupancy0_carry_n_6;
  wire rd_occupancy0_carry_n_7;
  wire \rd_occupancy_reg[2]_0 ;
  wire [5:0]rd_wr_addr;
  wire rd_wr_addr_gray_0;
  wire rd_wr_addr_gray_3;
  wire rd_wr_addr_gray_6;
  wire \reclock_rd_addrgray[1].sync_rd_addrgray_n_0 ;
  wire \reclock_rd_addrgray[1].sync_rd_addrgray_n_1 ;
  wire \reclock_rd_addrgray[3].sync_rd_addrgray_n_0 ;
  wire \reclock_rd_addrgray[4].sync_rd_addrgray_n_0 ;
  wire \reclock_rd_addrgray[5].sync_rd_addrgray_n_0 ;
  wire \reclock_rd_addrgray[6].sync_rd_addrgray_n_0 ;
  wire \reclock_rd_addrgray[6].sync_rd_addrgray_n_1 ;
  wire \reclock_wr_addrgray[1].sync_wr_addrgray_n_0 ;
  wire \reclock_wr_addrgray[1].sync_wr_addrgray_n_1 ;
  wire \reclock_wr_addrgray[3].sync_wr_addrgray_n_0 ;
  wire \reclock_wr_addrgray[4].sync_wr_addrgray_n_0 ;
  wire \reclock_wr_addrgray[5].sync_wr_addrgray_n_0 ;
  wire \reclock_wr_addrgray[6].sync_wr_addrgray_n_0 ;
  wire \reclock_wr_addrgray[6].sync_wr_addrgray_n_1 ;
  wire remove_idle0;
  wire remove_idle_i_2_n_0;
  wire remove_idle_i_3_n_0;
  wire remove_idle_i_4_n_0;
  wire remove_idle_i_5_n_0;
  wire remove_idle_i_6_n_0;
  wire remove_idle_reg2;
  wire remove_idle_reg2_reg_0;
  wire remove_idle_reg3;
  wire remove_idle_reg4;
  wire reset_modified;
  wire reset_modified_i_1_n_0;
  wire reset_out;
  wire reset_sync6;
  wire reset_sync6_0;
  wire [0:0]reset_sync6_1;
  wire rxbuferr_reg_0;
  wire [2:0]rxbuferr_reg_1;
  wire rxbuferr_reg_2;
  wire [0:0]rxbufstatus;
  wire rxchariscomma_usr_i_1_n_0;
  wire rxchariscomma_usr_i_2_n_0;
  wire rxcharisk_usr_i_1_n_0;
  wire [1:0]rxclkcorcnt;
  wire \rxclkcorcnt[0]_i_1_n_0 ;
  wire \rxclkcorcnt[2]_i_1_n_0 ;
  wire \rxdata_usr[0]_i_1_n_0 ;
  wire \rxdata_usr[1]_i_1_n_0 ;
  wire \rxdata_usr[2]_i_1_n_0 ;
  wire \rxdata_usr[3]_i_1_n_0 ;
  wire \rxdata_usr[4]_i_1_n_0 ;
  wire \rxdata_usr[5]_i_1_n_0 ;
  wire \rxdata_usr[6]_i_1_n_0 ;
  wire \rxdata_usr[7]_i_1_n_0 ;
  wire [0:0]rxdisperr;
  wire rxdisperr_usr_i_1_n_0;
  wire [0:0]rxnotintable;
  wire [0:0]rxrundisp;
  wire rxrundisp_usr_i_1_n_0;
  wire start;
  wire [6:0]wr_addr;
  wire \wr_addr[5]_i_1_n_0 ;
  wire \wr_addr[5]_i_2_n_0 ;
  wire \wr_addr[6]_i_3_n_0 ;
  wire [6:0]wr_addr_gray;
  wire [6:0]wr_addr_plus1;
  wire \wr_addr_plus1[6]_i_1_n_0 ;
  wire \wr_addr_plus1_reg[5]_0 ;
  wire \wr_addr_plus2[0]_i_1_n_0 ;
  wire \wr_addr_plus2[1]_i_1_n_0 ;
  wire \wr_addr_plus2[2]_i_1_n_0 ;
  wire \wr_addr_plus2[3]_i_1_n_0 ;
  wire \wr_addr_plus2[4]_i_1_n_0 ;
  wire \wr_addr_plus2[5]_i_1_n_0 ;
  wire \wr_addr_plus2[6]_i_1_n_0 ;
  wire \wr_addr_plus2[6]_i_2_n_0 ;
  wire \wr_addr_plus2_reg_n_0_[0] ;
  wire \wr_addr_plus2_reg_n_0_[6] ;
  wire [12:8]wr_data;
  wire [13:0]wr_data_reg__0;
  wire \wr_data_reg_n_0_[0] ;
  wire \wr_data_reg_n_0_[1] ;
  wire \wr_data_reg_n_0_[2] ;
  wire \wr_data_reg_n_0_[3] ;
  wire \wr_data_reg_n_0_[4] ;
  wire \wr_data_reg_n_0_[5] ;
  wire \wr_data_reg_n_0_[6] ;
  wire \wr_data_reg_n_0_[7] ;
  wire [13:0]wr_data_reg_reg__0;
  wire [6:0]wr_occupancy;
  wire [6:0]wr_occupancy00_out;
  wire wr_occupancy0_carry_n_2;
  wire wr_occupancy0_carry_n_3;
  wire wr_occupancy0_carry_n_5;
  wire wr_occupancy0_carry_n_6;
  wire wr_occupancy0_carry_n_7;
  wire wr_rd_addr_gray_0;
  wire wr_rd_addr_gray_2;
  wire wr_rd_addr_gray_3;
  wire wr_rd_addr_gray_4;
  wire wr_rd_addr_gray_5;
  wire wr_rd_addr_gray_6;
  wire NLW_ram_reg_0_63_0_6_DOH_UNCONNECTED;
  wire NLW_ram_reg_0_63_7_13_DOH_UNCONNECTED;
  wire NLW_ram_reg_64_127_0_6_DOH_UNCONNECTED;
  wire NLW_ram_reg_64_127_7_13_DOH_UNCONNECTED;
  wire [7:3]NLW_rd_occupancy0_carry_CO_UNCONNECTED;
  wire [7:7]NLW_rd_occupancy0_carry_O_UNCONNECTED;
  wire [7:3]NLW_wr_occupancy0_carry_CO_UNCONNECTED;
  wire [7:7]NLW_wr_occupancy0_carry_O_UNCONNECTED;

  LUT5 #(
    .INIT(32'h55750000)) 
    \__1/ram_reg_64_127_0_6_i_1 
       (.I0(data_in),
        .I1(D),
        .I2(E),
        .I3(remove_idle_reg2_reg_0),
        .I4(wr_addr[6]),
        .O(\__1/ram_reg_64_127_0_6_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair103" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \__1/rd_data[0]_i_1 
       (.I0(ram_reg_64_127_0_6_n_0),
        .I1(rd_addr[6]),
        .I2(ram_reg_0_63_0_6_n_0),
        .O(dpo[0]));
  (* SOFT_HLUTNM = "soft_lutpair105" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \__1/rd_data[10]_i_1 
       (.I0(ram_reg_64_127_7_13_n_3),
        .I1(rd_addr[6]),
        .I2(ram_reg_0_63_7_13_n_3),
        .O(dpo[10]));
  (* SOFT_HLUTNM = "soft_lutpair108" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \__1/rd_data[11]_i_1 
       (.I0(ram_reg_64_127_7_13_n_4),
        .I1(rd_addr[6]),
        .I2(ram_reg_0_63_7_13_n_4),
        .O(dpo[11]));
  (* SOFT_HLUTNM = "soft_lutpair109" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \__1/rd_data[12]_i_1 
       (.I0(ram_reg_64_127_7_13_n_5),
        .I1(rd_addr[6]),
        .I2(ram_reg_0_63_7_13_n_5),
        .O(dpo[12]));
  (* SOFT_HLUTNM = "soft_lutpair109" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \__1/rd_data[13]_i_1 
       (.I0(ram_reg_64_127_7_13_n_6),
        .I1(rd_addr[6]),
        .I2(ram_reg_0_63_7_13_n_6),
        .O(dpo[13]));
  (* SOFT_HLUTNM = "soft_lutpair104" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \__1/rd_data[1]_i_1 
       (.I0(ram_reg_64_127_0_6_n_1),
        .I1(rd_addr[6]),
        .I2(ram_reg_0_63_0_6_n_1),
        .O(dpo[1]));
  (* SOFT_HLUTNM = "soft_lutpair104" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \__1/rd_data[2]_i_1 
       (.I0(ram_reg_64_127_0_6_n_2),
        .I1(rd_addr[6]),
        .I2(ram_reg_0_63_0_6_n_2),
        .O(dpo[2]));
  (* SOFT_HLUTNM = "soft_lutpair105" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \__1/rd_data[3]_i_1 
       (.I0(ram_reg_64_127_0_6_n_3),
        .I1(rd_addr[6]),
        .I2(ram_reg_0_63_0_6_n_3),
        .O(dpo[3]));
  (* SOFT_HLUTNM = "soft_lutpair106" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \__1/rd_data[4]_i_1 
       (.I0(ram_reg_64_127_0_6_n_4),
        .I1(rd_addr[6]),
        .I2(ram_reg_0_63_0_6_n_4),
        .O(dpo[4]));
  (* SOFT_HLUTNM = "soft_lutpair107" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \__1/rd_data[5]_i_1 
       (.I0(ram_reg_64_127_0_6_n_5),
        .I1(rd_addr[6]),
        .I2(ram_reg_0_63_0_6_n_5),
        .O(dpo[5]));
  (* SOFT_HLUTNM = "soft_lutpair107" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \__1/rd_data[6]_i_1 
       (.I0(ram_reg_64_127_0_6_n_6),
        .I1(rd_addr[6]),
        .I2(ram_reg_0_63_0_6_n_6),
        .O(dpo[6]));
  (* SOFT_HLUTNM = "soft_lutpair106" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \__1/rd_data[7]_i_1 
       (.I0(ram_reg_64_127_7_13_n_0),
        .I1(rd_addr[6]),
        .I2(ram_reg_0_63_7_13_n_0),
        .O(dpo[7]));
  (* SOFT_HLUTNM = "soft_lutpair108" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \__1/rd_data[8]_i_1 
       (.I0(ram_reg_64_127_7_13_n_1),
        .I1(rd_addr[6]),
        .I2(ram_reg_0_63_7_13_n_1),
        .O(dpo[8]));
  (* SOFT_HLUTNM = "soft_lutpair103" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \__1/rd_data[9]_i_1 
       (.I0(ram_reg_64_127_7_13_n_2),
        .I1(rd_addr[6]),
        .I2(ram_reg_0_63_7_13_n_2),
        .O(dpo[9]));
  (* SOFT_HLUTNM = "soft_lutpair95" *) 
  LUT5 #(
    .INIT(32'h00200000)) 
    \d16p2_wr_pipe[0]_i_1 
       (.I0(\d16p2_wr_pipe[0]_i_2_n_0 ),
        .I1(\wr_data_reg_n_0_[1] ),
        .I2(\wr_data_reg_n_0_[4] ),
        .I3(p_0_in),
        .I4(\wr_data_reg_n_0_[6] ),
        .O(d16p2_wr));
  LUT5 #(
    .INIT(32'h00000001)) 
    \d16p2_wr_pipe[0]_i_2 
       (.I0(\wr_data_reg_n_0_[3] ),
        .I1(\wr_data_reg_n_0_[2] ),
        .I2(\wr_data_reg_n_0_[7] ),
        .I3(\wr_data_reg_n_0_[0] ),
        .I4(\wr_data_reg_n_0_[5] ),
        .O(\d16p2_wr_pipe[0]_i_2_n_0 ));
  FDRE \d16p2_wr_pipe_reg[0] 
       (.C(Rx_SysClk),
        .CE(E),
        .D(d16p2_wr),
        .Q(\d16p2_wr_pipe_reg_n_0_[0] ),
        .R(SR));
  FDRE \d16p2_wr_pipe_reg[1] 
       (.C(Rx_SysClk),
        .CE(E),
        .D(\d16p2_wr_pipe_reg_n_0_[0] ),
        .Q(p_4_in9_in),
        .R(SR));
  (* srl_bus_name = "inst/\pcs_pma_block_i/gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst/rx_elastic_buffer_inst/d21p5_wr_pipe_reg " *) 
  (* srl_name = "inst/\pcs_pma_block_i/gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst/rx_elastic_buffer_inst/d21p5_wr_pipe_reg[1]_srl2___pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_0 " *) 
  SRL16E \d21p5_wr_pipe_reg[1]_srl2___pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_0 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(E),
        .CLK(Rx_SysClk),
        .D(d21p5_wr),
        .Q(\d21p5_wr_pipe_reg[1]_srl2___pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair100" *) 
  LUT4 #(
    .INIT(16'h0004)) 
    \d21p5_wr_pipe_reg[1]_srl2___pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_0_i_1 
       (.I0(\wr_data_reg_n_0_[1] ),
        .I1(\wr_data_reg_n_0_[7] ),
        .I2(\wr_data_reg_n_0_[6] ),
        .I3(\d21p5_wr_pipe_reg[1]_srl2___pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_0_i_2_n_0 ),
        .O(d21p5_wr));
  LUT6 #(
    .INIT(64'hFFF7FFFFFFFFFFFF)) 
    \d21p5_wr_pipe_reg[1]_srl2___pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_0_i_2 
       (.I0(\wr_data_reg_n_0_[4] ),
        .I1(\wr_data_reg_n_0_[2] ),
        .I2(p_0_in),
        .I3(\wr_data_reg_n_0_[3] ),
        .I4(\wr_data_reg_n_0_[5] ),
        .I5(\wr_data_reg_n_0_[0] ),
        .O(\d21p5_wr_pipe_reg[1]_srl2___pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_0_i_2_n_0 ));
  FDRE \d21p5_wr_pipe_reg[2]_pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_1 
       (.C(Rx_SysClk),
        .CE(E),
        .D(\d21p5_wr_pipe_reg[1]_srl2___pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_0_n_0 ),
        .Q(\d21p5_wr_pipe_reg[3]_0 ),
        .R(1'b0));
  FDRE \d21p5_wr_pipe_reg[3] 
       (.C(Rx_SysClk),
        .CE(E),
        .D(\d21p5_wr_pipe_reg[2]_pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_1_0 ),
        .Q(d21p5_wr_pipe),
        .R(SR));
  (* srl_bus_name = "inst/\pcs_pma_block_i/gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst/rx_elastic_buffer_inst/d2p2_wr_pipe_reg " *) 
  (* srl_name = "inst/\pcs_pma_block_i/gen_lvds_transceiver.gen_lvds_transceiver_logic[0].lvds_transceiver_inst/rx_elastic_buffer_inst/d2p2_wr_pipe_reg[1]_srl2___pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_0 " *) 
  SRL16E \d2p2_wr_pipe_reg[1]_srl2___pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_0 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(E),
        .CLK(Rx_SysClk),
        .D(d2p2_wr),
        .Q(\d2p2_wr_pipe_reg[1]_srl2___pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair95" *) 
  LUT5 #(
    .INIT(32'h00200000)) 
    \d2p2_wr_pipe_reg[1]_srl2___pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_0_i_1 
       (.I0(\d16p2_wr_pipe[0]_i_2_n_0 ),
        .I1(\wr_data_reg_n_0_[4] ),
        .I2(\wr_data_reg_n_0_[1] ),
        .I3(p_0_in),
        .I4(\wr_data_reg_n_0_[6] ),
        .O(d2p2_wr));
  FDRE \d2p2_wr_pipe_reg[2]_pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_1 
       (.C(Rx_SysClk),
        .CE(E),
        .D(\d2p2_wr_pipe_reg[1]_srl2___pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_0_n_0 ),
        .Q(\d2p2_wr_pipe_reg[3]_0 ),
        .R(1'b0));
  FDRE \d2p2_wr_pipe_reg[3] 
       (.C(Rx_SysClk),
        .CE(E),
        .D(\d2p2_wr_pipe_reg[2]_pcs_pma_block_i_gen_lvds_transceiver.gen_lvds_transceiver_logic_r_1_0 ),
        .Q(d2p2_wr_pipe),
        .R(SR));
  LUT2 #(
    .INIT(4'h1)) 
    even_i_1
       (.I0(even),
        .I1(even0),
        .O(even_i_1_n_0));
  FDSE even_reg
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(even_i_1_n_0),
        .Q(even),
        .S(reset_modified));
  LUT1 #(
    .INIT(2'h1)) 
    \initialize_counter[0]_i_1 
       (.I0(initialize_counter_reg__0[0]),
        .O(p_0_in__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair110" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \initialize_counter[1]_i_1 
       (.I0(initialize_counter_reg__0[0]),
        .I1(initialize_counter_reg__0[1]),
        .O(p_0_in__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair110" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \initialize_counter[2]_i_1 
       (.I0(initialize_counter_reg__0[2]),
        .I1(initialize_counter_reg__0[1]),
        .I2(initialize_counter_reg__0[0]),
        .O(p_0_in__0[2]));
  (* SOFT_HLUTNM = "soft_lutpair94" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \initialize_counter[3]_i_1 
       (.I0(initialize_counter_reg__0[3]),
        .I1(initialize_counter_reg__0[0]),
        .I2(initialize_counter_reg__0[1]),
        .I3(initialize_counter_reg__0[2]),
        .O(p_0_in__0[3]));
  (* SOFT_HLUTNM = "soft_lutpair94" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \initialize_counter[4]_i_1 
       (.I0(initialize_counter_reg__0[4]),
        .I1(initialize_counter_reg__0[2]),
        .I2(initialize_counter_reg__0[1]),
        .I3(initialize_counter_reg__0[0]),
        .I4(initialize_counter_reg__0[3]),
        .O(p_0_in__0[4]));
  LUT2 #(
    .INIT(4'h2)) 
    \initialize_counter[5]_i_1 
       (.I0(initialize_ram),
        .I1(\initialize_counter_reg[0]_0 ),
        .O(initialize_counter0));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \initialize_counter[5]_i_2 
       (.I0(initialize_counter_reg__0[5]),
        .I1(initialize_counter_reg__0[3]),
        .I2(initialize_counter_reg__0[0]),
        .I3(initialize_counter_reg__0[1]),
        .I4(initialize_counter_reg__0[2]),
        .I5(initialize_counter_reg__0[4]),
        .O(p_0_in__0[5]));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \initialize_counter[5]_i_3 
       (.I0(initialize_counter_reg__0[5]),
        .I1(initialize_counter_reg__0[3]),
        .I2(initialize_counter_reg__0[0]),
        .I3(initialize_counter_reg__0[1]),
        .I4(initialize_counter_reg__0[2]),
        .I5(initialize_counter_reg__0[4]),
        .O(\initialize_counter_reg[0]_0 ));
  FDRE \initialize_counter_reg[0] 
       (.C(Rx_SysClk),
        .CE(initialize_counter0),
        .D(p_0_in__0[0]),
        .Q(initialize_counter_reg__0[0]),
        .R(initialize_ram0));
  FDRE \initialize_counter_reg[1] 
       (.C(Rx_SysClk),
        .CE(initialize_counter0),
        .D(p_0_in__0[1]),
        .Q(initialize_counter_reg__0[1]),
        .R(initialize_ram0));
  FDRE \initialize_counter_reg[2] 
       (.C(Rx_SysClk),
        .CE(initialize_counter0),
        .D(p_0_in__0[2]),
        .Q(initialize_counter_reg__0[2]),
        .R(initialize_ram0));
  FDRE \initialize_counter_reg[3] 
       (.C(Rx_SysClk),
        .CE(initialize_counter0),
        .D(p_0_in__0[3]),
        .Q(initialize_counter_reg__0[3]),
        .R(initialize_ram0));
  FDRE \initialize_counter_reg[4] 
       (.C(Rx_SysClk),
        .CE(initialize_counter0),
        .D(p_0_in__0[4]),
        .Q(initialize_counter_reg__0[4]),
        .R(initialize_ram0));
  FDRE \initialize_counter_reg[5] 
       (.C(Rx_SysClk),
        .CE(initialize_counter0),
        .D(p_0_in__0[5]),
        .Q(initialize_counter_reg__0[5]),
        .R(initialize_ram0));
  LUT2 #(
    .INIT(4'h2)) 
    initialize_ram_complete_pulse_i_1
       (.I0(data_in),
        .I1(initialize_ram_complete_reg__0),
        .O(initialize_ram_complete_pulse0));
  FDRE initialize_ram_complete_pulse_reg
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(initialize_ram_complete_pulse0),
        .Q(\wr_addr_plus1_reg[5]_0 ),
        .R(initialize_ram0));
  FDRE initialize_ram_complete_reg
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(initialize_ram_complete_reg_0),
        .Q(data_in),
        .R(initialize_ram0));
  LUT3 #(
    .INIT(8'hFE)) 
    initialize_ram_complete_reg_i_1
       (.I0(start),
        .I1(reset_out),
        .I2(reset_sync6),
        .O(initialize_ram0));
  FDRE initialize_ram_complete_reg_reg
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(data_in),
        .Q(initialize_ram_complete_reg__0),
        .R(initialize_ram0));
  FDRE initialize_ram_complete_sync_reg1_reg
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(data_out),
        .Q(initialize_ram_complete_sync_reg1),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    initialize_ram_complete_sync_ris_edg_reg
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(initialize_ram_complete_sync_ris_edg0),
        .Q(initialize_ram_complete_sync_ris_edg),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h2)) 
    initialize_ram_i_1
       (.I0(initialize_ram),
        .I1(data_in),
        .O(initialize_ram_i_1_n_0));
  FDSE initialize_ram_reg
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(initialize_ram_i_1_n_0),
        .Q(initialize_ram),
        .S(initialize_ram0));
  LUT6 #(
    .INIT(64'hAAAAAAAA00000080)) 
    insert_idle_i_1
       (.I0(insert_idle_i_2_n_0),
        .I1(insert_idle_i_3_n_0),
        .I2(insert_idle_i_4_n_0),
        .I3(\rd_data_reg_n_0_[3] ),
        .I4(\rd_data_reg_n_0_[11] ),
        .I5(insert_idle_i_5_n_0),
        .O(even0));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    insert_idle_i_10
       (.I0(rxbuferr_reg_1[2]),
        .I1(rd_occupancy[5]),
        .I2(rxbuferr_reg_1[0]),
        .I3(rxbuferr_reg_1[1]),
        .I4(rd_occupancy[1]),
        .I5(rd_occupancy[0]),
        .O(insert_idle_i_10_n_0));
  LUT6 #(
    .INIT(64'h0000010000000000)) 
    insert_idle_i_2
       (.I0(insert_idle),
        .I1(rd_occupancy[6]),
        .I2(\rd_data_reg_reg_n_0_[1] ),
        .I3(\rd_data_reg_reg_n_0_[2] ),
        .I4(\rd_data_reg_reg_n_0_[0] ),
        .I5(insert_idle_i_6_n_0),
        .O(insert_idle_i_2_n_0));
  LUT6 #(
    .INIT(64'h0000000015555555)) 
    insert_idle_i_3
       (.I0(rxbuferr_reg_1[2]),
        .I1(rxbuferr_reg_1[1]),
        .I2(rxbuferr_reg_1[0]),
        .I3(rd_occupancy[1]),
        .I4(rd_occupancy[0]),
        .I5(rd_occupancy[5]),
        .O(insert_idle_i_3_n_0));
  LUT5 #(
    .INIT(32'h30080008)) 
    insert_idle_i_4
       (.I0(insert_idle_i_7_n_0),
        .I1(\rd_data_reg_n_0_[1] ),
        .I2(\rd_data_reg_n_0_[2] ),
        .I3(\rd_data_reg_n_0_[0] ),
        .I4(insert_idle_i_8_n_0),
        .O(insert_idle_i_4_n_0));
  LUT5 #(
    .INIT(32'h00000100)) 
    insert_idle_i_5
       (.I0(\rd_data_reg_n_0_[2] ),
        .I1(\rd_data_reg_n_0_[1] ),
        .I2(\rd_data_reg_n_0_[0] ),
        .I3(insert_idle_i_9_n_0),
        .I4(insert_idle_i_10_n_0),
        .O(insert_idle_i_5_n_0));
  LUT6 #(
    .INIT(64'h0080000000000000)) 
    insert_idle_i_6
       (.I0(\rd_data_reg_reg_n_0_[3] ),
        .I1(\rd_data_reg_reg_n_0_[4] ),
        .I2(\rd_data_reg_reg_n_0_[5] ),
        .I3(\rd_data_reg_reg_n_0_[6] ),
        .I4(p_1_in3_in),
        .I5(\rd_data_reg_reg_n_0_[7] ),
        .O(insert_idle_i_6_n_0));
  (* SOFT_HLUTNM = "soft_lutpair101" *) 
  LUT4 #(
    .INIT(16'h0004)) 
    insert_idle_i_7
       (.I0(\rd_data_reg_n_0_[7] ),
        .I1(\rd_data_reg_n_0_[6] ),
        .I2(\rd_data_reg_n_0_[5] ),
        .I3(\rd_data_reg_n_0_[4] ),
        .O(insert_idle_i_7_n_0));
  (* SOFT_HLUTNM = "soft_lutpair101" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    insert_idle_i_8
       (.I0(\rd_data_reg_n_0_[6] ),
        .I1(\rd_data_reg_n_0_[7] ),
        .I2(\rd_data_reg_n_0_[5] ),
        .I3(\rd_data_reg_n_0_[4] ),
        .O(insert_idle_i_8_n_0));
  LUT6 #(
    .INIT(64'h0000000000000020)) 
    insert_idle_i_9
       (.I0(\rd_data_reg_n_0_[4] ),
        .I1(\rd_data_reg_n_0_[3] ),
        .I2(\rd_data_reg_n_0_[6] ),
        .I3(\rd_data_reg_n_0_[5] ),
        .I4(\rd_data_reg_n_0_[11] ),
        .I5(\rd_data_reg_n_0_[7] ),
        .O(insert_idle_i_9_n_0));
  FDRE insert_idle_reg
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(even0),
        .Q(insert_idle),
        .R(reset_modified));
  FDRE insert_idle_reg_reg
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(insert_idle),
        .Q(insert_idle_reg__0),
        .R(reset_modified));
  (* SOFT_HLUTNM = "soft_lutpair100" *) 
  LUT4 #(
    .INIT(16'h0004)) 
    \k28p5_wr_pipe[0]_i_1 
       (.I0(\wr_data_reg_n_0_[1] ),
        .I1(\wr_data_reg_n_0_[7] ),
        .I2(\wr_data_reg_n_0_[6] ),
        .I3(\k28p5_wr_pipe[0]_i_2_n_0 ),
        .O(p_3_out));
  LUT6 #(
    .INIT(64'hF7FFFFFFFFFFFFFF)) 
    \k28p5_wr_pipe[0]_i_2 
       (.I0(\wr_data_reg_n_0_[4] ),
        .I1(\wr_data_reg_n_0_[2] ),
        .I2(\wr_data_reg_n_0_[0] ),
        .I3(\wr_data_reg_n_0_[3] ),
        .I4(p_0_in),
        .I5(\wr_data_reg_n_0_[5] ),
        .O(\k28p5_wr_pipe[0]_i_2_n_0 ));
  FDRE \k28p5_wr_pipe_reg[0] 
       (.C(Rx_SysClk),
        .CE(E),
        .D(p_3_out),
        .Q(\k28p5_wr_pipe_reg_n_0_[0] ),
        .R(SR));
  FDRE \k28p5_wr_pipe_reg[1] 
       (.C(Rx_SysClk),
        .CE(E),
        .D(\k28p5_wr_pipe_reg_n_0_[0] ),
        .Q(\k28p5_wr_pipe_reg_n_0_[1] ),
        .R(SR));
  FDRE \k28p5_wr_pipe_reg[2] 
       (.C(Rx_SysClk),
        .CE(E),
        .D(\k28p5_wr_pipe_reg_n_0_[1] ),
        .Q(\k28p5_wr_pipe_reg_n_0_[2] ),
        .R(SR));
  FDRE \k28p5_wr_pipe_reg[3] 
       (.C(Rx_SysClk),
        .CE(E),
        .D(\k28p5_wr_pipe_reg_n_0_[2] ),
        .Q(\k28p5_wr_pipe_reg_n_0_[3] ),
        .R(SR));
  FDRE \k28p5_wr_pipe_reg[4] 
       (.C(Rx_SysClk),
        .CE(E),
        .D(\k28p5_wr_pipe_reg_n_0_[3] ),
        .Q(\k28p5_wr_pipe_reg_n_0_[4] ),
        .R(SR));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M8 ram_reg_0_63_0_6
       (.ADDRA(rd_addr[5:0]),
        .ADDRB(rd_addr[5:0]),
        .ADDRC(rd_addr[5:0]),
        .ADDRD(rd_addr[5:0]),
        .ADDRE(rd_addr[5:0]),
        .ADDRF(rd_addr[5:0]),
        .ADDRG(rd_addr[5:0]),
        .ADDRH(wr_addr[5:0]),
        .DIA(wr_data_reg_reg__0[0]),
        .DIB(wr_data_reg_reg__0[1]),
        .DIC(wr_data_reg_reg__0[2]),
        .DID(wr_data_reg_reg__0[3]),
        .DIE(wr_data_reg_reg__0[4]),
        .DIF(wr_data_reg_reg__0[5]),
        .DIG(wr_data_reg_reg__0[6]),
        .DIH(1'b0),
        .DOA(ram_reg_0_63_0_6_n_0),
        .DOB(ram_reg_0_63_0_6_n_1),
        .DOC(ram_reg_0_63_0_6_n_2),
        .DOD(ram_reg_0_63_0_6_n_3),
        .DOE(ram_reg_0_63_0_6_n_4),
        .DOF(ram_reg_0_63_0_6_n_5),
        .DOG(ram_reg_0_63_0_6_n_6),
        .DOH(NLW_ram_reg_0_63_0_6_DOH_UNCONNECTED),
        .WCLK(Rx_SysClk),
        .WE(ram_reg_0_63_0_6_i_1_n_0));
  LUT5 #(
    .INIT(32'h00005575)) 
    ram_reg_0_63_0_6_i_1
       (.I0(data_in),
        .I1(D),
        .I2(E),
        .I3(remove_idle_reg2_reg_0),
        .I4(wr_addr[6]),
        .O(ram_reg_0_63_0_6_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M8 ram_reg_0_63_7_13
       (.ADDRA(rd_addr[5:0]),
        .ADDRB(rd_addr[5:0]),
        .ADDRC(rd_addr[5:0]),
        .ADDRD(rd_addr[5:0]),
        .ADDRE(rd_addr[5:0]),
        .ADDRF(rd_addr[5:0]),
        .ADDRG(rd_addr[5:0]),
        .ADDRH(wr_addr[5:0]),
        .DIA(wr_data_reg_reg__0[7]),
        .DIB(wr_data_reg_reg__0[8]),
        .DIC(wr_data_reg_reg__0[9]),
        .DID(wr_data_reg_reg__0[10]),
        .DIE(wr_data_reg_reg__0[11]),
        .DIF(wr_data_reg_reg__0[12]),
        .DIG(wr_data_reg_reg__0[13]),
        .DIH(1'b0),
        .DOA(ram_reg_0_63_7_13_n_0),
        .DOB(ram_reg_0_63_7_13_n_1),
        .DOC(ram_reg_0_63_7_13_n_2),
        .DOD(ram_reg_0_63_7_13_n_3),
        .DOE(ram_reg_0_63_7_13_n_4),
        .DOF(ram_reg_0_63_7_13_n_5),
        .DOG(ram_reg_0_63_7_13_n_6),
        .DOH(NLW_ram_reg_0_63_7_13_DOH_UNCONNECTED),
        .WCLK(Rx_SysClk),
        .WE(ram_reg_0_63_0_6_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M8 ram_reg_64_127_0_6
       (.ADDRA(rd_addr[5:0]),
        .ADDRB(rd_addr[5:0]),
        .ADDRC(rd_addr[5:0]),
        .ADDRD(rd_addr[5:0]),
        .ADDRE(rd_addr[5:0]),
        .ADDRF(rd_addr[5:0]),
        .ADDRG(rd_addr[5:0]),
        .ADDRH(wr_addr[5:0]),
        .DIA(wr_data_reg_reg__0[0]),
        .DIB(wr_data_reg_reg__0[1]),
        .DIC(wr_data_reg_reg__0[2]),
        .DID(wr_data_reg_reg__0[3]),
        .DIE(wr_data_reg_reg__0[4]),
        .DIF(wr_data_reg_reg__0[5]),
        .DIG(wr_data_reg_reg__0[6]),
        .DIH(1'b0),
        .DOA(ram_reg_64_127_0_6_n_0),
        .DOB(ram_reg_64_127_0_6_n_1),
        .DOC(ram_reg_64_127_0_6_n_2),
        .DOD(ram_reg_64_127_0_6_n_3),
        .DOE(ram_reg_64_127_0_6_n_4),
        .DOF(ram_reg_64_127_0_6_n_5),
        .DOG(ram_reg_64_127_0_6_n_6),
        .DOH(NLW_ram_reg_64_127_0_6_DOH_UNCONNECTED),
        .WCLK(Rx_SysClk),
        .WE(\__1/ram_reg_64_127_0_6_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM64M8 ram_reg_64_127_7_13
       (.ADDRA(rd_addr[5:0]),
        .ADDRB(rd_addr[5:0]),
        .ADDRC(rd_addr[5:0]),
        .ADDRD(rd_addr[5:0]),
        .ADDRE(rd_addr[5:0]),
        .ADDRF(rd_addr[5:0]),
        .ADDRG(rd_addr[5:0]),
        .ADDRH(wr_addr[5:0]),
        .DIA(wr_data_reg_reg__0[7]),
        .DIB(wr_data_reg_reg__0[8]),
        .DIC(wr_data_reg_reg__0[9]),
        .DID(wr_data_reg_reg__0[10]),
        .DIE(wr_data_reg_reg__0[11]),
        .DIF(wr_data_reg_reg__0[12]),
        .DIG(wr_data_reg_reg__0[13]),
        .DIH(1'b0),
        .DOA(ram_reg_64_127_7_13_n_0),
        .DOB(ram_reg_64_127_7_13_n_1),
        .DOC(ram_reg_64_127_7_13_n_2),
        .DOD(ram_reg_64_127_7_13_n_3),
        .DOE(ram_reg_64_127_7_13_n_4),
        .DOF(ram_reg_64_127_7_13_n_5),
        .DOG(ram_reg_64_127_7_13_n_6),
        .DOH(NLW_ram_reg_64_127_7_13_DOH_UNCONNECTED),
        .WCLK(Rx_SysClk),
        .WE(\__1/ram_reg_64_127_0_6_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \rd_addr[6]_i_1 
       (.I0(insert_idle),
        .I1(insert_idle_reg__0),
        .O(rd_enable));
  (* SOFT_HLUTNM = "soft_lutpair116" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \rd_addr_gray[0]_i_1 
       (.I0(\rd_addr_plus2_reg_n_0_[0] ),
        .I1(p_1_in),
        .O(\rd_addr_gray[0]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rd_addr_gray[1]_i_1 
       (.I0(p_1_in),
        .I1(p_2_in20_in),
        .O(\rd_addr_gray[1]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rd_addr_gray[2]_i_1 
       (.I0(p_2_in20_in),
        .I1(p_3_in),
        .O(\rd_addr_gray[2]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rd_addr_gray[3]_i_1 
       (.I0(p_3_in),
        .I1(p_4_in23_in),
        .O(\rd_addr_gray[3]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rd_addr_gray[4]_i_1 
       (.I0(p_4_in23_in),
        .I1(p_5_in),
        .O(\rd_addr_gray[4]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rd_addr_gray[5]_i_1 
       (.I0(p_5_in),
        .I1(\rd_addr_plus2_reg_n_0_[6] ),
        .O(\rd_addr_gray[5]_i_1_n_0 ));
  FDRE \rd_addr_gray_reg[0] 
       (.C(Tx_WrClk),
        .CE(rd_enable),
        .D(\rd_addr_gray[0]_i_1_n_0 ),
        .Q(rd_addr_gray[0]),
        .R(reset_modified));
  FDRE \rd_addr_gray_reg[1] 
       (.C(Tx_WrClk),
        .CE(rd_enable),
        .D(\rd_addr_gray[1]_i_1_n_0 ),
        .Q(rd_addr_gray[1]),
        .R(reset_modified));
  FDRE \rd_addr_gray_reg[2] 
       (.C(Tx_WrClk),
        .CE(rd_enable),
        .D(\rd_addr_gray[2]_i_1_n_0 ),
        .Q(rd_addr_gray[2]),
        .R(reset_modified));
  FDRE \rd_addr_gray_reg[3] 
       (.C(Tx_WrClk),
        .CE(rd_enable),
        .D(\rd_addr_gray[3]_i_1_n_0 ),
        .Q(rd_addr_gray[3]),
        .R(reset_modified));
  FDRE \rd_addr_gray_reg[4] 
       (.C(Tx_WrClk),
        .CE(rd_enable),
        .D(\rd_addr_gray[4]_i_1_n_0 ),
        .Q(rd_addr_gray[4]),
        .R(reset_modified));
  FDRE \rd_addr_gray_reg[5] 
       (.C(Tx_WrClk),
        .CE(rd_enable),
        .D(\rd_addr_gray[5]_i_1_n_0 ),
        .Q(rd_addr_gray[5]),
        .R(reset_modified));
  FDSE \rd_addr_plus1_reg[0] 
       (.C(Tx_WrClk),
        .CE(rd_enable),
        .D(\rd_addr_plus2_reg_n_0_[0] ),
        .Q(rd_addr_plus1[0]),
        .S(reset_modified));
  FDRE \rd_addr_plus1_reg[1] 
       (.C(Tx_WrClk),
        .CE(rd_enable),
        .D(p_1_in),
        .Q(rd_addr_plus1[1]),
        .R(reset_modified));
  FDRE \rd_addr_plus1_reg[2] 
       (.C(Tx_WrClk),
        .CE(rd_enable),
        .D(p_2_in20_in),
        .Q(rd_addr_plus1[2]),
        .R(reset_modified));
  FDRE \rd_addr_plus1_reg[3] 
       (.C(Tx_WrClk),
        .CE(rd_enable),
        .D(p_3_in),
        .Q(rd_addr_plus1[3]),
        .R(reset_modified));
  FDRE \rd_addr_plus1_reg[4] 
       (.C(Tx_WrClk),
        .CE(rd_enable),
        .D(p_4_in23_in),
        .Q(rd_addr_plus1[4]),
        .R(reset_modified));
  FDRE \rd_addr_plus1_reg[5] 
       (.C(Tx_WrClk),
        .CE(rd_enable),
        .D(p_5_in),
        .Q(rd_addr_plus1[5]),
        .R(reset_modified));
  FDRE \rd_addr_plus1_reg[6] 
       (.C(Tx_WrClk),
        .CE(rd_enable),
        .D(\rd_addr_plus2_reg_n_0_[6] ),
        .Q(rd_addr_plus1[6]),
        .R(reset_modified));
  (* SOFT_HLUTNM = "soft_lutpair116" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \rd_addr_plus2[0]_i_1 
       (.I0(\rd_addr_plus2_reg_n_0_[0] ),
        .O(p_0_in__1[0]));
  (* SOFT_HLUTNM = "soft_lutpair96" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \rd_addr_plus2[2]_i_1 
       (.I0(\rd_addr_plus2_reg_n_0_[0] ),
        .I1(p_1_in),
        .I2(p_2_in20_in),
        .O(p_0_in__1[2]));
  (* SOFT_HLUTNM = "soft_lutpair96" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \rd_addr_plus2[3]_i_1 
       (.I0(p_1_in),
        .I1(\rd_addr_plus2_reg_n_0_[0] ),
        .I2(p_2_in20_in),
        .I3(p_3_in),
        .O(p_0_in__1[3]));
  (* SOFT_HLUTNM = "soft_lutpair92" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \rd_addr_plus2[4]_i_1 
       (.I0(p_2_in20_in),
        .I1(\rd_addr_plus2_reg_n_0_[0] ),
        .I2(p_1_in),
        .I3(p_3_in),
        .I4(p_4_in23_in),
        .O(p_0_in__1[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \rd_addr_plus2[5]_i_1 
       (.I0(p_3_in),
        .I1(p_1_in),
        .I2(\rd_addr_plus2_reg_n_0_[0] ),
        .I3(p_2_in20_in),
        .I4(p_4_in23_in),
        .I5(p_5_in),
        .O(p_0_in__1[5]));
  LUT3 #(
    .INIT(8'h78)) 
    \rd_addr_plus2[6]_i_1 
       (.I0(\rd_addr_plus2[6]_i_2_n_0 ),
        .I1(p_5_in),
        .I2(\rd_addr_plus2_reg_n_0_[6] ),
        .O(p_0_in__1[6]));
  (* SOFT_HLUTNM = "soft_lutpair92" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \rd_addr_plus2[6]_i_2 
       (.I0(p_4_in23_in),
        .I1(p_2_in20_in),
        .I2(\rd_addr_plus2_reg_n_0_[0] ),
        .I3(p_1_in),
        .I4(p_3_in),
        .O(\rd_addr_plus2[6]_i_2_n_0 ));
  FDRE \rd_addr_plus2_reg[0] 
       (.C(Tx_WrClk),
        .CE(rd_enable),
        .D(p_0_in__1[0]),
        .Q(\rd_addr_plus2_reg_n_0_[0] ),
        .R(reset_modified));
  FDSE \rd_addr_plus2_reg[1] 
       (.C(Tx_WrClk),
        .CE(rd_enable),
        .D(\rd_addr_gray[0]_i_1_n_0 ),
        .Q(p_1_in),
        .S(reset_modified));
  FDRE \rd_addr_plus2_reg[2] 
       (.C(Tx_WrClk),
        .CE(rd_enable),
        .D(p_0_in__1[2]),
        .Q(p_2_in20_in),
        .R(reset_modified));
  FDRE \rd_addr_plus2_reg[3] 
       (.C(Tx_WrClk),
        .CE(rd_enable),
        .D(p_0_in__1[3]),
        .Q(p_3_in),
        .R(reset_modified));
  FDRE \rd_addr_plus2_reg[4] 
       (.C(Tx_WrClk),
        .CE(rd_enable),
        .D(p_0_in__1[4]),
        .Q(p_4_in23_in),
        .R(reset_modified));
  FDRE \rd_addr_plus2_reg[5] 
       (.C(Tx_WrClk),
        .CE(rd_enable),
        .D(p_0_in__1[5]),
        .Q(p_5_in),
        .R(reset_modified));
  FDRE \rd_addr_plus2_reg[6] 
       (.C(Tx_WrClk),
        .CE(rd_enable),
        .D(p_0_in__1[6]),
        .Q(\rd_addr_plus2_reg_n_0_[6] ),
        .R(reset_modified));
  FDRE \rd_addr_reg[0] 
       (.C(Tx_WrClk),
        .CE(rd_enable),
        .D(rd_addr_plus1[0]),
        .Q(rd_addr[0]),
        .R(reset_modified));
  FDRE \rd_addr_reg[1] 
       (.C(Tx_WrClk),
        .CE(rd_enable),
        .D(rd_addr_plus1[1]),
        .Q(rd_addr[1]),
        .R(reset_modified));
  FDRE \rd_addr_reg[2] 
       (.C(Tx_WrClk),
        .CE(rd_enable),
        .D(rd_addr_plus1[2]),
        .Q(rd_addr[2]),
        .R(reset_modified));
  FDRE \rd_addr_reg[3] 
       (.C(Tx_WrClk),
        .CE(rd_enable),
        .D(rd_addr_plus1[3]),
        .Q(rd_addr[3]),
        .R(reset_modified));
  FDRE \rd_addr_reg[4] 
       (.C(Tx_WrClk),
        .CE(rd_enable),
        .D(rd_addr_plus1[4]),
        .Q(rd_addr[4]),
        .R(reset_modified));
  FDRE \rd_addr_reg[5] 
       (.C(Tx_WrClk),
        .CE(rd_enable),
        .D(rd_addr_plus1[5]),
        .Q(rd_addr[5]),
        .R(reset_modified));
  FDRE \rd_addr_reg[6] 
       (.C(Tx_WrClk),
        .CE(rd_enable),
        .D(rd_addr_plus1[6]),
        .Q(rd_addr[6]),
        .R(reset_modified));
  FDRE \rd_data_reg[0] 
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(dpo[0]),
        .Q(\rd_data_reg_n_0_[0] ),
        .R(reset_modified));
  FDRE \rd_data_reg[10] 
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(dpo[10]),
        .Q(\rd_data_reg_n_0_[10] ),
        .R(reset_modified));
  FDRE \rd_data_reg[11] 
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(dpo[11]),
        .Q(\rd_data_reg_n_0_[11] ),
        .R(reset_modified));
  FDRE \rd_data_reg[12] 
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(dpo[12]),
        .Q(\rd_data_reg_n_0_[12] ),
        .R(reset_modified));
  FDRE \rd_data_reg[13] 
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(dpo[13]),
        .Q(\rd_data_reg_n_0_[13] ),
        .R(reset_modified));
  FDRE \rd_data_reg[1] 
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(dpo[1]),
        .Q(\rd_data_reg_n_0_[1] ),
        .R(reset_modified));
  FDRE \rd_data_reg[2] 
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(dpo[2]),
        .Q(\rd_data_reg_n_0_[2] ),
        .R(reset_modified));
  FDRE \rd_data_reg[3] 
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(dpo[3]),
        .Q(\rd_data_reg_n_0_[3] ),
        .R(reset_modified));
  FDRE \rd_data_reg[4] 
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(dpo[4]),
        .Q(\rd_data_reg_n_0_[4] ),
        .R(reset_modified));
  FDRE \rd_data_reg[5] 
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(dpo[5]),
        .Q(\rd_data_reg_n_0_[5] ),
        .R(reset_modified));
  FDRE \rd_data_reg[6] 
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(dpo[6]),
        .Q(\rd_data_reg_n_0_[6] ),
        .R(reset_modified));
  FDRE \rd_data_reg[7] 
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(dpo[7]),
        .Q(\rd_data_reg_n_0_[7] ),
        .R(reset_modified));
  FDRE \rd_data_reg[8] 
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(dpo[8]),
        .Q(p_2_in),
        .R(reset_modified));
  FDRE \rd_data_reg[9] 
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(dpo[9]),
        .Q(\rd_data_reg_n_0_[9] ),
        .R(reset_modified));
  FDRE \rd_data_reg_reg[0] 
       (.C(Tx_WrClk),
        .CE(rd_enable_reg),
        .D(\rd_data_reg_n_0_[0] ),
        .Q(\rd_data_reg_reg_n_0_[0] ),
        .R(reset_modified));
  FDRE \rd_data_reg_reg[10] 
       (.C(Tx_WrClk),
        .CE(rd_enable_reg),
        .D(\rd_data_reg_n_0_[10] ),
        .Q(\rd_data_reg_reg_n_0_[10] ),
        .R(reset_modified));
  FDRE \rd_data_reg_reg[11] 
       (.C(Tx_WrClk),
        .CE(rd_enable_reg),
        .D(\rd_data_reg_n_0_[11] ),
        .Q(p_1_in3_in),
        .R(reset_modified));
  FDRE \rd_data_reg_reg[12] 
       (.C(Tx_WrClk),
        .CE(rd_enable_reg),
        .D(\rd_data_reg_n_0_[12] ),
        .Q(\rd_data_reg_reg_n_0_[12] ),
        .R(reset_modified));
  FDRE \rd_data_reg_reg[13] 
       (.C(Tx_WrClk),
        .CE(rd_enable_reg),
        .D(\rd_data_reg_n_0_[13] ),
        .Q(\rd_data_reg_reg_n_0_[13] ),
        .R(reset_modified));
  FDRE \rd_data_reg_reg[1] 
       (.C(Tx_WrClk),
        .CE(rd_enable_reg),
        .D(\rd_data_reg_n_0_[1] ),
        .Q(\rd_data_reg_reg_n_0_[1] ),
        .R(reset_modified));
  FDRE \rd_data_reg_reg[2] 
       (.C(Tx_WrClk),
        .CE(rd_enable_reg),
        .D(\rd_data_reg_n_0_[2] ),
        .Q(\rd_data_reg_reg_n_0_[2] ),
        .R(reset_modified));
  FDRE \rd_data_reg_reg[3] 
       (.C(Tx_WrClk),
        .CE(rd_enable_reg),
        .D(\rd_data_reg_n_0_[3] ),
        .Q(\rd_data_reg_reg_n_0_[3] ),
        .R(reset_modified));
  FDRE \rd_data_reg_reg[4] 
       (.C(Tx_WrClk),
        .CE(rd_enable_reg),
        .D(\rd_data_reg_n_0_[4] ),
        .Q(\rd_data_reg_reg_n_0_[4] ),
        .R(reset_modified));
  FDRE \rd_data_reg_reg[5] 
       (.C(Tx_WrClk),
        .CE(rd_enable_reg),
        .D(\rd_data_reg_n_0_[5] ),
        .Q(\rd_data_reg_reg_n_0_[5] ),
        .R(reset_modified));
  FDRE \rd_data_reg_reg[6] 
       (.C(Tx_WrClk),
        .CE(rd_enable_reg),
        .D(\rd_data_reg_n_0_[6] ),
        .Q(\rd_data_reg_reg_n_0_[6] ),
        .R(reset_modified));
  FDRE \rd_data_reg_reg[7] 
       (.C(Tx_WrClk),
        .CE(rd_enable_reg),
        .D(\rd_data_reg_n_0_[7] ),
        .Q(\rd_data_reg_reg_n_0_[7] ),
        .R(reset_modified));
  FDRE \rd_data_reg_reg[8] 
       (.C(Tx_WrClk),
        .CE(rd_enable_reg),
        .D(p_2_in),
        .Q(\rd_data_reg_reg_n_0_[8] ),
        .R(reset_modified));
  FDRE \rd_data_reg_reg[9] 
       (.C(Tx_WrClk),
        .CE(rd_enable_reg),
        .D(\rd_data_reg_n_0_[9] ),
        .Q(\rd_data_reg_reg_n_0_[9] ),
        .R(reset_modified));
  FDSE rd_enable_reg_reg
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(rd_enable),
        .Q(rd_enable_reg),
        .S(reset_modified));
  CARRY8 rd_occupancy0_carry
       (.CI(1'b1),
        .CI_TOP(1'b0),
        .CO({NLW_rd_occupancy0_carry_CO_UNCONNECTED[7:6],rd_occupancy0_carry_n_2,rd_occupancy0_carry_n_3,NLW_rd_occupancy0_carry_CO_UNCONNECTED[3],rd_occupancy0_carry_n_5,rd_occupancy0_carry_n_6,rd_occupancy0_carry_n_7}),
        .DI({1'b0,1'b0,rd_wr_addr}),
        .O({NLW_rd_occupancy0_carry_O_UNCONNECTED[7],rd_occupancy01_out}),
        .S({1'b0,\reclock_wr_addrgray[6].sync_wr_addrgray_n_0 ,\reclock_wr_addrgray[6].sync_wr_addrgray_n_1 ,\reclock_wr_addrgray[5].sync_wr_addrgray_n_0 ,\reclock_wr_addrgray[4].sync_wr_addrgray_n_0 ,\reclock_wr_addrgray[3].sync_wr_addrgray_n_0 ,\reclock_wr_addrgray[1].sync_wr_addrgray_n_0 ,\reclock_wr_addrgray[1].sync_wr_addrgray_n_1 }));
  LUT2 #(
    .INIT(4'h6)) 
    rd_occupancy0_carry_i_1
       (.I0(p_1_out),
        .I1(rd_wr_addr_gray_6),
        .O(rd_wr_addr[5]));
  LUT3 #(
    .INIT(8'h96)) 
    rd_occupancy0_carry_i_2
       (.I0(p_2_out),
        .I1(rd_wr_addr_gray_6),
        .I2(p_1_out),
        .O(rd_wr_addr[4]));
  LUT4 #(
    .INIT(16'h6996)) 
    rd_occupancy0_carry_i_3
       (.I0(rd_wr_addr_gray_3),
        .I1(p_1_out),
        .I2(rd_wr_addr_gray_6),
        .I3(p_2_out),
        .O(rd_wr_addr[3]));
  LUT5 #(
    .INIT(32'h96696996)) 
    rd_occupancy0_carry_i_4
       (.I0(p_4_out),
        .I1(p_2_out),
        .I2(rd_wr_addr_gray_6),
        .I3(p_1_out),
        .I4(rd_wr_addr_gray_3),
        .O(rd_wr_addr[2]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    rd_occupancy0_carry_i_5
       (.I0(p_5_out),
        .I1(rd_wr_addr_gray_3),
        .I2(p_1_out),
        .I3(rd_wr_addr_gray_6),
        .I4(p_2_out),
        .I5(p_4_out),
        .O(rd_wr_addr[1]));
  LUT2 #(
    .INIT(4'h6)) 
    rd_occupancy0_carry_i_6
       (.I0(rd_wr_addr_gray_0),
        .I1(rd_wr_addr[1]),
        .O(rd_wr_addr[0]));
  FDRE \rd_occupancy_reg[0] 
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(rd_occupancy01_out[0]),
        .Q(rd_occupancy[0]),
        .R(reset_modified));
  FDRE \rd_occupancy_reg[1] 
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(rd_occupancy01_out[1]),
        .Q(rd_occupancy[1]),
        .R(reset_modified));
  FDRE \rd_occupancy_reg[2] 
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(rd_occupancy01_out[2]),
        .Q(rxbuferr_reg_1[0]),
        .R(reset_modified));
  FDRE \rd_occupancy_reg[3] 
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(rd_occupancy01_out[3]),
        .Q(rxbuferr_reg_1[1]),
        .R(reset_modified));
  FDRE \rd_occupancy_reg[4] 
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(rd_occupancy01_out[4]),
        .Q(rxbuferr_reg_1[2]),
        .R(reset_modified));
  FDRE \rd_occupancy_reg[5] 
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(rd_occupancy01_out[5]),
        .Q(rd_occupancy[5]),
        .R(reset_modified));
  FDSE \rd_occupancy_reg[6] 
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(rd_occupancy01_out[6]),
        .Q(rd_occupancy[6]),
        .S(reset_modified));
  design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_sync_block_7 \reclock_rd_addrgray[0].sync_rd_addrgray 
       (.Q(rd_addr_gray[0]),
        .Rx_SysClk(Rx_SysClk),
        .data_out(wr_rd_addr_gray_0));
  design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_sync_block_8 \reclock_rd_addrgray[1].sync_rd_addrgray 
       (.Q(wr_addr[1:0]),
        .Rx_SysClk(Rx_SysClk),
        .S({\reclock_rd_addrgray[1].sync_rd_addrgray_n_0 ,\reclock_rd_addrgray[1].sync_rd_addrgray_n_1 }),
        .data_out(wr_rd_addr_gray_3),
        .data_sync_reg6_0(wr_rd_addr_gray_5),
        .data_sync_reg6_1(wr_rd_addr_gray_6),
        .data_sync_reg6_2(wr_rd_addr_gray_4),
        .data_sync_reg6_3(wr_rd_addr_gray_2),
        .data_sync_reg6_4(wr_rd_addr_gray_0),
        .\rd_addr_gray_reg[1] (rd_addr_gray[1]));
  design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_sync_block_9 \reclock_rd_addrgray[2].sync_rd_addrgray 
       (.Q(rd_addr_gray[2]),
        .Rx_SysClk(Rx_SysClk),
        .data_out(wr_rd_addr_gray_2));
  design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_sync_block_10 \reclock_rd_addrgray[3].sync_rd_addrgray 
       (.Q(wr_addr[2]),
        .Rx_SysClk(Rx_SysClk),
        .S(\reclock_rd_addrgray[3].sync_rd_addrgray_n_0 ),
        .data_out(wr_rd_addr_gray_3),
        .data_sync_reg6_0(wr_rd_addr_gray_5),
        .data_sync_reg6_1(wr_rd_addr_gray_6),
        .data_sync_reg6_2(wr_rd_addr_gray_4),
        .data_sync_reg6_3(wr_rd_addr_gray_2),
        .\rd_addr_gray_reg[3] (rd_addr_gray[3]));
  design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_sync_block_11 \reclock_rd_addrgray[4].sync_rd_addrgray 
       (.Q(wr_addr[3]),
        .Rx_SysClk(Rx_SysClk),
        .S(\reclock_rd_addrgray[4].sync_rd_addrgray_n_0 ),
        .data_out(wr_rd_addr_gray_4),
        .data_sync_reg6_0(wr_rd_addr_gray_6),
        .data_sync_reg6_1(wr_rd_addr_gray_5),
        .data_sync_reg6_2(wr_rd_addr_gray_3),
        .\rd_addr_gray_reg[4] (rd_addr_gray[4]));
  design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_sync_block_12 \reclock_rd_addrgray[5].sync_rd_addrgray 
       (.Q(wr_addr[4]),
        .Rx_SysClk(Rx_SysClk),
        .S(\reclock_rd_addrgray[5].sync_rd_addrgray_n_0 ),
        .data_out(wr_rd_addr_gray_5),
        .data_sync_reg6_0(wr_rd_addr_gray_6),
        .data_sync_reg6_1(wr_rd_addr_gray_4),
        .\rd_addr_gray_reg[5] (rd_addr_gray[5]));
  design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_sync_block_13 \reclock_rd_addrgray[6].sync_rd_addrgray 
       (.Q(wr_addr[6:5]),
        .Rx_SysClk(Rx_SysClk),
        .S({\reclock_rd_addrgray[6].sync_rd_addrgray_n_0 ,\reclock_rd_addrgray[6].sync_rd_addrgray_n_1 }),
        .data_in(rd_addr_plus1[6]),
        .data_out(wr_rd_addr_gray_6),
        .data_sync_reg6_0(wr_rd_addr_gray_5));
  design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_sync_block_14 \reclock_wr_addrgray[0].sync_wr_addrgray 
       (.Q(wr_addr_gray[0]),
        .Tx_WrClk(Tx_WrClk),
        .data_out(rd_wr_addr_gray_0));
  design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_sync_block_15 \reclock_wr_addrgray[1].sync_wr_addrgray 
       (.Q(rd_addr[1:0]),
        .S({\reclock_wr_addrgray[1].sync_wr_addrgray_n_0 ,\reclock_wr_addrgray[1].sync_wr_addrgray_n_1 }),
        .Tx_WrClk(Tx_WrClk),
        .data_out(rd_wr_addr_gray_0),
        .\rd_occupancy_reg[6] (p_5_out),
        .rd_wr_addr(rd_wr_addr[1]),
        .\wr_addr_gray_reg[1] (wr_addr_gray[1]));
  design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_sync_block_16 \reclock_wr_addrgray[2].sync_wr_addrgray 
       (.Q(wr_addr_gray[2]),
        .Tx_WrClk(Tx_WrClk),
        .data_out(p_4_out));
  design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_sync_block_17 \reclock_wr_addrgray[3].sync_wr_addrgray 
       (.Q(rd_addr[2]),
        .S(\reclock_wr_addrgray[3].sync_wr_addrgray_n_0 ),
        .Tx_WrClk(Tx_WrClk),
        .data_out(rd_wr_addr_gray_3),
        .data_sync_reg6_0(p_1_out),
        .data_sync_reg6_1(rd_wr_addr_gray_6),
        .data_sync_reg6_2(p_2_out),
        .data_sync_reg6_3(p_4_out),
        .\wr_addr_gray_reg[3] (wr_addr_gray[3]));
  design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_sync_block_18 \reclock_wr_addrgray[4].sync_wr_addrgray 
       (.Q(rd_addr[3]),
        .S(\reclock_wr_addrgray[4].sync_wr_addrgray_n_0 ),
        .Tx_WrClk(Tx_WrClk),
        .data_out(p_2_out),
        .data_sync_reg6_0(rd_wr_addr_gray_6),
        .data_sync_reg6_1(p_1_out),
        .data_sync_reg6_2(rd_wr_addr_gray_3),
        .\wr_addr_gray_reg[4] (wr_addr_gray[4]));
  design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_sync_block_19 \reclock_wr_addrgray[5].sync_wr_addrgray 
       (.Q(rd_addr[4]),
        .S(\reclock_wr_addrgray[5].sync_wr_addrgray_n_0 ),
        .Tx_WrClk(Tx_WrClk),
        .data_out(p_1_out),
        .data_sync_reg6_0(rd_wr_addr_gray_6),
        .data_sync_reg6_1(p_2_out),
        .\wr_addr_gray_reg[5] (wr_addr_gray[5]));
  design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_sync_block_20 \reclock_wr_addrgray[6].sync_wr_addrgray 
       (.Q(rd_addr[6:5]),
        .S({\reclock_wr_addrgray[6].sync_wr_addrgray_n_0 ,\reclock_wr_addrgray[6].sync_wr_addrgray_n_1 }),
        .Tx_WrClk(Tx_WrClk),
        .data_out(rd_wr_addr_gray_6),
        .data_sync_reg6_0(p_1_out),
        .\wr_addr_gray_reg[6] (wr_addr_gray[6]));
  LUT5 #(
    .INIT(32'h00E00000)) 
    remove_idle_i_1
       (.I0(remove_idle_i_2_n_0),
        .I1(remove_idle_i_3_n_0),
        .I2(\k28p5_wr_pipe_reg_n_0_[0] ),
        .I3(D),
        .I4(wr_occupancy[6]),
        .O(remove_idle0));
  LUT5 #(
    .INIT(32'h0E0E0E00)) 
    remove_idle_i_2
       (.I0(d21p5_wr),
        .I1(d2p2_wr),
        .I2(remove_idle_i_4_n_0),
        .I3(wr_occupancy[0]),
        .I4(remove_idle_i_5_n_0),
        .O(remove_idle_i_2_n_0));
  LUT5 #(
    .INIT(32'h80808000)) 
    remove_idle_i_3
       (.I0(d16p2_wr),
        .I1(p_4_in9_in),
        .I2(\k28p5_wr_pipe_reg_n_0_[2] ),
        .I3(wr_occupancy[5]),
        .I4(remove_idle_i_5_n_0),
        .O(remove_idle_i_3_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFFB)) 
    remove_idle_i_4
       (.I0(remove_idle_reg2),
        .I1(wr_occupancy[5]),
        .I2(remove_idle_reg3),
        .I3(remove_idle_reg4),
        .I4(remove_idle_i_6_n_0),
        .O(remove_idle_i_4_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    remove_idle_i_5
       (.I0(wr_occupancy[4]),
        .I1(wr_occupancy[1]),
        .I2(wr_occupancy[3]),
        .I3(wr_occupancy[2]),
        .O(remove_idle_i_5_n_0));
  LUT4 #(
    .INIT(16'hFF1F)) 
    remove_idle_i_6
       (.I0(d21p5_wr_pipe),
        .I1(d2p2_wr_pipe),
        .I2(\k28p5_wr_pipe_reg_n_0_[4] ),
        .I3(remove_idle_reg2_reg_0),
        .O(remove_idle_i_6_n_0));
  FDRE remove_idle_reg
       (.C(Rx_SysClk),
        .CE(E),
        .D(remove_idle0),
        .Q(D),
        .R(SR));
  FDRE remove_idle_reg2_reg
       (.C(Rx_SysClk),
        .CE(E),
        .D(remove_idle_reg2_reg_0),
        .Q(remove_idle_reg2),
        .R(SR));
  FDRE remove_idle_reg3_reg
       (.C(Rx_SysClk),
        .CE(E),
        .D(remove_idle_reg2),
        .Q(remove_idle_reg3),
        .R(SR));
  FDRE remove_idle_reg4_reg
       (.C(Rx_SysClk),
        .CE(E),
        .D(remove_idle_reg3),
        .Q(remove_idle_reg4),
        .R(SR));
  FDRE remove_idle_reg_reg
       (.C(Rx_SysClk),
        .CE(E),
        .D(D),
        .Q(remove_idle_reg2_reg_0),
        .R(SR));
  LUT5 #(
    .INIT(32'h5F5F5F5C)) 
    reset_modified_i_1
       (.I0(initialize_ram_complete_sync_ris_edg),
        .I1(reset_sync6_0),
        .I2(reset_modified),
        .I3(mgt_rx_reset),
        .I4(elastic_buffer_rst_125),
        .O(reset_modified_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    reset_modified_reg
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(reset_modified_i_1_n_0),
        .Q(reset_modified),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair99" *) 
  LUT4 #(
    .INIT(16'h0007)) 
    rxbuferr_i_2
       (.I0(rd_occupancy[1]),
        .I1(rd_occupancy[0]),
        .I2(rd_occupancy[6]),
        .I3(rd_occupancy[5]),
        .O(rxbuferr_reg_0));
  (* SOFT_HLUTNM = "soft_lutpair99" *) 
  LUT4 #(
    .INIT(16'hE000)) 
    rxbuferr_i_3
       (.I0(rd_occupancy[1]),
        .I1(rd_occupancy[0]),
        .I2(rd_occupancy[6]),
        .I3(rd_occupancy[5]),
        .O(rxbuferr_reg_2));
  FDRE rxbuferr_reg
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(\rd_occupancy_reg[2]_0 ),
        .Q(rxbufstatus),
        .R(reset_modified));
  LUT3 #(
    .INIT(8'hAB)) 
    rxchariscomma_usr_i_1
       (.I0(reset_modified),
        .I1(rd_enable_reg),
        .I2(even),
        .O(rxchariscomma_usr_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair112" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    rxchariscomma_usr_i_2
       (.I0(\rd_data_reg_reg_n_0_[12] ),
        .I1(rd_enable_reg),
        .I2(even),
        .O(rxchariscomma_usr_i_2_n_0));
  FDRE rxchariscomma_usr_reg
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(rxchariscomma_usr_i_2_n_0),
        .Q(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISCOMMA_INT_reg ),
        .R(rxchariscomma_usr_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair112" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    rxcharisk_usr_i_1
       (.I0(p_1_in3_in),
        .I1(rd_enable_reg),
        .I2(even),
        .O(rxcharisk_usr_i_1_n_0));
  FDRE rxcharisk_usr_reg
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(rxcharisk_usr_i_1_n_0),
        .Q(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISK_INT_reg ),
        .R(rxchariscomma_usr_i_1_n_0));
  LUT4 #(
    .INIT(16'h22FA)) 
    \rxclkcorcnt[0]_i_1 
       (.I0(insert_idle_reg__0),
        .I1(rxclkcorcnt[1]),
        .I2(\rd_data_reg_reg_n_0_[13] ),
        .I3(rxclkcorcnt[0]),
        .O(\rxclkcorcnt[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00105010)) 
    \rxclkcorcnt[2]_i_1 
       (.I0(reset_modified),
        .I1(\rd_data_reg_reg_n_0_[13] ),
        .I2(insert_idle_reg__0),
        .I3(rxclkcorcnt[0]),
        .I4(rxclkcorcnt[1]),
        .O(\rxclkcorcnt[2]_i_1_n_0 ));
  FDRE \rxclkcorcnt_reg[0] 
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(\rxclkcorcnt[0]_i_1_n_0 ),
        .Q(rxclkcorcnt[0]),
        .R(reset_modified));
  FDRE \rxclkcorcnt_reg[2] 
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(\rxclkcorcnt[2]_i_1_n_0 ),
        .Q(rxclkcorcnt[1]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair115" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rxdata_usr[0]_i_1 
       (.I0(\rd_data_reg_reg_n_0_[0] ),
        .I1(rd_enable_reg),
        .O(\rxdata_usr[0]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \rxdata_usr[1]_i_1 
       (.I0(\rd_data_reg_reg_n_0_[1] ),
        .I1(rd_enable_reg),
        .O(\rxdata_usr[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair97" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \rxdata_usr[2]_i_1 
       (.I0(\rd_data_reg_reg_n_0_[2] ),
        .I1(even),
        .I2(rd_enable_reg),
        .O(\rxdata_usr[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair111" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \rxdata_usr[3]_i_1 
       (.I0(\rd_data_reg_reg_n_0_[3] ),
        .I1(even),
        .I2(rd_enable_reg),
        .O(\rxdata_usr[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair115" *) 
  LUT2 #(
    .INIT(4'hD)) 
    \rxdata_usr[4]_i_1 
       (.I0(rd_enable_reg),
        .I1(\rd_data_reg_reg_n_0_[4] ),
        .O(\rxdata_usr[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair111" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \rxdata_usr[5]_i_1 
       (.I0(\rd_data_reg_reg_n_0_[5] ),
        .I1(even),
        .I2(rd_enable_reg),
        .O(\rxdata_usr[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair113" *) 
  LUT3 #(
    .INIT(8'h8B)) 
    \rxdata_usr[6]_i_1 
       (.I0(\rd_data_reg_reg_n_0_[6] ),
        .I1(rd_enable_reg),
        .I2(even),
        .O(\rxdata_usr[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair113" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \rxdata_usr[7]_i_1 
       (.I0(\rd_data_reg_reg_n_0_[7] ),
        .I1(even),
        .I2(rd_enable_reg),
        .O(\rxdata_usr[7]_i_1_n_0 ));
  FDRE \rxdata_usr_reg[0] 
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(\rxdata_usr[0]_i_1_n_0 ),
        .Q(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg[7] [0]),
        .R(reset_modified));
  FDRE \rxdata_usr_reg[1] 
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(\rxdata_usr[1]_i_1_n_0 ),
        .Q(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg[7] [1]),
        .R(reset_modified));
  FDRE \rxdata_usr_reg[2] 
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(\rxdata_usr[2]_i_1_n_0 ),
        .Q(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg[7] [2]),
        .R(reset_modified));
  FDRE \rxdata_usr_reg[3] 
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(\rxdata_usr[3]_i_1_n_0 ),
        .Q(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg[7] [3]),
        .R(reset_modified));
  FDRE \rxdata_usr_reg[4] 
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(\rxdata_usr[4]_i_1_n_0 ),
        .Q(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg[7] [4]),
        .R(reset_modified));
  FDRE \rxdata_usr_reg[5] 
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(\rxdata_usr[5]_i_1_n_0 ),
        .Q(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg[7] [5]),
        .R(reset_modified));
  FDRE \rxdata_usr_reg[6] 
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(\rxdata_usr[6]_i_1_n_0 ),
        .Q(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg[7] [6]),
        .R(reset_modified));
  FDRE \rxdata_usr_reg[7] 
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(\rxdata_usr[7]_i_1_n_0 ),
        .Q(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg[7] [7]),
        .R(reset_modified));
  LUT2 #(
    .INIT(4'hD)) 
    rxdisperr_usr_i_1
       (.I0(rd_enable_reg),
        .I1(reset_modified),
        .O(rxdisperr_usr_i_1_n_0));
  FDRE rxdisperr_usr_reg
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(\rd_data_reg_reg_n_0_[10] ),
        .Q(rxdisperr),
        .R(rxdisperr_usr_i_1_n_0));
  FDRE rxnotintable_usr_reg
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(\rd_data_reg_reg_n_0_[9] ),
        .Q(rxnotintable),
        .R(rxdisperr_usr_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair97" *) 
  LUT4 #(
    .INIT(16'hBA8A)) 
    rxrundisp_usr_i_1
       (.I0(\rd_data_reg_reg_n_0_[8] ),
        .I1(rd_enable_reg),
        .I2(even),
        .I3(p_2_in),
        .O(rxrundisp_usr_i_1_n_0));
  FDRE rxrundisp_usr_reg
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(rxrundisp_usr_i_1_n_0),
        .Q(rxrundisp),
        .R(reset_modified));
  FDRE #(
    .INIT(1'b1)) 
    start_reg
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(1'b0),
        .Q(start),
        .R(1'b0));
  design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_sync_block_21 sync_initialize_ram_comp
       (.Tx_WrClk(Tx_WrClk),
        .data_out(data_out),
        .initialize_ram_complete_reg(data_in));
  LUT3 #(
    .INIT(8'hFE)) 
    \wr_addr[5]_i_1 
       (.I0(\wr_addr_plus1_reg[5]_0 ),
        .I1(reset_out),
        .I2(reset_sync6),
        .O(\wr_addr[5]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h04FF)) 
    \wr_addr[5]_i_2 
       (.I0(remove_idle_reg2_reg_0),
        .I1(E),
        .I2(D),
        .I3(data_in),
        .O(\wr_addr[5]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \wr_addr[6]_i_3 
       (.I0(wr_addr_plus1[6]),
        .I1(\wr_addr_plus1_reg[5]_0 ),
        .O(\wr_addr[6]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \wr_addr_gray[1]_i_1 
       (.I0(p_1_in28_in),
        .I1(p_2_in29_in),
        .O(p_6_out[1]));
  LUT2 #(
    .INIT(4'h6)) 
    \wr_addr_gray[2]_i_1 
       (.I0(p_2_in29_in),
        .I1(p_3_in31_in),
        .O(p_6_out[2]));
  LUT2 #(
    .INIT(4'h6)) 
    \wr_addr_gray[3]_i_1 
       (.I0(p_3_in31_in),
        .I1(p_4_in33_in),
        .O(p_6_out[3]));
  LUT2 #(
    .INIT(4'h6)) 
    \wr_addr_gray[4]_i_1 
       (.I0(p_4_in33_in),
        .I1(p_5_in35_in),
        .O(p_6_out[4]));
  LUT2 #(
    .INIT(4'h6)) 
    \wr_addr_gray[5]_i_1 
       (.I0(p_5_in35_in),
        .I1(\wr_addr_plus2_reg_n_0_[6] ),
        .O(p_6_out[5]));
  FDSE \wr_addr_gray_reg[0] 
       (.C(Rx_SysClk),
        .CE(E),
        .D(\wr_addr_plus2[1]_i_1_n_0 ),
        .Q(wr_addr_gray[0]),
        .S(SR));
  FDRE \wr_addr_gray_reg[1] 
       (.C(Rx_SysClk),
        .CE(E),
        .D(p_6_out[1]),
        .Q(wr_addr_gray[1]),
        .R(SR));
  FDRE \wr_addr_gray_reg[2] 
       (.C(Rx_SysClk),
        .CE(E),
        .D(p_6_out[2]),
        .Q(wr_addr_gray[2]),
        .R(SR));
  FDRE \wr_addr_gray_reg[3] 
       (.C(Rx_SysClk),
        .CE(E),
        .D(p_6_out[3]),
        .Q(wr_addr_gray[3]),
        .R(SR));
  FDRE \wr_addr_gray_reg[4] 
       (.C(Rx_SysClk),
        .CE(E),
        .D(p_6_out[4]),
        .Q(wr_addr_gray[4]),
        .R(SR));
  FDSE \wr_addr_gray_reg[5] 
       (.C(Rx_SysClk),
        .CE(E),
        .D(p_6_out[5]),
        .Q(wr_addr_gray[5]),
        .S(SR));
  FDSE \wr_addr_gray_reg[6] 
       (.C(Rx_SysClk),
        .CE(E),
        .D(\wr_addr_plus2_reg_n_0_[6] ),
        .Q(wr_addr_gray[6]),
        .S(SR));
  (* SOFT_HLUTNM = "soft_lutpair102" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \wr_addr_plus1[6]_i_1 
       (.I0(\wr_addr_plus2_reg_n_0_[6] ),
        .I1(\wr_addr_plus1_reg[5]_0 ),
        .O(\wr_addr_plus1[6]_i_1_n_0 ));
  FDSE \wr_addr_plus1_reg[0] 
       (.C(Rx_SysClk),
        .CE(\wr_addr[5]_i_2_n_0 ),
        .D(\wr_addr_plus2_reg_n_0_[0] ),
        .Q(wr_addr_plus1[0]),
        .S(\wr_addr[5]_i_1_n_0 ));
  FDRE \wr_addr_plus1_reg[1] 
       (.C(Rx_SysClk),
        .CE(\wr_addr[5]_i_2_n_0 ),
        .D(p_1_in28_in),
        .Q(wr_addr_plus1[1]),
        .R(\wr_addr[5]_i_1_n_0 ));
  FDRE \wr_addr_plus1_reg[2] 
       (.C(Rx_SysClk),
        .CE(\wr_addr[5]_i_2_n_0 ),
        .D(p_2_in29_in),
        .Q(wr_addr_plus1[2]),
        .R(\wr_addr[5]_i_1_n_0 ));
  FDRE \wr_addr_plus1_reg[3] 
       (.C(Rx_SysClk),
        .CE(\wr_addr[5]_i_2_n_0 ),
        .D(p_3_in31_in),
        .Q(wr_addr_plus1[3]),
        .R(\wr_addr[5]_i_1_n_0 ));
  FDRE \wr_addr_plus1_reg[4] 
       (.C(Rx_SysClk),
        .CE(\wr_addr[5]_i_2_n_0 ),
        .D(p_4_in33_in),
        .Q(wr_addr_plus1[4]),
        .R(\wr_addr[5]_i_1_n_0 ));
  FDRE \wr_addr_plus1_reg[5] 
       (.C(Rx_SysClk),
        .CE(\wr_addr[5]_i_2_n_0 ),
        .D(p_5_in35_in),
        .Q(wr_addr_plus1[5]),
        .R(\wr_addr[5]_i_1_n_0 ));
  FDRE \wr_addr_plus1_reg[6] 
       (.C(Rx_SysClk),
        .CE(initialize_ram_complete_reg_1),
        .D(\wr_addr_plus1[6]_i_1_n_0 ),
        .Q(wr_addr_plus1[6]),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair114" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \wr_addr_plus2[0]_i_1 
       (.I0(\wr_addr_plus2_reg_n_0_[0] ),
        .O(\wr_addr_plus2[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair114" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \wr_addr_plus2[1]_i_1 
       (.I0(\wr_addr_plus2_reg_n_0_[0] ),
        .I1(p_1_in28_in),
        .O(\wr_addr_plus2[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair98" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \wr_addr_plus2[2]_i_1 
       (.I0(\wr_addr_plus2_reg_n_0_[0] ),
        .I1(p_1_in28_in),
        .I2(p_2_in29_in),
        .O(\wr_addr_plus2[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair98" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \wr_addr_plus2[3]_i_1 
       (.I0(p_1_in28_in),
        .I1(\wr_addr_plus2_reg_n_0_[0] ),
        .I2(p_2_in29_in),
        .I3(p_3_in31_in),
        .O(\wr_addr_plus2[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair93" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \wr_addr_plus2[4]_i_1 
       (.I0(p_2_in29_in),
        .I1(\wr_addr_plus2_reg_n_0_[0] ),
        .I2(p_1_in28_in),
        .I3(p_3_in31_in),
        .I4(p_4_in33_in),
        .O(\wr_addr_plus2[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \wr_addr_plus2[5]_i_1 
       (.I0(p_3_in31_in),
        .I1(p_1_in28_in),
        .I2(\wr_addr_plus2_reg_n_0_[0] ),
        .I3(p_2_in29_in),
        .I4(p_4_in33_in),
        .I5(p_5_in35_in),
        .O(\wr_addr_plus2[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair102" *) 
  LUT4 #(
    .INIT(16'hFF6A)) 
    \wr_addr_plus2[6]_i_1 
       (.I0(\wr_addr_plus2_reg_n_0_[6] ),
        .I1(p_5_in35_in),
        .I2(\wr_addr_plus2[6]_i_2_n_0 ),
        .I3(\wr_addr_plus1_reg[5]_0 ),
        .O(\wr_addr_plus2[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair93" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \wr_addr_plus2[6]_i_2 
       (.I0(p_4_in33_in),
        .I1(p_2_in29_in),
        .I2(\wr_addr_plus2_reg_n_0_[0] ),
        .I3(p_1_in28_in),
        .I4(p_3_in31_in),
        .O(\wr_addr_plus2[6]_i_2_n_0 ));
  FDRE \wr_addr_plus2_reg[0] 
       (.C(Rx_SysClk),
        .CE(\wr_addr[5]_i_2_n_0 ),
        .D(\wr_addr_plus2[0]_i_1_n_0 ),
        .Q(\wr_addr_plus2_reg_n_0_[0] ),
        .R(\wr_addr[5]_i_1_n_0 ));
  FDSE \wr_addr_plus2_reg[1] 
       (.C(Rx_SysClk),
        .CE(\wr_addr[5]_i_2_n_0 ),
        .D(\wr_addr_plus2[1]_i_1_n_0 ),
        .Q(p_1_in28_in),
        .S(\wr_addr[5]_i_1_n_0 ));
  FDRE \wr_addr_plus2_reg[2] 
       (.C(Rx_SysClk),
        .CE(\wr_addr[5]_i_2_n_0 ),
        .D(\wr_addr_plus2[2]_i_1_n_0 ),
        .Q(p_2_in29_in),
        .R(\wr_addr[5]_i_1_n_0 ));
  FDRE \wr_addr_plus2_reg[3] 
       (.C(Rx_SysClk),
        .CE(\wr_addr[5]_i_2_n_0 ),
        .D(\wr_addr_plus2[3]_i_1_n_0 ),
        .Q(p_3_in31_in),
        .R(\wr_addr[5]_i_1_n_0 ));
  FDRE \wr_addr_plus2_reg[4] 
       (.C(Rx_SysClk),
        .CE(\wr_addr[5]_i_2_n_0 ),
        .D(\wr_addr_plus2[4]_i_1_n_0 ),
        .Q(p_4_in33_in),
        .R(\wr_addr[5]_i_1_n_0 ));
  FDRE \wr_addr_plus2_reg[5] 
       (.C(Rx_SysClk),
        .CE(\wr_addr[5]_i_2_n_0 ),
        .D(\wr_addr_plus2[5]_i_1_n_0 ),
        .Q(p_5_in35_in),
        .R(\wr_addr[5]_i_1_n_0 ));
  FDRE \wr_addr_plus2_reg[6] 
       (.C(Rx_SysClk),
        .CE(initialize_ram_complete_reg_1),
        .D(\wr_addr_plus2[6]_i_1_n_0 ),
        .Q(\wr_addr_plus2_reg_n_0_[6] ),
        .R(SR));
  FDRE \wr_addr_reg[0] 
       (.C(Rx_SysClk),
        .CE(\wr_addr[5]_i_2_n_0 ),
        .D(wr_addr_plus1[0]),
        .Q(wr_addr[0]),
        .R(\wr_addr[5]_i_1_n_0 ));
  FDRE \wr_addr_reg[1] 
       (.C(Rx_SysClk),
        .CE(\wr_addr[5]_i_2_n_0 ),
        .D(wr_addr_plus1[1]),
        .Q(wr_addr[1]),
        .R(\wr_addr[5]_i_1_n_0 ));
  FDRE \wr_addr_reg[2] 
       (.C(Rx_SysClk),
        .CE(\wr_addr[5]_i_2_n_0 ),
        .D(wr_addr_plus1[2]),
        .Q(wr_addr[2]),
        .R(\wr_addr[5]_i_1_n_0 ));
  FDRE \wr_addr_reg[3] 
       (.C(Rx_SysClk),
        .CE(\wr_addr[5]_i_2_n_0 ),
        .D(wr_addr_plus1[3]),
        .Q(wr_addr[3]),
        .R(\wr_addr[5]_i_1_n_0 ));
  FDRE \wr_addr_reg[4] 
       (.C(Rx_SysClk),
        .CE(\wr_addr[5]_i_2_n_0 ),
        .D(wr_addr_plus1[4]),
        .Q(wr_addr[4]),
        .R(\wr_addr[5]_i_1_n_0 ));
  FDRE \wr_addr_reg[5] 
       (.C(Rx_SysClk),
        .CE(\wr_addr[5]_i_2_n_0 ),
        .D(wr_addr_plus1[5]),
        .Q(wr_addr[5]),
        .R(\wr_addr[5]_i_1_n_0 ));
  FDRE \wr_addr_reg[6] 
       (.C(Rx_SysClk),
        .CE(initialize_ram_complete_reg_1),
        .D(\wr_addr[6]_i_3_n_0 ),
        .Q(wr_addr[6]),
        .R(SR));
  FDRE \wr_data_reg[0] 
       (.C(Rx_SysClk),
        .CE(E),
        .D(decoded_rxchariscomma_reg[0]),
        .Q(\wr_data_reg_n_0_[0] ),
        .R(reset_sync6_1));
  FDRE \wr_data_reg[10] 
       (.C(Rx_SysClk),
        .CE(E),
        .D(decoded_rxchariscomma_reg[10]),
        .Q(wr_data[10]),
        .R(reset_sync6_1));
  FDRE \wr_data_reg[11] 
       (.C(Rx_SysClk),
        .CE(E),
        .D(decoded_rxchariscomma_reg[11]),
        .Q(p_0_in),
        .R(reset_sync6_1));
  FDRE \wr_data_reg[12] 
       (.C(Rx_SysClk),
        .CE(E),
        .D(decoded_rxchariscomma_reg[12]),
        .Q(wr_data[12]),
        .R(reset_sync6_1));
  FDRE \wr_data_reg[1] 
       (.C(Rx_SysClk),
        .CE(E),
        .D(decoded_rxchariscomma_reg[1]),
        .Q(\wr_data_reg_n_0_[1] ),
        .R(reset_sync6_1));
  FDRE \wr_data_reg[2] 
       (.C(Rx_SysClk),
        .CE(E),
        .D(decoded_rxchariscomma_reg[2]),
        .Q(\wr_data_reg_n_0_[2] ),
        .R(reset_sync6_1));
  FDRE \wr_data_reg[3] 
       (.C(Rx_SysClk),
        .CE(E),
        .D(decoded_rxchariscomma_reg[3]),
        .Q(\wr_data_reg_n_0_[3] ),
        .R(reset_sync6_1));
  FDRE \wr_data_reg[4] 
       (.C(Rx_SysClk),
        .CE(E),
        .D(decoded_rxchariscomma_reg[4]),
        .Q(\wr_data_reg_n_0_[4] ),
        .R(reset_sync6_1));
  FDRE \wr_data_reg[5] 
       (.C(Rx_SysClk),
        .CE(E),
        .D(decoded_rxchariscomma_reg[5]),
        .Q(\wr_data_reg_n_0_[5] ),
        .R(reset_sync6_1));
  FDRE \wr_data_reg[6] 
       (.C(Rx_SysClk),
        .CE(E),
        .D(decoded_rxchariscomma_reg[6]),
        .Q(\wr_data_reg_n_0_[6] ),
        .R(reset_sync6_1));
  FDRE \wr_data_reg[7] 
       (.C(Rx_SysClk),
        .CE(E),
        .D(decoded_rxchariscomma_reg[7]),
        .Q(\wr_data_reg_n_0_[7] ),
        .R(reset_sync6_1));
  FDRE \wr_data_reg[8] 
       (.C(Rx_SysClk),
        .CE(E),
        .D(decoded_rxchariscomma_reg[8]),
        .Q(wr_data[8]),
        .R(reset_sync6_1));
  FDRE \wr_data_reg[9] 
       (.C(Rx_SysClk),
        .CE(E),
        .D(decoded_rxchariscomma_reg[9]),
        .Q(wr_data[9]),
        .R(reset_sync6_1));
  FDRE \wr_data_reg_reg[0] 
       (.C(Rx_SysClk),
        .CE(E),
        .D(\wr_data_reg_n_0_[0] ),
        .Q(wr_data_reg__0[0]),
        .R(reset_sync6_1));
  FDRE \wr_data_reg_reg[10] 
       (.C(Rx_SysClk),
        .CE(E),
        .D(wr_data[10]),
        .Q(wr_data_reg__0[10]),
        .R(reset_sync6_1));
  FDRE \wr_data_reg_reg[11] 
       (.C(Rx_SysClk),
        .CE(E),
        .D(p_0_in),
        .Q(wr_data_reg__0[11]),
        .R(reset_sync6_1));
  FDRE \wr_data_reg_reg[12] 
       (.C(Rx_SysClk),
        .CE(E),
        .D(wr_data[12]),
        .Q(wr_data_reg__0[12]),
        .R(reset_sync6_1));
  FDRE \wr_data_reg_reg[13] 
       (.C(Rx_SysClk),
        .CE(E),
        .D(D),
        .Q(wr_data_reg__0[13]),
        .R(reset_sync6_1));
  FDRE \wr_data_reg_reg[1] 
       (.C(Rx_SysClk),
        .CE(E),
        .D(\wr_data_reg_n_0_[1] ),
        .Q(wr_data_reg__0[1]),
        .R(reset_sync6_1));
  FDRE \wr_data_reg_reg[2] 
       (.C(Rx_SysClk),
        .CE(E),
        .D(\wr_data_reg_n_0_[2] ),
        .Q(wr_data_reg__0[2]),
        .R(reset_sync6_1));
  FDRE \wr_data_reg_reg[3] 
       (.C(Rx_SysClk),
        .CE(E),
        .D(\wr_data_reg_n_0_[3] ),
        .Q(wr_data_reg__0[3]),
        .R(reset_sync6_1));
  FDRE \wr_data_reg_reg[4] 
       (.C(Rx_SysClk),
        .CE(E),
        .D(\wr_data_reg_n_0_[4] ),
        .Q(wr_data_reg__0[4]),
        .R(reset_sync6_1));
  FDRE \wr_data_reg_reg[5] 
       (.C(Rx_SysClk),
        .CE(E),
        .D(\wr_data_reg_n_0_[5] ),
        .Q(wr_data_reg__0[5]),
        .R(reset_sync6_1));
  FDRE \wr_data_reg_reg[6] 
       (.C(Rx_SysClk),
        .CE(E),
        .D(\wr_data_reg_n_0_[6] ),
        .Q(wr_data_reg__0[6]),
        .R(reset_sync6_1));
  FDRE \wr_data_reg_reg[7] 
       (.C(Rx_SysClk),
        .CE(E),
        .D(\wr_data_reg_n_0_[7] ),
        .Q(wr_data_reg__0[7]),
        .R(reset_sync6_1));
  FDRE \wr_data_reg_reg[8] 
       (.C(Rx_SysClk),
        .CE(E),
        .D(wr_data[8]),
        .Q(wr_data_reg__0[8]),
        .R(reset_sync6_1));
  FDRE \wr_data_reg_reg[9] 
       (.C(Rx_SysClk),
        .CE(E),
        .D(wr_data[9]),
        .Q(wr_data_reg__0[9]),
        .R(reset_sync6_1));
  FDRE \wr_data_reg_reg_reg[0] 
       (.C(Rx_SysClk),
        .CE(E),
        .D(wr_data_reg__0[0]),
        .Q(wr_data_reg_reg__0[0]),
        .R(reset_sync6_1));
  FDRE \wr_data_reg_reg_reg[10] 
       (.C(Rx_SysClk),
        .CE(E),
        .D(wr_data_reg__0[10]),
        .Q(wr_data_reg_reg__0[10]),
        .R(reset_sync6_1));
  FDRE \wr_data_reg_reg_reg[11] 
       (.C(Rx_SysClk),
        .CE(E),
        .D(wr_data_reg__0[11]),
        .Q(wr_data_reg_reg__0[11]),
        .R(reset_sync6_1));
  FDRE \wr_data_reg_reg_reg[12] 
       (.C(Rx_SysClk),
        .CE(E),
        .D(wr_data_reg__0[12]),
        .Q(wr_data_reg_reg__0[12]),
        .R(reset_sync6_1));
  FDRE \wr_data_reg_reg_reg[13] 
       (.C(Rx_SysClk),
        .CE(E),
        .D(wr_data_reg__0[13]),
        .Q(wr_data_reg_reg__0[13]),
        .R(reset_sync6_1));
  FDRE \wr_data_reg_reg_reg[1] 
       (.C(Rx_SysClk),
        .CE(E),
        .D(wr_data_reg__0[1]),
        .Q(wr_data_reg_reg__0[1]),
        .R(reset_sync6_1));
  FDRE \wr_data_reg_reg_reg[2] 
       (.C(Rx_SysClk),
        .CE(E),
        .D(wr_data_reg__0[2]),
        .Q(wr_data_reg_reg__0[2]),
        .R(reset_sync6_1));
  FDRE \wr_data_reg_reg_reg[3] 
       (.C(Rx_SysClk),
        .CE(E),
        .D(wr_data_reg__0[3]),
        .Q(wr_data_reg_reg__0[3]),
        .R(reset_sync6_1));
  FDRE \wr_data_reg_reg_reg[4] 
       (.C(Rx_SysClk),
        .CE(E),
        .D(wr_data_reg__0[4]),
        .Q(wr_data_reg_reg__0[4]),
        .R(reset_sync6_1));
  FDRE \wr_data_reg_reg_reg[5] 
       (.C(Rx_SysClk),
        .CE(E),
        .D(wr_data_reg__0[5]),
        .Q(wr_data_reg_reg__0[5]),
        .R(reset_sync6_1));
  FDRE \wr_data_reg_reg_reg[6] 
       (.C(Rx_SysClk),
        .CE(E),
        .D(wr_data_reg__0[6]),
        .Q(wr_data_reg_reg__0[6]),
        .R(reset_sync6_1));
  FDRE \wr_data_reg_reg_reg[7] 
       (.C(Rx_SysClk),
        .CE(E),
        .D(wr_data_reg__0[7]),
        .Q(wr_data_reg_reg__0[7]),
        .R(reset_sync6_1));
  FDRE \wr_data_reg_reg_reg[8] 
       (.C(Rx_SysClk),
        .CE(E),
        .D(wr_data_reg__0[8]),
        .Q(wr_data_reg_reg__0[8]),
        .R(reset_sync6_1));
  FDRE \wr_data_reg_reg_reg[9] 
       (.C(Rx_SysClk),
        .CE(E),
        .D(wr_data_reg__0[9]),
        .Q(wr_data_reg_reg__0[9]),
        .R(reset_sync6_1));
  CARRY8 wr_occupancy0_carry
       (.CI(1'b1),
        .CI_TOP(1'b0),
        .CO({NLW_wr_occupancy0_carry_CO_UNCONNECTED[7:6],wr_occupancy0_carry_n_2,wr_occupancy0_carry_n_3,NLW_wr_occupancy0_carry_CO_UNCONNECTED[3],wr_occupancy0_carry_n_5,wr_occupancy0_carry_n_6,wr_occupancy0_carry_n_7}),
        .DI({1'b0,1'b0,wr_addr[5:0]}),
        .O({NLW_wr_occupancy0_carry_O_UNCONNECTED[7],wr_occupancy00_out}),
        .S({1'b0,\reclock_rd_addrgray[6].sync_rd_addrgray_n_0 ,\reclock_rd_addrgray[6].sync_rd_addrgray_n_1 ,\reclock_rd_addrgray[5].sync_rd_addrgray_n_0 ,\reclock_rd_addrgray[4].sync_rd_addrgray_n_0 ,\reclock_rd_addrgray[3].sync_rd_addrgray_n_0 ,\reclock_rd_addrgray[1].sync_rd_addrgray_n_0 ,\reclock_rd_addrgray[1].sync_rd_addrgray_n_1 }));
  FDRE \wr_occupancy_reg[0] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(wr_occupancy00_out[0]),
        .Q(wr_occupancy[0]),
        .R(reset_sync6_1));
  FDRE \wr_occupancy_reg[1] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(wr_occupancy00_out[1]),
        .Q(wr_occupancy[1]),
        .R(reset_sync6_1));
  FDRE \wr_occupancy_reg[2] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(wr_occupancy00_out[2]),
        .Q(wr_occupancy[2]),
        .R(reset_sync6_1));
  FDRE \wr_occupancy_reg[3] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(wr_occupancy00_out[3]),
        .Q(wr_occupancy[3]),
        .R(reset_sync6_1));
  FDRE \wr_occupancy_reg[4] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(wr_occupancy00_out[4]),
        .Q(wr_occupancy[4]),
        .R(reset_sync6_1));
  FDRE \wr_occupancy_reg[5] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(wr_occupancy00_out[5]),
        .Q(wr_occupancy[5]),
        .R(reset_sync6_1));
  FDSE \wr_occupancy_reg[6] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(wr_occupancy00_out[6]),
        .Q(wr_occupancy[6]),
        .S(reset_sync6_1));
endmodule

(* ORIG_REF_NAME = "design_1_gig_ethernet_pcs_pma_0_0_rx_rate_adapt" *) 
module design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_rx_rate_adapt
   (gmii_rx_dv_0,
    gmii_rx_er_0,
    gmii_rxd_0,
    reset_out,
    sgmii_clk_en_reg,
    gmii_rx_dv,
    Tx_WrClk,
    gmii_rx_er_in,
    gmii_rxd);
  output gmii_rx_dv_0;
  output gmii_rx_er_0;
  output [7:0]gmii_rxd_0;
  input reset_out;
  input sgmii_clk_en_reg;
  input gmii_rx_dv;
  input Tx_WrClk;
  input gmii_rx_er_in;
  input [7:0]gmii_rxd;

  wire Tx_WrClk;
  wire gmii_rx_dv;
  wire gmii_rx_dv_0;
  wire gmii_rx_er_0;
  wire gmii_rx_er_in;
  wire [7:0]gmii_rxd;
  wire [7:0]gmii_rxd_0;
  wire muxsel;
  wire muxsel_i_1_n_0;
  wire [3:0]p_0_in;
  wire reset_out;
  wire rx_dv_aligned;
  wire rx_dv_aligned_i_1_n_0;
  wire rx_dv_reg1;
  wire rx_dv_reg2;
  wire rx_er_aligned;
  wire rx_er_aligned_0;
  wire rx_er_reg1;
  wire rx_er_reg2;
  wire [7:0]rxd_aligned;
  wire \rxd_aligned[0]_i_1_n_0 ;
  wire \rxd_aligned[1]_i_1_n_0 ;
  wire \rxd_aligned[2]_i_1_n_0 ;
  wire \rxd_aligned[3]_i_1_n_0 ;
  wire \rxd_aligned[4]_i_1_n_0 ;
  wire \rxd_aligned[5]_i_1_n_0 ;
  wire \rxd_aligned[6]_i_1_n_0 ;
  wire \rxd_aligned[7]_i_1_n_0 ;
  wire \rxd_reg1_reg_n_0_[0] ;
  wire \rxd_reg1_reg_n_0_[1] ;
  wire \rxd_reg1_reg_n_0_[2] ;
  wire \rxd_reg1_reg_n_0_[3] ;
  wire [7:0]rxd_reg2;
  wire sfd_enable;
  wire sfd_enable0;
  wire sfd_enable_i_1_n_0;
  wire sfd_enable_i_2_n_0;
  wire sfd_enable_i_4_n_0;
  wire sfd_enable_i_5_n_0;
  wire sgmii_clk_en_reg;

  FDRE #(
    .INIT(1'b0)) 
    gmii_rx_dv_out_reg
       (.C(Tx_WrClk),
        .CE(sgmii_clk_en_reg),
        .D(rx_dv_aligned),
        .Q(gmii_rx_dv_0),
        .R(reset_out));
  FDRE #(
    .INIT(1'b0)) 
    gmii_rx_er_out_reg
       (.C(Tx_WrClk),
        .CE(sgmii_clk_en_reg),
        .D(rx_er_aligned),
        .Q(gmii_rx_er_0),
        .R(reset_out));
  FDRE #(
    .INIT(1'b0)) 
    \gmii_rxd_out_reg[0] 
       (.C(Tx_WrClk),
        .CE(sgmii_clk_en_reg),
        .D(rxd_aligned[0]),
        .Q(gmii_rxd_0[0]),
        .R(reset_out));
  FDRE #(
    .INIT(1'b0)) 
    \gmii_rxd_out_reg[1] 
       (.C(Tx_WrClk),
        .CE(sgmii_clk_en_reg),
        .D(rxd_aligned[1]),
        .Q(gmii_rxd_0[1]),
        .R(reset_out));
  FDRE #(
    .INIT(1'b0)) 
    \gmii_rxd_out_reg[2] 
       (.C(Tx_WrClk),
        .CE(sgmii_clk_en_reg),
        .D(rxd_aligned[2]),
        .Q(gmii_rxd_0[2]),
        .R(reset_out));
  FDRE #(
    .INIT(1'b0)) 
    \gmii_rxd_out_reg[3] 
       (.C(Tx_WrClk),
        .CE(sgmii_clk_en_reg),
        .D(rxd_aligned[3]),
        .Q(gmii_rxd_0[3]),
        .R(reset_out));
  FDRE #(
    .INIT(1'b0)) 
    \gmii_rxd_out_reg[4] 
       (.C(Tx_WrClk),
        .CE(sgmii_clk_en_reg),
        .D(rxd_aligned[4]),
        .Q(gmii_rxd_0[4]),
        .R(reset_out));
  FDRE #(
    .INIT(1'b0)) 
    \gmii_rxd_out_reg[5] 
       (.C(Tx_WrClk),
        .CE(sgmii_clk_en_reg),
        .D(rxd_aligned[5]),
        .Q(gmii_rxd_0[5]),
        .R(reset_out));
  FDRE #(
    .INIT(1'b0)) 
    \gmii_rxd_out_reg[6] 
       (.C(Tx_WrClk),
        .CE(sgmii_clk_en_reg),
        .D(rxd_aligned[6]),
        .Q(gmii_rxd_0[6]),
        .R(reset_out));
  FDRE #(
    .INIT(1'b0)) 
    \gmii_rxd_out_reg[7] 
       (.C(Tx_WrClk),
        .CE(sgmii_clk_en_reg),
        .D(rxd_aligned[7]),
        .Q(gmii_rxd_0[7]),
        .R(reset_out));
  LUT6 #(
    .INIT(64'h00000000CCCCA8CC)) 
    muxsel_i_1
       (.I0(sfd_enable_i_5_n_0),
        .I1(muxsel),
        .I2(sfd_enable_i_2_n_0),
        .I3(sfd_enable),
        .I4(sfd_enable_i_4_n_0),
        .I5(reset_out),
        .O(muxsel_i_1_n_0));
  FDRE muxsel_reg
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(muxsel_i_1_n_0),
        .Q(muxsel),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair180" *) 
  LUT3 #(
    .INIT(8'hB0)) 
    rx_dv_aligned_i_1
       (.I0(rx_dv_reg1),
        .I1(muxsel),
        .I2(rx_dv_reg2),
        .O(rx_dv_aligned_i_1_n_0));
  FDRE rx_dv_aligned_reg
       (.C(Tx_WrClk),
        .CE(sgmii_clk_en_reg),
        .D(rx_dv_aligned_i_1_n_0),
        .Q(rx_dv_aligned),
        .R(reset_out));
  FDRE rx_dv_reg1_reg
       (.C(Tx_WrClk),
        .CE(sgmii_clk_en_reg),
        .D(gmii_rx_dv),
        .Q(rx_dv_reg1),
        .R(reset_out));
  FDRE rx_dv_reg2_reg
       (.C(Tx_WrClk),
        .CE(sgmii_clk_en_reg),
        .D(rx_dv_reg1),
        .Q(rx_dv_reg2),
        .R(reset_out));
  (* SOFT_HLUTNM = "soft_lutpair181" *) 
  LUT3 #(
    .INIT(8'hF8)) 
    rx_er_aligned_i_1
       (.I0(muxsel),
        .I1(rx_er_reg1),
        .I2(rx_er_reg2),
        .O(rx_er_aligned_0));
  FDRE rx_er_aligned_reg
       (.C(Tx_WrClk),
        .CE(sgmii_clk_en_reg),
        .D(rx_er_aligned_0),
        .Q(rx_er_aligned),
        .R(reset_out));
  FDRE rx_er_reg1_reg
       (.C(Tx_WrClk),
        .CE(sgmii_clk_en_reg),
        .D(gmii_rx_er_in),
        .Q(rx_er_reg1),
        .R(reset_out));
  FDRE rx_er_reg2_reg
       (.C(Tx_WrClk),
        .CE(sgmii_clk_en_reg),
        .D(rx_er_reg1),
        .Q(rx_er_reg2),
        .R(reset_out));
  (* SOFT_HLUTNM = "soft_lutpair182" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \rxd_aligned[0]_i_1 
       (.I0(rxd_reg2[4]),
        .I1(muxsel),
        .I2(rxd_reg2[0]),
        .O(\rxd_aligned[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair183" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \rxd_aligned[1]_i_1 
       (.I0(rxd_reg2[5]),
        .I1(muxsel),
        .I2(rxd_reg2[1]),
        .O(\rxd_aligned[1]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \rxd_aligned[2]_i_1 
       (.I0(rxd_reg2[6]),
        .I1(muxsel),
        .I2(rxd_reg2[2]),
        .O(\rxd_aligned[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair179" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \rxd_aligned[3]_i_1 
       (.I0(rxd_reg2[7]),
        .I1(muxsel),
        .I2(rxd_reg2[3]),
        .O(\rxd_aligned[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair182" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \rxd_aligned[4]_i_1 
       (.I0(\rxd_reg1_reg_n_0_[0] ),
        .I1(muxsel),
        .I2(rxd_reg2[4]),
        .O(\rxd_aligned[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair183" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \rxd_aligned[5]_i_1 
       (.I0(\rxd_reg1_reg_n_0_[1] ),
        .I1(muxsel),
        .I2(rxd_reg2[5]),
        .O(\rxd_aligned[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair181" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \rxd_aligned[6]_i_1 
       (.I0(\rxd_reg1_reg_n_0_[2] ),
        .I1(muxsel),
        .I2(rxd_reg2[6]),
        .O(\rxd_aligned[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair179" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \rxd_aligned[7]_i_1 
       (.I0(\rxd_reg1_reg_n_0_[3] ),
        .I1(muxsel),
        .I2(rxd_reg2[7]),
        .O(\rxd_aligned[7]_i_1_n_0 ));
  FDRE \rxd_aligned_reg[0] 
       (.C(Tx_WrClk),
        .CE(sgmii_clk_en_reg),
        .D(\rxd_aligned[0]_i_1_n_0 ),
        .Q(rxd_aligned[0]),
        .R(reset_out));
  FDRE \rxd_aligned_reg[1] 
       (.C(Tx_WrClk),
        .CE(sgmii_clk_en_reg),
        .D(\rxd_aligned[1]_i_1_n_0 ),
        .Q(rxd_aligned[1]),
        .R(reset_out));
  FDRE \rxd_aligned_reg[2] 
       (.C(Tx_WrClk),
        .CE(sgmii_clk_en_reg),
        .D(\rxd_aligned[2]_i_1_n_0 ),
        .Q(rxd_aligned[2]),
        .R(reset_out));
  FDRE \rxd_aligned_reg[3] 
       (.C(Tx_WrClk),
        .CE(sgmii_clk_en_reg),
        .D(\rxd_aligned[3]_i_1_n_0 ),
        .Q(rxd_aligned[3]),
        .R(reset_out));
  FDRE \rxd_aligned_reg[4] 
       (.C(Tx_WrClk),
        .CE(sgmii_clk_en_reg),
        .D(\rxd_aligned[4]_i_1_n_0 ),
        .Q(rxd_aligned[4]),
        .R(reset_out));
  FDRE \rxd_aligned_reg[5] 
       (.C(Tx_WrClk),
        .CE(sgmii_clk_en_reg),
        .D(\rxd_aligned[5]_i_1_n_0 ),
        .Q(rxd_aligned[5]),
        .R(reset_out));
  FDRE \rxd_aligned_reg[6] 
       (.C(Tx_WrClk),
        .CE(sgmii_clk_en_reg),
        .D(\rxd_aligned[6]_i_1_n_0 ),
        .Q(rxd_aligned[6]),
        .R(reset_out));
  FDRE \rxd_aligned_reg[7] 
       (.C(Tx_WrClk),
        .CE(sgmii_clk_en_reg),
        .D(\rxd_aligned[7]_i_1_n_0 ),
        .Q(rxd_aligned[7]),
        .R(reset_out));
  FDRE \rxd_reg1_reg[0] 
       (.C(Tx_WrClk),
        .CE(sgmii_clk_en_reg),
        .D(gmii_rxd[0]),
        .Q(\rxd_reg1_reg_n_0_[0] ),
        .R(reset_out));
  FDRE \rxd_reg1_reg[1] 
       (.C(Tx_WrClk),
        .CE(sgmii_clk_en_reg),
        .D(gmii_rxd[1]),
        .Q(\rxd_reg1_reg_n_0_[1] ),
        .R(reset_out));
  FDRE \rxd_reg1_reg[2] 
       (.C(Tx_WrClk),
        .CE(sgmii_clk_en_reg),
        .D(gmii_rxd[2]),
        .Q(\rxd_reg1_reg_n_0_[2] ),
        .R(reset_out));
  FDRE \rxd_reg1_reg[3] 
       (.C(Tx_WrClk),
        .CE(sgmii_clk_en_reg),
        .D(gmii_rxd[3]),
        .Q(\rxd_reg1_reg_n_0_[3] ),
        .R(reset_out));
  FDRE \rxd_reg1_reg[4] 
       (.C(Tx_WrClk),
        .CE(sgmii_clk_en_reg),
        .D(gmii_rxd[4]),
        .Q(p_0_in[0]),
        .R(reset_out));
  FDRE \rxd_reg1_reg[5] 
       (.C(Tx_WrClk),
        .CE(sgmii_clk_en_reg),
        .D(gmii_rxd[5]),
        .Q(p_0_in[1]),
        .R(reset_out));
  FDRE \rxd_reg1_reg[6] 
       (.C(Tx_WrClk),
        .CE(sgmii_clk_en_reg),
        .D(gmii_rxd[6]),
        .Q(p_0_in[2]),
        .R(reset_out));
  FDRE \rxd_reg1_reg[7] 
       (.C(Tx_WrClk),
        .CE(sgmii_clk_en_reg),
        .D(gmii_rxd[7]),
        .Q(p_0_in[3]),
        .R(reset_out));
  FDRE \rxd_reg2_reg[0] 
       (.C(Tx_WrClk),
        .CE(sgmii_clk_en_reg),
        .D(\rxd_reg1_reg_n_0_[0] ),
        .Q(rxd_reg2[0]),
        .R(reset_out));
  FDRE \rxd_reg2_reg[1] 
       (.C(Tx_WrClk),
        .CE(sgmii_clk_en_reg),
        .D(\rxd_reg1_reg_n_0_[1] ),
        .Q(rxd_reg2[1]),
        .R(reset_out));
  FDRE \rxd_reg2_reg[2] 
       (.C(Tx_WrClk),
        .CE(sgmii_clk_en_reg),
        .D(\rxd_reg1_reg_n_0_[2] ),
        .Q(rxd_reg2[2]),
        .R(reset_out));
  FDRE \rxd_reg2_reg[3] 
       (.C(Tx_WrClk),
        .CE(sgmii_clk_en_reg),
        .D(\rxd_reg1_reg_n_0_[3] ),
        .Q(rxd_reg2[3]),
        .R(reset_out));
  FDRE \rxd_reg2_reg[4] 
       (.C(Tx_WrClk),
        .CE(sgmii_clk_en_reg),
        .D(p_0_in[0]),
        .Q(rxd_reg2[4]),
        .R(reset_out));
  FDRE \rxd_reg2_reg[5] 
       (.C(Tx_WrClk),
        .CE(sgmii_clk_en_reg),
        .D(p_0_in[1]),
        .Q(rxd_reg2[5]),
        .R(reset_out));
  FDRE \rxd_reg2_reg[6] 
       (.C(Tx_WrClk),
        .CE(sgmii_clk_en_reg),
        .D(p_0_in[2]),
        .Q(rxd_reg2[6]),
        .R(reset_out));
  FDRE \rxd_reg2_reg[7] 
       (.C(Tx_WrClk),
        .CE(sgmii_clk_en_reg),
        .D(p_0_in[3]),
        .Q(rxd_reg2[7]),
        .R(reset_out));
  LUT6 #(
    .INIT(64'hFFDDFFCCC0C8C0CC)) 
    sfd_enable_i_1
       (.I0(sfd_enable_i_2_n_0),
        .I1(sfd_enable0),
        .I2(sgmii_clk_en_reg),
        .I3(sfd_enable_i_4_n_0),
        .I4(sfd_enable_i_5_n_0),
        .I5(sfd_enable),
        .O(sfd_enable_i_1_n_0));
  LUT5 #(
    .INIT(32'h04000000)) 
    sfd_enable_i_2
       (.I0(p_0_in[3]),
        .I1(gmii_rxd[0]),
        .I2(gmii_rxd[1]),
        .I3(gmii_rxd[3]),
        .I4(gmii_rxd[2]),
        .O(sfd_enable_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair180" *) 
  LUT2 #(
    .INIT(4'h2)) 
    sfd_enable_i_3
       (.I0(gmii_rx_dv),
        .I1(rx_dv_reg1),
        .O(sfd_enable0));
  LUT4 #(
    .INIT(16'hDFFF)) 
    sfd_enable_i_4
       (.I0(p_0_in[0]),
        .I1(p_0_in[1]),
        .I2(sgmii_clk_en_reg),
        .I3(p_0_in[2]),
        .O(sfd_enable_i_4_n_0));
  LUT5 #(
    .INIT(32'hFFFFDFFF)) 
    sfd_enable_i_5
       (.I0(\rxd_reg1_reg_n_0_[0] ),
        .I1(\rxd_reg1_reg_n_0_[3] ),
        .I2(p_0_in[3]),
        .I3(\rxd_reg1_reg_n_0_[2] ),
        .I4(\rxd_reg1_reg_n_0_[1] ),
        .O(sfd_enable_i_5_n_0));
  FDRE sfd_enable_reg
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(sfd_enable_i_1_n_0),
        .Q(sfd_enable),
        .R(reset_out));
endmodule

(* ORIG_REF_NAME = "design_1_gig_ethernet_pcs_pma_0_0_serdes_1_to_10" *) 
module design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_serdes_1_to_10
   (FifoRd_2__0,
    FifoRd_3__0,
    monitor_late_reg_0,
    SR,
    E,
    \active_reg[4]_0 ,
    D,
    \Mstr_Load_dly_reg[0]_0 ,
    WrapToZero,
    monitor_late_reg_1,
    \holdreg_reg[1]_0 ,
    \holdreg_reg[1]_1 ,
    \s_state_reg[0]_0 ,
    \s_state_reg[0]_1 ,
    Aligned,
    \rxdh_reg[0]_0 ,
    Q,
    FifoRd_0_0,
    DI,
    \pd_count_reg[4]_0 ,
    \mpx_reg[1]_0 ,
    \mpx_reg[1]_1 ,
    \mpx_reg[3]_0 ,
    \Slve_CntValIn_Out_reg[1]_0 ,
    Mstr_Load_reg_0,
    Mstr_Load_reg_1,
    monitor_late_reg_2,
    \pd_count_reg[0]_0 ,
    \Slve_CntValIn_Out_reg[8]_0 ,
    \Mstr_CntValIn_Out_reg[0]_0 ,
    \Mstr_CntValIn_Out_reg[1]_0 ,
    \act_count_reg[0]_0 ,
    LossOfSignal_reg_0,
    \act_count_reg[1]_0 ,
    LossOfSignal_reg_1,
    \mpx_reg[0]_0 ,
    Mstr_Load_reg_2,
    insert3_reg_0,
    \Slve_CntValIn_Out_reg[1]_1 ,
    BaseX_Idly_Load,
    out,
    code_err_i,
    \gde.gdeni.DISP_ERR_reg ,
    \grdni.run_disp_i_reg ,
    decoded_rxchariscomma0,
    k,
    b3,
    BaseX_Rx_Fifo_Empty,
    Rx_SysClk,
    LossOfSignal_reg_2,
    \s_state_reg[3]_0 ,
    ActiveIsSlve_reg_0,
    ActiveIsSlve_reg_1,
    \s_state_reg[4]_0 ,
    WrapToZero_reg_0,
    \s_state_reg[3]_1 ,
    \s_state_reg[4]_1 ,
    \pd_count_reg[3]_0 ,
    \pd_count_reg[4]_1 ,
    Rx_Valid_Int_reg_0,
    BaseX_Rx_Q_Out,
    reset_sync6,
    \Rx_BtVal_0_reg[8] ,
    \grdni.run_disp_i_reg_0 );
  output FifoRd_2__0;
  output FifoRd_3__0;
  output monitor_late_reg_0;
  output [0:0]SR;
  output [0:0]E;
  output \active_reg[4]_0 ;
  output [0:0]D;
  output [0:0]\Mstr_Load_dly_reg[0]_0 ;
  output WrapToZero;
  output monitor_late_reg_1;
  output \holdreg_reg[1]_0 ;
  output \holdreg_reg[1]_1 ;
  output \s_state_reg[0]_0 ;
  output \s_state_reg[0]_1 ;
  output Aligned;
  output [0:0]\rxdh_reg[0]_0 ;
  output [6:0]Q;
  output [7:0]FifoRd_0_0;
  output [0:0]DI;
  output [4:0]\pd_count_reg[4]_0 ;
  output \mpx_reg[1]_0 ;
  output \mpx_reg[1]_1 ;
  output \mpx_reg[3]_0 ;
  output [5:0]\Slve_CntValIn_Out_reg[1]_0 ;
  output Mstr_Load_reg_0;
  output Mstr_Load_reg_1;
  output monitor_late_reg_2;
  output \pd_count_reg[0]_0 ;
  output \Slve_CntValIn_Out_reg[8]_0 ;
  output \Mstr_CntValIn_Out_reg[0]_0 ;
  output \Mstr_CntValIn_Out_reg[1]_0 ;
  output [0:0]\act_count_reg[0]_0 ;
  output LossOfSignal_reg_0;
  output \act_count_reg[1]_0 ;
  output LossOfSignal_reg_1;
  output \mpx_reg[0]_0 ;
  output Mstr_Load_reg_2;
  output insert3_reg_0;
  output \Slve_CntValIn_Out_reg[1]_1 ;
  output [1:0]BaseX_Idly_Load;
  output [4:0]out;
  output code_err_i;
  output \gde.gdeni.DISP_ERR_reg ;
  output \grdni.run_disp_i_reg ;
  output decoded_rxchariscomma0;
  output k;
  output [7:5]b3;
  input [0:0]BaseX_Rx_Fifo_Empty;
  input Rx_SysClk;
  input LossOfSignal_reg_2;
  input \s_state_reg[3]_0 ;
  input ActiveIsSlve_reg_0;
  input ActiveIsSlve_reg_1;
  input \s_state_reg[4]_0 ;
  input WrapToZero_reg_0;
  input \s_state_reg[3]_1 ;
  input \s_state_reg[4]_1 ;
  input \pd_count_reg[3]_0 ;
  input \pd_count_reg[4]_1 ;
  input Rx_Valid_Int_reg_0;
  input [7:0]BaseX_Rx_Q_Out;
  input [0:0]reset_sync6;
  input [5:0]\Rx_BtVal_0_reg[8] ;
  input [0:0]\grdni.run_disp_i_reg_0 ;

  wire ActCnt_EQ_BTval;
  wire ActCnt_EQ_BTval_i_2_n_0;
  wire ActCnt_EQ_BTval_i_3_n_0;
  wire ActCnt_EQ_BTval_i_4_n_0;
  wire ActCnt_EQ_BTval_i_5_n_0;
  wire ActCnt_EQ_BTval_i_6_n_0;
  wire ActCnt_EQ_BTval_i_7_n_0;
  wire ActCnt_EQ_BTval_reg_i_1_n_0;
  wire ActCnt_EQ_Zero;
  wire ActCnt_EQ_Zero_i_2_n_0;
  wire ActCnt_EQ_Zero_i_3_n_0;
  wire ActCnt_EQ_Zero_i_4_n_0;
  wire ActCnt_EQ_Zero_i_5_n_0;
  wire ActCnt_EQ_Zero_i_6_n_0;
  wire ActCnt_EQ_Zero_reg_i_1_n_0;
  wire ActCnt_GE_HalfBT0_carry_i_1_n_0;
  wire ActCnt_GE_HalfBT0_carry_i_2_n_0;
  wire ActCnt_GE_HalfBT0_carry_i_3_n_0;
  wire ActCnt_GE_HalfBT0_carry_i_4_n_0;
  wire ActCnt_GE_HalfBT0_carry_i_5_n_0;
  wire ActCnt_GE_HalfBT0_carry_i_6_n_0;
  wire ActCnt_GE_HalfBT0_carry_i_7_n_0;
  wire ActCnt_GE_HalfBT0_carry_i_8_n_0;
  wire ActCnt_GE_HalfBT0_carry_i_9_n_0;
  wire ActCnt_GE_HalfBT0_carry_n_3;
  wire ActCnt_GE_HalfBT0_carry_n_5;
  wire ActCnt_GE_HalfBT0_carry_n_6;
  wire ActCnt_GE_HalfBT0_carry_n_7;
  wire \ActCnt_GE_HalfBT0_inferred__0/i__carry_n_3 ;
  wire \ActCnt_GE_HalfBT0_inferred__0/i__carry_n_5 ;
  wire \ActCnt_GE_HalfBT0_inferred__0/i__carry_n_6 ;
  wire \ActCnt_GE_HalfBT0_inferred__0/i__carry_n_7 ;
  wire ActCnt_GE_HalfBT_i_1_n_0;
  wire ActiveIsSlve_reg_0;
  wire ActiveIsSlve_reg_1;
  wire Aligned;
  wire [1:0]BaseX_Idly_Load;
  wire [0:0]BaseX_Rx_Fifo_Empty;
  wire [7:0]BaseX_Rx_Q_Out;
  wire [0:0]D;
  wire [0:0]DI;
  wire [0:0]E;
  wire [7:0]FifoRd_0_0;
  wire FifoRd_0__0;
  wire FifoRd_1__0;
  wire FifoRd_2__0;
  wire FifoRd_3__0;
  wire [0:0]IntReset_dly;
  wire \IntReset_dly_reg_n_0_[1] ;
  wire LossOfSignal_reg_0;
  wire LossOfSignal_reg_1;
  wire LossOfSignal_reg_2;
  wire \Mstr_CntValIn_Out0_inferred__1/i___0_carry_n_10 ;
  wire \Mstr_CntValIn_Out0_inferred__1/i___0_carry_n_11 ;
  wire \Mstr_CntValIn_Out0_inferred__1/i___0_carry_n_12 ;
  wire \Mstr_CntValIn_Out0_inferred__1/i___0_carry_n_13 ;
  wire \Mstr_CntValIn_Out0_inferred__1/i___0_carry_n_14 ;
  wire \Mstr_CntValIn_Out0_inferred__1/i___0_carry_n_15 ;
  wire \Mstr_CntValIn_Out0_inferred__1/i___0_carry_n_2 ;
  wire \Mstr_CntValIn_Out0_inferred__1/i___0_carry_n_3 ;
  wire \Mstr_CntValIn_Out0_inferred__1/i___0_carry_n_5 ;
  wire \Mstr_CntValIn_Out0_inferred__1/i___0_carry_n_6 ;
  wire \Mstr_CntValIn_Out0_inferred__1/i___0_carry_n_7 ;
  wire \Mstr_CntValIn_Out0_inferred__1/i___0_carry_n_9 ;
  wire \Mstr_CntValIn_Out[0]_i_1_n_0 ;
  wire \Mstr_CntValIn_Out[1]_i_1_n_0 ;
  wire \Mstr_CntValIn_Out[1]_i_2_n_0 ;
  wire \Mstr_CntValIn_Out[1]_i_3_n_0 ;
  wire \Mstr_CntValIn_Out[1]_i_4_n_0 ;
  wire \Mstr_CntValIn_Out[2]_i_1_n_0 ;
  wire \Mstr_CntValIn_Out[2]_i_2_n_0 ;
  wire \Mstr_CntValIn_Out[3]_i_1_n_0 ;
  wire \Mstr_CntValIn_Out[3]_i_2_n_0 ;
  wire \Mstr_CntValIn_Out[4]_i_1_n_0 ;
  wire \Mstr_CntValIn_Out[4]_i_2_n_0 ;
  wire \Mstr_CntValIn_Out[5]_i_1_n_0 ;
  wire \Mstr_CntValIn_Out[5]_i_2_n_0 ;
  wire \Mstr_CntValIn_Out[5]_i_3_n_0 ;
  wire \Mstr_CntValIn_Out[5]_i_4_n_0 ;
  wire \Mstr_CntValIn_Out[6]_i_1_n_0 ;
  wire \Mstr_CntValIn_Out[6]_i_2_n_0 ;
  wire \Mstr_CntValIn_Out[6]_i_3_n_0 ;
  wire \Mstr_CntValIn_Out[6]_i_4_n_0 ;
  wire \Mstr_CntValIn_Out[7]_i_1_n_0 ;
  wire \Mstr_CntValIn_Out[7]_i_2_n_0 ;
  wire \Mstr_CntValIn_Out[7]_i_3_n_0 ;
  wire \Mstr_CntValIn_Out[7]_i_4_n_0 ;
  wire \Mstr_CntValIn_Out[7]_i_5_n_0 ;
  wire \Mstr_CntValIn_Out[7]_i_6_n_0 ;
  wire \Mstr_CntValIn_Out[8]_i_1_n_0 ;
  wire \Mstr_CntValIn_Out[8]_i_2_n_0 ;
  wire \Mstr_CntValIn_Out[8]_i_3_n_0 ;
  wire \Mstr_CntValIn_Out[8]_i_4_n_0 ;
  wire \Mstr_CntValIn_Out[8]_i_5_n_0 ;
  wire \Mstr_CntValIn_Out[8]_i_6_n_0 ;
  wire \Mstr_CntValIn_Out[8]_i_7_n_0 ;
  wire \Mstr_CntValIn_Out[8]_i_8_n_0 ;
  wire \Mstr_CntValIn_Out_reg[0]_0 ;
  wire \Mstr_CntValIn_Out_reg[1]_0 ;
  wire [1:0]Mstr_Load_dly;
  wire [0:0]\Mstr_Load_dly_reg[0]_0 ;
  wire Mstr_Load_reg_0;
  wire Mstr_Load_reg_1;
  wire Mstr_Load_reg_2;
  wire [2:0]PhaseDet_CntDec;
  wire \PhaseDet_CntDec[0]_i_1_n_0 ;
  wire \PhaseDet_CntDec[1]_i_1_n_0 ;
  wire \PhaseDet_CntDec[2]_i_1_n_0 ;
  wire \PhaseDet_CntDec[2]_i_2_n_0 ;
  wire \PhaseDet_CntDec[2]_i_3_n_0 ;
  wire \PhaseDet_CntDec[2]_i_4_n_0 ;
  wire \PhaseDet_CntDec[2]_i_5_n_0 ;
  wire [2:0]PhaseDet_CntInc;
  wire \PhaseDet_CntInc[0]_i_1_n_0 ;
  wire \PhaseDet_CntInc[1]_i_1_n_0 ;
  wire \PhaseDet_CntInc[2]_i_1_n_0 ;
  wire \PhaseDet_CntInc[2]_i_2_n_0 ;
  wire \PhaseDet_CntInc[2]_i_3_n_0 ;
  wire \PhaseDet_CntInc[2]_i_4_n_0 ;
  wire \PhaseDet_CntInc[2]_i_5_n_0 ;
  wire [6:0]Q;
  wire \Rx_Algn_Data_Out[0]_i_1_n_0 ;
  wire \Rx_Algn_Data_Out[0]_i_2_n_0 ;
  wire \Rx_Algn_Data_Out[1]_i_1_n_0 ;
  wire \Rx_Algn_Data_Out[1]_i_2_n_0 ;
  wire \Rx_Algn_Data_Out[2]_i_1_n_0 ;
  wire \Rx_Algn_Data_Out[2]_i_2_n_0 ;
  wire \Rx_Algn_Data_Out[3]_i_1_n_0 ;
  wire \Rx_Algn_Data_Out[3]_i_2_n_0 ;
  wire \Rx_Algn_Data_Out[4]_i_1_n_0 ;
  wire \Rx_Algn_Data_Out[4]_i_2_n_0 ;
  wire \Rx_Algn_Data_Out[5]_i_1_n_0 ;
  wire \Rx_Algn_Data_Out[5]_i_2_n_0 ;
  wire \Rx_Algn_Data_Out[6]_i_1_n_0 ;
  wire \Rx_Algn_Data_Out[6]_i_2_n_0 ;
  wire \Rx_Algn_Data_Out[6]_i_3_n_0 ;
  wire \Rx_Algn_Data_Out[7]_i_1_n_0 ;
  wire \Rx_Algn_Data_Out[7]_i_2_n_0 ;
  wire \Rx_Algn_Data_Out[7]_i_3_n_0 ;
  wire \Rx_Algn_Data_Out[8]_i_1_n_0 ;
  wire \Rx_Algn_Data_Out[8]_i_2_n_0 ;
  wire \Rx_Algn_Data_Out[8]_i_3_n_0 ;
  wire \Rx_Algn_Data_Out[9]_i_1_n_0 ;
  wire \Rx_Algn_Data_Out[9]_i_2_n_0 ;
  wire \Rx_Algn_Data_Out[9]_i_3_n_0 ;
  wire \Rx_Algn_Data_Out[9]_i_4_n_0 ;
  wire Rx_Algn_Valid_Out0;
  wire [5:0]\Rx_BtVal_0_reg[8] ;
  wire Rx_SysClk;
  wire Rx_Valid_Int_i_1_n_0;
  wire Rx_Valid_Int_reg_0;
  wire [0:0]SR;
  wire \Slve_CntValIn_Out0_inferred__1/i___0_carry_n_10 ;
  wire \Slve_CntValIn_Out0_inferred__1/i___0_carry_n_11 ;
  wire \Slve_CntValIn_Out0_inferred__1/i___0_carry_n_12 ;
  wire \Slve_CntValIn_Out0_inferred__1/i___0_carry_n_13 ;
  wire \Slve_CntValIn_Out0_inferred__1/i___0_carry_n_14 ;
  wire \Slve_CntValIn_Out0_inferred__1/i___0_carry_n_15 ;
  wire \Slve_CntValIn_Out0_inferred__1/i___0_carry_n_2 ;
  wire \Slve_CntValIn_Out0_inferred__1/i___0_carry_n_3 ;
  wire \Slve_CntValIn_Out0_inferred__1/i___0_carry_n_5 ;
  wire \Slve_CntValIn_Out0_inferred__1/i___0_carry_n_6 ;
  wire \Slve_CntValIn_Out0_inferred__1/i___0_carry_n_7 ;
  wire \Slve_CntValIn_Out0_inferred__1/i___0_carry_n_9 ;
  wire \Slve_CntValIn_Out[0]_i_1_n_0 ;
  wire \Slve_CntValIn_Out[1]_i_1_n_0 ;
  wire \Slve_CntValIn_Out[1]_i_2_n_0 ;
  wire \Slve_CntValIn_Out[2]_i_1_n_0 ;
  wire \Slve_CntValIn_Out[2]_i_2_n_0 ;
  wire \Slve_CntValIn_Out[2]_i_3_n_0 ;
  wire \Slve_CntValIn_Out[3]_i_1_n_0 ;
  wire \Slve_CntValIn_Out[3]_i_2_n_0 ;
  wire \Slve_CntValIn_Out[3]_i_3_n_0 ;
  wire \Slve_CntValIn_Out[4]_i_1_n_0 ;
  wire \Slve_CntValIn_Out[4]_i_2_n_0 ;
  wire \Slve_CntValIn_Out[4]_i_3_n_0 ;
  wire \Slve_CntValIn_Out[5]_i_1_n_0 ;
  wire \Slve_CntValIn_Out[5]_i_2_n_0 ;
  wire \Slve_CntValIn_Out[5]_i_3_n_0 ;
  wire \Slve_CntValIn_Out[6]_i_1_n_0 ;
  wire \Slve_CntValIn_Out[6]_i_2_n_0 ;
  wire \Slve_CntValIn_Out[6]_i_3_n_0 ;
  wire \Slve_CntValIn_Out[6]_i_4_n_0 ;
  wire \Slve_CntValIn_Out[6]_i_5_n_0 ;
  wire \Slve_CntValIn_Out[7]_i_1_n_0 ;
  wire \Slve_CntValIn_Out[7]_i_2_n_0 ;
  wire \Slve_CntValIn_Out[7]_i_3_n_0 ;
  wire \Slve_CntValIn_Out[7]_i_4_n_0 ;
  wire \Slve_CntValIn_Out[7]_i_5_n_0 ;
  wire \Slve_CntValIn_Out[8]_i_1_n_0 ;
  wire \Slve_CntValIn_Out[8]_i_2_n_0 ;
  wire \Slve_CntValIn_Out[8]_i_3_n_0 ;
  wire \Slve_CntValIn_Out[8]_i_4_n_0 ;
  wire \Slve_CntValIn_Out[8]_i_6_n_0 ;
  wire [5:0]\Slve_CntValIn_Out_reg[1]_0 ;
  wire \Slve_CntValIn_Out_reg[1]_1 ;
  wire \Slve_CntValIn_Out_reg[8]_0 ;
  wire [1:0]Slve_Load_dly;
  wire WrapToZero;
  wire WrapToZero_reg_0;
  wire \act_count[0]_i_1_n_0 ;
  wire \act_count[1]_i_1_n_0 ;
  wire \act_count[2]_i_1_n_0 ;
  wire \act_count[3]_i_1_n_0 ;
  wire \act_count[4]_i_1_n_0 ;
  wire \act_count[4]_i_3_n_0 ;
  wire \act_count[4]_i_4_n_0 ;
  wire \act_count[5]_i_1_n_0 ;
  wire \act_count[5]_i_2_n_0 ;
  wire \act_count[5]_i_3_n_0 ;
  wire \act_count[5]_i_4_n_0 ;
  wire [0:0]\act_count_reg[0]_0 ;
  wire \act_count_reg[1]_0 ;
  wire [4:0]act_count_reg__0;
  wire \active_reg[4]_0 ;
  wire \active_reg_n_0_[0] ;
  wire \active_reg_n_0_[1] ;
  wire \active_reg_n_0_[2] ;
  wire \active_reg_n_0_[3] ;
  wire \active_reg_n_0_[4] ;
  wire \active_reg_n_0_[5] ;
  wire \active_reg_n_0_[6] ;
  wire \active_reg_n_0_[7] ;
  wire [9:0]al_rx_data_out;
  wire [7:5]b3;
  wire code_err_i;
  wire [6:0]data0;
  wire [9:0]data9;
  wire [1:0]\decode_8b10b/b4_disp__9 ;
  wire [2:0]\decode_8b10b/b6_disp__34 ;
  wire \decode_8b10b/k28__1 ;
  wire \decode_8b10b/p_8_out__0 ;
  wire \decode_8b10b/sK28__2 ;
  wire decoded_rxchariscomma0;
  wire decoded_rxchariscomma_i_2_n_0;
  wire decoded_rxchariscomma_i_3_n_0;
  wire decoded_rxchariscomma_i_5_n_0;
  wire decoded_rxchariscomma_i_6_n_0;
  wire decoded_rxchariscomma_i_7_n_0;
  wire [7:0]delay_change;
  wire \delay_change[7]_i_1_n_0 ;
  wire \delay_change_reg_n_0_[0] ;
  wire \gcerr.CODE_ERR_i_2_n_0 ;
  wire \gcerr.CODE_ERR_i_3_n_0 ;
  wire \gcerr.CODE_ERR_i_4_n_0 ;
  wire \gcerr.CODE_ERR_i_6_n_0 ;
  wire \gde.gdeni.DISP_ERR_i_2_n_0 ;
  wire \gde.gdeni.DISP_ERR_i_3_n_0 ;
  wire \gde.gdeni.DISP_ERR_i_4_n_0 ;
  wire \gde.gdeni.DISP_ERR_reg ;
  wire \grdni.run_disp_i_reg ;
  wire [0:0]\grdni.run_disp_i_reg_0 ;
  wire [9:0]hdataout;
  wire \hdataout[0]_i_1_n_0 ;
  wire \hdataout[0]_i_2_n_0 ;
  wire \hdataout[1]_i_1_n_0 ;
  wire \hdataout[1]_i_2_n_0 ;
  wire \hdataout[2]_i_1_n_0 ;
  wire \hdataout[2]_i_2_n_0 ;
  wire \hdataout[3]_i_1_n_0 ;
  wire \hdataout[3]_i_2_n_0 ;
  wire \hdataout[4]_i_1_n_0 ;
  wire \hdataout[4]_i_2_n_0 ;
  wire \hdataout[5]_i_1_n_0 ;
  wire \hdataout[5]_i_2_n_0 ;
  wire \hdataout[6]_i_1_n_0 ;
  wire \hdataout[6]_i_2_n_0 ;
  wire \hdataout[7]_i_1_n_0 ;
  wire \hdataout[7]_i_2_n_0 ;
  wire \hdataout[8]_i_1_n_0 ;
  wire \hdataout[8]_i_2_n_0 ;
  wire \hdataout[9]_i_1_n_0 ;
  wire \hdataout[9]_i_2_n_0 ;
  wire \hdataout[9]_i_3_n_0 ;
  wire \holdreg[10]_i_1_n_0 ;
  wire \holdreg[11]_i_1_n_0 ;
  wire \holdreg[12]_i_1_n_0 ;
  wire \holdreg[13]_i_1_n_0 ;
  wire \holdreg[14]_i_1_n_0 ;
  wire \holdreg[1]_i_1_n_0 ;
  wire \holdreg[2]_i_1_n_0 ;
  wire \holdreg[3]_i_1_n_0 ;
  wire \holdreg[4]_i_1_n_0 ;
  wire \holdreg[5]_i_1_n_0 ;
  wire \holdreg[6]_i_1_n_0 ;
  wire \holdreg[7]_i_1_n_0 ;
  wire \holdreg[8]_i_1_n_0 ;
  wire \holdreg[9]_i_1_n_0 ;
  wire \holdreg_reg[1]_0 ;
  wire \holdreg_reg[1]_1 ;
  wire \holdreg_reg_n_0_[10] ;
  wire \holdreg_reg_n_0_[11] ;
  wire \holdreg_reg_n_0_[12] ;
  wire \holdreg_reg_n_0_[13] ;
  wire \holdreg_reg_n_0_[14] ;
  wire \holdreg_reg_n_0_[1] ;
  wire \holdreg_reg_n_0_[2] ;
  wire \holdreg_reg_n_0_[3] ;
  wire \holdreg_reg_n_0_[4] ;
  wire \holdreg_reg_n_0_[5] ;
  wire \holdreg_reg_n_0_[6] ;
  wire \holdreg_reg_n_0_[7] ;
  wire \holdreg_reg_n_0_[8] ;
  wire \holdreg_reg_n_0_[9] ;
  wire i___0_carry_i_1__0_n_0;
  wire i___0_carry_i_1_n_0;
  wire i___0_carry_i_2__0_n_0;
  wire i___0_carry_i_2_n_0;
  wire i___0_carry_i_3__0_n_0;
  wire i___0_carry_i_3_n_0;
  wire i___0_carry_i_4__0_n_0;
  wire i___0_carry_i_4_n_0;
  wire i___0_carry_i_5__0_n_0;
  wire i___0_carry_i_5_n_0;
  wire i___0_carry_i_6__0_n_0;
  wire i___0_carry_i_6_n_0;
  wire i___0_carry_i_7__0_n_0;
  wire i___0_carry_i_7_n_0;
  wire i__carry_i_1_n_0;
  wire i__carry_i_2_n_0;
  wire i__carry_i_3_n_0;
  wire i__carry_i_4_n_0;
  wire i__carry_i_5_n_0;
  wire i__carry_i_6_n_0;
  wire i__carry_i_7_n_0;
  wire i__carry_i_8_n_0;
  wire i__carry_i_9_n_0;
  wire insert3_reg_0;
  wire invby_e;
  wire invr6;
  wire k;
  wire k1;
  wire [7:3]monitor;
  wire monitor_late_reg_0;
  wire monitor_late_reg_1;
  wire monitor_late_reg_2;
  wire [3:0]mpx;
  wire \mpx[0]_i_10_n_0 ;
  wire \mpx[0]_i_11_n_0 ;
  wire \mpx[0]_i_12_n_0 ;
  wire \mpx[0]_i_13_n_0 ;
  wire \mpx[0]_i_14_n_0 ;
  wire \mpx[0]_i_15_n_0 ;
  wire \mpx[0]_i_16_n_0 ;
  wire \mpx[0]_i_17_n_0 ;
  wire \mpx[0]_i_18_n_0 ;
  wire \mpx[0]_i_19_n_0 ;
  wire \mpx[0]_i_1_n_0 ;
  wire \mpx[0]_i_20_n_0 ;
  wire \mpx[0]_i_21_n_0 ;
  wire \mpx[0]_i_22_n_0 ;
  wire \mpx[0]_i_2_n_0 ;
  wire \mpx[0]_i_3_n_0 ;
  wire \mpx[0]_i_4_n_0 ;
  wire \mpx[0]_i_5_n_0 ;
  wire \mpx[0]_i_6_n_0 ;
  wire \mpx[0]_i_7_n_0 ;
  wire \mpx[0]_i_8_n_0 ;
  wire \mpx[0]_i_9_n_0 ;
  wire \mpx[1]_i_1_n_0 ;
  wire \mpx[1]_i_2_n_0 ;
  wire \mpx[1]_i_3_n_0 ;
  wire \mpx[1]_i_4_n_0 ;
  wire \mpx[1]_i_5_n_0 ;
  wire \mpx[1]_i_6_n_0 ;
  wire \mpx[1]_i_7_n_0 ;
  wire \mpx[1]_i_8_n_0 ;
  wire \mpx[2]_i_1_n_0 ;
  wire \mpx[3]_i_10_n_0 ;
  wire \mpx[3]_i_11_n_0 ;
  wire \mpx[3]_i_12_n_0 ;
  wire \mpx[3]_i_13_n_0 ;
  wire \mpx[3]_i_14_n_0 ;
  wire \mpx[3]_i_15_n_0 ;
  wire \mpx[3]_i_16_n_0 ;
  wire \mpx[3]_i_17_n_0 ;
  wire \mpx[3]_i_18_n_0 ;
  wire \mpx[3]_i_19_n_0 ;
  wire \mpx[3]_i_1_n_0 ;
  wire \mpx[3]_i_20_n_0 ;
  wire \mpx[3]_i_21_n_0 ;
  wire \mpx[3]_i_22_n_0 ;
  wire \mpx[3]_i_23_n_0 ;
  wire \mpx[3]_i_24_n_0 ;
  wire \mpx[3]_i_25_n_0 ;
  wire \mpx[3]_i_26_n_0 ;
  wire \mpx[3]_i_27_n_0 ;
  wire \mpx[3]_i_28_n_0 ;
  wire \mpx[3]_i_29_n_0 ;
  wire \mpx[3]_i_2_n_0 ;
  wire \mpx[3]_i_30_n_0 ;
  wire \mpx[3]_i_31_n_0 ;
  wire \mpx[3]_i_7_n_0 ;
  wire \mpx[3]_i_8_n_0 ;
  wire \mpx[3]_i_9_n_0 ;
  wire \mpx_reg[0]_0 ;
  wire \mpx_reg[1]_0 ;
  wire \mpx_reg[1]_1 ;
  wire \mpx_reg[3]_0 ;
  wire ndbr6;
  wire ndur6;
  wire [4:0]out;
  wire [7:2]p_1_in;
  wire [7:4]p_2_out;
  wire [7:4]p_3_out;
  wire \pd_count[0]_i_1_n_0 ;
  wire \pd_count[1]_i_1_n_0 ;
  wire \pd_count[2]_i_1_n_0 ;
  wire \pd_count[2]_i_2_n_0 ;
  wire \pd_count[2]_i_3_n_0 ;
  wire \pd_count[3]_i_1_n_0 ;
  wire \pd_count[4]_i_2_n_0 ;
  wire \pd_count[4]_i_3_n_0 ;
  wire \pd_count[4]_i_4_n_0 ;
  wire \pd_count_reg[0]_0 ;
  wire \pd_count_reg[3]_0 ;
  wire [4:0]\pd_count_reg[4]_0 ;
  wire \pd_count_reg[4]_1 ;
  wire pd_ovflw_up;
  wire pdbr6;
  wire pdur6;
  wire [0:0]reset_sync6;
  wire [0:0]\rxdh_reg[0]_0 ;
  wire \rxdh_reg_n_0_[0] ;
  wire \rxdh_reg_n_0_[19] ;
  wire \rxdh_reg_n_0_[1] ;
  wire \rxdh_reg_n_0_[2] ;
  wire \rxdh_reg_n_0_[3] ;
  wire \rxdh_reg_n_0_[4] ;
  wire \rxdh_reg_n_0_[5] ;
  wire \rxdh_reg_n_0_[6] ;
  wire \rxdh_reg_n_0_[7] ;
  wire \rxdh_reg_n_0_[8] ;
  wire s_state;
  wire \s_state[0]_i_1_n_0 ;
  wire \s_state[0]_i_2_n_0 ;
  wire \s_state[1]_i_1_n_0 ;
  wire \s_state[1]_i_2_n_0 ;
  wire \s_state[2]_i_1_n_0 ;
  wire \s_state[3]_i_1_n_0 ;
  wire \s_state[4]_i_1_n_0 ;
  wire \s_state[5]_i_2_n_0 ;
  wire \s_state[5]_i_4_n_0 ;
  wire \s_state[5]_i_5_n_0 ;
  wire \s_state[5]_i_6_n_0 ;
  wire \s_state[5]_i_7_n_0 ;
  wire \s_state[5]_i_8_n_0 ;
  wire \s_state_reg[0]_0 ;
  wire \s_state_reg[0]_1 ;
  wire \s_state_reg[3]_0 ;
  wire \s_state_reg[3]_1 ;
  wire \s_state_reg[4]_0 ;
  wire \s_state_reg[4]_1 ;
  wire \toggle[0]_i_1_n_0 ;
  wire \toggle[1]_i_1_n_0 ;
  wire \toggle[2]_i_1_n_0 ;
  wire \toggle[3]_i_1_n_0 ;
  wire \toggle_reg_n_0_[0] ;
  wire \toggle_reg_n_0_[1] ;
  wire \toggle_reg_n_0_[2] ;
  wire \toggle_reg_n_0_[3] ;
  wire [7:3]NLW_ActCnt_GE_HalfBT0_carry_CO_UNCONNECTED;
  wire [7:0]NLW_ActCnt_GE_HalfBT0_carry_O_UNCONNECTED;
  wire [7:3]\NLW_ActCnt_GE_HalfBT0_inferred__0/i__carry_CO_UNCONNECTED ;
  wire [7:0]\NLW_ActCnt_GE_HalfBT0_inferred__0/i__carry_O_UNCONNECTED ;
  wire [7:3]\NLW_Mstr_CntValIn_Out0_inferred__1/i___0_carry_CO_UNCONNECTED ;
  wire [7:7]\NLW_Mstr_CntValIn_Out0_inferred__1/i___0_carry_O_UNCONNECTED ;
  wire [7:3]\NLW_Slve_CntValIn_Out0_inferred__1/i___0_carry_CO_UNCONNECTED ;
  wire [7:7]\NLW_Slve_CntValIn_Out0_inferred__1/i___0_carry_O_UNCONNECTED ;

  LUT5 #(
    .INIT(32'h00000001)) 
    ActCnt_EQ_BTval_i_2
       (.I0(DI),
        .I1(FifoRd_0_0[1]),
        .I2(FifoRd_0_0[0]),
        .I3(ActCnt_EQ_BTval_i_4_n_0),
        .I4(ActCnt_EQ_BTval_i_5_n_0),
        .O(ActCnt_EQ_BTval_i_2_n_0));
  LUT5 #(
    .INIT(32'h00000001)) 
    ActCnt_EQ_BTval_i_3
       (.I0(Q[0]),
        .I1(\Mstr_CntValIn_Out_reg[1]_0 ),
        .I2(\Mstr_CntValIn_Out_reg[0]_0 ),
        .I3(ActCnt_EQ_BTval_i_6_n_0),
        .I4(ActCnt_EQ_BTval_i_7_n_0),
        .O(ActCnt_EQ_BTval_i_3_n_0));
  LUT6 #(
    .INIT(64'h6FF6FFFFFFFF6FF6)) 
    ActCnt_EQ_BTval_i_4
       (.I0(p_1_in[3]),
        .I1(FifoRd_0_0[3]),
        .I2(p_1_in[4]),
        .I3(FifoRd_0_0[4]),
        .I4(FifoRd_0_0[2]),
        .I5(p_1_in[2]),
        .O(ActCnt_EQ_BTval_i_4_n_0));
  LUT6 #(
    .INIT(64'h6FF6FFFFFFFF6FF6)) 
    ActCnt_EQ_BTval_i_5
       (.I0(FifoRd_0_0[5]),
        .I1(p_1_in[5]),
        .I2(FifoRd_0_0[7]),
        .I3(p_1_in[7]),
        .I4(p_1_in[6]),
        .I5(FifoRd_0_0[6]),
        .O(ActCnt_EQ_BTval_i_5_n_0));
  LUT6 #(
    .INIT(64'h6FF6FFFFFFFF6FF6)) 
    ActCnt_EQ_BTval_i_6
       (.I0(Q[1]),
        .I1(p_1_in[2]),
        .I2(p_1_in[4]),
        .I3(Q[3]),
        .I4(p_1_in[3]),
        .I5(Q[2]),
        .O(ActCnt_EQ_BTval_i_6_n_0));
  LUT6 #(
    .INIT(64'h6FF6FFFFFFFF6FF6)) 
    ActCnt_EQ_BTval_i_7
       (.I0(Q[4]),
        .I1(p_1_in[5]),
        .I2(p_1_in[6]),
        .I3(Q[5]),
        .I4(Q[6]),
        .I5(p_1_in[7]),
        .O(ActCnt_EQ_BTval_i_7_n_0));
  FDRE ActCnt_EQ_BTval_reg
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(ActCnt_EQ_BTval_reg_i_1_n_0),
        .Q(ActCnt_EQ_BTval),
        .R(SR));
  MUXF7 ActCnt_EQ_BTval_reg_i_1
       (.I0(ActCnt_EQ_BTval_i_2_n_0),
        .I1(ActCnt_EQ_BTval_i_3_n_0),
        .O(ActCnt_EQ_BTval_reg_i_1_n_0),
        .S(\active_reg[4]_0 ));
  LUT6 #(
    .INIT(64'h0000000000000004)) 
    ActCnt_EQ_Zero_i_2
       (.I0(\Mstr_CntValIn_Out[5]_i_3_n_0 ),
        .I1(ActCnt_EQ_Zero_i_4_n_0),
        .I2(FifoRd_0_0[4]),
        .I3(FifoRd_0_0[5]),
        .I4(FifoRd_0_0[7]),
        .I5(FifoRd_0_0[6]),
        .O(ActCnt_EQ_Zero_i_2_n_0));
  LUT6 #(
    .INIT(64'h0000000000000004)) 
    ActCnt_EQ_Zero_i_3
       (.I0(ActCnt_EQ_Zero_i_5_n_0),
        .I1(ActCnt_EQ_Zero_i_6_n_0),
        .I2(Q[3]),
        .I3(Q[4]),
        .I4(Q[6]),
        .I5(Q[5]),
        .O(ActCnt_EQ_Zero_i_3_n_0));
  LUT3 #(
    .INIT(8'h01)) 
    ActCnt_EQ_Zero_i_4
       (.I0(FifoRd_0_0[0]),
        .I1(FifoRd_0_0[1]),
        .I2(DI),
        .O(ActCnt_EQ_Zero_i_4_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    ActCnt_EQ_Zero_i_5
       (.I0(Q[1]),
        .I1(Q[2]),
        .O(ActCnt_EQ_Zero_i_5_n_0));
  LUT3 #(
    .INIT(8'h01)) 
    ActCnt_EQ_Zero_i_6
       (.I0(\Mstr_CntValIn_Out_reg[0]_0 ),
        .I1(\Mstr_CntValIn_Out_reg[1]_0 ),
        .I2(Q[0]),
        .O(ActCnt_EQ_Zero_i_6_n_0));
  FDRE ActCnt_EQ_Zero_reg
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(ActCnt_EQ_Zero_reg_i_1_n_0),
        .Q(ActCnt_EQ_Zero),
        .R(SR));
  MUXF7 ActCnt_EQ_Zero_reg_i_1
       (.I0(ActCnt_EQ_Zero_i_2_n_0),
        .I1(ActCnt_EQ_Zero_i_3_n_0),
        .O(ActCnt_EQ_Zero_reg_i_1_n_0),
        .S(\active_reg[4]_0 ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY8 ActCnt_GE_HalfBT0_carry
       (.CI(1'b1),
        .CI_TOP(1'b0),
        .CO({NLW_ActCnt_GE_HalfBT0_carry_CO_UNCONNECTED[7:5],ActCnt_GE_HalfBT0_carry_n_3,NLW_ActCnt_GE_HalfBT0_carry_CO_UNCONNECTED[3],ActCnt_GE_HalfBT0_carry_n_5,ActCnt_GE_HalfBT0_carry_n_6,ActCnt_GE_HalfBT0_carry_n_7}),
        .DI({1'b0,1'b0,1'b0,Q[6],ActCnt_GE_HalfBT0_carry_i_1_n_0,ActCnt_GE_HalfBT0_carry_i_2_n_0,ActCnt_GE_HalfBT0_carry_i_3_n_0,ActCnt_GE_HalfBT0_carry_i_4_n_0}),
        .O(NLW_ActCnt_GE_HalfBT0_carry_O_UNCONNECTED[7:0]),
        .S({1'b0,1'b0,1'b0,ActCnt_GE_HalfBT0_carry_i_5_n_0,ActCnt_GE_HalfBT0_carry_i_6_n_0,ActCnt_GE_HalfBT0_carry_i_7_n_0,ActCnt_GE_HalfBT0_carry_i_8_n_0,ActCnt_GE_HalfBT0_carry_i_9_n_0}));
  LUT4 #(
    .INIT(16'h22B2)) 
    ActCnt_GE_HalfBT0_carry_i_1
       (.I0(Q[5]),
        .I1(p_1_in[7]),
        .I2(Q[4]),
        .I3(p_1_in[6]),
        .O(ActCnt_GE_HalfBT0_carry_i_1_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    ActCnt_GE_HalfBT0_carry_i_2
       (.I0(Q[3]),
        .I1(p_1_in[5]),
        .I2(Q[2]),
        .I3(p_1_in[4]),
        .O(ActCnt_GE_HalfBT0_carry_i_2_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    ActCnt_GE_HalfBT0_carry_i_3
       (.I0(Q[1]),
        .I1(p_1_in[3]),
        .I2(Q[0]),
        .I3(p_1_in[2]),
        .O(ActCnt_GE_HalfBT0_carry_i_3_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    ActCnt_GE_HalfBT0_carry_i_4
       (.I0(\Mstr_CntValIn_Out_reg[0]_0 ),
        .I1(\Mstr_CntValIn_Out_reg[1]_0 ),
        .O(ActCnt_GE_HalfBT0_carry_i_4_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    ActCnt_GE_HalfBT0_carry_i_5
       (.I0(Q[6]),
        .O(ActCnt_GE_HalfBT0_carry_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    ActCnt_GE_HalfBT0_carry_i_6
       (.I0(p_1_in[7]),
        .I1(Q[5]),
        .I2(p_1_in[6]),
        .I3(Q[4]),
        .O(ActCnt_GE_HalfBT0_carry_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    ActCnt_GE_HalfBT0_carry_i_7
       (.I0(p_1_in[5]),
        .I1(Q[3]),
        .I2(p_1_in[4]),
        .I3(Q[2]),
        .O(ActCnt_GE_HalfBT0_carry_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    ActCnt_GE_HalfBT0_carry_i_8
       (.I0(p_1_in[3]),
        .I1(Q[1]),
        .I2(p_1_in[2]),
        .I3(Q[0]),
        .O(ActCnt_GE_HalfBT0_carry_i_8_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    ActCnt_GE_HalfBT0_carry_i_9
       (.I0(\Mstr_CntValIn_Out_reg[1]_0 ),
        .I1(\Mstr_CntValIn_Out_reg[0]_0 ),
        .O(ActCnt_GE_HalfBT0_carry_i_9_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY8 \ActCnt_GE_HalfBT0_inferred__0/i__carry 
       (.CI(1'b1),
        .CI_TOP(1'b0),
        .CO({\NLW_ActCnt_GE_HalfBT0_inferred__0/i__carry_CO_UNCONNECTED [7:5],\ActCnt_GE_HalfBT0_inferred__0/i__carry_n_3 ,\NLW_ActCnt_GE_HalfBT0_inferred__0/i__carry_CO_UNCONNECTED [3],\ActCnt_GE_HalfBT0_inferred__0/i__carry_n_5 ,\ActCnt_GE_HalfBT0_inferred__0/i__carry_n_6 ,\ActCnt_GE_HalfBT0_inferred__0/i__carry_n_7 }),
        .DI({1'b0,1'b0,1'b0,FifoRd_0_0[7],i__carry_i_1_n_0,i__carry_i_2_n_0,i__carry_i_3_n_0,i__carry_i_4_n_0}),
        .O(\NLW_ActCnt_GE_HalfBT0_inferred__0/i__carry_O_UNCONNECTED [7:0]),
        .S({1'b0,1'b0,1'b0,i__carry_i_5_n_0,i__carry_i_6_n_0,i__carry_i_7_n_0,i__carry_i_8_n_0,i__carry_i_9_n_0}));
  (* SOFT_HLUTNM = "soft_lutpair166" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    ActCnt_GE_HalfBT_i_1
       (.I0(ActCnt_GE_HalfBT0_carry_n_3),
        .I1(\active_reg[4]_0 ),
        .I2(\ActCnt_GE_HalfBT0_inferred__0/i__carry_n_3 ),
        .O(ActCnt_GE_HalfBT_i_1_n_0));
  FDRE ActCnt_GE_HalfBT_reg
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(ActCnt_GE_HalfBT_i_1_n_0),
        .Q(monitor_late_reg_0),
        .R(SR));
  FDRE ActiveIsSlve_reg
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(\s_state_reg[3]_0 ),
        .Q(\active_reg[4]_0 ),
        .R(SR));
  FDRE Aligned_reg
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(Rx_Valid_Int_reg_0),
        .Q(Aligned),
        .R(SR));
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    FifoRd_0
       (.C(Rx_SysClk),
        .CE(BaseX_Rx_Fifo_Empty),
        .D(1'b1),
        .Q(FifoRd_0__0),
        .R(\IntReset_dly_reg_n_0_[1] ));
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    FifoRd_1
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(FifoRd_0__0),
        .Q(FifoRd_1__0),
        .R(\IntReset_dly_reg_n_0_[1] ));
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    FifoRd_2
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(FifoRd_1__0),
        .Q(FifoRd_2__0),
        .R(\IntReset_dly_reg_n_0_[1] ));
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    FifoRd_3
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(FifoRd_2__0),
        .Q(FifoRd_3__0),
        .R(\IntReset_dly_reg_n_0_[1] ));
  FDRE \IntReset_dly_reg[0] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(reset_sync6),
        .Q(IntReset_dly),
        .R(1'b0));
  FDRE \IntReset_dly_reg[1] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(IntReset_dly),
        .Q(\IntReset_dly_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \IntRx_BtVal_reg[3] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(\Rx_BtVal_0_reg[8] [0]),
        .Q(p_1_in[2]),
        .R(\IntReset_dly_reg_n_0_[1] ));
  FDRE \IntRx_BtVal_reg[4] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(\Rx_BtVal_0_reg[8] [1]),
        .Q(p_1_in[3]),
        .R(\IntReset_dly_reg_n_0_[1] ));
  FDRE \IntRx_BtVal_reg[5] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(\Rx_BtVal_0_reg[8] [2]),
        .Q(p_1_in[4]),
        .R(\IntReset_dly_reg_n_0_[1] ));
  FDRE \IntRx_BtVal_reg[6] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(\Rx_BtVal_0_reg[8] [3]),
        .Q(p_1_in[5]),
        .R(\IntReset_dly_reg_n_0_[1] ));
  FDRE \IntRx_BtVal_reg[7] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(\Rx_BtVal_0_reg[8] [4]),
        .Q(p_1_in[6]),
        .R(\IntReset_dly_reg_n_0_[1] ));
  FDRE \IntRx_BtVal_reg[8] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(\Rx_BtVal_0_reg[8] [5]),
        .Q(p_1_in[7]),
        .R(\IntReset_dly_reg_n_0_[1] ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFEF)) 
    LossOfSignal_i_2
       (.I0(act_count_reg__0[4]),
        .I1(act_count_reg__0[3]),
        .I2(\act_count_reg[1]_0 ),
        .I3(act_count_reg__0[0]),
        .I4(act_count_reg__0[2]),
        .I5(act_count_reg__0[1]),
        .O(LossOfSignal_reg_1));
  LUT6 #(
    .INIT(64'h0080000000000000)) 
    LossOfSignal_i_3
       (.I0(act_count_reg__0[2]),
        .I1(act_count_reg__0[1]),
        .I2(act_count_reg__0[0]),
        .I3(\act_count_reg[1]_0 ),
        .I4(act_count_reg__0[4]),
        .I5(act_count_reg__0[3]),
        .O(LossOfSignal_reg_0));
  FDSE LossOfSignal_reg
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(LossOfSignal_reg_2),
        .Q(SR),
        .S(\IntReset_dly_reg_n_0_[1] ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY8 \Mstr_CntValIn_Out0_inferred__1/i___0_carry 
       (.CI(monitor_late_reg_0),
        .CI_TOP(1'b0),
        .CO({\NLW_Mstr_CntValIn_Out0_inferred__1/i___0_carry_CO_UNCONNECTED [7:6],\Mstr_CntValIn_Out0_inferred__1/i___0_carry_n_2 ,\Mstr_CntValIn_Out0_inferred__1/i___0_carry_n_3 ,\NLW_Mstr_CntValIn_Out0_inferred__1/i___0_carry_CO_UNCONNECTED [3],\Mstr_CntValIn_Out0_inferred__1/i___0_carry_n_5 ,\Mstr_CntValIn_Out0_inferred__1/i___0_carry_n_6 ,\Mstr_CntValIn_Out0_inferred__1/i___0_carry_n_7 }),
        .DI({1'b0,1'b0,Q[5:0]}),
        .O({\NLW_Mstr_CntValIn_Out0_inferred__1/i___0_carry_O_UNCONNECTED [7],\Mstr_CntValIn_Out0_inferred__1/i___0_carry_n_9 ,\Mstr_CntValIn_Out0_inferred__1/i___0_carry_n_10 ,\Mstr_CntValIn_Out0_inferred__1/i___0_carry_n_11 ,\Mstr_CntValIn_Out0_inferred__1/i___0_carry_n_12 ,\Mstr_CntValIn_Out0_inferred__1/i___0_carry_n_13 ,\Mstr_CntValIn_Out0_inferred__1/i___0_carry_n_14 ,\Mstr_CntValIn_Out0_inferred__1/i___0_carry_n_15 }),
        .S({1'b0,i___0_carry_i_1_n_0,i___0_carry_i_2_n_0,i___0_carry_i_3_n_0,i___0_carry_i_4_n_0,i___0_carry_i_5_n_0,i___0_carry_i_6_n_0,i___0_carry_i_7_n_0}));
  LUT6 #(
    .INIT(64'h0010111100100010)) 
    \Mstr_CntValIn_Out[0]_i_1 
       (.I0(\Mstr_CntValIn_Out[8]_i_4_n_0 ),
        .I1(SR),
        .I2(\Mstr_CntValIn_Out_reg[0]_0 ),
        .I3(\Mstr_CntValIn_Out[1]_i_3_n_0 ),
        .I4(\Mstr_CntValIn_Out[1]_i_4_n_0 ),
        .I5(FifoRd_0_0[0]),
        .O(\Mstr_CntValIn_Out[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h08AA0808)) 
    \Mstr_CntValIn_Out[1]_i_1 
       (.I0(\Mstr_CntValIn_Out[1]_i_2_n_0 ),
        .I1(\Mstr_CntValIn_Out_reg[1]_0 ),
        .I2(\Mstr_CntValIn_Out[1]_i_3_n_0 ),
        .I3(\Mstr_CntValIn_Out[1]_i_4_n_0 ),
        .I4(FifoRd_0_0[1]),
        .O(\Mstr_CntValIn_Out[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair135" *) 
  LUT5 #(
    .INIT(32'h44454400)) 
    \Mstr_CntValIn_Out[1]_i_2 
       (.I0(SR),
        .I1(\Slve_CntValIn_Out_reg[1]_0 [0]),
        .I2(\Slve_CntValIn_Out_reg[1]_0 [1]),
        .I3(\Slve_CntValIn_Out_reg[1]_0 [4]),
        .I4(\Slve_CntValIn_Out_reg[1]_0 [5]),
        .O(\Mstr_CntValIn_Out[1]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair124" *) 
  LUT5 #(
    .INIT(32'hFFFFDDFD)) 
    \Mstr_CntValIn_Out[1]_i_3 
       (.I0(\Slve_CntValIn_Out_reg[1]_0 [1]),
        .I1(\Slve_CntValIn_Out_reg[1]_0 [2]),
        .I2(\Slve_CntValIn_Out_reg[1]_0 [5]),
        .I3(\Slve_CntValIn_Out_reg[1]_0 [0]),
        .I4(\Slve_CntValIn_Out_reg[1]_0 [4]),
        .O(\Mstr_CntValIn_Out[1]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair130" *) 
  LUT5 #(
    .INIT(32'h0C480C58)) 
    \Mstr_CntValIn_Out[1]_i_4 
       (.I0(\Slve_CntValIn_Out_reg[1]_0 [2]),
        .I1(\Slve_CntValIn_Out_reg[1]_0 [0]),
        .I2(\Slve_CntValIn_Out_reg[1]_0 [1]),
        .I3(\Slve_CntValIn_Out_reg[1]_0 [4]),
        .I4(\Slve_CntValIn_Out_reg[1]_0 [5]),
        .O(\Mstr_CntValIn_Out[1]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h00AA30AA)) 
    \Mstr_CntValIn_Out[2]_i_1 
       (.I0(DI),
        .I1(\Mstr_CntValIn_Out[8]_i_4_n_0 ),
        .I2(\Mstr_CntValIn_Out[2]_i_2_n_0 ),
        .I3(\Mstr_CntValIn_Out[8]_i_1_n_0 ),
        .I4(SR),
        .O(\Mstr_CntValIn_Out[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBBBBFCBB88883088)) 
    \Mstr_CntValIn_Out[2]_i_2 
       (.I0(\Mstr_CntValIn_Out0_inferred__1/i___0_carry_n_15 ),
        .I1(\Mstr_CntValIn_Out[8]_i_7_n_0 ),
        .I2(p_1_in[2]),
        .I3(\Slve_CntValIn_Out_reg[1]_0 [0]),
        .I4(\Slve_CntValIn_Out_reg[1]_0 [1]),
        .I5(DI),
        .O(\Mstr_CntValIn_Out[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hC8CCDDDDC8CC8888)) 
    \Mstr_CntValIn_Out[3]_i_1 
       (.I0(SR),
        .I1(p_1_in[2]),
        .I2(\Slve_CntValIn_Out_reg[1]_0 [1]),
        .I3(\Slve_CntValIn_Out_reg[1]_0 [0]),
        .I4(\Mstr_CntValIn_Out[8]_i_4_n_0 ),
        .I5(\Mstr_CntValIn_Out[3]_i_2_n_0 ),
        .O(\Mstr_CntValIn_Out[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h88883088BBBBFCBB)) 
    \Mstr_CntValIn_Out[3]_i_2 
       (.I0(\Mstr_CntValIn_Out0_inferred__1/i___0_carry_n_14 ),
        .I1(\Mstr_CntValIn_Out[8]_i_7_n_0 ),
        .I2(p_1_in[3]),
        .I3(\Slve_CntValIn_Out_reg[1]_0 [0]),
        .I4(\Slve_CntValIn_Out_reg[1]_0 [1]),
        .I5(FifoRd_0_0[2]),
        .O(\Mstr_CntValIn_Out[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hC8CCDDDDC8CC8888)) 
    \Mstr_CntValIn_Out[4]_i_1 
       (.I0(SR),
        .I1(p_1_in[3]),
        .I2(\Slve_CntValIn_Out_reg[1]_0 [1]),
        .I3(\Slve_CntValIn_Out_reg[1]_0 [0]),
        .I4(\Mstr_CntValIn_Out[8]_i_4_n_0 ),
        .I5(\Mstr_CntValIn_Out[4]_i_2_n_0 ),
        .O(\Mstr_CntValIn_Out[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFC8830BB30BBFC88)) 
    \Mstr_CntValIn_Out[4]_i_2 
       (.I0(\Mstr_CntValIn_Out0_inferred__1/i___0_carry_n_13 ),
        .I1(\Mstr_CntValIn_Out[8]_i_7_n_0 ),
        .I2(p_1_in[4]),
        .I3(\Mstr_CntValIn_Out[7]_i_4_n_0 ),
        .I4(FifoRd_0_0[2]),
        .I5(FifoRd_0_0[3]),
        .O(\Mstr_CntValIn_Out[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hC8CCDDDDC8CC8888)) 
    \Mstr_CntValIn_Out[5]_i_1 
       (.I0(SR),
        .I1(p_1_in[4]),
        .I2(\Slve_CntValIn_Out_reg[1]_0 [1]),
        .I3(\Slve_CntValIn_Out_reg[1]_0 [0]),
        .I4(\Mstr_CntValIn_Out[8]_i_4_n_0 ),
        .I5(\Mstr_CntValIn_Out[5]_i_2_n_0 ),
        .O(\Mstr_CntValIn_Out[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h9F90FFFF9F900000)) 
    \Mstr_CntValIn_Out[5]_i_2 
       (.I0(FifoRd_0_0[4]),
        .I1(\Mstr_CntValIn_Out[5]_i_3_n_0 ),
        .I2(\Mstr_CntValIn_Out[7]_i_4_n_0 ),
        .I3(\Mstr_CntValIn_Out0_inferred__1/i___0_carry_n_12 ),
        .I4(\Mstr_CntValIn_Out[8]_i_7_n_0 ),
        .I5(\Mstr_CntValIn_Out[5]_i_4_n_0 ),
        .O(\Mstr_CntValIn_Out[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair170" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \Mstr_CntValIn_Out[5]_i_3 
       (.I0(FifoRd_0_0[2]),
        .I1(FifoRd_0_0[3]),
        .O(\Mstr_CntValIn_Out[5]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h08FBFB08FB08FB08)) 
    \Mstr_CntValIn_Out[5]_i_4 
       (.I0(p_1_in[5]),
        .I1(\Slve_CntValIn_Out_reg[1]_0 [0]),
        .I2(\Slve_CntValIn_Out_reg[1]_0 [1]),
        .I3(FifoRd_0_0[4]),
        .I4(FifoRd_0_0[3]),
        .I5(FifoRd_0_0[2]),
        .O(\Mstr_CntValIn_Out[5]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hC8CCDDDDC8CC8888)) 
    \Mstr_CntValIn_Out[6]_i_1 
       (.I0(SR),
        .I1(p_1_in[5]),
        .I2(\Slve_CntValIn_Out_reg[1]_0 [1]),
        .I3(\Slve_CntValIn_Out_reg[1]_0 [0]),
        .I4(\Mstr_CntValIn_Out[8]_i_4_n_0 ),
        .I5(\Mstr_CntValIn_Out[6]_i_2_n_0 ),
        .O(\Mstr_CntValIn_Out[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h9F90FFFF9F900000)) 
    \Mstr_CntValIn_Out[6]_i_2 
       (.I0(FifoRd_0_0[5]),
        .I1(\Mstr_CntValIn_Out[6]_i_3_n_0 ),
        .I2(\Mstr_CntValIn_Out[7]_i_4_n_0 ),
        .I3(\Mstr_CntValIn_Out0_inferred__1/i___0_carry_n_11 ),
        .I4(\Mstr_CntValIn_Out[8]_i_7_n_0 ),
        .I5(\Mstr_CntValIn_Out[6]_i_4_n_0 ),
        .O(\Mstr_CntValIn_Out[6]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair170" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \Mstr_CntValIn_Out[6]_i_3 
       (.I0(FifoRd_0_0[4]),
        .I1(FifoRd_0_0[3]),
        .I2(FifoRd_0_0[2]),
        .O(\Mstr_CntValIn_Out[6]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h8BB8B8B8B8B8B8B8)) 
    \Mstr_CntValIn_Out[6]_i_4 
       (.I0(p_1_in[6]),
        .I1(\Mstr_CntValIn_Out[7]_i_4_n_0 ),
        .I2(FifoRd_0_0[5]),
        .I3(FifoRd_0_0[4]),
        .I4(FifoRd_0_0[2]),
        .I5(FifoRd_0_0[3]),
        .O(\Mstr_CntValIn_Out[6]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hC8CCDDDDC8CC8888)) 
    \Mstr_CntValIn_Out[7]_i_1 
       (.I0(SR),
        .I1(p_1_in[6]),
        .I2(\Slve_CntValIn_Out_reg[1]_0 [1]),
        .I3(\Slve_CntValIn_Out_reg[1]_0 [0]),
        .I4(\Mstr_CntValIn_Out[8]_i_4_n_0 ),
        .I5(\Mstr_CntValIn_Out[7]_i_2_n_0 ),
        .O(\Mstr_CntValIn_Out[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h6F60FFFF6F600000)) 
    \Mstr_CntValIn_Out[7]_i_2 
       (.I0(FifoRd_0_0[6]),
        .I1(\Mstr_CntValIn_Out[7]_i_3_n_0 ),
        .I2(\Mstr_CntValIn_Out[7]_i_4_n_0 ),
        .I3(\Mstr_CntValIn_Out0_inferred__1/i___0_carry_n_10 ),
        .I4(\Mstr_CntValIn_Out[8]_i_7_n_0 ),
        .I5(\Mstr_CntValIn_Out[7]_i_5_n_0 ),
        .O(\Mstr_CntValIn_Out[7]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair152" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \Mstr_CntValIn_Out[7]_i_3 
       (.I0(FifoRd_0_0[5]),
        .I1(FifoRd_0_0[2]),
        .I2(FifoRd_0_0[3]),
        .I3(FifoRd_0_0[4]),
        .O(\Mstr_CntValIn_Out[7]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair117" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \Mstr_CntValIn_Out[7]_i_4 
       (.I0(\Slve_CntValIn_Out_reg[1]_0 [0]),
        .I1(\Slve_CntValIn_Out_reg[1]_0 [1]),
        .O(\Mstr_CntValIn_Out[7]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair123" *) 
  LUT5 #(
    .INIT(32'h08FBFB08)) 
    \Mstr_CntValIn_Out[7]_i_5 
       (.I0(p_1_in[7]),
        .I1(\Slve_CntValIn_Out_reg[1]_0 [0]),
        .I2(\Slve_CntValIn_Out_reg[1]_0 [1]),
        .I3(FifoRd_0_0[6]),
        .I4(\Mstr_CntValIn_Out[7]_i_6_n_0 ),
        .O(\Mstr_CntValIn_Out[7]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair152" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \Mstr_CntValIn_Out[7]_i_6 
       (.I0(FifoRd_0_0[5]),
        .I1(FifoRd_0_0[4]),
        .I2(FifoRd_0_0[2]),
        .I3(FifoRd_0_0[3]),
        .O(\Mstr_CntValIn_Out[7]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAABABAABBABA)) 
    \Mstr_CntValIn_Out[8]_i_1 
       (.I0(SR),
        .I1(\Mstr_CntValIn_Out[8]_i_3_n_0 ),
        .I2(\active_reg[4]_0 ),
        .I3(\Slve_CntValIn_Out_reg[1]_0 [1]),
        .I4(\Slve_CntValIn_Out_reg[1]_0 [5]),
        .I5(\Slve_CntValIn_Out_reg[1]_0 [4]),
        .O(\Mstr_CntValIn_Out[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hC8CCDDDDC8CC8888)) 
    \Mstr_CntValIn_Out[8]_i_2 
       (.I0(SR),
        .I1(p_1_in[7]),
        .I2(\Slve_CntValIn_Out_reg[1]_0 [1]),
        .I3(\Slve_CntValIn_Out_reg[1]_0 [0]),
        .I4(\Mstr_CntValIn_Out[8]_i_4_n_0 ),
        .I5(\Mstr_CntValIn_Out[8]_i_5_n_0 ),
        .O(\Mstr_CntValIn_Out[8]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair128" *) 
  LUT5 #(
    .INIT(32'hEFEEFEEF)) 
    \Mstr_CntValIn_Out[8]_i_3 
       (.I0(\Slve_CntValIn_Out_reg[1]_0 [2]),
        .I1(\Slve_CntValIn_Out_reg[1]_0 [3]),
        .I2(\Slve_CntValIn_Out_reg[1]_0 [0]),
        .I3(\Slve_CntValIn_Out_reg[1]_0 [1]),
        .I4(\Slve_CntValIn_Out_reg[1]_0 [5]),
        .O(\Mstr_CntValIn_Out[8]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair130" *) 
  LUT4 #(
    .INIT(16'h11FD)) 
    \Mstr_CntValIn_Out[8]_i_4 
       (.I0(\Slve_CntValIn_Out_reg[1]_0 [5]),
        .I1(\Slve_CntValIn_Out_reg[1]_0 [4]),
        .I2(\Slve_CntValIn_Out_reg[1]_0 [1]),
        .I3(\Slve_CntValIn_Out_reg[1]_0 [0]),
        .O(\Mstr_CntValIn_Out[8]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hC0A0C0C0CFA0CFCF)) 
    \Mstr_CntValIn_Out[8]_i_5 
       (.I0(\Mstr_CntValIn_Out[8]_i_6_n_0 ),
        .I1(\Mstr_CntValIn_Out0_inferred__1/i___0_carry_n_9 ),
        .I2(\Mstr_CntValIn_Out[8]_i_7_n_0 ),
        .I3(\Slve_CntValIn_Out_reg[1]_0 [1]),
        .I4(\Slve_CntValIn_Out_reg[1]_0 [0]),
        .I5(\Mstr_CntValIn_Out[8]_i_8_n_0 ),
        .O(\Mstr_CntValIn_Out[8]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA9)) 
    \Mstr_CntValIn_Out[8]_i_6 
       (.I0(FifoRd_0_0[7]),
        .I1(FifoRd_0_0[6]),
        .I2(FifoRd_0_0[5]),
        .I3(FifoRd_0_0[2]),
        .I4(FifoRd_0_0[3]),
        .I5(FifoRd_0_0[4]),
        .O(\Mstr_CntValIn_Out[8]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair124" *) 
  LUT5 #(
    .INIT(32'h00003310)) 
    \Mstr_CntValIn_Out[8]_i_7 
       (.I0(\Slve_CntValIn_Out_reg[1]_0 [5]),
        .I1(\Slve_CntValIn_Out_reg[1]_0 [4]),
        .I2(\Slve_CntValIn_Out_reg[1]_0 [1]),
        .I3(\Slve_CntValIn_Out_reg[1]_0 [0]),
        .I4(\Slve_CntValIn_Out_reg[1]_0 [2]),
        .O(\Mstr_CntValIn_Out[8]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h9555555555555555)) 
    \Mstr_CntValIn_Out[8]_i_8 
       (.I0(FifoRd_0_0[7]),
        .I1(FifoRd_0_0[5]),
        .I2(FifoRd_0_0[4]),
        .I3(FifoRd_0_0[2]),
        .I4(FifoRd_0_0[3]),
        .I5(FifoRd_0_0[6]),
        .O(\Mstr_CntValIn_Out[8]_i_8_n_0 ));
  FDRE \Mstr_CntValIn_Out_reg[0] 
       (.C(Rx_SysClk),
        .CE(\Mstr_CntValIn_Out[8]_i_1_n_0 ),
        .D(\Mstr_CntValIn_Out[0]_i_1_n_0 ),
        .Q(FifoRd_0_0[0]),
        .R(1'b0));
  FDRE \Mstr_CntValIn_Out_reg[1] 
       (.C(Rx_SysClk),
        .CE(\Mstr_CntValIn_Out[8]_i_1_n_0 ),
        .D(\Mstr_CntValIn_Out[1]_i_1_n_0 ),
        .Q(FifoRd_0_0[1]),
        .R(1'b0));
  FDRE \Mstr_CntValIn_Out_reg[2] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(\Mstr_CntValIn_Out[2]_i_1_n_0 ),
        .Q(DI),
        .R(1'b0));
  FDRE \Mstr_CntValIn_Out_reg[3] 
       (.C(Rx_SysClk),
        .CE(\Mstr_CntValIn_Out[8]_i_1_n_0 ),
        .D(\Mstr_CntValIn_Out[3]_i_1_n_0 ),
        .Q(FifoRd_0_0[2]),
        .R(1'b0));
  FDRE \Mstr_CntValIn_Out_reg[4] 
       (.C(Rx_SysClk),
        .CE(\Mstr_CntValIn_Out[8]_i_1_n_0 ),
        .D(\Mstr_CntValIn_Out[4]_i_1_n_0 ),
        .Q(FifoRd_0_0[3]),
        .R(1'b0));
  FDRE \Mstr_CntValIn_Out_reg[5] 
       (.C(Rx_SysClk),
        .CE(\Mstr_CntValIn_Out[8]_i_1_n_0 ),
        .D(\Mstr_CntValIn_Out[5]_i_1_n_0 ),
        .Q(FifoRd_0_0[4]),
        .R(1'b0));
  FDRE \Mstr_CntValIn_Out_reg[6] 
       (.C(Rx_SysClk),
        .CE(\Mstr_CntValIn_Out[8]_i_1_n_0 ),
        .D(\Mstr_CntValIn_Out[6]_i_1_n_0 ),
        .Q(FifoRd_0_0[5]),
        .R(1'b0));
  FDRE \Mstr_CntValIn_Out_reg[7] 
       (.C(Rx_SysClk),
        .CE(\Mstr_CntValIn_Out[8]_i_1_n_0 ),
        .D(\Mstr_CntValIn_Out[7]_i_1_n_0 ),
        .Q(FifoRd_0_0[6]),
        .R(1'b0));
  FDRE \Mstr_CntValIn_Out_reg[8] 
       (.C(Rx_SysClk),
        .CE(\Mstr_CntValIn_Out[8]_i_1_n_0 ),
        .D(\Mstr_CntValIn_Out[8]_i_2_n_0 ),
        .Q(FifoRd_0_0[7]),
        .R(1'b0));
  FDRE \Mstr_Load_dly_reg[0] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(\Mstr_Load_dly_reg[0]_0 ),
        .Q(Mstr_Load_dly[0]),
        .R(1'b0));
  FDRE \Mstr_Load_dly_reg[1] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(Mstr_Load_dly[0]),
        .Q(Mstr_Load_dly[1]),
        .R(1'b0));
  FDSE Mstr_Load_reg
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(ActiveIsSlve_reg_1),
        .Q(\Mstr_Load_dly_reg[0]_0 ),
        .S(SR));
  (* SOFT_HLUTNM = "soft_lutpair157" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \PhaseDet_CntDec[0]_i_1 
       (.I0(\PhaseDet_CntDec[2]_i_3_n_0 ),
        .I1(\PhaseDet_CntDec[2]_i_2_n_0 ),
        .I2(\PhaseDet_CntDec[2]_i_4_n_0 ),
        .I3(\PhaseDet_CntDec[2]_i_5_n_0 ),
        .O(\PhaseDet_CntDec[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hDB4D)) 
    \PhaseDet_CntDec[1]_i_1 
       (.I0(\PhaseDet_CntDec[2]_i_2_n_0 ),
        .I1(\PhaseDet_CntDec[2]_i_3_n_0 ),
        .I2(\PhaseDet_CntDec[2]_i_4_n_0 ),
        .I3(\PhaseDet_CntDec[2]_i_5_n_0 ),
        .O(\PhaseDet_CntDec[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair157" *) 
  LUT4 #(
    .INIT(16'h0400)) 
    \PhaseDet_CntDec[2]_i_1 
       (.I0(\PhaseDet_CntDec[2]_i_2_n_0 ),
        .I1(\PhaseDet_CntDec[2]_i_3_n_0 ),
        .I2(\PhaseDet_CntDec[2]_i_4_n_0 ),
        .I3(\PhaseDet_CntDec[2]_i_5_n_0 ),
        .O(\PhaseDet_CntDec[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair132" *) 
  LUT5 #(
    .INIT(32'hFF47B8FF)) 
    \PhaseDet_CntDec[2]_i_2 
       (.I0(monitor[4]),
        .I1(monitor_late_reg_1),
        .I2(monitor[3]),
        .I3(\active_reg_n_0_[4] ),
        .I4(\active_reg_n_0_[3] ),
        .O(\PhaseDet_CntDec[2]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair133" *) 
  LUT5 #(
    .INIT(32'h00B84700)) 
    \PhaseDet_CntDec[2]_i_3 
       (.I0(monitor[6]),
        .I1(monitor_late_reg_1),
        .I2(monitor[5]),
        .I3(\active_reg_n_0_[6] ),
        .I4(\active_reg_n_0_[5] ),
        .O(\PhaseDet_CntDec[2]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair127" *) 
  LUT5 #(
    .INIT(32'hFF47B8FF)) 
    \PhaseDet_CntDec[2]_i_4 
       (.I0(monitor[5]),
        .I1(monitor_late_reg_1),
        .I2(monitor[4]),
        .I3(\active_reg_n_0_[5] ),
        .I4(\active_reg_n_0_[4] ),
        .O(\PhaseDet_CntDec[2]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair126" *) 
  LUT5 #(
    .INIT(32'h00B84700)) 
    \PhaseDet_CntDec[2]_i_5 
       (.I0(monitor[7]),
        .I1(monitor_late_reg_1),
        .I2(monitor[6]),
        .I3(\active_reg_n_0_[7] ),
        .I4(\active_reg_n_0_[6] ),
        .O(\PhaseDet_CntDec[2]_i_5_n_0 ));
  FDRE \PhaseDet_CntDec_reg[0] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(\PhaseDet_CntDec[0]_i_1_n_0 ),
        .Q(PhaseDet_CntDec[0]),
        .R(1'b0));
  FDRE \PhaseDet_CntDec_reg[1] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(\PhaseDet_CntDec[1]_i_1_n_0 ),
        .Q(PhaseDet_CntDec[1]),
        .R(1'b0));
  FDRE \PhaseDet_CntDec_reg[2] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(\PhaseDet_CntDec[2]_i_1_n_0 ),
        .Q(PhaseDet_CntDec[2]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair156" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \PhaseDet_CntInc[0]_i_1 
       (.I0(\PhaseDet_CntInc[2]_i_4_n_0 ),
        .I1(\PhaseDet_CntInc[2]_i_3_n_0 ),
        .I2(\PhaseDet_CntInc[2]_i_5_n_0 ),
        .I3(\PhaseDet_CntInc[2]_i_2_n_0 ),
        .O(\PhaseDet_CntInc[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hDB4D)) 
    \PhaseDet_CntInc[1]_i_1 
       (.I0(\PhaseDet_CntInc[2]_i_2_n_0 ),
        .I1(\PhaseDet_CntInc[2]_i_3_n_0 ),
        .I2(\PhaseDet_CntInc[2]_i_4_n_0 ),
        .I3(\PhaseDet_CntInc[2]_i_5_n_0 ),
        .O(\PhaseDet_CntInc[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair156" *) 
  LUT4 #(
    .INIT(16'h0400)) 
    \PhaseDet_CntInc[2]_i_1 
       (.I0(\PhaseDet_CntInc[2]_i_2_n_0 ),
        .I1(\PhaseDet_CntInc[2]_i_3_n_0 ),
        .I2(\PhaseDet_CntInc[2]_i_4_n_0 ),
        .I3(\PhaseDet_CntInc[2]_i_5_n_0 ),
        .O(\PhaseDet_CntInc[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair132" *) 
  LUT5 #(
    .INIT(32'hFF47B8FF)) 
    \PhaseDet_CntInc[2]_i_2 
       (.I0(monitor[4]),
        .I1(monitor_late_reg_1),
        .I2(monitor[3]),
        .I3(\active_reg_n_0_[3] ),
        .I4(\active_reg_n_0_[4] ),
        .O(\PhaseDet_CntInc[2]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair133" *) 
  LUT5 #(
    .INIT(32'h00B84700)) 
    \PhaseDet_CntInc[2]_i_3 
       (.I0(monitor[6]),
        .I1(monitor_late_reg_1),
        .I2(monitor[5]),
        .I3(\active_reg_n_0_[5] ),
        .I4(\active_reg_n_0_[6] ),
        .O(\PhaseDet_CntInc[2]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair126" *) 
  LUT5 #(
    .INIT(32'hFF47B8FF)) 
    \PhaseDet_CntInc[2]_i_4 
       (.I0(monitor[7]),
        .I1(monitor_late_reg_1),
        .I2(monitor[6]),
        .I3(\active_reg_n_0_[6] ),
        .I4(\active_reg_n_0_[7] ),
        .O(\PhaseDet_CntInc[2]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair127" *) 
  LUT5 #(
    .INIT(32'h00B84700)) 
    \PhaseDet_CntInc[2]_i_5 
       (.I0(monitor[5]),
        .I1(monitor_late_reg_1),
        .I2(monitor[4]),
        .I3(\active_reg_n_0_[4] ),
        .I4(\active_reg_n_0_[5] ),
        .O(\PhaseDet_CntInc[2]_i_5_n_0 ));
  FDRE \PhaseDet_CntInc_reg[0] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(\PhaseDet_CntInc[0]_i_1_n_0 ),
        .Q(PhaseDet_CntInc[0]),
        .R(1'b0));
  FDRE \PhaseDet_CntInc_reg[1] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(\PhaseDet_CntInc[1]_i_1_n_0 ),
        .Q(PhaseDet_CntInc[1]),
        .R(1'b0));
  FDRE \PhaseDet_CntInc_reg[2] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(\PhaseDet_CntInc[2]_i_1_n_0 ),
        .Q(PhaseDet_CntInc[2]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Rx_Algn_Data_Out[0]_i_1 
       (.I0(data9[0]),
        .I1(\rxdh_reg_n_0_[8] ),
        .I2(mpx[3]),
        .I3(\Rx_Algn_Data_Out[4]_i_2_n_0 ),
        .I4(\Rx_Algn_Data_Out[9]_i_3_n_0 ),
        .I5(\Rx_Algn_Data_Out[0]_i_2_n_0 ),
        .O(\Rx_Algn_Data_Out[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Rx_Algn_Data_Out[0]_i_2 
       (.I0(\rxdh_reg_n_0_[3] ),
        .I1(\rxdh_reg_n_0_[2] ),
        .I2(mpx[1]),
        .I3(\rxdh_reg_n_0_[1] ),
        .I4(mpx[0]),
        .I5(\rxdh_reg_n_0_[0] ),
        .O(\Rx_Algn_Data_Out[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Rx_Algn_Data_Out[1]_i_1 
       (.I0(data9[1]),
        .I1(data9[0]),
        .I2(mpx[3]),
        .I3(\Rx_Algn_Data_Out[5]_i_2_n_0 ),
        .I4(\Rx_Algn_Data_Out[9]_i_3_n_0 ),
        .I5(\Rx_Algn_Data_Out[1]_i_2_n_0 ),
        .O(\Rx_Algn_Data_Out[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Rx_Algn_Data_Out[1]_i_2 
       (.I0(\rxdh_reg_n_0_[4] ),
        .I1(\rxdh_reg_n_0_[3] ),
        .I2(mpx[1]),
        .I3(\rxdh_reg_n_0_[2] ),
        .I4(mpx[0]),
        .I5(\rxdh_reg_n_0_[1] ),
        .O(\Rx_Algn_Data_Out[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Rx_Algn_Data_Out[2]_i_1 
       (.I0(data9[2]),
        .I1(data9[1]),
        .I2(mpx[3]),
        .I3(\Rx_Algn_Data_Out[6]_i_3_n_0 ),
        .I4(\Rx_Algn_Data_Out[9]_i_3_n_0 ),
        .I5(\Rx_Algn_Data_Out[2]_i_2_n_0 ),
        .O(\Rx_Algn_Data_Out[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Rx_Algn_Data_Out[2]_i_2 
       (.I0(\rxdh_reg_n_0_[5] ),
        .I1(\rxdh_reg_n_0_[4] ),
        .I2(mpx[1]),
        .I3(\rxdh_reg_n_0_[3] ),
        .I4(mpx[0]),
        .I5(\rxdh_reg_n_0_[2] ),
        .O(\Rx_Algn_Data_Out[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Rx_Algn_Data_Out[3]_i_1 
       (.I0(data9[3]),
        .I1(data9[2]),
        .I2(mpx[3]),
        .I3(\Rx_Algn_Data_Out[7]_i_3_n_0 ),
        .I4(\Rx_Algn_Data_Out[9]_i_3_n_0 ),
        .I5(\Rx_Algn_Data_Out[3]_i_2_n_0 ),
        .O(\Rx_Algn_Data_Out[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Rx_Algn_Data_Out[3]_i_2 
       (.I0(\rxdh_reg_n_0_[6] ),
        .I1(\rxdh_reg_n_0_[5] ),
        .I2(mpx[1]),
        .I3(\rxdh_reg_n_0_[4] ),
        .I4(mpx[0]),
        .I5(\rxdh_reg_n_0_[3] ),
        .O(\Rx_Algn_Data_Out[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Rx_Algn_Data_Out[4]_i_1 
       (.I0(data9[4]),
        .I1(data9[3]),
        .I2(mpx[3]),
        .I3(\Rx_Algn_Data_Out[8]_i_3_n_0 ),
        .I4(\Rx_Algn_Data_Out[9]_i_3_n_0 ),
        .I5(\Rx_Algn_Data_Out[4]_i_2_n_0 ),
        .O(\Rx_Algn_Data_Out[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Rx_Algn_Data_Out[4]_i_2 
       (.I0(\rxdh_reg_n_0_[7] ),
        .I1(\rxdh_reg_n_0_[6] ),
        .I2(mpx[1]),
        .I3(\rxdh_reg_n_0_[5] ),
        .I4(mpx[0]),
        .I5(\rxdh_reg_n_0_[4] ),
        .O(\Rx_Algn_Data_Out[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Rx_Algn_Data_Out[5]_i_1 
       (.I0(data9[5]),
        .I1(data9[4]),
        .I2(mpx[3]),
        .I3(\Rx_Algn_Data_Out[9]_i_4_n_0 ),
        .I4(\Rx_Algn_Data_Out[9]_i_3_n_0 ),
        .I5(\Rx_Algn_Data_Out[5]_i_2_n_0 ),
        .O(\Rx_Algn_Data_Out[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Rx_Algn_Data_Out[5]_i_2 
       (.I0(\rxdh_reg_n_0_[8] ),
        .I1(\rxdh_reg_n_0_[7] ),
        .I2(mpx[1]),
        .I3(\rxdh_reg_n_0_[6] ),
        .I4(mpx[0]),
        .I5(\rxdh_reg_n_0_[5] ),
        .O(\Rx_Algn_Data_Out[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Rx_Algn_Data_Out[6]_i_1 
       (.I0(data9[6]),
        .I1(data9[5]),
        .I2(mpx[3]),
        .I3(\Rx_Algn_Data_Out[6]_i_2_n_0 ),
        .I4(\Rx_Algn_Data_Out[9]_i_3_n_0 ),
        .I5(\Rx_Algn_Data_Out[6]_i_3_n_0 ),
        .O(\Rx_Algn_Data_Out[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Rx_Algn_Data_Out[6]_i_2 
       (.I0(data9[4]),
        .I1(data9[3]),
        .I2(mpx[1]),
        .I3(data9[2]),
        .I4(mpx[0]),
        .I5(data9[1]),
        .O(\Rx_Algn_Data_Out[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Rx_Algn_Data_Out[6]_i_3 
       (.I0(data9[0]),
        .I1(\rxdh_reg_n_0_[8] ),
        .I2(mpx[1]),
        .I3(\rxdh_reg_n_0_[7] ),
        .I4(mpx[0]),
        .I5(\rxdh_reg_n_0_[6] ),
        .O(\Rx_Algn_Data_Out[6]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Rx_Algn_Data_Out[7]_i_1 
       (.I0(data9[7]),
        .I1(data9[6]),
        .I2(mpx[3]),
        .I3(\Rx_Algn_Data_Out[7]_i_2_n_0 ),
        .I4(\Rx_Algn_Data_Out[9]_i_3_n_0 ),
        .I5(\Rx_Algn_Data_Out[7]_i_3_n_0 ),
        .O(\Rx_Algn_Data_Out[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Rx_Algn_Data_Out[7]_i_2 
       (.I0(data9[5]),
        .I1(data9[4]),
        .I2(mpx[1]),
        .I3(data9[3]),
        .I4(mpx[0]),
        .I5(data9[2]),
        .O(\Rx_Algn_Data_Out[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Rx_Algn_Data_Out[7]_i_3 
       (.I0(data9[1]),
        .I1(data9[0]),
        .I2(mpx[1]),
        .I3(\rxdh_reg_n_0_[8] ),
        .I4(mpx[0]),
        .I5(\rxdh_reg_n_0_[7] ),
        .O(\Rx_Algn_Data_Out[7]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Rx_Algn_Data_Out[8]_i_1 
       (.I0(data9[8]),
        .I1(data9[7]),
        .I2(mpx[3]),
        .I3(\Rx_Algn_Data_Out[8]_i_2_n_0 ),
        .I4(\Rx_Algn_Data_Out[9]_i_3_n_0 ),
        .I5(\Rx_Algn_Data_Out[8]_i_3_n_0 ),
        .O(\Rx_Algn_Data_Out[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Rx_Algn_Data_Out[8]_i_2 
       (.I0(data9[6]),
        .I1(data9[5]),
        .I2(mpx[1]),
        .I3(data9[4]),
        .I4(mpx[0]),
        .I5(data9[3]),
        .O(\Rx_Algn_Data_Out[8]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Rx_Algn_Data_Out[8]_i_3 
       (.I0(data9[2]),
        .I1(data9[1]),
        .I2(mpx[1]),
        .I3(data9[0]),
        .I4(mpx[0]),
        .I5(\rxdh_reg_n_0_[8] ),
        .O(\Rx_Algn_Data_Out[8]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Rx_Algn_Data_Out[9]_i_1 
       (.I0(data9[9]),
        .I1(data9[8]),
        .I2(mpx[3]),
        .I3(\Rx_Algn_Data_Out[9]_i_2_n_0 ),
        .I4(\Rx_Algn_Data_Out[9]_i_3_n_0 ),
        .I5(\Rx_Algn_Data_Out[9]_i_4_n_0 ),
        .O(\Rx_Algn_Data_Out[9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Rx_Algn_Data_Out[9]_i_2 
       (.I0(data9[7]),
        .I1(data9[6]),
        .I2(mpx[1]),
        .I3(data9[5]),
        .I4(mpx[0]),
        .I5(data9[4]),
        .O(\Rx_Algn_Data_Out[9]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \Rx_Algn_Data_Out[9]_i_3 
       (.I0(mpx[0]),
        .I1(mpx[3]),
        .I2(mpx[2]),
        .O(\Rx_Algn_Data_Out[9]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \Rx_Algn_Data_Out[9]_i_4 
       (.I0(data9[3]),
        .I1(data9[2]),
        .I2(mpx[1]),
        .I3(data9[1]),
        .I4(mpx[0]),
        .I5(data9[0]),
        .O(\Rx_Algn_Data_Out[9]_i_4_n_0 ));
  FDRE \Rx_Algn_Data_Out_reg[0] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(\Rx_Algn_Data_Out[0]_i_1_n_0 ),
        .Q(al_rx_data_out[0]),
        .R(1'b0));
  FDRE \Rx_Algn_Data_Out_reg[1] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(\Rx_Algn_Data_Out[1]_i_1_n_0 ),
        .Q(al_rx_data_out[1]),
        .R(1'b0));
  FDRE \Rx_Algn_Data_Out_reg[2] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(\Rx_Algn_Data_Out[2]_i_1_n_0 ),
        .Q(al_rx_data_out[2]),
        .R(1'b0));
  FDRE \Rx_Algn_Data_Out_reg[3] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(\Rx_Algn_Data_Out[3]_i_1_n_0 ),
        .Q(al_rx_data_out[3]),
        .R(1'b0));
  FDRE \Rx_Algn_Data_Out_reg[4] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(\Rx_Algn_Data_Out[4]_i_1_n_0 ),
        .Q(al_rx_data_out[4]),
        .R(1'b0));
  FDRE \Rx_Algn_Data_Out_reg[5] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(\Rx_Algn_Data_Out[5]_i_1_n_0 ),
        .Q(al_rx_data_out[5]),
        .R(1'b0));
  FDRE \Rx_Algn_Data_Out_reg[6] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(\Rx_Algn_Data_Out[6]_i_1_n_0 ),
        .Q(al_rx_data_out[6]),
        .R(1'b0));
  FDRE \Rx_Algn_Data_Out_reg[7] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(\Rx_Algn_Data_Out[7]_i_1_n_0 ),
        .Q(al_rx_data_out[7]),
        .R(1'b0));
  FDRE \Rx_Algn_Data_Out_reg[8] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(\Rx_Algn_Data_Out[8]_i_1_n_0 ),
        .Q(al_rx_data_out[8]),
        .R(1'b0));
  FDRE \Rx_Algn_Data_Out_reg[9] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(\Rx_Algn_Data_Out[9]_i_1_n_0 ),
        .Q(al_rx_data_out[9]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h8)) 
    Rx_Algn_Valid_Out_i_1
       (.I0(\rxdh_reg[0]_0 ),
        .I1(Aligned),
        .O(Rx_Algn_Valid_Out0));
  FDRE Rx_Algn_Valid_Out_reg
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(Rx_Algn_Valid_Out0),
        .Q(E),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0000000000000057)) 
    Rx_Valid_Int_i_1
       (.I0(\toggle_reg_n_0_[2] ),
        .I1(\toggle_reg_n_0_[0] ),
        .I2(\toggle_reg_n_0_[1] ),
        .I3(\toggle_reg_n_0_[3] ),
        .I4(\rxdh_reg[0]_0 ),
        .I5(SR),
        .O(Rx_Valid_Int_i_1_n_0));
  FDRE Rx_Valid_Int_reg
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(Rx_Valid_Int_i_1_n_0),
        .Q(\rxdh_reg[0]_0 ),
        .R(1'b0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY8 \Slve_CntValIn_Out0_inferred__1/i___0_carry 
       (.CI(monitor_late_reg_0),
        .CI_TOP(1'b0),
        .CO({\NLW_Slve_CntValIn_Out0_inferred__1/i___0_carry_CO_UNCONNECTED [7:6],\Slve_CntValIn_Out0_inferred__1/i___0_carry_n_2 ,\Slve_CntValIn_Out0_inferred__1/i___0_carry_n_3 ,\NLW_Slve_CntValIn_Out0_inferred__1/i___0_carry_CO_UNCONNECTED [3],\Slve_CntValIn_Out0_inferred__1/i___0_carry_n_5 ,\Slve_CntValIn_Out0_inferred__1/i___0_carry_n_6 ,\Slve_CntValIn_Out0_inferred__1/i___0_carry_n_7 }),
        .DI({1'b0,1'b0,FifoRd_0_0[6:2],DI}),
        .O({\NLW_Slve_CntValIn_Out0_inferred__1/i___0_carry_O_UNCONNECTED [7],\Slve_CntValIn_Out0_inferred__1/i___0_carry_n_9 ,\Slve_CntValIn_Out0_inferred__1/i___0_carry_n_10 ,\Slve_CntValIn_Out0_inferred__1/i___0_carry_n_11 ,\Slve_CntValIn_Out0_inferred__1/i___0_carry_n_12 ,\Slve_CntValIn_Out0_inferred__1/i___0_carry_n_13 ,\Slve_CntValIn_Out0_inferred__1/i___0_carry_n_14 ,\Slve_CntValIn_Out0_inferred__1/i___0_carry_n_15 }),
        .S({1'b0,i___0_carry_i_1__0_n_0,i___0_carry_i_2__0_n_0,i___0_carry_i_3__0_n_0,i___0_carry_i_4__0_n_0,i___0_carry_i_5__0_n_0,i___0_carry_i_6__0_n_0,i___0_carry_i_7__0_n_0}));
  LUT6 #(
    .INIT(64'hFEEEAAAAAEEEAAAA)) 
    \Slve_CntValIn_Out[0]_i_1 
       (.I0(\Slve_CntValIn_Out[1]_i_2_n_0 ),
        .I1(\Mstr_CntValIn_Out_reg[0]_0 ),
        .I2(\Slve_CntValIn_Out_reg[1]_0 [1]),
        .I3(\Slve_CntValIn_Out_reg[1]_0 [0]),
        .I4(\Slve_CntValIn_Out_reg[1]_0 [5]),
        .I5(FifoRd_0_0[0]),
        .O(\Slve_CntValIn_Out[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFAAEAAA)) 
    \Slve_CntValIn_Out[1]_i_1 
       (.I0(\Slve_CntValIn_Out[1]_i_2_n_0 ),
        .I1(\Mstr_CntValIn_Out_reg[1]_0 ),
        .I2(\Slve_CntValIn_Out_reg[1]_1 ),
        .I3(\Slve_CntValIn_Out_reg[1]_0 [5]),
        .I4(FifoRd_0_0[1]),
        .O(\Slve_CntValIn_Out[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair137" *) 
  LUT4 #(
    .INIT(16'h0400)) 
    \Slve_CntValIn_Out[1]_i_2 
       (.I0(\Slve_CntValIn_Out_reg[1]_0 [4]),
        .I1(\active_reg[4]_0 ),
        .I2(\Slve_CntValIn_Out_reg[1]_0 [5]),
        .I3(\Slve_CntValIn_Out_reg[1]_0 [0]),
        .O(\Slve_CntValIn_Out[1]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair123" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \Slve_CntValIn_Out[1]_i_3 
       (.I0(\Slve_CntValIn_Out_reg[1]_0 [1]),
        .I1(\Slve_CntValIn_Out_reg[1]_0 [0]),
        .O(\Slve_CntValIn_Out_reg[1]_1 ));
  LUT6 #(
    .INIT(64'hF4F5E4E4F4E4E4E4)) 
    \Slve_CntValIn_Out[2]_i_1 
       (.I0(SR),
        .I1(\Slve_CntValIn_Out[2]_i_2_n_0 ),
        .I2(p_1_in[2]),
        .I3(\Slve_CntValIn_Out_reg[1]_0 [4]),
        .I4(\Slve_CntValIn_Out[2]_i_3_n_0 ),
        .I5(\active_reg[4]_0 ),
        .O(\Slve_CntValIn_Out[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair119" *) 
  LUT5 #(
    .INIT(32'h8CCC8000)) 
    \Slve_CntValIn_Out[2]_i_2 
       (.I0(\Slve_CntValIn_Out0_inferred__1/i___0_carry_n_15 ),
        .I1(\Slve_CntValIn_Out_reg[1]_0 [5]),
        .I2(\Slve_CntValIn_Out_reg[1]_0 [0]),
        .I3(\Slve_CntValIn_Out_reg[1]_0 [1]),
        .I4(Q[0]),
        .O(\Slve_CntValIn_Out[2]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair119" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \Slve_CntValIn_Out[2]_i_3 
       (.I0(\Slve_CntValIn_Out_reg[1]_0 [0]),
        .I1(\Slve_CntValIn_Out_reg[1]_0 [5]),
        .O(\Slve_CntValIn_Out[2]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \Slve_CntValIn_Out[3]_i_1 
       (.I0(p_1_in[3]),
        .I1(SR),
        .I2(\Slve_CntValIn_Out[3]_i_2_n_0 ),
        .O(\Slve_CntValIn_Out[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h80BFFFFF80BF0000)) 
    \Slve_CntValIn_Out[3]_i_2 
       (.I0(\Slve_CntValIn_Out0_inferred__1/i___0_carry_n_14 ),
        .I1(\Slve_CntValIn_Out_reg[1]_0 [1]),
        .I2(\Slve_CntValIn_Out_reg[1]_0 [0]),
        .I3(Q[1]),
        .I4(\Slve_CntValIn_Out_reg[1]_0 [5]),
        .I5(\Slve_CntValIn_Out[3]_i_3_n_0 ),
        .O(\Slve_CntValIn_Out[3]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \Slve_CntValIn_Out[3]_i_3 
       (.I0(p_1_in[3]),
        .I1(\Slve_CntValIn_Out_reg[1]_0 [4]),
        .I2(\active_reg[4]_0 ),
        .I3(\Slve_CntValIn_Out_reg[1]_0 [0]),
        .I4(p_1_in[2]),
        .O(\Slve_CntValIn_Out[3]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \Slve_CntValIn_Out[4]_i_1 
       (.I0(p_1_in[4]),
        .I1(SR),
        .I2(\Slve_CntValIn_Out[4]_i_2_n_0 ),
        .I3(\Slve_CntValIn_Out_reg[1]_0 [5]),
        .I4(\Slve_CntValIn_Out[4]_i_3_n_0 ),
        .O(\Slve_CntValIn_Out[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair117" *) 
  LUT5 #(
    .INIT(32'h8CB3B38C)) 
    \Slve_CntValIn_Out[4]_i_2 
       (.I0(\Slve_CntValIn_Out0_inferred__1/i___0_carry_n_13 ),
        .I1(\Slve_CntValIn_Out_reg[1]_0 [0]),
        .I2(\Slve_CntValIn_Out_reg[1]_0 [1]),
        .I3(Q[2]),
        .I4(Q[1]),
        .O(\Slve_CntValIn_Out[4]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \Slve_CntValIn_Out[4]_i_3 
       (.I0(p_1_in[3]),
        .I1(p_1_in[4]),
        .I2(\Slve_CntValIn_Out_reg[1]_0 [4]),
        .I3(\active_reg[4]_0 ),
        .I4(\Slve_CntValIn_Out_reg[1]_0 [0]),
        .O(\Slve_CntValIn_Out[4]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \Slve_CntValIn_Out[5]_i_1 
       (.I0(p_1_in[5]),
        .I1(SR),
        .I2(\Slve_CntValIn_Out[5]_i_2_n_0 ),
        .I3(\Slve_CntValIn_Out_reg[1]_0 [5]),
        .I4(\Slve_CntValIn_Out[5]_i_3_n_0 ),
        .O(\Slve_CntValIn_Out[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8CBFBFB3B380808C)) 
    \Slve_CntValIn_Out[5]_i_2 
       (.I0(\Slve_CntValIn_Out0_inferred__1/i___0_carry_n_12 ),
        .I1(\Slve_CntValIn_Out_reg[1]_0 [0]),
        .I2(\Slve_CntValIn_Out_reg[1]_0 [1]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[3]),
        .O(\Slve_CntValIn_Out[5]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \Slve_CntValIn_Out[5]_i_3 
       (.I0(p_1_in[5]),
        .I1(\Slve_CntValIn_Out_reg[1]_0 [4]),
        .I2(\active_reg[4]_0 ),
        .I3(\Slve_CntValIn_Out_reg[1]_0 [0]),
        .I4(p_1_in[4]),
        .O(\Slve_CntValIn_Out[5]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \Slve_CntValIn_Out[6]_i_1 
       (.I0(p_1_in[6]),
        .I1(SR),
        .I2(\Slve_CntValIn_Out[6]_i_2_n_0 ),
        .I3(\Slve_CntValIn_Out_reg[1]_0 [5]),
        .I4(\Slve_CntValIn_Out[6]_i_3_n_0 ),
        .O(\Slve_CntValIn_Out[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFC0A0C050CF5F)) 
    \Slve_CntValIn_Out[6]_i_2 
       (.I0(\Slve_CntValIn_Out[6]_i_4_n_0 ),
        .I1(\Slve_CntValIn_Out0_inferred__1/i___0_carry_n_11 ),
        .I2(\Slve_CntValIn_Out_reg[1]_0 [0]),
        .I3(\Slve_CntValIn_Out_reg[1]_0 [1]),
        .I4(\Slve_CntValIn_Out[6]_i_5_n_0 ),
        .I5(Q[4]),
        .O(\Slve_CntValIn_Out[6]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \Slve_CntValIn_Out[6]_i_3 
       (.I0(p_1_in[5]),
        .I1(p_1_in[6]),
        .I2(\Slve_CntValIn_Out_reg[1]_0 [4]),
        .I3(\active_reg[4]_0 ),
        .I4(\Slve_CntValIn_Out_reg[1]_0 [0]),
        .O(\Slve_CntValIn_Out[6]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair165" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \Slve_CntValIn_Out[6]_i_4 
       (.I0(Q[3]),
        .I1(Q[2]),
        .I2(Q[1]),
        .O(\Slve_CntValIn_Out[6]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair165" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    \Slve_CntValIn_Out[6]_i_5 
       (.I0(Q[2]),
        .I1(Q[1]),
        .I2(Q[3]),
        .O(\Slve_CntValIn_Out[6]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \Slve_CntValIn_Out[7]_i_1 
       (.I0(p_1_in[7]),
        .I1(SR),
        .I2(\Slve_CntValIn_Out[7]_i_2_n_0 ),
        .I3(\Slve_CntValIn_Out_reg[1]_0 [5]),
        .I4(\Slve_CntValIn_Out[7]_i_3_n_0 ),
        .O(\Slve_CntValIn_Out[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8B00B8FF8BFFB800)) 
    \Slve_CntValIn_Out[7]_i_2 
       (.I0(\Slve_CntValIn_Out0_inferred__1/i___0_carry_n_10 ),
        .I1(\Slve_CntValIn_Out_reg[1]_0 [1]),
        .I2(\Slve_CntValIn_Out[7]_i_4_n_0 ),
        .I3(\Slve_CntValIn_Out_reg[1]_0 [0]),
        .I4(Q[5]),
        .I5(\Slve_CntValIn_Out[7]_i_5_n_0 ),
        .O(\Slve_CntValIn_Out[7]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \Slve_CntValIn_Out[7]_i_3 
       (.I0(p_1_in[6]),
        .I1(p_1_in[7]),
        .I2(\Slve_CntValIn_Out_reg[1]_0 [4]),
        .I3(\active_reg[4]_0 ),
        .I4(\Slve_CntValIn_Out_reg[1]_0 [0]),
        .O(\Slve_CntValIn_Out[7]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair153" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \Slve_CntValIn_Out[7]_i_4 
       (.I0(Q[4]),
        .I1(Q[1]),
        .I2(Q[2]),
        .I3(Q[3]),
        .O(\Slve_CntValIn_Out[7]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair153" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \Slve_CntValIn_Out[7]_i_5 
       (.I0(Q[4]),
        .I1(Q[3]),
        .I2(Q[1]),
        .I3(Q[2]),
        .O(\Slve_CntValIn_Out[7]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAABABAABAABAABAA)) 
    \Slve_CntValIn_Out[8]_i_1 
       (.I0(SR),
        .I1(\Slve_CntValIn_Out[8]_i_3_n_0 ),
        .I2(\Slve_CntValIn_Out_reg[1]_0 [5]),
        .I3(\Slve_CntValIn_Out_reg[1]_0 [1]),
        .I4(\active_reg[4]_0 ),
        .I5(\Slve_CntValIn_Out_reg[1]_0 [0]),
        .O(\Slve_CntValIn_Out[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h000000000000AEEA)) 
    \Slve_CntValIn_Out[8]_i_2 
       (.I0(\Slve_CntValIn_Out[8]_i_4_n_0 ),
        .I1(\Slve_CntValIn_Out_reg[8]_0 ),
        .I2(\Slve_CntValIn_Out[8]_i_6_n_0 ),
        .I3(Q[6]),
        .I4(\Slve_CntValIn_Out_reg[1]_0 [4]),
        .I5(SR),
        .O(\Slve_CntValIn_Out[8]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair129" *) 
  LUT5 #(
    .INIT(32'hFEFEFEEE)) 
    \Slve_CntValIn_Out[8]_i_3 
       (.I0(\Slve_CntValIn_Out_reg[1]_0 [2]),
        .I1(\Slve_CntValIn_Out_reg[1]_0 [3]),
        .I2(\Slve_CntValIn_Out_reg[1]_0 [4]),
        .I3(\Slve_CntValIn_Out_reg[1]_0 [5]),
        .I4(\Slve_CntValIn_Out_reg[1]_0 [1]),
        .O(\Slve_CntValIn_Out[8]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair118" *) 
  LUT5 #(
    .INIT(32'hCF0AC00A)) 
    \Slve_CntValIn_Out[8]_i_4 
       (.I0(\active_reg[4]_0 ),
        .I1(\Slve_CntValIn_Out0_inferred__1/i___0_carry_n_9 ),
        .I2(\Slve_CntValIn_Out_reg[1]_0 [5]),
        .I3(\Slve_CntValIn_Out_reg[1]_0 [1]),
        .I4(p_1_in[7]),
        .O(\Slve_CntValIn_Out[8]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair118" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \Slve_CntValIn_Out[8]_i_5 
       (.I0(\Slve_CntValIn_Out_reg[1]_0 [5]),
        .I1(\Slve_CntValIn_Out_reg[1]_0 [1]),
        .O(\Slve_CntValIn_Out_reg[8]_0 ));
  LUT6 #(
    .INIT(64'h4000000000000002)) 
    \Slve_CntValIn_Out[8]_i_6 
       (.I0(\Slve_CntValIn_Out_reg[1]_0 [0]),
        .I1(Q[5]),
        .I2(Q[2]),
        .I3(Q[1]),
        .I4(Q[3]),
        .I5(Q[4]),
        .O(\Slve_CntValIn_Out[8]_i_6_n_0 ));
  FDRE \Slve_CntValIn_Out_reg[0] 
       (.C(Rx_SysClk),
        .CE(\Slve_CntValIn_Out[8]_i_1_n_0 ),
        .D(\Slve_CntValIn_Out[0]_i_1_n_0 ),
        .Q(\Mstr_CntValIn_Out_reg[0]_0 ),
        .R(SR));
  FDRE \Slve_CntValIn_Out_reg[1] 
       (.C(Rx_SysClk),
        .CE(\Slve_CntValIn_Out[8]_i_1_n_0 ),
        .D(\Slve_CntValIn_Out[1]_i_1_n_0 ),
        .Q(\Mstr_CntValIn_Out_reg[1]_0 ),
        .R(SR));
  FDRE \Slve_CntValIn_Out_reg[2] 
       (.C(Rx_SysClk),
        .CE(\Slve_CntValIn_Out[8]_i_1_n_0 ),
        .D(\Slve_CntValIn_Out[2]_i_1_n_0 ),
        .Q(Q[0]),
        .R(1'b0));
  FDRE \Slve_CntValIn_Out_reg[3] 
       (.C(Rx_SysClk),
        .CE(\Slve_CntValIn_Out[8]_i_1_n_0 ),
        .D(\Slve_CntValIn_Out[3]_i_1_n_0 ),
        .Q(Q[1]),
        .R(1'b0));
  FDRE \Slve_CntValIn_Out_reg[4] 
       (.C(Rx_SysClk),
        .CE(\Slve_CntValIn_Out[8]_i_1_n_0 ),
        .D(\Slve_CntValIn_Out[4]_i_1_n_0 ),
        .Q(Q[2]),
        .R(1'b0));
  FDRE \Slve_CntValIn_Out_reg[5] 
       (.C(Rx_SysClk),
        .CE(\Slve_CntValIn_Out[8]_i_1_n_0 ),
        .D(\Slve_CntValIn_Out[5]_i_1_n_0 ),
        .Q(Q[3]),
        .R(1'b0));
  FDRE \Slve_CntValIn_Out_reg[6] 
       (.C(Rx_SysClk),
        .CE(\Slve_CntValIn_Out[8]_i_1_n_0 ),
        .D(\Slve_CntValIn_Out[6]_i_1_n_0 ),
        .Q(Q[4]),
        .R(1'b0));
  FDRE \Slve_CntValIn_Out_reg[7] 
       (.C(Rx_SysClk),
        .CE(\Slve_CntValIn_Out[8]_i_1_n_0 ),
        .D(\Slve_CntValIn_Out[7]_i_1_n_0 ),
        .Q(Q[5]),
        .R(1'b0));
  FDRE \Slve_CntValIn_Out_reg[8] 
       (.C(Rx_SysClk),
        .CE(\Slve_CntValIn_Out[8]_i_1_n_0 ),
        .D(\Slve_CntValIn_Out[8]_i_2_n_0 ),
        .Q(Q[6]),
        .R(1'b0));
  FDRE \Slve_Load_dly_reg[0] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(D),
        .Q(Slve_Load_dly[0]),
        .R(1'b0));
  FDRE \Slve_Load_dly_reg[1] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(Slve_Load_dly[0]),
        .Q(Slve_Load_dly[1]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0100000101110110)) 
    Slve_Load_i_2
       (.I0(\Slve_CntValIn_Out_reg[1]_0 [3]),
        .I1(\Slve_CntValIn_Out_reg[1]_0 [2]),
        .I2(\Slve_CntValIn_Out_reg[1]_0 [4]),
        .I3(\Slve_CntValIn_Out_reg[1]_0 [5]),
        .I4(\Slve_CntValIn_Out_reg[1]_0 [0]),
        .I5(\Slve_CntValIn_Out_reg[1]_0 [1]),
        .O(Mstr_Load_reg_0));
  (* SOFT_HLUTNM = "soft_lutpair158" *) 
  LUT4 #(
    .INIT(16'hBB8B)) 
    Slve_Load_i_3
       (.I0(\Slve_CntValIn_Out_reg[1]_0 [2]),
        .I1(\Slve_CntValIn_Out_reg[1]_0 [1]),
        .I2(\Slve_CntValIn_Out_reg[1]_0 [0]),
        .I3(\Slve_CntValIn_Out_reg[1]_0 [5]),
        .O(Mstr_Load_reg_2));
  LUT6 #(
    .INIT(64'hFEFFBFFEFEFEFCFD)) 
    Slve_Load_i_4
       (.I0(\Slve_CntValIn_Out_reg[1]_0 [4]),
        .I1(\Slve_CntValIn_Out_reg[1]_0 [3]),
        .I2(\Slve_CntValIn_Out_reg[1]_0 [2]),
        .I3(\Slve_CntValIn_Out_reg[1]_0 [0]),
        .I4(\Slve_CntValIn_Out_reg[1]_0 [5]),
        .I5(\Slve_CntValIn_Out_reg[1]_0 [1]),
        .O(Mstr_Load_reg_1));
  FDSE Slve_Load_reg
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(ActiveIsSlve_reg_0),
        .Q(D),
        .S(SR));
  FDRE WrapToZero_reg
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(\s_state_reg[4]_0 ),
        .Q(WrapToZero),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair171" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \act_count[0]_i_1 
       (.I0(act_count_reg__0[0]),
        .O(\act_count[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair171" *) 
  LUT3 #(
    .INIT(8'h96)) 
    \act_count[1]_i_1 
       (.I0(act_count_reg__0[0]),
        .I1(\act_count_reg[1]_0 ),
        .I2(act_count_reg__0[1]),
        .O(\act_count[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair139" *) 
  LUT4 #(
    .INIT(16'hD2B4)) 
    \act_count[2]_i_1 
       (.I0(act_count_reg__0[0]),
        .I1(\act_count_reg[1]_0 ),
        .I2(act_count_reg__0[2]),
        .I3(act_count_reg__0[1]),
        .O(\act_count[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair125" *) 
  LUT5 #(
    .INIT(32'hAAA96AAA)) 
    \act_count[3]_i_1 
       (.I0(act_count_reg__0[3]),
        .I1(act_count_reg__0[2]),
        .I2(act_count_reg__0[1]),
        .I3(act_count_reg__0[0]),
        .I4(\act_count_reg[1]_0 ),
        .O(\act_count[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBFFF4000FFFD0002)) 
    \act_count[4]_i_1 
       (.I0(\act_count_reg[1]_0 ),
        .I1(act_count_reg__0[0]),
        .I2(act_count_reg__0[2]),
        .I3(act_count_reg__0[1]),
        .I4(act_count_reg__0[4]),
        .I5(act_count_reg__0[3]),
        .O(\act_count[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h3000000000000005)) 
    \act_count[4]_i_2 
       (.I0(\act_count[4]_i_3_n_0 ),
        .I1(\act_count[4]_i_4_n_0 ),
        .I2(\active_reg_n_0_[7] ),
        .I3(\active_reg_n_0_[6] ),
        .I4(\active_reg_n_0_[2] ),
        .I5(\active_reg_n_0_[1] ),
        .O(\act_count_reg[1]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair145" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \act_count[4]_i_3 
       (.I0(\active_reg_n_0_[0] ),
        .I1(\active_reg_n_0_[3] ),
        .I2(\active_reg_n_0_[5] ),
        .I3(\active_reg_n_0_[4] ),
        .O(\act_count[4]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair145" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    \act_count[4]_i_4 
       (.I0(\active_reg_n_0_[5] ),
        .I1(\active_reg_n_0_[4] ),
        .I2(\active_reg_n_0_[0] ),
        .I3(\active_reg_n_0_[3] ),
        .O(\act_count[4]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hCFFFFFFA)) 
    \act_count[5]_i_1 
       (.I0(\act_count[5]_i_3_n_0 ),
        .I1(\act_count[5]_i_4_n_0 ),
        .I2(act_count_reg__0[4]),
        .I3(act_count_reg__0[3]),
        .I4(\act_count_reg[0]_0 ),
        .O(\act_count[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hBFBC4043)) 
    \act_count[5]_i_2 
       (.I0(\act_count[5]_i_4_n_0 ),
        .I1(act_count_reg__0[4]),
        .I2(act_count_reg__0[3]),
        .I3(\act_count[5]_i_3_n_0 ),
        .I4(\act_count_reg[0]_0 ),
        .O(\act_count[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair139" *) 
  LUT4 #(
    .INIT(16'hFEFF)) 
    \act_count[5]_i_3 
       (.I0(act_count_reg__0[1]),
        .I1(act_count_reg__0[2]),
        .I2(act_count_reg__0[0]),
        .I3(\act_count_reg[1]_0 ),
        .O(\act_count[5]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair125" *) 
  LUT4 #(
    .INIT(16'hBFFF)) 
    \act_count[5]_i_4 
       (.I0(\act_count_reg[1]_0 ),
        .I1(act_count_reg__0[0]),
        .I2(act_count_reg__0[1]),
        .I3(act_count_reg__0[2]),
        .O(\act_count[5]_i_4_n_0 ));
  FDRE \act_count_reg[0] 
       (.C(Rx_SysClk),
        .CE(\act_count[5]_i_1_n_0 ),
        .D(\act_count[0]_i_1_n_0 ),
        .Q(act_count_reg__0[0]),
        .R(\IntReset_dly_reg_n_0_[1] ));
  FDRE \act_count_reg[1] 
       (.C(Rx_SysClk),
        .CE(\act_count[5]_i_1_n_0 ),
        .D(\act_count[1]_i_1_n_0 ),
        .Q(act_count_reg__0[1]),
        .R(\IntReset_dly_reg_n_0_[1] ));
  FDRE \act_count_reg[2] 
       (.C(Rx_SysClk),
        .CE(\act_count[5]_i_1_n_0 ),
        .D(\act_count[2]_i_1_n_0 ),
        .Q(act_count_reg__0[2]),
        .R(\IntReset_dly_reg_n_0_[1] ));
  FDRE \act_count_reg[3] 
       (.C(Rx_SysClk),
        .CE(\act_count[5]_i_1_n_0 ),
        .D(\act_count[3]_i_1_n_0 ),
        .Q(act_count_reg__0[3]),
        .R(\IntReset_dly_reg_n_0_[1] ));
  FDRE \act_count_reg[4] 
       (.C(Rx_SysClk),
        .CE(\act_count[5]_i_1_n_0 ),
        .D(\act_count[4]_i_1_n_0 ),
        .Q(act_count_reg__0[4]),
        .R(\IntReset_dly_reg_n_0_[1] ));
  FDRE \act_count_reg[5] 
       (.C(Rx_SysClk),
        .CE(\act_count[5]_i_1_n_0 ),
        .D(\act_count[5]_i_2_n_0 ),
        .Q(\act_count_reg[0]_0 ),
        .R(\IntReset_dly_reg_n_0_[1] ));
  LUT3 #(
    .INIT(8'h74)) 
    \active[4]_i_1 
       (.I0(BaseX_Rx_Q_Out[4]),
        .I1(\active_reg[4]_0 ),
        .I2(BaseX_Rx_Q_Out[0]),
        .O(p_2_out[4]));
  LUT3 #(
    .INIT(8'h74)) 
    \active[5]_i_1 
       (.I0(BaseX_Rx_Q_Out[5]),
        .I1(\active_reg[4]_0 ),
        .I2(BaseX_Rx_Q_Out[1]),
        .O(p_2_out[5]));
  LUT3 #(
    .INIT(8'h74)) 
    \active[6]_i_1 
       (.I0(BaseX_Rx_Q_Out[6]),
        .I1(\active_reg[4]_0 ),
        .I2(BaseX_Rx_Q_Out[2]),
        .O(p_2_out[6]));
  LUT3 #(
    .INIT(8'h74)) 
    \active[7]_i_1 
       (.I0(BaseX_Rx_Q_Out[7]),
        .I1(\active_reg[4]_0 ),
        .I2(BaseX_Rx_Q_Out[3]),
        .O(p_2_out[7]));
  FDRE \active_reg[0] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(\active_reg_n_0_[4] ),
        .Q(\active_reg_n_0_[0] ),
        .R(\IntReset_dly_reg_n_0_[1] ));
  FDRE \active_reg[1] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(\active_reg_n_0_[5] ),
        .Q(\active_reg_n_0_[1] ),
        .R(\IntReset_dly_reg_n_0_[1] ));
  FDRE \active_reg[2] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(\active_reg_n_0_[6] ),
        .Q(\active_reg_n_0_[2] ),
        .R(\IntReset_dly_reg_n_0_[1] ));
  FDRE \active_reg[3] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(\active_reg_n_0_[7] ),
        .Q(\active_reg_n_0_[3] ),
        .R(\IntReset_dly_reg_n_0_[1] ));
  FDRE \active_reg[4] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(p_2_out[4]),
        .Q(\active_reg_n_0_[4] ),
        .R(\IntReset_dly_reg_n_0_[1] ));
  FDRE \active_reg[5] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(p_2_out[5]),
        .Q(\active_reg_n_0_[5] ),
        .R(\IntReset_dly_reg_n_0_[1] ));
  FDRE \active_reg[6] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(p_2_out[6]),
        .Q(\active_reg_n_0_[6] ),
        .R(\IntReset_dly_reg_n_0_[1] ));
  FDRE \active_reg[7] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(p_2_out[7]),
        .Q(\active_reg_n_0_[7] ),
        .R(\IntReset_dly_reg_n_0_[1] ));
  LUT4 #(
    .INIT(16'h6660)) 
    decoded_rxchariscomma_i_1
       (.I0(al_rx_data_out[9]),
        .I1(al_rx_data_out[8]),
        .I2(decoded_rxchariscomma_i_2_n_0),
        .I3(decoded_rxchariscomma_i_3_n_0),
        .O(decoded_rxchariscomma0));
  LUT6 #(
    .INIT(64'h0000010000000000)) 
    decoded_rxchariscomma_i_2
       (.I0(\decode_8b10b/p_8_out__0 ),
        .I1(al_rx_data_out[6]),
        .I2(al_rx_data_out[2]),
        .I3(decoded_rxchariscomma_i_5_n_0),
        .I4(al_rx_data_out[3]),
        .I5(al_rx_data_out[7]),
        .O(decoded_rxchariscomma_i_2_n_0));
  LUT6 #(
    .INIT(64'h0004000000000000)) 
    decoded_rxchariscomma_i_3
       (.I0(al_rx_data_out[0]),
        .I1(al_rx_data_out[6]),
        .I2(al_rx_data_out[1]),
        .I3(al_rx_data_out[7]),
        .I4(decoded_rxchariscomma_i_6_n_0),
        .I5(decoded_rxchariscomma_i_7_n_0),
        .O(decoded_rxchariscomma_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair120" *) 
  LUT2 #(
    .INIT(4'hE)) 
    decoded_rxchariscomma_i_4
       (.I0(al_rx_data_out[5]),
        .I1(al_rx_data_out[4]),
        .O(\decode_8b10b/p_8_out__0 ));
  LUT2 #(
    .INIT(4'h8)) 
    decoded_rxchariscomma_i_5
       (.I0(al_rx_data_out[1]),
        .I1(al_rx_data_out[0]),
        .O(decoded_rxchariscomma_i_5_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    decoded_rxchariscomma_i_6
       (.I0(al_rx_data_out[5]),
        .I1(al_rx_data_out[4]),
        .O(decoded_rxchariscomma_i_6_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    decoded_rxchariscomma_i_7
       (.I0(al_rx_data_out[2]),
        .I1(al_rx_data_out[3]),
        .O(decoded_rxchariscomma_i_7_n_0));
  (* SOFT_HLUTNM = "soft_lutpair169" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \delay_change[0]_i_1 
       (.I0(data0[0]),
        .I1(\Slve_CntValIn_Out_reg[1]_0 [5]),
        .I2(\Slve_CntValIn_Out_reg[1]_0 [4]),
        .O(delay_change[0]));
  (* SOFT_HLUTNM = "soft_lutpair167" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \delay_change[1]_i_1 
       (.I0(data0[1]),
        .I1(\Slve_CntValIn_Out_reg[1]_0 [5]),
        .I2(\Slve_CntValIn_Out_reg[1]_0 [4]),
        .O(delay_change[1]));
  (* SOFT_HLUTNM = "soft_lutpair168" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \delay_change[2]_i_1 
       (.I0(data0[2]),
        .I1(\Slve_CntValIn_Out_reg[1]_0 [5]),
        .I2(\Slve_CntValIn_Out_reg[1]_0 [4]),
        .O(delay_change[2]));
  (* SOFT_HLUTNM = "soft_lutpair169" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \delay_change[3]_i_1 
       (.I0(data0[3]),
        .I1(\Slve_CntValIn_Out_reg[1]_0 [5]),
        .I2(\Slve_CntValIn_Out_reg[1]_0 [4]),
        .O(delay_change[3]));
  (* SOFT_HLUTNM = "soft_lutpair168" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \delay_change[4]_i_1 
       (.I0(data0[4]),
        .I1(\Slve_CntValIn_Out_reg[1]_0 [5]),
        .I2(\Slve_CntValIn_Out_reg[1]_0 [4]),
        .O(delay_change[4]));
  (* SOFT_HLUTNM = "soft_lutpair167" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \delay_change[5]_i_1 
       (.I0(data0[5]),
        .I1(\Slve_CntValIn_Out_reg[1]_0 [5]),
        .I2(\Slve_CntValIn_Out_reg[1]_0 [4]),
        .O(delay_change[5]));
  (* SOFT_HLUTNM = "soft_lutpair137" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \delay_change[6]_i_1 
       (.I0(data0[6]),
        .I1(\Slve_CntValIn_Out_reg[1]_0 [5]),
        .I2(\Slve_CntValIn_Out_reg[1]_0 [4]),
        .O(delay_change[6]));
  LUT6 #(
    .INIT(64'h0000000000000281)) 
    \delay_change[7]_i_1 
       (.I0(\Slve_CntValIn_Out_reg[1]_0 [0]),
        .I1(\Slve_CntValIn_Out_reg[1]_0 [1]),
        .I2(\Slve_CntValIn_Out_reg[1]_0 [5]),
        .I3(\Slve_CntValIn_Out_reg[1]_0 [4]),
        .I4(\Slve_CntValIn_Out_reg[1]_0 [3]),
        .I5(\Slve_CntValIn_Out_reg[1]_0 [2]),
        .O(\delay_change[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair135" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \delay_change[7]_i_2 
       (.I0(\Slve_CntValIn_Out_reg[1]_0 [4]),
        .I1(\Slve_CntValIn_Out_reg[1]_0 [5]),
        .O(delay_change[7]));
  FDRE \delay_change_reg[0] 
       (.C(Rx_SysClk),
        .CE(\delay_change[7]_i_1_n_0 ),
        .D(delay_change[0]),
        .Q(\delay_change_reg_n_0_[0] ),
        .R(SR));
  FDRE \delay_change_reg[1] 
       (.C(Rx_SysClk),
        .CE(\delay_change[7]_i_1_n_0 ),
        .D(delay_change[1]),
        .Q(data0[0]),
        .R(SR));
  FDRE \delay_change_reg[2] 
       (.C(Rx_SysClk),
        .CE(\delay_change[7]_i_1_n_0 ),
        .D(delay_change[2]),
        .Q(data0[1]),
        .R(SR));
  FDRE \delay_change_reg[3] 
       (.C(Rx_SysClk),
        .CE(\delay_change[7]_i_1_n_0 ),
        .D(delay_change[3]),
        .Q(data0[2]),
        .R(SR));
  FDRE \delay_change_reg[4] 
       (.C(Rx_SysClk),
        .CE(\delay_change[7]_i_1_n_0 ),
        .D(delay_change[4]),
        .Q(data0[3]),
        .R(SR));
  FDRE \delay_change_reg[5] 
       (.C(Rx_SysClk),
        .CE(\delay_change[7]_i_1_n_0 ),
        .D(delay_change[5]),
        .Q(data0[4]),
        .R(SR));
  FDRE \delay_change_reg[6] 
       (.C(Rx_SysClk),
        .CE(\delay_change[7]_i_1_n_0 ),
        .D(delay_change[6]),
        .Q(data0[5]),
        .R(SR));
  FDRE \delay_change_reg[7] 
       (.C(Rx_SysClk),
        .CE(\delay_change[7]_i_1_n_0 ),
        .D(delay_change[7]),
        .Q(data0[6]),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair136" *) 
  LUT5 #(
    .INIT(32'h89BFFD91)) 
    \dout_i[5]_i_1 
       (.I0(al_rx_data_out[7]),
        .I1(al_rx_data_out[8]),
        .I2(\decode_8b10b/k28__1 ),
        .I3(al_rx_data_out[9]),
        .I4(al_rx_data_out[6]),
        .O(b3[5]));
  (* SOFT_HLUTNM = "soft_lutpair131" *) 
  LUT5 #(
    .INIT(32'h98FBDF19)) 
    \dout_i[6]_i_1 
       (.I0(al_rx_data_out[7]),
        .I1(al_rx_data_out[8]),
        .I2(\decode_8b10b/k28__1 ),
        .I3(al_rx_data_out[9]),
        .I4(al_rx_data_out[6]),
        .O(b3[6]));
  (* SOFT_HLUTNM = "soft_lutpair131" *) 
  LUT5 #(
    .INIT(32'hFE518A7F)) 
    \dout_i[7]_i_1 
       (.I0(al_rx_data_out[8]),
        .I1(al_rx_data_out[6]),
        .I2(\decode_8b10b/k28__1 ),
        .I3(al_rx_data_out[7]),
        .I4(al_rx_data_out[9]),
        .O(b3[7]));
  LUT6 #(
    .INIT(64'h0000000000000006)) 
    \dout_i[7]_i_2 
       (.I0(al_rx_data_out[8]),
        .I1(al_rx_data_out[9]),
        .I2(al_rx_data_out[2]),
        .I3(al_rx_data_out[3]),
        .I4(al_rx_data_out[5]),
        .I5(al_rx_data_out[4]),
        .O(\decode_8b10b/k28__1 ));
  LUT6 #(
    .INIT(64'hEDA3C33DAAABADB7)) 
    g0_b0
       (.I0(al_rx_data_out[0]),
        .I1(al_rx_data_out[1]),
        .I2(al_rx_data_out[2]),
        .I3(al_rx_data_out[3]),
        .I4(al_rx_data_out[4]),
        .I5(al_rx_data_out[5]),
        .O(out[0]));
  LUT6 #(
    .INIT(64'hEDA5A55BCCCDCDB7)) 
    g0_b1
       (.I0(al_rx_data_out[0]),
        .I1(al_rx_data_out[1]),
        .I2(al_rx_data_out[2]),
        .I3(al_rx_data_out[3]),
        .I4(al_rx_data_out[4]),
        .I5(al_rx_data_out[5]),
        .O(out[1]));
  LUT6 #(
    .INIT(64'hFDB19967F0F1E5BF)) 
    g0_b2
       (.I0(al_rx_data_out[0]),
        .I1(al_rx_data_out[1]),
        .I2(al_rx_data_out[2]),
        .I3(al_rx_data_out[3]),
        .I4(al_rx_data_out[4]),
        .I5(al_rx_data_out[5]),
        .O(out[2]));
  LUT6 #(
    .INIT(64'hFCA99697FF01FD3F)) 
    g0_b3
       (.I0(al_rx_data_out[0]),
        .I1(al_rx_data_out[1]),
        .I2(al_rx_data_out[2]),
        .I3(al_rx_data_out[3]),
        .I4(al_rx_data_out[4]),
        .I5(al_rx_data_out[5]),
        .O(out[3]));
  LUT6 #(
    .INIT(64'hF8FF8117FEE9971F)) 
    g0_b4
       (.I0(al_rx_data_out[0]),
        .I1(al_rx_data_out[1]),
        .I2(al_rx_data_out[2]),
        .I3(al_rx_data_out[3]),
        .I4(al_rx_data_out[4]),
        .I5(al_rx_data_out[5]),
        .O(out[4]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFEFFFEFE)) 
    \gcerr.CODE_ERR_i_1 
       (.I0(\gcerr.CODE_ERR_i_2_n_0 ),
        .I1(\gcerr.CODE_ERR_i_3_n_0 ),
        .I2(\gcerr.CODE_ERR_i_4_n_0 ),
        .I3(ndbr6),
        .I4(\gcerr.CODE_ERR_i_6_n_0 ),
        .I5(invby_e),
        .O(code_err_i));
  LUT6 #(
    .INIT(64'hFEE8E888E8808000)) 
    \gcerr.CODE_ERR_i_10 
       (.I0(al_rx_data_out[5]),
        .I1(al_rx_data_out[4]),
        .I2(al_rx_data_out[1]),
        .I3(al_rx_data_out[0]),
        .I4(al_rx_data_out[2]),
        .I5(al_rx_data_out[3]),
        .O(pdur6));
  LUT6 #(
    .INIT(64'h000101171117177F)) 
    \gcerr.CODE_ERR_i_11 
       (.I0(al_rx_data_out[5]),
        .I1(al_rx_data_out[4]),
        .I2(al_rx_data_out[1]),
        .I3(al_rx_data_out[0]),
        .I4(al_rx_data_out[2]),
        .I5(al_rx_data_out[3]),
        .O(ndur6));
  LUT6 #(
    .INIT(64'hFEE8E880E8808000)) 
    \gcerr.CODE_ERR_i_12 
       (.I0(al_rx_data_out[3]),
        .I1(al_rx_data_out[2]),
        .I2(al_rx_data_out[0]),
        .I3(al_rx_data_out[1]),
        .I4(al_rx_data_out[4]),
        .I5(al_rx_data_out[5]),
        .O(pdbr6));
  LUT6 #(
    .INIT(64'hFFFFFFFF10000004)) 
    \gcerr.CODE_ERR_i_2 
       (.I0(\decode_8b10b/sK28__2 ),
        .I1(al_rx_data_out[5]),
        .I2(al_rx_data_out[7]),
        .I3(al_rx_data_out[9]),
        .I4(al_rx_data_out[8]),
        .I5(invr6),
        .O(\gcerr.CODE_ERR_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hF80000000000001F)) 
    \gcerr.CODE_ERR_i_3 
       (.I0(al_rx_data_out[5]),
        .I1(al_rx_data_out[4]),
        .I2(al_rx_data_out[9]),
        .I3(al_rx_data_out[7]),
        .I4(al_rx_data_out[6]),
        .I5(al_rx_data_out[8]),
        .O(\gcerr.CODE_ERR_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAB8383BFA8808080)) 
    \gcerr.CODE_ERR_i_4 
       (.I0(pdur6),
        .I1(al_rx_data_out[7]),
        .I2(al_rx_data_out[6]),
        .I3(al_rx_data_out[9]),
        .I4(al_rx_data_out[8]),
        .I5(ndur6),
        .O(\gcerr.CODE_ERR_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h000101170117177F)) 
    \gcerr.CODE_ERR_i_5 
       (.I0(al_rx_data_out[3]),
        .I1(al_rx_data_out[2]),
        .I2(al_rx_data_out[0]),
        .I3(al_rx_data_out[1]),
        .I4(al_rx_data_out[4]),
        .I5(al_rx_data_out[5]),
        .O(ndbr6));
  LUT6 #(
    .INIT(64'h0000000000018000)) 
    \gcerr.CODE_ERR_i_6 
       (.I0(al_rx_data_out[5]),
        .I1(al_rx_data_out[7]),
        .I2(al_rx_data_out[9]),
        .I3(al_rx_data_out[8]),
        .I4(al_rx_data_out[4]),
        .I5(pdbr6),
        .O(\gcerr.CODE_ERR_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair154" *) 
  LUT4 #(
    .INIT(16'h8002)) 
    \gcerr.CODE_ERR_i_7 
       (.I0(\decode_8b10b/sK28__2 ),
        .I1(al_rx_data_out[8]),
        .I2(al_rx_data_out[6]),
        .I3(al_rx_data_out[7]),
        .O(invby_e));
  (* SOFT_HLUTNM = "soft_lutpair122" *) 
  LUT4 #(
    .INIT(16'h8001)) 
    \gcerr.CODE_ERR_i_8 
       (.I0(al_rx_data_out[3]),
        .I1(al_rx_data_out[4]),
        .I2(al_rx_data_out[5]),
        .I3(al_rx_data_out[2]),
        .O(\decode_8b10b/sK28__2 ));
  LUT6 #(
    .INIT(64'hF88080018001011F)) 
    \gcerr.CODE_ERR_i_9 
       (.I0(al_rx_data_out[4]),
        .I1(al_rx_data_out[5]),
        .I2(al_rx_data_out[3]),
        .I3(al_rx_data_out[2]),
        .I4(al_rx_data_out[0]),
        .I5(al_rx_data_out[1]),
        .O(invr6));
  LUT6 #(
    .INIT(64'hCC03BBBBCC038888)) 
    \gde.gdeni.DISP_ERR_i_1 
       (.I0(\gde.gdeni.DISP_ERR_i_2_n_0 ),
        .I1(\grdni.run_disp_i_reg_0 ),
        .I2(\decode_8b10b/b4_disp__9 [1]),
        .I3(\gde.gdeni.DISP_ERR_i_3_n_0 ),
        .I4(\decode_8b10b/b6_disp__34 [1]),
        .I5(\gde.gdeni.DISP_ERR_i_4_n_0 ),
        .O(\gde.gdeni.DISP_ERR_reg ));
  LUT6 #(
    .INIT(64'hEEE6E6E7E6676777)) 
    \gde.gdeni.DISP_ERR_i_2 
       (.I0(\decode_8b10b/b6_disp__34 [2]),
        .I1(\decode_8b10b/b6_disp__34 [0]),
        .I2(al_rx_data_out[6]),
        .I3(al_rx_data_out[8]),
        .I4(al_rx_data_out[9]),
        .I5(al_rx_data_out[7]),
        .O(\gde.gdeni.DISP_ERR_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair154" *) 
  LUT4 #(
    .INIT(16'hE888)) 
    \gde.gdeni.DISP_ERR_i_3 
       (.I0(al_rx_data_out[6]),
        .I1(al_rx_data_out[7]),
        .I2(al_rx_data_out[8]),
        .I3(al_rx_data_out[9]),
        .O(\gde.gdeni.DISP_ERR_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFEEAEAAA555757FF)) 
    \gde.gdeni.DISP_ERR_i_4 
       (.I0(\decode_8b10b/b6_disp__34 [2]),
        .I1(al_rx_data_out[9]),
        .I2(al_rx_data_out[8]),
        .I3(al_rx_data_out[7]),
        .I4(al_rx_data_out[6]),
        .I5(\decode_8b10b/b6_disp__34 [0]),
        .O(\gde.gdeni.DISP_ERR_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0002000000004000)) 
    \gde.gdeni.DISP_ERR_i_5 
       (.I0(al_rx_data_out[5]),
        .I1(al_rx_data_out[0]),
        .I2(al_rx_data_out[1]),
        .I3(al_rx_data_out[2]),
        .I4(al_rx_data_out[3]),
        .I5(al_rx_data_out[4]),
        .O(\decode_8b10b/b6_disp__34 [2]));
  LUT2 #(
    .INIT(4'hE)) 
    gen_io_logic_i_2
       (.I0(Slve_Load_dly[1]),
        .I1(Slve_Load_dly[0]),
        .O(BaseX_Idly_Load[1]));
  LUT2 #(
    .INIT(4'hE)) 
    gen_io_logic_i_3
       (.I0(Mstr_Load_dly[1]),
        .I1(Mstr_Load_dly[0]),
        .O(BaseX_Idly_Load[0]));
  LUT5 #(
    .INIT(32'hFFFFB080)) 
    \grdni.run_disp_i_i_1 
       (.I0(\grdni.run_disp_i_reg_0 ),
        .I1(\decode_8b10b/b6_disp__34 [1]),
        .I2(\decode_8b10b/b4_disp__9 [1]),
        .I3(\decode_8b10b/b6_disp__34 [0]),
        .I4(\decode_8b10b/b4_disp__9 [0]),
        .O(\grdni.run_disp_i_reg ));
  LUT6 #(
    .INIT(64'h0016166816686800)) 
    \grdni.run_disp_i_i_2 
       (.I0(al_rx_data_out[0]),
        .I1(al_rx_data_out[1]),
        .I2(al_rx_data_out[2]),
        .I3(al_rx_data_out[5]),
        .I4(al_rx_data_out[4]),
        .I5(al_rx_data_out[3]),
        .O(\decode_8b10b/b6_disp__34 [1]));
  (* SOFT_HLUTNM = "soft_lutpair136" *) 
  LUT4 #(
    .INIT(16'h0660)) 
    \grdni.run_disp_i_i_3 
       (.I0(al_rx_data_out[7]),
        .I1(al_rx_data_out[6]),
        .I2(al_rx_data_out[9]),
        .I3(al_rx_data_out[8]),
        .O(\decode_8b10b/b4_disp__9 [1]));
  LUT6 #(
    .INIT(64'hFEE8E880E880C000)) 
    \grdni.run_disp_i_i_4 
       (.I0(al_rx_data_out[2]),
        .I1(al_rx_data_out[3]),
        .I2(al_rx_data_out[4]),
        .I3(al_rx_data_out[5]),
        .I4(al_rx_data_out[1]),
        .I5(al_rx_data_out[0]),
        .O(\decode_8b10b/b6_disp__34 [0]));
  LUT4 #(
    .INIT(16'hE8C0)) 
    \grdni.run_disp_i_i_5 
       (.I0(al_rx_data_out[7]),
        .I1(al_rx_data_out[9]),
        .I2(al_rx_data_out[8]),
        .I3(al_rx_data_out[6]),
        .O(\decode_8b10b/b4_disp__9 [0]));
  (* SOFT_HLUTNM = "soft_lutpair161" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \hdataout[0]_i_1 
       (.I0(\hdataout[0]_i_2_n_0 ),
        .I1(\toggle_reg_n_0_[2] ),
        .I2(\holdreg_reg_n_0_[1] ),
        .O(\hdataout[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFCCF0AA00CCF0AA)) 
    \hdataout[0]_i_2 
       (.I0(\holdreg_reg_n_0_[5] ),
        .I1(\holdreg_reg_n_0_[4] ),
        .I2(\holdreg_reg_n_0_[3] ),
        .I3(\toggle_reg_n_0_[1] ),
        .I4(\toggle_reg_n_0_[0] ),
        .I5(\holdreg_reg_n_0_[2] ),
        .O(\hdataout[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair160" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \hdataout[1]_i_1 
       (.I0(\hdataout[1]_i_2_n_0 ),
        .I1(\toggle_reg_n_0_[2] ),
        .I2(\holdreg_reg_n_0_[2] ),
        .O(\hdataout[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFCCF0AA00CCF0AA)) 
    \hdataout[1]_i_2 
       (.I0(\holdreg_reg_n_0_[6] ),
        .I1(\holdreg_reg_n_0_[5] ),
        .I2(\holdreg_reg_n_0_[4] ),
        .I3(\toggle_reg_n_0_[1] ),
        .I4(\toggle_reg_n_0_[0] ),
        .I5(\holdreg_reg_n_0_[3] ),
        .O(\hdataout[1]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair163" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \hdataout[2]_i_1 
       (.I0(\hdataout[2]_i_2_n_0 ),
        .I1(\toggle_reg_n_0_[2] ),
        .I2(\holdreg_reg_n_0_[3] ),
        .O(\hdataout[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF0FFCCAAF000CCAA)) 
    \hdataout[2]_i_2 
       (.I0(\holdreg_reg_n_0_[7] ),
        .I1(\holdreg_reg_n_0_[6] ),
        .I2(\holdreg_reg_n_0_[4] ),
        .I3(\toggle_reg_n_0_[0] ),
        .I4(\toggle_reg_n_0_[1] ),
        .I5(\holdreg_reg_n_0_[5] ),
        .O(\hdataout[2]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair164" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \hdataout[3]_i_1 
       (.I0(\hdataout[3]_i_2_n_0 ),
        .I1(\toggle_reg_n_0_[2] ),
        .I2(\holdreg_reg_n_0_[4] ),
        .O(\hdataout[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFCCF0AA00CCF0AA)) 
    \hdataout[3]_i_2 
       (.I0(\holdreg_reg_n_0_[8] ),
        .I1(\holdreg_reg_n_0_[7] ),
        .I2(\holdreg_reg_n_0_[6] ),
        .I3(\toggle_reg_n_0_[1] ),
        .I4(\toggle_reg_n_0_[0] ),
        .I5(\holdreg_reg_n_0_[5] ),
        .O(\hdataout[3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair164" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \hdataout[4]_i_1 
       (.I0(\hdataout[4]_i_2_n_0 ),
        .I1(\toggle_reg_n_0_[2] ),
        .I2(\holdreg_reg_n_0_[5] ),
        .O(\hdataout[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFCCF0AA00CCF0AA)) 
    \hdataout[4]_i_2 
       (.I0(\holdreg_reg_n_0_[9] ),
        .I1(\holdreg_reg_n_0_[8] ),
        .I2(\holdreg_reg_n_0_[7] ),
        .I3(\toggle_reg_n_0_[1] ),
        .I4(\toggle_reg_n_0_[0] ),
        .I5(\holdreg_reg_n_0_[6] ),
        .O(\hdataout[4]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair162" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \hdataout[5]_i_1 
       (.I0(\hdataout[5]_i_2_n_0 ),
        .I1(\toggle_reg_n_0_[2] ),
        .I2(\holdreg_reg_n_0_[6] ),
        .O(\hdataout[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFCCF0AA00CCF0AA)) 
    \hdataout[5]_i_2 
       (.I0(\holdreg_reg_n_0_[10] ),
        .I1(\holdreg_reg_n_0_[9] ),
        .I2(\holdreg_reg_n_0_[8] ),
        .I3(\toggle_reg_n_0_[1] ),
        .I4(\toggle_reg_n_0_[0] ),
        .I5(\holdreg_reg_n_0_[7] ),
        .O(\hdataout[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair163" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \hdataout[6]_i_1 
       (.I0(\hdataout[6]_i_2_n_0 ),
        .I1(\toggle_reg_n_0_[2] ),
        .I2(\holdreg_reg_n_0_[7] ),
        .O(\hdataout[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFCCF0AA00CCF0AA)) 
    \hdataout[6]_i_2 
       (.I0(\holdreg_reg_n_0_[11] ),
        .I1(\holdreg_reg_n_0_[10] ),
        .I2(\holdreg_reg_n_0_[9] ),
        .I3(\toggle_reg_n_0_[1] ),
        .I4(\toggle_reg_n_0_[0] ),
        .I5(\holdreg_reg_n_0_[8] ),
        .O(\hdataout[6]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair162" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \hdataout[7]_i_1 
       (.I0(\hdataout[7]_i_2_n_0 ),
        .I1(\toggle_reg_n_0_[2] ),
        .I2(\holdreg_reg_n_0_[8] ),
        .O(\hdataout[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFCCF0AA00CCF0AA)) 
    \hdataout[7]_i_2 
       (.I0(\holdreg_reg_n_0_[12] ),
        .I1(\holdreg_reg_n_0_[11] ),
        .I2(\holdreg_reg_n_0_[10] ),
        .I3(\toggle_reg_n_0_[1] ),
        .I4(\toggle_reg_n_0_[0] ),
        .I5(\holdreg_reg_n_0_[9] ),
        .O(\hdataout[7]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair161" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \hdataout[8]_i_1 
       (.I0(\hdataout[8]_i_2_n_0 ),
        .I1(\toggle_reg_n_0_[2] ),
        .I2(\holdreg_reg_n_0_[9] ),
        .O(\hdataout[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFCCF0AA00CCF0AA)) 
    \hdataout[8]_i_2 
       (.I0(\holdreg_reg_n_0_[13] ),
        .I1(\holdreg_reg_n_0_[12] ),
        .I2(\holdreg_reg_n_0_[11] ),
        .I3(\toggle_reg_n_0_[1] ),
        .I4(\toggle_reg_n_0_[0] ),
        .I5(\holdreg_reg_n_0_[10] ),
        .O(\hdataout[8]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h0155)) 
    \hdataout[9]_i_1 
       (.I0(\toggle_reg_n_0_[3] ),
        .I1(\toggle_reg_n_0_[1] ),
        .I2(\toggle_reg_n_0_[0] ),
        .I3(\toggle_reg_n_0_[2] ),
        .O(\hdataout[9]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair160" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \hdataout[9]_i_2 
       (.I0(\hdataout[9]_i_3_n_0 ),
        .I1(\toggle_reg_n_0_[2] ),
        .I2(\holdreg_reg_n_0_[10] ),
        .O(\hdataout[9]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFCCF0AA00CCF0AA)) 
    \hdataout[9]_i_3 
       (.I0(\holdreg_reg_n_0_[14] ),
        .I1(\holdreg_reg_n_0_[13] ),
        .I2(\holdreg_reg_n_0_[12] ),
        .I3(\toggle_reg_n_0_[1] ),
        .I4(\toggle_reg_n_0_[0] ),
        .I5(\holdreg_reg_n_0_[11] ),
        .O(\hdataout[9]_i_3_n_0 ));
  FDRE \hdataout_reg[0] 
       (.C(Rx_SysClk),
        .CE(\hdataout[9]_i_1_n_0 ),
        .D(\hdataout[0]_i_1_n_0 ),
        .Q(hdataout[0]),
        .R(SR));
  FDRE \hdataout_reg[1] 
       (.C(Rx_SysClk),
        .CE(\hdataout[9]_i_1_n_0 ),
        .D(\hdataout[1]_i_1_n_0 ),
        .Q(hdataout[1]),
        .R(SR));
  FDRE \hdataout_reg[2] 
       (.C(Rx_SysClk),
        .CE(\hdataout[9]_i_1_n_0 ),
        .D(\hdataout[2]_i_1_n_0 ),
        .Q(hdataout[2]),
        .R(SR));
  FDRE \hdataout_reg[3] 
       (.C(Rx_SysClk),
        .CE(\hdataout[9]_i_1_n_0 ),
        .D(\hdataout[3]_i_1_n_0 ),
        .Q(hdataout[3]),
        .R(SR));
  FDRE \hdataout_reg[4] 
       (.C(Rx_SysClk),
        .CE(\hdataout[9]_i_1_n_0 ),
        .D(\hdataout[4]_i_1_n_0 ),
        .Q(hdataout[4]),
        .R(SR));
  FDRE \hdataout_reg[5] 
       (.C(Rx_SysClk),
        .CE(\hdataout[9]_i_1_n_0 ),
        .D(\hdataout[5]_i_1_n_0 ),
        .Q(hdataout[5]),
        .R(SR));
  FDRE \hdataout_reg[6] 
       (.C(Rx_SysClk),
        .CE(\hdataout[9]_i_1_n_0 ),
        .D(\hdataout[6]_i_1_n_0 ),
        .Q(hdataout[6]),
        .R(SR));
  FDRE \hdataout_reg[7] 
       (.C(Rx_SysClk),
        .CE(\hdataout[9]_i_1_n_0 ),
        .D(\hdataout[7]_i_1_n_0 ),
        .Q(hdataout[7]),
        .R(SR));
  FDRE \hdataout_reg[8] 
       (.C(Rx_SysClk),
        .CE(\hdataout[9]_i_1_n_0 ),
        .D(\hdataout[8]_i_1_n_0 ),
        .Q(hdataout[8]),
        .R(SR));
  FDRE \hdataout_reg[9] 
       (.C(Rx_SysClk),
        .CE(\hdataout[9]_i_1_n_0 ),
        .D(\hdataout[9]_i_2_n_0 ),
        .Q(hdataout[9]),
        .R(SR));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \holdreg[10]_i_1 
       (.I0(\holdreg_reg_n_0_[13] ),
        .I1(\holdreg_reg[1]_1 ),
        .I2(\active_reg_n_0_[4] ),
        .I3(\holdreg_reg[1]_0 ),
        .I4(\holdreg_reg_n_0_[14] ),
        .O(\holdreg[10]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \holdreg[11]_i_1 
       (.I0(\holdreg_reg_n_0_[14] ),
        .I1(\holdreg_reg[1]_1 ),
        .I2(\active_reg_n_0_[5] ),
        .I3(\holdreg_reg[1]_0 ),
        .I4(\active_reg_n_0_[4] ),
        .O(\holdreg[11]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \holdreg[12]_i_1 
       (.I0(\active_reg_n_0_[4] ),
        .I1(\holdreg_reg[1]_1 ),
        .I2(\active_reg_n_0_[6] ),
        .I3(\holdreg_reg[1]_0 ),
        .I4(\active_reg_n_0_[5] ),
        .O(\holdreg[12]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \holdreg[13]_i_1 
       (.I0(\active_reg_n_0_[5] ),
        .I1(\holdreg_reg[1]_1 ),
        .I2(\active_reg_n_0_[7] ),
        .I3(\holdreg_reg[1]_0 ),
        .I4(\active_reg_n_0_[6] ),
        .O(\holdreg[13]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \holdreg[14]_i_1 
       (.I0(\active_reg_n_0_[6] ),
        .I1(\holdreg_reg[1]_1 ),
        .I2(p_3_out[4]),
        .I3(\holdreg_reg[1]_0 ),
        .I4(\active_reg_n_0_[7] ),
        .O(\holdreg[14]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \holdreg[1]_i_1 
       (.I0(\holdreg_reg_n_0_[4] ),
        .I1(\holdreg_reg[1]_1 ),
        .I2(\holdreg_reg_n_0_[6] ),
        .I3(\holdreg_reg[1]_0 ),
        .I4(\holdreg_reg_n_0_[5] ),
        .O(\holdreg[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \holdreg[2]_i_1 
       (.I0(\holdreg_reg_n_0_[5] ),
        .I1(\holdreg_reg[1]_1 ),
        .I2(\holdreg_reg_n_0_[7] ),
        .I3(\holdreg_reg[1]_0 ),
        .I4(\holdreg_reg_n_0_[6] ),
        .O(\holdreg[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \holdreg[3]_i_1 
       (.I0(\holdreg_reg_n_0_[6] ),
        .I1(\holdreg_reg[1]_1 ),
        .I2(\holdreg_reg_n_0_[8] ),
        .I3(\holdreg_reg[1]_0 ),
        .I4(\holdreg_reg_n_0_[7] ),
        .O(\holdreg[3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \holdreg[4]_i_1 
       (.I0(\holdreg_reg_n_0_[7] ),
        .I1(\holdreg_reg[1]_1 ),
        .I2(\holdreg_reg_n_0_[9] ),
        .I3(\holdreg_reg[1]_0 ),
        .I4(\holdreg_reg_n_0_[8] ),
        .O(\holdreg[4]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \holdreg[5]_i_1 
       (.I0(\holdreg_reg_n_0_[8] ),
        .I1(\holdreg_reg[1]_1 ),
        .I2(\holdreg_reg_n_0_[10] ),
        .I3(\holdreg_reg[1]_0 ),
        .I4(\holdreg_reg_n_0_[9] ),
        .O(\holdreg[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \holdreg[6]_i_1 
       (.I0(\holdreg_reg_n_0_[9] ),
        .I1(\holdreg_reg[1]_1 ),
        .I2(\holdreg_reg_n_0_[11] ),
        .I3(\holdreg_reg[1]_0 ),
        .I4(\holdreg_reg_n_0_[10] ),
        .O(\holdreg[6]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \holdreg[7]_i_1 
       (.I0(\holdreg_reg_n_0_[10] ),
        .I1(\holdreg_reg[1]_1 ),
        .I2(\holdreg_reg_n_0_[12] ),
        .I3(\holdreg_reg[1]_0 ),
        .I4(\holdreg_reg_n_0_[11] ),
        .O(\holdreg[7]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \holdreg[8]_i_1 
       (.I0(\holdreg_reg_n_0_[11] ),
        .I1(\holdreg_reg[1]_1 ),
        .I2(\holdreg_reg_n_0_[13] ),
        .I3(\holdreg_reg[1]_0 ),
        .I4(\holdreg_reg_n_0_[12] ),
        .O(\holdreg[8]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \holdreg[9]_i_1 
       (.I0(\holdreg_reg_n_0_[12] ),
        .I1(\holdreg_reg[1]_1 ),
        .I2(\holdreg_reg_n_0_[14] ),
        .I3(\holdreg_reg[1]_0 ),
        .I4(\holdreg_reg_n_0_[13] ),
        .O(\holdreg[9]_i_1_n_0 ));
  FDRE \holdreg_reg[10] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(\holdreg[10]_i_1_n_0 ),
        .Q(\holdreg_reg_n_0_[10] ),
        .R(SR));
  FDRE \holdreg_reg[11] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(\holdreg[11]_i_1_n_0 ),
        .Q(\holdreg_reg_n_0_[11] ),
        .R(SR));
  FDRE \holdreg_reg[12] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(\holdreg[12]_i_1_n_0 ),
        .Q(\holdreg_reg_n_0_[12] ),
        .R(SR));
  FDRE \holdreg_reg[13] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(\holdreg[13]_i_1_n_0 ),
        .Q(\holdreg_reg_n_0_[13] ),
        .R(SR));
  FDRE \holdreg_reg[14] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(\holdreg[14]_i_1_n_0 ),
        .Q(\holdreg_reg_n_0_[14] ),
        .R(SR));
  FDRE \holdreg_reg[1] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(\holdreg[1]_i_1_n_0 ),
        .Q(\holdreg_reg_n_0_[1] ),
        .R(SR));
  FDRE \holdreg_reg[2] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(\holdreg[2]_i_1_n_0 ),
        .Q(\holdreg_reg_n_0_[2] ),
        .R(SR));
  FDRE \holdreg_reg[3] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(\holdreg[3]_i_1_n_0 ),
        .Q(\holdreg_reg_n_0_[3] ),
        .R(SR));
  FDRE \holdreg_reg[4] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(\holdreg[4]_i_1_n_0 ),
        .Q(\holdreg_reg_n_0_[4] ),
        .R(SR));
  FDRE \holdreg_reg[5] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(\holdreg[5]_i_1_n_0 ),
        .Q(\holdreg_reg_n_0_[5] ),
        .R(SR));
  FDRE \holdreg_reg[6] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(\holdreg[6]_i_1_n_0 ),
        .Q(\holdreg_reg_n_0_[6] ),
        .R(SR));
  FDRE \holdreg_reg[7] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(\holdreg[7]_i_1_n_0 ),
        .Q(\holdreg_reg_n_0_[7] ),
        .R(SR));
  FDRE \holdreg_reg[8] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(\holdreg[8]_i_1_n_0 ),
        .Q(\holdreg_reg_n_0_[8] ),
        .R(SR));
  FDRE \holdreg_reg[9] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(\holdreg[9]_i_1_n_0 ),
        .Q(\holdreg_reg_n_0_[9] ),
        .R(SR));
  LUT2 #(
    .INIT(4'h6)) 
    i___0_carry_i_1
       (.I0(monitor_late_reg_0),
        .I1(Q[6]),
        .O(i___0_carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    i___0_carry_i_1__0
       (.I0(monitor_late_reg_0),
        .I1(FifoRd_0_0[7]),
        .O(i___0_carry_i_1__0_n_0));
  LUT3 #(
    .INIT(8'h96)) 
    i___0_carry_i_2
       (.I0(p_1_in[7]),
        .I1(monitor_late_reg_0),
        .I2(Q[5]),
        .O(i___0_carry_i_2_n_0));
  LUT3 #(
    .INIT(8'h96)) 
    i___0_carry_i_2__0
       (.I0(p_1_in[7]),
        .I1(monitor_late_reg_0),
        .I2(FifoRd_0_0[6]),
        .O(i___0_carry_i_2__0_n_0));
  LUT3 #(
    .INIT(8'h96)) 
    i___0_carry_i_3
       (.I0(p_1_in[6]),
        .I1(monitor_late_reg_0),
        .I2(Q[4]),
        .O(i___0_carry_i_3_n_0));
  LUT3 #(
    .INIT(8'h96)) 
    i___0_carry_i_3__0
       (.I0(p_1_in[6]),
        .I1(monitor_late_reg_0),
        .I2(FifoRd_0_0[5]),
        .O(i___0_carry_i_3__0_n_0));
  LUT3 #(
    .INIT(8'h96)) 
    i___0_carry_i_4
       (.I0(p_1_in[5]),
        .I1(monitor_late_reg_0),
        .I2(Q[3]),
        .O(i___0_carry_i_4_n_0));
  LUT3 #(
    .INIT(8'h96)) 
    i___0_carry_i_4__0
       (.I0(p_1_in[5]),
        .I1(monitor_late_reg_0),
        .I2(FifoRd_0_0[4]),
        .O(i___0_carry_i_4__0_n_0));
  LUT3 #(
    .INIT(8'h96)) 
    i___0_carry_i_5
       (.I0(p_1_in[4]),
        .I1(monitor_late_reg_0),
        .I2(Q[2]),
        .O(i___0_carry_i_5_n_0));
  LUT3 #(
    .INIT(8'h96)) 
    i___0_carry_i_5__0
       (.I0(p_1_in[4]),
        .I1(monitor_late_reg_0),
        .I2(FifoRd_0_0[3]),
        .O(i___0_carry_i_5__0_n_0));
  LUT3 #(
    .INIT(8'h96)) 
    i___0_carry_i_6
       (.I0(p_1_in[3]),
        .I1(monitor_late_reg_0),
        .I2(Q[1]),
        .O(i___0_carry_i_6_n_0));
  LUT3 #(
    .INIT(8'h96)) 
    i___0_carry_i_6__0
       (.I0(p_1_in[3]),
        .I1(monitor_late_reg_0),
        .I2(FifoRd_0_0[2]),
        .O(i___0_carry_i_6__0_n_0));
  LUT3 #(
    .INIT(8'h96)) 
    i___0_carry_i_7
       (.I0(p_1_in[2]),
        .I1(monitor_late_reg_0),
        .I2(Q[0]),
        .O(i___0_carry_i_7_n_0));
  LUT3 #(
    .INIT(8'h96)) 
    i___0_carry_i_7__0
       (.I0(p_1_in[2]),
        .I1(monitor_late_reg_0),
        .I2(DI),
        .O(i___0_carry_i_7__0_n_0));
  LUT4 #(
    .INIT(16'h44D4)) 
    i__carry_i_1
       (.I0(p_1_in[7]),
        .I1(FifoRd_0_0[6]),
        .I2(FifoRd_0_0[5]),
        .I3(p_1_in[6]),
        .O(i__carry_i_1_n_0));
  LUT4 #(
    .INIT(16'h44D4)) 
    i__carry_i_2
       (.I0(p_1_in[5]),
        .I1(FifoRd_0_0[4]),
        .I2(FifoRd_0_0[3]),
        .I3(p_1_in[4]),
        .O(i__carry_i_2_n_0));
  LUT4 #(
    .INIT(16'h44D4)) 
    i__carry_i_3
       (.I0(p_1_in[3]),
        .I1(FifoRd_0_0[2]),
        .I2(DI),
        .I3(p_1_in[2]),
        .O(i__carry_i_3_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    i__carry_i_4
       (.I0(FifoRd_0_0[0]),
        .I1(FifoRd_0_0[1]),
        .O(i__carry_i_4_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry_i_5
       (.I0(FifoRd_0_0[7]),
        .O(i__carry_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry_i_6
       (.I0(FifoRd_0_0[6]),
        .I1(p_1_in[7]),
        .I2(FifoRd_0_0[5]),
        .I3(p_1_in[6]),
        .O(i__carry_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry_i_7
       (.I0(FifoRd_0_0[4]),
        .I1(p_1_in[5]),
        .I2(FifoRd_0_0[3]),
        .I3(p_1_in[4]),
        .O(i__carry_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry_i_8
       (.I0(FifoRd_0_0[2]),
        .I1(p_1_in[3]),
        .I2(DI),
        .I3(p_1_in[2]),
        .O(i__carry_i_8_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    i__carry_i_9
       (.I0(FifoRd_0_0[1]),
        .I1(FifoRd_0_0[0]),
        .O(i__carry_i_9_n_0));
  FDRE insert3_reg
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(\s_state_reg[4]_1 ),
        .Q(\holdreg_reg[1]_1 ),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair128" *) 
  LUT5 #(
    .INIT(32'h30000001)) 
    insert5_i_2
       (.I0(\Slve_CntValIn_Out_reg[1]_0 [3]),
        .I1(\Slve_CntValIn_Out_reg[1]_0 [5]),
        .I2(\Slve_CntValIn_Out_reg[1]_0 [2]),
        .I3(\Slve_CntValIn_Out_reg[1]_0 [0]),
        .I4(\Slve_CntValIn_Out_reg[1]_0 [1]),
        .O(insert3_reg_0));
  FDRE insert5_reg
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(\s_state_reg[3]_1 ),
        .Q(\holdreg_reg[1]_0 ),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair122" *) 
  LUT5 #(
    .INIT(32'hFFFF8001)) 
    kout_i_i_1
       (.I0(al_rx_data_out[4]),
        .I1(al_rx_data_out[5]),
        .I2(al_rx_data_out[3]),
        .I3(al_rx_data_out[2]),
        .I4(k1),
        .O(k));
  (* SOFT_HLUTNM = "soft_lutpair120" *) 
  LUT5 #(
    .INIT(32'h40000002)) 
    kout_i_i_2
       (.I0(al_rx_data_out[4]),
        .I1(al_rx_data_out[8]),
        .I2(al_rx_data_out[9]),
        .I3(al_rx_data_out[7]),
        .I4(al_rx_data_out[5]),
        .O(k1));
  (* SOFT_HLUTNM = "soft_lutpair166" *) 
  LUT3 #(
    .INIT(8'h8B)) 
    \monitor[4]_i_1 
       (.I0(BaseX_Rx_Q_Out[0]),
        .I1(\active_reg[4]_0 ),
        .I2(BaseX_Rx_Q_Out[4]),
        .O(p_3_out[4]));
  (* SOFT_HLUTNM = "soft_lutpair172" *) 
  LUT3 #(
    .INIT(8'h8B)) 
    \monitor[5]_i_1 
       (.I0(BaseX_Rx_Q_Out[1]),
        .I1(\active_reg[4]_0 ),
        .I2(BaseX_Rx_Q_Out[5]),
        .O(p_3_out[5]));
  (* SOFT_HLUTNM = "soft_lutpair172" *) 
  LUT3 #(
    .INIT(8'h8B)) 
    \monitor[6]_i_1 
       (.I0(BaseX_Rx_Q_Out[2]),
        .I1(\active_reg[4]_0 ),
        .I2(BaseX_Rx_Q_Out[6]),
        .O(p_3_out[6]));
  LUT3 #(
    .INIT(8'h8B)) 
    \monitor[7]_i_1 
       (.I0(BaseX_Rx_Q_Out[3]),
        .I1(\active_reg[4]_0 ),
        .I2(BaseX_Rx_Q_Out[7]),
        .O(p_3_out[7]));
  LUT6 #(
    .INIT(64'h0000100001000000)) 
    monitor_late_i_2
       (.I0(\Slve_CntValIn_Out_reg[1]_0 [2]),
        .I1(\Slve_CntValIn_Out_reg[1]_0 [3]),
        .I2(\Slve_CntValIn_Out_reg[1]_0 [5]),
        .I3(\Slve_CntValIn_Out_reg[1]_0 [0]),
        .I4(\Slve_CntValIn_Out_reg[1]_0 [4]),
        .I5(\Slve_CntValIn_Out_reg[1]_0 [1]),
        .O(monitor_late_reg_2));
  FDRE monitor_late_reg
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(WrapToZero_reg_0),
        .Q(monitor_late_reg_1),
        .R(SR));
  FDRE \monitor_reg[3] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(monitor[7]),
        .Q(monitor[3]),
        .R(\IntReset_dly_reg_n_0_[1] ));
  FDRE \monitor_reg[4] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(p_3_out[4]),
        .Q(monitor[4]),
        .R(\IntReset_dly_reg_n_0_[1] ));
  FDRE \monitor_reg[5] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(p_3_out[5]),
        .Q(monitor[5]),
        .R(\IntReset_dly_reg_n_0_[1] ));
  FDRE \monitor_reg[6] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(p_3_out[6]),
        .Q(monitor[6]),
        .R(\IntReset_dly_reg_n_0_[1] ));
  FDRE \monitor_reg[7] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(p_3_out[7]),
        .Q(monitor[7]),
        .R(\IntReset_dly_reg_n_0_[1] ));
  LUT6 #(
    .INIT(64'h00000000FFFF0002)) 
    \mpx[0]_i_1 
       (.I0(\mpx[0]_i_2_n_0 ),
        .I1(\mpx[0]_i_3_n_0 ),
        .I2(\mpx[0]_i_4_n_0 ),
        .I3(\mpx[0]_i_5_n_0 ),
        .I4(\mpx_reg[1]_0 ),
        .I5(\mpx[3]_i_7_n_0 ),
        .O(\mpx[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair149" *) 
  LUT4 #(
    .INIT(16'hDFFF)) 
    \mpx[0]_i_10 
       (.I0(\rxdh_reg_n_0_[6] ),
        .I1(\rxdh_reg_n_0_[2] ),
        .I2(\rxdh_reg_n_0_[4] ),
        .I3(\rxdh_reg_n_0_[7] ),
        .O(\mpx[0]_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair146" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \mpx[0]_i_11 
       (.I0(data9[1]),
        .I1(data9[2]),
        .I2(\rxdh_reg_n_0_[8] ),
        .I3(data9[0]),
        .O(\mpx[0]_i_11_n_0 ));
  LUT4 #(
    .INIT(16'hFFFD)) 
    \mpx[0]_i_12 
       (.I0(data9[3]),
        .I1(\rxdh_reg_n_0_[7] ),
        .I2(\rxdh_reg_n_0_[6] ),
        .I3(data9[4]),
        .O(\mpx[0]_i_12_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair142" *) 
  LUT4 #(
    .INIT(16'h0008)) 
    \mpx[0]_i_13 
       (.I0(\rxdh_reg_n_0_[6] ),
        .I1(\rxdh_reg_n_0_[7] ),
        .I2(data9[2]),
        .I3(data9[3]),
        .O(\mpx[0]_i_13_n_0 ));
  LUT4 #(
    .INIT(16'hFFEF)) 
    \mpx[0]_i_14 
       (.I0(data9[0]),
        .I1(data9[1]),
        .I2(data9[4]),
        .I3(\rxdh_reg_n_0_[8] ),
        .O(\mpx[0]_i_14_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair140" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    \mpx[0]_i_15 
       (.I0(data9[1]),
        .I1(data9[2]),
        .I2(data9[3]),
        .I3(data9[0]),
        .O(\mpx[0]_i_15_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair144" *) 
  LUT4 #(
    .INIT(16'hFFDF)) 
    \mpx[0]_i_16 
       (.I0(data9[4]),
        .I1(\rxdh_reg_n_0_[8] ),
        .I2(data9[5]),
        .I3(data9[6]),
        .O(\mpx[0]_i_16_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair148" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \mpx[0]_i_17 
       (.I0(data9[5]),
        .I1(data9[4]),
        .I2(data9[2]),
        .I3(data9[3]),
        .O(\mpx[0]_i_17_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair141" *) 
  LUT4 #(
    .INIT(16'hFF7F)) 
    \mpx[0]_i_18 
       (.I0(\rxdh_reg_n_0_[8] ),
        .I1(data9[0]),
        .I2(data9[6]),
        .I3(data9[1]),
        .O(\mpx[0]_i_18_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair147" *) 
  LUT4 #(
    .INIT(16'h0010)) 
    \mpx[0]_i_19 
       (.I0(\rxdh_reg_n_0_[4] ),
        .I1(\rxdh_reg_n_0_[5] ),
        .I2(\rxdh_reg_n_0_[6] ),
        .I3(data9[2]),
        .O(\mpx[0]_i_19_n_0 ));
  LUT6 #(
    .INIT(64'hEFEFEFEFFFFFAAFF)) 
    \mpx[0]_i_2 
       (.I0(\mpx[0]_i_6_n_0 ),
        .I1(\mpx[0]_i_7_n_0 ),
        .I2(\mpx[0]_i_8_n_0 ),
        .I3(\mpx[0]_i_9_n_0 ),
        .I4(\mpx[0]_i_10_n_0 ),
        .I5(\rxdh_reg_n_0_[3] ),
        .O(\mpx[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair143" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    \mpx[0]_i_20 
       (.I0(\rxdh_reg_n_0_[8] ),
        .I1(data9[0]),
        .I2(\rxdh_reg_n_0_[7] ),
        .I3(data9[1]),
        .O(\mpx[0]_i_20_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair147" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    \mpx[0]_i_21 
       (.I0(\rxdh_reg_n_0_[4] ),
        .I1(data9[2]),
        .I2(\rxdh_reg_n_0_[5] ),
        .I3(\rxdh_reg_n_0_[6] ),
        .O(\mpx[0]_i_21_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair146" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \mpx[0]_i_22 
       (.I0(\rxdh_reg_n_0_[7] ),
        .I1(\rxdh_reg_n_0_[8] ),
        .I2(data9[0]),
        .I3(data9[1]),
        .O(\mpx[0]_i_22_n_0 ));
  LUT6 #(
    .INIT(64'h000022F222F20000)) 
    \mpx[0]_i_3 
       (.I0(\mpx[0]_i_11_n_0 ),
        .I1(\mpx[0]_i_12_n_0 ),
        .I2(\mpx[0]_i_13_n_0 ),
        .I3(\mpx[0]_i_14_n_0 ),
        .I4(data9[5]),
        .I5(data9[6]),
        .O(\mpx[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h000022F222F20000)) 
    \mpx[0]_i_4 
       (.I0(\mpx[0]_i_15_n_0 ),
        .I1(\mpx[0]_i_16_n_0 ),
        .I2(\mpx[0]_i_17_n_0 ),
        .I3(\mpx[0]_i_18_n_0 ),
        .I4(data9[7]),
        .I5(data9[8]),
        .O(\mpx[0]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0060006066660060)) 
    \mpx[0]_i_5 
       (.I0(data9[4]),
        .I1(data9[3]),
        .I2(\mpx[0]_i_19_n_0 ),
        .I3(\mpx[0]_i_20_n_0 ),
        .I4(\mpx[0]_i_21_n_0 ),
        .I5(\mpx[0]_i_22_n_0 ),
        .O(\mpx[0]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \mpx[0]_i_6 
       (.I0(data9[2]),
        .I1(data9[1]),
        .O(\mpx[0]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \mpx[0]_i_7 
       (.I0(\rxdh_reg_n_0_[5] ),
        .I1(\rxdh_reg_n_0_[6] ),
        .I2(\rxdh_reg_n_0_[7] ),
        .I3(\rxdh_reg_n_0_[8] ),
        .O(\mpx[0]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'h08)) 
    \mpx[0]_i_8 
       (.I0(\rxdh_reg_n_0_[2] ),
        .I1(data9[0]),
        .I2(\rxdh_reg_n_0_[4] ),
        .O(\mpx[0]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair155" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \mpx[0]_i_9 
       (.I0(\rxdh_reg_n_0_[5] ),
        .I1(\rxdh_reg_n_0_[8] ),
        .I2(data9[0]),
        .O(\mpx[0]_i_9_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair138" *) 
  LUT4 #(
    .INIT(16'h1011)) 
    \mpx[1]_i_1 
       (.I0(\mpx_reg[1]_0 ),
        .I1(\mpx[3]_i_7_n_0 ),
        .I2(\mpx_reg[1]_1 ),
        .I3(\mpx[1]_i_2_n_0 ),
        .O(\mpx[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0000F44F)) 
    \mpx[1]_i_2 
       (.I0(\mpx[1]_i_3_n_0 ),
        .I1(\mpx[1]_i_4_n_0 ),
        .I2(data9[6]),
        .I3(data9[7]),
        .I4(\mpx[0]_i_3_n_0 ),
        .O(\mpx[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000040)) 
    \mpx[1]_i_3 
       (.I0(data9[2]),
        .I1(data9[5]),
        .I2(\rxdh_reg_n_0_[8] ),
        .I3(data9[4]),
        .I4(\mpx[1]_i_5_n_0 ),
        .I5(\mpx[1]_i_6_n_0 ),
        .O(\mpx[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFF7)) 
    \mpx[1]_i_4 
       (.I0(data9[3]),
        .I1(data9[2]),
        .I2(\mpx[1]_i_7_n_0 ),
        .I3(\mpx[1]_i_8_n_0 ),
        .I4(\rxdh_reg_n_0_[7] ),
        .I5(data9[5]),
        .O(\mpx[1]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \mpx[1]_i_5 
       (.I0(data9[1]),
        .I1(data9[0]),
        .O(\mpx[1]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair173" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \mpx[1]_i_6 
       (.I0(data9[3]),
        .I1(\rxdh_reg_n_0_[7] ),
        .O(\mpx[1]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair174" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \mpx[1]_i_7 
       (.I0(\rxdh_reg_n_0_[8] ),
        .I1(data9[4]),
        .O(\mpx[1]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair175" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \mpx[1]_i_8 
       (.I0(data9[1]),
        .I1(data9[0]),
        .O(\mpx[1]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \mpx[2]_i_1 
       (.I0(\mpx_reg[3]_0 ),
        .I1(\mpx[3]_i_7_n_0 ),
        .O(\mpx[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFEAAAAAAAA)) 
    \mpx[3]_i_1 
       (.I0(SR),
        .I1(\mpx_reg[1]_1 ),
        .I2(\mpx_reg[3]_0 ),
        .I3(\mpx_reg[0]_0 ),
        .I4(\mpx_reg[1]_0 ),
        .I5(\rxdh_reg[0]_0 ),
        .O(\mpx[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h04000400FFFF0400)) 
    \mpx[3]_i_10 
       (.I0(\mpx[3]_i_23_n_0 ),
        .I1(\rxdh_reg_n_0_[7] ),
        .I2(data9[3]),
        .I3(\mpx[0]_i_11_n_0 ),
        .I4(\mpx[3]_i_25_n_0 ),
        .I5(\mpx[3]_i_26_n_0 ),
        .O(\mpx[3]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hF9FFF9FF9999F9FF)) 
    \mpx[3]_i_11 
       (.I0(data9[7]),
        .I1(data9[6]),
        .I2(\mpx[3]_i_27_n_0 ),
        .I3(\mpx[3]_i_28_n_0 ),
        .I4(\mpx[3]_i_29_n_0 ),
        .I5(\mpx[3]_i_30_n_0 ),
        .O(\mpx[3]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'h000022F222F20000)) 
    \mpx[3]_i_12 
       (.I0(\mpx[3]_i_18_n_0 ),
        .I1(\mpx[3]_i_22_n_0 ),
        .I2(\mpx[3]_i_15_n_0 ),
        .I3(\mpx[3]_i_21_n_0 ),
        .I4(\rxdh_reg_n_0_[8] ),
        .I5(data9[0]),
        .O(\mpx[3]_i_12_n_0 ));
  LUT5 #(
    .INIT(32'h20000000)) 
    \mpx[3]_i_13 
       (.I0(\mpx[0]_i_17_n_0 ),
        .I1(data9[6]),
        .I2(data9[7]),
        .I3(data9[1]),
        .I4(data9[0]),
        .O(\mpx[3]_i_13_n_0 ));
  LUT5 #(
    .INIT(32'h00004000)) 
    \mpx[3]_i_14 
       (.I0(data9[7]),
        .I1(data9[2]),
        .I2(data9[4]),
        .I3(data9[5]),
        .I4(\mpx[3]_i_31_n_0 ),
        .O(\mpx[3]_i_14_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair151" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \mpx[3]_i_15 
       (.I0(\rxdh_reg_n_0_[5] ),
        .I1(\rxdh_reg_n_0_[6] ),
        .I2(\rxdh_reg_n_0_[3] ),
        .I3(\rxdh_reg_n_0_[4] ),
        .O(\mpx[3]_i_15_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair150" *) 
  LUT3 #(
    .INIT(8'hDF)) 
    \mpx[3]_i_16 
       (.I0(\rxdh_reg_n_0_[2] ),
        .I1(\rxdh_reg_n_0_[7] ),
        .I2(\rxdh_reg_n_0_[1] ),
        .O(\mpx[3]_i_16_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair173" *) 
  LUT3 #(
    .INIT(8'hBF)) 
    \mpx[3]_i_17 
       (.I0(\rxdh_reg_n_0_[2] ),
        .I1(\rxdh_reg_n_0_[4] ),
        .I2(\rxdh_reg_n_0_[7] ),
        .O(\mpx[3]_i_17_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair151" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    \mpx[3]_i_18 
       (.I0(\rxdh_reg_n_0_[5] ),
        .I1(\rxdh_reg_n_0_[6] ),
        .I2(\rxdh_reg_n_0_[3] ),
        .I3(\rxdh_reg_n_0_[1] ),
        .O(\mpx[3]_i_18_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair175" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \mpx[3]_i_19 
       (.I0(data9[1]),
        .I1(data9[0]),
        .O(\mpx[3]_i_19_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair138" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \mpx[3]_i_2 
       (.I0(\mpx_reg[1]_0 ),
        .I1(\mpx[3]_i_7_n_0 ),
        .I2(\mpx_reg[1]_1 ),
        .I3(\mpx_reg[3]_0 ),
        .O(\mpx[3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair174" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \mpx[3]_i_20 
       (.I0(data9[0]),
        .I1(\rxdh_reg_n_0_[8] ),
        .O(\mpx[3]_i_20_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair150" *) 
  LUT4 #(
    .INIT(16'hDFFF)) 
    \mpx[3]_i_21 
       (.I0(\rxdh_reg_n_0_[1] ),
        .I1(\rxdh_reg_n_0_[2] ),
        .I2(\rxdh_reg_n_0_[0] ),
        .I3(\rxdh_reg_n_0_[7] ),
        .O(\mpx[3]_i_21_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair149" *) 
  LUT4 #(
    .INIT(16'hFFDF)) 
    \mpx[3]_i_22 
       (.I0(\rxdh_reg_n_0_[2] ),
        .I1(\rxdh_reg_n_0_[7] ),
        .I2(\rxdh_reg_n_0_[4] ),
        .I3(\rxdh_reg_n_0_[0] ),
        .O(\mpx[3]_i_22_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \mpx[3]_i_23 
       (.I0(\rxdh_reg_n_0_[6] ),
        .I1(\rxdh_reg_n_0_[5] ),
        .O(\mpx[3]_i_23_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \mpx[3]_i_24 
       (.I0(data9[0]),
        .I1(\rxdh_reg_n_0_[8] ),
        .O(\mpx[3]_i_24_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair155" *) 
  LUT4 #(
    .INIT(16'h1000)) 
    \mpx[3]_i_25 
       (.I0(\rxdh_reg_n_0_[8] ),
        .I1(data9[0]),
        .I2(\rxdh_reg_n_0_[5] ),
        .I3(\rxdh_reg_n_0_[6] ),
        .O(\mpx[3]_i_25_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair142" *) 
  LUT4 #(
    .INIT(16'hFFEF)) 
    \mpx[3]_i_26 
       (.I0(data9[1]),
        .I1(data9[2]),
        .I2(data9[3]),
        .I3(\rxdh_reg_n_0_[7] ),
        .O(\mpx[3]_i_26_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair148" *) 
  LUT4 #(
    .INIT(16'hDFFF)) 
    \mpx[3]_i_27 
       (.I0(data9[4]),
        .I1(\rxdh_reg_n_0_[8] ),
        .I2(data9[2]),
        .I3(data9[3]),
        .O(\mpx[3]_i_27_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair143" *) 
  LUT4 #(
    .INIT(16'h1000)) 
    \mpx[3]_i_28 
       (.I0(data9[5]),
        .I1(\rxdh_reg_n_0_[7] ),
        .I2(data9[0]),
        .I3(data9[1]),
        .O(\mpx[3]_i_28_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair144" *) 
  LUT4 #(
    .INIT(16'h0040)) 
    \mpx[3]_i_29 
       (.I0(data9[4]),
        .I1(\rxdh_reg_n_0_[8] ),
        .I2(data9[5]),
        .I3(data9[2]),
        .O(\mpx[3]_i_29_n_0 ));
  LUT6 #(
    .INIT(64'h55DFDF5555575755)) 
    \mpx[3]_i_3 
       (.I0(\mpx[0]_i_2_n_0 ),
        .I1(\rxdh_reg_n_0_[7] ),
        .I2(\mpx[3]_i_8_n_0 ),
        .I3(data9[3]),
        .I4(data9[2]),
        .I5(\mpx[3]_i_9_n_0 ),
        .O(\mpx_reg[1]_1 ));
  (* SOFT_HLUTNM = "soft_lutpair140" *) 
  LUT4 #(
    .INIT(16'hFFFD)) 
    \mpx[3]_i_30 
       (.I0(\rxdh_reg_n_0_[7] ),
        .I1(data9[3]),
        .I2(data9[0]),
        .I3(data9[1]),
        .O(\mpx[3]_i_30_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair141" *) 
  LUT4 #(
    .INIT(16'hFFDF)) 
    \mpx[3]_i_31 
       (.I0(data9[6]),
        .I1(data9[1]),
        .I2(data9[3]),
        .I3(data9[0]),
        .O(\mpx[3]_i_31_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFBEAAFFFFFFFF)) 
    \mpx[3]_i_4 
       (.I0(\mpx[0]_i_5_n_0 ),
        .I1(data9[4]),
        .I2(data9[5]),
        .I3(\mpx[3]_i_10_n_0 ),
        .I4(\mpx[0]_i_3_n_0 ),
        .I5(\mpx[3]_i_11_n_0 ),
        .O(\mpx_reg[3]_0 ));
  LUT6 #(
    .INIT(64'hEEEEFFFEFFFEEEEE)) 
    \mpx[3]_i_5 
       (.I0(\mpx[3]_i_12_n_0 ),
        .I1(\mpx[0]_i_4_n_0 ),
        .I2(\mpx[3]_i_13_n_0 ),
        .I3(\mpx[3]_i_14_n_0 ),
        .I4(data9[8]),
        .I5(data9[9]),
        .O(\mpx_reg[0]_0 ));
  LUT6 #(
    .INIT(64'h00000000202F2020)) 
    \mpx[3]_i_6 
       (.I0(\mpx[3]_i_15_n_0 ),
        .I1(\mpx[3]_i_16_n_0 ),
        .I2(\rxdh_reg_n_0_[8] ),
        .I3(\mpx[3]_i_17_n_0 ),
        .I4(\mpx[3]_i_18_n_0 ),
        .I5(\mpx[3]_i_19_n_0 ),
        .O(\mpx_reg[1]_0 ));
  LUT6 #(
    .INIT(64'hABAABBBBABAAABAA)) 
    \mpx[3]_i_7 
       (.I0(SR),
        .I1(\mpx[3]_i_20_n_0 ),
        .I2(\mpx[3]_i_21_n_0 ),
        .I3(\mpx[3]_i_15_n_0 ),
        .I4(\mpx[3]_i_22_n_0 ),
        .I5(\mpx[3]_i_18_n_0 ),
        .O(\mpx[3]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFDFFFFF)) 
    \mpx[3]_i_8 
       (.I0(data9[1]),
        .I1(data9[0]),
        .I2(\rxdh_reg_n_0_[3] ),
        .I3(\rxdh_reg_n_0_[8] ),
        .I4(\rxdh_reg_n_0_[4] ),
        .I5(\mpx[3]_i_23_n_0 ),
        .O(\mpx[3]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000001000)) 
    \mpx[3]_i_9 
       (.I0(\mpx[3]_i_24_n_0 ),
        .I1(data9[1]),
        .I2(\rxdh_reg_n_0_[6] ),
        .I3(\rxdh_reg_n_0_[5] ),
        .I4(\rxdh_reg_n_0_[4] ),
        .I5(\rxdh_reg_n_0_[3] ),
        .O(\mpx[3]_i_9_n_0 ));
  FDRE \mpx_reg[0] 
       (.C(Rx_SysClk),
        .CE(\mpx[3]_i_1_n_0 ),
        .D(\mpx[0]_i_1_n_0 ),
        .Q(mpx[0]),
        .R(1'b0));
  FDRE \mpx_reg[1] 
       (.C(Rx_SysClk),
        .CE(\mpx[3]_i_1_n_0 ),
        .D(\mpx[1]_i_1_n_0 ),
        .Q(mpx[1]),
        .R(1'b0));
  FDRE \mpx_reg[2] 
       (.C(Rx_SysClk),
        .CE(\mpx[3]_i_1_n_0 ),
        .D(\mpx[2]_i_1_n_0 ),
        .Q(mpx[2]),
        .R(1'b0));
  FDRE \mpx_reg[3] 
       (.C(Rx_SysClk),
        .CE(\mpx[3]_i_1_n_0 ),
        .D(\mpx[3]_i_2_n_0 ),
        .Q(mpx[3]),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h96)) 
    \pd_count[0]_i_1 
       (.I0(\pd_count_reg[4]_0 [0]),
        .I1(PhaseDet_CntInc[0]),
        .I2(PhaseDet_CntDec[0]),
        .O(\pd_count[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h9669C33CC33C6996)) 
    \pd_count[1]_i_1 
       (.I0(PhaseDet_CntDec[0]),
        .I1(PhaseDet_CntDec[1]),
        .I2(\pd_count_reg[4]_0 [1]),
        .I3(PhaseDet_CntInc[1]),
        .I4(PhaseDet_CntInc[0]),
        .I5(\pd_count_reg[4]_0 [0]),
        .O(\pd_count[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair134" *) 
  LUT5 #(
    .INIT(32'h96669996)) 
    \pd_count[2]_i_1 
       (.I0(\pd_count[2]_i_2_n_0 ),
        .I1(\pd_count[2]_i_3_n_0 ),
        .I2(\pd_count_reg[4]_0 [1]),
        .I3(PhaseDet_CntInc[1]),
        .I4(PhaseDet_CntDec[1]),
        .O(\pd_count[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h69696900FF696969)) 
    \pd_count[2]_i_2 
       (.I0(PhaseDet_CntInc[1]),
        .I1(\pd_count_reg[4]_0 [1]),
        .I2(PhaseDet_CntDec[1]),
        .I3(\pd_count_reg[4]_0 [0]),
        .I4(PhaseDet_CntInc[0]),
        .I5(PhaseDet_CntDec[0]),
        .O(\pd_count[2]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair121" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \pd_count[2]_i_3 
       (.I0(PhaseDet_CntDec[2]),
        .I1(\pd_count_reg[4]_0 [2]),
        .I2(PhaseDet_CntInc[2]),
        .O(\pd_count[2]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h69996669)) 
    \pd_count[3]_i_1 
       (.I0(\pd_count[4]_i_3_n_0 ),
        .I1(\pd_count_reg[4]_0 [3]),
        .I2(\pd_count_reg[4]_0 [2]),
        .I3(PhaseDet_CntInc[2]),
        .I4(PhaseDet_CntDec[2]),
        .O(\pd_count[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \pd_count[4]_i_1 
       (.I0(\Slve_CntValIn_Out_reg[1]_0 [0]),
        .I1(\Slve_CntValIn_Out_reg[1]_0 [1]),
        .I2(delay_change[7]),
        .I3(\pd_count_reg[0]_0 ),
        .I4(\delay_change_reg_n_0_[0] ),
        .I5(SR),
        .O(pd_ovflw_up));
  LUT6 #(
    .INIT(64'h7F5780A8EAFE1501)) 
    \pd_count[4]_i_2 
       (.I0(\pd_count[4]_i_3_n_0 ),
        .I1(\pd_count_reg[4]_0 [2]),
        .I2(PhaseDet_CntInc[2]),
        .I3(PhaseDet_CntDec[2]),
        .I4(\pd_count_reg[4]_0 [4]),
        .I5(\pd_count_reg[4]_0 [3]),
        .O(\pd_count[4]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair121" *) 
  LUT5 #(
    .INIT(32'hFF696900)) 
    \pd_count[4]_i_3 
       (.I0(PhaseDet_CntInc[2]),
        .I1(\pd_count_reg[4]_0 [2]),
        .I2(PhaseDet_CntDec[2]),
        .I3(\pd_count[4]_i_4_n_0 ),
        .I4(\pd_count[2]_i_2_n_0 ),
        .O(\pd_count[4]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair134" *) 
  LUT3 #(
    .INIT(8'h8E)) 
    \pd_count[4]_i_4 
       (.I0(\pd_count_reg[4]_0 [1]),
        .I1(PhaseDet_CntInc[1]),
        .I2(PhaseDet_CntDec[1]),
        .O(\pd_count[4]_i_4_n_0 ));
  FDRE \pd_count_reg[0] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(\pd_count[0]_i_1_n_0 ),
        .Q(\pd_count_reg[4]_0 [0]),
        .R(pd_ovflw_up));
  FDRE \pd_count_reg[1] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(\pd_count[1]_i_1_n_0 ),
        .Q(\pd_count_reg[4]_0 [1]),
        .R(pd_ovflw_up));
  FDRE \pd_count_reg[2] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(\pd_count[2]_i_1_n_0 ),
        .Q(\pd_count_reg[4]_0 [2]),
        .R(pd_ovflw_up));
  FDRE \pd_count_reg[3] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(\pd_count[3]_i_1_n_0 ),
        .Q(\pd_count_reg[4]_0 [3]),
        .R(pd_ovflw_up));
  FDSE \pd_count_reg[4] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(\pd_count[4]_i_2_n_0 ),
        .Q(\pd_count_reg[4]_0 [4]),
        .S(pd_ovflw_up));
  FDRE pd_ovflw_down_reg
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(\pd_count_reg[3]_0 ),
        .Q(\s_state_reg[0]_0 ),
        .R(pd_ovflw_up));
  FDRE pd_ovflw_up_reg
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(\pd_count_reg[4]_1 ),
        .Q(\s_state_reg[0]_1 ),
        .R(pd_ovflw_up));
  FDRE \rxdh_reg[0] 
       (.C(Rx_SysClk),
        .CE(\rxdh_reg[0]_0 ),
        .D(data9[1]),
        .Q(\rxdh_reg_n_0_[0] ),
        .R(SR));
  FDRE \rxdh_reg[10] 
       (.C(Rx_SysClk),
        .CE(\rxdh_reg[0]_0 ),
        .D(hdataout[0]),
        .Q(data9[1]),
        .R(SR));
  FDRE \rxdh_reg[11] 
       (.C(Rx_SysClk),
        .CE(\rxdh_reg[0]_0 ),
        .D(hdataout[1]),
        .Q(data9[2]),
        .R(SR));
  FDRE \rxdh_reg[12] 
       (.C(Rx_SysClk),
        .CE(\rxdh_reg[0]_0 ),
        .D(hdataout[2]),
        .Q(data9[3]),
        .R(SR));
  FDRE \rxdh_reg[13] 
       (.C(Rx_SysClk),
        .CE(\rxdh_reg[0]_0 ),
        .D(hdataout[3]),
        .Q(data9[4]),
        .R(SR));
  FDRE \rxdh_reg[14] 
       (.C(Rx_SysClk),
        .CE(\rxdh_reg[0]_0 ),
        .D(hdataout[4]),
        .Q(data9[5]),
        .R(SR));
  FDRE \rxdh_reg[15] 
       (.C(Rx_SysClk),
        .CE(\rxdh_reg[0]_0 ),
        .D(hdataout[5]),
        .Q(data9[6]),
        .R(SR));
  FDRE \rxdh_reg[16] 
       (.C(Rx_SysClk),
        .CE(\rxdh_reg[0]_0 ),
        .D(hdataout[6]),
        .Q(data9[7]),
        .R(SR));
  FDRE \rxdh_reg[17] 
       (.C(Rx_SysClk),
        .CE(\rxdh_reg[0]_0 ),
        .D(hdataout[7]),
        .Q(data9[8]),
        .R(SR));
  FDRE \rxdh_reg[18] 
       (.C(Rx_SysClk),
        .CE(\rxdh_reg[0]_0 ),
        .D(hdataout[8]),
        .Q(data9[9]),
        .R(SR));
  FDRE \rxdh_reg[19] 
       (.C(Rx_SysClk),
        .CE(\rxdh_reg[0]_0 ),
        .D(hdataout[9]),
        .Q(\rxdh_reg_n_0_[19] ),
        .R(SR));
  FDRE \rxdh_reg[1] 
       (.C(Rx_SysClk),
        .CE(\rxdh_reg[0]_0 ),
        .D(data9[2]),
        .Q(\rxdh_reg_n_0_[1] ),
        .R(SR));
  FDRE \rxdh_reg[2] 
       (.C(Rx_SysClk),
        .CE(\rxdh_reg[0]_0 ),
        .D(data9[3]),
        .Q(\rxdh_reg_n_0_[2] ),
        .R(SR));
  FDRE \rxdh_reg[3] 
       (.C(Rx_SysClk),
        .CE(\rxdh_reg[0]_0 ),
        .D(data9[4]),
        .Q(\rxdh_reg_n_0_[3] ),
        .R(SR));
  FDRE \rxdh_reg[4] 
       (.C(Rx_SysClk),
        .CE(\rxdh_reg[0]_0 ),
        .D(data9[5]),
        .Q(\rxdh_reg_n_0_[4] ),
        .R(SR));
  FDRE \rxdh_reg[5] 
       (.C(Rx_SysClk),
        .CE(\rxdh_reg[0]_0 ),
        .D(data9[6]),
        .Q(\rxdh_reg_n_0_[5] ),
        .R(SR));
  FDRE \rxdh_reg[6] 
       (.C(Rx_SysClk),
        .CE(\rxdh_reg[0]_0 ),
        .D(data9[7]),
        .Q(\rxdh_reg_n_0_[6] ),
        .R(SR));
  FDRE \rxdh_reg[7] 
       (.C(Rx_SysClk),
        .CE(\rxdh_reg[0]_0 ),
        .D(data9[8]),
        .Q(\rxdh_reg_n_0_[7] ),
        .R(SR));
  FDRE \rxdh_reg[8] 
       (.C(Rx_SysClk),
        .CE(\rxdh_reg[0]_0 ),
        .D(data9[9]),
        .Q(\rxdh_reg_n_0_[8] ),
        .R(SR));
  FDRE \rxdh_reg[9] 
       (.C(Rx_SysClk),
        .CE(\rxdh_reg[0]_0 ),
        .D(\rxdh_reg_n_0_[19] ),
        .Q(data9[0]),
        .R(SR));
  LUT5 #(
    .INIT(32'h3C833CB3)) 
    \s_state[0]_i_1 
       (.I0(\s_state[0]_i_2_n_0 ),
        .I1(\s_state[5]_i_5_n_0 ),
        .I2(\s_state[5]_i_7_n_0 ),
        .I3(\s_state[5]_i_8_n_0 ),
        .I4(\Slve_CntValIn_Out_reg[1]_0 [0]),
        .O(\s_state[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair159" *) 
  LUT4 #(
    .INIT(16'hAA0C)) 
    \s_state[0]_i_2 
       (.I0(ActCnt_EQ_BTval),
        .I1(\s_state_reg[0]_0 ),
        .I2(ActCnt_EQ_Zero),
        .I3(\s_state_reg[0]_1 ),
        .O(\s_state[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h08F30BF30BF308F3)) 
    \s_state[1]_i_1 
       (.I0(\s_state[1]_i_2_n_0 ),
        .I1(\s_state[5]_i_5_n_0 ),
        .I2(\s_state[5]_i_8_n_0 ),
        .I3(\s_state[5]_i_7_n_0 ),
        .I4(\Slve_CntValIn_Out_reg[1]_0 [1]),
        .I5(\Slve_CntValIn_Out_reg[1]_0 [0]),
        .O(\s_state[1]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h45)) 
    \s_state[1]_i_2 
       (.I0(\s_state_reg[0]_1 ),
        .I1(ActCnt_EQ_Zero),
        .I2(\s_state_reg[0]_0 ),
        .O(\s_state[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00FFFFFFEF000000)) 
    \s_state[2]_i_1 
       (.I0(\Slve_CntValIn_Out_reg[1]_0 [3]),
        .I1(\Slve_CntValIn_Out_reg[1]_0 [4]),
        .I2(\Slve_CntValIn_Out_reg[1]_0 [5]),
        .I3(\Slve_CntValIn_Out_reg[1]_0 [1]),
        .I4(\Slve_CntValIn_Out_reg[1]_0 [0]),
        .I5(\Slve_CntValIn_Out_reg[1]_0 [2]),
        .O(\s_state[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair158" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \s_state[3]_i_1 
       (.I0(\Slve_CntValIn_Out_reg[1]_0 [3]),
        .I1(\Slve_CntValIn_Out_reg[1]_0 [1]),
        .I2(\Slve_CntValIn_Out_reg[1]_0 [0]),
        .I3(\Slve_CntValIn_Out_reg[1]_0 [2]),
        .O(\s_state[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h6CCCCCCC6CCCCC8C)) 
    \s_state[4]_i_1 
       (.I0(\Slve_CntValIn_Out_reg[1]_0 [3]),
        .I1(\Slve_CntValIn_Out_reg[1]_0 [4]),
        .I2(\Slve_CntValIn_Out_reg[1]_0 [0]),
        .I3(\Slve_CntValIn_Out_reg[1]_0 [1]),
        .I4(\Slve_CntValIn_Out_reg[1]_0 [2]),
        .I5(\Slve_CntValIn_Out_reg[1]_0 [5]),
        .O(\s_state[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \s_state[5]_i_1 
       (.I0(\Slve_CntValIn_Out_reg[1]_0 [0]),
        .I1(\Slve_CntValIn_Out_reg[1]_0 [1]),
        .I2(delay_change[7]),
        .I3(\pd_count_reg[0]_0 ),
        .I4(\s_state_reg[0]_1 ),
        .I5(\s_state_reg[0]_0 ),
        .O(s_state));
  LUT5 #(
    .INIT(32'h00FFB800)) 
    \s_state[5]_i_2 
       (.I0(\s_state[5]_i_4_n_0 ),
        .I1(\s_state[5]_i_5_n_0 ),
        .I2(\s_state[5]_i_6_n_0 ),
        .I3(\s_state[5]_i_7_n_0 ),
        .I4(\s_state[5]_i_8_n_0 ),
        .O(\s_state[5]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \s_state[5]_i_3 
       (.I0(\Slve_CntValIn_Out_reg[1]_0 [3]),
        .I1(\Slve_CntValIn_Out_reg[1]_0 [2]),
        .O(\pd_count_reg[0]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair159" *) 
  LUT4 #(
    .INIT(16'h4474)) 
    \s_state[5]_i_4 
       (.I0(ActCnt_EQ_BTval),
        .I1(\s_state_reg[0]_1 ),
        .I2(\s_state_reg[0]_0 ),
        .I3(ActCnt_EQ_Zero),
        .O(\s_state[5]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000110020000041)) 
    \s_state[5]_i_5 
       (.I0(\Slve_CntValIn_Out_reg[1]_0 [3]),
        .I1(\Slve_CntValIn_Out_reg[1]_0 [4]),
        .I2(\Slve_CntValIn_Out_reg[1]_0 [0]),
        .I3(\Slve_CntValIn_Out_reg[1]_0 [1]),
        .I4(\Slve_CntValIn_Out_reg[1]_0 [2]),
        .I5(\Slve_CntValIn_Out_reg[1]_0 [5]),
        .O(\s_state[5]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \s_state[5]_i_6 
       (.I0(\Slve_CntValIn_Out_reg[1]_0 [5]),
        .I1(\Slve_CntValIn_Out_reg[1]_0 [3]),
        .I2(\Slve_CntValIn_Out_reg[1]_0 [1]),
        .I3(\Slve_CntValIn_Out_reg[1]_0 [0]),
        .I4(\Slve_CntValIn_Out_reg[1]_0 [2]),
        .I5(\Slve_CntValIn_Out_reg[1]_0 [4]),
        .O(\s_state[5]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFF7FFFF89)) 
    \s_state[5]_i_7 
       (.I0(\Slve_CntValIn_Out_reg[1]_0 [0]),
        .I1(\Slve_CntValIn_Out_reg[1]_0 [1]),
        .I2(\Slve_CntValIn_Out_reg[1]_0 [5]),
        .I3(\Slve_CntValIn_Out_reg[1]_0 [3]),
        .I4(\Slve_CntValIn_Out_reg[1]_0 [2]),
        .I5(\Slve_CntValIn_Out_reg[1]_0 [4]),
        .O(\s_state[5]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair129" *) 
  LUT5 #(
    .INIT(32'h0000001C)) 
    \s_state[5]_i_8 
       (.I0(\Slve_CntValIn_Out_reg[1]_0 [1]),
        .I1(\Slve_CntValIn_Out_reg[1]_0 [5]),
        .I2(\Slve_CntValIn_Out_reg[1]_0 [4]),
        .I3(\Slve_CntValIn_Out_reg[1]_0 [3]),
        .I4(\Slve_CntValIn_Out_reg[1]_0 [2]),
        .O(\s_state[5]_i_8_n_0 ));
  FDRE \s_state_reg[0] 
       (.C(Rx_SysClk),
        .CE(s_state),
        .D(\s_state[0]_i_1_n_0 ),
        .Q(\Slve_CntValIn_Out_reg[1]_0 [0]),
        .R(SR));
  FDRE \s_state_reg[1] 
       (.C(Rx_SysClk),
        .CE(s_state),
        .D(\s_state[1]_i_1_n_0 ),
        .Q(\Slve_CntValIn_Out_reg[1]_0 [1]),
        .R(SR));
  FDRE \s_state_reg[2] 
       (.C(Rx_SysClk),
        .CE(s_state),
        .D(\s_state[2]_i_1_n_0 ),
        .Q(\Slve_CntValIn_Out_reg[1]_0 [2]),
        .R(SR));
  FDRE \s_state_reg[3] 
       (.C(Rx_SysClk),
        .CE(s_state),
        .D(\s_state[3]_i_1_n_0 ),
        .Q(\Slve_CntValIn_Out_reg[1]_0 [3]),
        .R(SR));
  FDRE \s_state_reg[4] 
       (.C(Rx_SysClk),
        .CE(s_state),
        .D(\s_state[4]_i_1_n_0 ),
        .Q(\Slve_CntValIn_Out_reg[1]_0 [4]),
        .R(SR));
  FDRE \s_state_reg[5] 
       (.C(Rx_SysClk),
        .CE(s_state),
        .D(\s_state[5]_i_2_n_0 ),
        .Q(\Slve_CntValIn_Out_reg[1]_0 [5]),
        .R(SR));
  LUT3 #(
    .INIT(8'h56)) 
    \toggle[0]_i_1 
       (.I0(\toggle_reg_n_0_[0] ),
        .I1(\holdreg_reg[1]_1 ),
        .I2(\holdreg_reg[1]_0 ),
        .O(\toggle[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h9D409D9D62229D62)) 
    \toggle[1]_i_1 
       (.I0(\holdreg_reg[1]_1 ),
        .I1(\toggle_reg_n_0_[0] ),
        .I2(\holdreg_reg[1]_0 ),
        .I3(\toggle_reg_n_0_[3] ),
        .I4(\toggle_reg_n_0_[2] ),
        .I5(\toggle_reg_n_0_[1] ),
        .O(\toggle[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0080DD3D3300CCDD)) 
    \toggle[2]_i_1 
       (.I0(\toggle_reg_n_0_[3] ),
        .I1(\toggle_reg_n_0_[1] ),
        .I2(\holdreg_reg[1]_0 ),
        .I3(\holdreg_reg[1]_1 ),
        .I4(\toggle_reg_n_0_[2] ),
        .I5(\toggle_reg_n_0_[0] ),
        .O(\toggle[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h090C2C2C20309090)) 
    \toggle[3]_i_1 
       (.I0(\holdreg_reg[1]_1 ),
        .I1(\toggle_reg_n_0_[3] ),
        .I2(\toggle_reg_n_0_[2] ),
        .I3(\holdreg_reg[1]_0 ),
        .I4(\toggle_reg_n_0_[0] ),
        .I5(\toggle_reg_n_0_[1] ),
        .O(\toggle[3]_i_1_n_0 ));
  FDRE \toggle_reg[0] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(\toggle[0]_i_1_n_0 ),
        .Q(\toggle_reg_n_0_[0] ),
        .R(SR));
  FDRE \toggle_reg[1] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(\toggle[1]_i_1_n_0 ),
        .Q(\toggle_reg_n_0_[1] ),
        .R(SR));
  FDRE \toggle_reg[2] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(\toggle[2]_i_1_n_0 ),
        .Q(\toggle_reg_n_0_[2] ),
        .R(SR));
  FDRE \toggle_reg[3] 
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(\toggle[3]_i_1_n_0 ),
        .Q(\toggle_reg_n_0_[3] ),
        .R(SR));
endmodule

(* ORIG_REF_NAME = "design_1_gig_ethernet_pcs_pma_0_0_sgmii_adapt" *) 
module design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_sgmii_adapt
   (sgmii_clk_r_0,
    sgmii_clk_en,
    gmii_rxd_0,
    gmii_rx_dv_0,
    gmii_rx_er_0,
    gmii_txd_out,
    gmii_tx_en_out,
    gmii_tx_er_out,
    sgmii_clk_f_0,
    Tx_WrClk,
    mgt_tx_reset,
    speed_is_10_100_0,
    speed_is_100_0,
    gmii_rxd,
    gmii_rx_dv,
    gmii_rx_er_in,
    gmii_txd_0,
    gmii_tx_en_0,
    gmii_tx_er_0);
  output sgmii_clk_r_0;
  output sgmii_clk_en;
  output [7:0]gmii_rxd_0;
  output gmii_rx_dv_0;
  output gmii_rx_er_0;
  output [7:0]gmii_txd_out;
  output gmii_tx_en_out;
  output gmii_tx_er_out;
  output sgmii_clk_f_0;
  input Tx_WrClk;
  input mgt_tx_reset;
  input speed_is_10_100_0;
  input speed_is_100_0;
  input [7:0]gmii_rxd;
  input gmii_rx_dv;
  input gmii_rx_er_in;
  input [7:0]gmii_txd_0;
  input gmii_tx_en_0;
  input gmii_tx_er_0;

  wire Tx_WrClk;
  wire gmii_rx_dv;
  wire gmii_rx_dv_0;
  wire gmii_rx_er_0;
  wire gmii_rx_er_in;
  wire [7:0]gmii_rxd;
  wire [7:0]gmii_rxd_0;
  wire gmii_tx_en_0;
  wire gmii_tx_en_out;
  wire gmii_tx_er_0;
  wire gmii_tx_er_out;
  wire [7:0]gmii_txd_0;
  wire [7:0]gmii_txd_out;
  wire mgt_tx_reset;
  wire sgmii_clk_en;
  wire sgmii_clk_f_0;
  wire sgmii_clk_r_0;
  wire speed_is_100_0;
  wire speed_is_100_resync;
  wire speed_is_10_100_0;
  wire speed_is_10_100_resync;
  wire sync_reset;

  design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_clk_gen clock_generation
       (.Tx_WrClk(Tx_WrClk),
        .data_out(speed_is_100_resync),
        .data_sync_reg6(speed_is_10_100_resync),
        .reset_out(sync_reset),
        .sgmii_clk_en_0(sgmii_clk_en),
        .sgmii_clk_f_0(sgmii_clk_f_0),
        .sgmii_clk_r_0(sgmii_clk_r_0));
  design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_reset_sync_0 gen_sync_reset
       (.Tx_WrClk(Tx_WrClk),
        .mgt_tx_reset(mgt_tx_reset),
        .reset_out(sync_reset));
  design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_rx_rate_adapt receiver
       (.Tx_WrClk(Tx_WrClk),
        .gmii_rx_dv(gmii_rx_dv),
        .gmii_rx_dv_0(gmii_rx_dv_0),
        .gmii_rx_er_0(gmii_rx_er_0),
        .gmii_rx_er_in(gmii_rx_er_in),
        .gmii_rxd(gmii_rxd),
        .gmii_rxd_0(gmii_rxd_0),
        .reset_out(sync_reset),
        .sgmii_clk_en_reg(sgmii_clk_en));
  design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_sync_block resync_speed_100
       (.Tx_WrClk(Tx_WrClk),
        .data_out(speed_is_100_resync),
        .speed_is_100_0(speed_is_100_0));
  design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_sync_block_1 resync_speed_10_100
       (.Tx_WrClk(Tx_WrClk),
        .data_out(speed_is_10_100_resync),
        .speed_is_10_100_0(speed_is_10_100_0));
  design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_tx_rate_adapt transmitter
       (.E(sgmii_clk_en),
        .Tx_WrClk(Tx_WrClk),
        .gmii_tx_en_0(gmii_tx_en_0),
        .gmii_tx_en_out(gmii_tx_en_out),
        .gmii_tx_er_0(gmii_tx_er_0),
        .gmii_tx_er_out(gmii_tx_er_out),
        .gmii_txd_0(gmii_txd_0),
        .gmii_txd_out(gmii_txd_out),
        .reset_out(sync_reset));
endmodule

(* DowngradeIPIdentifiedWarnings = "yes" *) (* EXAMPLE_SIMULATION = "0" *) (* ORIG_REF_NAME = "design_1_gig_ethernet_pcs_pma_0_0_support" *) 
module design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_support
   (txp_0,
    txn_0,
    rxp_0,
    rxn_0,
    signal_detect_0,
    gmii_txd_0,
    gmii_tx_en_0,
    gmii_tx_er_0,
    gmii_rxd_0,
    gmii_rx_dv_0,
    gmii_rx_er_0,
    gmii_isolate_0,
    sgmii_clk_r_0,
    sgmii_clk_f_0,
    sgmii_clk_en_0,
    speed_is_10_100_0,
    speed_is_100_0,
    an_interrupt_0,
    an_adv_config_vector_0,
    an_adv_config_val_0,
    an_restart_config_0,
    status_vector_0,
    ext_mdc_0,
    ext_mdio_i_0,
    ext_mdio_o_0,
    ext_mdio_t_0,
    mdio_t_in_0,
    mdc_0,
    mdio_i_0,
    mdio_o_0,
    mdio_t_0,
    phyaddr_0,
    configuration_vector_0,
    configuration_valid_0,
    refclk625_p,
    refclk625_n,
    clk125_out,
    clk312_out,
    rst_125_out,
    tx_logic_reset,
    rx_logic_reset,
    rx_locked,
    tx_locked,
    tx_bsc_rst_out,
    rx_bsc_rst_out,
    tx_bs_rst_out,
    rx_bs_rst_out,
    tx_rst_dly_out,
    rx_rst_dly_out,
    tx_bsc_en_vtc_out,
    rx_bsc_en_vtc_out,
    tx_bs_en_vtc_out,
    rx_bs_en_vtc_out,
    riu_clk_out,
    riu_addr_out,
    riu_wr_data_out,
    riu_wr_en_out,
    riu_nibble_sel_out,
    tx_pll_clk_out,
    rx_pll_clk_out,
    tx_rdclk_out,
    riu_rddata_3,
    riu_valid_3,
    riu_prsnt_3,
    riu_rddata_2,
    riu_valid_2,
    riu_prsnt_2,
    riu_rddata_1,
    riu_valid_1,
    riu_prsnt_1,
    rx_btval_3,
    rx_btval_2,
    rx_btval_1,
    tx_dly_rdy_1,
    rx_dly_rdy_1,
    rx_vtc_rdy_1,
    tx_vtc_rdy_1,
    tx_dly_rdy_2,
    rx_dly_rdy_2,
    rx_vtc_rdy_2,
    tx_vtc_rdy_2,
    tx_dly_rdy_3,
    rx_dly_rdy_3,
    rx_vtc_rdy_3,
    tx_vtc_rdy_3,
    reset);
  output txp_0;
  output txn_0;
  input rxp_0;
  input rxn_0;
  input signal_detect_0;
  input [7:0]gmii_txd_0;
  input gmii_tx_en_0;
  input gmii_tx_er_0;
  output [7:0]gmii_rxd_0;
  output gmii_rx_dv_0;
  output gmii_rx_er_0;
  output gmii_isolate_0;
  output sgmii_clk_r_0;
  output sgmii_clk_f_0;
  output sgmii_clk_en_0;
  input speed_is_10_100_0;
  input speed_is_100_0;
  output an_interrupt_0;
  input [15:0]an_adv_config_vector_0;
  input an_adv_config_val_0;
  input an_restart_config_0;
  output [15:0]status_vector_0;
  output ext_mdc_0;
  input ext_mdio_i_0;
  output ext_mdio_o_0;
  output ext_mdio_t_0;
  input mdio_t_in_0;
  input mdc_0;
  input mdio_i_0;
  output mdio_o_0;
  output mdio_t_0;
  input [4:0]phyaddr_0;
  input [4:0]configuration_vector_0;
  input configuration_valid_0;
  input refclk625_p;
  input refclk625_n;
  output clk125_out;
  output clk312_out;
  output rst_125_out;
  output tx_logic_reset;
  output rx_logic_reset;
  output rx_locked;
  output tx_locked;
  output tx_bsc_rst_out;
  output rx_bsc_rst_out;
  output tx_bs_rst_out;
  output rx_bs_rst_out;
  output tx_rst_dly_out;
  output rx_rst_dly_out;
  output tx_bsc_en_vtc_out;
  output rx_bsc_en_vtc_out;
  output tx_bs_en_vtc_out;
  output rx_bs_en_vtc_out;
  output riu_clk_out;
  output [5:0]riu_addr_out;
  output [15:0]riu_wr_data_out;
  output riu_wr_en_out;
  output [1:0]riu_nibble_sel_out;
  output tx_pll_clk_out;
  output rx_pll_clk_out;
  output tx_rdclk_out;
  input [15:0]riu_rddata_3;
  input riu_valid_3;
  input riu_prsnt_3;
  input [15:0]riu_rddata_2;
  input riu_valid_2;
  input riu_prsnt_2;
  input [15:0]riu_rddata_1;
  input riu_valid_1;
  input riu_prsnt_1;
  output [8:0]rx_btval_3;
  output [8:0]rx_btval_2;
  output [8:0]rx_btval_1;
  input tx_dly_rdy_1;
  input rx_dly_rdy_1;
  input rx_vtc_rdy_1;
  input tx_vtc_rdy_1;
  input tx_dly_rdy_2;
  input rx_dly_rdy_2;
  input rx_vtc_rdy_2;
  input tx_vtc_rdy_2;
  input tx_dly_rdy_3;
  input rx_dly_rdy_3;
  input rx_vtc_rdy_3;
  input tx_vtc_rdy_3;
  input reset;

  wire \<const0> ;
  wire an_interrupt_0;
  wire an_restart_config_0;
  wire clk125_out;
  wire clk312_out;
  wire configuration_valid_0;
  wire [4:0]configuration_vector_0;
  wire ext_mdio_i_0;
  wire gmii_isolate_0;
  wire gmii_rx_dv_0;
  wire gmii_rx_er_0;
  wire [7:0]gmii_rxd_0;
  wire gmii_tx_en_0;
  wire gmii_tx_er_0;
  wire [7:0]gmii_txd_0;
  wire mdc_0;
  wire mdio_i_0;
  wire mdio_o_0;
  wire mdio_t_0;
  wire mdio_t_in_0;
  wire [4:0]phyaddr_0;
  wire refclk625_n;
  wire refclk625_p;
  wire reset;
  wire [5:0]riu_addr_out;
  wire riu_clk_out;
  wire [1:0]riu_nibble_sel_out;
  wire riu_prsnt;
  wire riu_prsnt_1;
  wire riu_prsnt_2;
  wire riu_prsnt_3;
  wire [15:0]riu_rd_data;
  wire [15:0]riu_rddata_1;
  wire [15:0]riu_rddata_2;
  wire [15:0]riu_rddata_3;
  wire riu_valid;
  wire riu_valid_1;
  wire riu_valid_2;
  wire riu_valid_3;
  wire [15:0]riu_wr_data_out;
  wire riu_wr_en_out;
  wire rst_125_out;
  wire rx_bs_en_vtc_out;
  wire rx_bs_rst_out;
  wire rx_bsc_en_vtc_out;
  wire rx_bsc_rst_out;
  wire [8:0]rx_btval;
  wire [8:0]rx_btval_1;
  wire [8:0]rx_btval_2;
  wire [8:0]rx_btval_3;
  wire rx_dly_rdy;
  wire rx_dly_rdy_1;
  wire rx_dly_rdy_2;
  wire rx_dly_rdy_3;
  wire rx_locked;
  wire rx_logic_reset;
  wire rx_pll_clk_out;
  wire rx_rst_dly_out;
  wire rx_vtc_rdy;
  wire rx_vtc_rdy_1;
  wire rx_vtc_rdy_2;
  wire rx_vtc_rdy_3;
  wire rxn_0;
  wire rxp_0;
  wire sgmii_clk_en_0;
  wire sgmii_clk_f_0;
  wire sgmii_clk_r_0;
  wire signal_detect_0;
  wire speed_is_100_0;
  wire speed_is_10_100_0;
  wire [13:0]\^status_vector_0 ;
  wire tx_bs_en_vtc_out;
  wire tx_bs_rst_out;
  wire tx_bsc_en_vtc_out;
  wire tx_bsc_rst_out;
  wire tx_dly_rdy;
  wire tx_dly_rdy_1;
  wire tx_dly_rdy_2;
  wire tx_dly_rdy_3;
  wire tx_locked;
  wire tx_logic_reset;
  wire tx_pll_clk_out;
  wire tx_rdclk_out;
  wire tx_rst_dly_out;
  wire tx_vtc_rdy;
  wire tx_vtc_rdy_1;
  wire tx_vtc_rdy_2;
  wire tx_vtc_rdy_3;
  wire txn_0;
  wire txp_0;
  wire NLW_clock_reset_i_ClockIn_se_out_UNCONNECTED;
  wire [7:0]NLW_clock_reset_i_Debug_Out_UNCONNECTED;

  assign ext_mdc_0 = mdc_0;
  assign ext_mdio_o_0 = mdio_i_0;
  assign ext_mdio_t_0 = mdio_t_in_0;
  assign status_vector_0[15] = \<const0> ;
  assign status_vector_0[14] = \<const0> ;
  assign status_vector_0[13:9] = \^status_vector_0 [13:9];
  assign status_vector_0[8] = \<const0> ;
  assign status_vector_0[7:0] = \^status_vector_0 [7:0];
  GND GND
       (.G(\<const0> ));
  (* C_IoBank = "44" *) 
  (* C_Part = "XCKU060" *) 
  (* DONT_TOUCH *) 
  (* EXAMPLE_SIMULATION = "0" *) 
  design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_Clock_Reset clock_reset_i
       (.ClockIn_n(refclk625_n),
        .ClockIn_p(refclk625_p),
        .ClockIn_se_out(NLW_clock_reset_i_ClockIn_se_out_UNCONNECTED),
        .Debug_Out(NLW_clock_reset_i_Debug_Out_UNCONNECTED[7:0]),
        .ResetIn(reset),
        .Riu_Addr(riu_addr_out),
        .Riu_Nibble_Sel(riu_nibble_sel_out),
        .Riu_Prsnt_0(riu_prsnt),
        .Riu_Prsnt_1(riu_prsnt_1),
        .Riu_Prsnt_2(riu_prsnt_2),
        .Riu_Prsnt_3(riu_prsnt_3),
        .Riu_RdData_0(riu_rd_data),
        .Riu_RdData_1(riu_rddata_1),
        .Riu_RdData_2(riu_rddata_2),
        .Riu_RdData_3(riu_rddata_3),
        .Riu_Valid_0(riu_valid),
        .Riu_Valid_1(riu_valid_1),
        .Riu_Valid_2(riu_valid_2),
        .Riu_Valid_3(riu_valid_3),
        .Riu_WrData(riu_wr_data_out),
        .Riu_Wr_En(riu_wr_en_out),
        .Rx_Bs_EnVtc(rx_bs_en_vtc_out),
        .Rx_Bs_Rst(rx_bs_rst_out),
        .Rx_Bs_RstDly(rx_rst_dly_out),
        .Rx_Bsc_EnVtc(rx_bsc_en_vtc_out),
        .Rx_Bsc_Rst(rx_bsc_rst_out),
        .Rx_BtVal_0(rx_btval),
        .Rx_BtVal_1(rx_btval_1),
        .Rx_BtVal_2(rx_btval_2),
        .Rx_BtVal_3(rx_btval_3),
        .Rx_ClkOutPhy(rx_pll_clk_out),
        .Rx_Dly_Rdy(rx_dly_rdy),
        .Rx_Locked(rx_locked),
        .Rx_LogicRst(rx_logic_reset),
        .Rx_RiuClk(riu_clk_out),
        .Rx_SysClk(clk312_out),
        .Rx_Vtc_Rdy(rx_vtc_rdy),
        .Tx_Bs_EnVtc(tx_bs_en_vtc_out),
        .Tx_Bs_Rst(tx_bs_rst_out),
        .Tx_Bs_RstDly(tx_rst_dly_out),
        .Tx_Bsc_EnVtc(tx_bsc_en_vtc_out),
        .Tx_Bsc_Rst(tx_bsc_rst_out),
        .Tx_ClkOutPhy(tx_pll_clk_out),
        .Tx_Dly_Rdy(tx_dly_rdy),
        .Tx_Locked(tx_locked),
        .Tx_LogicRst(tx_logic_reset),
        .Tx_SysClk(tx_rdclk_out),
        .Tx_Vtc_Rdy(tx_vtc_rdy),
        .Tx_WrClk(clk125_out));
  design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_block pcs_pma_block_i
       (.CLK(tx_rdclk_out),
        .D(rx_btval[8:3]),
        .Rx_Dly_Rdy(rx_dly_rdy),
        .Rx_SysClk(clk312_out),
        .Rx_Vtc_Rdy(rx_vtc_rdy),
        .Tx_Dly_Rdy(tx_dly_rdy),
        .Tx_Vtc_Rdy(tx_vtc_rdy),
        .Tx_WrClk(clk125_out),
        .an_interrupt_0(an_interrupt_0),
        .an_restart_config_0(an_restart_config_0),
        .configuration_valid_0(configuration_valid_0),
        .configuration_vector_0(configuration_vector_0),
        .ext_mdio_i_0(ext_mdio_i_0),
        .gmii_isolate_0(gmii_isolate_0),
        .gmii_rx_dv_0(gmii_rx_dv_0),
        .gmii_rx_er_0(gmii_rx_er_0),
        .gmii_rxd_0(gmii_rxd_0),
        .gmii_tx_en_0(gmii_tx_en_0),
        .gmii_tx_er_0(gmii_tx_er_0),
        .gmii_txd_0(gmii_txd_0),
        .mdc_0(mdc_0),
        .mdio_i_0(mdio_i_0),
        .mdio_o_0(mdio_o_0),
        .mdio_t_0(mdio_t_0),
        .phyaddr_0(phyaddr_0),
        .reset_out(rst_125_out),
        .riu_addr_out(riu_addr_out),
        .riu_clk_out(riu_clk_out),
        .riu_nibble_sel_out(riu_nibble_sel_out),
        .riu_prsnt(riu_prsnt),
        .riu_rd_data(riu_rd_data),
        .riu_valid(riu_valid),
        .riu_wr_data_out(riu_wr_data_out),
        .riu_wr_en_out(riu_wr_en_out),
        .rx_bs_en_vtc_out(rx_bs_en_vtc_out),
        .rx_bs_rst_out(rx_bs_rst_out),
        .rx_bsc_en_vtc_out(rx_bsc_en_vtc_out),
        .rx_bsc_rst_out(rx_bsc_rst_out),
        .rx_dly_rdy_1(rx_dly_rdy_1),
        .rx_dly_rdy_2(rx_dly_rdy_2),
        .rx_dly_rdy_3(rx_dly_rdy_3),
        .rx_pll_clk_out(rx_pll_clk_out),
        .rx_rst_dly_out(rx_rst_dly_out),
        .rx_vtc_rdy_1(rx_vtc_rdy_1),
        .rx_vtc_rdy_2(rx_vtc_rdy_2),
        .rx_vtc_rdy_3(rx_vtc_rdy_3),
        .rxn_0(rxn_0),
        .rxp_0(rxp_0),
        .sgmii_clk_en_0(sgmii_clk_en_0),
        .sgmii_clk_f_0(sgmii_clk_f_0),
        .sgmii_clk_r_0(sgmii_clk_r_0),
        .signal_detect_0(signal_detect_0),
        .speed_is_100_0(speed_is_100_0),
        .speed_is_10_100_0(speed_is_10_100_0),
        .status_vector_0({\^status_vector_0 [13:9],\^status_vector_0 [7:0]}),
        .tx_bs_en_vtc_out(tx_bs_en_vtc_out),
        .tx_bs_rst_out(tx_bs_rst_out),
        .tx_bsc_en_vtc_out(tx_bsc_en_vtc_out),
        .tx_bsc_rst_out(tx_bsc_rst_out),
        .tx_dly_rdy_1(tx_dly_rdy_1),
        .tx_dly_rdy_2(tx_dly_rdy_2),
        .tx_dly_rdy_3(tx_dly_rdy_3),
        .tx_pll_clk_out(tx_pll_clk_out),
        .tx_rst_dly_out(tx_rst_dly_out),
        .tx_vtc_rdy_1(tx_vtc_rdy_1),
        .tx_vtc_rdy_2(tx_vtc_rdy_2),
        .tx_vtc_rdy_3(tx_vtc_rdy_3),
        .txn_0(txn_0),
        .txp_0(txp_0));
  design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_reset_sync reset_sync_clk125_i
       (.Tx_WrClk(clk125_out),
        .rst_125_out(rst_125_out),
        .rx_logic_reset(rx_logic_reset),
        .tx_logic_reset(tx_logic_reset));
endmodule

(* ORIG_REF_NAME = "design_1_gig_ethernet_pcs_pma_0_0_sync_block" *) 
module design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_sync_block
   (data_out,
    speed_is_100_0,
    Tx_WrClk);
  output data_out;
  input speed_is_100_0;
  input Tx_WrClk;

  wire Tx_WrClk;
  wire data_out;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;
  wire speed_is_100_0;

  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg1
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(speed_is_100_0),
        .Q(data_sync1),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg2
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg3
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg4
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg5
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg6
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(data_sync5),
        .Q(data_out),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "design_1_gig_ethernet_pcs_pma_0_0_sync_block" *) 
module design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_sync_block_1
   (data_out,
    speed_is_10_100_0,
    Tx_WrClk);
  output data_out;
  input speed_is_10_100_0;
  input Tx_WrClk;

  wire Tx_WrClk;
  wire data_out;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;
  wire speed_is_10_100_0;

  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg1
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(speed_is_10_100_0),
        .Q(data_sync1),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg2
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg3
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg4
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg5
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg6
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(data_sync5),
        .Q(data_out),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "design_1_gig_ethernet_pcs_pma_0_0_sync_block" *) 
module design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_sync_block_10
   (S,
    data_out,
    Q,
    data_sync_reg6_0,
    data_sync_reg6_1,
    data_sync_reg6_2,
    data_sync_reg6_3,
    \rd_addr_gray_reg[3] ,
    Rx_SysClk);
  output [0:0]S;
  output data_out;
  input [0:0]Q;
  input data_sync_reg6_0;
  input data_sync_reg6_1;
  input data_sync_reg6_2;
  input data_sync_reg6_3;
  input [0:0]\rd_addr_gray_reg[3] ;
  input Rx_SysClk;

  wire [0:0]Q;
  wire Rx_SysClk;
  wire [0:0]S;
  wire data_out;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;
  wire data_sync_reg6_0;
  wire data_sync_reg6_1;
  wire data_sync_reg6_2;
  wire data_sync_reg6_3;
  wire [0:0]\rd_addr_gray_reg[3] ;

  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg1
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(\rd_addr_gray_reg[3] ),
        .Q(data_sync1),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg2
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg3
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg4
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg5
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg6
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(data_sync5),
        .Q(data_out),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h9669699669969669)) 
    wr_occupancy0_carry_i_5
       (.I0(Q),
        .I1(data_out),
        .I2(data_sync_reg6_0),
        .I3(data_sync_reg6_1),
        .I4(data_sync_reg6_2),
        .I5(data_sync_reg6_3),
        .O(S));
endmodule

(* ORIG_REF_NAME = "design_1_gig_ethernet_pcs_pma_0_0_sync_block" *) 
module design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_sync_block_11
   (S,
    data_out,
    Q,
    data_sync_reg6_0,
    data_sync_reg6_1,
    data_sync_reg6_2,
    \rd_addr_gray_reg[4] ,
    Rx_SysClk);
  output [0:0]S;
  output data_out;
  input [0:0]Q;
  input data_sync_reg6_0;
  input data_sync_reg6_1;
  input data_sync_reg6_2;
  input [0:0]\rd_addr_gray_reg[4] ;
  input Rx_SysClk;

  wire [0:0]Q;
  wire Rx_SysClk;
  wire [0:0]S;
  wire data_out;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;
  wire data_sync_reg6_0;
  wire data_sync_reg6_1;
  wire data_sync_reg6_2;
  wire [0:0]\rd_addr_gray_reg[4] ;

  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg1
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(\rd_addr_gray_reg[4] ),
        .Q(data_sync1),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg2
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg3
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg4
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg5
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg6
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(data_sync5),
        .Q(data_out),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h69969669)) 
    wr_occupancy0_carry_i_4
       (.I0(Q),
        .I1(data_out),
        .I2(data_sync_reg6_0),
        .I3(data_sync_reg6_1),
        .I4(data_sync_reg6_2),
        .O(S));
endmodule

(* ORIG_REF_NAME = "design_1_gig_ethernet_pcs_pma_0_0_sync_block" *) 
module design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_sync_block_12
   (S,
    data_out,
    Q,
    data_sync_reg6_0,
    data_sync_reg6_1,
    \rd_addr_gray_reg[5] ,
    Rx_SysClk);
  output [0:0]S;
  output data_out;
  input [0:0]Q;
  input data_sync_reg6_0;
  input data_sync_reg6_1;
  input [0:0]\rd_addr_gray_reg[5] ;
  input Rx_SysClk;

  wire [0:0]Q;
  wire Rx_SysClk;
  wire [0:0]S;
  wire data_out;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;
  wire data_sync_reg6_0;
  wire data_sync_reg6_1;
  wire [0:0]\rd_addr_gray_reg[5] ;

  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg1
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(\rd_addr_gray_reg[5] ),
        .Q(data_sync1),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg2
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg3
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg4
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg5
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg6
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(data_sync5),
        .Q(data_out),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h9669)) 
    wr_occupancy0_carry_i_3
       (.I0(Q),
        .I1(data_out),
        .I2(data_sync_reg6_0),
        .I3(data_sync_reg6_1),
        .O(S));
endmodule

(* ORIG_REF_NAME = "design_1_gig_ethernet_pcs_pma_0_0_sync_block" *) 
module design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_sync_block_13
   (S,
    data_out,
    Q,
    data_sync_reg6_0,
    data_in,
    Rx_SysClk);
  output [1:0]S;
  output data_out;
  input [1:0]Q;
  input data_sync_reg6_0;
  input data_in;
  input Rx_SysClk;

  wire [1:0]Q;
  wire Rx_SysClk;
  wire [1:0]S;
  wire data_in;
  wire data_out;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;
  wire data_sync_reg6_0;

  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg1
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(data_in),
        .Q(data_sync1),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg2
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg3
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg4
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg5
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg6
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(data_sync5),
        .Q(data_out),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h9)) 
    wr_occupancy0_carry_i_1
       (.I0(Q[1]),
        .I1(data_out),
        .O(S[1]));
  LUT3 #(
    .INIT(8'h69)) 
    wr_occupancy0_carry_i_2
       (.I0(Q[0]),
        .I1(data_out),
        .I2(data_sync_reg6_0),
        .O(S[0]));
endmodule

(* ORIG_REF_NAME = "design_1_gig_ethernet_pcs_pma_0_0_sync_block" *) 
module design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_sync_block_14
   (data_out,
    Q,
    Tx_WrClk);
  output data_out;
  input [0:0]Q;
  input Tx_WrClk;

  wire [0:0]Q;
  wire Tx_WrClk;
  wire data_out;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;

  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg1
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(Q),
        .Q(data_sync1),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg2
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg3
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg4
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg5
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg6
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(data_sync5),
        .Q(data_out),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "design_1_gig_ethernet_pcs_pma_0_0_sync_block" *) 
module design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_sync_block_15
   (S,
    \rd_occupancy_reg[6] ,
    rd_wr_addr,
    Q,
    data_out,
    \wr_addr_gray_reg[1] ,
    Tx_WrClk);
  output [1:0]S;
  output \rd_occupancy_reg[6] ;
  input [0:0]rd_wr_addr;
  input [1:0]Q;
  input data_out;
  input [0:0]\wr_addr_gray_reg[1] ;
  input Tx_WrClk;

  wire [1:0]Q;
  wire [1:0]S;
  wire Tx_WrClk;
  wire data_out;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;
  wire \rd_occupancy_reg[6] ;
  wire [0:0]rd_wr_addr;
  wire [0:0]\wr_addr_gray_reg[1] ;

  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg1
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(\wr_addr_gray_reg[1] ),
        .Q(data_sync1),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg2
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg3
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg4
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg5
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg6
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(data_sync5),
        .Q(\rd_occupancy_reg[6] ),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h9)) 
    rd_occupancy0_carry_i_12
       (.I0(rd_wr_addr),
        .I1(Q[1]),
        .O(S[1]));
  LUT3 #(
    .INIT(8'h69)) 
    rd_occupancy0_carry_i_13
       (.I0(rd_wr_addr),
        .I1(data_out),
        .I2(Q[0]),
        .O(S[0]));
endmodule

(* ORIG_REF_NAME = "design_1_gig_ethernet_pcs_pma_0_0_sync_block" *) 
module design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_sync_block_16
   (data_out,
    Q,
    Tx_WrClk);
  output data_out;
  input [0:0]Q;
  input Tx_WrClk;

  wire [0:0]Q;
  wire Tx_WrClk;
  wire data_out;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;

  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg1
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(Q),
        .Q(data_sync1),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg2
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg3
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg4
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg5
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg6
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(data_sync5),
        .Q(data_out),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "design_1_gig_ethernet_pcs_pma_0_0_sync_block" *) 
module design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_sync_block_17
   (S,
    data_out,
    data_sync_reg6_0,
    data_sync_reg6_1,
    data_sync_reg6_2,
    data_sync_reg6_3,
    Q,
    \wr_addr_gray_reg[3] ,
    Tx_WrClk);
  output [0:0]S;
  output data_out;
  input data_sync_reg6_0;
  input data_sync_reg6_1;
  input data_sync_reg6_2;
  input data_sync_reg6_3;
  input [0:0]Q;
  input [0:0]\wr_addr_gray_reg[3] ;
  input Tx_WrClk;

  wire [0:0]Q;
  wire [0:0]S;
  wire Tx_WrClk;
  wire data_out;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;
  wire data_sync_reg6_0;
  wire data_sync_reg6_1;
  wire data_sync_reg6_2;
  wire data_sync_reg6_3;
  wire [0:0]\wr_addr_gray_reg[3] ;

  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg1
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(\wr_addr_gray_reg[3] ),
        .Q(data_sync1),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg2
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg3
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg4
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg5
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg6
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(data_sync5),
        .Q(data_out),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h9669699669969669)) 
    rd_occupancy0_carry_i_11
       (.I0(data_out),
        .I1(data_sync_reg6_0),
        .I2(data_sync_reg6_1),
        .I3(data_sync_reg6_2),
        .I4(data_sync_reg6_3),
        .I5(Q),
        .O(S));
endmodule

(* ORIG_REF_NAME = "design_1_gig_ethernet_pcs_pma_0_0_sync_block" *) 
module design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_sync_block_18
   (S,
    data_out,
    data_sync_reg6_0,
    data_sync_reg6_1,
    data_sync_reg6_2,
    Q,
    \wr_addr_gray_reg[4] ,
    Tx_WrClk);
  output [0:0]S;
  output data_out;
  input data_sync_reg6_0;
  input data_sync_reg6_1;
  input data_sync_reg6_2;
  input [0:0]Q;
  input [0:0]\wr_addr_gray_reg[4] ;
  input Tx_WrClk;

  wire [0:0]Q;
  wire [0:0]S;
  wire Tx_WrClk;
  wire data_out;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;
  wire data_sync_reg6_0;
  wire data_sync_reg6_1;
  wire data_sync_reg6_2;
  wire [0:0]\wr_addr_gray_reg[4] ;

  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg1
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(\wr_addr_gray_reg[4] ),
        .Q(data_sync1),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg2
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg3
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg4
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg5
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg6
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(data_sync5),
        .Q(data_out),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h69969669)) 
    rd_occupancy0_carry_i_10
       (.I0(data_out),
        .I1(data_sync_reg6_0),
        .I2(data_sync_reg6_1),
        .I3(data_sync_reg6_2),
        .I4(Q),
        .O(S));
endmodule

(* ORIG_REF_NAME = "design_1_gig_ethernet_pcs_pma_0_0_sync_block" *) 
module design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_sync_block_19
   (S,
    data_out,
    data_sync_reg6_0,
    data_sync_reg6_1,
    Q,
    \wr_addr_gray_reg[5] ,
    Tx_WrClk);
  output [0:0]S;
  output data_out;
  input data_sync_reg6_0;
  input data_sync_reg6_1;
  input [0:0]Q;
  input [0:0]\wr_addr_gray_reg[5] ;
  input Tx_WrClk;

  wire [0:0]Q;
  wire [0:0]S;
  wire Tx_WrClk;
  wire data_out;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;
  wire data_sync_reg6_0;
  wire data_sync_reg6_1;
  wire [0:0]\wr_addr_gray_reg[5] ;

  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg1
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(\wr_addr_gray_reg[5] ),
        .Q(data_sync1),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg2
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg3
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg4
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg5
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg6
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(data_sync5),
        .Q(data_out),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h9669)) 
    rd_occupancy0_carry_i_9
       (.I0(data_out),
        .I1(data_sync_reg6_0),
        .I2(data_sync_reg6_1),
        .I3(Q),
        .O(S));
endmodule

(* ORIG_REF_NAME = "design_1_gig_ethernet_pcs_pma_0_0_sync_block" *) 
module design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_sync_block_20
   (S,
    data_out,
    data_sync_reg6_0,
    Q,
    \wr_addr_gray_reg[6] ,
    Tx_WrClk);
  output [1:0]S;
  output data_out;
  input data_sync_reg6_0;
  input [1:0]Q;
  input [0:0]\wr_addr_gray_reg[6] ;
  input Tx_WrClk;

  wire [1:0]Q;
  wire [1:0]S;
  wire Tx_WrClk;
  wire data_out;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;
  wire data_sync_reg6_0;
  wire [0:0]\wr_addr_gray_reg[6] ;

  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg1
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(\wr_addr_gray_reg[6] ),
        .Q(data_sync1),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg2
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg3
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg4
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg5
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg6
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(data_sync5),
        .Q(data_out),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h9)) 
    rd_occupancy0_carry_i_7
       (.I0(data_out),
        .I1(Q[1]),
        .O(S[1]));
  LUT3 #(
    .INIT(8'h69)) 
    rd_occupancy0_carry_i_8
       (.I0(data_out),
        .I1(data_sync_reg6_0),
        .I2(Q[0]),
        .O(S[0]));
endmodule

(* ORIG_REF_NAME = "design_1_gig_ethernet_pcs_pma_0_0_sync_block" *) 
module design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_sync_block_21
   (data_out,
    initialize_ram_complete_reg,
    Tx_WrClk);
  output data_out;
  input initialize_ram_complete_reg;
  input Tx_WrClk;

  wire Tx_WrClk;
  wire data_out;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;
  wire initialize_ram_complete_reg;

  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg1
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(initialize_ram_complete_reg),
        .Q(data_sync1),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg2
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg3
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg4
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg5
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg6
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(data_sync5),
        .Q(data_out),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "design_1_gig_ethernet_pcs_pma_0_0_sync_block" *) 
module design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_sync_block_7
   (data_out,
    Q,
    Rx_SysClk);
  output data_out;
  input [0:0]Q;
  input Rx_SysClk;

  wire [0:0]Q;
  wire Rx_SysClk;
  wire data_out;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;

  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg1
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(Q),
        .Q(data_sync1),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg2
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg3
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg4
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg5
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg6
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(data_sync5),
        .Q(data_out),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "design_1_gig_ethernet_pcs_pma_0_0_sync_block" *) 
module design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_sync_block_8
   (S,
    Q,
    data_out,
    data_sync_reg6_0,
    data_sync_reg6_1,
    data_sync_reg6_2,
    data_sync_reg6_3,
    data_sync_reg6_4,
    \rd_addr_gray_reg[1] ,
    Rx_SysClk);
  output [1:0]S;
  input [1:0]Q;
  input data_out;
  input data_sync_reg6_0;
  input data_sync_reg6_1;
  input data_sync_reg6_2;
  input data_sync_reg6_3;
  input data_sync_reg6_4;
  input [0:0]\rd_addr_gray_reg[1] ;
  input Rx_SysClk;

  wire [1:0]Q;
  wire Rx_SysClk;
  wire [1:0]S;
  wire data_out;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;
  wire data_sync_reg6_0;
  wire data_sync_reg6_1;
  wire data_sync_reg6_2;
  wire data_sync_reg6_3;
  wire data_sync_reg6_4;
  wire p_8_in;
  wire [0:0]\rd_addr_gray_reg[1] ;
  wire wr_rd_addr_gray_1;

  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg1
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(\rd_addr_gray_reg[1] ),
        .Q(data_sync1),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg2
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg3
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg4
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg5
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg6
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(data_sync5),
        .Q(wr_rd_addr_gray_1),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h9)) 
    wr_occupancy0_carry_i_6
       (.I0(Q[1]),
        .I1(p_8_in),
        .O(S[1]));
  LUT3 #(
    .INIT(8'h69)) 
    wr_occupancy0_carry_i_7
       (.I0(Q[0]),
        .I1(p_8_in),
        .I2(data_sync_reg6_4),
        .O(S[0]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    wr_occupancy0_carry_i_8
       (.I0(wr_rd_addr_gray_1),
        .I1(data_out),
        .I2(data_sync_reg6_0),
        .I3(data_sync_reg6_1),
        .I4(data_sync_reg6_2),
        .I5(data_sync_reg6_3),
        .O(p_8_in));
endmodule

(* ORIG_REF_NAME = "design_1_gig_ethernet_pcs_pma_0_0_sync_block" *) 
module design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_sync_block_9
   (data_out,
    Q,
    Rx_SysClk);
  output data_out;
  input [0:0]Q;
  input Rx_SysClk;

  wire [0:0]Q;
  wire Rx_SysClk;
  wire data_out;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;

  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg1
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(Q),
        .Q(data_sync1),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg2
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg3
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg4
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg5
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg6
       (.C(Rx_SysClk),
        .CE(1'b1),
        .D(data_sync5),
        .Q(data_out),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "design_1_gig_ethernet_pcs_pma_0_0_tx_rate_adapt" *) 
module design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_tx_rate_adapt
   (gmii_tx_en_out,
    gmii_tx_er_out,
    gmii_txd_out,
    reset_out,
    E,
    gmii_tx_en_0,
    Tx_WrClk,
    gmii_tx_er_0,
    gmii_txd_0);
  output gmii_tx_en_out;
  output gmii_tx_er_out;
  output [7:0]gmii_txd_out;
  input reset_out;
  input [0:0]E;
  input gmii_tx_en_0;
  input Tx_WrClk;
  input gmii_tx_er_0;
  input [7:0]gmii_txd_0;

  wire [0:0]E;
  wire Tx_WrClk;
  wire gmii_tx_en_0;
  wire gmii_tx_en_out;
  wire gmii_tx_er_0;
  wire gmii_tx_er_out;
  wire [7:0]gmii_txd_0;
  wire [7:0]gmii_txd_out;
  wire reset_out;

  FDRE #(
    .INIT(1'b0)) 
    gmii_tx_en_out_reg
       (.C(Tx_WrClk),
        .CE(E),
        .D(gmii_tx_en_0),
        .Q(gmii_tx_en_out),
        .R(reset_out));
  FDRE #(
    .INIT(1'b0)) 
    gmii_tx_er_out_reg
       (.C(Tx_WrClk),
        .CE(E),
        .D(gmii_tx_er_0),
        .Q(gmii_tx_er_out),
        .R(reset_out));
  FDRE #(
    .INIT(1'b0)) 
    \gmii_txd_out_reg[0] 
       (.C(Tx_WrClk),
        .CE(E),
        .D(gmii_txd_0[0]),
        .Q(gmii_txd_out[0]),
        .R(reset_out));
  FDRE #(
    .INIT(1'b0)) 
    \gmii_txd_out_reg[1] 
       (.C(Tx_WrClk),
        .CE(E),
        .D(gmii_txd_0[1]),
        .Q(gmii_txd_out[1]),
        .R(reset_out));
  FDRE #(
    .INIT(1'b0)) 
    \gmii_txd_out_reg[2] 
       (.C(Tx_WrClk),
        .CE(E),
        .D(gmii_txd_0[2]),
        .Q(gmii_txd_out[2]),
        .R(reset_out));
  FDRE #(
    .INIT(1'b0)) 
    \gmii_txd_out_reg[3] 
       (.C(Tx_WrClk),
        .CE(E),
        .D(gmii_txd_0[3]),
        .Q(gmii_txd_out[3]),
        .R(reset_out));
  FDRE #(
    .INIT(1'b0)) 
    \gmii_txd_out_reg[4] 
       (.C(Tx_WrClk),
        .CE(E),
        .D(gmii_txd_0[4]),
        .Q(gmii_txd_out[4]),
        .R(reset_out));
  FDRE #(
    .INIT(1'b0)) 
    \gmii_txd_out_reg[5] 
       (.C(Tx_WrClk),
        .CE(E),
        .D(gmii_txd_0[5]),
        .Q(gmii_txd_out[5]),
        .R(reset_out));
  FDRE #(
    .INIT(1'b0)) 
    \gmii_txd_out_reg[6] 
       (.C(Tx_WrClk),
        .CE(E),
        .D(gmii_txd_0[6]),
        .Q(gmii_txd_out[6]),
        .R(reset_out));
  FDRE #(
    .INIT(1'b0)) 
    \gmii_txd_out_reg[7] 
       (.C(Tx_WrClk),
        .CE(E),
        .D(gmii_txd_0[7]),
        .Q(gmii_txd_out[7]),
        .R(reset_out));
endmodule

(* ORIG_REF_NAME = "design_1_gig_ethernet_pcs_pma_0_0_tx_ten_to_eight" *) 
module design_1_gig_ethernet_pcs_pma_0_0_design_1_gig_ethernet_pcs_pma_0_0_tx_ten_to_eight
   (Q,
    \IntRdEna_Sync_reg[0]_0 ,
    \tx_data_8b_reg[7] ,
    Tx_WrClk,
    tx_data_10b,
    reset_out,
    \IntWrAddr_reg[2]_0 ,
    CLK);
  output [3:0]Q;
  output [0:0]\IntRdEna_Sync_reg[0]_0 ;
  output [7:0]\tx_data_8b_reg[7] ;
  input Tx_WrClk;
  input [9:0]tx_data_10b;
  input reset_out;
  input \IntWrAddr_reg[2]_0 ;
  input CLK;

  wire CLK;
  wire \DataOut[0]_i_1_n_0 ;
  wire \DataOut[0]_i_2_n_0 ;
  wire \DataOut[1]_i_1_n_0 ;
  wire \DataOut[1]_i_2_n_0 ;
  wire \DataOut[2]_i_1_n_0 ;
  wire \DataOut[2]_i_2_n_0 ;
  wire \DataOut[3]_i_1_n_0 ;
  wire \DataOut[3]_i_2_n_0 ;
  wire \DataOut[4]_i_1_n_0 ;
  wire \DataOut[4]_i_2_n_0 ;
  wire \DataOut[5]_i_1_n_0 ;
  wire \DataOut[5]_i_2_n_0 ;
  wire \DataOut[6]_i_1_n_0 ;
  wire \DataOut[6]_i_2_n_0 ;
  wire \DataOut[7]_i_1_n_0 ;
  wire \DataOut[7]_i_2_n_0 ;
  wire \FSM_sequential_IntState[0]_i_1_n_0 ;
  wire \FSM_sequential_IntState[1]_i_1_n_0 ;
  wire \FSM_sequential_IntState[2]_i_1_n_0 ;
  wire \FSM_sequential_IntState[2]_i_3_n_0 ;
  wire [9:4]IntLastOut;
  wire [9:0]IntRamOut;
  wire IntRdAddr;
  wire [3:0]IntRdAddr_reg__0;
  (* async_reg = "true" *) wire [1:0]IntRdEna_Sync;
  wire [0:0]\IntRdEna_Sync_reg[0]_0 ;
  wire IntState;
  (* RTL_KEEP = "yes" *) wire [2:0]IntState__0;
  wire \IntWrAddr_reg[2]_0 ;
  wire [3:0]Q;
  (* async_reg = "true" *) wire [1:0]Reset_Sync;
  wire Tx_WrClk;
  wire [3:0]p_0_in__2;
  wire [3:0]p_0_in__4;
  wire reset_out;
  wire [9:0]tx_data_10b;
  wire [7:0]\tx_data_8b_reg[7] ;
  wire [1:0]NLW_FIFO_ram_inst0_DOD_UNCONNECTED;
  wire [1:0]NLW_FIFO_ram_inst1_DOC_UNCONNECTED;
  wire [1:0]NLW_FIFO_ram_inst1_DOD_UNCONNECTED;

  LUT3 #(
    .INIT(8'hB8)) 
    \DataOut[0]_i_1 
       (.I0(IntRamOut[2]),
        .I1(IntState__0[2]),
        .I2(\DataOut[0]_i_2_n_0 ),
        .O(\DataOut[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut[0]_i_2 
       (.I0(IntLastOut[4]),
        .I1(IntLastOut[6]),
        .I2(IntState__0[1]),
        .I3(IntLastOut[8]),
        .I4(IntState__0[0]),
        .I5(IntRamOut[0]),
        .O(\DataOut[0]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \DataOut[1]_i_1 
       (.I0(IntRamOut[3]),
        .I1(IntState__0[2]),
        .I2(\DataOut[1]_i_2_n_0 ),
        .O(\DataOut[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut[1]_i_2 
       (.I0(IntLastOut[5]),
        .I1(IntLastOut[7]),
        .I2(IntState__0[1]),
        .I3(IntLastOut[9]),
        .I4(IntState__0[0]),
        .I5(IntRamOut[1]),
        .O(\DataOut[1]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \DataOut[2]_i_1 
       (.I0(IntRamOut[4]),
        .I1(IntState__0[2]),
        .I2(\DataOut[2]_i_2_n_0 ),
        .O(\DataOut[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut[2]_i_2 
       (.I0(IntLastOut[6]),
        .I1(IntLastOut[8]),
        .I2(IntState__0[1]),
        .I3(IntRamOut[0]),
        .I4(IntState__0[0]),
        .I5(IntRamOut[2]),
        .O(\DataOut[2]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \DataOut[3]_i_1 
       (.I0(IntRamOut[5]),
        .I1(IntState__0[2]),
        .I2(\DataOut[3]_i_2_n_0 ),
        .O(\DataOut[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut[3]_i_2 
       (.I0(IntLastOut[7]),
        .I1(IntLastOut[9]),
        .I2(IntState__0[1]),
        .I3(IntRamOut[1]),
        .I4(IntState__0[0]),
        .I5(IntRamOut[3]),
        .O(\DataOut[3]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \DataOut[4]_i_1 
       (.I0(IntRamOut[6]),
        .I1(IntState__0[2]),
        .I2(\DataOut[4]_i_2_n_0 ),
        .O(\DataOut[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut[4]_i_2 
       (.I0(IntLastOut[8]),
        .I1(IntRamOut[0]),
        .I2(IntState__0[1]),
        .I3(IntRamOut[2]),
        .I4(IntState__0[0]),
        .I5(IntRamOut[4]),
        .O(\DataOut[4]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \DataOut[5]_i_1 
       (.I0(IntRamOut[7]),
        .I1(IntState__0[2]),
        .I2(\DataOut[5]_i_2_n_0 ),
        .O(\DataOut[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut[5]_i_2 
       (.I0(IntLastOut[9]),
        .I1(IntRamOut[1]),
        .I2(IntState__0[1]),
        .I3(IntRamOut[3]),
        .I4(IntState__0[0]),
        .I5(IntRamOut[5]),
        .O(\DataOut[5]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \DataOut[6]_i_1 
       (.I0(IntRamOut[8]),
        .I1(IntState__0[2]),
        .I2(\DataOut[6]_i_2_n_0 ),
        .O(\DataOut[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut[6]_i_2 
       (.I0(IntRamOut[0]),
        .I1(IntRamOut[2]),
        .I2(IntState__0[1]),
        .I3(IntRamOut[4]),
        .I4(IntState__0[0]),
        .I5(IntRamOut[6]),
        .O(\DataOut[6]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \DataOut[7]_i_1 
       (.I0(IntRamOut[9]),
        .I1(IntState__0[2]),
        .I2(\DataOut[7]_i_2_n_0 ),
        .O(\DataOut[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DataOut[7]_i_2 
       (.I0(IntRamOut[1]),
        .I1(IntRamOut[3]),
        .I2(IntState__0[1]),
        .I3(IntRamOut[5]),
        .I4(IntState__0[0]),
        .I5(IntRamOut[7]),
        .O(\DataOut[7]_i_2_n_0 ));
  FDSE \DataOut_reg[0] 
       (.C(CLK),
        .CE(IntState),
        .D(\DataOut[0]_i_1_n_0 ),
        .Q(\tx_data_8b_reg[7] [0]),
        .S(\FSM_sequential_IntState[2]_i_1_n_0 ));
  FDSE \DataOut_reg[1] 
       (.C(CLK),
        .CE(IntState),
        .D(\DataOut[1]_i_1_n_0 ),
        .Q(\tx_data_8b_reg[7] [1]),
        .S(\FSM_sequential_IntState[2]_i_1_n_0 ));
  FDSE \DataOut_reg[2] 
       (.C(CLK),
        .CE(IntState),
        .D(\DataOut[2]_i_1_n_0 ),
        .Q(\tx_data_8b_reg[7] [2]),
        .S(\FSM_sequential_IntState[2]_i_1_n_0 ));
  FDSE \DataOut_reg[3] 
       (.C(CLK),
        .CE(IntState),
        .D(\DataOut[3]_i_1_n_0 ),
        .Q(\tx_data_8b_reg[7] [3]),
        .S(\FSM_sequential_IntState[2]_i_1_n_0 ));
  FDSE \DataOut_reg[4] 
       (.C(CLK),
        .CE(IntState),
        .D(\DataOut[4]_i_1_n_0 ),
        .Q(\tx_data_8b_reg[7] [4]),
        .S(\FSM_sequential_IntState[2]_i_1_n_0 ));
  FDSE \DataOut_reg[5] 
       (.C(CLK),
        .CE(IntState),
        .D(\DataOut[5]_i_1_n_0 ),
        .Q(\tx_data_8b_reg[7] [5]),
        .S(\FSM_sequential_IntState[2]_i_1_n_0 ));
  FDSE \DataOut_reg[6] 
       (.C(CLK),
        .CE(IntState),
        .D(\DataOut[6]_i_1_n_0 ),
        .Q(\tx_data_8b_reg[7] [6]),
        .S(\FSM_sequential_IntState[2]_i_1_n_0 ));
  FDSE \DataOut_reg[7] 
       (.C(CLK),
        .CE(IntState),
        .D(\DataOut[7]_i_1_n_0 ),
        .Q(\tx_data_8b_reg[7] [7]),
        .S(\FSM_sequential_IntState[2]_i_1_n_0 ));
  (* box_type = "PRIMITIVE" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000),
    .IS_WCLK_INVERTED(1'b0)) 
    FIFO_ram_inst0
       (.ADDRA({1'b0,IntRdAddr_reg__0}),
        .ADDRB({1'b0,IntRdAddr_reg__0}),
        .ADDRC({1'b0,IntRdAddr_reg__0}),
        .ADDRD({1'b0,Q}),
        .DIA(tx_data_10b[1:0]),
        .DIB(tx_data_10b[3:2]),
        .DIC(tx_data_10b[5:4]),
        .DID({1'b0,1'b0}),
        .DOA(IntRamOut[1:0]),
        .DOB(IntRamOut[3:2]),
        .DOC(IntRamOut[5:4]),
        .DOD(NLW_FIFO_ram_inst0_DOD_UNCONNECTED[1:0]),
        .WCLK(Tx_WrClk),
        .WE(1'b1));
  (* box_type = "PRIMITIVE" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000),
    .IS_WCLK_INVERTED(1'b0)) 
    FIFO_ram_inst1
       (.ADDRA({1'b0,IntRdAddr_reg__0}),
        .ADDRB({1'b0,IntRdAddr_reg__0}),
        .ADDRC({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRD({1'b0,Q}),
        .DIA(tx_data_10b[7:6]),
        .DIB(tx_data_10b[9:8]),
        .DIC({1'b0,1'b0}),
        .DID({1'b0,1'b0}),
        .DOA(IntRamOut[7:6]),
        .DOB(IntRamOut[9:8]),
        .DOC(NLW_FIFO_ram_inst1_DOC_UNCONNECTED[1:0]),
        .DOD(NLW_FIFO_ram_inst1_DOD_UNCONNECTED[1:0]),
        .WCLK(Tx_WrClk),
        .WE(1'b1));
  LUT2 #(
    .INIT(4'h1)) 
    \FSM_sequential_IntState[0]_i_1 
       (.I0(IntState__0[0]),
        .I1(IntState__0[2]),
        .O(\FSM_sequential_IntState[0]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h06)) 
    \FSM_sequential_IntState[1]_i_1 
       (.I0(IntState__0[1]),
        .I1(IntState__0[0]),
        .I2(IntState__0[2]),
        .O(\FSM_sequential_IntState[1]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \FSM_sequential_IntState[2]_i_1 
       (.I0(Reset_Sync[1]),
        .I1(IntRdEna_Sync[1]),
        .O(\FSM_sequential_IntState[2]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h57)) 
    \FSM_sequential_IntState[2]_i_2 
       (.I0(IntState__0[2]),
        .I1(IntState__0[1]),
        .I2(IntState__0[0]),
        .O(IntState));
  LUT3 #(
    .INIT(8'h40)) 
    \FSM_sequential_IntState[2]_i_3 
       (.I0(IntState__0[2]),
        .I1(IntState__0[0]),
        .I2(IntState__0[1]),
        .O(\FSM_sequential_IntState[2]_i_3_n_0 ));
  (* FSM_ENCODED_STATES = "iSTATE:000,iSTATE0:001,iSTATE1:010,iSTATE2:011,iSTATE3:100," *) 
  (* KEEP = "yes" *) 
  FDRE \FSM_sequential_IntState_reg[0] 
       (.C(CLK),
        .CE(IntState),
        .D(\FSM_sequential_IntState[0]_i_1_n_0 ),
        .Q(IntState__0[0]),
        .R(\FSM_sequential_IntState[2]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "iSTATE:000,iSTATE0:001,iSTATE1:010,iSTATE2:011,iSTATE3:100," *) 
  (* KEEP = "yes" *) 
  FDRE \FSM_sequential_IntState_reg[1] 
       (.C(CLK),
        .CE(IntState),
        .D(\FSM_sequential_IntState[1]_i_1_n_0 ),
        .Q(IntState__0[1]),
        .R(\FSM_sequential_IntState[2]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "iSTATE:000,iSTATE0:001,iSTATE1:010,iSTATE2:011,iSTATE3:100," *) 
  (* KEEP = "yes" *) 
  FDRE \FSM_sequential_IntState_reg[2] 
       (.C(CLK),
        .CE(IntState),
        .D(\FSM_sequential_IntState[2]_i_3_n_0 ),
        .Q(IntState__0[2]),
        .R(\FSM_sequential_IntState[2]_i_1_n_0 ));
  FDRE \IntLastOut_reg[4] 
       (.C(CLK),
        .CE(1'b1),
        .D(IntRamOut[4]),
        .Q(IntLastOut[4]),
        .R(1'b0));
  FDRE \IntLastOut_reg[5] 
       (.C(CLK),
        .CE(1'b1),
        .D(IntRamOut[5]),
        .Q(IntLastOut[5]),
        .R(1'b0));
  FDRE \IntLastOut_reg[6] 
       (.C(CLK),
        .CE(1'b1),
        .D(IntRamOut[6]),
        .Q(IntLastOut[6]),
        .R(1'b0));
  FDRE \IntLastOut_reg[7] 
       (.C(CLK),
        .CE(1'b1),
        .D(IntRamOut[7]),
        .Q(IntLastOut[7]),
        .R(1'b0));
  FDRE \IntLastOut_reg[8] 
       (.C(CLK),
        .CE(1'b1),
        .D(IntRamOut[8]),
        .Q(IntLastOut[8]),
        .R(1'b0));
  FDRE \IntLastOut_reg[9] 
       (.C(CLK),
        .CE(1'b1),
        .D(IntRamOut[9]),
        .Q(IntLastOut[9]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair90" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \IntRdAddr[0]_i_1 
       (.I0(IntRdAddr_reg__0[0]),
        .O(p_0_in__4[0]));
  (* SOFT_HLUTNM = "soft_lutpair90" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \IntRdAddr[1]_i_1 
       (.I0(IntRdAddr_reg__0[0]),
        .I1(IntRdAddr_reg__0[1]),
        .O(p_0_in__4[1]));
  (* SOFT_HLUTNM = "soft_lutpair88" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \IntRdAddr[2]_i_1 
       (.I0(IntRdAddr_reg__0[0]),
        .I1(IntRdAddr_reg__0[1]),
        .I2(IntRdAddr_reg__0[2]),
        .O(p_0_in__4[2]));
  LUT3 #(
    .INIT(8'h17)) 
    \IntRdAddr[3]_i_1 
       (.I0(IntState__0[1]),
        .I1(IntState__0[2]),
        .I2(IntState__0[0]),
        .O(IntRdAddr));
  (* SOFT_HLUTNM = "soft_lutpair88" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \IntRdAddr[3]_i_2 
       (.I0(IntRdAddr_reg__0[1]),
        .I1(IntRdAddr_reg__0[0]),
        .I2(IntRdAddr_reg__0[2]),
        .I3(IntRdAddr_reg__0[3]),
        .O(p_0_in__4[3]));
  FDRE \IntRdAddr_reg[0] 
       (.C(CLK),
        .CE(IntRdAddr),
        .D(p_0_in__4[0]),
        .Q(IntRdAddr_reg__0[0]),
        .R(\FSM_sequential_IntState[2]_i_1_n_0 ));
  FDRE \IntRdAddr_reg[1] 
       (.C(CLK),
        .CE(IntRdAddr),
        .D(p_0_in__4[1]),
        .Q(IntRdAddr_reg__0[1]),
        .R(\FSM_sequential_IntState[2]_i_1_n_0 ));
  FDRE \IntRdAddr_reg[2] 
       (.C(CLK),
        .CE(IntRdAddr),
        .D(p_0_in__4[2]),
        .Q(IntRdAddr_reg__0[2]),
        .R(\FSM_sequential_IntState[2]_i_1_n_0 ));
  FDRE \IntRdAddr_reg[3] 
       (.C(CLK),
        .CE(IntRdAddr),
        .D(p_0_in__4[3]),
        .Q(IntRdAddr_reg__0[3]),
        .R(\FSM_sequential_IntState[2]_i_1_n_0 ));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE \IntRdEna_Sync_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(\IntRdEna_Sync_reg[0]_0 ),
        .Q(IntRdEna_Sync[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE \IntRdEna_Sync_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(IntRdEna_Sync[0]),
        .Q(IntRdEna_Sync[1]),
        .R(1'b0));
  FDRE IntRdEna_reg
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(\IntWrAddr_reg[2]_0 ),
        .Q(\IntRdEna_Sync_reg[0]_0 ),
        .R(reset_out));
  (* SOFT_HLUTNM = "soft_lutpair91" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \IntWrAddr[0]_i_1 
       (.I0(Q[0]),
        .O(p_0_in__2[0]));
  (* SOFT_HLUTNM = "soft_lutpair91" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \IntWrAddr[1]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(p_0_in__2[1]));
  (* SOFT_HLUTNM = "soft_lutpair89" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \IntWrAddr[2]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[2]),
        .O(p_0_in__2[2]));
  (* SOFT_HLUTNM = "soft_lutpair89" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \IntWrAddr[3]_i_1 
       (.I0(Q[2]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(Q[3]),
        .O(p_0_in__2[3]));
  FDRE \IntWrAddr_reg[0] 
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(p_0_in__2[0]),
        .Q(Q[0]),
        .R(reset_out));
  FDRE \IntWrAddr_reg[1] 
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(p_0_in__2[1]),
        .Q(Q[1]),
        .R(reset_out));
  FDRE \IntWrAddr_reg[2] 
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(p_0_in__2[2]),
        .Q(Q[2]),
        .R(reset_out));
  FDRE \IntWrAddr_reg[3] 
       (.C(Tx_WrClk),
        .CE(1'b1),
        .D(p_0_in__2[3]),
        .Q(Q[3]),
        .R(reset_out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDPE \Reset_Sync_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(1'b0),
        .PRE(reset_out),
        .Q(Reset_Sync[0]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDPE \Reset_Sync_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(Reset_Sync[0]),
        .PRE(reset_out),
        .Q(Reset_Sync[1]));
endmodule

(* ORIG_REF_NAME = "AUTO_NEG" *) 
module design_1_gig_ethernet_pcs_pma_0_0_AUTO_NEG
   (status_vector,
    TOGGLE_RX,
    XMIT_DATA_INT,
    MR_AN_COMPLETE,
    XMIT_CONFIG_INT,
    RECEIVED_IDLE,
    RX_CONFIG_REG_NULL_reg_0,
    MR_LINK_STATUS,
    ABILITY_MATCH_reg_0,
    CONFIG_REG_MATCH_reg_0,
    CONFIG_REG_MATCH_reg_1,
    ABILITY_MATCH_reg_1,
    CONFIG_REG_MATCH_reg_2,
    ABILITY_MATCH_reg_2,
    MASK_RUDI_BUFERR_reg_0,
    MR_REMOTE_FAULT_reg_0,
    D,
    out,
    userclk2,
    Q,
    BASEX_REMOTE_FAULT_RSLVD,
    \MGT_RESET.SRESET_reg ,
    RX_RUDI_INVALID,
    AN_ENABLE_INT,
    RESTART_AN_REG,
    RX_CONFIG_VALID,
    ACKNOWLEDGE_MATCH_20,
    RX_IDLE,
    CLEAR_STATUS_REG,
    I_REG_reg,
    RX_CONFIG_VALID_INT_reg,
    RX_CONFIG_VALID_INT_reg_0,
    data_out,
    \CONFIG_REG_WITH_AN.POWERDOWN_REG_reg ,
    \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXBUFSTATUS_INT_reg[1] ,
    RXSYNC_STATUS,
    XMIT_DATA,
    RX_INVALID,
    \RX_CONFIG_REG_REG_reg[9]_0 ,
    \RX_CONFIG_REG_REG_reg[5]_0 ,
    \RX_CONFIG_REG_reg[15] ,
    \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCLKCORCNT_INT_reg[2] ,
    \AN_NP_TX_REG_WITH_AN.AN_NP_TX_REG_reg[13] ,
    \AN_NP_TX_REG_WITH_AN.AN_NP_TX_REG_reg[0] ,
    data_sync_reg6,
    SR);
  output [5:0]status_vector;
  output TOGGLE_RX;
  output XMIT_DATA_INT;
  output MR_AN_COMPLETE;
  output XMIT_CONFIG_INT;
  output RECEIVED_IDLE;
  output RX_CONFIG_REG_NULL_reg_0;
  output MR_LINK_STATUS;
  output ABILITY_MATCH_reg_0;
  output CONFIG_REG_MATCH_reg_0;
  output CONFIG_REG_MATCH_reg_1;
  output ABILITY_MATCH_reg_1;
  output [9:0]CONFIG_REG_MATCH_reg_2;
  output ABILITY_MATCH_reg_2;
  output MASK_RUDI_BUFERR_reg_0;
  output [3:0]MR_REMOTE_FAULT_reg_0;
  output [3:0]D;
  input out;
  input userclk2;
  input [15:0]Q;
  input [0:0]BASEX_REMOTE_FAULT_RSLVD;
  input \MGT_RESET.SRESET_reg ;
  input RX_RUDI_INVALID;
  input AN_ENABLE_INT;
  input RESTART_AN_REG;
  input RX_CONFIG_VALID;
  input ACKNOWLEDGE_MATCH_20;
  input RX_IDLE;
  input CLEAR_STATUS_REG;
  input I_REG_reg;
  input RX_CONFIG_VALID_INT_reg;
  input RX_CONFIG_VALID_INT_reg_0;
  input data_out;
  input \CONFIG_REG_WITH_AN.POWERDOWN_REG_reg ;
  input \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXBUFSTATUS_INT_reg[1] ;
  input RXSYNC_STATUS;
  input XMIT_DATA;
  input RX_INVALID;
  input \RX_CONFIG_REG_REG_reg[9]_0 ;
  input \RX_CONFIG_REG_REG_reg[5]_0 ;
  input \RX_CONFIG_REG_reg[15] ;
  input [1:0]\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCLKCORCNT_INT_reg[2] ;
  input \AN_NP_TX_REG_WITH_AN.AN_NP_TX_REG_reg[13] ;
  input \AN_NP_TX_REG_WITH_AN.AN_NP_TX_REG_reg[0] ;
  input data_sync_reg6;
  input [0:0]SR;

  wire ABILITY_MATCH;
  wire ABILITY_MATCH_2;
  wire ABILITY_MATCH_2_i_13_n_0;
  wire ABILITY_MATCH_2_i_14_n_0;
  wire ABILITY_MATCH_2_i_7_n_0;
  wire ABILITY_MATCH_reg_0;
  wire ABILITY_MATCH_reg_1;
  wire ABILITY_MATCH_reg_2;
  wire ACKNOWLEDGE_MATCH_2;
  wire ACKNOWLEDGE_MATCH_20;
  wire ACKNOWLEDGE_MATCH_3;
  wire ACKNOWLEDGE_MATCH_30;
  wire ACKNOWLEDGE_MATCH_3_reg_n_0;
  wire AN_ENABLE_INT;
  wire \AN_NP_TX_REG_WITH_AN.AN_NP_TX_REG_reg[0] ;
  wire \AN_NP_TX_REG_WITH_AN.AN_NP_TX_REG_reg[13] ;
  wire AN_SYNC_STATUS;
  wire AN_SYNC_STATUS_i_1_n_0;
  wire [0:0]BASEX_REMOTE_FAULT_RSLVD;
  wire CLEAR_STATUS_REG;
  wire CLEAR_STATUS_REG1;
  wire CLEAR_STATUS_REG2;
  wire CONFIG_REG_MATCH;
  wire CONFIG_REG_MATCH_COMB;
  wire CONFIG_REG_MATCH_reg_0;
  wire CONFIG_REG_MATCH_reg_1;
  wire [9:0]CONFIG_REG_MATCH_reg_2;
  wire \CONFIG_REG_WITH_AN.POWERDOWN_REG_reg ;
  wire CONSISTENCY_MATCH;
  wire CONSISTENCY_MATCH_COMB;
  wire CONSISTENCY_MATCH_i_2_n_0;
  wire CONSISTENCY_MATCH_i_3_n_0;
  wire CONSISTENCY_MATCH_i_4_n_0;
  wire CONSISTENCY_MATCH_i_5_n_0;
  wire CONSISTENCY_MATCH_i_6_n_0;
  wire [3:0]D;
  wire GENERATE_REMOTE_FAULT;
  wire GENERATE_REMOTE_FAULT0;
  wire GENERATE_REMOTE_FAULT_i_2_n_0;
  wire GENERATE_REMOTE_FAULT_i_3_n_0;
  wire IDLE_INSERTED;
  wire IDLE_INSERTED0;
  wire IDLE_INSERTED_REG1;
  wire IDLE_INSERTED_REG2;
  wire IDLE_INSERTED_REG3;
  wire IDLE_INSERTED_REG30;
  wire IDLE_INSERTED_REG4;
  wire IDLE_MATCH;
  wire IDLE_MATCH0;
  wire IDLE_MATCH_2;
  wire IDLE_MATCH_20;
  wire IDLE_REMOVED;
  wire IDLE_REMOVED0;
  wire IDLE_REMOVED_REG1;
  wire IDLE_REMOVED_REG2;
  wire I_REG_reg;
  wire \LINK_TIMER[0]_i_1_n_0 ;
  wire \LINK_TIMER[9]_i_1_n_0 ;
  wire \LINK_TIMER[9]_i_3_n_0 ;
  wire LINK_TIMER_DONE;
  wire LINK_TIMER_DONE_i_1_n_0;
  wire LINK_TIMER_DONE_i_2_n_0;
  wire LINK_TIMER_DONE_i_3_n_0;
  wire LINK_TIMER_DONE_i_4_n_0;
  wire LINK_TIMER_SATURATED;
  wire LINK_TIMER_SATURATED_COMB;
  wire LINK_TIMER_SATURATED_i_2_n_0;
  wire [9:0]LINK_TIMER_reg__0;
  wire MASK_RUDI_BUFERR;
  wire [12:0]MASK_RUDI_BUFERR_TIMER;
  wire \MASK_RUDI_BUFERR_TIMER[0]_i_1_n_0 ;
  wire \MASK_RUDI_BUFERR_TIMER[10]_i_1_n_0 ;
  wire \MASK_RUDI_BUFERR_TIMER[11]_i_1_n_0 ;
  wire \MASK_RUDI_BUFERR_TIMER[12]_i_2_n_0 ;
  wire \MASK_RUDI_BUFERR_TIMER[12]_i_4_n_0 ;
  wire \MASK_RUDI_BUFERR_TIMER[12]_i_5_n_0 ;
  wire \MASK_RUDI_BUFERR_TIMER[1]_i_1_n_0 ;
  wire \MASK_RUDI_BUFERR_TIMER[2]_i_1_n_0 ;
  wire \MASK_RUDI_BUFERR_TIMER[3]_i_1_n_0 ;
  wire \MASK_RUDI_BUFERR_TIMER[4]_i_1_n_0 ;
  wire \MASK_RUDI_BUFERR_TIMER[5]_i_1_n_0 ;
  wire \MASK_RUDI_BUFERR_TIMER[6]_i_1_n_0 ;
  wire \MASK_RUDI_BUFERR_TIMER[7]_i_1_n_0 ;
  wire \MASK_RUDI_BUFERR_TIMER[8]_i_1_n_0 ;
  wire \MASK_RUDI_BUFERR_TIMER[9]_i_1_n_0 ;
  wire MASK_RUDI_BUFERR_i_1_n_0;
  wire MASK_RUDI_BUFERR_reg_0;
  wire MASK_RUDI_CLKCOR;
  wire MASK_RUDI_CLKCOR_i_1_n_0;
  wire \MGT_RESET.SRESET_reg ;
  wire MR_AN_COMPLETE;
  wire MR_AN_COMPLETE_i_1_n_0;
  wire MR_AN_ENABLE_CHANGE;
  wire MR_AN_ENABLE_CHANGE0;
  wire MR_AN_ENABLE_REG1;
  wire MR_AN_ENABLE_REG2;
  wire MR_LINK_STATUS;
  wire MR_LINK_STATUS_i_1_n_0;
  wire MR_PAGE_RX_SET119_out;
  wire MR_REMOTE_FAULT_i_1_n_0;
  wire [3:0]MR_REMOTE_FAULT_reg_0;
  wire MR_RESTART_AN_INT;
  wire MR_RESTART_AN_INT_i_1_n_0;
  wire MR_RESTART_AN_SET_REG1;
  wire MR_RESTART_AN_SET_REG2;
  wire [3:0]PREVIOUS_STATE;
  wire PULSE4096;
  wire PULSE40960;
  wire [15:0]Q;
  wire RECEIVED_IDLE;
  wire RESTART_AN_REG;
  wire RXSYNC_STATUS;
  wire RX_CONFIG_REG_NULL_reg_0;
  wire \RX_CONFIG_REG_REG_reg[5]_0 ;
  wire \RX_CONFIG_REG_REG_reg[9]_0 ;
  wire \RX_CONFIG_REG_REG_reg_n_0_[10] ;
  wire \RX_CONFIG_REG_REG_reg_n_0_[11] ;
  wire \RX_CONFIG_REG_REG_reg_n_0_[3] ;
  wire \RX_CONFIG_REG_REG_reg_n_0_[4] ;
  wire \RX_CONFIG_REG_REG_reg_n_0_[7] ;
  wire \RX_CONFIG_REG_REG_reg_n_0_[8] ;
  wire \RX_CONFIG_REG_reg[15] ;
  wire RX_CONFIG_SNAPSHOT;
  wire \RX_CONFIG_SNAPSHOT[15]_i_2_n_0 ;
  wire \RX_CONFIG_SNAPSHOT_reg_n_0_[0] ;
  wire \RX_CONFIG_SNAPSHOT_reg_n_0_[10] ;
  wire \RX_CONFIG_SNAPSHOT_reg_n_0_[11] ;
  wire \RX_CONFIG_SNAPSHOT_reg_n_0_[12] ;
  wire \RX_CONFIG_SNAPSHOT_reg_n_0_[13] ;
  wire \RX_CONFIG_SNAPSHOT_reg_n_0_[15] ;
  wire \RX_CONFIG_SNAPSHOT_reg_n_0_[1] ;
  wire \RX_CONFIG_SNAPSHOT_reg_n_0_[2] ;
  wire \RX_CONFIG_SNAPSHOT_reg_n_0_[3] ;
  wire \RX_CONFIG_SNAPSHOT_reg_n_0_[4] ;
  wire \RX_CONFIG_SNAPSHOT_reg_n_0_[5] ;
  wire \RX_CONFIG_SNAPSHOT_reg_n_0_[6] ;
  wire \RX_CONFIG_SNAPSHOT_reg_n_0_[7] ;
  wire \RX_CONFIG_SNAPSHOT_reg_n_0_[8] ;
  wire \RX_CONFIG_SNAPSHOT_reg_n_0_[9] ;
  wire RX_CONFIG_VALID;
  wire RX_CONFIG_VALID_INT_reg;
  wire RX_CONFIG_VALID_INT_reg_0;
  wire RX_IDLE;
  wire RX_IDLE_REG1;
  wire RX_IDLE_REG2;
  wire RX_INVALID;
  wire RX_RUDI_INVALID;
  wire [1:0]RX_RUDI_INVALID_DELAY;
  wire RX_RUDI_INVALID_DELAY0;
  wire RX_RUDI_INVALID_REG;
  wire \SGMII_SPEED[1]_i_2_n_0 ;
  wire [0:0]SR;
  wire START_LINK_TIMER;
  wire START_LINK_TIMER_REG;
  wire START_LINK_TIMER_REG2;
  wire START_LINK_TIMER_REG_i_2_n_0;
  wire START_LINK_TIMER_REG_i_3_n_0;
  wire [3:0]STATE;
  wire \STATE[0]_i_1_n_0 ;
  wire \STATE[0]_i_2_n_0 ;
  wire \STATE[0]_i_3_n_0 ;
  wire \STATE[0]_i_4_n_0 ;
  wire \STATE[1]_i_1_n_0 ;
  wire \STATE[1]_i_2_n_0 ;
  wire \STATE[1]_i_3_n_0 ;
  wire \STATE[1]_i_4_n_0 ;
  wire \STATE[1]_i_5_n_0 ;
  wire \STATE[2]_i_1_n_0 ;
  wire \STATE[2]_i_2_n_0 ;
  wire \STATE[2]_i_3_n_0 ;
  wire \STATE[2]_i_4_n_0 ;
  wire \STATE[2]_i_5_n_0 ;
  wire \STATE[3]_i_1_n_0 ;
  wire \STATE[3]_i_2_n_0 ;
  wire \STATE[3]_i_3_n_0 ;
  wire \STATE[3]_i_4_n_0 ;
  wire SYNC_STATUS_HELD;
  wire SYNC_STATUS_HELD_i_1_n_0;
  wire TIMER4096_MSB_REG;
  wire [11:11]TIMER4096_reg__0;
  wire \TIMER4096_reg_n_0_[0] ;
  wire \TIMER4096_reg_n_0_[10] ;
  wire \TIMER4096_reg_n_0_[1] ;
  wire \TIMER4096_reg_n_0_[2] ;
  wire \TIMER4096_reg_n_0_[3] ;
  wire \TIMER4096_reg_n_0_[4] ;
  wire \TIMER4096_reg_n_0_[5] ;
  wire \TIMER4096_reg_n_0_[6] ;
  wire \TIMER4096_reg_n_0_[7] ;
  wire \TIMER4096_reg_n_0_[8] ;
  wire \TIMER4096_reg_n_0_[9] ;
  wire TOGGLE_RX;
  wire TOGGLE_TX;
  wire TOGGLE_TX_i_1_n_0;
  wire \TX_CONFIG_REG_INT[0]_i_1_n_0 ;
  wire \TX_CONFIG_REG_INT[11]_i_1_n_0 ;
  wire \TX_CONFIG_REG_INT[13]_i_1_n_0 ;
  wire \TX_CONFIG_REG_INT[13]_i_2_n_0 ;
  wire \TX_CONFIG_REG_INT[14]_i_1_n_0 ;
  wire \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXBUFSTATUS_INT_reg[1] ;
  wire [1:0]\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCLKCORCNT_INT_reg[2] ;
  wire XMIT_CONFIG_INT;
  wire XMIT_CONFIG_INT_i_1__0_n_0;
  wire XMIT_CONFIG_INT_i_2__0_n_0;
  wire XMIT_CONFIG_INT_i_3_n_0;
  wire XMIT_DATA;
  wire XMIT_DATA_INT;
  wire XMIT_DATA_INT0;
  wire data_out;
  wire data_sync_reg6;
  wire out;
  wire [11:0]plusOp__0;
  wire [9:1]plusOp__1;
  wire plusOp_carry__0_n_6;
  wire plusOp_carry__0_n_7;
  wire plusOp_carry_n_0;
  wire plusOp_carry_n_1;
  wire plusOp_carry_n_2;
  wire plusOp_carry_n_3;
  wire plusOp_carry_n_5;
  wire plusOp_carry_n_6;
  wire plusOp_carry_n_7;
  wire \plusOp_inferred__0/i__carry__0_n_12 ;
  wire \plusOp_inferred__0/i__carry__0_n_13 ;
  wire \plusOp_inferred__0/i__carry__0_n_14 ;
  wire \plusOp_inferred__0/i__carry__0_n_15 ;
  wire \plusOp_inferred__0/i__carry__0_n_5 ;
  wire \plusOp_inferred__0/i__carry__0_n_6 ;
  wire \plusOp_inferred__0/i__carry__0_n_7 ;
  wire \plusOp_inferred__0/i__carry_n_0 ;
  wire \plusOp_inferred__0/i__carry_n_1 ;
  wire \plusOp_inferred__0/i__carry_n_10 ;
  wire \plusOp_inferred__0/i__carry_n_11 ;
  wire \plusOp_inferred__0/i__carry_n_12 ;
  wire \plusOp_inferred__0/i__carry_n_13 ;
  wire \plusOp_inferred__0/i__carry_n_14 ;
  wire \plusOp_inferred__0/i__carry_n_15 ;
  wire \plusOp_inferred__0/i__carry_n_2 ;
  wire \plusOp_inferred__0/i__carry_n_3 ;
  wire \plusOp_inferred__0/i__carry_n_5 ;
  wire \plusOp_inferred__0/i__carry_n_6 ;
  wire \plusOp_inferred__0/i__carry_n_7 ;
  wire \plusOp_inferred__0/i__carry_n_8 ;
  wire \plusOp_inferred__0/i__carry_n_9 ;
  wire [5:0]status_vector;
  wire userclk2;
  wire [3:3]NLW_plusOp_carry_CO_UNCONNECTED;
  wire [7:2]NLW_plusOp_carry__0_CO_UNCONNECTED;
  wire [7:3]NLW_plusOp_carry__0_O_UNCONNECTED;
  wire [3:3]\NLW_plusOp_inferred__0/i__carry_CO_UNCONNECTED ;
  wire [7:3]\NLW_plusOp_inferred__0/i__carry__0_CO_UNCONNECTED ;
  wire [7:4]\NLW_plusOp_inferred__0/i__carry__0_O_UNCONNECTED ;

  LUT3 #(
    .INIT(8'hFE)) 
    ABILITY_MATCH_2_i_1
       (.I0(MASK_RUDI_BUFERR),
        .I1(RX_IDLE),
        .I2(out),
        .O(ACKNOWLEDGE_MATCH_3));
  LUT4 #(
    .INIT(16'h4F44)) 
    ABILITY_MATCH_2_i_10
       (.I0(CONFIG_REG_MATCH_reg_2[4]),
        .I1(Q[6]),
        .I2(\RX_CONFIG_REG_REG_reg_n_0_[10] ),
        .I3(Q[10]),
        .O(ABILITY_MATCH_reg_2));
  LUT6 #(
    .INIT(64'h66F666F6FFFF66F6)) 
    ABILITY_MATCH_2_i_12
       (.I0(\RX_CONFIG_REG_REG_reg_n_0_[7] ),
        .I1(Q[7]),
        .I2(Q[2]),
        .I3(CONFIG_REG_MATCH_reg_2[2]),
        .I4(\RX_CONFIG_REG_REG_reg_n_0_[3] ),
        .I5(Q[3]),
        .O(ABILITY_MATCH_reg_1));
  LUT4 #(
    .INIT(16'h4F44)) 
    ABILITY_MATCH_2_i_13
       (.I0(\RX_CONFIG_REG_REG_reg_n_0_[3] ),
        .I1(Q[3]),
        .I2(\RX_CONFIG_REG_REG_reg_n_0_[8] ),
        .I3(Q[8]),
        .O(ABILITY_MATCH_2_i_13_n_0));
  LUT4 #(
    .INIT(16'h6FF6)) 
    ABILITY_MATCH_2_i_14
       (.I0(\RX_CONFIG_REG_REG_reg_n_0_[4] ),
        .I1(Q[4]),
        .I2(Q[11]),
        .I3(\RX_CONFIG_REG_REG_reg_n_0_[11] ),
        .O(ABILITY_MATCH_2_i_14_n_0));
  LUT4 #(
    .INIT(16'h0004)) 
    ABILITY_MATCH_2_i_2
       (.I0(CONFIG_REG_MATCH_reg_0),
        .I1(\RX_CONFIG_REG_REG_reg[9]_0 ),
        .I2(\RX_CONFIG_REG_REG_reg[5]_0 ),
        .I3(CONFIG_REG_MATCH_reg_1),
        .O(CONFIG_REG_MATCH_COMB));
  LUT6 #(
    .INIT(64'hEFEEFFFFEFEEEFEE)) 
    ABILITY_MATCH_2_i_3
       (.I0(ABILITY_MATCH_2_i_7_n_0),
        .I1(\RX_CONFIG_REG_reg[15] ),
        .I2(Q[5]),
        .I3(CONFIG_REG_MATCH_reg_2[3]),
        .I4(Q[10]),
        .I5(\RX_CONFIG_REG_REG_reg_n_0_[10] ),
        .O(CONFIG_REG_MATCH_reg_0));
  LUT5 #(
    .INIT(32'hFFFFEFEE)) 
    ABILITY_MATCH_2_i_6
       (.I0(ABILITY_MATCH_2_i_13_n_0),
        .I1(RECEIVED_IDLE),
        .I2(Q[9]),
        .I3(CONFIG_REG_MATCH_reg_2[5]),
        .I4(ABILITY_MATCH_2_i_14_n_0),
        .O(CONFIG_REG_MATCH_reg_1));
  LUT6 #(
    .INIT(64'h44F444F4FFFF44F4)) 
    ABILITY_MATCH_2_i_7
       (.I0(CONFIG_REG_MATCH_reg_2[1]),
        .I1(Q[1]),
        .I2(\RX_CONFIG_REG_REG_reg_n_0_[8] ),
        .I3(Q[8]),
        .I4(Q[15]),
        .I5(CONFIG_REG_MATCH_reg_2[9]),
        .O(ABILITY_MATCH_2_i_7_n_0));
  FDRE #(
    .INIT(1'b0)) 
    ABILITY_MATCH_2_reg
       (.C(userclk2),
        .CE(RX_CONFIG_VALID),
        .D(CONFIG_REG_MATCH_COMB),
        .Q(ABILITY_MATCH_2),
        .R(ACKNOWLEDGE_MATCH_3));
  LUT6 #(
    .INIT(64'hFEFEFEFFFFFFFEFF)) 
    ABILITY_MATCH_i_2
       (.I0(out),
        .I1(RX_IDLE),
        .I2(MASK_RUDI_BUFERR),
        .I3(ABILITY_MATCH),
        .I4(RX_CONFIG_VALID),
        .I5(ABILITY_MATCH_2),
        .O(ABILITY_MATCH_reg_0));
  FDRE #(
    .INIT(1'b0)) 
    ABILITY_MATCH_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(RX_CONFIG_VALID_INT_reg),
        .Q(ABILITY_MATCH),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    ACKNOWLEDGE_MATCH_2_reg
       (.C(userclk2),
        .CE(RX_CONFIG_VALID),
        .D(ACKNOWLEDGE_MATCH_20),
        .Q(ACKNOWLEDGE_MATCH_2),
        .R(ACKNOWLEDGE_MATCH_3));
  LUT3 #(
    .INIT(8'h80)) 
    ACKNOWLEDGE_MATCH_3_i_1
       (.I0(ACKNOWLEDGE_MATCH_2),
        .I1(CONFIG_REG_MATCH_reg_2[8]),
        .I2(Q[14]),
        .O(ACKNOWLEDGE_MATCH_30));
  FDRE #(
    .INIT(1'b0)) 
    ACKNOWLEDGE_MATCH_3_reg
       (.C(userclk2),
        .CE(RX_CONFIG_VALID),
        .D(ACKNOWLEDGE_MATCH_30),
        .Q(ACKNOWLEDGE_MATCH_3_reg_n_0),
        .R(ACKNOWLEDGE_MATCH_3));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT5 #(
    .INIT(32'hFFBFFF80)) 
    AN_SYNC_STATUS_i_1
       (.I0(SYNC_STATUS_HELD),
        .I1(PULSE4096),
        .I2(LINK_TIMER_SATURATED),
        .I3(RXSYNC_STATUS),
        .I4(AN_SYNC_STATUS),
        .O(AN_SYNC_STATUS_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    AN_SYNC_STATUS_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(AN_SYNC_STATUS_i_1_n_0),
        .Q(AN_SYNC_STATUS),
        .R(out));
  FDRE \BASEX_REMOTE_FAULT_reg[1] 
       (.C(userclk2),
        .CE(MR_PAGE_RX_SET119_out),
        .D(BASEX_REMOTE_FAULT_RSLVD),
        .Q(status_vector[2]),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    CLEAR_STATUS_REG1_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(CLEAR_STATUS_REG),
        .Q(CLEAR_STATUS_REG1),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    CLEAR_STATUS_REG2_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(CLEAR_STATUS_REG1),
        .Q(CLEAR_STATUS_REG2),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    CONFIG_REG_MATCH_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(CONFIG_REG_MATCH_COMB),
        .Q(CONFIG_REG_MATCH),
        .R(out));
  LUT5 #(
    .INIT(32'h00000009)) 
    CONSISTENCY_MATCH_i_1
       (.I0(\RX_CONFIG_SNAPSHOT_reg_n_0_[15] ),
        .I1(Q[15]),
        .I2(CONSISTENCY_MATCH_i_2_n_0),
        .I3(CONSISTENCY_MATCH_i_3_n_0),
        .I4(CONSISTENCY_MATCH_i_4_n_0),
        .O(CONSISTENCY_MATCH_COMB));
  LUT6 #(
    .INIT(64'h6FF6FFFFFFFF6FF6)) 
    CONSISTENCY_MATCH_i_2
       (.I0(\RX_CONFIG_SNAPSHOT_reg_n_0_[6] ),
        .I1(Q[6]),
        .I2(Q[8]),
        .I3(\RX_CONFIG_SNAPSHOT_reg_n_0_[8] ),
        .I4(Q[7]),
        .I5(\RX_CONFIG_SNAPSHOT_reg_n_0_[7] ),
        .O(CONSISTENCY_MATCH_i_2_n_0));
  LUT6 #(
    .INIT(64'hEFFEFFFFFFFFEFFE)) 
    CONSISTENCY_MATCH_i_3
       (.I0(CONSISTENCY_MATCH_i_5_n_0),
        .I1(CONSISTENCY_MATCH_i_6_n_0),
        .I2(Q[12]),
        .I3(\RX_CONFIG_SNAPSHOT_reg_n_0_[12] ),
        .I4(Q[13]),
        .I5(\RX_CONFIG_SNAPSHOT_reg_n_0_[13] ),
        .O(CONSISTENCY_MATCH_i_3_n_0));
  LUT6 #(
    .INIT(64'h6FF6FFFFFFFF6FF6)) 
    CONSISTENCY_MATCH_i_4
       (.I0(\RX_CONFIG_SNAPSHOT_reg_n_0_[9] ),
        .I1(Q[9]),
        .I2(Q[10]),
        .I3(\RX_CONFIG_SNAPSHOT_reg_n_0_[10] ),
        .I4(Q[11]),
        .I5(\RX_CONFIG_SNAPSHOT_reg_n_0_[11] ),
        .O(CONSISTENCY_MATCH_i_4_n_0));
  LUT6 #(
    .INIT(64'h6FF6FFFFFFFF6FF6)) 
    CONSISTENCY_MATCH_i_5
       (.I0(\RX_CONFIG_SNAPSHOT_reg_n_0_[0] ),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(\RX_CONFIG_SNAPSHOT_reg_n_0_[2] ),
        .I4(Q[1]),
        .I5(\RX_CONFIG_SNAPSHOT_reg_n_0_[1] ),
        .O(CONSISTENCY_MATCH_i_5_n_0));
  LUT6 #(
    .INIT(64'h6FF6FFFFFFFF6FF6)) 
    CONSISTENCY_MATCH_i_6
       (.I0(\RX_CONFIG_SNAPSHOT_reg_n_0_[3] ),
        .I1(Q[3]),
        .I2(Q[4]),
        .I3(\RX_CONFIG_SNAPSHOT_reg_n_0_[4] ),
        .I4(Q[5]),
        .I5(\RX_CONFIG_SNAPSHOT_reg_n_0_[5] ),
        .O(CONSISTENCY_MATCH_i_6_n_0));
  FDRE #(
    .INIT(1'b0)) 
    CONSISTENCY_MATCH_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(CONSISTENCY_MATCH_COMB),
        .Q(CONSISTENCY_MATCH),
        .R(out));
  LUT6 #(
    .INIT(64'h0000000057000000)) 
    GENERATE_REMOTE_FAULT_i_1
       (.I0(\STATE[2]_i_5_n_0 ),
        .I1(GENERATE_REMOTE_FAULT_i_2_n_0),
        .I2(STATE[3]),
        .I3(\STATE[3]_i_3_n_0 ),
        .I4(GENERATE_REMOTE_FAULT_i_3_n_0),
        .I5(\STATE[1]_i_2_n_0 ),
        .O(GENERATE_REMOTE_FAULT0));
  LUT6 #(
    .INIT(64'hF3B3FFFFF000FFFF)) 
    GENERATE_REMOTE_FAULT_i_2
       (.I0(STATE[0]),
        .I1(\STATE[2]_i_3_n_0 ),
        .I2(ABILITY_MATCH),
        .I3(RX_CONFIG_REG_NULL_reg_0),
        .I4(STATE[2]),
        .I5(STATE[1]),
        .O(GENERATE_REMOTE_FAULT_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT4 #(
    .INIT(16'h0040)) 
    GENERATE_REMOTE_FAULT_i_3
       (.I0(STATE[1]),
        .I1(STATE[2]),
        .I2(STATE[0]),
        .I3(STATE[3]),
        .O(GENERATE_REMOTE_FAULT_i_3_n_0));
  FDRE #(
    .INIT(1'b0)) 
    GENERATE_REMOTE_FAULT_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(GENERATE_REMOTE_FAULT0),
        .Q(GENERATE_REMOTE_FAULT),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    IDLE_INSERTED_REG1_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(IDLE_INSERTED),
        .Q(IDLE_INSERTED_REG1),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    IDLE_INSERTED_REG2_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(IDLE_INSERTED_REG1),
        .Q(IDLE_INSERTED_REG2),
        .R(out));
  LUT2 #(
    .INIT(4'h2)) 
    IDLE_INSERTED_REG3_i_1
       (.I0(IDLE_INSERTED_REG2),
        .I1(RX_IDLE_REG2),
        .O(IDLE_INSERTED_REG30));
  FDRE #(
    .INIT(1'b0)) 
    IDLE_INSERTED_REG3_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(IDLE_INSERTED_REG30),
        .Q(IDLE_INSERTED_REG3),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    IDLE_INSERTED_REG4_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(IDLE_INSERTED_REG3),
        .Q(IDLE_INSERTED_REG4),
        .R(out));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'h08)) 
    IDLE_INSERTED_i_1
       (.I0(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCLKCORCNT_INT_reg[2] [1]),
        .I1(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCLKCORCNT_INT_reg[2] [0]),
        .I2(XMIT_CONFIG_INT),
        .O(IDLE_INSERTED0));
  FDRE #(
    .INIT(1'b0)) 
    IDLE_INSERTED_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(IDLE_INSERTED0),
        .Q(IDLE_INSERTED),
        .R(out));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'h04)) 
    IDLE_MATCH_2_i_1
       (.I0(IDLE_INSERTED_REG2),
        .I1(RX_IDLE),
        .I2(IDLE_INSERTED_REG4),
        .O(IDLE_MATCH_20));
  FDRE #(
    .INIT(1'b0)) 
    IDLE_MATCH_2_reg
       (.C(userclk2),
        .CE(RX_IDLE_REG2),
        .D(IDLE_MATCH_20),
        .Q(IDLE_MATCH_2),
        .R(out));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT4 #(
    .INIT(16'h4440)) 
    IDLE_MATCH_i_1
       (.I0(IDLE_INSERTED_REG2),
        .I1(RX_IDLE),
        .I2(IDLE_REMOVED_REG2),
        .I3(IDLE_MATCH_2),
        .O(IDLE_MATCH0));
  FDRE #(
    .INIT(1'b0)) 
    IDLE_MATCH_reg
       (.C(userclk2),
        .CE(RX_IDLE_REG2),
        .D(IDLE_MATCH0),
        .Q(IDLE_MATCH),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    IDLE_REMOVED_REG1_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(IDLE_REMOVED),
        .Q(IDLE_REMOVED_REG1),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    IDLE_REMOVED_REG2_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(IDLE_REMOVED_REG1),
        .Q(IDLE_REMOVED_REG2),
        .R(out));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'h04)) 
    IDLE_REMOVED_i_1
       (.I0(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCLKCORCNT_INT_reg[2] [1]),
        .I1(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCLKCORCNT_INT_reg[2] [0]),
        .I2(XMIT_CONFIG_INT),
        .O(IDLE_REMOVED0));
  FDRE #(
    .INIT(1'b0)) 
    IDLE_REMOVED_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(IDLE_REMOVED0),
        .Q(IDLE_REMOVED),
        .R(out));
  LUT1 #(
    .INIT(2'h1)) 
    \LINK_TIMER[0]_i_1 
       (.I0(LINK_TIMER_reg__0[0]),
        .O(\LINK_TIMER[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \LINK_TIMER[1]_i_1 
       (.I0(LINK_TIMER_reg__0[1]),
        .I1(LINK_TIMER_reg__0[0]),
        .O(plusOp__1[1]));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \LINK_TIMER[2]_i_1 
       (.I0(LINK_TIMER_reg__0[2]),
        .I1(LINK_TIMER_reg__0[1]),
        .I2(LINK_TIMER_reg__0[0]),
        .O(plusOp__1[2]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \LINK_TIMER[3]_i_1 
       (.I0(LINK_TIMER_reg__0[3]),
        .I1(LINK_TIMER_reg__0[0]),
        .I2(LINK_TIMER_reg__0[1]),
        .I3(LINK_TIMER_reg__0[2]),
        .O(plusOp__1[3]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \LINK_TIMER[4]_i_1 
       (.I0(LINK_TIMER_reg__0[4]),
        .I1(LINK_TIMER_reg__0[2]),
        .I2(LINK_TIMER_reg__0[1]),
        .I3(LINK_TIMER_reg__0[0]),
        .I4(LINK_TIMER_reg__0[3]),
        .O(plusOp__1[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \LINK_TIMER[5]_i_1 
       (.I0(LINK_TIMER_reg__0[3]),
        .I1(LINK_TIMER_reg__0[0]),
        .I2(LINK_TIMER_reg__0[1]),
        .I3(LINK_TIMER_reg__0[2]),
        .I4(LINK_TIMER_reg__0[4]),
        .I5(LINK_TIMER_reg__0[5]),
        .O(plusOp__1[5]));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \LINK_TIMER[6]_i_1 
       (.I0(LINK_TIMER_reg__0[6]),
        .I1(\LINK_TIMER[9]_i_3_n_0 ),
        .O(plusOp__1[6]));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \LINK_TIMER[7]_i_1 
       (.I0(LINK_TIMER_reg__0[7]),
        .I1(\LINK_TIMER[9]_i_3_n_0 ),
        .I2(LINK_TIMER_reg__0[6]),
        .O(plusOp__1[7]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \LINK_TIMER[8]_i_1 
       (.I0(LINK_TIMER_reg__0[8]),
        .I1(LINK_TIMER_reg__0[6]),
        .I2(\LINK_TIMER[9]_i_3_n_0 ),
        .I3(LINK_TIMER_reg__0[7]),
        .O(plusOp__1[8]));
  LUT4 #(
    .INIT(16'hFFF8)) 
    \LINK_TIMER[9]_i_1 
       (.I0(PULSE4096),
        .I1(LINK_TIMER_SATURATED),
        .I2(START_LINK_TIMER_REG),
        .I3(out),
        .O(\LINK_TIMER[9]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \LINK_TIMER[9]_i_2 
       (.I0(LINK_TIMER_reg__0[9]),
        .I1(LINK_TIMER_reg__0[7]),
        .I2(\LINK_TIMER[9]_i_3_n_0 ),
        .I3(LINK_TIMER_reg__0[6]),
        .I4(LINK_TIMER_reg__0[8]),
        .O(plusOp__1[9]));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \LINK_TIMER[9]_i_3 
       (.I0(LINK_TIMER_reg__0[5]),
        .I1(LINK_TIMER_reg__0[4]),
        .I2(LINK_TIMER_reg__0[2]),
        .I3(LINK_TIMER_reg__0[1]),
        .I4(LINK_TIMER_reg__0[0]),
        .I5(LINK_TIMER_reg__0[3]),
        .O(\LINK_TIMER[9]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h8000)) 
    LINK_TIMER_DONE_i_1
       (.I0(LINK_TIMER_DONE_i_2_n_0),
        .I1(\STATE[3]_i_3_n_0 ),
        .I2(\STATE[2]_i_5_n_0 ),
        .I3(LINK_TIMER_DONE_i_3_n_0),
        .O(LINK_TIMER_DONE_i_1_n_0));
  LUT5 #(
    .INIT(32'h00001110)) 
    LINK_TIMER_DONE_i_2
       (.I0(START_LINK_TIMER_REG),
        .I1(out),
        .I2(LINK_TIMER_SATURATED),
        .I3(LINK_TIMER_DONE),
        .I4(START_LINK_TIMER_REG2),
        .O(LINK_TIMER_DONE_i_2_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFF3FF55)) 
    LINK_TIMER_DONE_i_3
       (.I0(AN_ENABLE_INT),
        .I1(LINK_TIMER_DONE),
        .I2(START_LINK_TIMER_REG_i_3_n_0),
        .I3(STATE[1]),
        .I4(STATE[2]),
        .I5(LINK_TIMER_DONE_i_4_n_0),
        .O(LINK_TIMER_DONE_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT2 #(
    .INIT(4'hE)) 
    LINK_TIMER_DONE_i_4
       (.I0(STATE[0]),
        .I1(STATE[3]),
        .O(LINK_TIMER_DONE_i_4_n_0));
  FDRE #(
    .INIT(1'b0)) 
    LINK_TIMER_DONE_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(LINK_TIMER_DONE_i_1_n_0),
        .Q(LINK_TIMER_DONE),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h00000040)) 
    LINK_TIMER_SATURATED_i_1
       (.I0(LINK_TIMER_reg__0[3]),
        .I1(LINK_TIMER_reg__0[5]),
        .I2(LINK_TIMER_reg__0[4]),
        .I3(LINK_TIMER_reg__0[6]),
        .I4(LINK_TIMER_SATURATED_i_2_n_0),
        .O(LINK_TIMER_SATURATED_COMB));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFD)) 
    LINK_TIMER_SATURATED_i_2
       (.I0(LINK_TIMER_reg__0[1]),
        .I1(LINK_TIMER_reg__0[0]),
        .I2(LINK_TIMER_reg__0[7]),
        .I3(LINK_TIMER_reg__0[8]),
        .I4(LINK_TIMER_reg__0[2]),
        .I5(LINK_TIMER_reg__0[9]),
        .O(LINK_TIMER_SATURATED_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    LINK_TIMER_SATURATED_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(LINK_TIMER_SATURATED_COMB),
        .Q(LINK_TIMER_SATURATED),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \LINK_TIMER_reg[0] 
       (.C(userclk2),
        .CE(PULSE4096),
        .D(\LINK_TIMER[0]_i_1_n_0 ),
        .Q(LINK_TIMER_reg__0[0]),
        .R(\LINK_TIMER[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \LINK_TIMER_reg[1] 
       (.C(userclk2),
        .CE(PULSE4096),
        .D(plusOp__1[1]),
        .Q(LINK_TIMER_reg__0[1]),
        .R(\LINK_TIMER[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \LINK_TIMER_reg[2] 
       (.C(userclk2),
        .CE(PULSE4096),
        .D(plusOp__1[2]),
        .Q(LINK_TIMER_reg__0[2]),
        .R(\LINK_TIMER[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \LINK_TIMER_reg[3] 
       (.C(userclk2),
        .CE(PULSE4096),
        .D(plusOp__1[3]),
        .Q(LINK_TIMER_reg__0[3]),
        .R(\LINK_TIMER[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \LINK_TIMER_reg[4] 
       (.C(userclk2),
        .CE(PULSE4096),
        .D(plusOp__1[4]),
        .Q(LINK_TIMER_reg__0[4]),
        .R(\LINK_TIMER[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \LINK_TIMER_reg[5] 
       (.C(userclk2),
        .CE(PULSE4096),
        .D(plusOp__1[5]),
        .Q(LINK_TIMER_reg__0[5]),
        .R(\LINK_TIMER[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \LINK_TIMER_reg[6] 
       (.C(userclk2),
        .CE(PULSE4096),
        .D(plusOp__1[6]),
        .Q(LINK_TIMER_reg__0[6]),
        .R(\LINK_TIMER[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \LINK_TIMER_reg[7] 
       (.C(userclk2),
        .CE(PULSE4096),
        .D(plusOp__1[7]),
        .Q(LINK_TIMER_reg__0[7]),
        .R(\LINK_TIMER[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \LINK_TIMER_reg[8] 
       (.C(userclk2),
        .CE(PULSE4096),
        .D(plusOp__1[8]),
        .Q(LINK_TIMER_reg__0[8]),
        .R(\LINK_TIMER[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \LINK_TIMER_reg[9] 
       (.C(userclk2),
        .CE(PULSE4096),
        .D(plusOp__1[9]),
        .Q(LINK_TIMER_reg__0[9]),
        .R(\LINK_TIMER[9]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h5155)) 
    \MASK_RUDI_BUFERR_TIMER[0]_i_1 
       (.I0(MASK_RUDI_BUFERR_TIMER[0]),
        .I1(data_out),
        .I2(\CONFIG_REG_WITH_AN.POWERDOWN_REG_reg ),
        .I3(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXBUFSTATUS_INT_reg[1] ),
        .O(\MASK_RUDI_BUFERR_TIMER[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT4 #(
    .INIT(16'hA2AA)) 
    \MASK_RUDI_BUFERR_TIMER[10]_i_1 
       (.I0(\plusOp_inferred__0/i__carry__0_n_14 ),
        .I1(data_out),
        .I2(\CONFIG_REG_WITH_AN.POWERDOWN_REG_reg ),
        .I3(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXBUFSTATUS_INT_reg[1] ),
        .O(\MASK_RUDI_BUFERR_TIMER[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT4 #(
    .INIT(16'hA2AA)) 
    \MASK_RUDI_BUFERR_TIMER[11]_i_1 
       (.I0(\plusOp_inferred__0/i__carry__0_n_13 ),
        .I1(data_out),
        .I2(\CONFIG_REG_WITH_AN.POWERDOWN_REG_reg ),
        .I3(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXBUFSTATUS_INT_reg[1] ),
        .O(\MASK_RUDI_BUFERR_TIMER[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT4 #(
    .INIT(16'hA2AA)) 
    \MASK_RUDI_BUFERR_TIMER[12]_i_2 
       (.I0(\plusOp_inferred__0/i__carry__0_n_12 ),
        .I1(data_out),
        .I2(\CONFIG_REG_WITH_AN.POWERDOWN_REG_reg ),
        .I3(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXBUFSTATUS_INT_reg[1] ),
        .O(\MASK_RUDI_BUFERR_TIMER[12]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h20000000)) 
    \MASK_RUDI_BUFERR_TIMER[12]_i_3 
       (.I0(\MASK_RUDI_BUFERR_TIMER[12]_i_4_n_0 ),
        .I1(\MASK_RUDI_BUFERR_TIMER[12]_i_5_n_0 ),
        .I2(MASK_RUDI_BUFERR_TIMER[3]),
        .I3(MASK_RUDI_BUFERR_TIMER[1]),
        .I4(MASK_RUDI_BUFERR_TIMER[8]),
        .O(MASK_RUDI_BUFERR_reg_0));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \MASK_RUDI_BUFERR_TIMER[12]_i_4 
       (.I0(MASK_RUDI_BUFERR_TIMER[10]),
        .I1(MASK_RUDI_BUFERR_TIMER[12]),
        .I2(MASK_RUDI_BUFERR_TIMER[0]),
        .I3(MASK_RUDI_BUFERR_TIMER[2]),
        .I4(MASK_RUDI_BUFERR_TIMER[7]),
        .I5(MASK_RUDI_BUFERR_TIMER[4]),
        .O(\MASK_RUDI_BUFERR_TIMER[12]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \MASK_RUDI_BUFERR_TIMER[12]_i_5 
       (.I0(MASK_RUDI_BUFERR_TIMER[6]),
        .I1(MASK_RUDI_BUFERR_TIMER[5]),
        .I2(MASK_RUDI_BUFERR_TIMER[11]),
        .I3(MASK_RUDI_BUFERR_TIMER[9]),
        .O(\MASK_RUDI_BUFERR_TIMER[12]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT4 #(
    .INIT(16'hA2AA)) 
    \MASK_RUDI_BUFERR_TIMER[1]_i_1 
       (.I0(\plusOp_inferred__0/i__carry_n_15 ),
        .I1(data_out),
        .I2(\CONFIG_REG_WITH_AN.POWERDOWN_REG_reg ),
        .I3(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXBUFSTATUS_INT_reg[1] ),
        .O(\MASK_RUDI_BUFERR_TIMER[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT4 #(
    .INIT(16'hA2AA)) 
    \MASK_RUDI_BUFERR_TIMER[2]_i_1 
       (.I0(\plusOp_inferred__0/i__carry_n_14 ),
        .I1(data_out),
        .I2(\CONFIG_REG_WITH_AN.POWERDOWN_REG_reg ),
        .I3(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXBUFSTATUS_INT_reg[1] ),
        .O(\MASK_RUDI_BUFERR_TIMER[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT4 #(
    .INIT(16'hA2AA)) 
    \MASK_RUDI_BUFERR_TIMER[3]_i_1 
       (.I0(\plusOp_inferred__0/i__carry_n_13 ),
        .I1(data_out),
        .I2(\CONFIG_REG_WITH_AN.POWERDOWN_REG_reg ),
        .I3(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXBUFSTATUS_INT_reg[1] ),
        .O(\MASK_RUDI_BUFERR_TIMER[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT4 #(
    .INIT(16'hA2AA)) 
    \MASK_RUDI_BUFERR_TIMER[4]_i_1 
       (.I0(\plusOp_inferred__0/i__carry_n_12 ),
        .I1(data_out),
        .I2(\CONFIG_REG_WITH_AN.POWERDOWN_REG_reg ),
        .I3(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXBUFSTATUS_INT_reg[1] ),
        .O(\MASK_RUDI_BUFERR_TIMER[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT4 #(
    .INIT(16'hA2AA)) 
    \MASK_RUDI_BUFERR_TIMER[5]_i_1 
       (.I0(\plusOp_inferred__0/i__carry_n_11 ),
        .I1(data_out),
        .I2(\CONFIG_REG_WITH_AN.POWERDOWN_REG_reg ),
        .I3(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXBUFSTATUS_INT_reg[1] ),
        .O(\MASK_RUDI_BUFERR_TIMER[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT4 #(
    .INIT(16'hA2AA)) 
    \MASK_RUDI_BUFERR_TIMER[6]_i_1 
       (.I0(\plusOp_inferred__0/i__carry_n_10 ),
        .I1(data_out),
        .I2(\CONFIG_REG_WITH_AN.POWERDOWN_REG_reg ),
        .I3(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXBUFSTATUS_INT_reg[1] ),
        .O(\MASK_RUDI_BUFERR_TIMER[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT4 #(
    .INIT(16'hA2AA)) 
    \MASK_RUDI_BUFERR_TIMER[7]_i_1 
       (.I0(\plusOp_inferred__0/i__carry_n_9 ),
        .I1(data_out),
        .I2(\CONFIG_REG_WITH_AN.POWERDOWN_REG_reg ),
        .I3(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXBUFSTATUS_INT_reg[1] ),
        .O(\MASK_RUDI_BUFERR_TIMER[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT4 #(
    .INIT(16'hA2AA)) 
    \MASK_RUDI_BUFERR_TIMER[8]_i_1 
       (.I0(\plusOp_inferred__0/i__carry_n_8 ),
        .I1(data_out),
        .I2(\CONFIG_REG_WITH_AN.POWERDOWN_REG_reg ),
        .I3(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXBUFSTATUS_INT_reg[1] ),
        .O(\MASK_RUDI_BUFERR_TIMER[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT4 #(
    .INIT(16'hA2AA)) 
    \MASK_RUDI_BUFERR_TIMER[9]_i_1 
       (.I0(\plusOp_inferred__0/i__carry__0_n_15 ),
        .I1(data_out),
        .I2(\CONFIG_REG_WITH_AN.POWERDOWN_REG_reg ),
        .I3(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXBUFSTATUS_INT_reg[1] ),
        .O(\MASK_RUDI_BUFERR_TIMER[9]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \MASK_RUDI_BUFERR_TIMER_reg[0] 
       (.C(userclk2),
        .CE(data_sync_reg6),
        .D(\MASK_RUDI_BUFERR_TIMER[0]_i_1_n_0 ),
        .Q(MASK_RUDI_BUFERR_TIMER[0]),
        .S(out));
  FDSE #(
    .INIT(1'b0)) 
    \MASK_RUDI_BUFERR_TIMER_reg[10] 
       (.C(userclk2),
        .CE(data_sync_reg6),
        .D(\MASK_RUDI_BUFERR_TIMER[10]_i_1_n_0 ),
        .Q(MASK_RUDI_BUFERR_TIMER[10]),
        .S(out));
  FDSE #(
    .INIT(1'b0)) 
    \MASK_RUDI_BUFERR_TIMER_reg[11] 
       (.C(userclk2),
        .CE(data_sync_reg6),
        .D(\MASK_RUDI_BUFERR_TIMER[11]_i_1_n_0 ),
        .Q(MASK_RUDI_BUFERR_TIMER[11]),
        .S(out));
  FDSE #(
    .INIT(1'b0)) 
    \MASK_RUDI_BUFERR_TIMER_reg[12] 
       (.C(userclk2),
        .CE(data_sync_reg6),
        .D(\MASK_RUDI_BUFERR_TIMER[12]_i_2_n_0 ),
        .Q(MASK_RUDI_BUFERR_TIMER[12]),
        .S(out));
  FDSE #(
    .INIT(1'b0)) 
    \MASK_RUDI_BUFERR_TIMER_reg[1] 
       (.C(userclk2),
        .CE(data_sync_reg6),
        .D(\MASK_RUDI_BUFERR_TIMER[1]_i_1_n_0 ),
        .Q(MASK_RUDI_BUFERR_TIMER[1]),
        .S(out));
  FDSE #(
    .INIT(1'b0)) 
    \MASK_RUDI_BUFERR_TIMER_reg[2] 
       (.C(userclk2),
        .CE(data_sync_reg6),
        .D(\MASK_RUDI_BUFERR_TIMER[2]_i_1_n_0 ),
        .Q(MASK_RUDI_BUFERR_TIMER[2]),
        .S(out));
  FDSE #(
    .INIT(1'b0)) 
    \MASK_RUDI_BUFERR_TIMER_reg[3] 
       (.C(userclk2),
        .CE(data_sync_reg6),
        .D(\MASK_RUDI_BUFERR_TIMER[3]_i_1_n_0 ),
        .Q(MASK_RUDI_BUFERR_TIMER[3]),
        .S(out));
  FDSE #(
    .INIT(1'b0)) 
    \MASK_RUDI_BUFERR_TIMER_reg[4] 
       (.C(userclk2),
        .CE(data_sync_reg6),
        .D(\MASK_RUDI_BUFERR_TIMER[4]_i_1_n_0 ),
        .Q(MASK_RUDI_BUFERR_TIMER[4]),
        .S(out));
  FDSE #(
    .INIT(1'b0)) 
    \MASK_RUDI_BUFERR_TIMER_reg[5] 
       (.C(userclk2),
        .CE(data_sync_reg6),
        .D(\MASK_RUDI_BUFERR_TIMER[5]_i_1_n_0 ),
        .Q(MASK_RUDI_BUFERR_TIMER[5]),
        .S(out));
  FDSE #(
    .INIT(1'b0)) 
    \MASK_RUDI_BUFERR_TIMER_reg[6] 
       (.C(userclk2),
        .CE(data_sync_reg6),
        .D(\MASK_RUDI_BUFERR_TIMER[6]_i_1_n_0 ),
        .Q(MASK_RUDI_BUFERR_TIMER[6]),
        .S(out));
  FDSE #(
    .INIT(1'b0)) 
    \MASK_RUDI_BUFERR_TIMER_reg[7] 
       (.C(userclk2),
        .CE(data_sync_reg6),
        .D(\MASK_RUDI_BUFERR_TIMER[7]_i_1_n_0 ),
        .Q(MASK_RUDI_BUFERR_TIMER[7]),
        .S(out));
  FDSE #(
    .INIT(1'b0)) 
    \MASK_RUDI_BUFERR_TIMER_reg[8] 
       (.C(userclk2),
        .CE(data_sync_reg6),
        .D(\MASK_RUDI_BUFERR_TIMER[8]_i_1_n_0 ),
        .Q(MASK_RUDI_BUFERR_TIMER[8]),
        .S(out));
  FDSE #(
    .INIT(1'b0)) 
    \MASK_RUDI_BUFERR_TIMER_reg[9] 
       (.C(userclk2),
        .CE(data_sync_reg6),
        .D(\MASK_RUDI_BUFERR_TIMER[9]_i_1_n_0 ),
        .Q(MASK_RUDI_BUFERR_TIMER[9]),
        .S(out));
  LUT5 #(
    .INIT(32'h20FF2020)) 
    MASK_RUDI_BUFERR_i_1
       (.I0(data_out),
        .I1(\CONFIG_REG_WITH_AN.POWERDOWN_REG_reg ),
        .I2(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXBUFSTATUS_INT_reg[1] ),
        .I3(MASK_RUDI_BUFERR_reg_0),
        .I4(MASK_RUDI_BUFERR),
        .O(MASK_RUDI_BUFERR_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    MASK_RUDI_BUFERR_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(MASK_RUDI_BUFERR_i_1_n_0),
        .Q(MASK_RUDI_BUFERR),
        .R(out));
  LUT5 #(
    .INIT(32'hFFFBFFF0)) 
    MASK_RUDI_CLKCOR_i_1
       (.I0(RX_RUDI_INVALID),
        .I1(RX_RUDI_INVALID_REG),
        .I2(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCLKCORCNT_INT_reg[2] [1]),
        .I3(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCLKCORCNT_INT_reg[2] [0]),
        .I4(MASK_RUDI_CLKCOR),
        .O(MASK_RUDI_CLKCOR_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    MASK_RUDI_CLKCOR_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(MASK_RUDI_CLKCOR_i_1_n_0),
        .Q(MASK_RUDI_CLKCOR),
        .R(\MGT_RESET.SRESET_reg ));
  LUT6 #(
    .INIT(64'h2232222222222020)) 
    MR_AN_COMPLETE_i_1
       (.I0(MR_AN_COMPLETE),
        .I1(out),
        .I2(STATE[0]),
        .I3(STATE[3]),
        .I4(STATE[2]),
        .I5(STATE[1]),
        .O(MR_AN_COMPLETE_i_1_n_0));
  FDRE MR_AN_COMPLETE_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(MR_AN_COMPLETE_i_1_n_0),
        .Q(MR_AN_COMPLETE),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    MR_AN_ENABLE_CHANGE_i_1
       (.I0(MR_AN_ENABLE_REG2),
        .I1(MR_AN_ENABLE_REG1),
        .O(MR_AN_ENABLE_CHANGE0));
  FDRE #(
    .INIT(1'b0)) 
    MR_AN_ENABLE_CHANGE_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(MR_AN_ENABLE_CHANGE0),
        .Q(MR_AN_ENABLE_CHANGE),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    MR_AN_ENABLE_REG1_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(AN_ENABLE_INT),
        .Q(MR_AN_ENABLE_REG1),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    MR_AN_ENABLE_REG2_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(MR_AN_ENABLE_REG1),
        .Q(MR_AN_ENABLE_REG2),
        .R(out));
  LUT5 #(
    .INIT(32'h0000AE00)) 
    MR_LINK_STATUS_i_1
       (.I0(MR_LINK_STATUS),
        .I1(CLEAR_STATUS_REG1),
        .I2(CLEAR_STATUS_REG2),
        .I3(XMIT_DATA_INT),
        .I4(out),
        .O(MR_LINK_STATUS_i_1_n_0));
  FDRE MR_LINK_STATUS_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(MR_LINK_STATUS_i_1_n_0),
        .Q(MR_LINK_STATUS),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \MR_LP_ADV_ABILITY_INT_reg[11] 
       (.C(userclk2),
        .CE(MR_PAGE_RX_SET119_out),
        .D(Q[10]),
        .Q(MR_REMOTE_FAULT_reg_0[0]),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \MR_LP_ADV_ABILITY_INT_reg[13] 
       (.C(userclk2),
        .CE(MR_PAGE_RX_SET119_out),
        .D(Q[12]),
        .Q(MR_REMOTE_FAULT_reg_0[1]),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \MR_LP_ADV_ABILITY_INT_reg[15] 
       (.C(userclk2),
        .CE(MR_PAGE_RX_SET119_out),
        .D(Q[14]),
        .Q(MR_REMOTE_FAULT_reg_0[2]),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \MR_LP_ADV_ABILITY_INT_reg[16] 
       (.C(userclk2),
        .CE(MR_PAGE_RX_SET119_out),
        .D(Q[15]),
        .Q(MR_REMOTE_FAULT_reg_0[3]),
        .R(out));
  LUT5 #(
    .INIT(32'hF4FF4444)) 
    MR_REMOTE_FAULT_i_1
       (.I0(MR_REMOTE_FAULT_reg_0[3]),
        .I1(GENERATE_REMOTE_FAULT),
        .I2(CLEAR_STATUS_REG2),
        .I3(CLEAR_STATUS_REG1),
        .I4(status_vector[5]),
        .O(MR_REMOTE_FAULT_i_1_n_0));
  FDRE MR_REMOTE_FAULT_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(MR_REMOTE_FAULT_i_1_n_0),
        .Q(status_vector[5]),
        .R(out));
  LUT5 #(
    .INIT(32'hAE0C0C0C)) 
    MR_RESTART_AN_INT_i_1
       (.I0(XMIT_CONFIG_INT_i_3_n_0),
        .I1(MR_RESTART_AN_SET_REG1),
        .I2(MR_RESTART_AN_SET_REG2),
        .I3(AN_ENABLE_INT),
        .I4(MR_RESTART_AN_INT),
        .O(MR_RESTART_AN_INT_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    MR_RESTART_AN_INT_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(MR_RESTART_AN_INT_i_1_n_0),
        .Q(MR_RESTART_AN_INT),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    MR_RESTART_AN_SET_REG1_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(RESTART_AN_REG),
        .Q(MR_RESTART_AN_SET_REG1),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    MR_RESTART_AN_SET_REG2_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(MR_RESTART_AN_SET_REG1),
        .Q(MR_RESTART_AN_SET_REG2),
        .R(out));
  FDRE \PREVIOUS_STATE_reg[0] 
       (.C(userclk2),
        .CE(1'b1),
        .D(STATE[0]),
        .Q(PREVIOUS_STATE[0]),
        .R(out));
  FDRE \PREVIOUS_STATE_reg[1] 
       (.C(userclk2),
        .CE(1'b1),
        .D(STATE[1]),
        .Q(PREVIOUS_STATE[1]),
        .R(out));
  FDRE \PREVIOUS_STATE_reg[2] 
       (.C(userclk2),
        .CE(1'b1),
        .D(STATE[2]),
        .Q(PREVIOUS_STATE[2]),
        .R(out));
  FDRE \PREVIOUS_STATE_reg[3] 
       (.C(userclk2),
        .CE(1'b1),
        .D(STATE[3]),
        .Q(PREVIOUS_STATE[3]),
        .R(out));
  LUT2 #(
    .INIT(4'h2)) 
    PULSE4096_i_1
       (.I0(TIMER4096_MSB_REG),
        .I1(TIMER4096_reg__0),
        .O(PULSE40960));
  FDRE #(
    .INIT(1'b0)) 
    PULSE4096_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(PULSE40960),
        .Q(PULSE4096),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    RECEIVED_IDLE_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(I_REG_reg),
        .Q(RECEIVED_IDLE),
        .R(out));
  FDRE RUDI_INVALID_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(RX_RUDI_INVALID_DELAY[1]),
        .Q(status_vector[0]),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    RX_CONFIG_REG_NULL_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(RX_CONFIG_VALID_INT_reg_0),
        .Q(RX_CONFIG_REG_NULL_reg_0),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \RX_CONFIG_REG_REG_reg[0] 
       (.C(userclk2),
        .CE(RX_CONFIG_VALID),
        .D(Q[0]),
        .Q(CONFIG_REG_MATCH_reg_2[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RX_CONFIG_REG_REG_reg[10] 
       (.C(userclk2),
        .CE(RX_CONFIG_VALID),
        .D(Q[10]),
        .Q(\RX_CONFIG_REG_REG_reg_n_0_[10] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RX_CONFIG_REG_REG_reg[11] 
       (.C(userclk2),
        .CE(RX_CONFIG_VALID),
        .D(Q[11]),
        .Q(\RX_CONFIG_REG_REG_reg_n_0_[11] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RX_CONFIG_REG_REG_reg[12] 
       (.C(userclk2),
        .CE(RX_CONFIG_VALID),
        .D(Q[12]),
        .Q(CONFIG_REG_MATCH_reg_2[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RX_CONFIG_REG_REG_reg[13] 
       (.C(userclk2),
        .CE(RX_CONFIG_VALID),
        .D(Q[13]),
        .Q(CONFIG_REG_MATCH_reg_2[7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RX_CONFIG_REG_REG_reg[14] 
       (.C(userclk2),
        .CE(RX_CONFIG_VALID),
        .D(Q[14]),
        .Q(CONFIG_REG_MATCH_reg_2[8]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RX_CONFIG_REG_REG_reg[15] 
       (.C(userclk2),
        .CE(RX_CONFIG_VALID),
        .D(Q[15]),
        .Q(CONFIG_REG_MATCH_reg_2[9]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RX_CONFIG_REG_REG_reg[1] 
       (.C(userclk2),
        .CE(RX_CONFIG_VALID),
        .D(Q[1]),
        .Q(CONFIG_REG_MATCH_reg_2[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RX_CONFIG_REG_REG_reg[2] 
       (.C(userclk2),
        .CE(RX_CONFIG_VALID),
        .D(Q[2]),
        .Q(CONFIG_REG_MATCH_reg_2[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RX_CONFIG_REG_REG_reg[3] 
       (.C(userclk2),
        .CE(RX_CONFIG_VALID),
        .D(Q[3]),
        .Q(\RX_CONFIG_REG_REG_reg_n_0_[3] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RX_CONFIG_REG_REG_reg[4] 
       (.C(userclk2),
        .CE(RX_CONFIG_VALID),
        .D(Q[4]),
        .Q(\RX_CONFIG_REG_REG_reg_n_0_[4] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RX_CONFIG_REG_REG_reg[5] 
       (.C(userclk2),
        .CE(RX_CONFIG_VALID),
        .D(Q[5]),
        .Q(CONFIG_REG_MATCH_reg_2[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RX_CONFIG_REG_REG_reg[6] 
       (.C(userclk2),
        .CE(RX_CONFIG_VALID),
        .D(Q[6]),
        .Q(CONFIG_REG_MATCH_reg_2[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RX_CONFIG_REG_REG_reg[7] 
       (.C(userclk2),
        .CE(RX_CONFIG_VALID),
        .D(Q[7]),
        .Q(\RX_CONFIG_REG_REG_reg_n_0_[7] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RX_CONFIG_REG_REG_reg[8] 
       (.C(userclk2),
        .CE(RX_CONFIG_VALID),
        .D(Q[8]),
        .Q(\RX_CONFIG_REG_REG_reg_n_0_[8] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \RX_CONFIG_REG_REG_reg[9] 
       (.C(userclk2),
        .CE(RX_CONFIG_VALID),
        .D(Q[9]),
        .Q(CONFIG_REG_MATCH_reg_2[5]),
        .R(SR));
  LUT5 #(
    .INIT(32'h00800000)) 
    \RX_CONFIG_SNAPSHOT[15]_i_1 
       (.I0(\RX_CONFIG_SNAPSHOT[15]_i_2_n_0 ),
        .I1(RX_CONFIG_VALID),
        .I2(ABILITY_MATCH_2),
        .I3(ABILITY_MATCH),
        .I4(CONFIG_REG_MATCH),
        .O(RX_CONFIG_SNAPSHOT));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT4 #(
    .INIT(16'hFFDF)) 
    \RX_CONFIG_SNAPSHOT[15]_i_2 
       (.I0(STATE[0]),
        .I1(STATE[3]),
        .I2(STATE[1]),
        .I3(STATE[2]),
        .O(\RX_CONFIG_SNAPSHOT[15]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \RX_CONFIG_SNAPSHOT_reg[0] 
       (.C(userclk2),
        .CE(RX_CONFIG_SNAPSHOT),
        .D(Q[0]),
        .Q(\RX_CONFIG_SNAPSHOT_reg_n_0_[0] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \RX_CONFIG_SNAPSHOT_reg[10] 
       (.C(userclk2),
        .CE(RX_CONFIG_SNAPSHOT),
        .D(Q[10]),
        .Q(\RX_CONFIG_SNAPSHOT_reg_n_0_[10] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \RX_CONFIG_SNAPSHOT_reg[11] 
       (.C(userclk2),
        .CE(RX_CONFIG_SNAPSHOT),
        .D(Q[11]),
        .Q(\RX_CONFIG_SNAPSHOT_reg_n_0_[11] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \RX_CONFIG_SNAPSHOT_reg[12] 
       (.C(userclk2),
        .CE(RX_CONFIG_SNAPSHOT),
        .D(Q[12]),
        .Q(\RX_CONFIG_SNAPSHOT_reg_n_0_[12] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \RX_CONFIG_SNAPSHOT_reg[13] 
       (.C(userclk2),
        .CE(RX_CONFIG_SNAPSHOT),
        .D(Q[13]),
        .Q(\RX_CONFIG_SNAPSHOT_reg_n_0_[13] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \RX_CONFIG_SNAPSHOT_reg[15] 
       (.C(userclk2),
        .CE(RX_CONFIG_SNAPSHOT),
        .D(Q[15]),
        .Q(\RX_CONFIG_SNAPSHOT_reg_n_0_[15] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \RX_CONFIG_SNAPSHOT_reg[1] 
       (.C(userclk2),
        .CE(RX_CONFIG_SNAPSHOT),
        .D(Q[1]),
        .Q(\RX_CONFIG_SNAPSHOT_reg_n_0_[1] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \RX_CONFIG_SNAPSHOT_reg[2] 
       (.C(userclk2),
        .CE(RX_CONFIG_SNAPSHOT),
        .D(Q[2]),
        .Q(\RX_CONFIG_SNAPSHOT_reg_n_0_[2] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \RX_CONFIG_SNAPSHOT_reg[3] 
       (.C(userclk2),
        .CE(RX_CONFIG_SNAPSHOT),
        .D(Q[3]),
        .Q(\RX_CONFIG_SNAPSHOT_reg_n_0_[3] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \RX_CONFIG_SNAPSHOT_reg[4] 
       (.C(userclk2),
        .CE(RX_CONFIG_SNAPSHOT),
        .D(Q[4]),
        .Q(\RX_CONFIG_SNAPSHOT_reg_n_0_[4] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \RX_CONFIG_SNAPSHOT_reg[5] 
       (.C(userclk2),
        .CE(RX_CONFIG_SNAPSHOT),
        .D(Q[5]),
        .Q(\RX_CONFIG_SNAPSHOT_reg_n_0_[5] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \RX_CONFIG_SNAPSHOT_reg[6] 
       (.C(userclk2),
        .CE(RX_CONFIG_SNAPSHOT),
        .D(Q[6]),
        .Q(\RX_CONFIG_SNAPSHOT_reg_n_0_[6] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \RX_CONFIG_SNAPSHOT_reg[7] 
       (.C(userclk2),
        .CE(RX_CONFIG_SNAPSHOT),
        .D(Q[7]),
        .Q(\RX_CONFIG_SNAPSHOT_reg_n_0_[7] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \RX_CONFIG_SNAPSHOT_reg[8] 
       (.C(userclk2),
        .CE(RX_CONFIG_SNAPSHOT),
        .D(Q[8]),
        .Q(\RX_CONFIG_SNAPSHOT_reg_n_0_[8] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \RX_CONFIG_SNAPSHOT_reg[9] 
       (.C(userclk2),
        .CE(RX_CONFIG_SNAPSHOT),
        .D(Q[9]),
        .Q(\RX_CONFIG_SNAPSHOT_reg_n_0_[9] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    RX_IDLE_REG1_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(RX_IDLE),
        .Q(RX_IDLE_REG1),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    RX_IDLE_REG2_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(RX_IDLE_REG1),
        .Q(RX_IDLE_REG2),
        .R(out));
  LUT5 #(
    .INIT(32'h000000F1)) 
    \RX_RUDI_INVALID_DELAY[0]_i_1 
       (.I0(RXSYNC_STATUS),
        .I1(XMIT_DATA),
        .I2(RX_INVALID),
        .I3(MASK_RUDI_CLKCOR),
        .I4(MASK_RUDI_BUFERR),
        .O(RX_RUDI_INVALID_DELAY0));
  FDRE #(
    .INIT(1'b0)) 
    \RX_RUDI_INVALID_DELAY_reg[0] 
       (.C(userclk2),
        .CE(1'b1),
        .D(RX_RUDI_INVALID_DELAY0),
        .Q(RX_RUDI_INVALID_DELAY[0]),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \RX_RUDI_INVALID_DELAY_reg[1] 
       (.C(userclk2),
        .CE(1'b1),
        .D(RX_RUDI_INVALID_DELAY[0]),
        .Q(RX_RUDI_INVALID_DELAY[1]),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    RX_RUDI_INVALID_REG_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(RX_RUDI_INVALID),
        .Q(RX_RUDI_INVALID_REG),
        .R(\MGT_RESET.SRESET_reg ));
  FDRE SGMII_PHY_STATUS_reg
       (.C(userclk2),
        .CE(MR_PAGE_RX_SET119_out),
        .D(Q[15]),
        .Q(status_vector[1]),
        .R(out));
  LUT5 #(
    .INIT(32'h02000000)) 
    \SGMII_SPEED[1]_i_1 
       (.I0(\SGMII_SPEED[1]_i_2_n_0 ),
        .I1(PREVIOUS_STATE[3]),
        .I2(PREVIOUS_STATE[2]),
        .I3(PREVIOUS_STATE[0]),
        .I4(PREVIOUS_STATE[1]),
        .O(MR_PAGE_RX_SET119_out));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'h0004)) 
    \SGMII_SPEED[1]_i_2 
       (.I0(STATE[1]),
        .I1(STATE[2]),
        .I2(STATE[3]),
        .I3(STATE[0]),
        .O(\SGMII_SPEED[1]_i_2_n_0 ));
  FDRE \SGMII_SPEED_reg[0] 
       (.C(userclk2),
        .CE(MR_PAGE_RX_SET119_out),
        .D(Q[10]),
        .Q(status_vector[3]),
        .R(out));
  FDSE \SGMII_SPEED_reg[1] 
       (.C(userclk2),
        .CE(MR_PAGE_RX_SET119_out),
        .D(Q[11]),
        .Q(status_vector[4]),
        .S(out));
  FDRE #(
    .INIT(1'b0)) 
    START_LINK_TIMER_REG2_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(START_LINK_TIMER_REG),
        .Q(START_LINK_TIMER_REG2),
        .R(out));
  LUT6 #(
    .INIT(64'hAEAAFFFFFFFFFFFF)) 
    START_LINK_TIMER_REG_i_1
       (.I0(START_LINK_TIMER_REG_i_2_n_0),
        .I1(LINK_TIMER_DONE),
        .I2(START_LINK_TIMER_REG_i_3_n_0),
        .I3(\SGMII_SPEED[1]_i_2_n_0 ),
        .I4(\STATE[2]_i_5_n_0 ),
        .I5(\STATE[3]_i_3_n_0 ),
        .O(START_LINK_TIMER));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT5 #(
    .INIT(32'h00000002)) 
    START_LINK_TIMER_REG_i_2
       (.I0(AN_ENABLE_INT),
        .I1(STATE[0]),
        .I2(STATE[3]),
        .I3(STATE[2]),
        .I4(STATE[1]),
        .O(START_LINK_TIMER_REG_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h8)) 
    START_LINK_TIMER_REG_i_3
       (.I0(ABILITY_MATCH),
        .I1(RX_CONFIG_REG_NULL_reg_0),
        .O(START_LINK_TIMER_REG_i_3_n_0));
  FDRE #(
    .INIT(1'b0)) 
    START_LINK_TIMER_REG_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(START_LINK_TIMER),
        .Q(START_LINK_TIMER_REG),
        .R(out));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT4 #(
    .INIT(16'h00A2)) 
    \STATE[0]_i_1 
       (.I0(\STATE[3]_i_3_n_0 ),
        .I1(\STATE[0]_i_2_n_0 ),
        .I2(\STATE[0]_i_3_n_0 ),
        .I3(STATE[3]),
        .O(\STATE[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFBABAAAAFBAB)) 
    \STATE[0]_i_2 
       (.I0(STATE[2]),
        .I1(AN_ENABLE_INT),
        .I2(STATE[0]),
        .I3(LINK_TIMER_DONE),
        .I4(STATE[1]),
        .I5(\STATE[0]_i_4_n_0 ),
        .O(\STATE[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCFFF8F8FCCCC8888)) 
    \STATE[0]_i_3 
       (.I0(LINK_TIMER_DONE),
        .I1(\STATE[2]_i_2_n_0 ),
        .I2(\STATE[2]_i_3_n_0 ),
        .I3(ABILITY_MATCH),
        .I4(STATE[0]),
        .I5(\STATE[2]_i_4_n_0 ),
        .O(\STATE[0]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT4 #(
    .INIT(16'hF833)) 
    \STATE[0]_i_4 
       (.I0(ACKNOWLEDGE_MATCH_3_reg_n_0),
        .I1(STATE[0]),
        .I2(RX_CONFIG_REG_NULL_reg_0),
        .I3(ABILITY_MATCH),
        .O(\STATE[0]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \STATE[1]_i_1 
       (.I0(\STATE[3]_i_3_n_0 ),
        .I1(\STATE[1]_i_2_n_0 ),
        .I2(STATE[3]),
        .O(\STATE[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h000000000EEEEEEE)) 
    \STATE[1]_i_2 
       (.I0(\STATE[1]_i_3_n_0 ),
        .I1(\STATE[1]_i_4_n_0 ),
        .I2(\STATE[2]_i_2_n_0 ),
        .I3(\STATE[1]_i_5_n_0 ),
        .I4(IDLE_MATCH),
        .I5(\STATE[2]_i_4_n_0 ),
        .O(\STATE[1]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT4 #(
    .INIT(16'hAABF)) 
    \STATE[1]_i_3 
       (.I0(STATE[2]),
        .I1(LINK_TIMER_DONE),
        .I2(STATE[0]),
        .I3(STATE[1]),
        .O(\STATE[1]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT5 #(
    .INIT(32'hA8000000)) 
    \STATE[1]_i_4 
       (.I0(ABILITY_MATCH),
        .I1(ACKNOWLEDGE_MATCH_3_reg_n_0),
        .I2(RX_CONFIG_REG_NULL_reg_0),
        .I3(STATE[1]),
        .I4(STATE[0]),
        .O(\STATE[1]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \STATE[1]_i_5 
       (.I0(LINK_TIMER_DONE),
        .I1(STATE[0]),
        .O(\STATE[1]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h22202020AAAAAAAA)) 
    \STATE[2]_i_1 
       (.I0(\STATE[3]_i_3_n_0 ),
        .I1(STATE[3]),
        .I2(\STATE[2]_i_2_n_0 ),
        .I3(\STATE[2]_i_3_n_0 ),
        .I4(\STATE[2]_i_4_n_0 ),
        .I5(\STATE[2]_i_5_n_0 ),
        .O(\STATE[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'h0444)) 
    \STATE[2]_i_2 
       (.I0(STATE[1]),
        .I1(STATE[2]),
        .I2(RX_CONFIG_REG_NULL_reg_0),
        .I3(ABILITY_MATCH),
        .O(\STATE[2]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hD7)) 
    \STATE[2]_i_3 
       (.I0(ABILITY_MATCH),
        .I1(\RX_CONFIG_REG_REG_reg_n_0_[11] ),
        .I2(TOGGLE_RX),
        .O(\STATE[2]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT5 #(
    .INIT(32'h37000000)) 
    \STATE[2]_i_4 
       (.I0(RX_CONFIG_REG_NULL_reg_0),
        .I1(ABILITY_MATCH),
        .I2(STATE[0]),
        .I3(STATE[2]),
        .I4(STATE[1]),
        .O(\STATE[2]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT5 #(
    .INIT(32'hEFFFFFFF)) 
    \STATE[2]_i_5 
       (.I0(\RX_CONFIG_SNAPSHOT[15]_i_2_n_0 ),
        .I1(RX_CONFIG_REG_NULL_reg_0),
        .I2(CONSISTENCY_MATCH),
        .I3(ABILITY_MATCH),
        .I4(ACKNOWLEDGE_MATCH_3_reg_n_0),
        .O(\STATE[2]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h88B8)) 
    \STATE[3]_i_1 
       (.I0(\STATE[3]_i_2_n_0 ),
        .I1(\STATE[3]_i_3_n_0 ),
        .I2(AN_SYNC_STATUS),
        .I3(AN_ENABLE_INT),
        .O(\STATE[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT5 #(
    .INIT(32'h00100011)) 
    \STATE[3]_i_2 
       (.I0(STATE[1]),
        .I1(STATE[2]),
        .I2(STATE[3]),
        .I3(STATE[0]),
        .I4(AN_ENABLE_INT),
        .O(\STATE[3]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h0000FDFF)) 
    \STATE[3]_i_3 
       (.I0(RX_RUDI_INVALID),
        .I1(MASK_RUDI_CLKCOR),
        .I2(MASK_RUDI_BUFERR),
        .I3(XMIT_CONFIG_INT),
        .I4(\STATE[3]_i_4_n_0 ),
        .O(\STATE[3]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hFD)) 
    \STATE[3]_i_4 
       (.I0(AN_SYNC_STATUS),
        .I1(MR_RESTART_AN_INT),
        .I2(MR_AN_ENABLE_CHANGE),
        .O(\STATE[3]_i_4_n_0 ));
  FDRE \STATE_reg[0] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\STATE[0]_i_1_n_0 ),
        .Q(STATE[0]),
        .R(out));
  FDRE \STATE_reg[1] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\STATE[1]_i_1_n_0 ),
        .Q(STATE[1]),
        .R(out));
  FDRE \STATE_reg[2] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\STATE[2]_i_1_n_0 ),
        .Q(STATE[2]),
        .R(out));
  FDRE \STATE_reg[3] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\STATE[3]_i_1_n_0 ),
        .Q(STATE[3]),
        .R(out));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'hBFAA)) 
    SYNC_STATUS_HELD_i_1
       (.I0(RXSYNC_STATUS),
        .I1(PULSE4096),
        .I2(LINK_TIMER_SATURATED),
        .I3(SYNC_STATUS_HELD),
        .O(SYNC_STATUS_HELD_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    SYNC_STATUS_HELD_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(SYNC_STATUS_HELD_i_1_n_0),
        .Q(SYNC_STATUS_HELD),
        .R(out));
  LUT1 #(
    .INIT(2'h1)) 
    \TIMER4096[0]_i_1 
       (.I0(\TIMER4096_reg_n_0_[0] ),
        .O(plusOp__0[0]));
  FDRE #(
    .INIT(1'b0)) 
    TIMER4096_MSB_REG_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(TIMER4096_reg__0),
        .Q(TIMER4096_MSB_REG),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \TIMER4096_reg[0] 
       (.C(userclk2),
        .CE(1'b1),
        .D(plusOp__0[0]),
        .Q(\TIMER4096_reg_n_0_[0] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \TIMER4096_reg[10] 
       (.C(userclk2),
        .CE(1'b1),
        .D(plusOp__0[10]),
        .Q(\TIMER4096_reg_n_0_[10] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \TIMER4096_reg[11] 
       (.C(userclk2),
        .CE(1'b1),
        .D(plusOp__0[11]),
        .Q(TIMER4096_reg__0),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \TIMER4096_reg[1] 
       (.C(userclk2),
        .CE(1'b1),
        .D(plusOp__0[1]),
        .Q(\TIMER4096_reg_n_0_[1] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \TIMER4096_reg[2] 
       (.C(userclk2),
        .CE(1'b1),
        .D(plusOp__0[2]),
        .Q(\TIMER4096_reg_n_0_[2] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \TIMER4096_reg[3] 
       (.C(userclk2),
        .CE(1'b1),
        .D(plusOp__0[3]),
        .Q(\TIMER4096_reg_n_0_[3] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \TIMER4096_reg[4] 
       (.C(userclk2),
        .CE(1'b1),
        .D(plusOp__0[4]),
        .Q(\TIMER4096_reg_n_0_[4] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \TIMER4096_reg[5] 
       (.C(userclk2),
        .CE(1'b1),
        .D(plusOp__0[5]),
        .Q(\TIMER4096_reg_n_0_[5] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \TIMER4096_reg[6] 
       (.C(userclk2),
        .CE(1'b1),
        .D(plusOp__0[6]),
        .Q(\TIMER4096_reg_n_0_[6] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \TIMER4096_reg[7] 
       (.C(userclk2),
        .CE(1'b1),
        .D(plusOp__0[7]),
        .Q(\TIMER4096_reg_n_0_[7] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \TIMER4096_reg[8] 
       (.C(userclk2),
        .CE(1'b1),
        .D(plusOp__0[8]),
        .Q(\TIMER4096_reg_n_0_[8] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \TIMER4096_reg[9] 
       (.C(userclk2),
        .CE(1'b1),
        .D(plusOp__0[9]),
        .Q(\TIMER4096_reg_n_0_[9] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    TOGGLE_RX_reg
       (.C(userclk2),
        .CE(MR_PAGE_RX_SET119_out),
        .D(Q[11]),
        .Q(TOGGLE_RX),
        .R(out));
  LUT6 #(
    .INIT(64'h5555554588888888)) 
    TOGGLE_TX_i_1
       (.I0(MR_PAGE_RX_SET119_out),
        .I1(STATE[2]),
        .I2(STATE[1]),
        .I3(STATE[0]),
        .I4(STATE[3]),
        .I5(TOGGLE_TX),
        .O(TOGGLE_TX_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    TOGGLE_TX_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(TOGGLE_TX_i_1_n_0),
        .Q(TOGGLE_TX),
        .R(out));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \TX_CONFIG_REG_INT[0]_i_1 
       (.I0(STATE[1]),
        .I1(\AN_NP_TX_REG_WITH_AN.AN_NP_TX_REG_reg[0] ),
        .I2(STATE[2]),
        .O(\TX_CONFIG_REG_INT[0]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \TX_CONFIG_REG_INT[11]_i_1 
       (.I0(STATE[2]),
        .I1(TOGGLE_TX),
        .O(\TX_CONFIG_REG_INT[11]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h000B)) 
    \TX_CONFIG_REG_INT[13]_i_1 
       (.I0(STATE[1]),
        .I1(STATE[2]),
        .I2(STATE[3]),
        .I3(STATE[0]),
        .O(\TX_CONFIG_REG_INT[13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \TX_CONFIG_REG_INT[13]_i_2 
       (.I0(STATE[2]),
        .I1(\AN_NP_TX_REG_WITH_AN.AN_NP_TX_REG_reg[13] ),
        .O(\TX_CONFIG_REG_INT[13]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT5 #(
    .INIT(32'hFFAE0020)) 
    \TX_CONFIG_REG_INT[14]_i_1 
       (.I0(STATE[0]),
        .I1(STATE[2]),
        .I2(STATE[1]),
        .I3(STATE[3]),
        .I4(D[3]),
        .O(\TX_CONFIG_REG_INT[14]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \TX_CONFIG_REG_INT_reg[0] 
       (.C(userclk2),
        .CE(\TX_CONFIG_REG_INT[13]_i_1_n_0 ),
        .D(\TX_CONFIG_REG_INT[0]_i_1_n_0 ),
        .Q(D[0]),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \TX_CONFIG_REG_INT_reg[11] 
       (.C(userclk2),
        .CE(\TX_CONFIG_REG_INT[13]_i_1_n_0 ),
        .D(\TX_CONFIG_REG_INT[11]_i_1_n_0 ),
        .Q(D[1]),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \TX_CONFIG_REG_INT_reg[13] 
       (.C(userclk2),
        .CE(\TX_CONFIG_REG_INT[13]_i_1_n_0 ),
        .D(\TX_CONFIG_REG_INT[13]_i_2_n_0 ),
        .Q(D[2]),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \TX_CONFIG_REG_INT_reg[14] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\TX_CONFIG_REG_INT[14]_i_1_n_0 ),
        .Q(D[3]),
        .R(out));
  LUT6 #(
    .INIT(64'hFFFFFFFF0F002F20)) 
    XMIT_CONFIG_INT_i_1__0
       (.I0(XMIT_CONFIG_INT),
        .I1(XMIT_CONFIG_INT_i_2__0_n_0),
        .I2(XMIT_CONFIG_INT_i_3_n_0),
        .I3(AN_ENABLE_INT),
        .I4(GENERATE_REMOTE_FAULT_i_3_n_0),
        .I5(out),
        .O(XMIT_CONFIG_INT_i_1__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT4 #(
    .INIT(16'h0010)) 
    XMIT_CONFIG_INT_i_2__0
       (.I0(STATE[1]),
        .I1(STATE[2]),
        .I2(STATE[3]),
        .I3(STATE[0]),
        .O(XMIT_CONFIG_INT_i_2__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    XMIT_CONFIG_INT_i_3
       (.I0(STATE[1]),
        .I1(STATE[2]),
        .I2(STATE[3]),
        .I3(STATE[0]),
        .O(XMIT_CONFIG_INT_i_3_n_0));
  FDRE #(
    .INIT(1'b0)) 
    XMIT_CONFIG_INT_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(XMIT_CONFIG_INT_i_1__0_n_0),
        .Q(XMIT_CONFIG_INT),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT4 #(
    .INIT(16'h0810)) 
    XMIT_DATA_INT_i_1__0
       (.I0(STATE[2]),
        .I1(STATE[1]),
        .I2(STATE[3]),
        .I3(STATE[0]),
        .O(XMIT_DATA_INT0));
  FDRE #(
    .INIT(1'b0)) 
    XMIT_DATA_INT_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(XMIT_DATA_INT0),
        .Q(XMIT_DATA_INT),
        .R(out));
  CARRY8 plusOp_carry
       (.CI(\TIMER4096_reg_n_0_[0] ),
        .CI_TOP(1'b0),
        .CO({plusOp_carry_n_0,plusOp_carry_n_1,plusOp_carry_n_2,plusOp_carry_n_3,NLW_plusOp_carry_CO_UNCONNECTED[3],plusOp_carry_n_5,plusOp_carry_n_6,plusOp_carry_n_7}),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(plusOp__0[8:1]),
        .S({\TIMER4096_reg_n_0_[8] ,\TIMER4096_reg_n_0_[7] ,\TIMER4096_reg_n_0_[6] ,\TIMER4096_reg_n_0_[5] ,\TIMER4096_reg_n_0_[4] ,\TIMER4096_reg_n_0_[3] ,\TIMER4096_reg_n_0_[2] ,\TIMER4096_reg_n_0_[1] }));
  CARRY8 plusOp_carry__0
       (.CI(plusOp_carry_n_0),
        .CI_TOP(1'b0),
        .CO({NLW_plusOp_carry__0_CO_UNCONNECTED[7:2],plusOp_carry__0_n_6,plusOp_carry__0_n_7}),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_plusOp_carry__0_O_UNCONNECTED[7:3],plusOp__0[11:9]}),
        .S({1'b0,1'b0,1'b0,1'b0,1'b0,TIMER4096_reg__0,\TIMER4096_reg_n_0_[10] ,\TIMER4096_reg_n_0_[9] }));
  CARRY8 \plusOp_inferred__0/i__carry 
       (.CI(MASK_RUDI_BUFERR_TIMER[0]),
        .CI_TOP(1'b0),
        .CO({\plusOp_inferred__0/i__carry_n_0 ,\plusOp_inferred__0/i__carry_n_1 ,\plusOp_inferred__0/i__carry_n_2 ,\plusOp_inferred__0/i__carry_n_3 ,\NLW_plusOp_inferred__0/i__carry_CO_UNCONNECTED [3],\plusOp_inferred__0/i__carry_n_5 ,\plusOp_inferred__0/i__carry_n_6 ,\plusOp_inferred__0/i__carry_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\plusOp_inferred__0/i__carry_n_8 ,\plusOp_inferred__0/i__carry_n_9 ,\plusOp_inferred__0/i__carry_n_10 ,\plusOp_inferred__0/i__carry_n_11 ,\plusOp_inferred__0/i__carry_n_12 ,\plusOp_inferred__0/i__carry_n_13 ,\plusOp_inferred__0/i__carry_n_14 ,\plusOp_inferred__0/i__carry_n_15 }),
        .S(MASK_RUDI_BUFERR_TIMER[8:1]));
  CARRY8 \plusOp_inferred__0/i__carry__0 
       (.CI(\plusOp_inferred__0/i__carry_n_0 ),
        .CI_TOP(1'b0),
        .CO({\NLW_plusOp_inferred__0/i__carry__0_CO_UNCONNECTED [7:3],\plusOp_inferred__0/i__carry__0_n_5 ,\plusOp_inferred__0/i__carry__0_n_6 ,\plusOp_inferred__0/i__carry__0_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_plusOp_inferred__0/i__carry__0_O_UNCONNECTED [7:4],\plusOp_inferred__0/i__carry__0_n_12 ,\plusOp_inferred__0/i__carry__0_n_13 ,\plusOp_inferred__0/i__carry__0_n_14 ,\plusOp_inferred__0/i__carry__0_n_15 }),
        .S({1'b0,1'b0,1'b0,1'b0,MASK_RUDI_BUFERR_TIMER[12:9]}));
endmodule

(* ORIG_REF_NAME = "GPCS_PMA_GEN" *) 
module design_1_gig_ethernet_pcs_pma_0_0_GPCS_PMA_GEN
   (GMII_ISOLATE,
    MGT_TX_RESET,
    status_vector,
    MGT_RX_RESET,
    mdio_out,
    mdio_tri,
    gmii_rxd,
    gmii_rx_er,
    txchardispmode,
    txcharisk,
    txdata,
    an_interrupt,
    gmii_rx_dv,
    txchardispval,
    userclk2,
    signal_detect,
    reset,
    mdc,
    mdio_in,
    gmii_tx_en,
    gmii_tx_er,
    gmii_txd,
    configuration_valid,
    an_restart_config,
    rxnotintable,
    rxclkcorcnt,
    rxbufstatus,
    rxdisperr,
    rxrundisp,
    configuration_vector,
    rxcharisk,
    rxchariscomma,
    phyad,
    rxdata);
  output GMII_ISOLATE;
  output MGT_TX_RESET;
  output [12:0]status_vector;
  output MGT_RX_RESET;
  output mdio_out;
  output mdio_tri;
  output [7:0]gmii_rxd;
  output gmii_rx_er;
  output txchardispmode;
  output txcharisk;
  output [7:0]txdata;
  output an_interrupt;
  output gmii_rx_dv;
  output txchardispval;
  input userclk2;
  input signal_detect;
  input reset;
  input mdc;
  input mdio_in;
  input gmii_tx_en;
  input gmii_tx_er;
  input [7:0]gmii_txd;
  input configuration_valid;
  input an_restart_config;
  input [0:0]rxnotintable;
  input [1:0]rxclkcorcnt;
  input [0:0]rxbufstatus;
  input [0:0]rxdisperr;
  input [0:0]rxrundisp;
  input [4:0]configuration_vector;
  input [0:0]rxcharisk;
  input [0:0]rxchariscomma;
  input [4:0]phyad;
  input [7:0]rxdata;

  wire ACKNOWLEDGE_MATCH_20;
  wire AN_ENABLE_INT;
  wire [1:1]BASEX_REMOTE_FAULT_RSLVD;
  wire CLEAR_STATUS_REG;
  wire D;
  wire DUPLEX_MODE_RSLVD_REG;
  wire \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM[14]_i_1_n_0 ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[0] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[10] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[11] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[12] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[13] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[14] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[1] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[2] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[3] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[4] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[5] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[6] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[7] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[8] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[9] ;
  wire \FSM_onehot_USE_ROCKET_IO.TX_RST_SM[14]_i_1_n_0 ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[0] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[10] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[11] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[12] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[13] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[14] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[1] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[2] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[3] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[4] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[5] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[6] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[7] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[8] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[9] ;
  wire GMII_ISOLATE;
  wire \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_11 ;
  wire \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_13 ;
  wire \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_14 ;
  wire \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_15 ;
  wire \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_16 ;
  wire \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_19 ;
  wire \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_20 ;
  wire \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_21 ;
  wire \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_22 ;
  wire \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_23 ;
  wire \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_24 ;
  wire \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_25 ;
  wire \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_26 ;
  wire \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_27 ;
  wire \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_28 ;
  wire \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_33 ;
  wire \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_34 ;
  wire \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_35 ;
  wire \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_36 ;
  wire \HAS_MANAGEMENT.MDIO_n_10 ;
  wire \HAS_MANAGEMENT.MDIO_n_18 ;
  wire \HAS_MANAGEMENT.MDIO_n_19 ;
  wire \HAS_MANAGEMENT.MDIO_n_20 ;
  wire \HAS_MANAGEMENT.MDIO_n_7 ;
  wire \HAS_MANAGEMENT.MDIO_n_9 ;
  wire K28p5_REG1;
  wire LOOPBACK;
  wire [16:11]LP_ADV_ABILITY;
  wire MGT_RX_RESET;
  wire MGT_RX_RESET_INT;
  wire MGT_TX_RESET;
  wire MGT_TX_RESET_INT;
  wire MR_AN_COMPLETE;
  wire MR_LINK_STATUS;
  wire RECEIVE;
  wire RECEIVED_IDLE;
  (* async_reg = "true" *) wire RESET_INT;
  (* async_reg = "true" *) wire RESET_INT_PIPE;
  (* async_reg = "true" *) wire RESET_INT_PIPE_RXRECCLK;
  (* async_reg = "true" *) wire RESET_INT_RXRECCLK;
  wire RESTART_AN_REG;
  wire RXDISPERR_SRL1_out;
  wire RXEVEN0_out;
  wire RXNOTINTABLE_INT;
  wire RXNOTINTABLE_SRL0_out;
  (* async_reg = "true" *) wire RXRECRESET;
  (* async_reg = "true" *) wire RXRECRESET_PIPE;
  (* async_reg = "true" *) wire RXRECRESET_PIPE_1;
  (* async_reg = "true" *) wire RXRECRESET_PIPE_2;
  (* async_reg = "true" *) wire RXRECRESET_PIPE_3;
  wire RXRUNDISP_INT;
  wire RXSYNC_STATUS;
  wire [15:10]RX_CONFIG_REG;
  wire RX_CONFIG_REG_REG0;
  wire RX_CONFIG_VALID;
  wire RX_DATA_ERROR;
  wire RX_DV0;
  wire RX_ER0;
  wire \RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_12 ;
  wire \RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_13 ;
  wire \RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_14 ;
  wire \RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_18 ;
  wire \RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_22 ;
  wire \RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_23 ;
  wire \RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_24 ;
  wire \RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_25 ;
  wire \RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_26 ;
  wire \RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_27 ;
  wire \RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_28 ;
  wire \RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_29 ;
  wire \RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_30 ;
  wire \RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_31 ;
  wire \RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_32 ;
  wire \RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_35 ;
  wire \RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_36 ;
  wire \RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_37 ;
  wire \RX_GMII_AT_TXOUTCLK.SYNCHRONISATION_n_3 ;
  wire \RX_GMII_AT_TXOUTCLK.SYNCHRONISATION_n_4 ;
  wire RX_IDLE;
  wire RX_INVALID;
  wire RX_RUDI_INVALID;
  wire S2;
  wire SIGNAL_DETECT_MOD;
  wire SOFT_RESET;
  wire SOFT_RESET_RXRECCLK;
  wire SOP_REG3;
  (* async_reg = "true" *) wire SRESET;
  (* async_reg = "true" *) wire SRESET_PIPE;
  wire STATUS_VECTOR_0_PRE;
  wire SYNC_SIGNAL_DETECT_n_0;
  wire SYNC_STATUS_REG;
  wire SYNC_STATUS_REG0;
  wire TOGGLE_RX;
  wire TRANSMITTER_n_10;
  wire TRANSMITTER_n_11;
  wire TRANSMITTER_n_12;
  wire TRANSMITTER_n_13;
  wire TRANSMITTER_n_14;
  wire TRANSMITTER_n_15;
  wire TRANSMITTER_n_16;
  wire TRANSMITTER_n_17;
  wire TRANSMITTER_n_18;
  wire TRANSMITTER_n_19;
  wire TRANSMITTER_n_2;
  wire TRANSMITTER_n_20;
  wire TRANSMITTER_n_21;
  wire TRANSMITTER_n_22;
  wire TRANSMITTER_n_3;
  wire TRANSMITTER_n_4;
  wire TRANSMITTER_n_5;
  wire TRANSMITTER_n_6;
  wire TRANSMITTER_n_7;
  wire TRANSMITTER_n_8;
  wire TRANSMITTER_n_9;
  wire TX_EVEN;
  wire \USE_ROCKET_IO.MGT_TX_RESET_INT_i_2_n_0 ;
  wire \USE_ROCKET_IO.MGT_TX_RESET_INT_i_3_n_0 ;
  wire \USE_ROCKET_IO.MGT_TX_RESET_INT_i_4_n_0 ;
  wire \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXBUFSTATUS_INT_reg_n_0_[1] ;
  wire \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISCOMMA_INT_reg_n_0 ;
  wire \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISK_INT_reg_n_0 ;
  wire \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCLKCORCNT_INT_reg_n_0_[0] ;
  wire \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCLKCORCNT_INT_reg_n_0_[2] ;
  wire \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg_n_0_[0] ;
  wire \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg_n_0_[1] ;
  wire \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg_n_0_[2] ;
  wire \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg_n_0_[3] ;
  wire \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg_n_0_[4] ;
  wire \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg_n_0_[5] ;
  wire \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg_n_0_[6] ;
  wire \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg_n_0_[7] ;
  wire \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXRUNDISP_INT_reg_n_0 ;
  wire \USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.MGT_RX_RESET_INT_i_3_n_0 ;
  wire \USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.MGT_RX_RESET_INT_i_4_n_0 ;
  wire \USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.MGT_RX_RESET_INT_i_5_n_0 ;
  wire XMIT_CONFIG;
  wire XMIT_CONFIG_INT;
  wire XMIT_CONFIG_INT_0;
  wire XMIT_DATA;
  wire XMIT_DATA_INT;
  wire an_interrupt;
  wire an_restart_config;
  wire configuration_valid;
  wire [4:0]configuration_vector;
  wire data_out;
  wire gmii_rx_dv;
  wire gmii_rx_er;
  wire [7:0]gmii_rxd;
  wire gmii_tx_en;
  wire gmii_tx_er;
  wire [7:0]gmii_txd;
  wire mdc;
  wire mdio_in;
  wire mdio_out;
  wire mdio_tri;
  wire p_0_in0_in;
  wire p_0_in28_in;
  wire p_0_out;
  wire p_3_out;
  wire p_6_out;
  wire [4:0]phyad;
  wire reset;
  wire [0:0]rxbufstatus;
  wire [0:0]rxchariscomma;
  wire [0:0]rxcharisk;
  wire [1:0]rxclkcorcnt;
  wire [7:0]rxdata;
  wire [0:0]rxdisperr;
  wire [0:0]rxnotintable;
  wire [0:0]rxrundisp;
  wire signal_detect;
  wire [12:0]status_vector;
  wire txchardispmode;
  wire txchardispval;
  wire txcharisk;
  wire [7:0]txdata;
  wire userclk2;

  (* XILINX_LEGACY_PRIM = "SRL16" *) 
  (* box_type = "PRIMITIVE" *) 
  (* srl_bus_name = "inst/\pcs_pma_block_i/gen_lvds_transceiver.gen_lvds_transceiver_logic " *) 
  (* srl_name = "inst/\pcs_pma_block_i/gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core /\gpcs_pma_inst/DELAY_ERROR_TXOUTCLK.DELAY_RXDISPERR " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \DELAY_ERROR_TXOUTCLK.DELAY_RXDISPERR 
       (.A0(1'b0),
        .A1(1'b0),
        .A2(1'b1),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(userclk2),
        .D(D),
        .Q(RXDISPERR_SRL1_out));
  (* XILINX_LEGACY_PRIM = "SRL16" *) 
  (* box_type = "PRIMITIVE" *) 
  (* srl_bus_name = "inst/\pcs_pma_block_i/gen_lvds_transceiver.gen_lvds_transceiver_logic " *) 
  (* srl_name = "inst/\pcs_pma_block_i/gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core /\gpcs_pma_inst/DELAY_ERROR_TXOUTCLK.DELAY_RXNOTINTABLE " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \DELAY_ERROR_TXOUTCLK.DELAY_RXNOTINTABLE 
       (.A0(1'b0),
        .A1(1'b0),
        .A2(1'b1),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(userclk2),
        .D(RXNOTINTABLE_INT),
        .Q(RXNOTINTABLE_SRL0_out));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_ERROR_TXOUTCLK.RXDISPERR_REG_reg 
       (.C(userclk2),
        .CE(1'b1),
        .D(RXDISPERR_SRL1_out),
        .Q(status_vector[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_ERROR_TXOUTCLK.RXNOTINTABLE_REG_reg 
       (.C(userclk2),
        .CE(1'b1),
        .D(RXNOTINTABLE_SRL0_out),
        .Q(status_vector[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    DUPLEX_MODE_RSLVD_REG_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(LP_ADV_ABILITY[13]),
        .Q(DUPLEX_MODE_RSLVD_REG),
        .R(1'b0));
  LUT2 #(
    .INIT(4'hE)) 
    \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM[14]_i_1 
       (.I0(\FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[13] ),
        .I1(\USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.MGT_RX_RESET_INT_i_3_n_0 ),
        .O(\FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM[14]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "iSTATE:000000000001000,iSTATE0:000000000010000,iSTATE1:010000000000000,iSTATE2:000000000000100,iSTATE3:000100000000000,iSTATE4:001000000000000,iSTATE5:000010000000000,iSTATE6:000000000000010,iSTATE7:000000000000001,iSTATE8:000001000000000,iSTATE9:000000010000000,iSTATE10:000000100000000,iSTATE11:000000001000000,iSTATE12:100000000000000,iSTATE13:000000000100000" *) 
  (* KEEP = "yes" *) 
  FDSE #(
    .INIT(1'b1)) 
    \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg[0] 
       (.C(userclk2),
        .CE(1'b1),
        .D(1'b0),
        .Q(\FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[0] ),
        .S(p_0_out));
  (* FSM_ENCODED_STATES = "iSTATE:000000000001000,iSTATE0:000000000010000,iSTATE1:010000000000000,iSTATE2:000000000000100,iSTATE3:000100000000000,iSTATE4:001000000000000,iSTATE5:000010000000000,iSTATE6:000000000000010,iSTATE7:000000000000001,iSTATE8:000001000000000,iSTATE9:000000010000000,iSTATE10:000000100000000,iSTATE11:000000001000000,iSTATE12:100000000000000,iSTATE13:000000000100000" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg[10] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[9] ),
        .Q(\FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[10] ),
        .R(p_0_out));
  (* FSM_ENCODED_STATES = "iSTATE:000000000001000,iSTATE0:000000000010000,iSTATE1:010000000000000,iSTATE2:000000000000100,iSTATE3:000100000000000,iSTATE4:001000000000000,iSTATE5:000010000000000,iSTATE6:000000000000010,iSTATE7:000000000000001,iSTATE8:000001000000000,iSTATE9:000000010000000,iSTATE10:000000100000000,iSTATE11:000000001000000,iSTATE12:100000000000000,iSTATE13:000000000100000" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg[11] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[10] ),
        .Q(\FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[11] ),
        .R(p_0_out));
  (* FSM_ENCODED_STATES = "iSTATE:000000000001000,iSTATE0:000000000010000,iSTATE1:010000000000000,iSTATE2:000000000000100,iSTATE3:000100000000000,iSTATE4:001000000000000,iSTATE5:000010000000000,iSTATE6:000000000000010,iSTATE7:000000000000001,iSTATE8:000001000000000,iSTATE9:000000010000000,iSTATE10:000000100000000,iSTATE11:000000001000000,iSTATE12:100000000000000,iSTATE13:000000000100000" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg[12] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[11] ),
        .Q(\FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[12] ),
        .R(p_0_out));
  (* FSM_ENCODED_STATES = "iSTATE:000000000001000,iSTATE0:000000000010000,iSTATE1:010000000000000,iSTATE2:000000000000100,iSTATE3:000100000000000,iSTATE4:001000000000000,iSTATE5:000010000000000,iSTATE6:000000000000010,iSTATE7:000000000000001,iSTATE8:000001000000000,iSTATE9:000000010000000,iSTATE10:000000100000000,iSTATE11:000000001000000,iSTATE12:100000000000000,iSTATE13:000000000100000" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg[13] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[12] ),
        .Q(\FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[13] ),
        .R(p_0_out));
  (* FSM_ENCODED_STATES = "iSTATE:000000000001000,iSTATE0:000000000010000,iSTATE1:010000000000000,iSTATE2:000000000000100,iSTATE3:000100000000000,iSTATE4:001000000000000,iSTATE5:000010000000000,iSTATE6:000000000000010,iSTATE7:000000000000001,iSTATE8:000001000000000,iSTATE9:000000010000000,iSTATE10:000000100000000,iSTATE11:000000001000000,iSTATE12:100000000000000,iSTATE13:000000000100000" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg[14] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM[14]_i_1_n_0 ),
        .Q(\FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[14] ),
        .R(p_0_out));
  (* FSM_ENCODED_STATES = "iSTATE:000000000001000,iSTATE0:000000000010000,iSTATE1:010000000000000,iSTATE2:000000000000100,iSTATE3:000100000000000,iSTATE4:001000000000000,iSTATE5:000010000000000,iSTATE6:000000000000010,iSTATE7:000000000000001,iSTATE8:000001000000000,iSTATE9:000000010000000,iSTATE10:000000100000000,iSTATE11:000000001000000,iSTATE12:100000000000000,iSTATE13:000000000100000" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg[1] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[0] ),
        .Q(\FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[1] ),
        .R(p_0_out));
  (* FSM_ENCODED_STATES = "iSTATE:000000000001000,iSTATE0:000000000010000,iSTATE1:010000000000000,iSTATE2:000000000000100,iSTATE3:000100000000000,iSTATE4:001000000000000,iSTATE5:000010000000000,iSTATE6:000000000000010,iSTATE7:000000000000001,iSTATE8:000001000000000,iSTATE9:000000010000000,iSTATE10:000000100000000,iSTATE11:000000001000000,iSTATE12:100000000000000,iSTATE13:000000000100000" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg[2] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[1] ),
        .Q(\FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[2] ),
        .R(p_0_out));
  (* FSM_ENCODED_STATES = "iSTATE:000000000001000,iSTATE0:000000000010000,iSTATE1:010000000000000,iSTATE2:000000000000100,iSTATE3:000100000000000,iSTATE4:001000000000000,iSTATE5:000010000000000,iSTATE6:000000000000010,iSTATE7:000000000000001,iSTATE8:000001000000000,iSTATE9:000000010000000,iSTATE10:000000100000000,iSTATE11:000000001000000,iSTATE12:100000000000000,iSTATE13:000000000100000" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg[3] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[2] ),
        .Q(\FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[3] ),
        .R(p_0_out));
  (* FSM_ENCODED_STATES = "iSTATE:000000000001000,iSTATE0:000000000010000,iSTATE1:010000000000000,iSTATE2:000000000000100,iSTATE3:000100000000000,iSTATE4:001000000000000,iSTATE5:000010000000000,iSTATE6:000000000000010,iSTATE7:000000000000001,iSTATE8:000001000000000,iSTATE9:000000010000000,iSTATE10:000000100000000,iSTATE11:000000001000000,iSTATE12:100000000000000,iSTATE13:000000000100000" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg[4] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[3] ),
        .Q(\FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[4] ),
        .R(p_0_out));
  (* FSM_ENCODED_STATES = "iSTATE:000000000001000,iSTATE0:000000000010000,iSTATE1:010000000000000,iSTATE2:000000000000100,iSTATE3:000100000000000,iSTATE4:001000000000000,iSTATE5:000010000000000,iSTATE6:000000000000010,iSTATE7:000000000000001,iSTATE8:000001000000000,iSTATE9:000000010000000,iSTATE10:000000100000000,iSTATE11:000000001000000,iSTATE12:100000000000000,iSTATE13:000000000100000" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg[5] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[4] ),
        .Q(\FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[5] ),
        .R(p_0_out));
  (* FSM_ENCODED_STATES = "iSTATE:000000000001000,iSTATE0:000000000010000,iSTATE1:010000000000000,iSTATE2:000000000000100,iSTATE3:000100000000000,iSTATE4:001000000000000,iSTATE5:000010000000000,iSTATE6:000000000000010,iSTATE7:000000000000001,iSTATE8:000001000000000,iSTATE9:000000010000000,iSTATE10:000000100000000,iSTATE11:000000001000000,iSTATE12:100000000000000,iSTATE13:000000000100000" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg[6] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[5] ),
        .Q(\FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[6] ),
        .R(p_0_out));
  (* FSM_ENCODED_STATES = "iSTATE:000000000001000,iSTATE0:000000000010000,iSTATE1:010000000000000,iSTATE2:000000000000100,iSTATE3:000100000000000,iSTATE4:001000000000000,iSTATE5:000010000000000,iSTATE6:000000000000010,iSTATE7:000000000000001,iSTATE8:000001000000000,iSTATE9:000000010000000,iSTATE10:000000100000000,iSTATE11:000000001000000,iSTATE12:100000000000000,iSTATE13:000000000100000" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg[7] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[6] ),
        .Q(\FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[7] ),
        .R(p_0_out));
  (* FSM_ENCODED_STATES = "iSTATE:000000000001000,iSTATE0:000000000010000,iSTATE1:010000000000000,iSTATE2:000000000000100,iSTATE3:000100000000000,iSTATE4:001000000000000,iSTATE5:000010000000000,iSTATE6:000000000000010,iSTATE7:000000000000001,iSTATE8:000001000000000,iSTATE9:000000010000000,iSTATE10:000000100000000,iSTATE11:000000001000000,iSTATE12:100000000000000,iSTATE13:000000000100000" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg[8] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[7] ),
        .Q(\FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[8] ),
        .R(p_0_out));
  (* FSM_ENCODED_STATES = "iSTATE:000000000001000,iSTATE0:000000000010000,iSTATE1:010000000000000,iSTATE2:000000000000100,iSTATE3:000100000000000,iSTATE4:001000000000000,iSTATE5:000010000000000,iSTATE6:000000000000010,iSTATE7:000000000000001,iSTATE8:000001000000000,iSTATE9:000000010000000,iSTATE10:000000100000000,iSTATE11:000000001000000,iSTATE12:100000000000000,iSTATE13:000000000100000" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg[9] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[8] ),
        .Q(\FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[9] ),
        .R(p_0_out));
  LUT2 #(
    .INIT(4'hE)) 
    \FSM_onehot_USE_ROCKET_IO.TX_RST_SM[14]_i_1 
       (.I0(\FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[13] ),
        .I1(\USE_ROCKET_IO.MGT_TX_RESET_INT_i_2_n_0 ),
        .O(\FSM_onehot_USE_ROCKET_IO.TX_RST_SM[14]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "iSTATE:000000000001000,iSTATE0:000000000010000,iSTATE1:010000000000000,iSTATE2:000000000000100,iSTATE3:000100000000000,iSTATE4:001000000000000,iSTATE5:000010000000000,iSTATE6:000000000000010,iSTATE7:000000000000001,iSTATE8:000001000000000,iSTATE9:000000010000000,iSTATE10:000000100000000,iSTATE11:000000001000000,iSTATE12:100000000000000,iSTATE13:000000000100000" *) 
  (* KEEP = "yes" *) 
  FDSE #(
    .INIT(1'b1)) 
    \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg[0] 
       (.C(userclk2),
        .CE(1'b1),
        .D(1'b0),
        .Q(\FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[0] ),
        .S(RESET_INT));
  (* FSM_ENCODED_STATES = "iSTATE:000000000001000,iSTATE0:000000000010000,iSTATE1:010000000000000,iSTATE2:000000000000100,iSTATE3:000100000000000,iSTATE4:001000000000000,iSTATE5:000010000000000,iSTATE6:000000000000010,iSTATE7:000000000000001,iSTATE8:000001000000000,iSTATE9:000000010000000,iSTATE10:000000100000000,iSTATE11:000000001000000,iSTATE12:100000000000000,iSTATE13:000000000100000" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg[10] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[9] ),
        .Q(\FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[10] ),
        .R(RESET_INT));
  (* FSM_ENCODED_STATES = "iSTATE:000000000001000,iSTATE0:000000000010000,iSTATE1:010000000000000,iSTATE2:000000000000100,iSTATE3:000100000000000,iSTATE4:001000000000000,iSTATE5:000010000000000,iSTATE6:000000000000010,iSTATE7:000000000000001,iSTATE8:000001000000000,iSTATE9:000000010000000,iSTATE10:000000100000000,iSTATE11:000000001000000,iSTATE12:100000000000000,iSTATE13:000000000100000" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg[11] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[10] ),
        .Q(\FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[11] ),
        .R(RESET_INT));
  (* FSM_ENCODED_STATES = "iSTATE:000000000001000,iSTATE0:000000000010000,iSTATE1:010000000000000,iSTATE2:000000000000100,iSTATE3:000100000000000,iSTATE4:001000000000000,iSTATE5:000010000000000,iSTATE6:000000000000010,iSTATE7:000000000000001,iSTATE8:000001000000000,iSTATE9:000000010000000,iSTATE10:000000100000000,iSTATE11:000000001000000,iSTATE12:100000000000000,iSTATE13:000000000100000" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg[12] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[11] ),
        .Q(\FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[12] ),
        .R(RESET_INT));
  (* FSM_ENCODED_STATES = "iSTATE:000000000001000,iSTATE0:000000000010000,iSTATE1:010000000000000,iSTATE2:000000000000100,iSTATE3:000100000000000,iSTATE4:001000000000000,iSTATE5:000010000000000,iSTATE6:000000000000010,iSTATE7:000000000000001,iSTATE8:000001000000000,iSTATE9:000000010000000,iSTATE10:000000100000000,iSTATE11:000000001000000,iSTATE12:100000000000000,iSTATE13:000000000100000" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg[13] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[12] ),
        .Q(\FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[13] ),
        .R(RESET_INT));
  (* FSM_ENCODED_STATES = "iSTATE:000000000001000,iSTATE0:000000000010000,iSTATE1:010000000000000,iSTATE2:000000000000100,iSTATE3:000100000000000,iSTATE4:001000000000000,iSTATE5:000010000000000,iSTATE6:000000000000010,iSTATE7:000000000000001,iSTATE8:000001000000000,iSTATE9:000000010000000,iSTATE10:000000100000000,iSTATE11:000000001000000,iSTATE12:100000000000000,iSTATE13:000000000100000" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg[14] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\FSM_onehot_USE_ROCKET_IO.TX_RST_SM[14]_i_1_n_0 ),
        .Q(\FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[14] ),
        .R(RESET_INT));
  (* FSM_ENCODED_STATES = "iSTATE:000000000001000,iSTATE0:000000000010000,iSTATE1:010000000000000,iSTATE2:000000000000100,iSTATE3:000100000000000,iSTATE4:001000000000000,iSTATE5:000010000000000,iSTATE6:000000000000010,iSTATE7:000000000000001,iSTATE8:000001000000000,iSTATE9:000000010000000,iSTATE10:000000100000000,iSTATE11:000000001000000,iSTATE12:100000000000000,iSTATE13:000000000100000" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg[1] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[0] ),
        .Q(\FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[1] ),
        .R(RESET_INT));
  (* FSM_ENCODED_STATES = "iSTATE:000000000001000,iSTATE0:000000000010000,iSTATE1:010000000000000,iSTATE2:000000000000100,iSTATE3:000100000000000,iSTATE4:001000000000000,iSTATE5:000010000000000,iSTATE6:000000000000010,iSTATE7:000000000000001,iSTATE8:000001000000000,iSTATE9:000000010000000,iSTATE10:000000100000000,iSTATE11:000000001000000,iSTATE12:100000000000000,iSTATE13:000000000100000" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg[2] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[1] ),
        .Q(\FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[2] ),
        .R(RESET_INT));
  (* FSM_ENCODED_STATES = "iSTATE:000000000001000,iSTATE0:000000000010000,iSTATE1:010000000000000,iSTATE2:000000000000100,iSTATE3:000100000000000,iSTATE4:001000000000000,iSTATE5:000010000000000,iSTATE6:000000000000010,iSTATE7:000000000000001,iSTATE8:000001000000000,iSTATE9:000000010000000,iSTATE10:000000100000000,iSTATE11:000000001000000,iSTATE12:100000000000000,iSTATE13:000000000100000" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg[3] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[2] ),
        .Q(\FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[3] ),
        .R(RESET_INT));
  (* FSM_ENCODED_STATES = "iSTATE:000000000001000,iSTATE0:000000000010000,iSTATE1:010000000000000,iSTATE2:000000000000100,iSTATE3:000100000000000,iSTATE4:001000000000000,iSTATE5:000010000000000,iSTATE6:000000000000010,iSTATE7:000000000000001,iSTATE8:000001000000000,iSTATE9:000000010000000,iSTATE10:000000100000000,iSTATE11:000000001000000,iSTATE12:100000000000000,iSTATE13:000000000100000" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg[4] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[3] ),
        .Q(\FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[4] ),
        .R(RESET_INT));
  (* FSM_ENCODED_STATES = "iSTATE:000000000001000,iSTATE0:000000000010000,iSTATE1:010000000000000,iSTATE2:000000000000100,iSTATE3:000100000000000,iSTATE4:001000000000000,iSTATE5:000010000000000,iSTATE6:000000000000010,iSTATE7:000000000000001,iSTATE8:000001000000000,iSTATE9:000000010000000,iSTATE10:000000100000000,iSTATE11:000000001000000,iSTATE12:100000000000000,iSTATE13:000000000100000" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg[5] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[4] ),
        .Q(\FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[5] ),
        .R(RESET_INT));
  (* FSM_ENCODED_STATES = "iSTATE:000000000001000,iSTATE0:000000000010000,iSTATE1:010000000000000,iSTATE2:000000000000100,iSTATE3:000100000000000,iSTATE4:001000000000000,iSTATE5:000010000000000,iSTATE6:000000000000010,iSTATE7:000000000000001,iSTATE8:000001000000000,iSTATE9:000000010000000,iSTATE10:000000100000000,iSTATE11:000000001000000,iSTATE12:100000000000000,iSTATE13:000000000100000" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg[6] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[5] ),
        .Q(\FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[6] ),
        .R(RESET_INT));
  (* FSM_ENCODED_STATES = "iSTATE:000000000001000,iSTATE0:000000000010000,iSTATE1:010000000000000,iSTATE2:000000000000100,iSTATE3:000100000000000,iSTATE4:001000000000000,iSTATE5:000010000000000,iSTATE6:000000000000010,iSTATE7:000000000000001,iSTATE8:000001000000000,iSTATE9:000000010000000,iSTATE10:000000100000000,iSTATE11:000000001000000,iSTATE12:100000000000000,iSTATE13:000000000100000" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg[7] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[6] ),
        .Q(\FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[7] ),
        .R(RESET_INT));
  (* FSM_ENCODED_STATES = "iSTATE:000000000001000,iSTATE0:000000000010000,iSTATE1:010000000000000,iSTATE2:000000000000100,iSTATE3:000100000000000,iSTATE4:001000000000000,iSTATE5:000010000000000,iSTATE6:000000000000010,iSTATE7:000000000000001,iSTATE8:000001000000000,iSTATE9:000000010000000,iSTATE10:000000100000000,iSTATE11:000000001000000,iSTATE12:100000000000000,iSTATE13:000000000100000" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg[8] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[7] ),
        .Q(\FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[8] ),
        .R(RESET_INT));
  (* FSM_ENCODED_STATES = "iSTATE:000000000001000,iSTATE0:000000000010000,iSTATE1:010000000000000,iSTATE2:000000000000100,iSTATE3:000100000000000,iSTATE4:001000000000000,iSTATE5:000010000000000,iSTATE6:000000000000010,iSTATE7:000000000000001,iSTATE8:000001000000000,iSTATE9:000000010000000,iSTATE10:000000100000000,iSTATE11:000000001000000,iSTATE12:100000000000000,iSTATE13:000000000100000" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg[9] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[8] ),
        .Q(\FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[9] ),
        .R(RESET_INT));
  design_1_gig_ethernet_pcs_pma_0_0_AUTO_NEG \HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION 
       (.ABILITY_MATCH_reg_0(\HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_13 ),
        .ABILITY_MATCH_reg_1(\HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_16 ),
        .ABILITY_MATCH_reg_2(\HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_27 ),
        .ACKNOWLEDGE_MATCH_20(ACKNOWLEDGE_MATCH_20),
        .AN_ENABLE_INT(AN_ENABLE_INT),
        .\AN_NP_TX_REG_WITH_AN.AN_NP_TX_REG_reg[0] (\HAS_MANAGEMENT.MDIO_n_20 ),
        .\AN_NP_TX_REG_WITH_AN.AN_NP_TX_REG_reg[13] (\HAS_MANAGEMENT.MDIO_n_19 ),
        .BASEX_REMOTE_FAULT_RSLVD(BASEX_REMOTE_FAULT_RSLVD),
        .CLEAR_STATUS_REG(CLEAR_STATUS_REG),
        .CONFIG_REG_MATCH_reg_0(\HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_14 ),
        .CONFIG_REG_MATCH_reg_1(\HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_15 ),
        .CONFIG_REG_MATCH_reg_2({p_0_in0_in,p_0_in28_in,\HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_19 ,\HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_20 ,\HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_21 ,\HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_22 ,\HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_23 ,\HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_24 ,\HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_25 ,\HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_26 }),
        .\CONFIG_REG_WITH_AN.POWERDOWN_REG_reg (\HAS_MANAGEMENT.MDIO_n_7 ),
        .D({\HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_33 ,\HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_34 ,\HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_35 ,\HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_36 }),
        .I_REG_reg(\RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_36 ),
        .MASK_RUDI_BUFERR_reg_0(\HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_28 ),
        .\MGT_RESET.SRESET_reg (\RX_GMII_AT_TXOUTCLK.SYNCHRONISATION_n_4 ),
        .MR_AN_COMPLETE(MR_AN_COMPLETE),
        .MR_LINK_STATUS(MR_LINK_STATUS),
        .MR_REMOTE_FAULT_reg_0({LP_ADV_ABILITY[16:15],LP_ADV_ABILITY[13],LP_ADV_ABILITY[11]}),
        .Q({RX_CONFIG_REG[15:14],\RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_18 ,RX_CONFIG_REG[12:10],\RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_22 ,\RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_23 ,\RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_24 ,\RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_25 ,\RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_26 ,\RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_27 ,\RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_28 ,\RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_29 ,\RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_30 ,\RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_31 }),
        .RECEIVED_IDLE(RECEIVED_IDLE),
        .RESTART_AN_REG(RESTART_AN_REG),
        .RXSYNC_STATUS(RXSYNC_STATUS),
        .RX_CONFIG_REG_NULL_reg_0(\HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_11 ),
        .\RX_CONFIG_REG_REG_reg[5]_0 (\RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_14 ),
        .\RX_CONFIG_REG_REG_reg[9]_0 (\RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_13 ),
        .\RX_CONFIG_REG_reg[15] (\RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_32 ),
        .RX_CONFIG_VALID(RX_CONFIG_VALID),
        .RX_CONFIG_VALID_INT_reg(\RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_12 ),
        .RX_CONFIG_VALID_INT_reg_0(\RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_37 ),
        .RX_IDLE(RX_IDLE),
        .RX_INVALID(RX_INVALID),
        .RX_RUDI_INVALID(RX_RUDI_INVALID),
        .SR(RX_CONFIG_REG_REG0),
        .TOGGLE_RX(TOGGLE_RX),
        .\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXBUFSTATUS_INT_reg[1] (\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXBUFSTATUS_INT_reg_n_0_[1] ),
        .\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCLKCORCNT_INT_reg[2] ({\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCLKCORCNT_INT_reg_n_0_[2] ,\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCLKCORCNT_INT_reg_n_0_[0] }),
        .XMIT_CONFIG_INT(XMIT_CONFIG_INT),
        .XMIT_DATA(XMIT_DATA),
        .XMIT_DATA_INT(XMIT_DATA_INT),
        .data_out(data_out),
        .data_sync_reg6(SYNC_SIGNAL_DETECT_n_0),
        .out(SRESET),
        .status_vector({status_vector[12],status_vector[10:7],status_vector[4]}),
        .userclk2(userclk2));
  design_1_gig_ethernet_pcs_pma_0_0_MANAGEMENT \HAS_MANAGEMENT.MDIO 
       (.AN_ENABLE_INT(AN_ENABLE_INT),
        .\AN_NP_TX_REG_WITH_AN.AN_NP_TX_REG_reg[0]_0 (\HAS_MANAGEMENT.MDIO_n_20 ),
        .\AN_NP_TX_REG_WITH_AN.AN_NP_TX_REG_reg[13]_0 (\HAS_MANAGEMENT.MDIO_n_19 ),
        .CLEAR_STATUS_REG(CLEAR_STATUS_REG),
        .\CODE_GRP_reg[0] (\HAS_MANAGEMENT.MDIO_n_18 ),
        .\CONFIG_REG_WITH_AN.POWERDOWN_REG_reg_0 (\HAS_MANAGEMENT.MDIO_n_7 ),
        .FALSE_CARRIER_REG3_reg(\RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_35 ),
        .LOOPBACK(LOOPBACK),
        .MR_AN_COMPLETE(MR_AN_COMPLETE),
        .MR_LINK_STATUS(MR_LINK_STATUS),
        .\MR_LP_ADV_ABILITY_INT_reg[16] ({LP_ADV_ABILITY[16:15],LP_ADV_ABILITY[13],LP_ADV_ABILITY[11]}),
        .Q(TX_EVEN),
        .RECEIVE(RECEIVE),
        .RESTART_AN_REG(RESTART_AN_REG),
        .RXSYNC_STATUS(RXSYNC_STATUS),
        .RX_DATA_ERROR(RX_DATA_ERROR),
        .RX_DV0(RX_DV0),
        .RX_ER0(RX_ER0),
        .RX_INVALID(RX_INVALID),
        .RX_RUDI_INVALID(RX_RUDI_INVALID),
        .SOFT_RESET(SOFT_RESET),
        .SOP_REG3(SOP_REG3),
        .SR(GMII_ISOLATE),
        .STATUS_VECTOR_0_PRE_reg(\HAS_MANAGEMENT.MDIO_n_9 ),
        .TOGGLE_RX(TOGGLE_RX),
        .\USE_ROCKET_IO.MGT_TX_RESET_INT_reg (MGT_TX_RESET),
        .\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCLKCORCNT_INT_reg[2] (RXRUNDISP_INT),
        .\USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.MGT_RX_RESET_INT_reg (MGT_RX_RESET),
        .\USE_ROCKET_IO.TXDATA_reg[7] (\HAS_MANAGEMENT.MDIO_n_10 ),
        .XMIT_CONFIG(XMIT_CONFIG),
        .XMIT_CONFIG_INT(XMIT_CONFIG_INT),
        .XMIT_CONFIG_INT_0(XMIT_CONFIG_INT_0),
        .XMIT_DATA(XMIT_DATA),
        .XMIT_DATA_INT(XMIT_DATA_INT),
        .an_interrupt(an_interrupt),
        .an_restart_config(an_restart_config),
        .configuration_valid(configuration_valid),
        .configuration_vector(configuration_vector),
        .mdc(mdc),
        .mdio_in(mdio_in),
        .mdio_out(mdio_out),
        .mdio_tri(mdio_tri),
        .out(SRESET),
        .phyad(phyad),
        .status_vector(status_vector[12]),
        .userclk2(userclk2));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDPE #(
    .INIT(1'b0)) 
    \MGT_RESET.RESET_INT_PIPE_RXRECCLK_reg 
       (.C(1'b0),
        .CE(1'b1),
        .D(1'b0),
        .PRE(p_6_out),
        .Q(RESET_INT_PIPE_RXRECCLK));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDPE #(
    .INIT(1'b0)) 
    \MGT_RESET.RESET_INT_PIPE_reg 
       (.C(userclk2),
        .CE(1'b1),
        .D(1'b0),
        .PRE(p_3_out),
        .Q(RESET_INT_PIPE));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDPE #(
    .INIT(1'b0)) 
    \MGT_RESET.RESET_INT_RXRECCLK_reg 
       (.C(1'b0),
        .CE(1'b1),
        .D(RESET_INT_PIPE_RXRECCLK),
        .PRE(p_6_out),
        .Q(RESET_INT_RXRECCLK));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDPE #(
    .INIT(1'b0)) 
    \MGT_RESET.RESET_INT_reg 
       (.C(userclk2),
        .CE(1'b1),
        .D(RESET_INT_PIPE),
        .PRE(p_3_out),
        .Q(RESET_INT));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \MGT_RESET.SRESET_PIPE_reg 
       (.C(userclk2),
        .CE(1'b1),
        .D(RESET_INT),
        .Q(SRESET_PIPE),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  FDSE #(
    .INIT(1'b0)) 
    \MGT_RESET.SRESET_reg 
       (.C(userclk2),
        .CE(1'b1),
        .D(SRESET_PIPE),
        .Q(SRESET),
        .S(RESET_INT));
  design_1_gig_ethernet_pcs_pma_0_0_reset_sync_block \MGT_RESET.SYNC_ASYNC_RESET 
       (.SOFT_RESET(SOFT_RESET),
        .p_3_out(p_3_out),
        .reset(reset),
        .userclk2(userclk2));
  design_1_gig_ethernet_pcs_pma_0_0_reset_sync_block_22 \MGT_RESET.SYNC_ASYNC_RESET_RECCLK 
       (.p_6_out(p_6_out),
        .reset(reset),
        .reset_out(SOFT_RESET_RXRECCLK));
  design_1_gig_ethernet_pcs_pma_0_0_reset_sync_block_23 \MGT_RESET.SYNC_SOFT_RESET_RECCLK 
       (.SOFT_RESET(SOFT_RESET),
        .reset_out(SOFT_RESET_RXRECCLK));
  design_1_gig_ethernet_pcs_pma_0_0_RX \RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK 
       (.ABILITY_MATCH_reg(\RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_12 ),
        .ABILITY_MATCH_reg_0(\RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_13 ),
        .ABILITY_MATCH_reg_1(\RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_14 ),
        .ACKNOWLEDGE_MATCH_20(ACKNOWLEDGE_MATCH_20),
        .BASEX_REMOTE_FAULT_RSLVD(BASEX_REMOTE_FAULT_RSLVD),
        .CONFIG_REG_MATCH_reg(\RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_32 ),
        .\CONFIG_REG_WITH_AN.AN_ENABLE_REG_reg (\HAS_MANAGEMENT.MDIO_n_9 ),
        .\CONFIG_REG_WITH_AN.ISOLATE_REG_reg (GMII_ISOLATE),
        .D(D),
        .EVEN_reg(\RX_GMII_AT_TXOUTCLK.SYNCHRONISATION_n_3 ),
        .K28p5_REG1(K28p5_REG1),
        .\MGT_RESET.SRESET_reg (\HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_13 ),
        .\MR_LP_ADV_ABILITY_INT_reg[16] ({RX_CONFIG_REG[15:14],\RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_18 ,RX_CONFIG_REG[12:10],\RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_22 ,\RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_23 ,\RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_24 ,\RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_25 ,\RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_26 ,\RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_27 ,\RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_28 ,\RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_29 ,\RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_30 ,\RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_31 }),
        .Q({\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg_n_0_[7] ,\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg_n_0_[6] ,\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg_n_0_[5] ,\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg_n_0_[4] ,\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg_n_0_[3] ,\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg_n_0_[2] ,\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg_n_0_[1] ,\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg_n_0_[0] }),
        .RECEIVE(RECEIVE),
        .RECEIVED_IDLE(RECEIVED_IDLE),
        .RECEIVED_IDLE_reg(\RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_36 ),
        .RECEIVED_IDLE_reg_0(\HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_15 ),
        .RXEVEN0_out(RXEVEN0_out),
        .RXNOTINTABLE_INT(RXNOTINTABLE_INT),
        .RXSYNC_STATUS(RXSYNC_STATUS),
        .RX_CONFIG_REG_NULL_reg(\RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_37 ),
        .RX_CONFIG_REG_NULL_reg_0(\HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_11 ),
        .\RX_CONFIG_REG_REG_reg[15] (RX_CONFIG_REG_REG0),
        .\RX_CONFIG_REG_REG_reg[15]_0 ({p_0_in0_in,p_0_in28_in,\HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_19 ,\HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_20 ,\HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_21 ,\HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_22 ,\HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_23 ,\HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_24 ,\HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_25 ,\HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_26 }),
        .\RX_CONFIG_REG_REG_reg[6] (\HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_27 ),
        .\RX_CONFIG_REG_REG_reg[7] (\HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_16 ),
        .\RX_CONFIG_REG_reg[5]_0 (\HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_14 ),
        .RX_CONFIG_VALID(RX_CONFIG_VALID),
        .RX_DATA_ERROR(RX_DATA_ERROR),
        .RX_DV0(RX_DV0),
        .RX_ER0(RX_ER0),
        .RX_ER_reg_0(\RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK_n_35 ),
        .RX_IDLE(RX_IDLE),
        .RX_INVALID(RX_INVALID),
        .S2(S2),
        .SOP_REG3(SOP_REG3),
        .SR(MGT_RX_RESET),
        .SYNC_STATUS_REG0(SYNC_STATUS_REG0),
        .\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXBUFSTATUS_INT_reg[1] (\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXBUFSTATUS_INT_reg_n_0_[1] ),
        .\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISK_INT_reg (\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISK_INT_reg_n_0 ),
        .\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCLKCORCNT_INT_reg[2] ({\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCLKCORCNT_INT_reg_n_0_[2] ,\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCLKCORCNT_INT_reg_n_0_[0] }),
        .\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXRUNDISP_INT_reg (\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXRUNDISP_INT_reg_n_0 ),
        .XMIT_DATA(XMIT_DATA),
        .gmii_rx_dv(gmii_rx_dv),
        .gmii_rx_er(gmii_rx_er),
        .gmii_rxd(gmii_rxd),
        .out(SRESET),
        .status_vector(status_vector[3:2]),
        .userclk2(userclk2));
  design_1_gig_ethernet_pcs_pma_0_0_SYNCHRONISE \RX_GMII_AT_TXOUTCLK.SYNCHRONISATION 
       (.D(D),
        .EXTEND_reg(\RX_GMII_AT_TXOUTCLK.SYNCHRONISATION_n_3 ),
        .K28p5_REG1(K28p5_REG1),
        .LOOPBACK(LOOPBACK),
        .RXEVEN0_out(RXEVEN0_out),
        .RXNOTINTABLE_INT(RXNOTINTABLE_INT),
        .RXSYNC_STATUS(RXSYNC_STATUS),
        .RX_RUDI_INVALID_REG_reg(\RX_GMII_AT_TXOUTCLK.SYNCHRONISATION_n_4 ),
        .S2(S2),
        .SIGNAL_DETECT_MOD(SIGNAL_DETECT_MOD),
        .SR(MGT_RX_RESET),
        .SYNC_STATUS_REG0(SYNC_STATUS_REG0),
        .\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXBUFSTATUS_INT_reg[1] (\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXBUFSTATUS_INT_reg_n_0_[1] ),
        .\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISCOMMA_INT_reg (\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISCOMMA_INT_reg_n_0 ),
        .\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISK_INT_reg (\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISK_INT_reg_n_0 ),
        .out(SRESET),
        .userclk2(userclk2));
  FDRE #(
    .INIT(1'b0)) 
    STATUS_VECTOR_0_PRE_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(\HAS_MANAGEMENT.MDIO_n_9 ),
        .Q(STATUS_VECTOR_0_PRE),
        .R(1'b0));
  FDRE \STATUS_VECTOR_reg[0] 
       (.C(userclk2),
        .CE(1'b1),
        .D(STATUS_VECTOR_0_PRE),
        .Q(status_vector[0]),
        .R(1'b0));
  FDRE \STATUS_VECTOR_reg[12] 
       (.C(userclk2),
        .CE(1'b1),
        .D(DUPLEX_MODE_RSLVD_REG),
        .Q(status_vector[11]),
        .R(1'b0));
  FDRE \STATUS_VECTOR_reg[1] 
       (.C(userclk2),
        .CE(1'b1),
        .D(SYNC_STATUS_REG),
        .Q(status_vector[1]),
        .R(1'b0));
  design_1_gig_ethernet_pcs_pma_0_0_sync_block SYNC_SIGNAL_DETECT
       (.\CONFIG_REG_WITH_AN.POWERDOWN_REG_reg (\HAS_MANAGEMENT.MDIO_n_7 ),
        .\MASK_RUDI_BUFERR_TIMER_reg[12] (SYNC_SIGNAL_DETECT_n_0),
        .\MASK_RUDI_BUFERR_TIMER_reg[3] (\HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_28 ),
        .SIGNAL_DETECT_MOD(SIGNAL_DETECT_MOD),
        .\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXBUFSTATUS_INT_reg[1] (\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXBUFSTATUS_INT_reg_n_0_[1] ),
        .data_out(data_out),
        .signal_detect(signal_detect),
        .userclk2(userclk2));
  FDRE #(
    .INIT(1'b0)) 
    SYNC_STATUS_REG_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(RXSYNC_STATUS),
        .Q(SYNC_STATUS_REG),
        .R(1'b0));
  design_1_gig_ethernet_pcs_pma_0_0_TX TRANSMITTER
       (.\CONFIG_REG_WITH_AN.ISOLATE_REG_reg (\HAS_MANAGEMENT.MDIO_n_18 ),
        .D({TRANSMITTER_n_2,TRANSMITTER_n_3,TRANSMITTER_n_4,TRANSMITTER_n_5}),
        .LOOPBACK(LOOPBACK),
        .Q(TX_EVEN),
        .SR(GMII_ISOLATE),
        .\TX_CONFIG_REG_INT_reg[14] ({\HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_33 ,\HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_34 ,\HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_35 ,\HAS_AUTO_NEG.AN_RX_GMII_AT_TXOUTCLK.AUTO_NEGOTIATION_n_36 }),
        .\USE_ROCKET_IO.MGT_TX_RESET_INT_reg (MGT_TX_RESET),
        .\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISCOMMA_INT_reg (TRANSMITTER_n_9),
        .\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISK_INT_reg (TRANSMITTER_n_8),
        .\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg[7] ({TRANSMITTER_n_15,TRANSMITTER_n_16,TRANSMITTER_n_17,TRANSMITTER_n_18,TRANSMITTER_n_19,TRANSMITTER_n_20,TRANSMITTER_n_21,TRANSMITTER_n_22}),
        .\USE_ROCKET_IO.TXCHARDISPMODE_reg (TRANSMITTER_n_6),
        .\USE_ROCKET_IO.TXCHARDISPVAL_reg (TRANSMITTER_n_14),
        .\USE_ROCKET_IO.TXCHARISK_reg (TRANSMITTER_n_7),
        .\USE_ROCKET_IO.TXDATA_reg[2] (TRANSMITTER_n_10),
        .\USE_ROCKET_IO.TXDATA_reg[3] (TRANSMITTER_n_11),
        .\USE_ROCKET_IO.TXDATA_reg[5] (TRANSMITTER_n_12),
        .\USE_ROCKET_IO.TXDATA_reg[7] (TRANSMITTER_n_13),
        .XMIT_CONFIG(XMIT_CONFIG),
        .XMIT_CONFIG_INT(XMIT_CONFIG_INT_0),
        .XMIT_DATA(XMIT_DATA),
        .gmii_tx_en(gmii_tx_en),
        .gmii_tx_er(gmii_tx_er),
        .gmii_txd(gmii_txd),
        .rxchariscomma(rxchariscomma),
        .rxcharisk(rxcharisk),
        .rxdata(rxdata),
        .userclk2(userclk2));
  LUT2 #(
    .INIT(4'hB)) 
    \USE_ROCKET_IO.MGT_TX_RESET_INT_i_1 
       (.I0(\FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[13] ),
        .I1(\USE_ROCKET_IO.MGT_TX_RESET_INT_i_2_n_0 ),
        .O(MGT_TX_RESET_INT));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \USE_ROCKET_IO.MGT_TX_RESET_INT_i_2 
       (.I0(\USE_ROCKET_IO.MGT_TX_RESET_INT_i_3_n_0 ),
        .I1(\FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[1] ),
        .I2(\FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[0] ),
        .I3(\FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[3] ),
        .I4(\FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[2] ),
        .I5(\USE_ROCKET_IO.MGT_TX_RESET_INT_i_4_n_0 ),
        .O(\USE_ROCKET_IO.MGT_TX_RESET_INT_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \USE_ROCKET_IO.MGT_TX_RESET_INT_i_3 
       (.I0(\FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[5] ),
        .I1(\FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[4] ),
        .I2(\FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[7] ),
        .I3(\FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[6] ),
        .O(\USE_ROCKET_IO.MGT_TX_RESET_INT_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \USE_ROCKET_IO.MGT_TX_RESET_INT_i_4 
       (.I0(\FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[11] ),
        .I1(\FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[10] ),
        .I2(\FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[12] ),
        .I3(\FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[8] ),
        .I4(\FSM_onehot_USE_ROCKET_IO.TX_RST_SM_reg_n_0_[9] ),
        .O(\USE_ROCKET_IO.MGT_TX_RESET_INT_i_4_n_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \USE_ROCKET_IO.MGT_TX_RESET_INT_reg 
       (.C(userclk2),
        .CE(1'b1),
        .D(MGT_TX_RESET_INT),
        .Q(MGT_TX_RESET),
        .S(RESET_INT));
  FDRE #(
    .INIT(1'b0)) 
    \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXBUFSTATUS_INT_reg[1] 
       (.C(userclk2),
        .CE(1'b1),
        .D(rxbufstatus),
        .Q(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXBUFSTATUS_INT_reg_n_0_[1] ),
        .R(RXRUNDISP_INT));
  FDRE #(
    .INIT(1'b0)) 
    \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISCOMMA_INT_reg 
       (.C(userclk2),
        .CE(1'b1),
        .D(TRANSMITTER_n_9),
        .Q(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISCOMMA_INT_reg_n_0 ),
        .R(MGT_RX_RESET));
  FDRE #(
    .INIT(1'b0)) 
    \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISK_INT_reg 
       (.C(userclk2),
        .CE(1'b1),
        .D(TRANSMITTER_n_8),
        .Q(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISK_INT_reg_n_0 ),
        .R(MGT_RX_RESET));
  FDRE #(
    .INIT(1'b0)) 
    \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCLKCORCNT_INT_reg[0] 
       (.C(userclk2),
        .CE(1'b1),
        .D(rxclkcorcnt[0]),
        .Q(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCLKCORCNT_INT_reg_n_0_[0] ),
        .R(RXRUNDISP_INT));
  FDRE #(
    .INIT(1'b0)) 
    \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCLKCORCNT_INT_reg[2] 
       (.C(userclk2),
        .CE(1'b1),
        .D(rxclkcorcnt[1]),
        .Q(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCLKCORCNT_INT_reg_n_0_[2] ),
        .R(RXRUNDISP_INT));
  FDRE #(
    .INIT(1'b0)) 
    \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg[0] 
       (.C(userclk2),
        .CE(1'b1),
        .D(TRANSMITTER_n_22),
        .Q(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg_n_0_[0] ),
        .R(MGT_RX_RESET));
  FDRE #(
    .INIT(1'b0)) 
    \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg[1] 
       (.C(userclk2),
        .CE(1'b1),
        .D(TRANSMITTER_n_21),
        .Q(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg_n_0_[1] ),
        .R(MGT_RX_RESET));
  FDRE #(
    .INIT(1'b0)) 
    \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg[2] 
       (.C(userclk2),
        .CE(1'b1),
        .D(TRANSMITTER_n_20),
        .Q(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg_n_0_[2] ),
        .R(MGT_RX_RESET));
  FDRE #(
    .INIT(1'b0)) 
    \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg[3] 
       (.C(userclk2),
        .CE(1'b1),
        .D(TRANSMITTER_n_19),
        .Q(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg_n_0_[3] ),
        .R(MGT_RX_RESET));
  FDRE #(
    .INIT(1'b0)) 
    \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg[4] 
       (.C(userclk2),
        .CE(1'b1),
        .D(TRANSMITTER_n_18),
        .Q(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg_n_0_[4] ),
        .R(MGT_RX_RESET));
  FDRE #(
    .INIT(1'b0)) 
    \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg[5] 
       (.C(userclk2),
        .CE(1'b1),
        .D(TRANSMITTER_n_17),
        .Q(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg_n_0_[5] ),
        .R(MGT_RX_RESET));
  FDRE #(
    .INIT(1'b0)) 
    \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg[6] 
       (.C(userclk2),
        .CE(1'b1),
        .D(TRANSMITTER_n_16),
        .Q(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg_n_0_[6] ),
        .R(MGT_RX_RESET));
  FDRE #(
    .INIT(1'b0)) 
    \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg[7] 
       (.C(userclk2),
        .CE(1'b1),
        .D(TRANSMITTER_n_15),
        .Q(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg_n_0_[7] ),
        .R(MGT_RX_RESET));
  FDRE #(
    .INIT(1'b0)) 
    \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDISPERR_INT_reg 
       (.C(userclk2),
        .CE(1'b1),
        .D(rxdisperr),
        .Q(D),
        .R(RXRUNDISP_INT));
  FDRE #(
    .INIT(1'b0)) 
    \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXNOTINTABLE_INT_reg 
       (.C(userclk2),
        .CE(1'b1),
        .D(rxnotintable),
        .Q(RXNOTINTABLE_INT),
        .R(RXRUNDISP_INT));
  FDRE #(
    .INIT(1'b0)) 
    \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXRUNDISP_INT_reg 
       (.C(userclk2),
        .CE(1'b1),
        .D(rxrundisp),
        .Q(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXRUNDISP_INT_reg_n_0 ),
        .R(RXRUNDISP_INT));
  LUT2 #(
    .INIT(4'hE)) 
    \USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.MGT_RX_RESET_INT_i_1 
       (.I0(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXBUFSTATUS_INT_reg_n_0_[1] ),
        .I1(RESET_INT),
        .O(p_0_out));
  LUT2 #(
    .INIT(4'hB)) 
    \USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.MGT_RX_RESET_INT_i_2 
       (.I0(\FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[13] ),
        .I1(\USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.MGT_RX_RESET_INT_i_3_n_0 ),
        .O(MGT_RX_RESET_INT));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.MGT_RX_RESET_INT_i_3 
       (.I0(\USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.MGT_RX_RESET_INT_i_4_n_0 ),
        .I1(\FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[1] ),
        .I2(\FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[0] ),
        .I3(\FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[3] ),
        .I4(\FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[2] ),
        .I5(\USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.MGT_RX_RESET_INT_i_5_n_0 ),
        .O(\USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.MGT_RX_RESET_INT_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.MGT_RX_RESET_INT_i_4 
       (.I0(\FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[5] ),
        .I1(\FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[4] ),
        .I2(\FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[7] ),
        .I3(\FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[6] ),
        .O(\USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.MGT_RX_RESET_INT_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.MGT_RX_RESET_INT_i_5 
       (.I0(\FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[11] ),
        .I1(\FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[10] ),
        .I2(\FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[12] ),
        .I3(\FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[8] ),
        .I4(\FSM_onehot_USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM_reg_n_0_[9] ),
        .O(\USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.MGT_RX_RESET_INT_i_5_n_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.MGT_RX_RESET_INT_reg 
       (.C(userclk2),
        .CE(1'b1),
        .D(MGT_RX_RESET_INT),
        .Q(MGT_RX_RESET),
        .S(p_0_out));
  FDRE \USE_ROCKET_IO.TXCHARDISPMODE_reg 
       (.C(userclk2),
        .CE(1'b1),
        .D(TRANSMITTER_n_6),
        .Q(txchardispmode),
        .R(MGT_TX_RESET));
  FDRE \USE_ROCKET_IO.TXCHARDISPVAL_reg 
       (.C(userclk2),
        .CE(1'b1),
        .D(TRANSMITTER_n_14),
        .Q(txchardispval),
        .R(1'b0));
  FDRE \USE_ROCKET_IO.TXCHARISK_reg 
       (.C(userclk2),
        .CE(1'b1),
        .D(TRANSMITTER_n_7),
        .Q(txcharisk),
        .R(MGT_TX_RESET));
  FDRE \USE_ROCKET_IO.TXDATA_reg[0] 
       (.C(userclk2),
        .CE(1'b1),
        .D(TRANSMITTER_n_5),
        .Q(txdata[0]),
        .R(1'b0));
  FDRE \USE_ROCKET_IO.TXDATA_reg[1] 
       (.C(userclk2),
        .CE(1'b1),
        .D(TRANSMITTER_n_4),
        .Q(txdata[1]),
        .R(1'b0));
  FDSE \USE_ROCKET_IO.TXDATA_reg[2] 
       (.C(userclk2),
        .CE(1'b1),
        .D(TRANSMITTER_n_10),
        .Q(txdata[2]),
        .S(\HAS_MANAGEMENT.MDIO_n_10 ));
  FDSE \USE_ROCKET_IO.TXDATA_reg[3] 
       (.C(userclk2),
        .CE(1'b1),
        .D(TRANSMITTER_n_11),
        .Q(txdata[3]),
        .S(\HAS_MANAGEMENT.MDIO_n_10 ));
  FDRE \USE_ROCKET_IO.TXDATA_reg[4] 
       (.C(userclk2),
        .CE(1'b1),
        .D(TRANSMITTER_n_3),
        .Q(txdata[4]),
        .R(1'b0));
  FDSE \USE_ROCKET_IO.TXDATA_reg[5] 
       (.C(userclk2),
        .CE(1'b1),
        .D(TRANSMITTER_n_12),
        .Q(txdata[5]),
        .S(\HAS_MANAGEMENT.MDIO_n_10 ));
  FDRE \USE_ROCKET_IO.TXDATA_reg[6] 
       (.C(userclk2),
        .CE(1'b1),
        .D(TRANSMITTER_n_2),
        .Q(txdata[6]),
        .R(1'b0));
  FDSE \USE_ROCKET_IO.TXDATA_reg[7] 
       (.C(userclk2),
        .CE(1'b1),
        .D(TRANSMITTER_n_13),
        .Q(txdata[7]),
        .S(\HAS_MANAGEMENT.MDIO_n_10 ));
  LUT1 #(
    .INIT(2'h2)) 
    i_0
       (.I0(1'b1),
        .O(RXRECRESET));
  LUT1 #(
    .INIT(2'h2)) 
    i_1
       (.I0(1'b1),
        .O(RXRECRESET_PIPE));
  LUT1 #(
    .INIT(2'h2)) 
    i_2
       (.I0(1'b1),
        .O(RXRECRESET_PIPE_1));
  LUT1 #(
    .INIT(2'h2)) 
    i_3
       (.I0(1'b1),
        .O(RXRECRESET_PIPE_2));
  LUT1 #(
    .INIT(2'h2)) 
    i_4
       (.I0(1'b1),
        .O(RXRECRESET_PIPE_3));
endmodule

(* ORIG_REF_NAME = "MANAGEMENT" *) 
module design_1_gig_ethernet_pcs_pma_0_0_MANAGEMENT
   (SR,
    AN_ENABLE_INT,
    LOOPBACK,
    mdio_out,
    mdio_tri,
    CLEAR_STATUS_REG,
    RESTART_AN_REG,
    \CONFIG_REG_WITH_AN.POWERDOWN_REG_reg_0 ,
    an_interrupt,
    STATUS_VECTOR_0_PRE_reg,
    \USE_ROCKET_IO.TXDATA_reg[7] ,
    SOFT_RESET,
    RX_DV0,
    RX_RUDI_INVALID,
    RX_ER0,
    XMIT_DATA,
    XMIT_CONFIG,
    \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCLKCORCNT_INT_reg[2] ,
    \CODE_GRP_reg[0] ,
    \AN_NP_TX_REG_WITH_AN.AN_NP_TX_REG_reg[13]_0 ,
    \AN_NP_TX_REG_WITH_AN.AN_NP_TX_REG_reg[0]_0 ,
    out,
    userclk2,
    configuration_valid,
    an_restart_config,
    MR_AN_COMPLETE,
    XMIT_DATA_INT,
    RXSYNC_STATUS,
    \USE_ROCKET_IO.MGT_TX_RESET_INT_reg ,
    Q,
    configuration_vector,
    \MR_LP_ADV_ABILITY_INT_reg[16] ,
    SOP_REG3,
    RX_INVALID,
    FALSE_CARRIER_REG3_reg,
    RX_DATA_ERROR,
    RECEIVE,
    XMIT_CONFIG_INT,
    \USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.MGT_RX_RESET_INT_reg ,
    phyad,
    TOGGLE_RX,
    XMIT_CONFIG_INT_0,
    status_vector,
    MR_LINK_STATUS,
    mdc,
    mdio_in);
  output [0:0]SR;
  output AN_ENABLE_INT;
  output LOOPBACK;
  output mdio_out;
  output mdio_tri;
  output CLEAR_STATUS_REG;
  output RESTART_AN_REG;
  output \CONFIG_REG_WITH_AN.POWERDOWN_REG_reg_0 ;
  output an_interrupt;
  output STATUS_VECTOR_0_PRE_reg;
  output \USE_ROCKET_IO.TXDATA_reg[7] ;
  output SOFT_RESET;
  output RX_DV0;
  output RX_RUDI_INVALID;
  output RX_ER0;
  output XMIT_DATA;
  output XMIT_CONFIG;
  output [0:0]\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCLKCORCNT_INT_reg[2] ;
  output \CODE_GRP_reg[0] ;
  output \AN_NP_TX_REG_WITH_AN.AN_NP_TX_REG_reg[13]_0 ;
  output \AN_NP_TX_REG_WITH_AN.AN_NP_TX_REG_reg[0]_0 ;
  input out;
  input userclk2;
  input configuration_valid;
  input an_restart_config;
  input MR_AN_COMPLETE;
  input XMIT_DATA_INT;
  input RXSYNC_STATUS;
  input [0:0]\USE_ROCKET_IO.MGT_TX_RESET_INT_reg ;
  input [0:0]Q;
  input [4:0]configuration_vector;
  input [3:0]\MR_LP_ADV_ABILITY_INT_reg[16] ;
  input SOP_REG3;
  input RX_INVALID;
  input FALSE_CARRIER_REG3_reg;
  input RX_DATA_ERROR;
  input RECEIVE;
  input XMIT_CONFIG_INT;
  input [0:0]\USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.MGT_RX_RESET_INT_reg ;
  input [4:0]phyad;
  input TOGGLE_RX;
  input XMIT_CONFIG_INT_0;
  input [0:0]status_vector;
  input MR_LINK_STATUS;
  input mdc;
  input mdio_in;

  wire AN_COMPLETE_REG1;
  wire AN_ENABLE_INT;
  wire \AN_NP_TX_REG_WITH_AN.AN_NP_TX_REG_reg[0]_0 ;
  wire \AN_NP_TX_REG_WITH_AN.AN_NP_TX_REG_reg[13]_0 ;
  wire CLEAR_STATUS_REG;
  wire CLEAR_STATUS_REG_COMB;
  wire \CODE_GRP_reg[0] ;
  wire CONFIGURATION_VALID_EN;
  wire CONFIGURATION_VALID_EN_REG;
  wire \CONFIG_REG_WITH_AN.DUPLEX_MODE_REG_reg_n_0 ;
  wire \CONFIG_REG_WITH_AN.POWERDOWN_REG_reg_0 ;
  wire \CONFIG_REG_WITH_AN.RESET_REG_i_1_n_0 ;
  wire [15:15]DATA_OUT;
  wire FALSE_CARRIER_REG3_reg;
  wire LOOPBACK;
  wire LOOPBACK_REG;
  wire MDC_REG3;
  wire MDC_RISING_OUT;
  wire MDC_RISING_REG1;
  wire MDC_RISING_REG10;
  wire \MDIO_IF_ENABLE.MDIO_INTERFACE_1_n_10 ;
  wire \MDIO_IF_ENABLE.MDIO_INTERFACE_1_n_11 ;
  wire \MDIO_IF_ENABLE.MDIO_INTERFACE_1_n_12 ;
  wire \MDIO_IF_ENABLE.MDIO_INTERFACE_1_n_13 ;
  wire \MDIO_IF_ENABLE.MDIO_INTERFACE_1_n_14 ;
  wire \MDIO_IF_ENABLE.MDIO_INTERFACE_1_n_15 ;
  wire \MDIO_IF_ENABLE.MDIO_INTERFACE_1_n_4 ;
  wire \MDIO_IF_ENABLE.MDIO_INTERFACE_1_n_5 ;
  wire \MDIO_IF_ENABLE.MDIO_INTERFACE_1_n_8 ;
  wire \MDIO_IF_ENABLE.MDIO_INTERFACE_1_n_9 ;
  wire MDIO_IN;
  wire MDIO_IN_REG2;
  wire MDIO_IN_REG3;
  wire MR_AN_COMPLETE;
  wire MR_LINK_STATUS;
  wire [3:0]\MR_LP_ADV_ABILITY_INT_reg[16] ;
  wire [0:0]Q;
  wire RECEIVE;
  wire RESTART_AN_EN;
  wire RESTART_AN_EN_REG;
  wire RESTART_AN_REG;
  wire RXSYNC_STATUS;
  wire RX_DATA_ERROR;
  wire RX_DV0;
  wire RX_ER0;
  wire RX_ER_i_3_n_0;
  wire RX_INVALID;
  wire RX_RUDI_INVALID;
  wire SOFT_RESET;
  wire SOP_REG3;
  wire [0:0]SR;
  wire STATUS_VECTOR_0_PRE_reg;
  wire TOGGLE_RX;
  wire [0:0]\USE_ROCKET_IO.MGT_TX_RESET_INT_reg ;
  wire [0:0]\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCLKCORCNT_INT_reg[2] ;
  wire [0:0]\USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.MGT_RX_RESET_INT_reg ;
  wire \USE_ROCKET_IO.TXDATA_reg[7] ;
  wire XMIT_CONFIG;
  wire XMIT_CONFIG_INT;
  wire XMIT_CONFIG_INT_0;
  wire XMIT_DATA;
  wire XMIT_DATA_INT;
  wire an_interrupt;
  wire an_restart_config;
  wire configuration_valid;
  wire [4:0]configuration_vector;
  wire data_out;
  wire mdc;
  wire mdio_in;
  wire mdio_out;
  wire mdio_tri;
  wire out;
  wire p_31_out;
  wire p_33_out;
  wire [0:0]p_5_in;
  wire [5:5]p_9_in;
  wire [4:0]phyad;
  wire [0:0]status_vector;
  wire userclk2;

  FDSE #(
    .INIT(1'b0)) 
    \AN_NP_TX_REG_WITH_AN.AN_NP_TX_REG_reg[0] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\AN_NP_TX_REG_WITH_AN.AN_NP_TX_REG_reg[0]_0 ),
        .Q(\AN_NP_TX_REG_WITH_AN.AN_NP_TX_REG_reg[0]_0 ),
        .S(out));
  FDSE #(
    .INIT(1'b0)) 
    \AN_NP_TX_REG_WITH_AN.AN_NP_TX_REG_reg[13] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\AN_NP_TX_REG_WITH_AN.AN_NP_TX_REG_reg[13]_0 ),
        .Q(\AN_NP_TX_REG_WITH_AN.AN_NP_TX_REG_reg[13]_0 ),
        .S(out));
  FDRE CLEAR_STATUS_REG_reg
       (.C(userclk2),
        .CE(MDC_RISING_OUT),
        .D(CLEAR_STATUS_REG_COMB),
        .Q(CLEAR_STATUS_REG),
        .R(out));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \CODE_GRP[6]_i_1 
       (.I0(SR),
        .I1(XMIT_CONFIG_INT_0),
        .O(\CODE_GRP_reg[0] ));
  FDSE #(
    .INIT(1'b0)) 
    \CONFIG_REG_WITH_AN.AN_ENABLE_REG_reg 
       (.C(userclk2),
        .CE(LOOPBACK_REG),
        .D(\MDIO_IF_ENABLE.MDIO_INTERFACE_1_n_10 ),
        .Q(AN_ENABLE_INT),
        .S(out));
  FDRE #(
    .INIT(1'b0)) 
    \CONFIG_REG_WITH_AN.CONFIGURATION_VALID_EN_REG_reg 
       (.C(userclk2),
        .CE(1'b1),
        .D(configuration_valid),
        .Q(CONFIGURATION_VALID_EN_REG),
        .R(out));
  LUT2 #(
    .INIT(4'h2)) 
    \CONFIG_REG_WITH_AN.CONFIGURATION_VALID_EN_i_1 
       (.I0(configuration_valid),
        .I1(CONFIGURATION_VALID_EN_REG),
        .O(p_31_out));
  FDRE #(
    .INIT(1'b0)) 
    \CONFIG_REG_WITH_AN.CONFIGURATION_VALID_EN_reg 
       (.C(userclk2),
        .CE(1'b1),
        .D(p_31_out),
        .Q(CONFIGURATION_VALID_EN),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \CONFIG_REG_WITH_AN.DUPLEX_MODE_REG_reg 
       (.C(userclk2),
        .CE(1'b1),
        .D(\MDIO_IF_ENABLE.MDIO_INTERFACE_1_n_15 ),
        .Q(\CONFIG_REG_WITH_AN.DUPLEX_MODE_REG_reg_n_0 ),
        .R(1'b0));
  FDSE #(
    .INIT(1'b1)) 
    \CONFIG_REG_WITH_AN.ISOLATE_REG_reg 
       (.C(userclk2),
        .CE(LOOPBACK_REG),
        .D(\MDIO_IF_ENABLE.MDIO_INTERFACE_1_n_9 ),
        .Q(SR),
        .S(out));
  FDRE #(
    .INIT(1'b0)) 
    \CONFIG_REG_WITH_AN.LOOPBACK_REG_reg 
       (.C(userclk2),
        .CE(LOOPBACK_REG),
        .D(\MDIO_IF_ENABLE.MDIO_INTERFACE_1_n_11 ),
        .Q(LOOPBACK),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \CONFIG_REG_WITH_AN.POWERDOWN_REG_reg 
       (.C(userclk2),
        .CE(1'b1),
        .D(\MDIO_IF_ENABLE.MDIO_INTERFACE_1_n_4 ),
        .Q(\CONFIG_REG_WITH_AN.POWERDOWN_REG_reg_0 ),
        .R(1'b0));
  LUT4 #(
    .INIT(16'hFF40)) 
    \CONFIG_REG_WITH_AN.RESET_REG_i_1 
       (.I0(\MDIO_IF_ENABLE.MDIO_INTERFACE_1_n_5 ),
        .I1(MDC_RISING_OUT),
        .I2(DATA_OUT),
        .I3(SOFT_RESET),
        .O(\CONFIG_REG_WITH_AN.RESET_REG_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \CONFIG_REG_WITH_AN.RESET_REG_reg 
       (.C(userclk2),
        .CE(1'b1),
        .D(\CONFIG_REG_WITH_AN.RESET_REG_i_1_n_0 ),
        .Q(SOFT_RESET),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \CONFIG_REG_WITH_AN.RESTART_AN_EN_REG_reg 
       (.C(userclk2),
        .CE(1'b1),
        .D(an_restart_config),
        .Q(RESTART_AN_EN_REG),
        .R(out));
  LUT2 #(
    .INIT(4'h2)) 
    \CONFIG_REG_WITH_AN.RESTART_AN_EN_i_1 
       (.I0(an_restart_config),
        .I1(RESTART_AN_EN_REG),
        .O(p_33_out));
  FDRE #(
    .INIT(1'b0)) 
    \CONFIG_REG_WITH_AN.RESTART_AN_EN_reg 
       (.C(userclk2),
        .CE(1'b1),
        .D(p_33_out),
        .Q(RESTART_AN_EN),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \CONFIG_REG_WITH_AN.RESTART_AN_REG_reg 
       (.C(userclk2),
        .CE(1'b1),
        .D(\MDIO_IF_ENABLE.MDIO_INTERFACE_1_n_12 ),
        .Q(RESTART_AN_REG),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \CONFIG_REG_WITH_AN.UNIDIRECTIONAL_ENABLE_REG_reg 
       (.C(userclk2),
        .CE(LOOPBACK_REG),
        .D(\MDIO_IF_ENABLE.MDIO_INTERFACE_1_n_8 ),
        .Q(p_9_in),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_INTERRUPT_LOGIC.AN_COMPLETE_REG1_reg 
       (.C(userclk2),
        .CE(MDC_RISING_OUT),
        .D(MR_AN_COMPLETE),
        .Q(AN_COMPLETE_REG1),
        .R(out));
  FDSE #(
    .INIT(1'b0)) 
    \GEN_INTERRUPT_LOGIC.AN_INTERRUPT_ENABLE_reg 
       (.C(userclk2),
        .CE(1'b1),
        .D(\MDIO_IF_ENABLE.MDIO_INTERFACE_1_n_13 ),
        .Q(p_5_in),
        .S(out));
  FDRE #(
    .INIT(1'b0)) 
    \GEN_INTERRUPT_LOGIC.AN_INTERRUPT_INT_reg 
       (.C(userclk2),
        .CE(1'b1),
        .D(\MDIO_IF_ENABLE.MDIO_INTERFACE_1_n_14 ),
        .Q(an_interrupt),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    MDC_REG3_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(data_out),
        .Q(MDC_REG3),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    MDC_RISING_REG1_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(MDC_RISING_REG10),
        .Q(MDC_RISING_REG1),
        .R(out));
  design_1_gig_ethernet_pcs_pma_0_0_MDIO_INTERFACE \MDIO_IF_ENABLE.MDIO_INTERFACE_1 
       (.AN_COMPLETE_REG1(AN_COMPLETE_REG1),
        .CLEAR_STATUS_REG_COMB(CLEAR_STATUS_REG_COMB),
        .CONFIGURATION_VALID_EN(CONFIGURATION_VALID_EN),
        .\CONFIG_REG_WITH_AN.AN_ENABLE_REG_reg (\MDIO_IF_ENABLE.MDIO_INTERFACE_1_n_10 ),
        .\CONFIG_REG_WITH_AN.AN_ENABLE_REG_reg_0 (AN_ENABLE_INT),
        .\CONFIG_REG_WITH_AN.DUPLEX_MODE_REG_reg (\MDIO_IF_ENABLE.MDIO_INTERFACE_1_n_15 ),
        .\CONFIG_REG_WITH_AN.DUPLEX_MODE_REG_reg_0 (\CONFIG_REG_WITH_AN.DUPLEX_MODE_REG_reg_n_0 ),
        .\CONFIG_REG_WITH_AN.ISOLATE_REG_reg (\MDIO_IF_ENABLE.MDIO_INTERFACE_1_n_9 ),
        .\CONFIG_REG_WITH_AN.ISOLATE_REG_reg_0 (SR),
        .\CONFIG_REG_WITH_AN.LOOPBACK_REG_reg (\MDIO_IF_ENABLE.MDIO_INTERFACE_1_n_11 ),
        .\CONFIG_REG_WITH_AN.LOOPBACK_REG_reg_0 (LOOPBACK),
        .\CONFIG_REG_WITH_AN.POWERDOWN_REG_reg (\MDIO_IF_ENABLE.MDIO_INTERFACE_1_n_4 ),
        .\CONFIG_REG_WITH_AN.POWERDOWN_REG_reg_0 (\CONFIG_REG_WITH_AN.POWERDOWN_REG_reg_0 ),
        .\CONFIG_REG_WITH_AN.RESTART_AN_REG_reg (\MDIO_IF_ENABLE.MDIO_INTERFACE_1_n_5 ),
        .\CONFIG_REG_WITH_AN.RESTART_AN_REG_reg_0 (\MDIO_IF_ENABLE.MDIO_INTERFACE_1_n_12 ),
        .\CONFIG_REG_WITH_AN.UNIDIRECTIONAL_ENABLE_REG_reg (\MDIO_IF_ENABLE.MDIO_INTERFACE_1_n_8 ),
        .\GEN_INTERRUPT_LOGIC.AN_INTERRUPT_ENABLE_reg (\MDIO_IF_ENABLE.MDIO_INTERFACE_1_n_13 ),
        .\GEN_INTERRUPT_LOGIC.AN_INTERRUPT_INT_reg (\MDIO_IF_ENABLE.MDIO_INTERFACE_1_n_14 ),
        .LOOPBACK_REG(LOOPBACK_REG),
        .MDC_RISING_OUT(MDC_RISING_OUT),
        .MDC_RISING_REG1(MDC_RISING_REG1),
        .MDIO_IN(MDIO_IN),
        .MR_AN_COMPLETE(MR_AN_COMPLETE),
        .MR_LINK_STATUS(MR_LINK_STATUS),
        .\MR_LP_ADV_ABILITY_INT_reg[16] (\MR_LP_ADV_ABILITY_INT_reg[16] ),
        .Q(DATA_OUT),
        .RESTART_AN_EN(RESTART_AN_EN),
        .RESTART_AN_REG(RESTART_AN_REG),
        .SOFT_RESET(SOFT_RESET),
        .TOGGLE_RX(TOGGLE_RX),
        .an_interrupt(an_interrupt),
        .configuration_vector(configuration_vector),
        .mdio_out(mdio_out),
        .mdio_tri(mdio_tri),
        .out(out),
        .p_5_in(p_5_in),
        .p_9_in(p_9_in),
        .phyad(phyad),
        .status_vector(status_vector),
        .userclk2(userclk2));
  FDSE #(
    .INIT(1'b0)) 
    MDIO_IN_REG3_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(MDIO_IN_REG2),
        .Q(MDIO_IN_REG3),
        .S(out));
  FDSE #(
    .INIT(1'b0)) 
    MDIO_IN_REG4_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(MDIO_IN_REG3),
        .Q(MDIO_IN),
        .S(out));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT4 #(
    .INIT(16'h0008)) 
    RX_DV_i_2
       (.I0(STATUS_VECTOR_0_PRE_reg),
        .I1(SOP_REG3),
        .I2(SR),
        .I3(\CONFIG_REG_WITH_AN.POWERDOWN_REG_reg_0 ),
        .O(RX_DV0));
  LUT6 #(
    .INIT(64'h00000000000000F7)) 
    RX_ER_i_1
       (.I0(FALSE_CARRIER_REG3_reg),
        .I1(RXSYNC_STATUS),
        .I2(RX_DATA_ERROR),
        .I3(SR),
        .I4(\CONFIG_REG_WITH_AN.POWERDOWN_REG_reg_0 ),
        .I5(RX_ER_i_3_n_0),
        .O(RX_ER0));
  LUT6 #(
    .INIT(64'h00BF00BF00BFFFFF)) 
    RX_ER_i_3
       (.I0(AN_ENABLE_INT),
        .I1(\CONFIG_REG_WITH_AN.DUPLEX_MODE_REG_reg_n_0 ),
        .I2(p_9_in),
        .I3(XMIT_DATA_INT),
        .I4(RECEIVE),
        .I5(RXSYNC_STATUS),
        .O(RX_ER_i_3_n_0));
  LUT6 #(
    .INIT(64'hAAAAAAAABBBBABBB)) 
    RX_RUDI_INVALID_REG_i_2
       (.I0(RX_INVALID),
        .I1(XMIT_DATA_INT),
        .I2(p_9_in),
        .I3(\CONFIG_REG_WITH_AN.DUPLEX_MODE_REG_reg_n_0 ),
        .I4(AN_ENABLE_INT),
        .I5(RXSYNC_STATUS),
        .O(RX_RUDI_INVALID));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT5 #(
    .INIT(32'hFF400000)) 
    STATUS_VECTOR_0_PRE_i_1
       (.I0(AN_ENABLE_INT),
        .I1(\CONFIG_REG_WITH_AN.DUPLEX_MODE_REG_reg_n_0 ),
        .I2(p_9_in),
        .I3(XMIT_DATA_INT),
        .I4(RXSYNC_STATUS),
        .O(STATUS_VECTOR_0_PRE_reg));
  design_1_gig_ethernet_pcs_pma_0_0_sync_block_24 SYNC_MDC
       (.MDC_REG3(MDC_REG3),
        .MDC_RISING_REG10(MDC_RISING_REG10),
        .data_out(data_out),
        .mdc(mdc),
        .userclk2(userclk2));
  design_1_gig_ethernet_pcs_pma_0_0_sync_block_25 SYNC_MDIO_IN
       (.data_out(MDIO_IN_REG2),
        .mdio_in(mdio_in),
        .userclk2(userclk2));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXNOTINTABLE_INT_i_1 
       (.I0(LOOPBACK),
        .I1(\USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.MGT_RX_RESET_INT_reg ),
        .O(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCLKCORCNT_INT_reg[2] ));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \USE_ROCKET_IO.TXDATA[7]_i_1 
       (.I0(\USE_ROCKET_IO.MGT_TX_RESET_INT_reg ),
        .I1(LOOPBACK),
        .I2(Q),
        .O(\USE_ROCKET_IO.TXDATA_reg[7] ));
  LUT4 #(
    .INIT(16'hAA2A)) 
    XMIT_CONFIG_INT_i_2
       (.I0(XMIT_CONFIG_INT),
        .I1(p_9_in),
        .I2(\CONFIG_REG_WITH_AN.DUPLEX_MODE_REG_reg_n_0 ),
        .I3(AN_ENABLE_INT),
        .O(XMIT_CONFIG));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT4 #(
    .INIT(16'hAAEA)) 
    XMIT_DATA_INT_i_1
       (.I0(XMIT_DATA_INT),
        .I1(p_9_in),
        .I2(\CONFIG_REG_WITH_AN.DUPLEX_MODE_REG_reg_n_0 ),
        .I3(AN_ENABLE_INT),
        .O(XMIT_DATA));
endmodule

(* ORIG_REF_NAME = "MDIO_INTERFACE" *) 
module design_1_gig_ethernet_pcs_pma_0_0_MDIO_INTERFACE
   (MDC_RISING_OUT,
    mdio_out,
    mdio_tri,
    Q,
    \CONFIG_REG_WITH_AN.POWERDOWN_REG_reg ,
    \CONFIG_REG_WITH_AN.RESTART_AN_REG_reg ,
    CLEAR_STATUS_REG_COMB,
    LOOPBACK_REG,
    \CONFIG_REG_WITH_AN.UNIDIRECTIONAL_ENABLE_REG_reg ,
    \CONFIG_REG_WITH_AN.ISOLATE_REG_reg ,
    \CONFIG_REG_WITH_AN.AN_ENABLE_REG_reg ,
    \CONFIG_REG_WITH_AN.LOOPBACK_REG_reg ,
    \CONFIG_REG_WITH_AN.RESTART_AN_REG_reg_0 ,
    \GEN_INTERRUPT_LOGIC.AN_INTERRUPT_ENABLE_reg ,
    \GEN_INTERRUPT_LOGIC.AN_INTERRUPT_INT_reg ,
    \CONFIG_REG_WITH_AN.DUPLEX_MODE_REG_reg ,
    out,
    MDC_RISING_REG1,
    userclk2,
    MDIO_IN,
    configuration_vector,
    CONFIGURATION_VALID_EN,
    \CONFIG_REG_WITH_AN.POWERDOWN_REG_reg_0 ,
    SOFT_RESET,
    \CONFIG_REG_WITH_AN.LOOPBACK_REG_reg_0 ,
    \MR_LP_ADV_ABILITY_INT_reg[16] ,
    \CONFIG_REG_WITH_AN.AN_ENABLE_REG_reg_0 ,
    RESTART_AN_REG,
    MR_AN_COMPLETE,
    an_interrupt,
    phyad,
    \CONFIG_REG_WITH_AN.ISOLATE_REG_reg_0 ,
    TOGGLE_RX,
    status_vector,
    MR_LINK_STATUS,
    p_5_in,
    p_9_in,
    RESTART_AN_EN,
    AN_COMPLETE_REG1,
    \CONFIG_REG_WITH_AN.DUPLEX_MODE_REG_reg_0 );
  output MDC_RISING_OUT;
  output mdio_out;
  output mdio_tri;
  output [0:0]Q;
  output \CONFIG_REG_WITH_AN.POWERDOWN_REG_reg ;
  output \CONFIG_REG_WITH_AN.RESTART_AN_REG_reg ;
  output CLEAR_STATUS_REG_COMB;
  output LOOPBACK_REG;
  output \CONFIG_REG_WITH_AN.UNIDIRECTIONAL_ENABLE_REG_reg ;
  output \CONFIG_REG_WITH_AN.ISOLATE_REG_reg ;
  output \CONFIG_REG_WITH_AN.AN_ENABLE_REG_reg ;
  output \CONFIG_REG_WITH_AN.LOOPBACK_REG_reg ;
  output \CONFIG_REG_WITH_AN.RESTART_AN_REG_reg_0 ;
  output \GEN_INTERRUPT_LOGIC.AN_INTERRUPT_ENABLE_reg ;
  output \GEN_INTERRUPT_LOGIC.AN_INTERRUPT_INT_reg ;
  output \CONFIG_REG_WITH_AN.DUPLEX_MODE_REG_reg ;
  input out;
  input MDC_RISING_REG1;
  input userclk2;
  input MDIO_IN;
  input [4:0]configuration_vector;
  input CONFIGURATION_VALID_EN;
  input \CONFIG_REG_WITH_AN.POWERDOWN_REG_reg_0 ;
  input SOFT_RESET;
  input \CONFIG_REG_WITH_AN.LOOPBACK_REG_reg_0 ;
  input [3:0]\MR_LP_ADV_ABILITY_INT_reg[16] ;
  input \CONFIG_REG_WITH_AN.AN_ENABLE_REG_reg_0 ;
  input RESTART_AN_REG;
  input MR_AN_COMPLETE;
  input an_interrupt;
  input [4:0]phyad;
  input \CONFIG_REG_WITH_AN.ISOLATE_REG_reg_0 ;
  input TOGGLE_RX;
  input [0:0]status_vector;
  input MR_LINK_STATUS;
  input [0:0]p_5_in;
  input [0:0]p_9_in;
  input RESTART_AN_EN;
  input AN_COMPLETE_REG1;
  input \CONFIG_REG_WITH_AN.DUPLEX_MODE_REG_reg_0 ;

  (* RTL_KEEP = "yes" *) wire ADDRESS_MATCH;
  wire ADDRESS_MATCH_COMB;
  wire ADDRESS_MATCH_i_1_n_0;
  wire ADDRESS_MATCH_i_3_n_0;
  wire ADDRESS_MATCH_reg_n_0;
  wire [0:0]ADDR_RD;
  wire [4:0]ADDR_WR;
  wire \ADDR_WR[4]_i_1_n_0 ;
  wire AN_COMPLETE_REG1;
  wire BIT_COUNT;
  wire \BIT_COUNT[3]_i_3_n_0 ;
  wire [3:0]BIT_COUNT_reg__0;
  wire CLEAR_STATUS_REG_COMB;
  wire CONFIGURATION_VALID_EN;
  wire \CONFIG_REG_WITH_AN.AN_ENABLE_REG_reg ;
  wire \CONFIG_REG_WITH_AN.AN_ENABLE_REG_reg_0 ;
  wire \CONFIG_REG_WITH_AN.DUPLEX_MODE_REG_reg ;
  wire \CONFIG_REG_WITH_AN.DUPLEX_MODE_REG_reg_0 ;
  wire \CONFIG_REG_WITH_AN.ISOLATE_REG_reg ;
  wire \CONFIG_REG_WITH_AN.ISOLATE_REG_reg_0 ;
  wire \CONFIG_REG_WITH_AN.LOOPBACK_REG_reg ;
  wire \CONFIG_REG_WITH_AN.LOOPBACK_REG_reg_0 ;
  wire \CONFIG_REG_WITH_AN.POWERDOWN_REG_i_2_n_0 ;
  wire \CONFIG_REG_WITH_AN.POWERDOWN_REG_reg ;
  wire \CONFIG_REG_WITH_AN.POWERDOWN_REG_reg_0 ;
  wire \CONFIG_REG_WITH_AN.RESTART_AN_REG_reg ;
  wire \CONFIG_REG_WITH_AN.RESTART_AN_REG_reg_0 ;
  wire \CONFIG_REG_WITH_AN.UNIDIRECTIONAL_ENABLE_REG_reg ;
  wire [14:0]DATA_OUT;
  wire \FSM_onehot_STATE[10]_i_1_n_0 ;
  wire \FSM_onehot_STATE[1]_i_1_n_0 ;
  wire \FSM_onehot_STATE[2]_i_1_n_0 ;
  wire \FSM_onehot_STATE[3]_i_1__0_n_0 ;
  wire \FSM_onehot_STATE[4]_i_1__0_n_0 ;
  wire \FSM_onehot_STATE[6]_i_1__0_n_0 ;
  wire \FSM_onehot_STATE[8]_i_1_n_0 ;
  wire \FSM_onehot_STATE[9]_i_1_n_0 ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_STATE_reg_n_0_[0] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_STATE_reg_n_0_[10] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_STATE_reg_n_0_[3] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_STATE_reg_n_0_[4] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_STATE_reg_n_0_[5] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_STATE_reg_n_0_[6] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_STATE_reg_n_0_[7] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_STATE_reg_n_0_[8] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_STATE_reg_n_0_[9] ;
  wire \GEN_INTERRUPT_LOGIC.AN_INTERRUPT_ENABLE_reg ;
  wire \GEN_INTERRUPT_LOGIC.AN_INTERRUPT_INT_i_2_n_0 ;
  wire \GEN_INTERRUPT_LOGIC.AN_INTERRUPT_INT_i_3_n_0 ;
  wire \GEN_INTERRUPT_LOGIC.AN_INTERRUPT_INT_reg ;
  wire LAST_DATA_SHIFT;
  wire LAST_DATA_SHIFT0;
  wire LOOPBACK_REG;
  wire MDC_RISING_OUT;
  wire MDC_RISING_REG1;
  wire MDC_RISING_REG1_0;
  wire MDC_RISING_REG2;
  wire MDIO_IN;
  wire MDIO_OUT_i_1_n_0;
  wire MDIO_OUT_i_2_n_0;
  wire MDIO_OUT_i_3_n_0;
  wire MDIO_OUT_i_4_n_0;
  wire MDIO_TRI_i_1_n_0;
  wire MR_AN_COMPLETE;
  wire MR_LINK_STATUS;
  wire [3:0]\MR_LP_ADV_ABILITY_INT_reg[16] ;
  wire OPCODE;
  wire \OPCODE_reg_n_0_[0] ;
  wire \OPCODE_reg_n_0_[1] ;
  wire [0:0]Q;
  wire RD;
  wire RD_i_1_n_0;
  wire RD_i_2_n_0;
  wire RESTART_AN_EN;
  wire RESTART_AN_REG;
  wire SHIFT_REG0;
  wire \SHIFT_REG[0]_i_1_n_0 ;
  wire \SHIFT_REG[0]_i_2_n_0 ;
  wire \SHIFT_REG[10]_i_1_n_0 ;
  wire \SHIFT_REG[10]_i_2_n_0 ;
  wire \SHIFT_REG[11]_i_1_n_0 ;
  wire \SHIFT_REG[11]_i_2_n_0 ;
  wire \SHIFT_REG[12]_i_1_n_0 ;
  wire \SHIFT_REG[13]_i_1_n_0 ;
  wire \SHIFT_REG[14]_i_1_n_0 ;
  wire \SHIFT_REG[14]_i_2_n_0 ;
  wire \SHIFT_REG[15]_i_2_n_0 ;
  wire \SHIFT_REG[15]_i_3_n_0 ;
  wire \SHIFT_REG[15]_i_4_n_0 ;
  wire \SHIFT_REG[1]_i_1_n_0 ;
  wire \SHIFT_REG[1]_i_2_n_0 ;
  wire \SHIFT_REG[2]_i_1_n_0 ;
  wire \SHIFT_REG[2]_i_2_n_0 ;
  wire \SHIFT_REG[3]_i_1_n_0 ;
  wire \SHIFT_REG[4]_i_1_n_0 ;
  wire \SHIFT_REG[4]_i_2_n_0 ;
  wire \SHIFT_REG[5]_i_1_n_0 ;
  wire \SHIFT_REG[5]_i_2_n_0 ;
  wire \SHIFT_REG[5]_i_3_n_0 ;
  wire \SHIFT_REG[6]_i_1_n_0 ;
  wire \SHIFT_REG[7]_i_1_n_0 ;
  wire \SHIFT_REG[8]_i_1_n_0 ;
  wire \SHIFT_REG[8]_i_2_n_0 ;
  wire \SHIFT_REG[9]_i_1_n_0 ;
  wire SOFT_RESET;
  wire TOGGLE_RX;
  wire WE;
  wire WE_i_1_n_0;
  wire an_interrupt;
  wire [4:0]configuration_vector;
  wire mdio_out;
  wire mdio_tri;
  wire out;
  wire [3:0]p_0_in;
  (* RTL_KEEP = "yes" *) wire p_0_in11_in;
  wire [13:4]p_1_in;
  wire [0:0]p_5_in;
  wire [0:0]p_9_in;
  wire [4:0]phyad;
  wire [0:0]status_vector;
  wire userclk2;

  LUT4 #(
    .INIT(16'hBF80)) 
    ADDRESS_MATCH_i_1
       (.I0(ADDRESS_MATCH_COMB),
        .I1(MDC_RISING_REG1),
        .I2(ADDRESS_MATCH),
        .I3(ADDRESS_MATCH_reg_n_0),
        .O(ADDRESS_MATCH_i_1_n_0));
  LUT6 #(
    .INIT(64'h55555555D75555D7)) 
    ADDRESS_MATCH_i_2
       (.I0(\SHIFT_REG[15]_i_4_n_0 ),
        .I1(DATA_OUT[2]),
        .I2(phyad[3]),
        .I3(phyad[4]),
        .I4(DATA_OUT[3]),
        .I5(ADDRESS_MATCH_i_3_n_0),
        .O(ADDRESS_MATCH_COMB));
  LUT6 #(
    .INIT(64'h6FF6FFFFFFFF6FF6)) 
    ADDRESS_MATCH_i_3
       (.I0(phyad[0]),
        .I1(ADDR_RD),
        .I2(DATA_OUT[0]),
        .I3(phyad[1]),
        .I4(DATA_OUT[1]),
        .I5(phyad[2]),
        .O(ADDRESS_MATCH_i_3_n_0));
  FDRE #(
    .INIT(1'b0)) 
    ADDRESS_MATCH_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(ADDRESS_MATCH_i_1_n_0),
        .Q(ADDRESS_MATCH_reg_n_0),
        .R(out));
  LUT6 #(
    .INIT(64'h0000000200000000)) 
    \ADDR_WR[4]_i_1 
       (.I0(MDC_RISING_REG1),
        .I1(BIT_COUNT_reg__0[3]),
        .I2(BIT_COUNT_reg__0[0]),
        .I3(BIT_COUNT_reg__0[1]),
        .I4(BIT_COUNT_reg__0[2]),
        .I5(p_0_in11_in),
        .O(\ADDR_WR[4]_i_1_n_0 ));
  FDRE \ADDR_WR_reg[0] 
       (.C(userclk2),
        .CE(\ADDR_WR[4]_i_1_n_0 ),
        .D(ADDR_RD),
        .Q(ADDR_WR[0]),
        .R(out));
  FDRE \ADDR_WR_reg[1] 
       (.C(userclk2),
        .CE(\ADDR_WR[4]_i_1_n_0 ),
        .D(DATA_OUT[0]),
        .Q(ADDR_WR[1]),
        .R(out));
  FDRE \ADDR_WR_reg[2] 
       (.C(userclk2),
        .CE(\ADDR_WR[4]_i_1_n_0 ),
        .D(DATA_OUT[1]),
        .Q(ADDR_WR[2]),
        .R(out));
  FDRE \ADDR_WR_reg[3] 
       (.C(userclk2),
        .CE(\ADDR_WR[4]_i_1_n_0 ),
        .D(DATA_OUT[2]),
        .Q(ADDR_WR[3]),
        .R(out));
  FDRE \ADDR_WR_reg[4] 
       (.C(userclk2),
        .CE(\ADDR_WR[4]_i_1_n_0 ),
        .D(DATA_OUT[3]),
        .Q(ADDR_WR[4]),
        .R(out));
  LUT5 #(
    .INIT(32'hFFFF0045)) 
    \BIT_COUNT[0]_i_1 
       (.I0(BIT_COUNT_reg__0[0]),
        .I1(MDIO_OUT_i_2_n_0),
        .I2(ADDRESS_MATCH),
        .I3(\FSM_onehot_STATE_reg_n_0_[0] ),
        .I4(\FSM_onehot_STATE_reg_n_0_[7] ),
        .O(p_0_in[0]));
  LUT6 #(
    .INIT(64'h1101000000001101)) 
    \BIT_COUNT[1]_i_1 
       (.I0(\FSM_onehot_STATE_reg_n_0_[7] ),
        .I1(\FSM_onehot_STATE_reg_n_0_[0] ),
        .I2(ADDRESS_MATCH),
        .I3(MDIO_OUT_i_2_n_0),
        .I4(BIT_COUNT_reg__0[1]),
        .I5(BIT_COUNT_reg__0[0]),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT4 #(
    .INIT(16'hFD57)) 
    \BIT_COUNT[2]_i_1 
       (.I0(\BIT_COUNT[3]_i_3_n_0 ),
        .I1(BIT_COUNT_reg__0[0]),
        .I2(BIT_COUNT_reg__0[1]),
        .I3(BIT_COUNT_reg__0[2]),
        .O(p_0_in[2]));
  LUT5 #(
    .INIT(32'hAAAAAAA8)) 
    \BIT_COUNT[3]_i_1 
       (.I0(MDC_RISING_REG1),
        .I1(MDIO_OUT_i_2_n_0),
        .I2(ADDRESS_MATCH),
        .I3(\FSM_onehot_STATE_reg_n_0_[0] ),
        .I4(\FSM_onehot_STATE_reg_n_0_[7] ),
        .O(BIT_COUNT));
  LUT6 #(
    .INIT(64'hEEEEEEEBAAAAAAAA)) 
    \BIT_COUNT[3]_i_2 
       (.I0(\FSM_onehot_STATE_reg_n_0_[7] ),
        .I1(BIT_COUNT_reg__0[3]),
        .I2(BIT_COUNT_reg__0[0]),
        .I3(BIT_COUNT_reg__0[1]),
        .I4(BIT_COUNT_reg__0[2]),
        .I5(\BIT_COUNT[3]_i_3_n_0 ),
        .O(p_0_in[3]));
  LUT4 #(
    .INIT(16'h000B)) 
    \BIT_COUNT[3]_i_3 
       (.I0(MDIO_OUT_i_2_n_0),
        .I1(ADDRESS_MATCH),
        .I2(\FSM_onehot_STATE_reg_n_0_[0] ),
        .I3(\FSM_onehot_STATE_reg_n_0_[7] ),
        .O(\BIT_COUNT[3]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \BIT_COUNT_reg[0] 
       (.C(userclk2),
        .CE(BIT_COUNT),
        .D(p_0_in[0]),
        .Q(BIT_COUNT_reg__0[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \BIT_COUNT_reg[1] 
       (.C(userclk2),
        .CE(BIT_COUNT),
        .D(p_0_in[1]),
        .Q(BIT_COUNT_reg__0[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \BIT_COUNT_reg[2] 
       (.C(userclk2),
        .CE(BIT_COUNT),
        .D(p_0_in[2]),
        .Q(BIT_COUNT_reg__0[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \BIT_COUNT_reg[3] 
       (.C(userclk2),
        .CE(BIT_COUNT),
        .D(p_0_in[3]),
        .Q(BIT_COUNT_reg__0[3]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0000000000001000)) 
    CLEAR_STATUS_REG_i_1
       (.I0(ADDR_WR[3]),
        .I1(ADDR_WR[4]),
        .I2(RD),
        .I3(ADDR_WR[0]),
        .I4(ADDR_WR[2]),
        .I5(ADDR_WR[1]),
        .O(CLEAR_STATUS_REG_COMB));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \CONFIG_REG_WITH_AN.AN_ENABLE_REG_i_1 
       (.I0(configuration_vector[4]),
        .I1(\CONFIG_REG_WITH_AN.RESTART_AN_REG_reg ),
        .I2(DATA_OUT[12]),
        .O(\CONFIG_REG_WITH_AN.AN_ENABLE_REG_reg ));
  LUT6 #(
    .INIT(64'h3232323332320200)) 
    \CONFIG_REG_WITH_AN.DUPLEX_MODE_REG_i_1 
       (.I0(DATA_OUT[8]),
        .I1(out),
        .I2(\CONFIG_REG_WITH_AN.RESTART_AN_REG_reg ),
        .I3(MDC_RISING_OUT),
        .I4(CONFIGURATION_VALID_EN),
        .I5(\CONFIG_REG_WITH_AN.DUPLEX_MODE_REG_reg_0 ),
        .O(\CONFIG_REG_WITH_AN.DUPLEX_MODE_REG_reg ));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT3 #(
    .INIT(8'hAE)) 
    \CONFIG_REG_WITH_AN.ISOLATE_REG_i_1 
       (.I0(CONFIGURATION_VALID_EN),
        .I1(MDC_RISING_OUT),
        .I2(\CONFIG_REG_WITH_AN.RESTART_AN_REG_reg ),
        .O(LOOPBACK_REG));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \CONFIG_REG_WITH_AN.ISOLATE_REG_i_2 
       (.I0(configuration_vector[3]),
        .I1(\CONFIG_REG_WITH_AN.RESTART_AN_REG_reg ),
        .I2(DATA_OUT[10]),
        .O(\CONFIG_REG_WITH_AN.ISOLATE_REG_reg ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFD)) 
    \CONFIG_REG_WITH_AN.ISOLATE_REG_i_3 
       (.I0(WE),
        .I1(ADDR_WR[0]),
        .I2(ADDR_WR[1]),
        .I3(ADDR_WR[2]),
        .I4(ADDR_WR[3]),
        .I5(ADDR_WR[4]),
        .O(\CONFIG_REG_WITH_AN.RESTART_AN_REG_reg ));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \CONFIG_REG_WITH_AN.LOOPBACK_REG_i_1 
       (.I0(configuration_vector[1]),
        .I1(\CONFIG_REG_WITH_AN.RESTART_AN_REG_reg ),
        .I2(DATA_OUT[14]),
        .O(\CONFIG_REG_WITH_AN.LOOPBACK_REG_reg ));
  LUT6 #(
    .INIT(64'h00000000CFAAC000)) 
    \CONFIG_REG_WITH_AN.POWERDOWN_REG_i_1 
       (.I0(\CONFIG_REG_WITH_AN.POWERDOWN_REG_i_2_n_0 ),
        .I1(configuration_vector[2]),
        .I2(CONFIGURATION_VALID_EN),
        .I3(\CONFIG_REG_WITH_AN.RESTART_AN_REG_reg ),
        .I4(\CONFIG_REG_WITH_AN.POWERDOWN_REG_reg_0 ),
        .I5(out),
        .O(\CONFIG_REG_WITH_AN.POWERDOWN_REG_reg ));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT3 #(
    .INIT(8'h57)) 
    \CONFIG_REG_WITH_AN.POWERDOWN_REG_i_2 
       (.I0(DATA_OUT[11]),
        .I1(MDC_RISING_OUT),
        .I2(CONFIGURATION_VALID_EN),
        .O(\CONFIG_REG_WITH_AN.POWERDOWN_REG_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFF4FFF40)) 
    \CONFIG_REG_WITH_AN.RESTART_AN_REG_i_1 
       (.I0(\CONFIG_REG_WITH_AN.RESTART_AN_REG_reg ),
        .I1(DATA_OUT[9]),
        .I2(MDC_RISING_OUT),
        .I3(RESTART_AN_EN),
        .I4(RESTART_AN_REG),
        .O(\CONFIG_REG_WITH_AN.RESTART_AN_REG_reg_0 ));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \CONFIG_REG_WITH_AN.UNIDIRECTIONAL_ENABLE_REG_i_1 
       (.I0(configuration_vector[0]),
        .I1(\CONFIG_REG_WITH_AN.RESTART_AN_REG_reg ),
        .I2(DATA_OUT[5]),
        .O(\CONFIG_REG_WITH_AN.UNIDIRECTIONAL_ENABLE_REG_reg ));
  LUT5 #(
    .INIT(32'h00000002)) 
    \FSM_onehot_STATE[10]_i_1 
       (.I0(p_0_in11_in),
        .I1(BIT_COUNT_reg__0[2]),
        .I2(BIT_COUNT_reg__0[1]),
        .I3(BIT_COUNT_reg__0[0]),
        .I4(BIT_COUNT_reg__0[3]),
        .O(\FSM_onehot_STATE[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFEAAAAAAAA)) 
    \FSM_onehot_STATE[1]_i_1 
       (.I0(\FSM_onehot_STATE_reg_n_0_[0] ),
        .I1(BIT_COUNT_reg__0[3]),
        .I2(BIT_COUNT_reg__0[0]),
        .I3(BIT_COUNT_reg__0[1]),
        .I4(BIT_COUNT_reg__0[2]),
        .I5(ADDRESS_MATCH),
        .O(\FSM_onehot_STATE[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCCCCCCCCCCCCCCCA)) 
    \FSM_onehot_STATE[2]_i_1 
       (.I0(ADDRESS_MATCH),
        .I1(p_0_in11_in),
        .I2(BIT_COUNT_reg__0[3]),
        .I3(BIT_COUNT_reg__0[0]),
        .I4(BIT_COUNT_reg__0[1]),
        .I5(BIT_COUNT_reg__0[2]),
        .O(\FSM_onehot_STATE[2]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \FSM_onehot_STATE[3]_i_1__0 
       (.I0(ADDR_RD),
        .I1(\FSM_onehot_STATE_reg_n_0_[6] ),
        .O(\FSM_onehot_STATE[3]_i_1__0_n_0 ));
  LUT3 #(
    .INIT(8'hEA)) 
    \FSM_onehot_STATE[4]_i_1__0 
       (.I0(\FSM_onehot_STATE_reg_n_0_[5] ),
        .I1(\FSM_onehot_STATE_reg_n_0_[4] ),
        .I2(ADDR_RD),
        .O(\FSM_onehot_STATE[4]_i_1__0_n_0 ));
  LUT3 #(
    .INIT(8'h54)) 
    \FSM_onehot_STATE[6]_i_1__0 
       (.I0(ADDR_RD),
        .I1(\FSM_onehot_STATE_reg_n_0_[4] ),
        .I2(\FSM_onehot_STATE_reg_n_0_[6] ),
        .O(\FSM_onehot_STATE[6]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFEAAAAAAAA)) 
    \FSM_onehot_STATE[8]_i_1 
       (.I0(\FSM_onehot_STATE_reg_n_0_[7] ),
        .I1(BIT_COUNT_reg__0[3]),
        .I2(BIT_COUNT_reg__0[0]),
        .I3(BIT_COUNT_reg__0[1]),
        .I4(BIT_COUNT_reg__0[2]),
        .I5(\FSM_onehot_STATE_reg_n_0_[8] ),
        .O(\FSM_onehot_STATE[8]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000002)) 
    \FSM_onehot_STATE[9]_i_1 
       (.I0(\FSM_onehot_STATE_reg_n_0_[8] ),
        .I1(BIT_COUNT_reg__0[2]),
        .I2(BIT_COUNT_reg__0[1]),
        .I3(BIT_COUNT_reg__0[0]),
        .I4(BIT_COUNT_reg__0[3]),
        .O(\FSM_onehot_STATE[9]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "opcode_2:00000000001,ld_phyad:00000000010,opcode_1:00000001000,data_3:00000100000,wait_for_start:00001000000,idle_or_preamble:00000010000,ta_2:00010000000,data_2:01000000000,ta_1:10000000000,data_1:00100000000,ld_regad:00000000100" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_STATE_reg[0] 
       (.C(userclk2),
        .CE(MDC_RISING_REG1),
        .D(\FSM_onehot_STATE_reg_n_0_[3] ),
        .Q(\FSM_onehot_STATE_reg_n_0_[0] ),
        .R(out));
  (* FSM_ENCODED_STATES = "opcode_2:00000000001,ld_phyad:00000000010,opcode_1:00000001000,data_3:00000100000,wait_for_start:00001000000,idle_or_preamble:00000010000,ta_2:00010000000,data_2:01000000000,ta_1:10000000000,data_1:00100000000,ld_regad:00000000100" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_STATE_reg[10] 
       (.C(userclk2),
        .CE(MDC_RISING_REG1),
        .D(\FSM_onehot_STATE[10]_i_1_n_0 ),
        .Q(\FSM_onehot_STATE_reg_n_0_[10] ),
        .R(out));
  (* FSM_ENCODED_STATES = "opcode_2:00000000001,ld_phyad:00000000010,opcode_1:00000001000,data_3:00000100000,wait_for_start:00001000000,idle_or_preamble:00000010000,ta_2:00010000000,data_2:01000000000,ta_1:10000000000,data_1:00100000000,ld_regad:00000000100" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_STATE_reg[1] 
       (.C(userclk2),
        .CE(MDC_RISING_REG1),
        .D(\FSM_onehot_STATE[1]_i_1_n_0 ),
        .Q(ADDRESS_MATCH),
        .R(out));
  (* FSM_ENCODED_STATES = "opcode_2:00000000001,ld_phyad:00000000010,opcode_1:00000001000,data_3:00000100000,wait_for_start:00001000000,idle_or_preamble:00000010000,ta_2:00010000000,data_2:01000000000,ta_1:10000000000,data_1:00100000000,ld_regad:00000000100" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_STATE_reg[2] 
       (.C(userclk2),
        .CE(MDC_RISING_REG1),
        .D(\FSM_onehot_STATE[2]_i_1_n_0 ),
        .Q(p_0_in11_in),
        .R(out));
  (* FSM_ENCODED_STATES = "opcode_2:00000000001,ld_phyad:00000000010,opcode_1:00000001000,data_3:00000100000,wait_for_start:00001000000,idle_or_preamble:00000010000,ta_2:00010000000,data_2:01000000000,ta_1:10000000000,data_1:00100000000,ld_regad:00000000100" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_STATE_reg[3] 
       (.C(userclk2),
        .CE(MDC_RISING_REG1),
        .D(\FSM_onehot_STATE[3]_i_1__0_n_0 ),
        .Q(\FSM_onehot_STATE_reg_n_0_[3] ),
        .R(out));
  (* FSM_ENCODED_STATES = "opcode_2:00000000001,ld_phyad:00000000010,opcode_1:00000001000,data_3:00000100000,wait_for_start:00001000000,idle_or_preamble:00000010000,ta_2:00010000000,data_2:01000000000,ta_1:10000000000,data_1:00100000000,ld_regad:00000000100" *) 
  (* KEEP = "yes" *) 
  FDSE #(
    .INIT(1'b1)) 
    \FSM_onehot_STATE_reg[4] 
       (.C(userclk2),
        .CE(MDC_RISING_REG1),
        .D(\FSM_onehot_STATE[4]_i_1__0_n_0 ),
        .Q(\FSM_onehot_STATE_reg_n_0_[4] ),
        .S(out));
  (* FSM_ENCODED_STATES = "opcode_2:00000000001,ld_phyad:00000000010,opcode_1:00000001000,data_3:00000100000,wait_for_start:00001000000,idle_or_preamble:00000010000,ta_2:00010000000,data_2:01000000000,ta_1:10000000000,data_1:00100000000,ld_regad:00000000100" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_STATE_reg[5] 
       (.C(userclk2),
        .CE(MDC_RISING_REG1),
        .D(\FSM_onehot_STATE_reg_n_0_[9] ),
        .Q(\FSM_onehot_STATE_reg_n_0_[5] ),
        .R(out));
  (* FSM_ENCODED_STATES = "opcode_2:00000000001,ld_phyad:00000000010,opcode_1:00000001000,data_3:00000100000,wait_for_start:00001000000,idle_or_preamble:00000010000,ta_2:00010000000,data_2:01000000000,ta_1:10000000000,data_1:00100000000,ld_regad:00000000100" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_STATE_reg[6] 
       (.C(userclk2),
        .CE(MDC_RISING_REG1),
        .D(\FSM_onehot_STATE[6]_i_1__0_n_0 ),
        .Q(\FSM_onehot_STATE_reg_n_0_[6] ),
        .R(out));
  (* FSM_ENCODED_STATES = "opcode_2:00000000001,ld_phyad:00000000010,opcode_1:00000001000,data_3:00000100000,wait_for_start:00001000000,idle_or_preamble:00000010000,ta_2:00010000000,data_2:01000000000,ta_1:10000000000,data_1:00100000000,ld_regad:00000000100" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_STATE_reg[7] 
       (.C(userclk2),
        .CE(MDC_RISING_REG1),
        .D(\FSM_onehot_STATE_reg_n_0_[10] ),
        .Q(\FSM_onehot_STATE_reg_n_0_[7] ),
        .R(out));
  (* FSM_ENCODED_STATES = "opcode_2:00000000001,ld_phyad:00000000010,opcode_1:00000001000,data_3:00000100000,wait_for_start:00001000000,idle_or_preamble:00000010000,ta_2:00010000000,data_2:01000000000,ta_1:10000000000,data_1:00100000000,ld_regad:00000000100" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_STATE_reg[8] 
       (.C(userclk2),
        .CE(MDC_RISING_REG1),
        .D(\FSM_onehot_STATE[8]_i_1_n_0 ),
        .Q(\FSM_onehot_STATE_reg_n_0_[8] ),
        .R(out));
  (* FSM_ENCODED_STATES = "opcode_2:00000000001,ld_phyad:00000000010,opcode_1:00000001000,data_3:00000100000,wait_for_start:00001000000,idle_or_preamble:00000010000,ta_2:00010000000,data_2:01000000000,ta_1:10000000000,data_1:00100000000,ld_regad:00000000100" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_STATE_reg[9] 
       (.C(userclk2),
        .CE(MDC_RISING_REG1),
        .D(\FSM_onehot_STATE[9]_i_1_n_0 ),
        .Q(\FSM_onehot_STATE_reg_n_0_[9] ),
        .R(out));
  LUT3 #(
    .INIT(8'hB8)) 
    \GEN_INTERRUPT_LOGIC.AN_INTERRUPT_ENABLE_i_1 
       (.I0(p_5_in),
        .I1(\GEN_INTERRUPT_LOGIC.AN_INTERRUPT_INT_i_2_n_0 ),
        .I2(DATA_OUT[0]),
        .O(\GEN_INTERRUPT_LOGIC.AN_INTERRUPT_ENABLE_reg ));
  LUT6 #(
    .INIT(64'hE0E0F0E00000F000)) 
    \GEN_INTERRUPT_LOGIC.AN_INTERRUPT_INT_i_1 
       (.I0(\GEN_INTERRUPT_LOGIC.AN_INTERRUPT_INT_i_2_n_0 ),
        .I1(DATA_OUT[1]),
        .I2(p_5_in),
        .I3(MR_AN_COMPLETE),
        .I4(AN_COMPLETE_REG1),
        .I5(an_interrupt),
        .O(\GEN_INTERRUPT_LOGIC.AN_INTERRUPT_INT_reg ));
  LUT5 #(
    .INIT(32'hFFDFFFFF)) 
    \GEN_INTERRUPT_LOGIC.AN_INTERRUPT_INT_i_2 
       (.I0(WE),
        .I1(\GEN_INTERRUPT_LOGIC.AN_INTERRUPT_INT_i_3_n_0 ),
        .I2(ADDR_WR[4]),
        .I3(ADDR_WR[3]),
        .I4(MDC_RISING_OUT),
        .O(\GEN_INTERRUPT_LOGIC.AN_INTERRUPT_INT_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hFE)) 
    \GEN_INTERRUPT_LOGIC.AN_INTERRUPT_INT_i_3 
       (.I0(ADDR_WR[0]),
        .I1(ADDR_WR[1]),
        .I2(ADDR_WR[2]),
        .O(\GEN_INTERRUPT_LOGIC.AN_INTERRUPT_INT_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    LAST_DATA_SHIFT_i_1
       (.I0(\FSM_onehot_STATE_reg_n_0_[5] ),
        .I1(MDC_RISING_REG1_0),
        .O(LAST_DATA_SHIFT0));
  FDRE #(
    .INIT(1'b0)) 
    LAST_DATA_SHIFT_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(LAST_DATA_SHIFT0),
        .Q(LAST_DATA_SHIFT),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    MDC_RISING_REG1_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(MDC_RISING_REG1),
        .Q(MDC_RISING_REG1_0),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    MDC_RISING_REG2_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(MDC_RISING_REG1_0),
        .Q(MDC_RISING_REG2),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    MDC_RISING_REG3_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(MDC_RISING_REG2),
        .Q(MDC_RISING_OUT),
        .R(out));
  FDSE #(
    .INIT(1'b0)) 
    MDIO_IN_REG_reg
       (.C(userclk2),
        .CE(MDC_RISING_REG1),
        .D(MDIO_IN),
        .Q(ADDR_RD),
        .S(out));
  LUT5 #(
    .INIT(32'hEEFEFFFC)) 
    MDIO_OUT_i_1
       (.I0(MDIO_OUT_i_2_n_0),
        .I1(MDIO_OUT_i_3_n_0),
        .I2(Q),
        .I3(MDIO_OUT_i_4_n_0),
        .I4(p_0_in11_in),
        .O(MDIO_OUT_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    MDIO_OUT_i_2
       (.I0(BIT_COUNT_reg__0[3]),
        .I1(BIT_COUNT_reg__0[0]),
        .I2(BIT_COUNT_reg__0[1]),
        .I3(BIT_COUNT_reg__0[2]),
        .O(MDIO_OUT_i_2_n_0));
  LUT3 #(
    .INIT(8'hBF)) 
    MDIO_OUT_i_3
       (.I0(\OPCODE_reg_n_0_[0] ),
        .I1(\OPCODE_reg_n_0_[1] ),
        .I2(ADDRESS_MATCH_reg_n_0),
        .O(MDIO_OUT_i_3_n_0));
  LUT3 #(
    .INIT(8'h01)) 
    MDIO_OUT_i_4
       (.I0(\FSM_onehot_STATE_reg_n_0_[10] ),
        .I1(\FSM_onehot_STATE_reg_n_0_[8] ),
        .I2(\FSM_onehot_STATE_reg_n_0_[7] ),
        .O(MDIO_OUT_i_4_n_0));
  FDSE MDIO_OUT_reg
       (.C(userclk2),
        .CE(MDC_RISING_REG1),
        .D(MDIO_OUT_i_1_n_0),
        .Q(mdio_out),
        .S(out));
  LUT6 #(
    .INIT(64'hFFFFFFFFAAAA0003)) 
    MDIO_TRI_i_1
       (.I0(MDIO_OUT_i_2_n_0),
        .I1(\FSM_onehot_STATE_reg_n_0_[7] ),
        .I2(\FSM_onehot_STATE_reg_n_0_[8] ),
        .I3(\FSM_onehot_STATE_reg_n_0_[10] ),
        .I4(p_0_in11_in),
        .I5(MDIO_OUT_i_3_n_0),
        .O(MDIO_TRI_i_1_n_0));
  FDSE MDIO_TRI_reg
       (.C(userclk2),
        .CE(MDC_RISING_REG1),
        .D(MDIO_TRI_i_1_n_0),
        .Q(mdio_tri),
        .S(out));
  LUT6 #(
    .INIT(64'h0000000000002000)) 
    \OPCODE[1]_i_1 
       (.I0(BIT_COUNT_reg__0[2]),
        .I1(BIT_COUNT_reg__0[3]),
        .I2(MDC_RISING_REG1),
        .I3(ADDRESS_MATCH),
        .I4(BIT_COUNT_reg__0[1]),
        .I5(BIT_COUNT_reg__0[0]),
        .O(OPCODE));
  FDRE #(
    .INIT(1'b0)) 
    \OPCODE_reg[0] 
       (.C(userclk2),
        .CE(OPCODE),
        .D(DATA_OUT[0]),
        .Q(\OPCODE_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \OPCODE_reg[1] 
       (.C(userclk2),
        .CE(OPCODE),
        .D(DATA_OUT[1]),
        .Q(\OPCODE_reg_n_0_[1] ),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0000000004FF0400)) 
    RD_i_1
       (.I0(RD_i_2_n_0),
        .I1(\FSM_onehot_STATE_reg_n_0_[5] ),
        .I2(MDIO_OUT_i_3_n_0),
        .I3(MDC_RISING_REG2),
        .I4(RD),
        .I5(out),
        .O(RD_i_1_n_0));
  LUT4 #(
    .INIT(16'h0080)) 
    RD_i_2
       (.I0(ADDRESS_MATCH_reg_n_0),
        .I1(\FSM_onehot_STATE_reg_n_0_[5] ),
        .I2(\OPCODE_reg_n_0_[0] ),
        .I3(\OPCODE_reg_n_0_[1] ),
        .O(RD_i_2_n_0));
  FDRE RD_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(RD_i_1_n_0),
        .Q(RD),
        .R(1'b0));
  LUT3 #(
    .INIT(8'hB8)) 
    \SHIFT_REG[0]_i_1 
       (.I0(\SHIFT_REG[0]_i_2_n_0 ),
        .I1(\FSM_onehot_STATE[10]_i_1_n_0 ),
        .I2(ADDR_RD),
        .O(\SHIFT_REG[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00000033003E0000)) 
    \SHIFT_REG[0]_i_2 
       (.I0(p_5_in),
        .I1(DATA_OUT[0]),
        .I2(ADDR_RD),
        .I3(DATA_OUT[2]),
        .I4(DATA_OUT[3]),
        .I5(DATA_OUT[1]),
        .O(\SHIFT_REG[0]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h01FF0100)) 
    \SHIFT_REG[10]_i_1 
       (.I0(DATA_OUT[2]),
        .I1(DATA_OUT[3]),
        .I2(\SHIFT_REG[10]_i_2_n_0 ),
        .I3(\FSM_onehot_STATE[10]_i_1_n_0 ),
        .I4(DATA_OUT[9]),
        .O(\SHIFT_REG[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFCCCF33FFDD)) 
    \SHIFT_REG[10]_i_2 
       (.I0(\CONFIG_REG_WITH_AN.ISOLATE_REG_reg_0 ),
        .I1(DATA_OUT[0]),
        .I2(\MR_LP_ADV_ABILITY_INT_reg[16] [0]),
        .I3(DATA_OUT[1]),
        .I4(ADDR_RD),
        .I5(DATA_OUT[2]),
        .O(\SHIFT_REG[10]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h01FF0100)) 
    \SHIFT_REG[11]_i_1 
       (.I0(DATA_OUT[2]),
        .I1(DATA_OUT[3]),
        .I2(\SHIFT_REG[11]_i_2_n_0 ),
        .I3(\FSM_onehot_STATE[10]_i_1_n_0 ),
        .I4(DATA_OUT[10]),
        .O(\SHIFT_REG[11]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFCFFFCF37CF37F)) 
    \SHIFT_REG[11]_i_2 
       (.I0(TOGGLE_RX),
        .I1(ADDR_RD),
        .I2(DATA_OUT[1]),
        .I3(DATA_OUT[0]),
        .I4(\CONFIG_REG_WITH_AN.POWERDOWN_REG_reg_0 ),
        .I5(DATA_OUT[2]),
        .O(\SHIFT_REG[11]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h4F44FFFF4F440000)) 
    \SHIFT_REG[12]_i_1 
       (.I0(\SHIFT_REG[14]_i_2_n_0 ),
        .I1(\MR_LP_ADV_ABILITY_INT_reg[16] [1]),
        .I2(\SHIFT_REG[15]_i_4_n_0 ),
        .I3(\CONFIG_REG_WITH_AN.AN_ENABLE_REG_reg_0 ),
        .I4(\FSM_onehot_STATE[10]_i_1_n_0 ),
        .I5(DATA_OUT[11]),
        .O(\SHIFT_REG[12]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAA8AAAAAAAA)) 
    \SHIFT_REG[13]_i_1 
       (.I0(DATA_OUT[12]),
        .I1(BIT_COUNT_reg__0[3]),
        .I2(BIT_COUNT_reg__0[0]),
        .I3(BIT_COUNT_reg__0[1]),
        .I4(BIT_COUNT_reg__0[2]),
        .I5(p_0_in11_in),
        .O(\SHIFT_REG[13]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h4F44FFFF4F440000)) 
    \SHIFT_REG[14]_i_1 
       (.I0(\SHIFT_REG[15]_i_4_n_0 ),
        .I1(\CONFIG_REG_WITH_AN.LOOPBACK_REG_reg_0 ),
        .I2(\SHIFT_REG[14]_i_2_n_0 ),
        .I3(\MR_LP_ADV_ABILITY_INT_reg[16] [2]),
        .I4(\FSM_onehot_STATE[10]_i_1_n_0 ),
        .I5(p_1_in[13]),
        .O(\SHIFT_REG[14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT5 #(
    .INIT(32'hFFFBFFFF)) 
    \SHIFT_REG[14]_i_2 
       (.I0(DATA_OUT[2]),
        .I1(ADDR_RD),
        .I2(DATA_OUT[0]),
        .I3(DATA_OUT[3]),
        .I4(DATA_OUT[1]),
        .O(\SHIFT_REG[14]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \SHIFT_REG[15]_i_1 
       (.I0(MDC_RISING_REG1),
        .I1(LAST_DATA_SHIFT),
        .O(SHIFT_REG0));
  LUT5 #(
    .INIT(32'hBAFFBA00)) 
    \SHIFT_REG[15]_i_2 
       (.I0(\SHIFT_REG[15]_i_3_n_0 ),
        .I1(\SHIFT_REG[15]_i_4_n_0 ),
        .I2(SOFT_RESET),
        .I3(\FSM_onehot_STATE[10]_i_1_n_0 ),
        .I4(DATA_OUT[14]),
        .O(\SHIFT_REG[15]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0C00000800000000)) 
    \SHIFT_REG[15]_i_3 
       (.I0(\MR_LP_ADV_ABILITY_INT_reg[16] [3]),
        .I1(DATA_OUT[1]),
        .I2(DATA_OUT[3]),
        .I3(DATA_OUT[2]),
        .I4(DATA_OUT[0]),
        .I5(ADDR_RD),
        .O(\SHIFT_REG[15]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \SHIFT_REG[15]_i_4 
       (.I0(DATA_OUT[0]),
        .I1(DATA_OUT[1]),
        .I2(ADDR_RD),
        .I3(DATA_OUT[2]),
        .I4(DATA_OUT[3]),
        .O(\SHIFT_REG[15]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000E000CCCCCCCC)) 
    \SHIFT_REG[1]_i_1 
       (.I0(an_interrupt),
        .I1(DATA_OUT[0]),
        .I2(\SHIFT_REG[1]_i_2_n_0 ),
        .I3(DATA_OUT[3]),
        .I4(DATA_OUT[1]),
        .I5(\FSM_onehot_STATE[10]_i_1_n_0 ),
        .O(\SHIFT_REG[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \SHIFT_REG[1]_i_2 
       (.I0(ADDR_RD),
        .I1(DATA_OUT[2]),
        .O(\SHIFT_REG[1]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \SHIFT_REG[2]_i_1 
       (.I0(\SHIFT_REG[2]_i_2_n_0 ),
        .I1(\FSM_onehot_STATE[10]_i_1_n_0 ),
        .I2(DATA_OUT[1]),
        .O(\SHIFT_REG[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000004140404)) 
    \SHIFT_REG[2]_i_2 
       (.I0(DATA_OUT[2]),
        .I1(DATA_OUT[0]),
        .I2(ADDR_RD),
        .I3(DATA_OUT[1]),
        .I4(MR_LINK_STATUS),
        .I5(DATA_OUT[3]),
        .O(\SHIFT_REG[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000FFFF00040000)) 
    \SHIFT_REG[3]_i_1 
       (.I0(DATA_OUT[0]),
        .I1(ADDR_RD),
        .I2(DATA_OUT[3]),
        .I3(DATA_OUT[1]),
        .I4(\FSM_onehot_STATE[10]_i_1_n_0 ),
        .I5(DATA_OUT[2]),
        .O(\SHIFT_REG[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \SHIFT_REG[4]_i_1 
       (.I0(\SHIFT_REG[4]_i_2_n_0 ),
        .I1(\FSM_onehot_STATE[10]_i_1_n_0 ),
        .I2(DATA_OUT[3]),
        .O(\SHIFT_REG[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0001010000000100)) 
    \SHIFT_REG[4]_i_2 
       (.I0(DATA_OUT[3]),
        .I1(DATA_OUT[1]),
        .I2(DATA_OUT[2]),
        .I3(DATA_OUT[0]),
        .I4(ADDR_RD),
        .I5(status_vector),
        .O(\SHIFT_REG[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h88FFF8FF8888F888)) 
    \SHIFT_REG[5]_i_1 
       (.I0(\SHIFT_REG[5]_i_2_n_0 ),
        .I1(MR_AN_COMPLETE),
        .I2(\SHIFT_REG[8]_i_2_n_0 ),
        .I3(\FSM_onehot_STATE[10]_i_1_n_0 ),
        .I4(\SHIFT_REG[5]_i_3_n_0 ),
        .I5(p_1_in[4]),
        .O(\SHIFT_REG[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000100000)) 
    \SHIFT_REG[5]_i_2 
       (.I0(DATA_OUT[1]),
        .I1(DATA_OUT[3]),
        .I2(\FSM_onehot_STATE[10]_i_1_n_0 ),
        .I3(DATA_OUT[2]),
        .I4(ADDR_RD),
        .I5(DATA_OUT[0]),
        .O(\SHIFT_REG[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT4 #(
    .INIT(16'hFFF1)) 
    \SHIFT_REG[5]_i_3 
       (.I0(p_9_in),
        .I1(DATA_OUT[0]),
        .I2(DATA_OUT[2]),
        .I3(ADDR_RD),
        .O(\SHIFT_REG[5]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h020AFFFF020A0000)) 
    \SHIFT_REG[6]_i_1 
       (.I0(\SHIFT_REG[8]_i_2_n_0 ),
        .I1(ADDR_RD),
        .I2(DATA_OUT[2]),
        .I3(DATA_OUT[0]),
        .I4(\FSM_onehot_STATE[10]_i_1_n_0 ),
        .I5(DATA_OUT[5]),
        .O(\SHIFT_REG[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0030AAAA0000AAAA)) 
    \SHIFT_REG[7]_i_1 
       (.I0(p_1_in[6]),
        .I1(DATA_OUT[0]),
        .I2(ADDR_RD),
        .I3(DATA_OUT[2]),
        .I4(\FSM_onehot_STATE[10]_i_1_n_0 ),
        .I5(\SHIFT_REG[8]_i_2_n_0 ),
        .O(\SHIFT_REG[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h020AFFFF020A0000)) 
    \SHIFT_REG[8]_i_1 
       (.I0(\SHIFT_REG[8]_i_2_n_0 ),
        .I1(ADDR_RD),
        .I2(DATA_OUT[2]),
        .I3(DATA_OUT[0]),
        .I4(\FSM_onehot_STATE[10]_i_1_n_0 ),
        .I5(p_1_in[7]),
        .O(\SHIFT_REG[8]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \SHIFT_REG[8]_i_2 
       (.I0(DATA_OUT[1]),
        .I1(DATA_OUT[3]),
        .O(\SHIFT_REG[8]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h2F20)) 
    \SHIFT_REG[9]_i_1 
       (.I0(RESTART_AN_REG),
        .I1(\SHIFT_REG[15]_i_4_n_0 ),
        .I2(\FSM_onehot_STATE[10]_i_1_n_0 ),
        .I3(DATA_OUT[8]),
        .O(\SHIFT_REG[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \SHIFT_REG_reg[0] 
       (.C(userclk2),
        .CE(SHIFT_REG0),
        .D(\SHIFT_REG[0]_i_1_n_0 ),
        .Q(DATA_OUT[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \SHIFT_REG_reg[10] 
       (.C(userclk2),
        .CE(SHIFT_REG0),
        .D(\SHIFT_REG[10]_i_1_n_0 ),
        .Q(DATA_OUT[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \SHIFT_REG_reg[11] 
       (.C(userclk2),
        .CE(SHIFT_REG0),
        .D(\SHIFT_REG[11]_i_1_n_0 ),
        .Q(DATA_OUT[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \SHIFT_REG_reg[12] 
       (.C(userclk2),
        .CE(SHIFT_REG0),
        .D(\SHIFT_REG[12]_i_1_n_0 ),
        .Q(DATA_OUT[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \SHIFT_REG_reg[13] 
       (.C(userclk2),
        .CE(SHIFT_REG0),
        .D(\SHIFT_REG[13]_i_1_n_0 ),
        .Q(p_1_in[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \SHIFT_REG_reg[14] 
       (.C(userclk2),
        .CE(SHIFT_REG0),
        .D(\SHIFT_REG[14]_i_1_n_0 ),
        .Q(DATA_OUT[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \SHIFT_REG_reg[15] 
       (.C(userclk2),
        .CE(SHIFT_REG0),
        .D(\SHIFT_REG[15]_i_2_n_0 ),
        .Q(Q),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \SHIFT_REG_reg[1] 
       (.C(userclk2),
        .CE(SHIFT_REG0),
        .D(\SHIFT_REG[1]_i_1_n_0 ),
        .Q(DATA_OUT[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \SHIFT_REG_reg[2] 
       (.C(userclk2),
        .CE(SHIFT_REG0),
        .D(\SHIFT_REG[2]_i_1_n_0 ),
        .Q(DATA_OUT[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \SHIFT_REG_reg[3] 
       (.C(userclk2),
        .CE(SHIFT_REG0),
        .D(\SHIFT_REG[3]_i_1_n_0 ),
        .Q(DATA_OUT[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \SHIFT_REG_reg[4] 
       (.C(userclk2),
        .CE(SHIFT_REG0),
        .D(\SHIFT_REG[4]_i_1_n_0 ),
        .Q(p_1_in[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \SHIFT_REG_reg[5] 
       (.C(userclk2),
        .CE(SHIFT_REG0),
        .D(\SHIFT_REG[5]_i_1_n_0 ),
        .Q(DATA_OUT[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \SHIFT_REG_reg[6] 
       (.C(userclk2),
        .CE(SHIFT_REG0),
        .D(\SHIFT_REG[6]_i_1_n_0 ),
        .Q(p_1_in[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \SHIFT_REG_reg[7] 
       (.C(userclk2),
        .CE(SHIFT_REG0),
        .D(\SHIFT_REG[7]_i_1_n_0 ),
        .Q(p_1_in[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \SHIFT_REG_reg[8] 
       (.C(userclk2),
        .CE(SHIFT_REG0),
        .D(\SHIFT_REG[8]_i_1_n_0 ),
        .Q(DATA_OUT[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \SHIFT_REG_reg[9] 
       (.C(userclk2),
        .CE(SHIFT_REG0),
        .D(\SHIFT_REG[9]_i_1_n_0 ),
        .Q(DATA_OUT[9]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0080FFFF00800000)) 
    WE_i_1
       (.I0(ADDRESS_MATCH_reg_n_0),
        .I1(\FSM_onehot_STATE_reg_n_0_[5] ),
        .I2(\OPCODE_reg_n_0_[0] ),
        .I3(\OPCODE_reg_n_0_[1] ),
        .I4(MDC_RISING_REG2),
        .I5(WE),
        .O(WE_i_1_n_0));
  FDRE WE_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(WE_i_1_n_0),
        .Q(WE),
        .R(out));
endmodule

(* ORIG_REF_NAME = "RX" *) 
module design_1_gig_ethernet_pcs_pma_0_0_RX
   (K28p5_REG1,
    RX_IDLE,
    S2,
    SOP_REG3,
    RX_DATA_ERROR,
    gmii_rx_er,
    RX_CONFIG_VALID,
    status_vector,
    RECEIVE,
    gmii_rx_dv,
    RX_INVALID,
    ABILITY_MATCH_reg,
    ABILITY_MATCH_reg_0,
    ABILITY_MATCH_reg_1,
    \RX_CONFIG_REG_REG_reg[15] ,
    \MR_LP_ADV_ABILITY_INT_reg[16] ,
    CONFIG_REG_MATCH_reg,
    BASEX_REMOTE_FAULT_RSLVD,
    ACKNOWLEDGE_MATCH_20,
    RX_ER_reg_0,
    RECEIVED_IDLE_reg,
    RX_CONFIG_REG_NULL_reg,
    gmii_rxd,
    Q,
    userclk2,
    SR,
    SYNC_STATUS_REG0,
    \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISK_INT_reg ,
    RX_ER0,
    \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCLKCORCNT_INT_reg[2] ,
    \RX_CONFIG_REG_reg[5]_0 ,
    RECEIVED_IDLE_reg_0,
    \MGT_RESET.SRESET_reg ,
    \CONFIG_REG_WITH_AN.AN_ENABLE_REG_reg ,
    RXEVEN0_out,
    RXNOTINTABLE_INT,
    \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXRUNDISP_INT_reg ,
    EVEN_reg,
    out,
    \RX_CONFIG_REG_REG_reg[15]_0 ,
    \RX_CONFIG_REG_REG_reg[7] ,
    \RX_CONFIG_REG_REG_reg[6] ,
    RXSYNC_STATUS,
    D,
    \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXBUFSTATUS_INT_reg[1] ,
    RX_DV0,
    XMIT_DATA,
    RECEIVED_IDLE,
    RX_CONFIG_REG_NULL_reg_0,
    \CONFIG_REG_WITH_AN.ISOLATE_REG_reg );
  output K28p5_REG1;
  output RX_IDLE;
  output S2;
  output SOP_REG3;
  output RX_DATA_ERROR;
  output gmii_rx_er;
  output RX_CONFIG_VALID;
  output [1:0]status_vector;
  output RECEIVE;
  output gmii_rx_dv;
  output RX_INVALID;
  output ABILITY_MATCH_reg;
  output ABILITY_MATCH_reg_0;
  output ABILITY_MATCH_reg_1;
  output [0:0]\RX_CONFIG_REG_REG_reg[15] ;
  output [15:0]\MR_LP_ADV_ABILITY_INT_reg[16] ;
  output CONFIG_REG_MATCH_reg;
  output [0:0]BASEX_REMOTE_FAULT_RSLVD;
  output ACKNOWLEDGE_MATCH_20;
  output RX_ER_reg_0;
  output RECEIVED_IDLE_reg;
  output RX_CONFIG_REG_NULL_reg;
  output [7:0]gmii_rxd;
  input [7:0]Q;
  input userclk2;
  input [0:0]SR;
  input SYNC_STATUS_REG0;
  input \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISK_INT_reg ;
  input RX_ER0;
  input [1:0]\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCLKCORCNT_INT_reg[2] ;
  input \RX_CONFIG_REG_reg[5]_0 ;
  input RECEIVED_IDLE_reg_0;
  input \MGT_RESET.SRESET_reg ;
  input \CONFIG_REG_WITH_AN.AN_ENABLE_REG_reg ;
  input RXEVEN0_out;
  input RXNOTINTABLE_INT;
  input \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXRUNDISP_INT_reg ;
  input EVEN_reg;
  input out;
  input [9:0]\RX_CONFIG_REG_REG_reg[15]_0 ;
  input \RX_CONFIG_REG_REG_reg[7] ;
  input \RX_CONFIG_REG_REG_reg[6] ;
  input RXSYNC_STATUS;
  input D;
  input \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXBUFSTATUS_INT_reg[1] ;
  input RX_DV0;
  input XMIT_DATA;
  input RECEIVED_IDLE;
  input RX_CONFIG_REG_NULL_reg_0;
  input [0:0]\CONFIG_REG_WITH_AN.ISOLATE_REG_reg ;

  wire ABILITY_MATCH_2_i_11_n_0;
  wire ABILITY_MATCH_2_i_9_n_0;
  wire ABILITY_MATCH_reg;
  wire ABILITY_MATCH_reg_0;
  wire ABILITY_MATCH_reg_1;
  wire ACKNOWLEDGE_MATCH_20;
  wire [0:0]BASEX_REMOTE_FAULT_RSLVD;
  wire C;
  wire C0;
  wire CGBAD;
  wire CGBAD_REG1;
  wire CGBAD_REG2;
  wire CGBAD_REG3;
  wire CONFIG_REG_MATCH_reg;
  wire \CONFIG_REG_WITH_AN.AN_ENABLE_REG_reg ;
  wire [0:0]\CONFIG_REG_WITH_AN.ISOLATE_REG_reg ;
  wire C_HDR_REMOVED;
  wire C_HDR_REMOVED_REG;
  wire C_REG1;
  wire C_REG2;
  wire C_REG3;
  wire D;
  wire D0p0;
  wire D0p0_REG;
  wire D0p0_REG_i_2_n_0;
  wire EOP;
  wire EOP0;
  wire EOP_REG1;
  wire EOP_REG10;
  wire EOP_i_2_n_0;
  wire EVEN_reg;
  wire EXTEND;
  wire EXTEND_ERR;
  wire EXTEND_ERR0;
  wire EXTEND_REG1;
  wire EXTEND_REG2;
  wire EXTEND_REG3;
  wire EXTEND_i_1_n_0;
  wire EXT_ILLEGAL_K;
  wire EXT_ILLEGAL_K0;
  wire EXT_ILLEGAL_K_REG1;
  wire EXT_ILLEGAL_K_REG2;
  wire FALSE_CARRIER;
  wire FALSE_CARRIER0;
  wire FALSE_CARRIER_REG1;
  wire FALSE_CARRIER_REG2;
  wire FALSE_CARRIER_REG3;
  wire FALSE_CARRIER_i_1_n_0;
  wire FALSE_CARRIER_i_3_n_0;
  wire FALSE_DATA;
  wire FALSE_DATA0;
  wire FALSE_DATA_i_2_n_0;
  wire FALSE_DATA_i_3_n_0;
  wire FALSE_K;
  wire FALSE_K0;
  wire FALSE_K_i_2_n_0;
  wire FALSE_NIT;
  wire FALSE_NIT0;
  wire FALSE_NIT_i_2_n_0;
  wire FALSE_NIT_i_3_n_0;
  wire FROM_IDLE_D;
  wire FROM_IDLE_D0;
  wire FROM_RX_CX;
  wire FROM_RX_CX0;
  wire FROM_RX_K;
  wire FROM_RX_K0;
  wire I;
  wire I0;
  wire \IDLE_REG_reg_n_0_[0] ;
  wire \IDLE_REG_reg_n_0_[2] ;
  wire ILLEGAL_K;
  wire ILLEGAL_K0;
  wire ILLEGAL_K_REG1;
  wire ILLEGAL_K_REG2;
  wire I_i_2_n_0;
  wire I_i_3_n_0;
  wire I_i_4_n_0;
  wire I_i_5_n_0;
  wire I_i_6_n_0;
  wire K23p7;
  wire K28p5_REG1;
  wire K28p5_REG1_i_1_n_0;
  wire K28p5_REG2;
  wire K29p7;
  wire \MGT_RESET.SRESET_reg ;
  wire [15:0]\MR_LP_ADV_ABILITY_INT_reg[16] ;
  wire [7:0]Q;
  wire R;
  wire RECEIVE;
  wire RECEIVED_IDLE;
  wire RECEIVED_IDLE_reg;
  wire RECEIVED_IDLE_reg_0;
  wire RECEIVE_i_1_n_0;
  wire RUDI_C0__0;
  wire RUDI_I0;
  wire RXCHARISK_REG1;
  wire [7:0]RXDATA_REG5;
  wire \RXD[0]_i_1_n_0 ;
  wire \RXD[1]_i_1_n_0 ;
  wire \RXD[2]_i_1_n_0 ;
  wire \RXD[3]_i_1_n_0 ;
  wire \RXD[4]_i_1_n_0 ;
  wire \RXD[5]_i_1_n_0 ;
  wire \RXD[6]_i_1_n_0 ;
  wire \RXD[7]_i_1_n_0 ;
  wire RXEVEN0_out;
  wire RXNOTINTABLE_INT;
  wire RXSYNC_STATUS;
  wire \RX_CONFIG_REG[15]_i_1_n_0 ;
  wire \RX_CONFIG_REG[7]_i_1_n_0 ;
  wire RX_CONFIG_REG_NULL_i_2_n_0;
  wire RX_CONFIG_REG_NULL_i_3_n_0;
  wire RX_CONFIG_REG_NULL_i_4_n_0;
  wire RX_CONFIG_REG_NULL_i_5_n_0;
  wire RX_CONFIG_REG_NULL_reg;
  wire RX_CONFIG_REG_NULL_reg_0;
  wire [0:0]\RX_CONFIG_REG_REG_reg[15] ;
  wire [9:0]\RX_CONFIG_REG_REG_reg[15]_0 ;
  wire \RX_CONFIG_REG_REG_reg[6] ;
  wire \RX_CONFIG_REG_REG_reg[7] ;
  wire \RX_CONFIG_REG_reg[5]_0 ;
  wire RX_CONFIG_VALID;
  wire RX_CONFIG_VALID_INT0;
  wire RX_CONFIG_VALID_INT_i_2_n_0;
  wire \RX_CONFIG_VALID_REG_reg_n_0_[0] ;
  wire \RX_CONFIG_VALID_REG_reg_n_0_[3] ;
  wire RX_DATA_ERROR;
  wire RX_DATA_ERROR0;
  wire RX_DATA_ERROR_i_2_n_0;
  wire RX_DATA_ERROR_i_4_n_0;
  wire RX_DV0;
  wire RX_DV_i_1_n_0;
  wire RX_ER0;
  wire RX_ER_reg_0;
  wire RX_IDLE;
  wire RX_INVALID;
  wire RX_INVALID_i_1_n_0;
  wire R_REG1;
  wire R_i_2_n_0;
  wire S;
  wire S0;
  wire S2;
  wire SOP;
  wire SOP0;
  wire SOP_REG1;
  wire SOP_REG2;
  wire SOP_REG3;
  wire [0:0]SR;
  wire SYNC_STATUS_REG;
  wire SYNC_STATUS_REG0;
  wire S_i_2_n_0;
  wire T;
  wire T_REG1;
  wire T_REG2;
  wire \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXBUFSTATUS_INT_reg[1] ;
  wire \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISK_INT_reg ;
  wire [1:0]\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCLKCORCNT_INT_reg[2] ;
  wire \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXRUNDISP_INT_reg ;
  wire WAIT_FOR_K;
  wire WAIT_FOR_K_i_1_n_0;
  wire XMIT_DATA;
  wire gmii_rx_dv;
  wire gmii_rx_er;
  wire [7:0]gmii_rxd;
  wire out;
  wire p_0_in1_in;
  wire p_0_in2_in;
  wire p_1_in;
  wire [1:0]status_vector;
  wire userclk2;

  LUT4 #(
    .INIT(16'h4F44)) 
    ABILITY_MATCH_2_i_11
       (.I0(\MR_LP_ADV_ABILITY_INT_reg[16] [12]),
        .I1(\RX_CONFIG_REG_REG_reg[15]_0 [6]),
        .I2(\MR_LP_ADV_ABILITY_INT_reg[16] [2]),
        .I3(\RX_CONFIG_REG_REG_reg[15]_0 [2]),
        .O(ABILITY_MATCH_2_i_11_n_0));
  LUT6 #(
    .INIT(64'h2022000020222022)) 
    ABILITY_MATCH_2_i_4
       (.I0(ABILITY_MATCH_2_i_9_n_0),
        .I1(\RX_CONFIG_REG_REG_reg[6] ),
        .I2(\RX_CONFIG_REG_REG_reg[15]_0 [5]),
        .I3(\MR_LP_ADV_ABILITY_INT_reg[16] [9]),
        .I4(\MR_LP_ADV_ABILITY_INT_reg[16] [1]),
        .I5(\RX_CONFIG_REG_REG_reg[15]_0 [1]),
        .O(ABILITY_MATCH_reg_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFBAFFBABA)) 
    ABILITY_MATCH_2_i_5
       (.I0(ABILITY_MATCH_2_i_11_n_0),
        .I1(\RX_CONFIG_REG_REG_reg[15]_0 [3]),
        .I2(\MR_LP_ADV_ABILITY_INT_reg[16] [5]),
        .I3(\RX_CONFIG_REG_REG_reg[15]_0 [7]),
        .I4(\MR_LP_ADV_ABILITY_INT_reg[16] [13]),
        .I5(\RX_CONFIG_REG_REG_reg[7] ),
        .O(ABILITY_MATCH_reg_1));
  LUT4 #(
    .INIT(16'h4F44)) 
    ABILITY_MATCH_2_i_8
       (.I0(\MR_LP_ADV_ABILITY_INT_reg[16] [15]),
        .I1(\RX_CONFIG_REG_REG_reg[15]_0 [9]),
        .I2(\MR_LP_ADV_ABILITY_INT_reg[16] [6]),
        .I3(\RX_CONFIG_REG_REG_reg[15]_0 [4]),
        .O(CONFIG_REG_MATCH_reg));
  LUT6 #(
    .INIT(64'hDD0D00000000DD0D)) 
    ABILITY_MATCH_2_i_9
       (.I0(\MR_LP_ADV_ABILITY_INT_reg[16] [12]),
        .I1(\RX_CONFIG_REG_REG_reg[15]_0 [6]),
        .I2(\RX_CONFIG_REG_REG_reg[15]_0 [7]),
        .I3(\MR_LP_ADV_ABILITY_INT_reg[16] [13]),
        .I4(\RX_CONFIG_REG_REG_reg[15]_0 [0]),
        .I5(\MR_LP_ADV_ABILITY_INT_reg[16] [0]),
        .O(ABILITY_MATCH_2_i_9_n_0));
  LUT6 #(
    .INIT(64'h0000000055555575)) 
    ABILITY_MATCH_i_1
       (.I0(RX_CONFIG_VALID),
        .I1(\RX_CONFIG_REG_reg[5]_0 ),
        .I2(ABILITY_MATCH_reg_0),
        .I3(ABILITY_MATCH_reg_1),
        .I4(RECEIVED_IDLE_reg_0),
        .I5(\MGT_RESET.SRESET_reg ),
        .O(ABILITY_MATCH_reg));
  LUT2 #(
    .INIT(4'h8)) 
    ACKNOWLEDGE_MATCH_2_i_1
       (.I0(\MR_LP_ADV_ABILITY_INT_reg[16] [14]),
        .I1(\RX_CONFIG_REG_REG_reg[15]_0 [8]),
        .O(ACKNOWLEDGE_MATCH_20));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \BASEX_REMOTE_FAULT[1]_i_1 
       (.I0(\MR_LP_ADV_ABILITY_INT_reg[16] [15]),
        .O(BASEX_REMOTE_FAULT_RSLVD));
  FDRE CGBAD_REG1_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(CGBAD),
        .Q(CGBAD_REG1),
        .R(1'b0));
  FDRE CGBAD_REG2_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(CGBAD_REG1),
        .Q(CGBAD_REG2),
        .R(1'b0));
  FDRE CGBAD_REG3_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(CGBAD_REG2),
        .Q(CGBAD_REG3),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    CGBAD_i_1
       (.I0(RXNOTINTABLE_INT),
        .I1(D),
        .I2(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXBUFSTATUS_INT_reg[1] ),
        .O(S2));
  FDRE CGBAD_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(S2),
        .Q(CGBAD),
        .R(SR));
  LUT3 #(
    .INIT(8'h08)) 
    C_HDR_REMOVED_REG_i_1
       (.I0(C_REG2),
        .I1(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCLKCORCNT_INT_reg[2] [0]),
        .I2(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCLKCORCNT_INT_reg[2] [1]),
        .O(C_HDR_REMOVED));
  FDRE C_HDR_REMOVED_REG_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(C_HDR_REMOVED),
        .Q(C_HDR_REMOVED_REG),
        .R(1'b0));
  FDRE C_REG1_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(C),
        .Q(C_REG1),
        .R(1'b0));
  FDRE C_REG2_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(C_REG1),
        .Q(C_REG2),
        .R(1'b0));
  FDRE C_REG3_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(C_REG2),
        .Q(C_REG3),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h2)) 
    C_i_1
       (.I0(K28p5_REG1),
        .I1(I_i_2_n_0),
        .O(C0));
  FDRE C_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(C0),
        .Q(C),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0001)) 
    D0p0_REG_i_1
       (.I0(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISK_INT_reg ),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(D0p0_REG_i_2_n_0),
        .O(D0p0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    D0p0_REG_i_2
       (.I0(Q[3]),
        .I1(Q[4]),
        .I2(Q[1]),
        .I3(Q[6]),
        .I4(Q[7]),
        .I5(Q[5]),
        .O(D0p0_REG_i_2_n_0));
  FDRE D0p0_REG_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(D0p0),
        .Q(D0p0_REG),
        .R(1'b0));
  LUT3 #(
    .INIT(8'hEA)) 
    EOP_REG1_i_1
       (.I0(EOP),
        .I1(EXTEND),
        .I2(EXTEND_REG1),
        .O(EOP_REG10));
  FDRE EOP_REG1_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(EOP_REG10),
        .Q(EOP_REG1),
        .R(SR));
  LUT6 #(
    .INIT(64'hFFFFFFFF88888000)) 
    EOP_i_1
       (.I0(T_REG2),
        .I1(R_REG1),
        .I2(RXEVEN0_out),
        .I3(K28p5_REG1),
        .I4(R),
        .I5(EOP_i_2_n_0),
        .O(EOP0));
  LUT5 #(
    .INIT(32'hFF808080)) 
    EOP_i_2
       (.I0(C_REG1),
        .I1(D0p0_REG),
        .I2(RXEVEN0_out),
        .I3(RX_IDLE),
        .I4(K28p5_REG1),
        .O(EOP_i_2_n_0));
  FDRE EOP_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(EOP0),
        .Q(EOP),
        .R(SR));
  LUT3 #(
    .INIT(8'hEA)) 
    EXTEND_ERR_i_1
       (.I0(EXT_ILLEGAL_K_REG2),
        .I1(EXTEND_REG3),
        .I2(CGBAD_REG3),
        .O(EXTEND_ERR0));
  FDRE EXTEND_ERR_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(EXTEND_ERR0),
        .Q(EXTEND_ERR),
        .R(SYNC_STATUS_REG0));
  FDRE EXTEND_REG1_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(EXTEND),
        .Q(EXTEND_REG1),
        .R(1'b0));
  FDRE EXTEND_REG2_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(EXTEND_REG1),
        .Q(EXTEND_REG2),
        .R(1'b0));
  FDRE EXTEND_REG3_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(EXTEND_REG2),
        .Q(EXTEND_REG3),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h808080FF80808080)) 
    EXTEND_i_1
       (.I0(R_REG1),
        .I1(R),
        .I2(RECEIVE),
        .I3(EVEN_reg),
        .I4(S),
        .I5(EXTEND),
        .O(EXTEND_i_1_n_0));
  FDRE EXTEND_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(EXTEND_i_1_n_0),
        .Q(EXTEND),
        .R(SYNC_STATUS_REG0));
  FDRE EXT_ILLEGAL_K_REG1_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(EXT_ILLEGAL_K),
        .Q(EXT_ILLEGAL_K_REG1),
        .R(SYNC_STATUS_REG0));
  FDRE EXT_ILLEGAL_K_REG2_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(EXT_ILLEGAL_K_REG1),
        .Q(EXT_ILLEGAL_K_REG2),
        .R(SYNC_STATUS_REG0));
  LUT5 #(
    .INIT(32'h00000700)) 
    EXT_ILLEGAL_K_i_1
       (.I0(RXEVEN0_out),
        .I1(K28p5_REG1),
        .I2(S),
        .I3(EXTEND_REG1),
        .I4(R),
        .O(EXT_ILLEGAL_K0));
  FDRE EXT_ILLEGAL_K_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(EXT_ILLEGAL_K0),
        .Q(EXT_ILLEGAL_K),
        .R(SYNC_STATUS_REG0));
  FDRE FALSE_CARRIER_REG1_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(FALSE_CARRIER),
        .Q(FALSE_CARRIER_REG1),
        .R(1'b0));
  FDRE FALSE_CARRIER_REG2_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(FALSE_CARRIER_REG1),
        .Q(FALSE_CARRIER_REG2),
        .R(1'b0));
  FDRE FALSE_CARRIER_REG3_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(FALSE_CARRIER_REG2),
        .Q(FALSE_CARRIER_REG3),
        .R(SYNC_STATUS_REG0));
  LUT4 #(
    .INIT(16'hF7F0)) 
    FALSE_CARRIER_i_1
       (.I0(K28p5_REG1),
        .I1(RXEVEN0_out),
        .I2(FALSE_CARRIER0),
        .I3(FALSE_CARRIER),
        .O(FALSE_CARRIER_i_1_n_0));
  LUT5 #(
    .INIT(32'h00200000)) 
    FALSE_CARRIER_i_2
       (.I0(\CONFIG_REG_WITH_AN.AN_ENABLE_REG_reg ),
        .I1(S),
        .I2(RX_IDLE),
        .I3(K28p5_REG1),
        .I4(FALSE_CARRIER_i_3_n_0),
        .O(FALSE_CARRIER0));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT3 #(
    .INIT(8'h01)) 
    FALSE_CARRIER_i_3
       (.I0(FALSE_NIT),
        .I1(FALSE_K),
        .I2(FALSE_DATA),
        .O(FALSE_CARRIER_i_3_n_0));
  FDRE FALSE_CARRIER_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(FALSE_CARRIER_i_1_n_0),
        .Q(FALSE_CARRIER),
        .R(SYNC_STATUS_REG0));
  LUT6 #(
    .INIT(64'h0000000008882220)) 
    FALSE_DATA_i_1
       (.I0(FALSE_DATA_i_2_n_0),
        .I1(Q[1]),
        .I2(Q[3]),
        .I3(Q[4]),
        .I4(Q[0]),
        .I5(FALSE_DATA_i_3_n_0),
        .O(FALSE_DATA0));
  LUT5 #(
    .INIT(32'h03800080)) 
    FALSE_DATA_i_2
       (.I0(Q[2]),
        .I1(Q[5]),
        .I2(Q[7]),
        .I3(Q[6]),
        .I4(Q[0]),
        .O(FALSE_DATA_i_2_n_0));
  LUT6 #(
    .INIT(64'hFFFEEEEEEEEEEEEE)) 
    FALSE_DATA_i_3
       (.I0(RXNOTINTABLE_INT),
        .I1(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISK_INT_reg ),
        .I2(Q[4]),
        .I3(Q[3]),
        .I4(Q[0]),
        .I5(Q[2]),
        .O(FALSE_DATA_i_3_n_0));
  FDRE FALSE_DATA_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(FALSE_DATA0),
        .Q(FALSE_DATA),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT5 #(
    .INIT(32'h00008200)) 
    FALSE_K_i_1
       (.I0(FALSE_K_i_2_n_0),
        .I1(Q[6]),
        .I2(Q[5]),
        .I3(Q[7]),
        .I4(RXNOTINTABLE_INT),
        .O(FALSE_K0));
  LUT6 #(
    .INIT(64'h0000400000000000)) 
    FALSE_K_i_2
       (.I0(Q[0]),
        .I1(Q[2]),
        .I2(Q[4]),
        .I3(Q[3]),
        .I4(Q[1]),
        .I5(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISK_INT_reg ),
        .O(FALSE_K_i_2_n_0));
  FDRE FALSE_K_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(FALSE_K0),
        .Q(FALSE_K),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT2 #(
    .INIT(4'h2)) 
    FALSE_NIT_i_1
       (.I0(RXNOTINTABLE_INT),
        .I1(FALSE_NIT_i_2_n_0),
        .O(FALSE_NIT0));
  LUT6 #(
    .INIT(64'hFCCFCFFACFFAFAAF)) 
    FALSE_NIT_i_2
       (.I0(FALSE_NIT_i_3_n_0),
        .I1(D0p0_REG_i_2_n_0),
        .I2(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISK_INT_reg ),
        .I3(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXRUNDISP_INT_reg ),
        .I4(Q[0]),
        .I5(Q[2]),
        .O(FALSE_NIT_i_2_n_0));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    FALSE_NIT_i_3
       (.I0(Q[3]),
        .I1(Q[5]),
        .I2(Q[7]),
        .I3(Q[6]),
        .I4(Q[4]),
        .I5(Q[1]),
        .O(FALSE_NIT_i_3_n_0));
  FDRE FALSE_NIT_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(FALSE_NIT0),
        .Q(FALSE_NIT),
        .R(SR));
  LUT4 #(
    .INIT(16'h0004)) 
    FROM_IDLE_D_i_1
       (.I0(K28p5_REG1),
        .I1(RX_IDLE),
        .I2(WAIT_FOR_K),
        .I3(\CONFIG_REG_WITH_AN.AN_ENABLE_REG_reg ),
        .O(FROM_IDLE_D0));
  FDRE FROM_IDLE_D_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(FROM_IDLE_D0),
        .Q(FROM_IDLE_D),
        .R(SYNC_STATUS_REG0));
  LUT6 #(
    .INIT(64'hFFFFA8FFFCFCA8A8)) 
    FROM_RX_CX_i_1
       (.I0(RXCHARISK_REG1),
        .I1(C_REG1),
        .I2(C_REG2),
        .I3(EVEN_reg),
        .I4(CGBAD),
        .I5(C_REG3),
        .O(FROM_RX_CX0));
  FDRE FROM_RX_CX_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(FROM_RX_CX0),
        .Q(FROM_RX_CX),
        .R(SYNC_STATUS_REG0));
  LUT4 #(
    .INIT(16'h00E0)) 
    FROM_RX_K_i_1
       (.I0(RXCHARISK_REG1),
        .I1(CGBAD),
        .I2(K28p5_REG2),
        .I3(\CONFIG_REG_WITH_AN.AN_ENABLE_REG_reg ),
        .O(FROM_RX_K0));
  FDRE FROM_RX_K_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(FROM_RX_K0),
        .Q(FROM_RX_K),
        .R(SYNC_STATUS_REG0));
  FDRE \IDLE_REG_reg[0] 
       (.C(userclk2),
        .CE(1'b1),
        .D(RX_IDLE),
        .Q(\IDLE_REG_reg_n_0_[0] ),
        .R(SR));
  FDRE \IDLE_REG_reg[1] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\IDLE_REG_reg_n_0_[0] ),
        .Q(p_0_in1_in),
        .R(SR));
  FDRE \IDLE_REG_reg[2] 
       (.C(userclk2),
        .CE(1'b1),
        .D(p_0_in1_in),
        .Q(\IDLE_REG_reg_n_0_[2] ),
        .R(SR));
  FDRE ILLEGAL_K_REG1_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(ILLEGAL_K),
        .Q(ILLEGAL_K_REG1),
        .R(SYNC_STATUS_REG0));
  FDRE ILLEGAL_K_REG2_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(ILLEGAL_K_REG1),
        .Q(ILLEGAL_K_REG2),
        .R(SYNC_STATUS_REG0));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT4 #(
    .INIT(16'h0010)) 
    ILLEGAL_K_i_1
       (.I0(R),
        .I1(K28p5_REG1),
        .I2(RXCHARISK_REG1),
        .I3(T),
        .O(ILLEGAL_K0));
  FDRE ILLEGAL_K_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(ILLEGAL_K0),
        .Q(ILLEGAL_K),
        .R(SYNC_STATUS_REG0));
  FDRE I_REG_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(I),
        .Q(RX_IDLE),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hAA00AA8080008080)) 
    I_i_1
       (.I0(I_i_2_n_0),
        .I1(K28p5_REG1),
        .I2(RXEVEN0_out),
        .I3(\CONFIG_REG_WITH_AN.AN_ENABLE_REG_reg ),
        .I4(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISK_INT_reg ),
        .I5(I_i_3_n_0),
        .O(I0));
  LUT6 #(
    .INIT(64'hDDDDDDDDDDDDDDD0)) 
    I_i_2
       (.I0(I_i_4_n_0),
        .I1(I_i_5_n_0),
        .I2(I_i_6_n_0),
        .I3(Q[2]),
        .I4(Q[0]),
        .I5(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISK_INT_reg ),
        .O(I_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT5 #(
    .INIT(32'hFE000000)) 
    I_i_3
       (.I0(FALSE_DATA),
        .I1(FALSE_K),
        .I2(FALSE_NIT),
        .I3(RX_IDLE),
        .I4(RXEVEN0_out),
        .O(I_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT3 #(
    .INIT(8'h40)) 
    I_i_4
       (.I0(Q[6]),
        .I1(Q[5]),
        .I2(Q[7]),
        .O(I_i_4_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFF7FFFFFFFF)) 
    I_i_5
       (.I0(Q[0]),
        .I1(Q[2]),
        .I2(Q[3]),
        .I3(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISK_INT_reg ),
        .I4(Q[1]),
        .I5(Q[4]),
        .O(I_i_5_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFDFFFFFFFF)) 
    I_i_6
       (.I0(Q[6]),
        .I1(Q[7]),
        .I2(Q[5]),
        .I3(Q[4]),
        .I4(Q[3]),
        .I5(Q[1]),
        .O(I_i_6_n_0));
  FDRE I_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(I0),
        .Q(I),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0080)) 
    K28p5_REG1_i_1
       (.I0(FALSE_K_i_2_n_0),
        .I1(Q[7]),
        .I2(Q[5]),
        .I3(Q[6]),
        .O(K28p5_REG1_i_1_n_0));
  FDRE K28p5_REG1_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(K28p5_REG1_i_1_n_0),
        .Q(K28p5_REG1),
        .R(1'b0));
  FDRE K28p5_REG2_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(K28p5_REG1),
        .Q(K28p5_REG2),
        .R(1'b0));
  LUT3 #(
    .INIT(8'hBA)) 
    RECEIVED_IDLE_i_1
       (.I0(RX_IDLE),
        .I1(RX_CONFIG_VALID),
        .I2(RECEIVED_IDLE),
        .O(RECEIVED_IDLE_reg));
  LUT3 #(
    .INIT(8'hDC)) 
    RECEIVE_i_1
       (.I0(EOP),
        .I1(SOP_REG2),
        .I2(RECEIVE),
        .O(RECEIVE_i_1_n_0));
  FDRE RECEIVE_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(RECEIVE_i_1_n_0),
        .Q(RECEIVE),
        .R(SYNC_STATUS_REG0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    RUDI_C0
       (.I0(p_0_in2_in),
        .I1(\RX_CONFIG_VALID_REG_reg_n_0_[3] ),
        .I2(p_1_in),
        .I3(\RX_CONFIG_VALID_REG_reg_n_0_[0] ),
        .O(RUDI_C0__0));
  FDRE RUDI_C_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(RUDI_C0__0),
        .Q(status_vector[0]),
        .R(SR));
  LUT2 #(
    .INIT(4'hE)) 
    RUDI_I_i_1
       (.I0(\IDLE_REG_reg_n_0_[2] ),
        .I1(p_0_in1_in),
        .O(RUDI_I0));
  FDRE RUDI_I_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(RUDI_I0),
        .Q(status_vector[1]),
        .R(SR));
  FDRE RXCHARISK_REG1_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISK_INT_reg ),
        .Q(RXCHARISK_REG1),
        .R(1'b0));
  (* srl_bus_name = "inst/\pcs_pma_block_i/gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core /\gpcs_pma_inst/RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK/RXDATA_REG5_reg " *) 
  (* srl_name = "inst/\pcs_pma_block_i/gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core /\gpcs_pma_inst/RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK/RXDATA_REG5_reg[0]_srl5 " *) 
  SRL16E \RXDATA_REG5_reg[0]_srl5 
       (.A0(1'b0),
        .A1(1'b0),
        .A2(1'b1),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(userclk2),
        .D(Q[0]),
        .Q(RXDATA_REG5[0]));
  (* srl_bus_name = "inst/\pcs_pma_block_i/gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core /\gpcs_pma_inst/RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK/RXDATA_REG5_reg " *) 
  (* srl_name = "inst/\pcs_pma_block_i/gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core /\gpcs_pma_inst/RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK/RXDATA_REG5_reg[1]_srl5 " *) 
  SRL16E \RXDATA_REG5_reg[1]_srl5 
       (.A0(1'b0),
        .A1(1'b0),
        .A2(1'b1),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(userclk2),
        .D(Q[1]),
        .Q(RXDATA_REG5[1]));
  (* srl_bus_name = "inst/\pcs_pma_block_i/gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core /\gpcs_pma_inst/RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK/RXDATA_REG5_reg " *) 
  (* srl_name = "inst/\pcs_pma_block_i/gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core /\gpcs_pma_inst/RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK/RXDATA_REG5_reg[2]_srl5 " *) 
  SRL16E \RXDATA_REG5_reg[2]_srl5 
       (.A0(1'b0),
        .A1(1'b0),
        .A2(1'b1),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(userclk2),
        .D(Q[2]),
        .Q(RXDATA_REG5[2]));
  (* srl_bus_name = "inst/\pcs_pma_block_i/gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core /\gpcs_pma_inst/RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK/RXDATA_REG5_reg " *) 
  (* srl_name = "inst/\pcs_pma_block_i/gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core /\gpcs_pma_inst/RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK/RXDATA_REG5_reg[3]_srl5 " *) 
  SRL16E \RXDATA_REG5_reg[3]_srl5 
       (.A0(1'b0),
        .A1(1'b0),
        .A2(1'b1),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(userclk2),
        .D(Q[3]),
        .Q(RXDATA_REG5[3]));
  (* srl_bus_name = "inst/\pcs_pma_block_i/gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core /\gpcs_pma_inst/RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK/RXDATA_REG5_reg " *) 
  (* srl_name = "inst/\pcs_pma_block_i/gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core /\gpcs_pma_inst/RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK/RXDATA_REG5_reg[4]_srl5 " *) 
  SRL16E \RXDATA_REG5_reg[4]_srl5 
       (.A0(1'b0),
        .A1(1'b0),
        .A2(1'b1),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(userclk2),
        .D(Q[4]),
        .Q(RXDATA_REG5[4]));
  (* srl_bus_name = "inst/\pcs_pma_block_i/gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core /\gpcs_pma_inst/RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK/RXDATA_REG5_reg " *) 
  (* srl_name = "inst/\pcs_pma_block_i/gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core /\gpcs_pma_inst/RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK/RXDATA_REG5_reg[5]_srl5 " *) 
  SRL16E \RXDATA_REG5_reg[5]_srl5 
       (.A0(1'b0),
        .A1(1'b0),
        .A2(1'b1),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(userclk2),
        .D(Q[5]),
        .Q(RXDATA_REG5[5]));
  (* srl_bus_name = "inst/\pcs_pma_block_i/gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core /\gpcs_pma_inst/RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK/RXDATA_REG5_reg " *) 
  (* srl_name = "inst/\pcs_pma_block_i/gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core /\gpcs_pma_inst/RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK/RXDATA_REG5_reg[6]_srl5 " *) 
  SRL16E \RXDATA_REG5_reg[6]_srl5 
       (.A0(1'b0),
        .A1(1'b0),
        .A2(1'b1),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(userclk2),
        .D(Q[6]),
        .Q(RXDATA_REG5[6]));
  (* srl_bus_name = "inst/\pcs_pma_block_i/gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core /\gpcs_pma_inst/RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK/RXDATA_REG5_reg " *) 
  (* srl_name = "inst/\pcs_pma_block_i/gen_lvds_transceiver.gen_lvds_transceiver_logic[0].design_1_gig_ethernet_pcs_pma_0_0_core /\gpcs_pma_inst/RX_GMII_AT_TXOUTCLK.RECEIVER_TXOUTCLK/RXDATA_REG5_reg[7]_srl5 " *) 
  SRL16E \RXDATA_REG5_reg[7]_srl5 
       (.A0(1'b0),
        .A1(1'b0),
        .A2(1'b1),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(userclk2),
        .D(Q[7]),
        .Q(RXDATA_REG5[7]));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT4 #(
    .INIT(16'hBBBA)) 
    \RXD[0]_i_1 
       (.I0(SOP_REG3),
        .I1(FALSE_CARRIER_REG3),
        .I2(EXTEND_REG1),
        .I3(RXDATA_REG5[0]),
        .O(\RXD[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT4 #(
    .INIT(16'h5554)) 
    \RXD[1]_i_1 
       (.I0(SOP_REG3),
        .I1(RXDATA_REG5[1]),
        .I2(FALSE_CARRIER_REG3),
        .I3(EXTEND_REG1),
        .O(\RXD[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \RXD[2]_i_1 
       (.I0(RXDATA_REG5[2]),
        .I1(FALSE_CARRIER_REG3),
        .I2(EXTEND_REG1),
        .I3(SOP_REG3),
        .O(\RXD[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT4 #(
    .INIT(16'h5554)) 
    \RXD[3]_i_1 
       (.I0(SOP_REG3),
        .I1(RXDATA_REG5[3]),
        .I2(FALSE_CARRIER_REG3),
        .I3(EXTEND_REG1),
        .O(\RXD[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT5 #(
    .INIT(32'hBABBBAAA)) 
    \RXD[4]_i_1 
       (.I0(SOP_REG3),
        .I1(FALSE_CARRIER_REG3),
        .I2(EXTEND_ERR),
        .I3(EXTEND_REG1),
        .I4(RXDATA_REG5[4]),
        .O(\RXD[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT4 #(
    .INIT(16'h0002)) 
    \RXD[5]_i_1 
       (.I0(RXDATA_REG5[5]),
        .I1(FALSE_CARRIER_REG3),
        .I2(EXTEND_REG1),
        .I3(SOP_REG3),
        .O(\RXD[5]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hABAA)) 
    \RXD[6]_i_1 
       (.I0(SOP_REG3),
        .I1(FALSE_CARRIER_REG3),
        .I2(EXTEND_REG1),
        .I3(RXDATA_REG5[6]),
        .O(\RXD[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT4 #(
    .INIT(16'h0002)) 
    \RXD[7]_i_1 
       (.I0(RXDATA_REG5[7]),
        .I1(FALSE_CARRIER_REG3),
        .I2(EXTEND_REG1),
        .I3(SOP_REG3),
        .O(\RXD[7]_i_1_n_0 ));
  FDRE \RXD_reg[0] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\RXD[0]_i_1_n_0 ),
        .Q(gmii_rxd[0]),
        .R(\CONFIG_REG_WITH_AN.ISOLATE_REG_reg ));
  FDRE \RXD_reg[1] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\RXD[1]_i_1_n_0 ),
        .Q(gmii_rxd[1]),
        .R(\CONFIG_REG_WITH_AN.ISOLATE_REG_reg ));
  FDRE \RXD_reg[2] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\RXD[2]_i_1_n_0 ),
        .Q(gmii_rxd[2]),
        .R(\CONFIG_REG_WITH_AN.ISOLATE_REG_reg ));
  FDRE \RXD_reg[3] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\RXD[3]_i_1_n_0 ),
        .Q(gmii_rxd[3]),
        .R(\CONFIG_REG_WITH_AN.ISOLATE_REG_reg ));
  FDRE \RXD_reg[4] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\RXD[4]_i_1_n_0 ),
        .Q(gmii_rxd[4]),
        .R(\CONFIG_REG_WITH_AN.ISOLATE_REG_reg ));
  FDRE \RXD_reg[5] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\RXD[5]_i_1_n_0 ),
        .Q(gmii_rxd[5]),
        .R(\CONFIG_REG_WITH_AN.ISOLATE_REG_reg ));
  FDRE \RXD_reg[6] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\RXD[6]_i_1_n_0 ),
        .Q(gmii_rxd[6]),
        .R(\CONFIG_REG_WITH_AN.ISOLATE_REG_reg ));
  FDRE \RXD_reg[7] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\RXD[7]_i_1_n_0 ),
        .Q(gmii_rxd[7]),
        .R(\CONFIG_REG_WITH_AN.ISOLATE_REG_reg ));
  LUT4 #(
    .INIT(16'h000E)) 
    \RX_CONFIG_REG[15]_i_1 
       (.I0(C_REG1),
        .I1(C_HDR_REMOVED_REG),
        .I2(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISK_INT_reg ),
        .I3(RXCHARISK_REG1),
        .O(\RX_CONFIG_REG[15]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h55550040)) 
    \RX_CONFIG_REG[7]_i_1 
       (.I0(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISK_INT_reg ),
        .I1(C_REG2),
        .I2(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCLKCORCNT_INT_reg[2] [0]),
        .I3(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCLKCORCNT_INT_reg[2] [1]),
        .I4(C),
        .O(\RX_CONFIG_REG[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0004FFFF00040000)) 
    RX_CONFIG_REG_NULL_i_1
       (.I0(RX_CONFIG_REG_NULL_i_2_n_0),
        .I1(RX_CONFIG_REG_NULL_i_3_n_0),
        .I2(RX_CONFIG_REG_NULL_i_4_n_0),
        .I3(RX_CONFIG_REG_NULL_i_5_n_0),
        .I4(RX_CONFIG_VALID),
        .I5(RX_CONFIG_REG_NULL_reg_0),
        .O(RX_CONFIG_REG_NULL_reg));
  LUT4 #(
    .INIT(16'hFFFE)) 
    RX_CONFIG_REG_NULL_i_2
       (.I0(\MR_LP_ADV_ABILITY_INT_reg[16] [5]),
        .I1(\MR_LP_ADV_ABILITY_INT_reg[16] [4]),
        .I2(\MR_LP_ADV_ABILITY_INT_reg[16] [7]),
        .I3(\MR_LP_ADV_ABILITY_INT_reg[16] [6]),
        .O(RX_CONFIG_REG_NULL_i_2_n_0));
  LUT4 #(
    .INIT(16'h0001)) 
    RX_CONFIG_REG_NULL_i_3
       (.I0(\MR_LP_ADV_ABILITY_INT_reg[16] [3]),
        .I1(\MR_LP_ADV_ABILITY_INT_reg[16] [0]),
        .I2(\MR_LP_ADV_ABILITY_INT_reg[16] [2]),
        .I3(\MR_LP_ADV_ABILITY_INT_reg[16] [1]),
        .O(RX_CONFIG_REG_NULL_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    RX_CONFIG_REG_NULL_i_4
       (.I0(\MR_LP_ADV_ABILITY_INT_reg[16] [13]),
        .I1(\MR_LP_ADV_ABILITY_INT_reg[16] [12]),
        .I2(\MR_LP_ADV_ABILITY_INT_reg[16] [15]),
        .I3(\MR_LP_ADV_ABILITY_INT_reg[16] [14]),
        .O(RX_CONFIG_REG_NULL_i_4_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    RX_CONFIG_REG_NULL_i_5
       (.I0(\MR_LP_ADV_ABILITY_INT_reg[16] [10]),
        .I1(\MR_LP_ADV_ABILITY_INT_reg[16] [9]),
        .I2(\MR_LP_ADV_ABILITY_INT_reg[16] [11]),
        .I3(\MR_LP_ADV_ABILITY_INT_reg[16] [8]),
        .O(RX_CONFIG_REG_NULL_i_5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \RX_CONFIG_REG_REG[15]_i_1 
       (.I0(out),
        .I1(RX_IDLE),
        .O(\RX_CONFIG_REG_REG_reg[15] ));
  FDRE \RX_CONFIG_REG_reg[0] 
       (.C(userclk2),
        .CE(\RX_CONFIG_REG[7]_i_1_n_0 ),
        .D(Q[0]),
        .Q(\MR_LP_ADV_ABILITY_INT_reg[16] [0]),
        .R(1'b0));
  FDRE \RX_CONFIG_REG_reg[10] 
       (.C(userclk2),
        .CE(\RX_CONFIG_REG[15]_i_1_n_0 ),
        .D(Q[2]),
        .Q(\MR_LP_ADV_ABILITY_INT_reg[16] [10]),
        .R(1'b0));
  FDRE \RX_CONFIG_REG_reg[11] 
       (.C(userclk2),
        .CE(\RX_CONFIG_REG[15]_i_1_n_0 ),
        .D(Q[3]),
        .Q(\MR_LP_ADV_ABILITY_INT_reg[16] [11]),
        .R(1'b0));
  FDRE \RX_CONFIG_REG_reg[12] 
       (.C(userclk2),
        .CE(\RX_CONFIG_REG[15]_i_1_n_0 ),
        .D(Q[4]),
        .Q(\MR_LP_ADV_ABILITY_INT_reg[16] [12]),
        .R(1'b0));
  FDRE \RX_CONFIG_REG_reg[13] 
       (.C(userclk2),
        .CE(\RX_CONFIG_REG[15]_i_1_n_0 ),
        .D(Q[5]),
        .Q(\MR_LP_ADV_ABILITY_INT_reg[16] [13]),
        .R(1'b0));
  FDRE \RX_CONFIG_REG_reg[14] 
       (.C(userclk2),
        .CE(\RX_CONFIG_REG[15]_i_1_n_0 ),
        .D(Q[6]),
        .Q(\MR_LP_ADV_ABILITY_INT_reg[16] [14]),
        .R(1'b0));
  FDRE \RX_CONFIG_REG_reg[15] 
       (.C(userclk2),
        .CE(\RX_CONFIG_REG[15]_i_1_n_0 ),
        .D(Q[7]),
        .Q(\MR_LP_ADV_ABILITY_INT_reg[16] [15]),
        .R(1'b0));
  FDRE \RX_CONFIG_REG_reg[1] 
       (.C(userclk2),
        .CE(\RX_CONFIG_REG[7]_i_1_n_0 ),
        .D(Q[1]),
        .Q(\MR_LP_ADV_ABILITY_INT_reg[16] [1]),
        .R(1'b0));
  FDRE \RX_CONFIG_REG_reg[2] 
       (.C(userclk2),
        .CE(\RX_CONFIG_REG[7]_i_1_n_0 ),
        .D(Q[2]),
        .Q(\MR_LP_ADV_ABILITY_INT_reg[16] [2]),
        .R(1'b0));
  FDRE \RX_CONFIG_REG_reg[3] 
       (.C(userclk2),
        .CE(\RX_CONFIG_REG[7]_i_1_n_0 ),
        .D(Q[3]),
        .Q(\MR_LP_ADV_ABILITY_INT_reg[16] [3]),
        .R(1'b0));
  FDRE \RX_CONFIG_REG_reg[4] 
       (.C(userclk2),
        .CE(\RX_CONFIG_REG[7]_i_1_n_0 ),
        .D(Q[4]),
        .Q(\MR_LP_ADV_ABILITY_INT_reg[16] [4]),
        .R(1'b0));
  FDRE \RX_CONFIG_REG_reg[5] 
       (.C(userclk2),
        .CE(\RX_CONFIG_REG[7]_i_1_n_0 ),
        .D(Q[5]),
        .Q(\MR_LP_ADV_ABILITY_INT_reg[16] [5]),
        .R(1'b0));
  FDRE \RX_CONFIG_REG_reg[6] 
       (.C(userclk2),
        .CE(\RX_CONFIG_REG[7]_i_1_n_0 ),
        .D(Q[6]),
        .Q(\MR_LP_ADV_ABILITY_INT_reg[16] [6]),
        .R(1'b0));
  FDRE \RX_CONFIG_REG_reg[7] 
       (.C(userclk2),
        .CE(\RX_CONFIG_REG[7]_i_1_n_0 ),
        .D(Q[7]),
        .Q(\MR_LP_ADV_ABILITY_INT_reg[16] [7]),
        .R(1'b0));
  FDRE \RX_CONFIG_REG_reg[8] 
       (.C(userclk2),
        .CE(\RX_CONFIG_REG[15]_i_1_n_0 ),
        .D(Q[0]),
        .Q(\MR_LP_ADV_ABILITY_INT_reg[16] [8]),
        .R(1'b0));
  FDRE \RX_CONFIG_REG_reg[9] 
       (.C(userclk2),
        .CE(\RX_CONFIG_REG[15]_i_1_n_0 ),
        .D(Q[1]),
        .Q(\MR_LP_ADV_ABILITY_INT_reg[16] [9]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h000000000E000000)) 
    RX_CONFIG_VALID_INT_i_1
       (.I0(C_REG1),
        .I1(C_HDR_REMOVED_REG),
        .I2(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISK_INT_reg ),
        .I3(RXSYNC_STATUS),
        .I4(RX_CONFIG_VALID_INT_i_2_n_0),
        .I5(S2),
        .O(RX_CONFIG_VALID_INT0));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT2 #(
    .INIT(4'h1)) 
    RX_CONFIG_VALID_INT_i_2
       (.I0(RXCHARISK_REG1),
        .I1(CGBAD),
        .O(RX_CONFIG_VALID_INT_i_2_n_0));
  FDRE RX_CONFIG_VALID_INT_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(RX_CONFIG_VALID_INT0),
        .Q(RX_CONFIG_VALID),
        .R(SR));
  FDRE \RX_CONFIG_VALID_REG_reg[0] 
       (.C(userclk2),
        .CE(1'b1),
        .D(RX_CONFIG_VALID),
        .Q(\RX_CONFIG_VALID_REG_reg_n_0_[0] ),
        .R(SR));
  FDRE \RX_CONFIG_VALID_REG_reg[1] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\RX_CONFIG_VALID_REG_reg_n_0_[0] ),
        .Q(p_0_in2_in),
        .R(SR));
  FDRE \RX_CONFIG_VALID_REG_reg[2] 
       (.C(userclk2),
        .CE(1'b1),
        .D(p_0_in2_in),
        .Q(p_1_in),
        .R(SR));
  FDRE \RX_CONFIG_VALID_REG_reg[3] 
       (.C(userclk2),
        .CE(1'b1),
        .D(p_1_in),
        .Q(\RX_CONFIG_VALID_REG_reg_n_0_[3] ),
        .R(SR));
  LUT6 #(
    .INIT(64'h888AAAAA88888888)) 
    RX_DATA_ERROR_i_1
       (.I0(RECEIVE),
        .I1(RX_DATA_ERROR_i_2_n_0),
        .I2(R),
        .I3(EVEN_reg),
        .I4(R_REG1),
        .I5(T_REG2),
        .O(RX_DATA_ERROR0));
  LUT5 #(
    .INIT(32'hFFFF4544)) 
    RX_DATA_ERROR_i_2
       (.I0(R_REG1),
        .I1(K28p5_REG1),
        .I2(T_REG1),
        .I3(R),
        .I4(RX_DATA_ERROR_i_4_n_0),
        .O(RX_DATA_ERROR_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    RX_DATA_ERROR_i_4
       (.I0(CGBAD_REG3),
        .I1(RX_IDLE),
        .I2(ILLEGAL_K_REG2),
        .I3(C_REG1),
        .O(RX_DATA_ERROR_i_4_n_0));
  FDRE RX_DATA_ERROR_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(RX_DATA_ERROR0),
        .Q(RX_DATA_ERROR),
        .R(SYNC_STATUS_REG0));
  LUT6 #(
    .INIT(64'hAAAAEEEAAAAAAAAA)) 
    RX_DV_i_1
       (.I0(RX_DV0),
        .I1(XMIT_DATA),
        .I2(RECEIVE),
        .I3(RXSYNC_STATUS),
        .I4(EOP_REG1),
        .I5(gmii_rx_dv),
        .O(RX_DV_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    RX_DV_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(RX_DV_i_1_n_0),
        .Q(gmii_rx_dv),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT2 #(
    .INIT(4'h1)) 
    RX_ER_i_2
       (.I0(FALSE_CARRIER_REG3),
        .I1(EXTEND_REG1),
        .O(RX_ER_reg_0));
  FDRE #(
    .INIT(1'b0)) 
    RX_ER_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(RX_ER0),
        .Q(gmii_rx_er),
        .R(SR));
  LUT6 #(
    .INIT(64'hFFFF55FDFFFF00FC)) 
    RX_INVALID_i_1
       (.I0(K28p5_REG1),
        .I1(FROM_RX_K),
        .I2(FROM_IDLE_D),
        .I3(\CONFIG_REG_WITH_AN.AN_ENABLE_REG_reg ),
        .I4(FROM_RX_CX),
        .I5(RX_INVALID),
        .O(RX_INVALID_i_1_n_0));
  FDRE RX_INVALID_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(RX_INVALID_i_1_n_0),
        .Q(RX_INVALID),
        .R(SYNC_STATUS_REG0));
  FDRE R_REG1_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(R),
        .Q(R_REG1),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0000000040000000)) 
    R_i_1
       (.I0(R_i_2_n_0),
        .I1(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISK_INT_reg ),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(Q[2]),
        .I5(Q[3]),
        .O(K23p7));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    R_i_2
       (.I0(Q[5]),
        .I1(Q[7]),
        .I2(Q[6]),
        .I3(Q[4]),
        .O(R_i_2_n_0));
  FDRE R_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(K23p7),
        .Q(R),
        .R(1'b0));
  FDRE SOP_REG1_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(SOP),
        .Q(SOP_REG1),
        .R(1'b0));
  FDRE SOP_REG2_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(SOP_REG1),
        .Q(SOP_REG2),
        .R(1'b0));
  FDRE SOP_REG3_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(SOP_REG2),
        .Q(SOP_REG3),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h20202000)) 
    SOP_i_1
       (.I0(\CONFIG_REG_WITH_AN.AN_ENABLE_REG_reg ),
        .I1(WAIT_FOR_K),
        .I2(S),
        .I3(RX_IDLE),
        .I4(EXTEND),
        .O(SOP0));
  FDRE SOP_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(SOP0),
        .Q(SOP),
        .R(SR));
  FDRE SYNC_STATUS_REG_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(1'b1),
        .Q(SYNC_STATUS_REG),
        .R(SYNC_STATUS_REG0));
  LUT6 #(
    .INIT(64'h0000000000000080)) 
    S_i_1
       (.I0(Q[1]),
        .I1(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISK_INT_reg ),
        .I2(Q[0]),
        .I3(Q[2]),
        .I4(S2),
        .I5(S_i_2_n_0),
        .O(S0));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    S_i_2
       (.I0(Q[4]),
        .I1(Q[6]),
        .I2(Q[7]),
        .I3(Q[5]),
        .I4(Q[3]),
        .O(S_i_2_n_0));
  FDRE S_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(S0),
        .Q(S),
        .R(1'b0));
  FDRE T_REG1_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(T),
        .Q(T_REG1),
        .R(1'b0));
  FDRE T_REG2_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(T_REG1),
        .Q(T_REG2),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h00004000)) 
    T_i_1__0
       (.I0(Q[1]),
        .I1(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISK_INT_reg ),
        .I2(Q[0]),
        .I3(Q[2]),
        .I4(S_i_2_n_0),
        .O(K29p7));
  FDRE T_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(K29p7),
        .Q(T),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h7F0F)) 
    WAIT_FOR_K_i_1
       (.I0(K28p5_REG1),
        .I1(RXEVEN0_out),
        .I2(SYNC_STATUS_REG),
        .I3(WAIT_FOR_K),
        .O(WAIT_FOR_K_i_1_n_0));
  FDRE WAIT_FOR_K_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(WAIT_FOR_K_i_1_n_0),
        .Q(WAIT_FOR_K),
        .R(SYNC_STATUS_REG0));
endmodule

(* ORIG_REF_NAME = "SYNCHRONISE" *) 
module design_1_gig_ethernet_pcs_pma_0_0_SYNCHRONISE
   (RXEVEN0_out,
    RXSYNC_STATUS,
    SYNC_STATUS_REG0,
    EXTEND_reg,
    RX_RUDI_INVALID_REG_reg,
    SIGNAL_DETECT_MOD,
    userclk2,
    SR,
    \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISCOMMA_INT_reg ,
    LOOPBACK,
    K28p5_REG1,
    out,
    \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISK_INT_reg ,
    \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXBUFSTATUS_INT_reg[1] ,
    D,
    RXNOTINTABLE_INT,
    S2);
  output RXEVEN0_out;
  output RXSYNC_STATUS;
  output SYNC_STATUS_REG0;
  output EXTEND_reg;
  output RX_RUDI_INVALID_REG_reg;
  input SIGNAL_DETECT_MOD;
  input userclk2;
  input [0:0]SR;
  input \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISCOMMA_INT_reg ;
  input LOOPBACK;
  input K28p5_REG1;
  input out;
  input \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISK_INT_reg ;
  input \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXBUFSTATUS_INT_reg[1] ;
  input D;
  input RXNOTINTABLE_INT;
  input S2;

  wire D;
  wire EVEN_i_1_n_0;
  wire EXTEND_reg;
  wire \FSM_onehot_STATE[0]_i_1_n_0 ;
  wire \FSM_onehot_STATE[10]_i_1__0_n_0 ;
  wire \FSM_onehot_STATE[11]_i_1_n_0 ;
  wire \FSM_onehot_STATE[12]_i_1_n_0 ;
  wire \FSM_onehot_STATE[12]_i_2_n_0 ;
  wire \FSM_onehot_STATE[12]_i_3_n_0 ;
  wire \FSM_onehot_STATE[12]_i_4_n_0 ;
  wire \FSM_onehot_STATE[1]_i_1__0_n_0 ;
  wire \FSM_onehot_STATE[2]_i_1__0_n_0 ;
  wire \FSM_onehot_STATE[2]_i_2_n_0 ;
  wire \FSM_onehot_STATE[3]_i_1_n_0 ;
  wire \FSM_onehot_STATE[4]_i_1_n_0 ;
  wire \FSM_onehot_STATE[5]_i_1_n_0 ;
  wire \FSM_onehot_STATE[6]_i_1_n_0 ;
  wire \FSM_onehot_STATE[7]_i_1_n_0 ;
  wire \FSM_onehot_STATE[8]_i_1__0_n_0 ;
  wire \FSM_onehot_STATE[9]_i_1__0_n_0 ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_STATE_reg_n_0_[0] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_STATE_reg_n_0_[10] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_STATE_reg_n_0_[11] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_STATE_reg_n_0_[12] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_STATE_reg_n_0_[1] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_STATE_reg_n_0_[2] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_STATE_reg_n_0_[4] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_STATE_reg_n_0_[5] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_STATE_reg_n_0_[6] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_STATE_reg_n_0_[8] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_STATE_reg_n_0_[9] ;
  wire [1:0]GOOD_CGS;
  wire \GOOD_CGS[0]_i_1_n_0 ;
  wire \GOOD_CGS[1]_i_1_n_0 ;
  wire \GOOD_CGS[1]_i_2_n_0 ;
  wire \GOOD_CGS[1]_i_3_n_0 ;
  wire K28p5_REG1;
  wire LOOPBACK;
  wire RXEVEN0_out;
  wire RXNOTINTABLE_INT;
  wire RXSYNC_STATUS;
  wire RX_RUDI_INVALID_REG_reg;
  wire S2;
  wire SIGNAL_DETECT_MOD;
  wire SIGNAL_DETECT_REG;
  wire [0:0]SR;
  wire SYNC_STATUS_REG0;
  wire SYNC_STATUS_i_1_n_0;
  wire SYNC_STATUS_i_2_n_0;
  wire \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXBUFSTATUS_INT_reg[1] ;
  wire \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISCOMMA_INT_reg ;
  wire \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISK_INT_reg ;
  wire out;
  (* RTL_KEEP = "yes" *) wire p_0_in;
  (* RTL_KEEP = "yes" *) wire p_1_in;
  wire userclk2;

  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT3 #(
    .INIT(8'h4F)) 
    EVEN_i_1
       (.I0(RXSYNC_STATUS),
        .I1(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISCOMMA_INT_reg ),
        .I2(RXEVEN0_out),
        .O(EVEN_i_1_n_0));
  FDRE EVEN_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(EVEN_i_1_n_0),
        .Q(RXEVEN0_out),
        .R(SR));
  LUT6 #(
    .INIT(64'h0000000200000000)) 
    \FSM_onehot_STATE[0]_i_1 
       (.I0(\FSM_onehot_STATE_reg_n_0_[4] ),
        .I1(RXEVEN0_out),
        .I2(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXBUFSTATUS_INT_reg[1] ),
        .I3(D),
        .I4(RXNOTINTABLE_INT),
        .I5(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISCOMMA_INT_reg ),
        .O(\FSM_onehot_STATE[0]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \FSM_onehot_STATE[10]_i_1__0 
       (.I0(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISCOMMA_INT_reg ),
        .I1(\FSM_onehot_STATE_reg_n_0_[2] ),
        .O(\FSM_onehot_STATE[10]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'h54554444)) 
    \FSM_onehot_STATE[11]_i_1 
       (.I0(\FSM_onehot_STATE[12]_i_3_n_0 ),
        .I1(\FSM_onehot_STATE_reg_n_0_[9] ),
        .I2(GOOD_CGS[0]),
        .I3(GOOD_CGS[1]),
        .I4(\FSM_onehot_STATE_reg_n_0_[11] ),
        .O(\FSM_onehot_STATE[11]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hAB)) 
    \FSM_onehot_STATE[12]_i_1 
       (.I0(SR),
        .I1(SIGNAL_DETECT_REG),
        .I2(LOOPBACK),
        .O(\FSM_onehot_STATE[12]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0F0F0F040F040F04)) 
    \FSM_onehot_STATE[12]_i_2 
       (.I0(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISK_INT_reg ),
        .I1(p_0_in),
        .I2(\FSM_onehot_STATE[12]_i_3_n_0 ),
        .I3(\FSM_onehot_STATE_reg_n_0_[12] ),
        .I4(\FSM_onehot_STATE[12]_i_4_n_0 ),
        .I5(\FSM_onehot_STATE_reg_n_0_[11] ),
        .O(\FSM_onehot_STATE[12]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFEFFFC)) 
    \FSM_onehot_STATE[12]_i_3 
       (.I0(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISCOMMA_INT_reg ),
        .I1(RXNOTINTABLE_INT),
        .I2(D),
        .I3(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXBUFSTATUS_INT_reg[1] ),
        .I4(RXEVEN0_out),
        .O(\FSM_onehot_STATE[12]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \FSM_onehot_STATE[12]_i_4 
       (.I0(GOOD_CGS[1]),
        .I1(GOOD_CGS[0]),
        .O(\FSM_onehot_STATE[12]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h000300BB000000AA)) 
    \FSM_onehot_STATE[1]_i_1__0 
       (.I0(\FSM_onehot_STATE_reg_n_0_[1] ),
        .I1(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISK_INT_reg ),
        .I2(RXEVEN0_out),
        .I3(S2),
        .I4(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISCOMMA_INT_reg ),
        .I5(\FSM_onehot_STATE_reg_n_0_[0] ),
        .O(\FSM_onehot_STATE[1]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFEFEFE00)) 
    \FSM_onehot_STATE[2]_i_1__0 
       (.I0(\FSM_onehot_STATE_reg_n_0_[10] ),
        .I1(\FSM_onehot_STATE_reg_n_0_[0] ),
        .I2(p_0_in),
        .I3(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISK_INT_reg ),
        .I4(\FSM_onehot_STATE[12]_i_3_n_0 ),
        .I5(\FSM_onehot_STATE[2]_i_2_n_0 ),
        .O(\FSM_onehot_STATE[2]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFF4F44444444)) 
    \FSM_onehot_STATE[2]_i_2 
       (.I0(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISCOMMA_INT_reg ),
        .I1(\FSM_onehot_STATE_reg_n_0_[2] ),
        .I2(SYNC_STATUS_i_2_n_0),
        .I3(\FSM_onehot_STATE_reg_n_0_[1] ),
        .I4(\FSM_onehot_STATE_reg_n_0_[4] ),
        .I5(\FSM_onehot_STATE[12]_i_3_n_0 ),
        .O(\FSM_onehot_STATE[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000200000000)) 
    \FSM_onehot_STATE[3]_i_1 
       (.I0(\FSM_onehot_STATE_reg_n_0_[1] ),
        .I1(RXEVEN0_out),
        .I2(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXBUFSTATUS_INT_reg[1] ),
        .I3(D),
        .I4(RXNOTINTABLE_INT),
        .I5(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISCOMMA_INT_reg ),
        .O(\FSM_onehot_STATE[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h000010FF00001050)) 
    \FSM_onehot_STATE[4]_i_1 
       (.I0(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISK_INT_reg ),
        .I1(RXEVEN0_out),
        .I2(\FSM_onehot_STATE_reg_n_0_[10] ),
        .I3(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISCOMMA_INT_reg ),
        .I4(S2),
        .I5(\FSM_onehot_STATE_reg_n_0_[4] ),
        .O(\FSM_onehot_STATE[4]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h54554444)) 
    \FSM_onehot_STATE[5]_i_1 
       (.I0(\FSM_onehot_STATE[12]_i_3_n_0 ),
        .I1(p_1_in),
        .I2(GOOD_CGS[0]),
        .I3(GOOD_CGS[1]),
        .I4(\FSM_onehot_STATE_reg_n_0_[5] ),
        .O(\FSM_onehot_STATE[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFF0040404040)) 
    \FSM_onehot_STATE[6]_i_1 
       (.I0(GOOD_CGS[0]),
        .I1(GOOD_CGS[1]),
        .I2(\FSM_onehot_STATE_reg_n_0_[5] ),
        .I3(\FSM_onehot_STATE_reg_n_0_[9] ),
        .I4(\FSM_onehot_STATE_reg_n_0_[11] ),
        .I5(\FSM_onehot_STATE[12]_i_3_n_0 ),
        .O(\FSM_onehot_STATE[6]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hA8)) 
    \FSM_onehot_STATE[7]_i_1 
       (.I0(\FSM_onehot_STATE[12]_i_3_n_0 ),
        .I1(\FSM_onehot_STATE_reg_n_0_[8] ),
        .I2(\FSM_onehot_STATE_reg_n_0_[6] ),
        .O(\FSM_onehot_STATE[7]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h54554444)) 
    \FSM_onehot_STATE[8]_i_1__0 
       (.I0(\FSM_onehot_STATE[12]_i_3_n_0 ),
        .I1(\FSM_onehot_STATE_reg_n_0_[6] ),
        .I2(GOOD_CGS[0]),
        .I3(GOOD_CGS[1]),
        .I4(\FSM_onehot_STATE_reg_n_0_[8] ),
        .O(\FSM_onehot_STATE[8]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'h8B888888)) 
    \FSM_onehot_STATE[9]_i_1__0 
       (.I0(\FSM_onehot_STATE_reg_n_0_[12] ),
        .I1(\FSM_onehot_STATE[12]_i_3_n_0 ),
        .I2(GOOD_CGS[0]),
        .I3(GOOD_CGS[1]),
        .I4(\FSM_onehot_STATE_reg_n_0_[8] ),
        .O(\FSM_onehot_STATE[9]_i_1__0_n_0 ));
  (* FSM_ENCODED_STATES = "comma_detect_2:0000000000001,aquire_sync_2:0000000000010,aquire_sync_1:0000000010000,sync_acquired_4:0000010000000,sync_acquired_4a:0000000100000,sync_acquired_3a:0000100000000,comma_detect_1:0010000000000,loss_of_sync:0000000000100,sync_acquired_2:0001000000000,sync_acquired_3:0000001000000,sync_acquired_2a:0100000000000,sync_acquired_1:1000000000000,comma_detect_3:0000000001000" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_STATE_reg[0] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\FSM_onehot_STATE[0]_i_1_n_0 ),
        .Q(\FSM_onehot_STATE_reg_n_0_[0] ),
        .R(\FSM_onehot_STATE[12]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "comma_detect_2:0000000000001,aquire_sync_2:0000000000010,aquire_sync_1:0000000010000,sync_acquired_4:0000010000000,sync_acquired_4a:0000000100000,sync_acquired_3a:0000100000000,comma_detect_1:0010000000000,loss_of_sync:0000000000100,sync_acquired_2:0001000000000,sync_acquired_3:0000001000000,sync_acquired_2a:0100000000000,sync_acquired_1:1000000000000,comma_detect_3:0000000001000" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_STATE_reg[10] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\FSM_onehot_STATE[10]_i_1__0_n_0 ),
        .Q(\FSM_onehot_STATE_reg_n_0_[10] ),
        .R(\FSM_onehot_STATE[12]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "comma_detect_2:0000000000001,aquire_sync_2:0000000000010,aquire_sync_1:0000000010000,sync_acquired_4:0000010000000,sync_acquired_4a:0000000100000,sync_acquired_3a:0000100000000,comma_detect_1:0010000000000,loss_of_sync:0000000000100,sync_acquired_2:0001000000000,sync_acquired_3:0000001000000,sync_acquired_2a:0100000000000,sync_acquired_1:1000000000000,comma_detect_3:0000000001000" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_STATE_reg[11] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\FSM_onehot_STATE[11]_i_1_n_0 ),
        .Q(\FSM_onehot_STATE_reg_n_0_[11] ),
        .R(\FSM_onehot_STATE[12]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "comma_detect_2:0000000000001,aquire_sync_2:0000000000010,aquire_sync_1:0000000010000,sync_acquired_4:0000010000000,sync_acquired_4a:0000000100000,sync_acquired_3a:0000100000000,comma_detect_1:0010000000000,loss_of_sync:0000000000100,sync_acquired_2:0001000000000,sync_acquired_3:0000001000000,sync_acquired_2a:0100000000000,sync_acquired_1:1000000000000,comma_detect_3:0000000001000" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_STATE_reg[12] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\FSM_onehot_STATE[12]_i_2_n_0 ),
        .Q(\FSM_onehot_STATE_reg_n_0_[12] ),
        .R(\FSM_onehot_STATE[12]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "comma_detect_2:0000000000001,aquire_sync_2:0000000000010,aquire_sync_1:0000000010000,sync_acquired_4:0000010000000,sync_acquired_4a:0000000100000,sync_acquired_3a:0000100000000,comma_detect_1:0010000000000,loss_of_sync:0000000000100,sync_acquired_2:0001000000000,sync_acquired_3:0000001000000,sync_acquired_2a:0100000000000,sync_acquired_1:1000000000000,comma_detect_3:0000000001000" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_STATE_reg[1] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\FSM_onehot_STATE[1]_i_1__0_n_0 ),
        .Q(\FSM_onehot_STATE_reg_n_0_[1] ),
        .R(\FSM_onehot_STATE[12]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "comma_detect_2:0000000000001,aquire_sync_2:0000000000010,aquire_sync_1:0000000010000,sync_acquired_4:0000010000000,sync_acquired_4a:0000000100000,sync_acquired_3a:0000100000000,comma_detect_1:0010000000000,loss_of_sync:0000000000100,sync_acquired_2:0001000000000,sync_acquired_3:0000001000000,sync_acquired_2a:0100000000000,sync_acquired_1:1000000000000,comma_detect_3:0000000001000" *) 
  (* KEEP = "yes" *) 
  FDSE #(
    .INIT(1'b1)) 
    \FSM_onehot_STATE_reg[2] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\FSM_onehot_STATE[2]_i_1__0_n_0 ),
        .Q(\FSM_onehot_STATE_reg_n_0_[2] ),
        .S(\FSM_onehot_STATE[12]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "comma_detect_2:0000000000001,aquire_sync_2:0000000000010,aquire_sync_1:0000000010000,sync_acquired_4:0000010000000,sync_acquired_4a:0000000100000,sync_acquired_3a:0000100000000,comma_detect_1:0010000000000,loss_of_sync:0000000000100,sync_acquired_2:0001000000000,sync_acquired_3:0000001000000,sync_acquired_2a:0100000000000,sync_acquired_1:1000000000000,comma_detect_3:0000000001000" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_STATE_reg[3] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\FSM_onehot_STATE[3]_i_1_n_0 ),
        .Q(p_0_in),
        .R(\FSM_onehot_STATE[12]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "comma_detect_2:0000000000001,aquire_sync_2:0000000000010,aquire_sync_1:0000000010000,sync_acquired_4:0000010000000,sync_acquired_4a:0000000100000,sync_acquired_3a:0000100000000,comma_detect_1:0010000000000,loss_of_sync:0000000000100,sync_acquired_2:0001000000000,sync_acquired_3:0000001000000,sync_acquired_2a:0100000000000,sync_acquired_1:1000000000000,comma_detect_3:0000000001000" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_STATE_reg[4] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\FSM_onehot_STATE[4]_i_1_n_0 ),
        .Q(\FSM_onehot_STATE_reg_n_0_[4] ),
        .R(\FSM_onehot_STATE[12]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "comma_detect_2:0000000000001,aquire_sync_2:0000000000010,aquire_sync_1:0000000010000,sync_acquired_4:0000010000000,sync_acquired_4a:0000000100000,sync_acquired_3a:0000100000000,comma_detect_1:0010000000000,loss_of_sync:0000000000100,sync_acquired_2:0001000000000,sync_acquired_3:0000001000000,sync_acquired_2a:0100000000000,sync_acquired_1:1000000000000,comma_detect_3:0000000001000" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_STATE_reg[5] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\FSM_onehot_STATE[5]_i_1_n_0 ),
        .Q(\FSM_onehot_STATE_reg_n_0_[5] ),
        .R(\FSM_onehot_STATE[12]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "comma_detect_2:0000000000001,aquire_sync_2:0000000000010,aquire_sync_1:0000000010000,sync_acquired_4:0000010000000,sync_acquired_4a:0000000100000,sync_acquired_3a:0000100000000,comma_detect_1:0010000000000,loss_of_sync:0000000000100,sync_acquired_2:0001000000000,sync_acquired_3:0000001000000,sync_acquired_2a:0100000000000,sync_acquired_1:1000000000000,comma_detect_3:0000000001000" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_STATE_reg[6] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\FSM_onehot_STATE[6]_i_1_n_0 ),
        .Q(\FSM_onehot_STATE_reg_n_0_[6] ),
        .R(\FSM_onehot_STATE[12]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "comma_detect_2:0000000000001,aquire_sync_2:0000000000010,aquire_sync_1:0000000010000,sync_acquired_4:0000010000000,sync_acquired_4a:0000000100000,sync_acquired_3a:0000100000000,comma_detect_1:0010000000000,loss_of_sync:0000000000100,sync_acquired_2:0001000000000,sync_acquired_3:0000001000000,sync_acquired_2a:0100000000000,sync_acquired_1:1000000000000,comma_detect_3:0000000001000" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_STATE_reg[7] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\FSM_onehot_STATE[7]_i_1_n_0 ),
        .Q(p_1_in),
        .R(\FSM_onehot_STATE[12]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "comma_detect_2:0000000000001,aquire_sync_2:0000000000010,aquire_sync_1:0000000010000,sync_acquired_4:0000010000000,sync_acquired_4a:0000000100000,sync_acquired_3a:0000100000000,comma_detect_1:0010000000000,loss_of_sync:0000000000100,sync_acquired_2:0001000000000,sync_acquired_3:0000001000000,sync_acquired_2a:0100000000000,sync_acquired_1:1000000000000,comma_detect_3:0000000001000" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_STATE_reg[8] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\FSM_onehot_STATE[8]_i_1__0_n_0 ),
        .Q(\FSM_onehot_STATE_reg_n_0_[8] ),
        .R(\FSM_onehot_STATE[12]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "comma_detect_2:0000000000001,aquire_sync_2:0000000000010,aquire_sync_1:0000000010000,sync_acquired_4:0000010000000,sync_acquired_4a:0000000100000,sync_acquired_3a:0000100000000,comma_detect_1:0010000000000,loss_of_sync:0000000000100,sync_acquired_2:0001000000000,sync_acquired_3:0000001000000,sync_acquired_2a:0100000000000,sync_acquired_1:1000000000000,comma_detect_3:0000000001000" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_STATE_reg[9] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\FSM_onehot_STATE[9]_i_1__0_n_0 ),
        .Q(\FSM_onehot_STATE_reg_n_0_[9] ),
        .R(\FSM_onehot_STATE[12]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \GOOD_CGS[0]_i_1 
       (.I0(GOOD_CGS[0]),
        .O(\GOOD_CGS[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \GOOD_CGS[1]_i_1 
       (.I0(\FSM_onehot_STATE_reg_n_0_[6] ),
        .I1(SR),
        .I2(\FSM_onehot_STATE_reg_n_0_[9] ),
        .I3(p_1_in),
        .O(\GOOD_CGS[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00010003)) 
    \GOOD_CGS[1]_i_2 
       (.I0(RXEVEN0_out),
        .I1(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXBUFSTATUS_INT_reg[1] ),
        .I2(D),
        .I3(RXNOTINTABLE_INT),
        .I4(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISCOMMA_INT_reg ),
        .O(\GOOD_CGS[1]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \GOOD_CGS[1]_i_3 
       (.I0(GOOD_CGS[0]),
        .I1(GOOD_CGS[1]),
        .O(\GOOD_CGS[1]_i_3_n_0 ));
  FDRE \GOOD_CGS_reg[0] 
       (.C(userclk2),
        .CE(\GOOD_CGS[1]_i_2_n_0 ),
        .D(\GOOD_CGS[0]_i_1_n_0 ),
        .Q(GOOD_CGS[0]),
        .R(\GOOD_CGS[1]_i_1_n_0 ));
  FDRE \GOOD_CGS_reg[1] 
       (.C(userclk2),
        .CE(\GOOD_CGS[1]_i_2_n_0 ),
        .D(\GOOD_CGS[1]_i_3_n_0 ),
        .Q(GOOD_CGS[1]),
        .R(\GOOD_CGS[1]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    RX_DATA_ERROR_i_3
       (.I0(RXEVEN0_out),
        .I1(K28p5_REG1),
        .O(EXTEND_reg));
  LUT2 #(
    .INIT(4'hB)) 
    RX_RUDI_INVALID_REG_i_1
       (.I0(out),
        .I1(RXSYNC_STATUS),
        .O(RX_RUDI_INVALID_REG_reg));
  FDRE SIGNAL_DETECT_REG_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(SIGNAL_DETECT_MOD),
        .Q(SIGNAL_DETECT_REG),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT2 #(
    .INIT(4'hB)) 
    SYNC_STATUS_REG_i_1
       (.I0(SR),
        .I1(RXSYNC_STATUS),
        .O(SYNC_STATUS_REG0));
  LUT6 #(
    .INIT(64'h404050FF40405050)) 
    SYNC_STATUS_i_1
       (.I0(\FSM_onehot_STATE_reg_n_0_[2] ),
        .I1(SYNC_STATUS_i_2_n_0),
        .I2(RXSYNC_STATUS),
        .I3(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISK_INT_reg ),
        .I4(\FSM_onehot_STATE[12]_i_3_n_0 ),
        .I5(p_0_in),
        .O(SYNC_STATUS_i_1_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    SYNC_STATUS_i_2
       (.I0(p_1_in),
        .I1(\FSM_onehot_STATE_reg_n_0_[5] ),
        .O(SYNC_STATUS_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    SYNC_STATUS_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(SYNC_STATUS_i_1_n_0),
        .Q(RXSYNC_STATUS),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "TX" *) 
module design_1_gig_ethernet_pcs_pma_0_0_TX
   (XMIT_CONFIG_INT,
    Q,
    D,
    \USE_ROCKET_IO.TXCHARDISPMODE_reg ,
    \USE_ROCKET_IO.TXCHARISK_reg ,
    \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISK_INT_reg ,
    \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISCOMMA_INT_reg ,
    \USE_ROCKET_IO.TXDATA_reg[2] ,
    \USE_ROCKET_IO.TXDATA_reg[3] ,
    \USE_ROCKET_IO.TXDATA_reg[5] ,
    \USE_ROCKET_IO.TXDATA_reg[7] ,
    \USE_ROCKET_IO.TXCHARDISPVAL_reg ,
    \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg[7] ,
    \USE_ROCKET_IO.MGT_TX_RESET_INT_reg ,
    XMIT_CONFIG,
    userclk2,
    gmii_tx_en,
    gmii_tx_er,
    XMIT_DATA,
    \CONFIG_REG_WITH_AN.ISOLATE_REG_reg ,
    SR,
    LOOPBACK,
    gmii_txd,
    rxcharisk,
    rxchariscomma,
    rxdata,
    \TX_CONFIG_REG_INT_reg[14] );
  output XMIT_CONFIG_INT;
  output [0:0]Q;
  output [3:0]D;
  output \USE_ROCKET_IO.TXCHARDISPMODE_reg ;
  output \USE_ROCKET_IO.TXCHARISK_reg ;
  output \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISK_INT_reg ;
  output \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISCOMMA_INT_reg ;
  output \USE_ROCKET_IO.TXDATA_reg[2] ;
  output \USE_ROCKET_IO.TXDATA_reg[3] ;
  output \USE_ROCKET_IO.TXDATA_reg[5] ;
  output \USE_ROCKET_IO.TXDATA_reg[7] ;
  output \USE_ROCKET_IO.TXCHARDISPVAL_reg ;
  output [7:0]\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg[7] ;
  input [0:0]\USE_ROCKET_IO.MGT_TX_RESET_INT_reg ;
  input XMIT_CONFIG;
  input userclk2;
  input gmii_tx_en;
  input gmii_tx_er;
  input XMIT_DATA;
  input \CONFIG_REG_WITH_AN.ISOLATE_REG_reg ;
  input [0:0]SR;
  input LOOPBACK;
  input [7:0]gmii_txd;
  input [0:0]rxcharisk;
  input [0:0]rxchariscomma;
  input [7:0]rxdata;
  input [3:0]\TX_CONFIG_REG_INT_reg[14] ;

  wire C1_OR_C2_i_1_n_0;
  wire C1_OR_C2_reg_n_0;
  wire CODE_GRPISK;
  wire CODE_GRPISK_i_1_n_0;
  wire \CODE_GRP[0]_i_1_n_0 ;
  wire \CODE_GRP[0]_i_2_n_0 ;
  wire \CODE_GRP[1]_i_1_n_0 ;
  wire \CODE_GRP[1]_i_2_n_0 ;
  wire \CODE_GRP[2]_i_1_n_0 ;
  wire \CODE_GRP[2]_i_2_n_0 ;
  wire \CODE_GRP[3]_i_1_n_0 ;
  wire \CODE_GRP[3]_i_2_n_0 ;
  wire \CODE_GRP[4]_i_1_n_0 ;
  wire \CODE_GRP[5]_i_1_n_0 ;
  wire \CODE_GRP[6]_i_2_n_0 ;
  wire \CODE_GRP[7]_i_1_n_0 ;
  wire \CODE_GRP[7]_i_2_n_0 ;
  wire \CODE_GRP[7]_i_3_n_0 ;
  wire \CODE_GRP[7]_i_4_n_0 ;
  wire \CODE_GRP_CNT_reg_n_0_[1] ;
  wire \CODE_GRP_reg_n_0_[0] ;
  wire [6:0]CONFIG_DATA;
  wire \CONFIG_DATA_reg_n_0_[0] ;
  wire \CONFIG_DATA_reg_n_0_[1] ;
  wire \CONFIG_DATA_reg_n_0_[2] ;
  wire \CONFIG_DATA_reg_n_0_[3] ;
  wire \CONFIG_DATA_reg_n_0_[5] ;
  wire \CONFIG_DATA_reg_n_0_[6] ;
  wire CONFIG_K28p5;
  wire \CONFIG_REG_WITH_AN.ISOLATE_REG_reg ;
  wire [3:0]D;
  wire DISPARITY;
  wire INSERT_IDLE;
  wire INSERT_IDLE_i_1_n_0;
  wire INSERT_IDLE_reg_n_0;
  wire K28p5;
  wire K28p5_i_1_n_0;
  wire LOOPBACK;
  wire \NO_QSGMII_CHAR.TXCHARDISPVAL_i_1_n_0 ;
  wire \NO_QSGMII_DATA.TXDATA[0]_i_1_n_0 ;
  wire \NO_QSGMII_DATA.TXDATA[2]_i_1_n_0 ;
  wire \NO_QSGMII_DATA.TXDATA[4]_i_1_n_0 ;
  wire \NO_QSGMII_DATA.TXDATA[5]_i_1_n_0 ;
  wire \NO_QSGMII_DATA.TXDATA[6]_i_1_n_0 ;
  wire \NO_QSGMII_DATA.TXDATA[7]_i_1_n_0 ;
  wire \NO_QSGMII_DISP.DISPARITY_i_1_n_0 ;
  wire \NO_QSGMII_DISP.DISPARITY_i_2_n_0 ;
  wire \NO_QSGMII_DISP.DISPARITY_i_3_n_0 ;
  wire [0:0]Q;
  wire R;
  wire R_i_1__0_n_0;
  wire S;
  wire S0;
  wire [0:0]SR;
  wire SYNC_DISPARITY_i_1_n_0;
  wire SYNC_DISPARITY_reg_n_0;
  wire T;
  wire T0;
  wire TRIGGER_S;
  wire TRIGGER_S0;
  wire TRIGGER_T;
  wire TXCHARDISPMODE_INT;
  wire TXCHARDISPVAL;
  wire TXCHARISK_INT;
  wire [7:0]TXDATA;
  wire [7:0]TXD_REG1;
  wire [14:0]TX_CONFIG;
  wire [3:0]\TX_CONFIG_REG_INT_reg[14] ;
  wire TX_EN_REG1;
  wire TX_ER_REG1;
  wire TX_PACKET;
  wire TX_PACKET_REG1;
  wire TX_PACKET_i_1_n_0;
  wire [0:0]\USE_ROCKET_IO.MGT_TX_RESET_INT_reg ;
  wire \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISCOMMA_INT_reg ;
  wire \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISK_INT_reg ;
  wire [7:0]\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg[7] ;
  wire \USE_ROCKET_IO.TXCHARDISPMODE_reg ;
  wire \USE_ROCKET_IO.TXCHARDISPVAL_reg ;
  wire \USE_ROCKET_IO.TXCHARISK_reg ;
  wire \USE_ROCKET_IO.TXDATA_reg[2] ;
  wire \USE_ROCKET_IO.TXDATA_reg[3] ;
  wire \USE_ROCKET_IO.TXDATA_reg[5] ;
  wire \USE_ROCKET_IO.TXDATA_reg[7] ;
  wire V;
  wire V_i_1_n_0;
  wire V_i_2_n_0;
  wire V_i_3_n_0;
  wire V_i_4_n_0;
  wire V_i_5_n_0;
  wire V_i_6_n_0;
  wire XMIT_CONFIG;
  wire XMIT_CONFIG_INT;
  wire XMIT_DATA;
  wire XMIT_DATA_INT;
  wire XMIT_DATA_INT_reg_n_0;
  wire gmii_tx_en;
  wire gmii_tx_er;
  wire [7:0]gmii_txd;
  wire p_0_in;
  wire p_0_in16_in;
  wire p_0_in35_in;
  wire p_10_out;
  wire p_1_in;
  wire p_1_in1_in;
  wire p_1_in34_in;
  wire p_33_in;
  wire p_45_in;
  wire [1:0]plusOp;
  wire [0:0]rxchariscomma;
  wire [0:0]rxcharisk;
  wire [7:0]rxdata;
  wire userclk2;

  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT4 #(
    .INIT(16'h3F80)) 
    C1_OR_C2_i_1
       (.I0(XMIT_CONFIG_INT),
        .I1(\CODE_GRP_CNT_reg_n_0_[1] ),
        .I2(Q),
        .I3(C1_OR_C2_reg_n_0),
        .O(C1_OR_C2_i_1_n_0));
  FDRE C1_OR_C2_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(C1_OR_C2_i_1_n_0),
        .Q(C1_OR_C2_reg_n_0),
        .R(\USE_ROCKET_IO.MGT_TX_RESET_INT_reg ));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT4 #(
    .INIT(16'hFF08)) 
    CODE_GRPISK_i_1
       (.I0(XMIT_CONFIG_INT),
        .I1(Q),
        .I2(\CODE_GRP_CNT_reg_n_0_[1] ),
        .I3(\CODE_GRP[7]_i_1_n_0 ),
        .O(CODE_GRPISK_i_1_n_0));
  FDRE CODE_GRPISK_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(CODE_GRPISK_i_1_n_0),
        .Q(CODE_GRPISK),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hAFA0AFA3)) 
    \CODE_GRP[0]_i_1 
       (.I0(\CONFIG_DATA_reg_n_0_[0] ),
        .I1(\CODE_GRP[0]_i_2_n_0 ),
        .I2(XMIT_CONFIG_INT),
        .I3(S),
        .I4(V),
        .O(\CODE_GRP[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT4 #(
    .INIT(16'h0111)) 
    \CODE_GRP[0]_i_2 
       (.I0(R),
        .I1(T),
        .I2(TXD_REG1[0]),
        .I3(TX_PACKET),
        .O(\CODE_GRP[0]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hAFAFAFAC)) 
    \CODE_GRP[1]_i_1 
       (.I0(\CONFIG_DATA_reg_n_0_[1] ),
        .I1(\CODE_GRP[1]_i_2_n_0 ),
        .I2(XMIT_CONFIG_INT),
        .I3(S),
        .I4(V),
        .O(\CODE_GRP[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT5 #(
    .INIT(32'h000000F8)) 
    \CODE_GRP[1]_i_2 
       (.I0(TX_PACKET),
        .I1(TXD_REG1[1]),
        .I2(R),
        .I3(S),
        .I4(T),
        .O(\CODE_GRP[1]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hCFCE0302)) 
    \CODE_GRP[2]_i_1 
       (.I0(\CODE_GRP[2]_i_2_n_0 ),
        .I1(XMIT_CONFIG_INT),
        .I2(S),
        .I3(V),
        .I4(\CONFIG_DATA_reg_n_0_[2] ),
        .O(\CODE_GRP[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT4 #(
    .INIT(16'hFEFF)) 
    \CODE_GRP[2]_i_2 
       (.I0(R),
        .I1(T),
        .I2(TXD_REG1[2]),
        .I3(TX_PACKET),
        .O(\CODE_GRP[2]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hFFD0)) 
    \CODE_GRP[3]_i_1 
       (.I0(TX_PACKET),
        .I1(TXD_REG1[3]),
        .I2(\CODE_GRP[7]_i_4_n_0 ),
        .I3(\CODE_GRP[3]_i_2_n_0 ),
        .O(\CODE_GRP[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAFFFFFFFC)) 
    \CODE_GRP[3]_i_2 
       (.I0(\CONFIG_DATA_reg_n_0_[3] ),
        .I1(V),
        .I2(S),
        .I3(T),
        .I4(SR),
        .I5(XMIT_CONFIG_INT),
        .O(\CODE_GRP[3]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hF8888888)) 
    \CODE_GRP[4]_i_1 
       (.I0(\CONFIG_DATA_reg_n_0_[2] ),
        .I1(XMIT_CONFIG_INT),
        .I2(TX_PACKET),
        .I3(TXD_REG1[4]),
        .I4(\CODE_GRP[7]_i_4_n_0 ),
        .O(\CODE_GRP[4]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hF8888888)) 
    \CODE_GRP[5]_i_1 
       (.I0(\CONFIG_DATA_reg_n_0_[5] ),
        .I1(XMIT_CONFIG_INT),
        .I2(TX_PACKET),
        .I3(TXD_REG1[5]),
        .I4(\CODE_GRP[7]_i_4_n_0 ),
        .O(\CODE_GRP[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hD000DDDD)) 
    \CODE_GRP[6]_i_2 
       (.I0(XMIT_CONFIG_INT),
        .I1(\CONFIG_DATA_reg_n_0_[6] ),
        .I2(TX_PACKET),
        .I3(TXD_REG1[6]),
        .I4(\CODE_GRP[7]_i_4_n_0 ),
        .O(\CODE_GRP[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h5555555455555555)) 
    \CODE_GRP[7]_i_1 
       (.I0(XMIT_CONFIG_INT),
        .I1(R),
        .I2(\CODE_GRP[7]_i_3_n_0 ),
        .I3(V),
        .I4(SR),
        .I5(TX_PACKET),
        .O(\CODE_GRP[7]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hF8888888)) 
    \CODE_GRP[7]_i_2 
       (.I0(\CONFIG_DATA_reg_n_0_[2] ),
        .I1(XMIT_CONFIG_INT),
        .I2(TX_PACKET),
        .I3(TXD_REG1[7]),
        .I4(\CODE_GRP[7]_i_4_n_0 ),
        .O(\CODE_GRP[7]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \CODE_GRP[7]_i_3 
       (.I0(T),
        .I1(S),
        .O(\CODE_GRP[7]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h00000001)) 
    \CODE_GRP[7]_i_4 
       (.I0(V),
        .I1(S),
        .I2(XMIT_CONFIG_INT),
        .I3(R),
        .I4(T),
        .O(\CODE_GRP[7]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \CODE_GRP_CNT[0]_i_1 
       (.I0(Q),
        .O(plusOp[0]));
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \CODE_GRP_CNT[1]_i_1 
       (.I0(\CODE_GRP_CNT_reg_n_0_[1] ),
        .I1(Q),
        .O(plusOp[1]));
  FDSE \CODE_GRP_CNT_reg[0] 
       (.C(userclk2),
        .CE(1'b1),
        .D(plusOp[0]),
        .Q(Q),
        .S(\USE_ROCKET_IO.MGT_TX_RESET_INT_reg ));
  FDSE \CODE_GRP_CNT_reg[1] 
       (.C(userclk2),
        .CE(1'b1),
        .D(plusOp[1]),
        .Q(\CODE_GRP_CNT_reg_n_0_[1] ),
        .S(\USE_ROCKET_IO.MGT_TX_RESET_INT_reg ));
  FDRE \CODE_GRP_reg[0] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\CODE_GRP[0]_i_1_n_0 ),
        .Q(\CODE_GRP_reg_n_0_[0] ),
        .R(\CONFIG_REG_WITH_AN.ISOLATE_REG_reg ));
  FDRE \CODE_GRP_reg[1] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\CODE_GRP[1]_i_1_n_0 ),
        .Q(p_1_in),
        .R(\CONFIG_REG_WITH_AN.ISOLATE_REG_reg ));
  FDSE \CODE_GRP_reg[2] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\CODE_GRP[2]_i_1_n_0 ),
        .Q(p_0_in16_in),
        .S(\CONFIG_REG_WITH_AN.ISOLATE_REG_reg ));
  FDRE \CODE_GRP_reg[3] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\CODE_GRP[3]_i_1_n_0 ),
        .Q(p_0_in),
        .R(1'b0));
  FDSE \CODE_GRP_reg[4] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\CODE_GRP[4]_i_1_n_0 ),
        .Q(p_1_in1_in),
        .S(\CODE_GRP[7]_i_1_n_0 ));
  FDSE \CODE_GRP_reg[5] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\CODE_GRP[5]_i_1_n_0 ),
        .Q(p_1_in34_in),
        .S(\CODE_GRP[7]_i_1_n_0 ));
  FDRE \CODE_GRP_reg[6] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\CODE_GRP[6]_i_2_n_0 ),
        .Q(p_33_in),
        .R(\CONFIG_REG_WITH_AN.ISOLATE_REG_reg ));
  FDSE \CODE_GRP_reg[7] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\CODE_GRP[7]_i_2_n_0 ),
        .Q(p_0_in35_in),
        .S(\CODE_GRP[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT4 #(
    .INIT(16'h3404)) 
    \CONFIG_DATA[0]_i_1 
       (.I0(C1_OR_C2_reg_n_0),
        .I1(Q),
        .I2(\CODE_GRP_CNT_reg_n_0_[1] ),
        .I3(TX_CONFIG[0]),
        .O(CONFIG_DATA[0]));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \CONFIG_DATA[1]_i_1 
       (.I0(C1_OR_C2_reg_n_0),
        .I1(\CODE_GRP_CNT_reg_n_0_[1] ),
        .I2(Q),
        .O(CONFIG_DATA[1]));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT3 #(
    .INIT(8'h15)) 
    \CONFIG_DATA[2]_i_1 
       (.I0(\CODE_GRP_CNT_reg_n_0_[1] ),
        .I1(C1_OR_C2_reg_n_0),
        .I2(Q),
        .O(CONFIG_DATA[2]));
  LUT3 #(
    .INIT(8'h83)) 
    \CONFIG_DATA[3]_i_1 
       (.I0(TX_CONFIG[11]),
        .I1(Q),
        .I2(\CODE_GRP_CNT_reg_n_0_[1] ),
        .O(CONFIG_DATA[3]));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT4 #(
    .INIT(16'h883F)) 
    \CONFIG_DATA[5]_i_1 
       (.I0(TX_CONFIG[13]),
        .I1(Q),
        .I2(C1_OR_C2_reg_n_0),
        .I3(\CODE_GRP_CNT_reg_n_0_[1] ),
        .O(CONFIG_DATA[5]));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT4 #(
    .INIT(16'hE020)) 
    \CONFIG_DATA[6]_i_1 
       (.I0(C1_OR_C2_reg_n_0),
        .I1(\CODE_GRP_CNT_reg_n_0_[1] ),
        .I2(Q),
        .I3(TX_CONFIG[14]),
        .O(CONFIG_DATA[6]));
  FDRE \CONFIG_DATA_reg[0] 
       (.C(userclk2),
        .CE(1'b1),
        .D(CONFIG_DATA[0]),
        .Q(\CONFIG_DATA_reg_n_0_[0] ),
        .R(\USE_ROCKET_IO.MGT_TX_RESET_INT_reg ));
  FDRE \CONFIG_DATA_reg[1] 
       (.C(userclk2),
        .CE(1'b1),
        .D(CONFIG_DATA[1]),
        .Q(\CONFIG_DATA_reg_n_0_[1] ),
        .R(\USE_ROCKET_IO.MGT_TX_RESET_INT_reg ));
  FDRE \CONFIG_DATA_reg[2] 
       (.C(userclk2),
        .CE(1'b1),
        .D(CONFIG_DATA[2]),
        .Q(\CONFIG_DATA_reg_n_0_[2] ),
        .R(\USE_ROCKET_IO.MGT_TX_RESET_INT_reg ));
  FDRE \CONFIG_DATA_reg[3] 
       (.C(userclk2),
        .CE(1'b1),
        .D(CONFIG_DATA[3]),
        .Q(\CONFIG_DATA_reg_n_0_[3] ),
        .R(\USE_ROCKET_IO.MGT_TX_RESET_INT_reg ));
  FDRE \CONFIG_DATA_reg[5] 
       (.C(userclk2),
        .CE(1'b1),
        .D(CONFIG_DATA[5]),
        .Q(\CONFIG_DATA_reg_n_0_[5] ),
        .R(\USE_ROCKET_IO.MGT_TX_RESET_INT_reg ));
  FDRE \CONFIG_DATA_reg[6] 
       (.C(userclk2),
        .CE(1'b1),
        .D(CONFIG_DATA[6]),
        .Q(\CONFIG_DATA_reg_n_0_[6] ),
        .R(\USE_ROCKET_IO.MGT_TX_RESET_INT_reg ));
  FDRE CONFIG_K28p5_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(XMIT_DATA_INT),
        .Q(CONFIG_K28p5),
        .R(\USE_ROCKET_IO.MGT_TX_RESET_INT_reg ));
  LUT6 #(
    .INIT(64'h00000000FF00FF01)) 
    INSERT_IDLE_i_1
       (.I0(V),
        .I1(\CODE_GRP[7]_i_3_n_0 ),
        .I2(R),
        .I3(SR),
        .I4(TX_PACKET),
        .I5(XMIT_CONFIG_INT),
        .O(INSERT_IDLE_i_1_n_0));
  FDRE INSERT_IDLE_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(INSERT_IDLE_i_1_n_0),
        .Q(INSERT_IDLE_reg_n_0),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h8)) 
    K28p5_i_1
       (.I0(XMIT_CONFIG_INT),
        .I1(CONFIG_K28p5),
        .O(K28p5_i_1_n_0));
  FDRE K28p5_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(K28p5_i_1_n_0),
        .Q(K28p5),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \NO_QSGMII_CHAR.TXCHARDISPMODE_i_1 
       (.I0(SYNC_DISPARITY_reg_n_0),
        .I1(Q),
        .O(p_10_out));
  FDSE \NO_QSGMII_CHAR.TXCHARDISPMODE_reg 
       (.C(userclk2),
        .CE(1'b1),
        .D(p_10_out),
        .Q(TXCHARDISPMODE_INT),
        .S(\USE_ROCKET_IO.MGT_TX_RESET_INT_reg ));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \NO_QSGMII_CHAR.TXCHARDISPVAL_i_1 
       (.I0(Q),
        .I1(SYNC_DISPARITY_reg_n_0),
        .I2(DISPARITY),
        .O(\NO_QSGMII_CHAR.TXCHARDISPVAL_i_1_n_0 ));
  FDRE \NO_QSGMII_CHAR.TXCHARDISPVAL_reg 
       (.C(userclk2),
        .CE(1'b1),
        .D(\NO_QSGMII_CHAR.TXCHARDISPVAL_i_1_n_0 ),
        .Q(TXCHARDISPVAL),
        .R(\USE_ROCKET_IO.MGT_TX_RESET_INT_reg ));
  FDRE \NO_QSGMII_DATA.TXCHARISK_reg 
       (.C(userclk2),
        .CE(1'b1),
        .D(CODE_GRPISK),
        .Q(TXCHARISK_INT),
        .R(\NO_QSGMII_DATA.TXDATA[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h23332000)) 
    \NO_QSGMII_DATA.TXDATA[0]_i_1 
       (.I0(DISPARITY),
        .I1(\USE_ROCKET_IO.MGT_TX_RESET_INT_reg ),
        .I2(INSERT_IDLE_reg_n_0),
        .I3(Q),
        .I4(\CODE_GRP_reg_n_0_[0] ),
        .O(\NO_QSGMII_DATA.TXDATA[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h23332000)) 
    \NO_QSGMII_DATA.TXDATA[2]_i_1 
       (.I0(DISPARITY),
        .I1(\USE_ROCKET_IO.MGT_TX_RESET_INT_reg ),
        .I2(INSERT_IDLE_reg_n_0),
        .I3(Q),
        .I4(p_0_in16_in),
        .O(\NO_QSGMII_DATA.TXDATA[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT4 #(
    .INIT(16'h7F40)) 
    \NO_QSGMII_DATA.TXDATA[4]_i_1 
       (.I0(DISPARITY),
        .I1(Q),
        .I2(INSERT_IDLE_reg_n_0),
        .I3(p_1_in1_in),
        .O(\NO_QSGMII_DATA.TXDATA[4]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hEA)) 
    \NO_QSGMII_DATA.TXDATA[5]_i_1 
       (.I0(\USE_ROCKET_IO.MGT_TX_RESET_INT_reg ),
        .I1(INSERT_IDLE_reg_n_0),
        .I2(Q),
        .O(\NO_QSGMII_DATA.TXDATA[5]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h5540)) 
    \NO_QSGMII_DATA.TXDATA[6]_i_1 
       (.I0(\USE_ROCKET_IO.MGT_TX_RESET_INT_reg ),
        .I1(Q),
        .I2(INSERT_IDLE_reg_n_0),
        .I3(p_33_in),
        .O(\NO_QSGMII_DATA.TXDATA[6]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h23332000)) 
    \NO_QSGMII_DATA.TXDATA[7]_i_1 
       (.I0(DISPARITY),
        .I1(\USE_ROCKET_IO.MGT_TX_RESET_INT_reg ),
        .I2(INSERT_IDLE_reg_n_0),
        .I3(Q),
        .I4(p_0_in35_in),
        .O(\NO_QSGMII_DATA.TXDATA[7]_i_1_n_0 ));
  FDRE \NO_QSGMII_DATA.TXDATA_reg[0] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\NO_QSGMII_DATA.TXDATA[0]_i_1_n_0 ),
        .Q(TXDATA[0]),
        .R(1'b0));
  FDRE \NO_QSGMII_DATA.TXDATA_reg[1] 
       (.C(userclk2),
        .CE(1'b1),
        .D(p_1_in),
        .Q(TXDATA[1]),
        .R(\NO_QSGMII_DATA.TXDATA[5]_i_1_n_0 ));
  FDRE \NO_QSGMII_DATA.TXDATA_reg[2] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\NO_QSGMII_DATA.TXDATA[2]_i_1_n_0 ),
        .Q(TXDATA[2]),
        .R(1'b0));
  FDRE \NO_QSGMII_DATA.TXDATA_reg[3] 
       (.C(userclk2),
        .CE(1'b1),
        .D(p_0_in),
        .Q(TXDATA[3]),
        .R(\NO_QSGMII_DATA.TXDATA[5]_i_1_n_0 ));
  FDRE \NO_QSGMII_DATA.TXDATA_reg[4] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\NO_QSGMII_DATA.TXDATA[4]_i_1_n_0 ),
        .Q(TXDATA[4]),
        .R(\USE_ROCKET_IO.MGT_TX_RESET_INT_reg ));
  FDRE \NO_QSGMII_DATA.TXDATA_reg[5] 
       (.C(userclk2),
        .CE(1'b1),
        .D(p_1_in34_in),
        .Q(TXDATA[5]),
        .R(\NO_QSGMII_DATA.TXDATA[5]_i_1_n_0 ));
  FDRE \NO_QSGMII_DATA.TXDATA_reg[6] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\NO_QSGMII_DATA.TXDATA[6]_i_1_n_0 ),
        .Q(TXDATA[6]),
        .R(1'b0));
  FDRE \NO_QSGMII_DATA.TXDATA_reg[7] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\NO_QSGMII_DATA.TXDATA[7]_i_1_n_0 ),
        .Q(TXDATA[7]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0009090900F6F6F6)) 
    \NO_QSGMII_DISP.DISPARITY_i_1 
       (.I0(\NO_QSGMII_DISP.DISPARITY_i_2_n_0 ),
        .I1(\NO_QSGMII_DISP.DISPARITY_i_3_n_0 ),
        .I2(K28p5),
        .I3(INSERT_IDLE_reg_n_0),
        .I4(Q),
        .I5(DISPARITY),
        .O(\NO_QSGMII_DISP.DISPARITY_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h167E7EE8)) 
    \NO_QSGMII_DISP.DISPARITY_i_2 
       (.I0(p_1_in),
        .I1(\CODE_GRP_reg_n_0_[0] ),
        .I2(p_0_in16_in),
        .I3(p_0_in),
        .I4(p_1_in1_in),
        .O(\NO_QSGMII_DISP.DISPARITY_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h7C)) 
    \NO_QSGMII_DISP.DISPARITY_i_3 
       (.I0(p_0_in35_in),
        .I1(p_33_in),
        .I2(p_1_in34_in),
        .O(\NO_QSGMII_DISP.DISPARITY_i_3_n_0 ));
  FDSE \NO_QSGMII_DISP.DISPARITY_reg 
       (.C(userclk2),
        .CE(1'b1),
        .D(\NO_QSGMII_DISP.DISPARITY_i_1_n_0 ),
        .Q(DISPARITY),
        .S(\USE_ROCKET_IO.MGT_TX_RESET_INT_reg ));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT5 #(
    .INIT(32'hDDDCCCCC)) 
    R_i_1__0
       (.I0(S),
        .I1(T),
        .I2(TX_ER_REG1),
        .I3(Q),
        .I4(R),
        .O(R_i_1__0_n_0));
  FDRE R_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(R_i_1__0_n_0),
        .Q(R),
        .R(\USE_ROCKET_IO.MGT_TX_RESET_INT_reg ));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT4 #(
    .INIT(16'h2F20)) 
    SYNC_DISPARITY_i_1
       (.I0(Q),
        .I1(\CODE_GRP_CNT_reg_n_0_[1] ),
        .I2(XMIT_CONFIG_INT),
        .I3(INSERT_IDLE),
        .O(SYNC_DISPARITY_i_1_n_0));
  LUT6 #(
    .INIT(64'hCCCCCCCCCCCCCCCD)) 
    SYNC_DISPARITY_i_2
       (.I0(TX_PACKET),
        .I1(SR),
        .I2(R),
        .I3(T),
        .I4(S),
        .I5(V),
        .O(INSERT_IDLE));
  FDRE SYNC_DISPARITY_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(SYNC_DISPARITY_i_1_n_0),
        .Q(SYNC_DISPARITY_reg_n_0),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h8888A8AA88888888)) 
    S_i_1__0
       (.I0(XMIT_DATA_INT_reg_n_0),
        .I1(TRIGGER_S),
        .I2(TX_ER_REG1),
        .I3(Q),
        .I4(TX_EN_REG1),
        .I5(gmii_tx_en),
        .O(S0));
  FDRE S_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(S0),
        .Q(S),
        .R(\USE_ROCKET_IO.MGT_TX_RESET_INT_reg ));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT4 #(
    .INIT(16'h0400)) 
    TRIGGER_S_i_1
       (.I0(TX_EN_REG1),
        .I1(gmii_tx_en),
        .I2(TX_ER_REG1),
        .I3(Q),
        .O(TRIGGER_S0));
  FDRE TRIGGER_S_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(TRIGGER_S0),
        .Q(TRIGGER_S),
        .R(\USE_ROCKET_IO.MGT_TX_RESET_INT_reg ));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT2 #(
    .INIT(4'h2)) 
    TRIGGER_T_i_1
       (.I0(TX_EN_REG1),
        .I1(gmii_tx_en),
        .O(p_45_in));
  FDRE TRIGGER_T_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(p_45_in),
        .Q(TRIGGER_T),
        .R(\USE_ROCKET_IO.MGT_TX_RESET_INT_reg ));
  FDRE \TXD_REG1_reg[0] 
       (.C(userclk2),
        .CE(1'b1),
        .D(gmii_txd[0]),
        .Q(TXD_REG1[0]),
        .R(1'b0));
  FDRE \TXD_REG1_reg[1] 
       (.C(userclk2),
        .CE(1'b1),
        .D(gmii_txd[1]),
        .Q(TXD_REG1[1]),
        .R(1'b0));
  FDRE \TXD_REG1_reg[2] 
       (.C(userclk2),
        .CE(1'b1),
        .D(gmii_txd[2]),
        .Q(TXD_REG1[2]),
        .R(1'b0));
  FDRE \TXD_REG1_reg[3] 
       (.C(userclk2),
        .CE(1'b1),
        .D(gmii_txd[3]),
        .Q(TXD_REG1[3]),
        .R(1'b0));
  FDRE \TXD_REG1_reg[4] 
       (.C(userclk2),
        .CE(1'b1),
        .D(gmii_txd[4]),
        .Q(TXD_REG1[4]),
        .R(1'b0));
  FDRE \TXD_REG1_reg[5] 
       (.C(userclk2),
        .CE(1'b1),
        .D(gmii_txd[5]),
        .Q(TXD_REG1[5]),
        .R(1'b0));
  FDRE \TXD_REG1_reg[6] 
       (.C(userclk2),
        .CE(1'b1),
        .D(gmii_txd[6]),
        .Q(TXD_REG1[6]),
        .R(1'b0));
  FDRE \TXD_REG1_reg[7] 
       (.C(userclk2),
        .CE(1'b1),
        .D(gmii_txd[7]),
        .Q(TXD_REG1[7]),
        .R(1'b0));
  FDRE \TX_CONFIG_reg[0] 
       (.C(userclk2),
        .CE(XMIT_DATA_INT),
        .D(\TX_CONFIG_REG_INT_reg[14] [0]),
        .Q(TX_CONFIG[0]),
        .R(\USE_ROCKET_IO.MGT_TX_RESET_INT_reg ));
  FDRE \TX_CONFIG_reg[11] 
       (.C(userclk2),
        .CE(XMIT_DATA_INT),
        .D(\TX_CONFIG_REG_INT_reg[14] [1]),
        .Q(TX_CONFIG[11]),
        .R(\USE_ROCKET_IO.MGT_TX_RESET_INT_reg ));
  FDRE \TX_CONFIG_reg[13] 
       (.C(userclk2),
        .CE(XMIT_DATA_INT),
        .D(\TX_CONFIG_REG_INT_reg[14] [2]),
        .Q(TX_CONFIG[13]),
        .R(\USE_ROCKET_IO.MGT_TX_RESET_INT_reg ));
  FDRE \TX_CONFIG_reg[14] 
       (.C(userclk2),
        .CE(XMIT_DATA_INT),
        .D(\TX_CONFIG_REG_INT_reg[14] [3]),
        .Q(TX_CONFIG[14]),
        .R(\USE_ROCKET_IO.MGT_TX_RESET_INT_reg ));
  FDRE TX_EN_REG1_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(gmii_tx_en),
        .Q(TX_EN_REG1),
        .R(1'b0));
  FDRE TX_ER_REG1_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(gmii_tx_er),
        .Q(TX_ER_REG1),
        .R(1'b0));
  FDRE TX_PACKET_REG1_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(TX_PACKET),
        .Q(TX_PACKET_REG1),
        .R(\USE_ROCKET_IO.MGT_TX_RESET_INT_reg ));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT3 #(
    .INIT(8'hDC)) 
    TX_PACKET_i_1
       (.I0(T),
        .I1(S),
        .I2(TX_PACKET),
        .O(TX_PACKET_i_1_n_0));
  FDRE TX_PACKET_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(TX_PACKET_i_1_n_0),
        .Q(TX_PACKET),
        .R(\USE_ROCKET_IO.MGT_TX_RESET_INT_reg ));
  LUT6 #(
    .INIT(64'h88888888FFF88888)) 
    T_i_1
       (.I0(TRIGGER_T),
        .I1(V),
        .I2(S),
        .I3(TX_PACKET),
        .I4(TX_EN_REG1),
        .I5(gmii_tx_en),
        .O(T0));
  FDRE T_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(T0),
        .Q(T),
        .R(\USE_ROCKET_IO.MGT_TX_RESET_INT_reg ));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISCOMMA_INT_i_1 
       (.I0(TXCHARISK_INT),
        .I1(LOOPBACK),
        .I2(rxchariscomma),
        .O(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISCOMMA_INT_reg ));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISK_INT_i_1 
       (.I0(TXCHARISK_INT),
        .I1(LOOPBACK),
        .I2(rxcharisk),
        .O(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXCHARISK_INT_reg ));
  LUT3 #(
    .INIT(8'hB8)) 
    \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT[0]_i_1 
       (.I0(TXDATA[0]),
        .I1(LOOPBACK),
        .I2(rxdata[0]),
        .O(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg[7] [0]));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT[1]_i_1 
       (.I0(TXDATA[1]),
        .I1(LOOPBACK),
        .I2(rxdata[1]),
        .O(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg[7] [1]));
  (* SOFT_HLUTNM = "soft_lutpair82" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT[2]_i_1 
       (.I0(TXDATA[2]),
        .I1(LOOPBACK),
        .I2(rxdata[2]),
        .O(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg[7] [2]));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT[3]_i_1 
       (.I0(TXDATA[3]),
        .I1(LOOPBACK),
        .I2(rxdata[3]),
        .O(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg[7] [3]));
  (* SOFT_HLUTNM = "soft_lutpair82" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT[4]_i_1 
       (.I0(TXDATA[4]),
        .I1(LOOPBACK),
        .I2(rxdata[4]),
        .O(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg[7] [4]));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT[5]_i_1 
       (.I0(TXDATA[5]),
        .I1(LOOPBACK),
        .I2(rxdata[5]),
        .O(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg[7] [5]));
  (* SOFT_HLUTNM = "soft_lutpair81" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT[6]_i_1 
       (.I0(TXDATA[6]),
        .I1(LOOPBACK),
        .I2(rxdata[6]),
        .O(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg[7] [6]));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT[7]_i_1 
       (.I0(TXDATA[7]),
        .I1(LOOPBACK),
        .I2(rxdata[7]),
        .O(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXDATA_INT_reg[7] [7]));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \USE_ROCKET_IO.TXCHARDISPMODE_i_1 
       (.I0(Q),
        .I1(LOOPBACK),
        .I2(TXCHARDISPMODE_INT),
        .O(\USE_ROCKET_IO.TXCHARDISPMODE_reg ));
  (* SOFT_HLUTNM = "soft_lutpair81" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \USE_ROCKET_IO.TXCHARDISPVAL_i_1 
       (.I0(TXCHARDISPVAL),
        .I1(LOOPBACK),
        .I2(\USE_ROCKET_IO.MGT_TX_RESET_INT_reg ),
        .O(\USE_ROCKET_IO.TXCHARDISPVAL_reg ));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \USE_ROCKET_IO.TXCHARISK_i_1 
       (.I0(Q),
        .I1(LOOPBACK),
        .I2(TXCHARISK_INT),
        .O(\USE_ROCKET_IO.TXCHARISK_reg ));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \USE_ROCKET_IO.TXDATA[0]_i_1 
       (.I0(TXDATA[0]),
        .I1(LOOPBACK),
        .I2(\USE_ROCKET_IO.MGT_TX_RESET_INT_reg ),
        .O(D[0]));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \USE_ROCKET_IO.TXDATA[1]_i_1 
       (.I0(TXDATA[1]),
        .I1(LOOPBACK),
        .I2(\USE_ROCKET_IO.MGT_TX_RESET_INT_reg ),
        .O(D[1]));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \USE_ROCKET_IO.TXDATA[2]_i_1 
       (.I0(TXDATA[2]),
        .I1(LOOPBACK),
        .I2(\USE_ROCKET_IO.MGT_TX_RESET_INT_reg ),
        .O(\USE_ROCKET_IO.TXDATA_reg[2] ));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \USE_ROCKET_IO.TXDATA[3]_i_1 
       (.I0(TXDATA[3]),
        .I1(LOOPBACK),
        .I2(\USE_ROCKET_IO.MGT_TX_RESET_INT_reg ),
        .O(\USE_ROCKET_IO.TXDATA_reg[3] ));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT3 #(
    .INIT(8'h54)) 
    \USE_ROCKET_IO.TXDATA[4]_i_1 
       (.I0(\USE_ROCKET_IO.MGT_TX_RESET_INT_reg ),
        .I1(TXDATA[4]),
        .I2(LOOPBACK),
        .O(D[2]));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \USE_ROCKET_IO.TXDATA[5]_i_1 
       (.I0(TXDATA[5]),
        .I1(LOOPBACK),
        .I2(\USE_ROCKET_IO.MGT_TX_RESET_INT_reg ),
        .O(\USE_ROCKET_IO.TXDATA_reg[5] ));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT4 #(
    .INIT(16'h0074)) 
    \USE_ROCKET_IO.TXDATA[6]_i_1 
       (.I0(Q),
        .I1(LOOPBACK),
        .I2(TXDATA[6]),
        .I3(\USE_ROCKET_IO.MGT_TX_RESET_INT_reg ),
        .O(D[3]));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \USE_ROCKET_IO.TXDATA[7]_i_2 
       (.I0(TXDATA[7]),
        .I1(LOOPBACK),
        .I2(\USE_ROCKET_IO.MGT_TX_RESET_INT_reg ),
        .O(\USE_ROCKET_IO.TXDATA_reg[7] ));
  LUT3 #(
    .INIT(8'hEA)) 
    V_i_1
       (.I0(V_i_2_n_0),
        .I1(S),
        .I2(V),
        .O(V_i_1_n_0));
  LUT5 #(
    .INIT(32'h8888A8AA)) 
    V_i_2
       (.I0(XMIT_DATA_INT_reg_n_0),
        .I1(V_i_3_n_0),
        .I2(V_i_4_n_0),
        .I3(V_i_5_n_0),
        .I4(V_i_6_n_0),
        .O(V_i_2_n_0));
  LUT3 #(
    .INIT(8'h08)) 
    V_i_3
       (.I0(TX_EN_REG1),
        .I1(TX_ER_REG1),
        .I2(TX_PACKET_REG1),
        .O(V_i_3_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFDFF)) 
    V_i_4
       (.I0(gmii_txd[3]),
        .I1(gmii_txd[5]),
        .I2(gmii_txd[4]),
        .I3(gmii_txd[2]),
        .I4(gmii_txd[6]),
        .I5(gmii_txd[7]),
        .O(V_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT3 #(
    .INIT(8'h08)) 
    V_i_5
       (.I0(gmii_txd[1]),
        .I1(gmii_txd[0]),
        .I2(gmii_tx_en),
        .O(V_i_5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT3 #(
    .INIT(8'h5D)) 
    V_i_6
       (.I0(gmii_tx_er),
        .I1(gmii_tx_en),
        .I2(TX_PACKET),
        .O(V_i_6_n_0));
  FDRE V_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(V_i_1_n_0),
        .Q(V),
        .R(\USE_ROCKET_IO.MGT_TX_RESET_INT_reg ));
  LUT2 #(
    .INIT(4'h1)) 
    XMIT_CONFIG_INT_i_1
       (.I0(\CODE_GRP_CNT_reg_n_0_[1] ),
        .I1(Q),
        .O(XMIT_DATA_INT));
  FDSE XMIT_CONFIG_INT_reg
       (.C(userclk2),
        .CE(XMIT_DATA_INT),
        .D(XMIT_CONFIG),
        .Q(XMIT_CONFIG_INT),
        .S(\USE_ROCKET_IO.MGT_TX_RESET_INT_reg ));
  FDRE XMIT_DATA_INT_reg
       (.C(userclk2),
        .CE(XMIT_DATA_INT),
        .D(XMIT_DATA),
        .Q(XMIT_DATA_INT_reg_n_0),
        .R(\USE_ROCKET_IO.MGT_TX_RESET_INT_reg ));
endmodule

(* B_SHIFTER_ADDR = "10'b0101001110" *) (* C_1588 = "0" *) (* C_2_5G = "FALSE" *) 
(* C_COMPONENT_NAME = "design_1_gig_ethernet_pcs_pma_0_0" *) (* C_DYNAMIC_SWITCHING = "FALSE" *) (* C_ELABORATION_TRANSIENT_DIR = "BlankString" *) 
(* C_FAMILY = "kintexuplus" *) (* C_HAS_AN = "TRUE" *) (* C_HAS_AXIL = "FALSE" *) 
(* C_HAS_MDIO = "TRUE" *) (* C_HAS_TEMAC = "TRUE" *) (* C_IS_SGMII = "TRUE" *) 
(* C_RX_GMII_CLK = "TXOUTCLK" *) (* C_SGMII_FABRIC_BUFFER = "TRUE" *) (* C_SGMII_PHY_MODE = "FALSE" *) 
(* C_USE_LVDS = "TRUE" *) (* C_USE_TBI = "FALSE" *) (* C_USE_TRANSCEIVER = "FALSE" *) 
(* DowngradeIPIdentifiedWarnings = "yes" *) (* GT_RX_BYTE_WIDTH = "1" *) (* ORIG_REF_NAME = "gig_ethernet_pcs_pma_v16_1_3" *) 
module design_1_gig_ethernet_pcs_pma_0_0_gig_ethernet_pcs_pma_v16_1_3
   (reset,
    signal_detect,
    link_timer_value,
    link_timer_basex,
    link_timer_sgmii,
    rx_gt_nominal_latency,
    speed_is_10_100,
    speed_is_100,
    mgt_rx_reset,
    mgt_tx_reset,
    userclk,
    userclk2,
    dcm_locked,
    rxbufstatus,
    rxchariscomma,
    rxcharisk,
    rxclkcorcnt,
    rxdata,
    rxdisperr,
    rxnotintable,
    rxrundisp,
    txbuferr,
    powerdown,
    txchardispmode,
    txchardispval,
    txcharisk,
    txdata,
    enablealign,
    gtx_clk,
    tx_code_group,
    loc_ref,
    ewrap,
    rx_code_group0,
    rx_code_group1,
    pma_rx_clk0,
    pma_rx_clk1,
    en_cdet,
    gmii_txd,
    gmii_tx_en,
    gmii_tx_er,
    gmii_rxd,
    gmii_rx_dv,
    gmii_rx_er,
    gmii_isolate,
    an_interrupt,
    an_enable,
    speed_selection,
    phyad,
    mdc,
    mdio_in,
    mdio_out,
    mdio_tri,
    an_adv_config_vector,
    an_adv_config_val,
    an_restart_config,
    configuration_vector,
    configuration_valid,
    status_vector,
    basex_or_sgmii,
    drp_dclk,
    drp_req,
    drp_gnt,
    drp_den,
    drp_dwe,
    drp_drdy,
    drp_daddr,
    drp_di,
    drp_do,
    systemtimer_s_field,
    systemtimer_ns_field,
    correction_timer,
    rxrecclk,
    rxphy_s_field,
    rxphy_ns_field,
    rxphy_correction_timer,
    s_axi_aclk,
    s_axi_resetn,
    s_axi_awaddr,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wdata,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_araddr,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rvalid,
    s_axi_rready,
    reset_done);
  input reset;
  input signal_detect;
  input [9:0]link_timer_value;
  input [9:0]link_timer_basex;
  input [9:0]link_timer_sgmii;
  input [15:0]rx_gt_nominal_latency;
  input speed_is_10_100;
  input speed_is_100;
  output mgt_rx_reset;
  output mgt_tx_reset;
  input userclk;
  input userclk2;
  input dcm_locked;
  input [1:0]rxbufstatus;
  input [0:0]rxchariscomma;
  input [0:0]rxcharisk;
  input [2:0]rxclkcorcnt;
  input [7:0]rxdata;
  input [0:0]rxdisperr;
  input [0:0]rxnotintable;
  input [0:0]rxrundisp;
  input txbuferr;
  output powerdown;
  output txchardispmode;
  output txchardispval;
  output txcharisk;
  output [7:0]txdata;
  output enablealign;
  input gtx_clk;
  output [9:0]tx_code_group;
  output loc_ref;
  output ewrap;
  input [9:0]rx_code_group0;
  input [9:0]rx_code_group1;
  input pma_rx_clk0;
  input pma_rx_clk1;
  output en_cdet;
  input [7:0]gmii_txd;
  input gmii_tx_en;
  input gmii_tx_er;
  output [7:0]gmii_rxd;
  output gmii_rx_dv;
  output gmii_rx_er;
  output gmii_isolate;
  output an_interrupt;
  output an_enable;
  output [1:0]speed_selection;
  input [4:0]phyad;
  input mdc;
  input mdio_in;
  output mdio_out;
  output mdio_tri;
  input [15:0]an_adv_config_vector;
  input an_adv_config_val;
  input an_restart_config;
  input [4:0]configuration_vector;
  input configuration_valid;
  output [15:0]status_vector;
  input basex_or_sgmii;
  input drp_dclk;
  output drp_req;
  input drp_gnt;
  output drp_den;
  output drp_dwe;
  input drp_drdy;
  output [9:0]drp_daddr;
  output [15:0]drp_di;
  input [15:0]drp_do;
  input [47:0]systemtimer_s_field;
  input [31:0]systemtimer_ns_field;
  input [63:0]correction_timer;
  input rxrecclk;
  output [47:0]rxphy_s_field;
  output [31:0]rxphy_ns_field;
  output [63:0]rxphy_correction_timer;
  input s_axi_aclk;
  input s_axi_resetn;
  input [31:0]s_axi_awaddr;
  input s_axi_awvalid;
  output s_axi_awready;
  input [31:0]s_axi_wdata;
  input s_axi_wvalid;
  output s_axi_wready;
  output [1:0]s_axi_bresp;
  output s_axi_bvalid;
  input s_axi_bready;
  input [31:0]s_axi_araddr;
  input s_axi_arvalid;
  output s_axi_arready;
  output [31:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rvalid;
  input s_axi_rready;
  input reset_done;

  wire \<const0> ;
  wire an_interrupt;
  wire an_restart_config;
  wire configuration_valid;
  wire [4:0]configuration_vector;
  wire gmii_isolate;
  wire gmii_rx_dv;
  wire gmii_rx_er;
  wire [7:0]gmii_rxd;
  wire gmii_tx_en;
  wire gmii_tx_er;
  wire [7:0]gmii_txd;
  wire mdc;
  wire mdio_in;
  wire mdio_out;
  wire mdio_tri;
  wire mgt_rx_reset;
  wire mgt_tx_reset;
  wire [4:0]phyad;
  wire reset;
  wire [1:0]rxbufstatus;
  wire [0:0]rxchariscomma;
  wire [0:0]rxcharisk;
  wire [2:0]rxclkcorcnt;
  wire [7:0]rxdata;
  wire [0:0]rxdisperr;
  wire [0:0]rxnotintable;
  wire [0:0]rxrundisp;
  wire signal_detect;
  wire [13:0]\^status_vector ;
  wire txchardispmode;
  wire txchardispval;
  wire txcharisk;
  wire [7:0]txdata;
  wire userclk2;

  assign an_enable = \<const0> ;
  assign drp_daddr[9] = \<const0> ;
  assign drp_daddr[8] = \<const0> ;
  assign drp_daddr[7] = \<const0> ;
  assign drp_daddr[6] = \<const0> ;
  assign drp_daddr[5] = \<const0> ;
  assign drp_daddr[4] = \<const0> ;
  assign drp_daddr[3] = \<const0> ;
  assign drp_daddr[2] = \<const0> ;
  assign drp_daddr[1] = \<const0> ;
  assign drp_daddr[0] = \<const0> ;
  assign drp_den = \<const0> ;
  assign drp_di[15] = \<const0> ;
  assign drp_di[14] = \<const0> ;
  assign drp_di[13] = \<const0> ;
  assign drp_di[12] = \<const0> ;
  assign drp_di[11] = \<const0> ;
  assign drp_di[10] = \<const0> ;
  assign drp_di[9] = \<const0> ;
  assign drp_di[8] = \<const0> ;
  assign drp_di[7] = \<const0> ;
  assign drp_di[6] = \<const0> ;
  assign drp_di[5] = \<const0> ;
  assign drp_di[4] = \<const0> ;
  assign drp_di[3] = \<const0> ;
  assign drp_di[2] = \<const0> ;
  assign drp_di[1] = \<const0> ;
  assign drp_di[0] = \<const0> ;
  assign drp_dwe = \<const0> ;
  assign drp_req = \<const0> ;
  assign en_cdet = \<const0> ;
  assign enablealign = \<const0> ;
  assign ewrap = \<const0> ;
  assign loc_ref = \<const0> ;
  assign powerdown = \<const0> ;
  assign rxphy_correction_timer[63] = \<const0> ;
  assign rxphy_correction_timer[62] = \<const0> ;
  assign rxphy_correction_timer[61] = \<const0> ;
  assign rxphy_correction_timer[60] = \<const0> ;
  assign rxphy_correction_timer[59] = \<const0> ;
  assign rxphy_correction_timer[58] = \<const0> ;
  assign rxphy_correction_timer[57] = \<const0> ;
  assign rxphy_correction_timer[56] = \<const0> ;
  assign rxphy_correction_timer[55] = \<const0> ;
  assign rxphy_correction_timer[54] = \<const0> ;
  assign rxphy_correction_timer[53] = \<const0> ;
  assign rxphy_correction_timer[52] = \<const0> ;
  assign rxphy_correction_timer[51] = \<const0> ;
  assign rxphy_correction_timer[50] = \<const0> ;
  assign rxphy_correction_timer[49] = \<const0> ;
  assign rxphy_correction_timer[48] = \<const0> ;
  assign rxphy_correction_timer[47] = \<const0> ;
  assign rxphy_correction_timer[46] = \<const0> ;
  assign rxphy_correction_timer[45] = \<const0> ;
  assign rxphy_correction_timer[44] = \<const0> ;
  assign rxphy_correction_timer[43] = \<const0> ;
  assign rxphy_correction_timer[42] = \<const0> ;
  assign rxphy_correction_timer[41] = \<const0> ;
  assign rxphy_correction_timer[40] = \<const0> ;
  assign rxphy_correction_timer[39] = \<const0> ;
  assign rxphy_correction_timer[38] = \<const0> ;
  assign rxphy_correction_timer[37] = \<const0> ;
  assign rxphy_correction_timer[36] = \<const0> ;
  assign rxphy_correction_timer[35] = \<const0> ;
  assign rxphy_correction_timer[34] = \<const0> ;
  assign rxphy_correction_timer[33] = \<const0> ;
  assign rxphy_correction_timer[32] = \<const0> ;
  assign rxphy_correction_timer[31] = \<const0> ;
  assign rxphy_correction_timer[30] = \<const0> ;
  assign rxphy_correction_timer[29] = \<const0> ;
  assign rxphy_correction_timer[28] = \<const0> ;
  assign rxphy_correction_timer[27] = \<const0> ;
  assign rxphy_correction_timer[26] = \<const0> ;
  assign rxphy_correction_timer[25] = \<const0> ;
  assign rxphy_correction_timer[24] = \<const0> ;
  assign rxphy_correction_timer[23] = \<const0> ;
  assign rxphy_correction_timer[22] = \<const0> ;
  assign rxphy_correction_timer[21] = \<const0> ;
  assign rxphy_correction_timer[20] = \<const0> ;
  assign rxphy_correction_timer[19] = \<const0> ;
  assign rxphy_correction_timer[18] = \<const0> ;
  assign rxphy_correction_timer[17] = \<const0> ;
  assign rxphy_correction_timer[16] = \<const0> ;
  assign rxphy_correction_timer[15] = \<const0> ;
  assign rxphy_correction_timer[14] = \<const0> ;
  assign rxphy_correction_timer[13] = \<const0> ;
  assign rxphy_correction_timer[12] = \<const0> ;
  assign rxphy_correction_timer[11] = \<const0> ;
  assign rxphy_correction_timer[10] = \<const0> ;
  assign rxphy_correction_timer[9] = \<const0> ;
  assign rxphy_correction_timer[8] = \<const0> ;
  assign rxphy_correction_timer[7] = \<const0> ;
  assign rxphy_correction_timer[6] = \<const0> ;
  assign rxphy_correction_timer[5] = \<const0> ;
  assign rxphy_correction_timer[4] = \<const0> ;
  assign rxphy_correction_timer[3] = \<const0> ;
  assign rxphy_correction_timer[2] = \<const0> ;
  assign rxphy_correction_timer[1] = \<const0> ;
  assign rxphy_correction_timer[0] = \<const0> ;
  assign rxphy_ns_field[31] = \<const0> ;
  assign rxphy_ns_field[30] = \<const0> ;
  assign rxphy_ns_field[29] = \<const0> ;
  assign rxphy_ns_field[28] = \<const0> ;
  assign rxphy_ns_field[27] = \<const0> ;
  assign rxphy_ns_field[26] = \<const0> ;
  assign rxphy_ns_field[25] = \<const0> ;
  assign rxphy_ns_field[24] = \<const0> ;
  assign rxphy_ns_field[23] = \<const0> ;
  assign rxphy_ns_field[22] = \<const0> ;
  assign rxphy_ns_field[21] = \<const0> ;
  assign rxphy_ns_field[20] = \<const0> ;
  assign rxphy_ns_field[19] = \<const0> ;
  assign rxphy_ns_field[18] = \<const0> ;
  assign rxphy_ns_field[17] = \<const0> ;
  assign rxphy_ns_field[16] = \<const0> ;
  assign rxphy_ns_field[15] = \<const0> ;
  assign rxphy_ns_field[14] = \<const0> ;
  assign rxphy_ns_field[13] = \<const0> ;
  assign rxphy_ns_field[12] = \<const0> ;
  assign rxphy_ns_field[11] = \<const0> ;
  assign rxphy_ns_field[10] = \<const0> ;
  assign rxphy_ns_field[9] = \<const0> ;
  assign rxphy_ns_field[8] = \<const0> ;
  assign rxphy_ns_field[7] = \<const0> ;
  assign rxphy_ns_field[6] = \<const0> ;
  assign rxphy_ns_field[5] = \<const0> ;
  assign rxphy_ns_field[4] = \<const0> ;
  assign rxphy_ns_field[3] = \<const0> ;
  assign rxphy_ns_field[2] = \<const0> ;
  assign rxphy_ns_field[1] = \<const0> ;
  assign rxphy_ns_field[0] = \<const0> ;
  assign rxphy_s_field[47] = \<const0> ;
  assign rxphy_s_field[46] = \<const0> ;
  assign rxphy_s_field[45] = \<const0> ;
  assign rxphy_s_field[44] = \<const0> ;
  assign rxphy_s_field[43] = \<const0> ;
  assign rxphy_s_field[42] = \<const0> ;
  assign rxphy_s_field[41] = \<const0> ;
  assign rxphy_s_field[40] = \<const0> ;
  assign rxphy_s_field[39] = \<const0> ;
  assign rxphy_s_field[38] = \<const0> ;
  assign rxphy_s_field[37] = \<const0> ;
  assign rxphy_s_field[36] = \<const0> ;
  assign rxphy_s_field[35] = \<const0> ;
  assign rxphy_s_field[34] = \<const0> ;
  assign rxphy_s_field[33] = \<const0> ;
  assign rxphy_s_field[32] = \<const0> ;
  assign rxphy_s_field[31] = \<const0> ;
  assign rxphy_s_field[30] = \<const0> ;
  assign rxphy_s_field[29] = \<const0> ;
  assign rxphy_s_field[28] = \<const0> ;
  assign rxphy_s_field[27] = \<const0> ;
  assign rxphy_s_field[26] = \<const0> ;
  assign rxphy_s_field[25] = \<const0> ;
  assign rxphy_s_field[24] = \<const0> ;
  assign rxphy_s_field[23] = \<const0> ;
  assign rxphy_s_field[22] = \<const0> ;
  assign rxphy_s_field[21] = \<const0> ;
  assign rxphy_s_field[20] = \<const0> ;
  assign rxphy_s_field[19] = \<const0> ;
  assign rxphy_s_field[18] = \<const0> ;
  assign rxphy_s_field[17] = \<const0> ;
  assign rxphy_s_field[16] = \<const0> ;
  assign rxphy_s_field[15] = \<const0> ;
  assign rxphy_s_field[14] = \<const0> ;
  assign rxphy_s_field[13] = \<const0> ;
  assign rxphy_s_field[12] = \<const0> ;
  assign rxphy_s_field[11] = \<const0> ;
  assign rxphy_s_field[10] = \<const0> ;
  assign rxphy_s_field[9] = \<const0> ;
  assign rxphy_s_field[8] = \<const0> ;
  assign rxphy_s_field[7] = \<const0> ;
  assign rxphy_s_field[6] = \<const0> ;
  assign rxphy_s_field[5] = \<const0> ;
  assign rxphy_s_field[4] = \<const0> ;
  assign rxphy_s_field[3] = \<const0> ;
  assign rxphy_s_field[2] = \<const0> ;
  assign rxphy_s_field[1] = \<const0> ;
  assign rxphy_s_field[0] = \<const0> ;
  assign s_axi_arready = \<const0> ;
  assign s_axi_awready = \<const0> ;
  assign s_axi_bresp[1] = \<const0> ;
  assign s_axi_bresp[0] = \<const0> ;
  assign s_axi_bvalid = \<const0> ;
  assign s_axi_rdata[31] = \<const0> ;
  assign s_axi_rdata[30] = \<const0> ;
  assign s_axi_rdata[29] = \<const0> ;
  assign s_axi_rdata[28] = \<const0> ;
  assign s_axi_rdata[27] = \<const0> ;
  assign s_axi_rdata[26] = \<const0> ;
  assign s_axi_rdata[25] = \<const0> ;
  assign s_axi_rdata[24] = \<const0> ;
  assign s_axi_rdata[23] = \<const0> ;
  assign s_axi_rdata[22] = \<const0> ;
  assign s_axi_rdata[21] = \<const0> ;
  assign s_axi_rdata[20] = \<const0> ;
  assign s_axi_rdata[19] = \<const0> ;
  assign s_axi_rdata[18] = \<const0> ;
  assign s_axi_rdata[17] = \<const0> ;
  assign s_axi_rdata[16] = \<const0> ;
  assign s_axi_rdata[15] = \<const0> ;
  assign s_axi_rdata[14] = \<const0> ;
  assign s_axi_rdata[13] = \<const0> ;
  assign s_axi_rdata[12] = \<const0> ;
  assign s_axi_rdata[11] = \<const0> ;
  assign s_axi_rdata[10] = \<const0> ;
  assign s_axi_rdata[9] = \<const0> ;
  assign s_axi_rdata[8] = \<const0> ;
  assign s_axi_rdata[7] = \<const0> ;
  assign s_axi_rdata[6] = \<const0> ;
  assign s_axi_rdata[5] = \<const0> ;
  assign s_axi_rdata[4] = \<const0> ;
  assign s_axi_rdata[3] = \<const0> ;
  assign s_axi_rdata[2] = \<const0> ;
  assign s_axi_rdata[1] = \<const0> ;
  assign s_axi_rdata[0] = \<const0> ;
  assign s_axi_rresp[1] = \<const0> ;
  assign s_axi_rresp[0] = \<const0> ;
  assign s_axi_rvalid = \<const0> ;
  assign s_axi_wready = \<const0> ;
  assign speed_selection[1] = \<const0> ;
  assign speed_selection[0] = \<const0> ;
  assign status_vector[15] = \<const0> ;
  assign status_vector[14] = \<const0> ;
  assign status_vector[13:9] = \^status_vector [13:9];
  assign status_vector[8] = \<const0> ;
  assign status_vector[7:0] = \^status_vector [7:0];
  assign tx_code_group[9] = \<const0> ;
  assign tx_code_group[8] = \<const0> ;
  assign tx_code_group[7] = \<const0> ;
  assign tx_code_group[6] = \<const0> ;
  assign tx_code_group[5] = \<const0> ;
  assign tx_code_group[4] = \<const0> ;
  assign tx_code_group[3] = \<const0> ;
  assign tx_code_group[2] = \<const0> ;
  assign tx_code_group[1] = \<const0> ;
  assign tx_code_group[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  design_1_gig_ethernet_pcs_pma_0_0_GPCS_PMA_GEN gpcs_pma_inst
       (.GMII_ISOLATE(gmii_isolate),
        .MGT_RX_RESET(mgt_rx_reset),
        .MGT_TX_RESET(mgt_tx_reset),
        .an_interrupt(an_interrupt),
        .an_restart_config(an_restart_config),
        .configuration_valid(configuration_valid),
        .configuration_vector(configuration_vector),
        .gmii_rx_dv(gmii_rx_dv),
        .gmii_rx_er(gmii_rx_er),
        .gmii_rxd(gmii_rxd),
        .gmii_tx_en(gmii_tx_en),
        .gmii_tx_er(gmii_tx_er),
        .gmii_txd(gmii_txd),
        .mdc(mdc),
        .mdio_in(mdio_in),
        .mdio_out(mdio_out),
        .mdio_tri(mdio_tri),
        .phyad(phyad),
        .reset(reset),
        .rxbufstatus(rxbufstatus[1]),
        .rxchariscomma(rxchariscomma),
        .rxcharisk(rxcharisk),
        .rxclkcorcnt({rxclkcorcnt[2],rxclkcorcnt[0]}),
        .rxdata(rxdata),
        .rxdisperr(rxdisperr),
        .rxnotintable(rxnotintable),
        .rxrundisp(rxrundisp),
        .signal_detect(signal_detect),
        .status_vector({\^status_vector [13:9],\^status_vector [7:0]}),
        .txchardispmode(txchardispmode),
        .txchardispval(txchardispval),
        .txcharisk(txcharisk),
        .txdata(txdata),
        .userclk2(userclk2));
endmodule

(* ORIG_REF_NAME = "reset_sync_block" *) 
module design_1_gig_ethernet_pcs_pma_0_0_reset_sync_block
   (p_3_out,
    SOFT_RESET,
    userclk2,
    reset);
  output p_3_out;
  input SOFT_RESET;
  input userclk2;
  input reset;

  wire SOFT_RESET;
  wire p_3_out;
  wire reset;
  wire reset_out;
  wire reset_sync_reg1;
  wire reset_sync_reg2;
  wire reset_sync_reg3;
  wire reset_sync_reg4;
  wire reset_sync_reg5;
  wire userclk2;

  LUT2 #(
    .INIT(4'hE)) 
    \MGT_RESET.RESET_INT_PIPE_i_1 
       (.I0(reset_out),
        .I1(SOFT_RESET),
        .O(p_3_out));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync1
       (.C(userclk2),
        .CE(1'b1),
        .D(1'b0),
        .PRE(reset),
        .Q(reset_sync_reg1));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync2
       (.C(userclk2),
        .CE(1'b1),
        .D(reset_sync_reg1),
        .PRE(reset),
        .Q(reset_sync_reg2));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync3
       (.C(userclk2),
        .CE(1'b1),
        .D(reset_sync_reg2),
        .PRE(reset),
        .Q(reset_sync_reg3));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync4
       (.C(userclk2),
        .CE(1'b1),
        .D(reset_sync_reg3),
        .PRE(reset),
        .Q(reset_sync_reg4));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync5
       (.C(userclk2),
        .CE(1'b1),
        .D(reset_sync_reg4),
        .PRE(reset),
        .Q(reset_sync_reg5));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync6
       (.C(userclk2),
        .CE(1'b1),
        .D(reset_sync_reg5),
        .PRE(1'b0),
        .Q(reset_out));
endmodule

(* ORIG_REF_NAME = "reset_sync_block" *) 
module design_1_gig_ethernet_pcs_pma_0_0_reset_sync_block_22
   (p_6_out,
    reset_out,
    reset);
  output p_6_out;
  input reset_out;
  input reset;

  wire p_5_in;
  wire p_6_out;
  wire reset;
  wire reset_out;
  wire reset_sync_reg1;
  wire reset_sync_reg2;
  wire reset_sync_reg3;
  wire reset_sync_reg4;
  wire reset_sync_reg5;

  LUT2 #(
    .INIT(4'hE)) 
    \MGT_RESET.RESET_INT_PIPE_RXRECCLK_i_1 
       (.I0(p_5_in),
        .I1(reset_out),
        .O(p_6_out));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync1
       (.C(1'b0),
        .CE(1'b1),
        .D(1'b0),
        .PRE(reset),
        .Q(reset_sync_reg1));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync2
       (.C(1'b0),
        .CE(1'b1),
        .D(reset_sync_reg1),
        .PRE(reset),
        .Q(reset_sync_reg2));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync3
       (.C(1'b0),
        .CE(1'b1),
        .D(reset_sync_reg2),
        .PRE(reset),
        .Q(reset_sync_reg3));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync4
       (.C(1'b0),
        .CE(1'b1),
        .D(reset_sync_reg3),
        .PRE(reset),
        .Q(reset_sync_reg4));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync5
       (.C(1'b0),
        .CE(1'b1),
        .D(reset_sync_reg4),
        .PRE(reset),
        .Q(reset_sync_reg5));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync6
       (.C(1'b0),
        .CE(1'b1),
        .D(reset_sync_reg5),
        .PRE(1'b0),
        .Q(p_5_in));
endmodule

(* ORIG_REF_NAME = "reset_sync_block" *) 
module design_1_gig_ethernet_pcs_pma_0_0_reset_sync_block_23
   (reset_out,
    SOFT_RESET);
  output reset_out;
  input SOFT_RESET;

  wire SOFT_RESET;
  wire reset_out;
  wire reset_sync_reg1;
  wire reset_sync_reg2;
  wire reset_sync_reg3;
  wire reset_sync_reg4;
  wire reset_sync_reg5;

  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync1
       (.C(1'b0),
        .CE(1'b1),
        .D(1'b0),
        .PRE(SOFT_RESET),
        .Q(reset_sync_reg1));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync2
       (.C(1'b0),
        .CE(1'b1),
        .D(reset_sync_reg1),
        .PRE(SOFT_RESET),
        .Q(reset_sync_reg2));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync3
       (.C(1'b0),
        .CE(1'b1),
        .D(reset_sync_reg2),
        .PRE(SOFT_RESET),
        .Q(reset_sync_reg3));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync4
       (.C(1'b0),
        .CE(1'b1),
        .D(reset_sync_reg3),
        .PRE(SOFT_RESET),
        .Q(reset_sync_reg4));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync5
       (.C(1'b0),
        .CE(1'b1),
        .D(reset_sync_reg4),
        .PRE(SOFT_RESET),
        .Q(reset_sync_reg5));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync6
       (.C(1'b0),
        .CE(1'b1),
        .D(reset_sync_reg5),
        .PRE(1'b0),
        .Q(reset_out));
endmodule

(* ORIG_REF_NAME = "sync_block" *) 
module design_1_gig_ethernet_pcs_pma_0_0_sync_block
   (\MASK_RUDI_BUFERR_TIMER_reg[12] ,
    data_out,
    SIGNAL_DETECT_MOD,
    \CONFIG_REG_WITH_AN.POWERDOWN_REG_reg ,
    \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXBUFSTATUS_INT_reg[1] ,
    \MASK_RUDI_BUFERR_TIMER_reg[3] ,
    signal_detect,
    userclk2);
  output \MASK_RUDI_BUFERR_TIMER_reg[12] ;
  output data_out;
  output SIGNAL_DETECT_MOD;
  input \CONFIG_REG_WITH_AN.POWERDOWN_REG_reg ;
  input \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXBUFSTATUS_INT_reg[1] ;
  input \MASK_RUDI_BUFERR_TIMER_reg[3] ;
  input signal_detect;
  input userclk2;

  wire \CONFIG_REG_WITH_AN.POWERDOWN_REG_reg ;
  wire \MASK_RUDI_BUFERR_TIMER_reg[12] ;
  wire \MASK_RUDI_BUFERR_TIMER_reg[3] ;
  wire SIGNAL_DETECT_MOD;
  wire \USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXBUFSTATUS_INT_reg[1] ;
  wire data_out;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;
  wire signal_detect;
  wire userclk2;

  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT4 #(
    .INIT(16'h20FF)) 
    \MASK_RUDI_BUFERR_TIMER[12]_i_1 
       (.I0(data_out),
        .I1(\CONFIG_REG_WITH_AN.POWERDOWN_REG_reg ),
        .I2(\USE_ROCKET_IO.NO_1588.RECLOCK_MGT_SIGNALS_TXOUTCLK.RXBUFSTATUS_INT_reg[1] ),
        .I3(\MASK_RUDI_BUFERR_TIMER_reg[3] ),
        .O(\MASK_RUDI_BUFERR_TIMER_reg[12] ));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT2 #(
    .INIT(4'h2)) 
    SIGNAL_DETECT_REG_i_1
       (.I0(data_out),
        .I1(\CONFIG_REG_WITH_AN.POWERDOWN_REG_reg ),
        .O(SIGNAL_DETECT_MOD));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg1
       (.C(userclk2),
        .CE(1'b1),
        .D(signal_detect),
        .Q(data_sync1),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg2
       (.C(userclk2),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg3
       (.C(userclk2),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg4
       (.C(userclk2),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg5
       (.C(userclk2),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg6
       (.C(userclk2),
        .CE(1'b1),
        .D(data_sync5),
        .Q(data_out),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "sync_block" *) 
module design_1_gig_ethernet_pcs_pma_0_0_sync_block_24
   (MDC_RISING_REG10,
    data_out,
    MDC_REG3,
    mdc,
    userclk2);
  output MDC_RISING_REG10;
  output data_out;
  input MDC_REG3;
  input mdc;
  input userclk2;

  wire MDC_REG3;
  wire MDC_RISING_REG10;
  wire data_out;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;
  wire mdc;
  wire userclk2;

  LUT2 #(
    .INIT(4'h2)) 
    MDC_RISING_REG1_i_1
       (.I0(data_out),
        .I1(MDC_REG3),
        .O(MDC_RISING_REG10));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg1
       (.C(userclk2),
        .CE(1'b1),
        .D(mdc),
        .Q(data_sync1),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg2
       (.C(userclk2),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg3
       (.C(userclk2),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg4
       (.C(userclk2),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg5
       (.C(userclk2),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg6
       (.C(userclk2),
        .CE(1'b1),
        .D(data_sync5),
        .Q(data_out),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "sync_block" *) 
module design_1_gig_ethernet_pcs_pma_0_0_sync_block_25
   (data_out,
    mdio_in,
    userclk2);
  output data_out;
  input mdio_in;
  input userclk2;

  wire data_out;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;
  wire mdio_in;
  wire userclk2;

  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg1
       (.C(userclk2),
        .CE(1'b1),
        .D(mdio_in),
        .Q(data_sync1),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg2
       (.C(userclk2),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg3
       (.C(userclk2),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg4
       (.C(userclk2),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg5
       (.C(userclk2),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg6
       (.C(userclk2),
        .CE(1'b1),
        .D(data_sync5),
        .Q(data_out),
        .R(1'b0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
