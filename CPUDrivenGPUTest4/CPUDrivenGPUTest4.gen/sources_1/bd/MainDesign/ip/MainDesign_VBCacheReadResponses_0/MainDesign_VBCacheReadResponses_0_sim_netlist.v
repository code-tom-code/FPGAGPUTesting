// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Sun Dec 21 17:57:04 2025
// Host        : TomTop3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top MainDesign_VBCacheReadResponses_0 -prefix
//               MainDesign_VBCacheReadResponses_0_ MainDesign_IBCacheReadResponses_0_sim_netlist.v
// Design      : MainDesign_IBCacheReadResponses_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "MainDesign_IBCacheReadResponses_0,fifo_generator_v13_2_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_14,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module MainDesign_VBCacheReadResponses_0
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
  MainDesign_VBCacheReadResponses_0_fifo_generator_v13_2_14 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 92496)
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
