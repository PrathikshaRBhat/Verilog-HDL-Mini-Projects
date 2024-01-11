`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.01.2024 21:14:22
// Design Name: 
// Module Name: counter_tb
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


module counter_tb();
reg clk, rst, updown;
wire [3:0] count;

counter uut(clk,rst,updown, count);

always
#5 clk=~clk;

initial
begin
clk=0;
rst=0;
updown=1;
#10;rst=1;
#100;updown=0;
#120; rst=0;
#10; rst=1;
#10; updown=0;
#50;
end
endmodule

