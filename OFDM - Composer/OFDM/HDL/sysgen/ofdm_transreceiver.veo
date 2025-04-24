  ofdm_transreceiver sysgen_dut (
    .random_binary_stream(random_binary_stream),
    .real_fft_input(real_fft_input),
    .imaginary_fft_input(imaginary_fft_input),
    .clk(clk),
    .real_output(real_output),
    .imaginary_output(imaginary_output),
    .gateway_out2(gateway_out2)
  );
