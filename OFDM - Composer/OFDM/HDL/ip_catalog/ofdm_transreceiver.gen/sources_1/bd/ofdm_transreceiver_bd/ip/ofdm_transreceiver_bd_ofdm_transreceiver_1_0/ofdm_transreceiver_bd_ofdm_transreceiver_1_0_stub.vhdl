-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
-- Date        : Mon Apr 21 01:17:48 2025
-- Host        : DESKTOP-IJF0GJG running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/Gokaraan/Documents/Composer/OFDM/HDL/ip_catalog/ofdm_transreceiver.gen/sources_1/bd/ofdm_transreceiver_bd/ip/ofdm_transreceiver_bd_ofdm_transreceiver_1_0/ofdm_transreceiver_bd_ofdm_transreceiver_1_0_stub.vhdl
-- Design      : ofdm_transreceiver_bd_ofdm_transreceiver_1_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35ticpg236-1L
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ofdm_transreceiver_bd_ofdm_transreceiver_1_0 is
  Port ( 
    random_binary_stream : in STD_LOGIC_VECTOR ( 0 to 0 );
    real_fft_input : in STD_LOGIC_VECTOR ( 15 downto 0 );
    imaginary_fft_input : in STD_LOGIC_VECTOR ( 15 downto 0 );
    clk : in STD_LOGIC;
    real_output : out STD_LOGIC_VECTOR ( 22 downto 0 );
    imaginary_output : out STD_LOGIC_VECTOR ( 22 downto 0 );
    gateway_out2 : out STD_LOGIC_VECTOR ( 0 to 0 )
  );

end ofdm_transreceiver_bd_ofdm_transreceiver_1_0;

architecture stub of ofdm_transreceiver_bd_ofdm_transreceiver_1_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "random_binary_stream[0:0],real_fft_input[15:0],imaginary_fft_input[15:0],clk,real_output[22:0],imaginary_output[22:0],gateway_out2[0:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "ofdm_transreceiver,Vivado 2020.2";
begin
end;
