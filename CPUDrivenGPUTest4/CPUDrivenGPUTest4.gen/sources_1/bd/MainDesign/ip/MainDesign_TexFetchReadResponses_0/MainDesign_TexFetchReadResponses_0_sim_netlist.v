// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Mon Dec  8 16:47:20 2025
// Host        : Dragon3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top MainDesign_TexFetchReadResponses_0 -prefix
//               MainDesign_TexFetchReadResponses_0_ MainDesign_IBCacheReadResponses_0_sim_netlist.v
// Design      : MainDesign_IBCacheReadResponses_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "MainDesign_IBCacheReadResponses_0,fifo_generator_v13_2_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_14,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module MainDesign_TexFetchReadResponses_0
   (clk,
    srst,
    din,
    wr_en,
    rd_en,
    dout,
    full,
    empty,
    wr_rst_busy,
    rd_rst_busy);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 core_clk CLK" *) (* x_interface_mode = "slave core_clk" *) (* x_interface_parameter = "XIL_INTERFACENAME core_clk, FREQ_HZ 333250000, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0" *) input clk;
  input srst;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) (* x_interface_mode = "slave FIFO_WRITE" *) input [255:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) (* x_interface_mode = "slave FIFO_READ" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [255:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;
  output wr_rst_busy;
  output rd_rst_busy;

  wire clk;
  wire [255:0]din;
  wire [255:0]dout;
  wire empty;
  wire full;
  wire rd_en;
  wire rd_rst_busy;
  wire srst;
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
  wire NLW_U0_prog_full_UNCONNECTED;
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
  (* C_COMMON_CLOCK = "1" *) 
  (* C_COUNT_TYPE = "0" *) 
  (* C_DATA_COUNT_WIDTH = "9" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "256" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "1" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "256" *) 
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
  (* C_PRIM_FIFO_TYPE = "512x72" *) 
  (* C_PRIM_FIFO_TYPE_AXIS = "1kx18" *) 
  (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_RDCH = "512x72" *) 
  (* C_PRIM_FIFO_TYPE_WACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_WDCH = "512x72" *) 
  (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "4" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "5" *) 
  (* C_PROG_EMPTY_TYPE = "0" *) 
  (* C_PROG_EMPTY_TYPE_AXIS = "0" *) 
  (* C_PROG_EMPTY_TYPE_RACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "511" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "510" *) 
  (* C_PROG_FULL_TYPE = "0" *) 
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
  (* C_RD_FREQ = "1" *) 
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
  (* C_USE_EMBEDDED_REG = "1" *) 
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
  (* C_WR_FREQ = "1" *) 
  (* C_WR_PNTR_WIDTH = "9" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  (* is_du_within_envelope = "true" *) 
  MainDesign_TexFetchReadResponses_0_fifo_generator_v13_2_14 U0
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
        .clk(clk),
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
        .prog_full(NLW_U0_prog_full_UNCONNECTED),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(1'b0),
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
        .wr_clk(1'b0),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 92528)
`pragma protect data_block
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
b16/wp1a0D5VLHmETuvTnbU=
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
