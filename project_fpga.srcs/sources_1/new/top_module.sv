`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/23/2025 03:40:06 PM
// Design Name: 
// Module Name: top_module
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
//import loudness_meter_pkg::*;

module top_module(
    input var logic clk, //system clk
	input var logic arstn,  // asynchronous reset
	input var logic i2s_data,
	//output var logic data_ready,
	output var logic [loudness_meter_pkg::NLEDS-1:0] led,
	output var logic i2s_lrclk,
	output var logic i2s_sel
    );
    
    logic [15:0] tdata;
    logic tvalid;
    logic data_ready;
    
    i2s_to_pcm i2s(
         .clk(clk),
         .arstn(arstn),
         .data(i2s_data),
         .lrclk(i2s_lrclk),
         .sel(i2s_sel),
         .tdata_pcm(tdata),
         .tvalid_pcm(tvalid));
         
    loudness_top lt(
          .arstn(arstn),
/// wrong!          .clk(i2s_lrclk),
          .clk(clk),
          .data(tdata),
          .data_valid(tvalid),
          .data_ready(data_ready),
          .led(led)
          );
    
endmodule
