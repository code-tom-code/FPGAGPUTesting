// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Sun Dec 21 18:01:49 2025
// Host        : TomTop3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/Tom/Documents/repos/FPGAGPUTesting/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_fifo_generator_0_0/MainDesign_fifo_generator_0_0_sim_netlist.v
// Design      : MainDesign_fifo_generator_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "MainDesign_fifo_generator_0_0,fifo_generator_v13_2_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_14,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module MainDesign_fifo_generator_0_0
   (srst,
    wr_clk,
    rd_clk,
    din,
    wr_en,
    rd_en,
    dout,
    full,
    empty,
    wr_rst_busy,
    rd_rst_busy);
  input srst;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 write_clk CLK" *) (* x_interface_mode = "slave write_clk" *) (* x_interface_parameter = "XIL_INTERFACENAME write_clk, FREQ_HZ 251750000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN MainDesign_clk_wiz_0_0_clk_x10, INSERT_VIP 0" *) input wr_clk;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 read_clk CLK" *) (* x_interface_mode = "slave read_clk" *) (* x_interface_parameter = "XIL_INTERFACENAME read_clk, FREQ_HZ 333250000, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0" *) input rd_clk;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) (* x_interface_mode = "slave FIFO_WRITE" *) input [29:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) (* x_interface_mode = "slave FIFO_READ" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [29:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;
  output wr_rst_busy;
  output rd_rst_busy;

  wire [29:0]din;
  wire [29:0]dout;
  wire empty;
  wire full;
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
  (* C_COMMON_CLOCK = "0" *) 
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
  (* C_WR_FREQ = "250" *) 
  (* C_WR_PNTR_WIDTH = "9" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  (* is_du_within_envelope = "true" *) 
  MainDesign_fifo_generator_0_0_fifo_generator_v13_2_14 U0
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
        .prog_full(NLW_U0_prog_full_UNCONNECTED),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 51744)
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
