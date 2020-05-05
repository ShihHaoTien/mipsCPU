// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.4 (win64) Build 1071353 Tue Nov 18 18:29:27 MST 2014
// Date        : Sat Mar 30 10:26:53 2019
// Host        : DESKTOP-BRS6M9C running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               e:/minimipsb3/minimips/minimips.srcs/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0_stub.v
// Design      : blk_mem_gen_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_2,Vivado 2014.4" *)
module blk_mem_gen_0(clka, addra, douta)
/* synthesis syn_black_box black_box_pad_pin="clka,addra[9:0],douta[31:0]" */;
  input clka;
  input [9:0]addra;
  output [31:0]douta;
endmodule
