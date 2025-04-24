//-----------------------------------------------------------------
// System Generator version 2020.2 Verilog source file.
//
// Copyright(C) 2020 by Xilinx, Inc.  All rights reserved.  This
// text/file contains proprietary, confidential information of Xilinx,
// Inc., is distributed under license from Xilinx, Inc., and may be used,
// copied and/or disclosed only pursuant to the terms of a valid license
// agreement with Xilinx, Inc.  Xilinx hereby grants you a license to use
// this text/file solely for design, simulation, implementation and
// creation of design files limited to Xilinx devices or technologies.
// Use with non-Xilinx devices or technologies is expressly prohibited
// and immediately terminates your license unless covered by a separate
// agreement.
//
// Xilinx is providing this design, code, or information "as is" solely
// for use in developing programs and solutions for Xilinx devices.  By
// providing this design, code, or information as one possible
// implementation of this feature, application or standard, Xilinx is
// making no representation that this implementation is free from any
// claims of infringement.  You are responsible for obtaining any rights
// you may require for your implementation.  Xilinx expressly disclaims
// any warranty whatsoever with respect to the adequacy of the
// implementation, including but not limited to warranties of
// merchantability or fitness for a particular purpose.
//
// Xilinx products are not intended for use in life support appliances,
// devices, or systems.  Use in such applications is expressly prohibited.
//
// Any modifications that are made to the source code are done at the user's
// sole risk and will be unsupported.
//
// This copyright and support notice must be retained as part of this
// text at all times.  (c) Copyright 1995-2020 Xilinx, Inc.  All rights
// reserved.
//-----------------------------------------------------------------

`include "conv_pkg.v"
`timescale 1 ns / 10 ps


module  ofdm_transreceiver_xlp2s  (din, src_ce, src_clr, src_clk, dest_ce, dest_clr, dest_clk, rst, en, dout);


//Parameter Definitions
parameter dout_width= 8;
parameter dout_arith= `xlSigned;
parameter dout_bin_pt= 0;
parameter din_width= 1;
parameter din_arith= `xlUnsigned;
parameter din_bin_pt= 0;
parameter rst_width= 1;
parameter rst_bin_pt= 0;
parameter rst_arith= `xlUnsigned;
parameter en_width= 1;
parameter en_bin_pt= 0;
parameter en_arith= `xlUnsigned;
parameter lsb_first= 0;
parameter latency= 0;
parameter num_outputs= 0;

//Port Declartions
input [din_width-1:0] din;
input src_ce, src_clr, src_clk;
input dest_ce, dest_clr, dest_clk;
input rst;
input en;
output [dout_width-1:0] dout;

//Wire Declartions
   wire [dout_width-1:0] i [0:num_outputs-1];
   wire [din_width-1:0] din_temp;
   wire [dout_width-1:0] o [0:num_outputs-1];
   wire [dout_width-1:0] dout_temp;
   wire src_ce_hold;
   wire internal_src_ce;
   wire internal_dest_ce;
   wire internal_clr;
   genvar index, idx, idx1;

   assign internal_src_ce = src_ce_hold & en;
   assign internal_dest_ce = dest_ce & en;
   assign internal_clr = ((dest_clr | src_clr) & dest_ce) | rst;
   assign dout_temp = internal_src_ce ? din_temp[dout_width-1:0]: o[1];

   FDSE src_ce_reg(.Q(src_ce_hold),
		   .D(src_ce),
		   .C(src_clk),
		   .CE(dest_ce),
		   .S(src_clr));

   generate
      if (lsb_first==1)
       	begin:lsb_is_first
   	   assign din_temp = din;
       	end
      else
       	begin:msb_is_first
   	   p2s_bit_reverse_ofdm_transreceiver_xlp2s # (din_width, dout_width, num_outputs) reverse_input(.din(din), .dout(din_temp));
       	end
   endgenerate

   generate
      for(index=0; index<num_outputs; index=index+1)
   	begin:fd_array
	   synth_reg_w_init # (dout_width, 0, 1'b0, 1)
	     capture ( .i(i[index]),
		       .ce(internal_dest_ce),
		       .clr(internal_clr),
		       .clk(dest_clk),
		       .o(o[index]));
   	end
   endgenerate

   generate
      for (idx=0; idx<num_outputs; idx=idx+1)
       	begin:signal_select
	   if (idx < num_outputs-1)
	     begin:signal_0
	       	assign i[idx] = internal_src_ce ? din_temp[idx*dout_width+dout_width-1:idx*dout_width] : o[idx+1];
	     end
	   if (idx == num_outputs-1)
	     begin:signal_1
	       	assign i[idx] = internal_src_ce ? din_temp[idx*dout_width+dout_width-1:idx*dout_width] : o[idx];
	     end
       	end
   endgenerate

   generate
      if (latency > 0)
   	begin:latency_gt_0
	   synth_reg # (dout_width, latency)
	     data_reg (.i(dout_temp),
		       .ce(internal_dest_ce),
		       .clr(internal_clr),
		       .clk(dest_clk),
		       .o(dout));
   	end
      if (latency == 0)
     	begin:latency0
	   assign dout = dout_temp;
     	end
   endgenerate

