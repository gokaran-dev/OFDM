//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
//Date        : Mon Apr 21 01:07:37 2025
//Host        : DESKTOP-IJF0GJG running 64-bit major release  (build 9200)
//Command     : generate_target ofdm_transreceiver_bd_wrapper.bd
//Design      : ofdm_transreceiver_bd_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module ofdm_transreceiver_bd_wrapper
   (clk,
    gateway_out2,
    imaginary_fft_input,
    imaginary_output,
    random_binary_stream,
    real_fft_input,
    real_output);
  input clk;
  output [0:0]gateway_out2;
  input [15:0]imaginary_fft_input;
  output [22:0]imaginary_output;
  input [0:0]random_binary_stream;
  input [15:0]real_fft_input;
  output [22:0]real_output;

  wire clk;
  wire [0:0]gateway_out2;
  wire [15:0]imaginary_fft_input;
  wire [22:0]imaginary_output;
  wire [0:0]random_binary_stream;
  wire [15:0]real_fft_input;
  wire [22:0]real_output;

  ofdm_transreceiver_bd ofdm_transreceiver_bd_i
       (.clk(clk),
        .gateway_out2(gateway_out2),
        .imaginary_fft_input(imaginary_fft_input),
        .imaginary_output(imaginary_output),
        .random_binary_stream(random_binary_stream),
        .real_fft_input(real_fft_input),
        .real_output(real_output));
endmodule
