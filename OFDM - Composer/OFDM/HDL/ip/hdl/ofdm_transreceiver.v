`ifndef xlConvPkgIncluded
`include "conv_pkg.v"
`endif

`timescale 1 ns / 10 ps
// Generated from Simulink block OFDM_Transreceiver/FFT
module ofdm_transreceiver_fft (
  input [16-1:0] in1,
  input [16-1:0] in2,
  input clk_4,
  input ce_4,
  output [23-1:0] out1,
  output [23-1:0] out2
);
  wire [16-1:0] real_fft_input_net;
  wire [16-1:0] imaginary_fft_input_net;
  wire clk_net;
  wire ce_net;
  wire [16-1:0] imaginary_fft_input_q_net;
  wire [23-1:0] inverse_fft_op_im_net;
  wire [16-1:0] real_fft_input_q_net;
  wire [23-1:0] inverse_fft_op_re_net;
  assign out1 = inverse_fft_op_re_net;
  assign out2 = inverse_fft_op_im_net;
  assign real_fft_input_net = in1;
  assign imaginary_fft_input_net = in2;
  assign clk_net = clk_4;
  assign ce_net = ce_4;
  xlofdm_transreceiver_xfft_v9_1_i0_d212fa5848aec63af7e06b139f794ee4 inverse_fft (
    .in_re(real_fft_input_q_net),
    .in_im(imaginary_fft_input_q_net),
    .clk(clk_net),
    .ce(ce_net),
    .op_re(inverse_fft_op_re_net),
    .op_im(inverse_fft_op_im_net)
  );
  ofdm_transreceiver_xlregister #(
    .d_width(16),
    .init_value(16'b0000000000000000)
  )
  real_fft_input (
    .en(1'b1),
    .rst(1'b0),
    .d(real_fft_input_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(real_fft_input_q_net)
  );
  ofdm_transreceiver_xlregister #(
    .d_width(16),
    .init_value(16'b0000000000000000)
  )
  imaginary_fft_input (
    .en(1'b1),
    .rst(1'b0),
    .d(imaginary_fft_input_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(imaginary_fft_input_q_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block OFDM_Transreceiver/IFFT
module ofdm_transreceiver_ifft (
  input [16-1:0] real_x0,
  input [16-1:0] imaginary,
  input clk_4,
  input ce_4,
  output [23-1:0] out1,
  output [23-1:0] out2
);
  wire ce_net;
  wire [16-1:0] real_delayed;
  wire [23-1:0] fft_op_im_net;
  wire [23-1:0] fft_op_re_net;
  wire [16-1:0] real_x1;
  wire [16-1:0] imaginary_delayed;
  wire clk_net;
  wire [16-1:0] imaginary_x0;
  assign out1 = fft_op_re_net;
  assign out2 = fft_op_im_net;
  assign real_x1 = real_x0;
  assign imaginary_x0 = imaginary;
  assign clk_net = clk_4;
  assign ce_net = ce_4;
  ofdm_transreceiver_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(16)
  )
  delay (
    .en(1'b1),
    .rst(1'b0),
    .d(real_x1),
    .clk(clk_net),
    .ce(ce_net),
    .q(real_delayed)
  );
  ofdm_transreceiver_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(16)
  )
  delay1 (
    .en(1'b1),
    .rst(1'b0),
    .d(imaginary_x0),
    .clk(clk_net),
    .ce(ce_net),
    .q(imaginary_delayed)
  );
  xlofdm_transreceiver_xfft_v9_1_i0_cad188b2740f25cd0ec8cc0eb6f69249 fft (
    .in_re(real_delayed),
    .in_im(imaginary_delayed),
    .clk(clk_net),
    .ce(ce_net),
    .op_re(fft_op_re_net),
    .op_im(fft_op_im_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block OFDM_Transreceiver/QAM_Demodulation
module ofdm_transreceiver_qam_demodulation (
  input [23-1:0] in1,
  input [23-1:0] in2,
  output [4-1:0] out1
);
  wire [4-1:0] mcode_b_net;
  wire [23-1:0] inverse_fft_op_im_net;
  wire [5-1:0] constant_op_net;
  wire [23-1:0] inverse_fft_op_re_net;
  assign out1 = mcode_b_net;
  assign inverse_fft_op_re_net = in1;
  assign inverse_fft_op_im_net = in2;
  sysgen_constant_8952236100 constant (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .op(constant_op_net)
  );
  sysgen_mcode_block_ff752da6c7 mcode (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .i(inverse_fft_op_re_net),
    .q(inverse_fft_op_im_net),
    .thrd(constant_op_net),
    .b(mcode_b_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block OFDM_Transreceiver/QAM_Modulation
module ofdm_transreceiver_qam_modulation (
  input [4-1:0] in1,
  input clk_4,
  input ce_4,
  output [16-1:0] out1,
  output [16-1:0] out2
);
  wire [16-1:0] imaginary;
  wire [16-1:0] real_x0;
  wire [2-1:0] slice1_y_net;
  wire clk_net;
  wire [2-1:0] slice_y_net;
  wire [4-1:0] parallel_stream;
  wire ce_net;
  assign out1 = real_x0;
  assign out2 = imaginary;
  assign parallel_stream = in1;
  assign clk_net = clk_4;
  assign ce_net = ce_4;
  ofdm_transreceiver_xlsprom #(
    .c_address_width(2),
    .c_width(16),
    .latency(1),
    .mem_init_file("xpm_cc2c29_vivado.mem"),
    .mem_size(64),
    .mem_type("block"),
    .read_reset_val("0")
  )
  i_rom (
    .en(1'b1),
    .rst(1'b0),
    .addr(slice_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .data(real_x0)
  );
  ofdm_transreceiver_xlsprom #(
    .c_address_width(2),
    .c_width(16),
    .latency(1),
    .mem_init_file("xpm_cc2c29_vivado.mem"),
    .mem_size(64),
    .mem_type("block"),
    .read_reset_val("0")
  )
  q_rom (
    .en(1'b1),
    .rst(1'b0),
    .addr(slice1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .data(imaginary)
  );
  ofdm_transreceiver_xlslice #(
    .new_lsb(0),
    .new_msb(1),
    .x_width(4),
    .y_width(2)
  )
  slice (
    .x(parallel_stream),
    .y(slice_y_net)
  );
  ofdm_transreceiver_xlslice #(
    .new_lsb(2),
    .new_msb(3),
    .x_width(4),
    .y_width(2)
  )
  slice1 (
    .x(parallel_stream),
    .y(slice1_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block OFDM_Transreceiver_struct
module ofdm_transreceiver_struct (
  input [1-1:0] random_binary_stream,
  input [16-1:0] real_fft_input,
  input [16-1:0] imaginary_fft_input,
  input clk_1,
  input ce_1,
  input clk_4,
  input ce_4,
  output [23-1:0] real_output,
  output [23-1:0] imaginary_output,
  output [1-1:0] gateway_out2
);
  wire [16-1:0] imaginary_fft_input_net;
  wire dest_ce_net;
  wire ce_net;
  wire [23-1:0] inverse_fft_op_re_net;
  wire [1-1:0] random_binary_stream_net;
  wire [4-1:0] parallel_stream;
  wire dest_clk_net;
  wire [4-1:0] mcode_b_net;
  wire [23-1:0] inverse_fft_op_im_net;
  wire [16-1:0] real_x0;
  wire [16-1:0] real_fft_input_net;
  wire [23-1:0] fft_op_re_net;
  wire [23-1:0] fft_op_im_net;
  wire clk_net;
  wire [16-1:0] imaginary;
  wire [1-1:0] serial;
  assign random_binary_stream_net = random_binary_stream;
  assign real_fft_input_net = real_fft_input;
  assign imaginary_fft_input_net = imaginary_fft_input;
  assign real_output = fft_op_re_net;
  assign imaginary_output = fft_op_im_net;
  assign gateway_out2 = serial;
  assign dest_clk_net = clk_1;
  assign dest_ce_net = ce_1;
  assign clk_net = clk_4;
  assign ce_net = ce_4;
  ofdm_transreceiver_fft fft (
    .in1(real_fft_input_net),
    .in2(imaginary_fft_input_net),
    .clk_4(clk_net),
    .ce_4(ce_net),
    .out1(inverse_fft_op_re_net),
    .out2(inverse_fft_op_im_net)
  );
  ofdm_transreceiver_ifft ifft (
    .real_x0(real_x0),
    .imaginary(imaginary),
    .clk_4(clk_net),
    .ce_4(ce_net),
    .out1(fft_op_re_net),
    .out2(fft_op_im_net)
  );
  ofdm_transreceiver_qam_demodulation qam_demodulation (
    .in1(inverse_fft_op_re_net),
    .in2(inverse_fft_op_im_net),
    .out1(mcode_b_net)
  );
  ofdm_transreceiver_qam_modulation qam_modulation (
    .in1(parallel_stream),
    .clk_4(clk_net),
    .ce_4(ce_net),
    .out1(real_x0),
    .out2(imaginary)
  );
  ofdm_transreceiver_xlp2s #(
    .din_arith(`xlUnsigned),
    .din_bin_pt(0),
    .din_width(4),
    .dout_arith(`xlUnsigned),
    .dout_bin_pt(0),
    .dout_width(1),
    .latency(1),
    .lsb_first(1),
    .num_outputs(4)
  )
  parallel_to_serial (
    .src_clr(1'b0),
    .dest_clr(1'b0),
    .en(1'b1),
    .rst(1'b0),
    .din(mcode_b_net),
    .src_clk(clk_net),
    .src_ce(ce_net),
    .dest_clk(dest_clk_net),
    .dest_ce(dest_ce_net),
    .dout(serial)
  );
  ofdm_transreceiver_xls2p #(
    .din_arith(`xlUnsigned),
    .din_bin_pt(0),
    .din_width(1),
    .dout_arith(`xlUnsigned),
    .dout_bin_pt(0),
    .dout_width(4),
    .latency(1),
    .lsb_first(1),
    .num_inputs(4)
  )
  serial_to_parallel (
    .src_clr(1'b0),
    .dest_clr(1'b0),
    .en(1'b1),
    .rst(1'b0),
    .din(random_binary_stream_net),
    .src_clk(dest_clk_net),
    .src_ce(dest_ce_net),
    .dest_clk(clk_net),
    .dest_ce(ce_net),
    .dout(parallel_stream)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block 
module ofdm_transreceiver_default_clock_driver (
  input ofdm_transreceiver_sysclk,
  input ofdm_transreceiver_sysce,
  input ofdm_transreceiver_sysclr,
  output ofdm_transreceiver_clk1,
  output ofdm_transreceiver_ce1,
  output ofdm_transreceiver_clk4,
  output ofdm_transreceiver_ce4
);
  xlclockdriver #(
    .period(1),
    .log_2_period(1)
  )
  clockdriver_x0 (
    .sysclk(ofdm_transreceiver_sysclk),
    .sysce(ofdm_transreceiver_sysce),
    .sysclr(ofdm_transreceiver_sysclr),
    .clk(ofdm_transreceiver_clk1),
    .ce(ofdm_transreceiver_ce1)
  );
  xlclockdriver #(
    .period(4),
    .log_2_period(3)
  )
  clockdriver (
    .sysclk(ofdm_transreceiver_sysclk),
    .sysce(ofdm_transreceiver_sysce),
    .sysclr(ofdm_transreceiver_sysclr),
    .clk(ofdm_transreceiver_clk4),
    .ce(ofdm_transreceiver_ce4)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block 
(* core_generation_info = "ofdm_transreceiver,sysgen_core_2020_2,{,compilation=IP Catalog,block_icon_display=Default,family=artix7,part=xc7a35ti,speed=-1L,package=cpg236,synthesis_language=verilog,hdl_library=xil_defaultlib,synthesis_strategy=Vivado Synthesis Defaults,implementation_strategy=Vivado Implementation Defaults,testbench=1,interface_doc=0,ce_clr=0,clock_period=10,system_simulink_period=1,waveform_viewer=0,axilite_interface=0,ip_catalog_plugin=0,hwcosim_burst_mode=0,simulation_time=5000,constant=1,delay=2,mcode=1,p2s=1,register=2,s2p=1,slice=2,sprom=2,xfft_forward=1,xfft_inverse=1,}" *)
module ofdm_transreceiver (
  input [1-1:0] random_binary_stream,
  input [16-1:0] real_fft_input,
  input [16-1:0] imaginary_fft_input,
  input clk,
  output [23-1:0] real_output,
  output [23-1:0] imaginary_output,
  output [1-1:0] gateway_out2
);
  wire ce_4_net;
  wire clk_1_net;
  wire ce_1_net;
  wire clk_4_net;
  ofdm_transreceiver_default_clock_driver ofdm_transreceiver_default_clock_driver (
    .ofdm_transreceiver_sysclk(clk),
    .ofdm_transreceiver_sysce(1'b1),
    .ofdm_transreceiver_sysclr(1'b0),
    .ofdm_transreceiver_clk1(clk_1_net),
    .ofdm_transreceiver_ce1(ce_1_net),
    .ofdm_transreceiver_clk4(clk_4_net),
    .ofdm_transreceiver_ce4(ce_4_net)
  );
  ofdm_transreceiver_struct ofdm_transreceiver_struct (
    .random_binary_stream(random_binary_stream),
    .real_fft_input(real_fft_input),
    .imaginary_fft_input(imaginary_fft_input),
    .clk_1(clk_1_net),
    .ce_1(ce_1_net),
    .clk_4(clk_4_net),
    .ce_4(ce_4_net),
    .real_output(real_output),
    .imaginary_output(imaginary_output),
    .gateway_out2(gateway_out2)
  );
endmodule
