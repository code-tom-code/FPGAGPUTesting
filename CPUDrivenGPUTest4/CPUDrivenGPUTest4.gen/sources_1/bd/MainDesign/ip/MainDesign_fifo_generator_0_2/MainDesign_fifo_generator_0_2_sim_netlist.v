// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Sun Dec 21 17:59:44 2025
// Host        : TomTop3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/Tom/Documents/repos/FPGAGPUTesting/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_fifo_generator_0_2/MainDesign_fifo_generator_0_2_sim_netlist.v
// Design      : MainDesign_fifo_generator_0_2
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "MainDesign_fifo_generator_0_2,fifo_generator_v13_2_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_14,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module MainDesign_fifo_generator_0_2
   (clk,
    srst,
    din,
    wr_en,
    rd_en,
    dout,
    full,
    empty,
    prog_full,
    wr_rst_busy,
    rd_rst_busy);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 core_clk CLK" *) (* x_interface_mode = "slave core_clk" *) (* x_interface_parameter = "XIL_INTERFACENAME core_clk, FREQ_HZ 333250000, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0" *) input clk;
  input srst;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) (* x_interface_mode = "slave FIFO_WRITE" *) input [87:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) (* x_interface_mode = "slave FIFO_READ" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [87:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;
  output prog_full;
  output wr_rst_busy;
  output rd_rst_busy;

  wire clk;
  wire [87:0]din;
  wire [87:0]dout;
  wire empty;
  wire full;
  wire prog_full;
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
  (* C_DIN_WIDTH = "88" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "1" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "88" *) 
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
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "505" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "504" *) 
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
  MainDesign_fifo_generator_0_2_fifo_generator_v13_2_14 U0
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
        .prog_full(prog_full),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 71136)
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