endmodule

//Need to create a new module to avoid ModelSim crashes
module p2s_bit_reverse_ofdm_transreceiver_xlp2s (din, dout);
   parameter din_width = 8;
   parameter dout_width = 2;
   parameter num_outputs = 4;

   input [din_width-1:0] din;
   output [din_width-1:0] dout;
   genvar index;

   generate
      for (index=0; index<num_outputs; index=index+1)
  	begin:u0
   	  assign dout[(num_outputs-index)*dout_width-1:(num_outputs-index-1)*dout_width] = din[index*dout_width+dout_width-1:index*dout_width];
       end
 endgenerate

endmodule
`timescale 1 ns / 10 ps
module  ofdm_transreceiver_xls2p  (din, src_ce, src_clr, src_clk, dest_ce, dest_clr, dest_clk, rst, en, dout);

//Parameter Definitions
parameter signed [31:0] dout_width = 8;
parameter signed [31:0] dout_arith = `xlSigned;
parameter signed [31:0] dout_bin_pt = 0;
parameter signed [31:0] din_width = 1;
parameter signed [31:0] din_arith = `xlUnsigned;
parameter signed [31:0] din_bin_pt = 0;
parameter signed [31:0] rst_width = 1;
parameter signed [31:0] rst_bin_pt = 0;
parameter signed [31:0] rst_arith = `xlUnsigned;
parameter signed [31:0] en_width = 1;
parameter signed [31:0] en_bin_pt = 0;
parameter signed [31:0] en_arith = `xlUnsigned;
parameter signed [31:0] lsb_first = 0;
parameter signed [31:0] latency = 0;
parameter signed [31:0] num_inputs = 0;

//Port Declartions
input [din_width-1:0] din;
input src_ce, src_clr, src_clk;
input dest_ce, dest_clr, dest_clk;
input rst, en;
output [dout_width-1:0] dout;


   //Wire Declartions
   wire [din_width-1:0] capture_in [0:num_inputs-1];
   wire [din_width-1:0] i [0:num_inputs-1];
   wire [din_width-1:0] o [0:num_inputs-1];
   wire del_dest_ce;
   wire [dout_width-1:0] dout_temp, dout_hold;
   wire internal_src_ce;
   wire internal_dest_ce;
   wire internal_clr;
   genvar index;


   assign internal_src_ce = src_ce & en;
   assign internal_dest_ce = dest_ce & en;
   assign internal_clr = ((dest_clr | src_clr ) & dest_ce) | rst;

   generate
      for(index=0; index<num_inputs; index=index+1)
   	begin:fd_array
	   synth_reg # (din_width,1)
	     comp ( .i(i[index]),
		    .ce(internal_src_ce),
		    .clr(internal_clr),
		    .clk(src_clk),
		    .o(o[index]));
	   synth_reg_w_init # (din_width, 0, 1'b0, 1)
		  capture ( .i(capture_in[index]),
			    .ce(internal_dest_ce),
			    .clr(internal_clr),
			    .clk(dest_clk),
			    .o(dout_hold[dout_width-1-index*din_width:dout_width-index*din_width-din_width]));
	   if (index == 0)
	     begin:signal_01
		assign i[index] = din;
		assign capture_in[index] = din;
	     end
	   else
	     begin:signal_gt_0
		assign i[index] = o[index-1];
		assign capture_in[index] = o[index-1];
	     end
   	end
   endgenerate

   generate
      if (lsb_first==1)
	begin:lsb_is_first
	   assign dout_temp = dout_hold;
       end
     else
       begin:msb_is_first
	   s2p_bit_reverse # (din_width, dout_width, num_inputs) reverse_input(.din(dout_hold), .dout(dout_temp));
       end
   endgenerate

   generate
      if (latency > 1)
   	begin:latency_gt_0
	   synth_reg # (dout_width, latency-1)
	     data_reg (.i(dout_temp),
		       .ce(internal_dest_ce),
		       .clr(internal_clr),
		       .clk(dest_clk),
		       .o(dout));
   	end
      if (latency <= 1)
     	begin:latency0
	   assign dout = dout_temp;
     	end
   endgenerate

endmodule

//Need to create a new module to avoid ModelSim crashes
module s2p_bit_reverse (din, dout);
   parameter signed [31:0] din_width = 2;
   parameter signed [31:0] dout_width = 8;
   parameter signed [31:0] num_inputs = 4;

   input [dout_width-1:0] din;
   output [dout_width-1:0] dout;
   genvar index;

   generate
      for (index=0; index<num_inputs; index=index+1)
  	begin:u0
   	  assign dout[(num_inputs-index)*din_width-1:(num_inputs-index-1)*din_width] = din[index*din_width+din_width-1:index*din_width];
       end
 endgenerate

endmodule
`timescale 1 ns / 10 ps
module ofdm_transreceiver_xlregister (d, rst, en, ce, clk, q);
   parameter d_width = 5;
   parameter init_value = 'b0;

   input [d_width-1:0] d;
   input rst, en, ce, clk;
   output [d_width-1:0] q;

   wire internal_clr, internal_ce;

   assign internal_clr = rst & ce;
   assign internal_ce  = ce & en;

   synth_reg_w_init #(.width(d_width),
                      .init_index(2),
                      .init_value(init_value),
                      .latency(1))
   synth_reg_inst(.i(d),
                  .ce(internal_ce),
                  .clr(internal_clr),
                  .clk(clk),
                  .o(q));
