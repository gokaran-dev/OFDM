set rateCeofdm_transreceiver4 ofdm_transreceiver_default_clock_driver/clockdriver/pipelined_ce.ce_pipeline[0].ce_reg/has_latency.fd_array[1].reg_comp_1/fd_prim_array[0].rst_comp.fdre_comp
set rateCellsofdm_transreceiver4 [get_cells -of [filter [all_fanout -flat -endpoints [get_pins $rateCeofdm_transreceiver4/Q]] IS_ENABLE]]
set_multicycle_path -from $rateCellsofdm_transreceiver4 -to $rateCellsofdm_transreceiver4 -setup 4
set_multicycle_path -from $rateCellsofdm_transreceiver4 -to $rateCellsofdm_transreceiver4 -hold 3
