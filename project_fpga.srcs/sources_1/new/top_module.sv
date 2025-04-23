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
	input var logic data,
	output var logic data_ready,
	output var logic [loudness_meter_pkg::NLEDS-1:0] led
    );
    
    logic [15:0] tdata;
    logic tvalid;
    logic ws, sel;
    
    i2s_to_pcm i2s(
         .clk(clk),
         .arstn(arstn),
         .data(data),
         .lrclk(ws),
         .sel(sel),
         .tdata_pcm(tdata),
         .tvalid_pcm(tvalid));
         
    loudness_top lt(
          .arstn(arstn),
          .clk(ws),
          .data(tdata),
          .data_valid(tvalid),
          .data_ready(data_ready),
          .led(led)
          );
    
endmodule
