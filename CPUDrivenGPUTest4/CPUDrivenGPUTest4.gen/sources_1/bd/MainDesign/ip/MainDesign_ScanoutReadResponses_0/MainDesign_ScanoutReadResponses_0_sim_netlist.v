// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Mon Dec  8 16:47:20 2025
// Host        : Dragon3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top MainDesign_ScanoutReadResponses_0 -prefix
//               MainDesign_ScanoutReadResponses_0_ MainDesign_IBCacheReadResponses_0_sim_netlist.v
// Design      : MainDesign_IBCacheReadResponses_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "MainDesign_IBCacheReadResponses_0,fifo_generator_v13_2_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_14,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module MainDesign_ScanoutReadResponses_0
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
  MainDesign_ScanoutReadResponses_0_fifo_generator_v13_2_14 U0
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
