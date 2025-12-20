// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Wed Dec 17 03:10:01 2025
// Host        : Dragon3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_fifo_generator_0_1/MainDesign_fifo_generator_0_1_sim_netlist.v
// Design      : MainDesign_fifo_generator_0_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "MainDesign_fifo_generator_0_1,fifo_generator_v13_2_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_14,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module MainDesign_fifo_generator_0_1
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
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "345" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "344" *) 
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
  MainDesign_fifo_generator_0_1_fifo_generator_v13_2_14 U0
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
