// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Mon Apr 21 01:17:44 2025
// Host        : DESKTOP-IJF0GJG running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ ofdm_transreceiver_bd_ofdm_transreceiver_1_0_stub.v
// Design      : ofdm_transreceiver_bd_ofdm_transreceiver_1_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35ticpg236-1L
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "ofdm_transreceiver,Vivado 2020.2" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(random_binary_stream, real_fft_input, 
  imaginary_fft_input, clk, real_output, imaginary_output, gateway_out2)
/* synthesis syn_black_box black_box_pad_pin="random_binary_stream[0:0],real_fft_input[15:0],imaginary_fft_input[15:0],clk,real_output[22:0],imaginary_output[22:0],gateway_out2[0:0]" */;
  input [0:0]random_binary_stream;
  input [15:0]real_fft_input;
  input [15:0]imaginary_fft_input;
  input clk;
  output [22:0]real_output;
  output [22:0]imaginary_output;
  output [0:0]gateway_out2;
endmodule