endmodule

`timescale 1 ns / 10 ps
module ofdm_transreceiver_xldelay #(parameter width = -1, latency = -1, reg_retiming = 0, reset = 0)
  (input [width-1:0] d,
   input ce, clk, en, rst,
   output [width-1:0] q);

generate
  if ((latency == 0) || ((reg_retiming == 0) && (reset == 0)))
  begin:srl_delay
    synth_reg # (width, latency)
      reg1 (
        .i(d),
        .ce(ce & en),
        .clr(1'b0),
        .clk(clk),
        .o(q));
  end

  if ((latency>=1) && ((reg_retiming) || (reset)))
  begin:reg_delay
    synth_reg_reg # (width, latency)
      reg2 (
        .i(d),
        .ce(ce & en),
        .clr(rst),
        .clk(clk),
        .o(q));
  end
endgenerate
endmodule
`timescale 1 ns / 10 ps
module sysgen_constant_8952236100 (
  output [(5 - 1):0] op,
  input clk,
  input ce,
  input clr);
  assign op = 5'b00010;
endmodule
`timescale 1 ns / 10 ps
module sysgen_mcode_block_ff752da6c7 (
  input [(23 - 1):0] i,
  input [(23 - 1):0] q,
  input [(5 - 1):0] thrd,
  output [(4 - 1):0] b,
  input clk,
  input ce,
  input clr);
  wire signed [(23 - 1):0] i_1_24;
  wire signed [(23 - 1):0] q_1_27;
  wire signed [(5 - 1):0] thrd_1_30;
  localparam [(1 - 1):0] const_value = 1'b1;
  localparam [(1 - 1):0] const_value_x_000000 = 1'b0;
  localparam [(1 - 1):0] const_value_x_000001 = 1'b1;
  localparam [(1 - 1):0] const_value_x_000002 = 1'b0;
  localparam [(1 - 1):0] const_value_x_000003 = 1'b1;
  wire signed [(23 - 1):0] cast_6_17;
  wire rel_6_13;
  reg [(1 - 1):0] b1_join_6_9;
  localparam [(1 - 1):0] const_value_x_000004 = 1'b0;
  localparam [(1 - 1):0] const_value_x_000005 = 1'b1;
  localparam [(1 - 1):0] const_value_x_000006 = 1'b0;
  localparam [(1 - 1):0] const_value_x_000007 = 1'b1;
  localparam [(1 - 1):0] const_value_x_000008 = 1'b0;
  wire signed [(6 - 1):0] cast_13_18;
  wire signed [(6 - 1):0] neg_13_17;
  wire signed [(23 - 1):0] cast_13_17;
  wire rel_13_13;
  reg [(1 - 1):0] b1_join_13_9;
  localparam [(1 - 1):0] const_value_x_000009 = 1'b1;
  localparam [(1 - 1):0] const_value_x_000010 = 1'b0;
  localparam [(1 - 1):0] const_value_x_000011 = 1'b0;
  localparam signed [(23 - 1):0] const_value_x_000012 = 23'sb00000000000000000000000;
  wire rel_4_9;
  reg [(1 - 1):0] b0_join_4_5;
  localparam [(1 - 1):0] const_value_x_000013 = 1'b1;
  localparam [(1 - 1):0] const_value_x_000014 = 1'b0;
  reg [(1 - 1):0] b1_join_4_5;
  localparam [(1 - 1):0] const_value_x_000015 = 1'b1;
  localparam [(1 - 1):0] const_value_x_000016 = 1'b0;
  localparam [(1 - 1):0] const_value_x_000017 = 1'b1;
  wire signed [(23 - 1):0] cast_21_17;
  wire rel_21_13;
  reg [(1 - 1):0] b3_join_21_9;
  localparam [(1 - 1):0] const_value_x_000018 = 1'b0;
  localparam [(1 - 1):0] const_value_x_000019 = 1'b1;
  localparam [(1 - 1):0] const_value_x_000020 = 1'b0;
  localparam [(1 - 1):0] const_value_x_000021 = 1'b1;
  localparam [(1 - 1):0] const_value_x_000022 = 1'b0;
  wire signed [(6 - 1):0] cast_28_18;
  wire signed [(6 - 1):0] neg_28_17;
  wire signed [(23 - 1):0] cast_28_17;
  wire rel_28_13;
  reg [(1 - 1):0] b3_join_28_9;
  localparam [(1 - 1):0] const_value_x_000023 = 1'b1;
  localparam [(1 - 1):0] const_value_x_000024 = 1'b0;
  localparam [(1 - 1):0] const_value_x_000025 = 1'b0;
  localparam signed [(23 - 1):0] const_value_x_000026 = 23'sb00000000000000000000000;
  wire rel_19_9;
  reg [(1 - 1):0] b2_join_19_5;
  localparam [(1 - 1):0] const_value_x_000027 = 1'b1;
  localparam [(1 - 1):0] const_value_x_000028 = 1'b0;
  reg [(1 - 1):0] b3_join_19_5;
  wire [(4 - 1):0] b_35_5_concat;
  assign i_1_24 = i;
  assign q_1_27 = q;
  assign thrd_1_30 = thrd;
  assign cast_6_17 = {{6{thrd_1_30[4]}}, thrd_1_30[4:0], 12'b000000000000};
  assign rel_6_13 = i_1_24 > cast_6_17;
  always @(rel_6_13)
    begin:proc_if_6_9
      if (rel_6_13)
        begin
          b1_join_6_9 = const_value_x_000004;
        end
      else 
        begin
          b1_join_6_9 = const_value_x_000005;
        end
    end
  assign cast_13_18 = {{1{thrd_1_30[4]}}, thrd_1_30[4:0]};
  assign neg_13_17 = -cast_13_18;
  assign cast_13_17 = {{5{neg_13_17[5]}}, neg_13_17[5:0], 12'b000000000000};
  assign rel_13_13 = i_1_24 > cast_13_17;
  always @(rel_13_13)
    begin:proc_if_13_9
      if (rel_13_13)
        begin
          b1_join_13_9 = const_value_x_000009;
        end
      else 
        begin
          b1_join_13_9 = const_value_x_000010;
        end
    end
  assign rel_4_9 = i_1_24 > const_value_x_000012;
  always @(b1_join_13_9 or b1_join_6_9 or rel_4_9)
    begin:proc_if_4_5
      if (rel_4_9)
        begin
          b0_join_4_5 = const_value_x_000013;
          b1_join_4_5 = b1_join_6_9;
        end
      else 
        begin
          b0_join_4_5 = const_value_x_000014;
          b1_join_4_5 = b1_join_13_9;
        end
    end
  assign cast_21_17 = {{6{thrd_1_30[4]}}, thrd_1_30[4:0], 12'b000000000000};
  assign rel_21_13 = q_1_27 > cast_21_17;
  always @(rel_21_13)
    begin:proc_if_21_9
      if (rel_21_13)
        begin
          b3_join_21_9 = const_value_x_000018;
        end
      else 
        begin
          b3_join_21_9 = const_value_x_000019;
        end
    end
  assign cast_28_18 = {{1{thrd_1_30[4]}}, thrd_1_30[4:0]};
  assign neg_28_17 = -cast_28_18;
  assign cast_28_17 = {{5{neg_28_17[5]}}, neg_28_17[5:0], 12'b000000000000};
  assign rel_28_13 = q_1_27 > cast_28_17;
  always @(rel_28_13)
    begin:proc_if_28_9
      if (rel_28_13)
        begin
          b3_join_28_9 = const_value_x_000023;
        end
      else 
        begin
          b3_join_28_9 = const_value_x_000024;
        end
    end
  assign rel_19_9 = q_1_27 > const_value_x_000026;
  always @(b3_join_21_9 or b3_join_28_9 or rel_19_9)
    begin:proc_if_19_5
      if (rel_19_9)
        begin
          b2_join_19_5 = const_value_x_000027;
          b3_join_19_5 = b3_join_21_9;
        end
      else 
        begin
          b2_join_19_5 = const_value_x_000028;
          b3_join_19_5 = b3_join_28_9;
        end
    end
  assign b_35_5_concat = {b3_join_19_5, b2_join_19_5, b1_join_4_5, b0_join_4_5};
  assign b = b_35_5_concat;
endmodule
`timescale 1 ns / 10 ps
module ofdm_transreceiver_xlsprom
  #(parameter c_width = 0,
   parameter c_address_width = 0,
   parameter mem_size = 0,
   parameter mem_init_file ="none",
   parameter read_reset_val ="0",
   parameter mem_type ="auto",
   parameter latency = 0)
  (input  ce, clk, en, rst,
   input [c_address_width-1:0] addr,
   output [c_width-1:0] data);

   wire [c_width-1:0] core_data_out,dly_data_out;    
   assign data = dly_data_out;

