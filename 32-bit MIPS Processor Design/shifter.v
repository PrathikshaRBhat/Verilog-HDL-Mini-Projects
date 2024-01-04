`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.01.2024 18:13:19
// Design Name: 
// Module Name: Shifter
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



module Shifter(indata,shift_amt,shift_left,outdata);

input [31:0] indata;
input [1:0] shift_amt;
input shift_left;
output wire [31:0] outdata;

assign outdata = shift_left ? indata<<shift_amt : indata>>shift_amt;

endmodule
