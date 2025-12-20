// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Tue Dec 16 21:52:39 2025
// Host        : Dragon3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_fifo_generator_0_14/MainDesign_fifo_generator_0_14_sim_netlist.v
// Design      : MainDesign_fifo_generator_0_14
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "MainDesign_fifo_generator_0_14,fifo_generator_v13_2_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_14,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module MainDesign_fifo_generator_0_14
   (srst,
    wr_clk,
    rd_clk,
    din,
    wr_en,
    rd_en,
    dout,
    full,
    empty,
    prog_full,
    wr_rst_busy,
    rd_rst_busy);
  input srst;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 write_clk CLK" *) (* x_interface_mode = "slave write_clk" *) (* x_interface_parameter = "XIL_INTERFACENAME write_clk, FREQ_HZ 125000000, FREQ_TOLERANCE_HZ 0, PHASE 0, CLK_DOMAIN MainDesign_gig_ethernet_pcs_pma_0_0_clk125_out, INSERT_VIP 0" *) input wr_clk;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 read_clk CLK" *) (* x_interface_mode = "slave read_clk" *) (* x_interface_parameter = "XIL_INTERFACENAME read_clk, FREQ_HZ 333250000, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0" *) input rd_clk;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) (* x_interface_mode = "slave FIFO_WRITE" *) input [31:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) (* x_interface_mode = "slave FIFO_READ" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [31:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;
  output prog_full;
  output wr_rst_busy;
  output rd_rst_busy;

  wire [31:0]din;
  wire [31:0]dout;
  wire empty;
  wire full;
  wire prog_full;
  wire rd_clk;
  wire rd_en;
  wire rd_rst_busy;
  wire srst;
  wire wr_clk;
  wire wr_en;
  wire wr_rst_busy;
  wire NLW_U0_almost_empty_UNCONNECTED;
  wire NLW_U0_almost_full_UNCONNECTED;
  wire NLW_U0_axi_ar_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_overflow_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_full_UNCONNECTED;
  wire NLW_U0_axi_ar_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_underflow_UNCONNECTED;
  wire NLW_U0_axi_aw_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_overflow_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_full_UNCONNECTED;
  wire NLW_U0_axi_aw_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_underflow_UNCONNECTED;
  wire NLW_U0_axi_b_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_overflow_UNCONNECTED;
  wire NLW_U0_axi_b_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_b_prog_full_UNCONNECTED;
  wire NLW_U0_axi_b_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_underflow_UNCONNECTED;
  wire NLW_U0_axi_r_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_overflow_UNCONNECTED;
  wire NLW_U0_axi_r_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_r_prog_full_UNCONNECTED;
  wire NLW_U0_axi_r_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_underflow_UNCONNECTED;
  wire NLW_U0_axi_w_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_overflow_UNCONNECTED;
  wire NLW_U0_axi_w_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_w_prog_full_UNCONNECTED;
  wire NLW_U0_axi_w_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_underflow_UNCONNECTED;
  wire NLW_U0_axis_dbiterr_UNCONNECTED;
  wire NLW_U0_axis_overflow_UNCONNECTED;
  wire NLW_U0_axis_prog_empty_UNCONNECTED;
  wire NLW_U0_axis_prog_full_UNCONNECTED;
  wire NLW_U0_axis_sbiterr_UNCONNECTED;
  wire NLW_U0_axis_underflow_UNCONNECTED;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_m_axi_arvalid_UNCONNECTED;
  wire NLW_U0_m_axi_awvalid_UNCONNECTED;
  wire NLW_U0_m_axi_bready_UNCONNECTED;
  wire NLW_U0_m_axi_rready_UNCONNECTED;
  wire NLW_U0_m_axi_wlast_UNCONNECTED;
  wire NLW_U0_m_axi_wvalid_UNCONNECTED;
  wire NLW_U0_m_axis_tlast_UNCONNECTED;
  wire NLW_U0_m_axis_tvalid_UNCONNECTED;
  wire NLW_U0_overflow_UNCONNECTED;
  wire NLW_U0_prog_empty_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_s_axis_tready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire NLW_U0_underflow_UNCONNECTED;
  wire NLW_U0_valid_UNCONNECTED;
  wire NLW_U0_wr_ack_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_wr_data_count_UNCONNECTED;
  wire [8:0]NLW_U0_data_count_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_araddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_arburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_arlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_aruser_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_awaddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_awburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_awlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awuser_UNCONNECTED;
  wire [63:0]NLW_U0_m_axi_wdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_wstrb_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wuser_UNCONNECTED;
  wire [7:0]NLW_U0_m_axis_tdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tdest_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tid_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tkeep_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tstrb_UNCONNECTED;
  wire [3:0]NLW_U0_m_axis_tuser_UNCONNECTED;
  wire [8:0]NLW_U0_rd_data_count_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_buser_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_ruser_UNCONNECTED;
  wire [8:0]NLW_U0_wr_data_count_UNCONNECTED;

  (* C_ADD_NGC_CONSTRAINT = "0" *) 
  (* C_APPLICATION_TYPE_AXIS = "0" *) 
  (* C_APPLICATION_TYPE_RACH = "0" *) 
  (* C_APPLICATION_TYPE_RDCH = "0" *) 
  (* C_APPLICATION_TYPE_WACH = "0" *) 
  (* C_APPLICATION_TYPE_WDCH = "0" *) 
  (* C_APPLICATION_TYPE_WRCH = "0" *) 
  (* C_AXIS_TDATA_WIDTH = "8" *) 
  (* C_AXIS_TDEST_WIDTH = "1" *) 
  (* C_AXIS_TID_WIDTH = "1" *) 
  (* C_AXIS_TKEEP_WIDTH = "1" *) 
  (* C_AXIS_TSTRB_WIDTH = "1" *) 
  (* C_AXIS_TUSER_WIDTH = "4" *) 
  (* C_AXIS_TYPE = "0" *) 
  (* C_AXI_ADDR_WIDTH = "32" *) 
  (* C_AXI_ARUSER_WIDTH = "1" *) 
  (* C_AXI_AWUSER_WIDTH = "1" *) 
  (* C_AXI_BUSER_WIDTH = "1" *) 
  (* C_AXI_DATA_WIDTH = "64" *) 
  (* C_AXI_ID_WIDTH = "1" *) 
  (* C_AXI_LEN_WIDTH = "8" *) 
  (* C_AXI_LOCK_WIDTH = "1" *) 
  (* C_AXI_RUSER_WIDTH = "1" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_AXI_WUSER_WIDTH = "1" *) 
  (* C_COMMON_CLOCK = "0" *) 
  (* C_COUNT_TYPE = "0" *) 
  (* C_DATA_COUNT_WIDTH = "9" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "32" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "1" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "32" *) 
  (* C_ENABLE_RLOCS = "0" *) 
  (* C_ENABLE_RST_SYNC = "1" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_ERROR_INJECTION_TYPE = "0" *) 
  (* C_ERROR_INJECTION_TYPE_AXIS = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
  (* C_FAMILY = "kintexuplus" *) 
  (* C_FULL_FLAGS_RST_VAL = "0" *) 
  (* C_HAS_ALMOST_EMPTY = "0" *) 
  (* C_HAS_ALMOST_FULL = "0" *) 
  (* C_HAS_AXIS_TDATA = "1" *) 
  (* C_HAS_AXIS_TDEST = "0" *) 
  (* C_HAS_AXIS_TID = "0" *) 
  (* C_HAS_AXIS_TKEEP = "0" *) 
  (* C_HAS_AXIS_TLAST = "0" *) 
  (* C_HAS_AXIS_TREADY = "1" *) 
  (* C_HAS_AXIS_TSTRB = "0" *) 
  (* C_HAS_AXIS_TUSER = "1" *) 
  (* C_HAS_AXI_ARUSER = "0" *) 
  (* C_HAS_AXI_AWUSER = "0" *) 
  (* C_HAS_AXI_BUSER = "0" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_AXI_RD_CHANNEL = "1" *) 
  (* C_HAS_AXI_RUSER = "0" *) 
  (* C_HAS_AXI_WR_CHANNEL = "1" *) 
  (* C_HAS_AXI_WUSER = "0" *) 
  (* C_HAS_BACKUP = "0" *) 
  (* C_HAS_DATA_COUNT = "0" *) 
  (* C_HAS_DATA_COUNTS_AXIS = "0" *) 
  (* C_HAS_DATA_COUNTS_RACH = "0" *) 
  (* C_HAS_DATA_COUNTS_RDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WACH = "0" *) 
  (* C_HAS_DATA_COUNTS_WDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WRCH = "0" *) 
  (* C_HAS_INT_CLK = "0" *) 
  (* C_HAS_MASTER_CE = "0" *) 
  (* C_HAS_MEMINIT_FILE = "0" *) 
  (* C_HAS_OVERFLOW = "0" *) 
  (* C_HAS_PROG_FLAGS_AXIS = "0" *) 
  (* C_HAS_PROG_FLAGS_RACH = "0" *) 
  (* C_HAS_PROG_FLAGS_RDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WACH = "0" *) 
  (* C_HAS_PROG_FLAGS_WDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WRCH = "0" *) 
  (* C_HAS_RD_DATA_COUNT = "0" *) 
  (* C_HAS_RD_RST = "0" *) 
  (* C_HAS_RST = "0" *) 
  (* C_HAS_SLAVE_CE = "0" *) 
  (* C_HAS_SRST = "1" *) 
  (* C_HAS_UNDERFLOW = "0" *) 
  (* C_HAS_VALID = "0" *) 
  (* C_HAS_WR_ACK = "0" *) 
  (* C_HAS_WR_DATA_COUNT = "0" *) 
  (* C_HAS_WR_RST = "0" *) 
  (* C_IMPLEMENTATION_TYPE = "6" *) 
  (* C_IMPLEMENTATION_TYPE_AXIS = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WRCH = "1" *) 
  (* C_INIT_WR_PNTR_VAL = "0" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_MEMORY_TYPE = "4" *) 
  (* C_MIF_FILE_NAME = "BlankString" *) 
  (* C_MSGON_VAL = "1" *) 
  (* C_OPTIMIZATION_MODE = "0" *) 
  (* C_OVERFLOW_LOW = "0" *) 
  (* C_POWER_SAVING_MODE = "0" *) 
  (* C_PRELOAD_LATENCY = "0" *) 
  (* C_PRELOAD_REGS = "1" *) 
  (* C_PRIM_FIFO_TYPE = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_AXIS = "1kx18" *) 
  (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_RDCH = "512x72" *) 
  (* C_PRIM_FIFO_TYPE_WACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_WDCH = "512x72" *) 
  (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "6" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "7" *) 
  (* C_PROG_EMPTY_TYPE = "0" *) 
  (* C_PROG_EMPTY_TYPE_AXIS = "0" *) 
  (* C_PROG_EMPTY_TYPE_RACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "509" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "508" *) 
  (* C_PROG_FULL_TYPE = "1" *) 
  (* C_PROG_FULL_TYPE_AXIS = "0" *) 
  (* C_PROG_FULL_TYPE_RACH = "0" *) 
  (* C_PROG_FULL_TYPE_RDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WACH = "0" *) 
  (* C_PROG_FULL_TYPE_WDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WRCH = "0" *) 
  (* C_RACH_TYPE = "0" *) 
  (* C_RDCH_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "9" *) 
  (* C_RD_DEPTH = "512" *) 
  (* C_RD_FREQ = "333" *) 
  (* C_RD_PNTR_WIDTH = "9" *) 
  (* C_REG_SLICE_MODE_AXIS = "0" *) 
  (* C_REG_SLICE_MODE_RACH = "0" *) 
  (* C_REG_SLICE_MODE_RDCH = "0" *) 
  (* C_REG_SLICE_MODE_WACH = "0" *) 
  (* C_REG_SLICE_MODE_WDCH = "0" *) 
  (* C_REG_SLICE_MODE_WRCH = "0" *) 
  (* C_SELECT_XPM = "0" *) 
  (* C_SYNCHRONIZER_STAGE = "2" *) 
  (* C_UNDERFLOW_LOW = "0" *) 
  (* C_USE_COMMON_OVERFLOW = "0" *) 
  (* C_USE_COMMON_UNDERFLOW = "0" *) 
  (* C_USE_DEFAULT_SETTINGS = "0" *) 
  (* C_USE_DOUT_RST = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_ECC_AXIS = "0" *) 
  (* C_USE_ECC_RACH = "0" *) 
  (* C_USE_ECC_RDCH = "0" *) 
  (* C_USE_ECC_WACH = "0" *) 
  (* C_USE_ECC_WDCH = "0" *) 
  (* C_USE_ECC_WRCH = "0" *) 
  (* C_USE_EMBEDDED_REG = "0" *) 
  (* C_USE_FIFO16_FLAGS = "0" *) 
  (* C_USE_FWFT_DATA_COUNT = "0" *) 
  (* C_USE_PIPELINE_REG = "0" *) 
  (* C_VALID_LOW = "0" *) 
  (* C_WACH_TYPE = "0" *) 
  (* C_WDCH_TYPE = "0" *) 
  (* C_WRCH_TYPE = "0" *) 
  (* C_WR_ACK_LOW = "0" *) 
  (* C_WR_DATA_COUNT_WIDTH = "9" *) 
  (* C_WR_DEPTH = "512" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "125" *) 
  (* C_WR_PNTR_WIDTH = "9" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  (* is_du_within_envelope = "true" *) 
  MainDesign_fifo_generator_0_14_fifo_generator_v13_2_14 U0
       (.almost_empty(NLW_U0_almost_empty_UNCONNECTED),
        .almost_full(NLW_U0_almost_full_UNCONNECTED),
        .axi_ar_data_count(NLW_U0_axi_ar_data_count_UNCONNECTED[4:0]),
        .axi_ar_dbiterr(NLW_U0_axi_ar_dbiterr_UNCONNECTED),
        .axi_ar_injectdbiterr(1'b0),
        .axi_ar_injectsbiterr(1'b0),
        .axi_ar_overflow(NLW_U0_axi_ar_overflow_UNCONNECTED),
        .axi_ar_prog_empty(NLW_U0_axi_ar_prog_empty_UNCONNECTED),
        .axi_ar_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_prog_full(NLW_U0_axi_ar_prog_full_UNCONNECTED),
        .axi_ar_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_rd_data_count(NLW_U0_axi_ar_rd_data_count_UNCONNECTED[4:0]),
        .axi_ar_sbiterr(NLW_U0_axi_ar_sbiterr_UNCONNECTED),
        .axi_ar_underflow(NLW_U0_axi_ar_underflow_UNCONNECTED),
        .axi_ar_wr_data_count(NLW_U0_axi_ar_wr_data_count_UNCONNECTED[4:0]),
        .axi_aw_data_count(NLW_U0_axi_aw_data_count_UNCONNECTED[4:0]),
        .axi_aw_dbiterr(NLW_U0_axi_aw_dbiterr_UNCONNECTED),
        .axi_aw_injectdbiterr(1'b0),
        .axi_aw_injectsbiterr(1'b0),
        .axi_aw_overflow(NLW_U0_axi_aw_overflow_UNCONNECTED),
        .axi_aw_prog_empty(NLW_U0_axi_aw_prog_empty_UNCONNECTED),
        .axi_aw_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_prog_full(NLW_U0_axi_aw_prog_full_UNCONNECTED),
        .axi_aw_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_rd_data_count(NLW_U0_axi_aw_rd_data_count_UNCONNECTED[4:0]),
        .axi_aw_sbiterr(NLW_U0_axi_aw_sbiterr_UNCONNECTED),
        .axi_aw_underflow(NLW_U0_axi_aw_underflow_UNCONNECTED),
        .axi_aw_wr_data_count(NLW_U0_axi_aw_wr_data_count_UNCONNECTED[4:0]),
        .axi_b_data_count(NLW_U0_axi_b_data_count_UNCONNECTED[4:0]),
        .axi_b_dbiterr(NLW_U0_axi_b_dbiterr_UNCONNECTED),
        .axi_b_injectdbiterr(1'b0),
        .axi_b_injectsbiterr(1'b0),
        .axi_b_overflow(NLW_U0_axi_b_overflow_UNCONNECTED),
        .axi_b_prog_empty(NLW_U0_axi_b_prog_empty_UNCONNECTED),
        .axi_b_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_prog_full(NLW_U0_axi_b_prog_full_UNCONNECTED),
        .axi_b_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_rd_data_count(NLW_U0_axi_b_rd_data_count_UNCONNECTED[4:0]),
        .axi_b_sbiterr(NLW_U0_axi_b_sbiterr_UNCONNECTED),
        .axi_b_underflow(NLW_U0_axi_b_underflow_UNCONNECTED),
        .axi_b_wr_data_count(NLW_U0_axi_b_wr_data_count_UNCONNECTED[4:0]),
        .axi_r_data_count(NLW_U0_axi_r_data_count_UNCONNECTED[10:0]),
        .axi_r_dbiterr(NLW_U0_axi_r_dbiterr_UNCONNECTED),
        .axi_r_injectdbiterr(1'b0),
        .axi_r_injectsbiterr(1'b0),
        .axi_r_overflow(NLW_U0_axi_r_overflow_UNCONNECTED),
        .axi_r_prog_empty(NLW_U0_axi_r_prog_empty_UNCONNECTED),
        .axi_r_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_prog_full(NLW_U0_axi_r_prog_full_UNCONNECTED),
        .axi_r_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_rd_data_count(NLW_U0_axi_r_rd_data_count_UNCONNECTED[10:0]),
        .axi_r_sbiterr(NLW_U0_axi_r_sbiterr_UNCONNECTED),
        .axi_r_underflow(NLW_U0_axi_r_underflow_UNCONNECTED),
        .axi_r_wr_data_count(NLW_U0_axi_r_wr_data_count_UNCONNECTED[10:0]),
        .axi_w_data_count(NLW_U0_axi_w_data_count_UNCONNECTED[10:0]),
        .axi_w_dbiterr(NLW_U0_axi_w_dbiterr_UNCONNECTED),
        .axi_w_injectdbiterr(1'b0),
        .axi_w_injectsbiterr(1'b0),
        .axi_w_overflow(NLW_U0_axi_w_overflow_UNCONNECTED),
        .axi_w_prog_empty(NLW_U0_axi_w_prog_empty_UNCONNECTED),
        .axi_w_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_prog_full(NLW_U0_axi_w_prog_full_UNCONNECTED),
        .axi_w_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_rd_data_count(NLW_U0_axi_w_rd_data_count_UNCONNECTED[10:0]),
        .axi_w_sbiterr(NLW_U0_axi_w_sbiterr_UNCONNECTED),
        .axi_w_underflow(NLW_U0_axi_w_underflow_UNCONNECTED),
        .axi_w_wr_data_count(NLW_U0_axi_w_wr_data_count_UNCONNECTED[10:0]),
        .axis_data_count(NLW_U0_axis_data_count_UNCONNECTED[10:0]),
        .axis_dbiterr(NLW_U0_axis_dbiterr_UNCONNECTED),
        .axis_injectdbiterr(1'b0),
        .axis_injectsbiterr(1'b0),
        .axis_overflow(NLW_U0_axis_overflow_UNCONNECTED),
        .axis_prog_empty(NLW_U0_axis_prog_empty_UNCONNECTED),
        .axis_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_prog_full(NLW_U0_axis_prog_full_UNCONNECTED),
        .axis_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_rd_data_count(NLW_U0_axis_rd_data_count_UNCONNECTED[10:0]),
        .axis_sbiterr(NLW_U0_axis_sbiterr_UNCONNECTED),
        .axis_underflow(NLW_U0_axis_underflow_UNCONNECTED),
        .axis_wr_data_count(NLW_U0_axis_wr_data_count_UNCONNECTED[10:0]),
        .backup(1'b0),
        .backup_marker(1'b0),
        .clk(1'b0),
        .data_count(NLW_U0_data_count_UNCONNECTED[8:0]),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .int_clk(1'b0),
        .m_aclk(1'b0),
        .m_aclk_en(1'b0),
        .m_axi_araddr(NLW_U0_m_axi_araddr_UNCONNECTED[31:0]),
        .m_axi_arburst(NLW_U0_m_axi_arburst_UNCONNECTED[1:0]),
        .m_axi_arcache(NLW_U0_m_axi_arcache_UNCONNECTED[3:0]),
        .m_axi_arid(NLW_U0_m_axi_arid_UNCONNECTED[0]),
        .m_axi_arlen(NLW_U0_m_axi_arlen_UNCONNECTED[7:0]),
        .m_axi_arlock(NLW_U0_m_axi_arlock_UNCONNECTED[0]),
        .m_axi_arprot(NLW_U0_m_axi_arprot_UNCONNECTED[2:0]),
        .m_axi_arqos(NLW_U0_m_axi_arqos_UNCONNECTED[3:0]),
        .m_axi_arready(1'b0),
        .m_axi_arregion(NLW_U0_m_axi_arregion_UNCONNECTED[3:0]),
        .m_axi_arsize(NLW_U0_m_axi_arsize_UNCONNECTED[2:0]),
        .m_axi_aruser(NLW_U0_m_axi_aruser_UNCONNECTED[0]),
        .m_axi_arvalid(NLW_U0_m_axi_arvalid_UNCONNECTED),
        .m_axi_awaddr(NLW_U0_m_axi_awaddr_UNCONNECTED[31:0]),
        .m_axi_awburst(NLW_U0_m_axi_awburst_UNCONNECTED[1:0]),
        .m_axi_awcache(NLW_U0_m_axi_awcache_UNCONNECTED[3:0]),
        .m_axi_awid(NLW_U0_m_axi_awid_UNCONNECTED[0]),
        .m_axi_awlen(NLW_U0_m_axi_awlen_UNCONNECTED[7:0]),
        .m_axi_awlock(NLW_U0_m_axi_awlock_UNCONNECTED[0]),
        .m_axi_awprot(NLW_U0_m_axi_awprot_UNCONNECTED[2:0]),
        .m_axi_awqos(NLW_U0_m_axi_awqos_UNCONNECTED[3:0]),
        .m_axi_awready(1'b0),
        .m_axi_awregion(NLW_U0_m_axi_awregion_UNCONNECTED[3:0]),
        .m_axi_awsize(NLW_U0_m_axi_awsize_UNCONNECTED[2:0]),
        .m_axi_awuser(NLW_U0_m_axi_awuser_UNCONNECTED[0]),
        .m_axi_awvalid(NLW_U0_m_axi_awvalid_UNCONNECTED),
        .m_axi_bid(1'b0),
        .m_axi_bready(NLW_U0_m_axi_bready_UNCONNECTED),
        .m_axi_bresp({1'b0,1'b0}),
        .m_axi_buser(1'b0),
        .m_axi_bvalid(1'b0),
        .m_axi_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi_rid(1'b0),
        .m_axi_rlast(1'b0),
        .m_axi_rready(NLW_U0_m_axi_rready_UNCONNECTED),
        .m_axi_rresp({1'b0,1'b0}),
        .m_axi_ruser(1'b0),
        .m_axi_rvalid(1'b0),
        .m_axi_wdata(NLW_U0_m_axi_wdata_UNCONNECTED[63:0]),
        .m_axi_wid(NLW_U0_m_axi_wid_UNCONNECTED[0]),
        .m_axi_wlast(NLW_U0_m_axi_wlast_UNCONNECTED),
        .m_axi_wready(1'b0),
        .m_axi_wstrb(NLW_U0_m_axi_wstrb_UNCONNECTED[7:0]),
        .m_axi_wuser(NLW_U0_m_axi_wuser_UNCONNECTED[0]),
        .m_axi_wvalid(NLW_U0_m_axi_wvalid_UNCONNECTED),
        .m_axis_tdata(NLW_U0_m_axis_tdata_UNCONNECTED[7:0]),
        .m_axis_tdest(NLW_U0_m_axis_tdest_UNCONNECTED[0]),
        .m_axis_tid(NLW_U0_m_axis_tid_UNCONNECTED[0]),
        .m_axis_tkeep(NLW_U0_m_axis_tkeep_UNCONNECTED[0]),
        .m_axis_tlast(NLW_U0_m_axis_tlast_UNCONNECTED),
        .m_axis_tready(1'b0),
        .m_axis_tstrb(NLW_U0_m_axis_tstrb_UNCONNECTED[0]),
        .m_axis_tuser(NLW_U0_m_axis_tuser_UNCONNECTED[3:0]),
        .m_axis_tvalid(NLW_U0_m_axis_tvalid_UNCONNECTED),
        .overflow(NLW_U0_overflow_UNCONNECTED),
        .prog_empty(NLW_U0_prog_empty_UNCONNECTED),
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full(prog_full),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(rd_clk),
        .rd_data_count(NLW_U0_rd_data_count_UNCONNECTED[8:0]),
        .rd_en(rd_en),
        .rd_rst(1'b0),
        .rd_rst_busy(rd_rst_busy),
        .rst(1'b0),
        .s_aclk(1'b0),
        .s_aclk_en(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arid(1'b0),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlock(1'b0),
        .s_axi_arprot({1'b0,1'b0,1'b0}),
        .s_axi_arqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_aruser(1'b0),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awid(1'b0),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlock(1'b0),
        .s_axi_awprot({1'b0,1'b0,1'b0}),
        .s_axi_awqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awuser(1'b0),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_buser(NLW_U0_s_axi_buser_UNCONNECTED[0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[63:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_ruser(NLW_U0_s_axi_ruser_UNCONNECTED[0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wid(1'b0),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wuser(1'b0),
        .s_axi_wvalid(1'b0),
        .s_axis_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tdest(1'b0),
        .s_axis_tid(1'b0),
        .s_axis_tkeep(1'b0),
        .s_axis_tlast(1'b0),
        .s_axis_tready(NLW_U0_s_axis_tready_UNCONNECTED),
        .s_axis_tstrb(1'b0),
        .s_axis_tuser({1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .sleep(1'b0),
        .srst(srst),
        .underflow(NLW_U0_underflow_UNCONNECTED),
        .valid(NLW_U0_valid_UNCONNECTED),
        .wr_ack(NLW_U0_wr_ack_UNCONNECTED),
        .wr_clk(wr_clk),
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[8:0]),
        .wr_en(wr_en),
        .wr_rst(1'b0),
        .wr_rst_busy(wr_rst_busy));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2025.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
UU0HctCtrDGjqiFgNj8KUV1CNrtLH1fzvWozH/S7aVj0RSc24esnSs0ybsApJYbLPSCW6MJRxlk8
TZTBIGKXHEs9iSJrHyeb7Q9LsfbX2O77j94jiFzmN8lM/LIVA6RCDBtX2LtKWWw0Ex0IvwdPy+Mg
2z4iCfTMzyceiAZWkhE=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
GF0Vw/gqBrc9IHG5aASlKQHzVjMUtBIwjnrAUquexOCvx+SSWyZN88WoE2YOio8l2Mng8jmA3ELb
iVwbk5kPsSQid3iLelRIejTGTCNP7ErmhAyw9N/gInxZrkBgF+99fwCp/qSFsRz+GkpjXlmNPLal
1m+CmI2mtQjH/zDmulZq9kFS9URMU7E3TrKSiNtdLMYc1ulwC3kFJ99geu/tuMfIrNOmA9KkJtnb
Zoy9fNs53bR+fUGBL5n7AwoO6cdU62PpktsyWXh1Gp6Ylf2HTT0CPMyzWbJQve0G4+iszllRawxG
r+FcAh4BuFpKqaFogcTloexA8MTZ9ICsGZkzkg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
Hzytw/FfXpsPrE5ZowzcEV+nwakl1BirWDR+Iseu9nWPYk6Otw/UyzdfMGdUJQcXxjn8eODJUMPS
SLvHyIbu8M+iaMMz4+lNG/o0csNo8MO67HX9fxa4xkVOaSOTCzBVfRk3cjnK+OAXlJEZO2/F0Im7
evCVwWE8mv0p9yv9NZA=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
aYTxAf85PVmpAktzX89uf9AJXAUs8FLk2gaAmaPtMQhfYN72ydFe5GcOlR9/W705GnhW+LSDUX2b
XQnSvIzmqRMwIqE2sgix0W4aZDvptNpP2y+gttAzQaOhAd12INExGFaZxKro7f/cey7YiwGKPPah
zcBWMoHI2bIhFDe04i/Jt1MdciCe1haFyhwBCett8eV6Laia/DlHOXxqH2bLukgGZp5p2EYoM0T8
WwuwxJ3X0IIphS/uP6nXSuuuMQcAplYzcG4PLCMpn2Lo3HwmwSo5w+0N1NFI5LYfb6ZrdTXjRH+j
oHZlteBZzQ+4jNx7/nPPCnuUB8IFMROek8y3aQ==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
e6jDiYnzLTYk/3jC49X3YNnxEmaFBYGO/cl88hMTKYq1FltlAtsDFs47xPVxcrXJmXB6FiDcQKgy
Zcri+H61avSebr0yHZ1uigtfwqLvcivJwyCmMK1zZ+tk95pu+v8wQUekejQwCfm8d4EwcPtFRBCP
VuiAB7kH68VA/rKSNW/L3Ck+PVdkE6HHJnrneJm4Aial7Xm5QOsroJRJU/ObInH0MO+tgwAysCdd
6eCmjEBFQGTjmThY8W79EF9AQGGRTMTJSajCB65vB7j4uMsw7y2m2q5T1cf5FapbNOa5qVGM3ltu
WzPHL8ffpwsn/Um4FxL0m2OELCU3vijgWPxyYg==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2025.1-2029.x", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
W4uYHM01gGeA2MU+ib2L/ExIRZJnY4G/4/BNSFnBkDMClm5bxdPZWGZhCUejE4JXBUBzvBBii0hv
o/qn9snazl844XvvPfn0rjgdMjBDDTUc14EhQ+t9LtnZFAV+z3wAIKGQaUOt5C451j/28rPyPkS0
kBiQMKRYL8V8HYzz8PJCw/2pMZh5nAGYlHVN7x7BRfHg/eGLL9Vxje7mRSIq9oPfHNxp9KvTPnEz
BAbFFeUiH6gtQHgv3loUdp74IXW+8+uJHlh0BbE4crWkB23UetPNvBTz30q+iGUe+Uy9cDako55V
AVXIMgciLrWVPF+qY5b7zySQkB4Xsfj+udkVyA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
R0MJeGCQpSjYsGBWKKr56ZJi8ovYpLtniBxpCnrQicvQybY+fnPA8Daj6MXdCf3qwLF8yF5WCJ8s
qgsZvXSLz7hwsKVEId08i3cpwMDSnKdPTNXjuKS2h7UKOlcr6QZ5j31qcO2XbyCffpn/pAXTmv3a
wywj0bLNK61+JY8v+VTzUKzR370hK34Ryuts+hg1InhuHxLuVnu52lVOpk/PYUaA+w7ORS7AIzBm
Ic2Gs+gCO56TT/kHzEdPXDOhyRk/LG0ir7xXNq7VYILxVh4t9QTZ+TIjutFAhElz9ceEjJ95QYy+
i58LiAOmyF9ID0yxSSYM4KQAF2bqt9kvgdWRhg==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
piBTg4FhL4gV7WxO2j/dIDXpMS0DVV+BCPbz6qHH74TfGEKWiiBMU6gK+ZbplwJNS8NHNyEzAlya
r4wgVpBFLdWysNz1JTSjKKJCO9JEQN5/H5jfiaYLOSRwE+N3Opc54BvT85yu1V+zTS+2aJj4AQ/f
gjyVCtr2A8YVv2zEjqFuQcYlcSxHTEk5eig4u36hHgzGJsmifFlP0OtE2NeoOMzFbBJe4LR9f1Ac
XQfLq8HilNwnOz4EYZGL9iJymjQ63NwSYfWcRjHVPPJXQFZSrWlI6V5kkz1/IDnPuelueoAKOk5K
OAAeaRjYDKgXhfse4B1Cy+u9f08zryJez9v+yfA14jVDkQQJp6a0qHJYuemefEFrmwJxSLUqG+Xq
QDK6/emEA9ZXoln0PNQyFzaEVDeFDZBn8LZi5SGL6f+TpO0acfI2jxa5+vCQHX/boxpyVjtxPh0W
Xjk7+E7CKFDmE6T/ZNnn7MRpaG1g4A2TEvSqCSRRnPprcg/+bRR6T6Sy

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
GlYhuN+XgK/dKipYGy0F51EWCsMzdTtEw7DUl9GCeVeyU6B0qQxd4o+WGLqPzleHUcbSjTY0Zsbn
PYVk3cx1yet4akcLytYAGFXC4n/Xi+1UqMz5TGn6+YQTvRIQ3rDpVCwwETOtxY9exyURa9vrZwN6
wg8aS7eaMRDPPrD9XOy8sQT0WrdKizBToFy2xoVRXceycyYYY7TdZikow1sCVE5Dsq8WQ5SRprGB
6XOvNlQnaIlUCVafx8nFv91VsM31btEViBrUpTqFHJAuoebt0ZL+JlrQ5nOk7XQnw6AQ+0ZlOKba
q3Ttg2CqLMLHVI+1yNiz+OEKhmPV1D5J7vlPQQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
2gbN0jz/o58BxZjM7+eT+qN7Q3qHE0g1JsI7dvdgaVydBYqQVWbzuiZYLMAHv8yrsn9b32oHcBSE
0o5Cui6GiD7neKU4AljBAlKAaN9vmM7TfUunNvBpRwv61T0jxsnbQPWfLrtpbTXbXa9k+COT+cqb
xPXfz1KFKZR+jUVQfqg3k9yE8k42Qekbv3kD1KU/qey8yzrOiZWk3YSqYVf+xtUpOvJY52CMhroS
XNjVVkBPUu8Qp/8HAzxqzWi+9FMbOuRKapPdzyPMn/9u5V3oDa03Jlbl/wNvQRAMkkI4MR0Z6Fef
acPXE4lO4yrbdCI+/JWNiFnMhbPxxOqB2cgi5g==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ijvB9ebv8UTsfEBOdwLX29OhkfU+M38mGG3GBCgYR1J/bZmxD6jFCxoFCEm1aKFgD1oURupMHfs1
c3MOeOmJ+miekD3bzrkO2GpRCnMbhKovUm5w9Qm7OnK1B25OU6+Xq1Ykk4tIi1xMOMYX8YKOrSrC
twPgnJ2VHr4FFKQ+p5YO7BYb6KtJrf3+2JKYjVPpp3gkR5SZklV/ugbHgXnKTC8NtjSnys5yM8fs
hXOpMWgzLJxxPm595q7fFP3rHvMyw7H7unYraHK+0uc9zTFZ4LHWuOQvc3TRUEmRmJmaag8nwld1
2cnhyhbuZqsuwb5+2W6amIYGSDb8gPS45qwzBg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 52032)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
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
    reg GRESTORE_int;

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
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

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

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