generate
  xpm_memory_sprom # (
  // Common module parameters
  .MEMORY_SIZE        (mem_size),
  .MEMORY_PRIMITIVE   (mem_type),                        //string; auto, distributed, block or ultra;
  .MEMORY_INIT_FILE   (mem_init_file), 
  .MEMORY_INIT_PARAM  (""),
  .USE_MEM_INIT       (0),
  .WAKEUP_TIME        ("disable_sleep"),
  .MESSAGE_CONTROL    (0),

  // Port A module parameters
  .READ_DATA_WIDTH_A  (c_width),
  .ADDR_WIDTH_A       (c_address_width),
  .READ_RESET_VALUE_A (read_reset_val),
  .READ_LATENCY_A     (latency)

) xpm_memory_sprom_inst (
 // Common module ports
  .sleep          (1'b0),
  // Port A module ports
  .clka           (clk),
  .rsta           (rst & ce),
  .ena            (en & ce),
  .regcea         (1'b1),
  .addra          (addr),
  .injectsbiterra (1'b0),  //do not change
  .injectdbiterra (1'b0),  //do not change
  .douta          (core_data_out),
  .sbiterra       (),      //do not change
  .dbiterra       ()       //do not change
);
 if (latency > 1)
     begin:latency_tst
       synth_reg # (c_width, latency-1)
         reg1 (
               .i(core_data_out),
               .ce(ce),
               .clr(1'b0),
               .clk(clk),
               .o(dly_data_out));
      end 
      if (latency <= 1)
      begin:latency_1
         assign dly_data_out = core_data_out;
      end       
endgenerate
endmodule
`timescale 1 ns / 10 ps

module  ofdm_transreceiver_xlslice  (x, y);

//Parameter Definitions
parameter new_msb= 9;
parameter new_lsb= 1;
parameter x_width= 16;
parameter y_width= 8;

//Port Declartions
input [x_width-1:0] x;
output [y_width-1:0] y;

assign y = x[new_msb:new_lsb];

endmodule

`timescale 1 ns / 10 ps
module  xlofdm_transreceiver_xfft_v9_1_i0_d212fa5848aec63af7e06b139f794ee4 (ce,clk,in_im,in_re,op_im,op_re);

input ce;
input clk;
input[15:0] in_im;
input[15:0] in_re;
output[22:0] op_im;
output[22:0] op_re;
wire event_frame_started;
wire[47:0] m_axis_data_tdata_net;
wire m_axis_data_tlast;
wire m_axis_data_tvalid;
wire s_axis_config_tready;
wire[31:0] s_axis_data_tdata_net;
wire s_axis_data_tready;
  assign op_im = m_axis_data_tdata_net[46 : 24];
  assign op_re = m_axis_data_tdata_net[22 : 0];
  assign s_axis_data_tdata_net[31 : 16] = in_im;
  assign s_axis_data_tdata_net[15 : 0] = in_re;
  ofdm_transreceiver_xfft_v9_1_i0 ofdm_transreceiver_xfft_v9_1_i0_instance(
      .aclk(clk),
      .aclken(ce),
      .event_frame_started(event_frame_started),
      .m_axis_data_tdata(m_axis_data_tdata_net),
      .m_axis_data_tlast(m_axis_data_tlast),
      .m_axis_data_tready(1'b1),
      .m_axis_data_tvalid(m_axis_data_tvalid),
      .s_axis_config_tdata(8'b00000000),
      .s_axis_config_tready(s_axis_config_tready),
      .s_axis_config_tvalid(1'b1),
      .s_axis_data_tdata(s_axis_data_tdata_net),
      .s_axis_data_tlast(1'b0),
      .s_axis_data_tready(s_axis_data_tready),
      .s_axis_data_tvalid(1'b1)
    );

 endmodule



`timescale 1 ns / 10 ps
module  xlofdm_transreceiver_xfft_v9_1_i0_cad188b2740f25cd0ec8cc0eb6f69249 (ce,clk,in_im,in_re,op_im,op_re);

input ce;
input clk;
input[15:0] in_im;
input[15:0] in_re;
output[22:0] op_im;
output[22:0] op_re;
wire event_frame_started;
wire[47:0] m_axis_data_tdata_net;
wire m_axis_data_tlast;
wire m_axis_data_tvalid;
wire s_axis_config_tready;
wire[31:0] s_axis_data_tdata_net;
wire s_axis_data_tready;
  assign op_im = m_axis_data_tdata_net[46 : 24];
  assign op_re = m_axis_data_tdata_net[22 : 0];
  assign s_axis_data_tdata_net[31 : 16] = in_im;
  assign s_axis_data_tdata_net[15 : 0] = in_re;
  ofdm_transreceiver_xfft_v9_1_i0 ofdm_transreceiver_xfft_v9_1_i0_instance(
      .aclk(clk),
      .aclken(ce),
      .event_frame_started(event_frame_started),
      .m_axis_data_tdata(m_axis_data_tdata_net),
      .m_axis_data_tlast(m_axis_data_tlast),
      .m_axis_data_tready(1'b1),
      .m_axis_data_tvalid(m_axis_data_tvalid),
      .s_axis_config_tdata(8'b00000001),
      .s_axis_config_tready(s_axis_config_tready),
      .s_axis_config_tvalid(1'b1),
      .s_axis_data_tdata(s_axis_data_tdata_net),
      .s_axis_data_tlast(1'b0),
      .s_axis_data_tready(s_axis_data_tready),
      .s_axis_data_tvalid(1'b1)
    );

 endmodule



