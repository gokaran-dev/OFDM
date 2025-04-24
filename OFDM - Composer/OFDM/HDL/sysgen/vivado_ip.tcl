#-----------------------------------------------------------------
# System Generator version 2020.2 IP Tcl source file.
#
# Copyright(C) 2020 by Xilinx, Inc.  All rights reserved.  This
# text/file contains proprietary, confidential information of Xilinx,
# Inc., is distributed under license from Xilinx, Inc., and may be used,
# copied and/or disclosed only pursuant to the terms of a valid license
# agreement with Xilinx, Inc.  Xilinx hereby grants you a license to use
# this text/file solely for design, simulation, implementation and
# creation of design files limited to Xilinx devices or technologies.
# Use with non-Xilinx devices or technologies is expressly prohibited
# and immediately terminates your license unless covered by a separate
# agreement.
#
# Xilinx is providing this design, code, or information "as is" solely
# for use in developing programs and solutions for Xilinx devices.  By
# providing this design, code, or information as one possible
# implementation of this feature, application or standard, Xilinx is
# making no representation that this implementation is free from any
# claims of infringement.  You are responsible for obtaining any rights
# you may require for your implementation.  Xilinx expressly disclaims
# any warranty whatsoever with respect to the adequacy of the
# implementation, including but not limited to warranties of
# merchantability or fitness for a particular purpose.
#
# Xilinx products are not intended for use in life support appliances,
# devices, or systems.  Use in such applications is expressly prohibited.
#
# Any modifications that are made to the source code are done at the user's
# sole risk and will be unsupported.
#
# This copyright and support notice must be retained as part of this
# text at all times.  (c) Copyright 1995-2020 Xilinx, Inc.  All rights
# reserved.
#-----------------------------------------------------------------

set existingipslist [get_ips]
if {[lsearch $existingipslist ofdm_transreceiver_xfft_v9_1_i0] < 0} {
create_ip -name xfft -version 9.1 -vendor xilinx.com -library ip -module_name ofdm_transreceiver_xfft_v9_1_i0
set params_list [list]
lappend params_list CONFIG.Component_Name {ofdm_transreceiver_xfft_v9_1_i0}
lappend params_list CONFIG.aclken {true}
lappend params_list CONFIG.aresetn {false}
lappend params_list CONFIG.butterfly_type {use_xtremedsp_slices}
lappend params_list CONFIG.channels {1}
lappend params_list CONFIG.complex_mult_type {use_mults_performance}
lappend params_list CONFIG.cyclic_prefix_insertion {false}
lappend params_list CONFIG.data_format {fixed_point}
lappend params_list CONFIG.implementation_options {pipelined_streaming_io}
lappend params_list CONFIG.input_width {16}
lappend params_list CONFIG.memory_options_data {block_ram}
lappend params_list CONFIG.memory_options_hybrid {false}
lappend params_list CONFIG.memory_options_phase_factors {block_ram}
lappend params_list CONFIG.memory_options_reorder {block_ram}
lappend params_list CONFIG.number_of_stages_using_block_ram_for_data_and_phase_factors {0}
lappend params_list CONFIG.output_ordering {bit_reversed_order}
lappend params_list CONFIG.ovflo {false}
lappend params_list CONFIG.phase_factor_width {16}
lappend params_list CONFIG.rounding_modes {convergent_rounding}
lappend params_list CONFIG.run_time_configurable_transform_length {false}
lappend params_list CONFIG.scaling_options {unscaled}
lappend params_list CONFIG.target_clock_frequency {250}
lappend params_list CONFIG.target_data_throughput {50}
lappend params_list CONFIG.throttle_scheme {nonrealtime}
lappend params_list CONFIG.transform_length {64}
lappend params_list CONFIG.xk_index {false}

set_property -dict $params_list [get_ips ofdm_transreceiver_xfft_v9_1_i0]
}


validate_ip [get_ips]
