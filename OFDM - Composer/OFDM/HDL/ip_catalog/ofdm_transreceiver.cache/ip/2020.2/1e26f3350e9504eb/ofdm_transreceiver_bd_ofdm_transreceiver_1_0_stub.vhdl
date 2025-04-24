-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
-- Date        : Mon Apr 21 01:17:44 2025
-- Host        : DESKTOP-IJF0GJG running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ ofdm_transreceiver_bd_ofdm_transreceiver_1_0_stub.vhdl
-- Design      : ofdm_transreceiver_bd_ofdm_transreceiver_1_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35ticpg236-1L
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    random_binary_stream : in STD_LOGIC_VECTOR ( 0 to 0 );
    real_fft_input : in STD_LOGIC_VECTOR ( 15 downto 0 );
    imaginary_fft_input : in STD_LOGIC_VECTOR ( 15 downto 0 );
    clk : in STD_LOGIC;
    real_output : out STD_LOGIC_VECTOR ( 22 downto 0 );
    imaginary_output : out STD_LOGIC_VECTOR ( 22 downto 0 );
    gateway_out2 : out STD_LOGIC_VECTOR ( 0 to 0 )
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "random_binary_stream[0:0],real_fft_input[15:0],imaginary_fft_input[15:0],clk,real_output[22:0],imaginary_output[22:0],gateway_out2[0:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "ofdm_transreceiver,Vivado 2020.2";
begin
end;
