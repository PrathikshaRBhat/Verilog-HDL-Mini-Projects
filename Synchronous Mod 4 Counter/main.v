`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.01.2024 21:01:24
// Design Name: 
// Module Name: main
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


module main(clk, rst, count);
input clk, rst;
output reg [3:0] count;

always@(posedge clk or negedge rst)
begin
if(!rst)
count <=0;
else
begin
if(count == 4'b1111)
count<=0;
else
count<=count+1;
end
end
endmodule

