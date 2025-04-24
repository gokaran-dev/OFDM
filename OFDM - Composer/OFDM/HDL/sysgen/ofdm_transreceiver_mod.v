`timescale 1 ns / 10 ps
// Generated from Simulink block 
module ofdm_transreceiver_stub (
  input [1-1:0] random_binary_stream,
  input [16-1:0] real_fft_input,
  input [16-1:0] imaginary_fft_input,
  input clk,
  output [23-1:0] real_output,
  output [23-1:0] imaginary_output,
  output [1-1:0] gateway_out2
);
  ofdm_transreceiver_0 sysgen_dut (
    .random_binary_stream(random_binary_stream),
    .real_fft_input(real_fft_input),
    .imaginary_fft_input(imaginary_fft_input),
    .clk(clk),
    .real_output(real_output),
    .imaginary_output(imaginary_output),
    .gateway_out2(gateway_out2)
  );
endmodule
