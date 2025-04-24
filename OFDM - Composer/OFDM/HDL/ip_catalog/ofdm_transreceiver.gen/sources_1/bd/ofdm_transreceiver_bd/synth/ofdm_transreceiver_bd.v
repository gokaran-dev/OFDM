//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
//Date        : Mon Apr 21 01:16:39 2025
//Host        : DESKTOP-IJF0GJG running 64-bit major release  (build 9200)
//Command     : generate_target ofdm_transreceiver_bd.bd
//Design      : ofdm_transreceiver_bd
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "ofdm_transreceiver_bd,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=ofdm_transreceiver_bd,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=1,numHierBlks=0,maxHierDepth=0,numSysgenBlks=1,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=SYSGEN,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "ofdm_transreceiver_bd.hwdef" *) 
module ofdm_transreceiver_bd
   (clk,
    gateway_out2,
    imaginary_fft_input,
    imaginary_output,
    random_binary_stream,
    real_fft_input,
    real_output);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK, CLK_DOMAIN ofdm_transreceiver_bd_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000" *) input clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.GATEWAY_OUT2 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.GATEWAY_OUT2, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} real {fixed {fractwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}}}}" *) output [0:0]gateway_out2;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.IMAGINARY_FFT_INPUT DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.IMAGINARY_FFT_INPUT, LAYERED_METADATA undef" *) input [15:0]imaginary_fft_input;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.IMAGINARY_OUTPUT DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.IMAGINARY_OUTPUT, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 23} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} real {fixed {fractwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 15} signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true}}}}}}" *) output [22:0]imaginary_output;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.RANDOM_BINARY_STREAM DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.RANDOM_BINARY_STREAM, LAYERED_METADATA undef" *) input [0:0]random_binary_stream;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.REAL_FFT_INPUT DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.REAL_FFT_INPUT, LAYERED_METADATA undef" *) input [15:0]real_fft_input;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.REAL_OUTPUT DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.REAL_OUTPUT, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 23} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} real {fixed {fractwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 15} signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true}}}}}}" *) output [22:0]real_output;

  wire clk_1;
  wire [15:0]imaginary_fft_input_1;
  wire [0:0]ofdm_transreceiver_1_gateway_out2;
  wire [22:0]ofdm_transreceiver_1_imaginary_output;
  wire [22:0]ofdm_transreceiver_1_real_output;
  wire [0:0]random_binary_stream_1;
  wire [15:0]real_fft_input_1;

  assign clk_1 = clk;
  assign gateway_out2[0] = ofdm_transreceiver_1_gateway_out2;
  assign imaginary_fft_input_1 = imaginary_fft_input[15:0];
  assign imaginary_output[22:0] = ofdm_transreceiver_1_imaginary_output;
  assign random_binary_stream_1 = random_binary_stream[0];
  assign real_fft_input_1 = real_fft_input[15:0];
  assign real_output[22:0] = ofdm_transreceiver_1_real_output;
  ofdm_transreceiver_bd_ofdm_transreceiver_1_0 ofdm_transreceiver_1
       (.clk(clk_1),
        .gateway_out2(ofdm_transreceiver_1_gateway_out2),
        .imaginary_fft_input(imaginary_fft_input_1),
        .imaginary_output(ofdm_transreceiver_1_imaginary_output),
        .random_binary_stream(random_binary_stream_1),
        .real_fft_input(real_fft_input_1),
        .real_output(ofdm_transreceiver_1_real_output));
endmodule
