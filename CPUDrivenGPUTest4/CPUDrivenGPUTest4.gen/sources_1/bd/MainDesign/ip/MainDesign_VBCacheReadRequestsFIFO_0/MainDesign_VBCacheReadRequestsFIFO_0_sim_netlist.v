// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Mon Dec  8 16:47:20 2025
// Host        : Dragon3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top MainDesign_VBCacheReadRequestsFIFO_0 -prefix
//               MainDesign_VBCacheReadRequestsFIFO_0_ MainDesign_IBCacheReadRequestsFIFO_0_sim_netlist.v
// Design      : MainDesign_IBCacheReadRequestsFIFO_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "MainDesign_IBCacheReadRequestsFIFO_0,fifo_generator_v13_2_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_14,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module MainDesign_VBCacheReadRequestsFIFO_0
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
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) (* x_interface_mode = "slave FIFO_WRITE" *) input [29:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) (* x_interface_mode = "slave FIFO_READ" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [29:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;
  output wr_rst_busy;
  output rd_rst_busy;

  wire clk;
  wire [29:0]din;
  wire [29:0]dout;
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
  (* C_DIN_WIDTH = "30" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "1" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "30" *) 
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
  MainDesign_VBCacheReadRequestsFIFO_0_fifo_generator_v13_2_14 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 50992)
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
