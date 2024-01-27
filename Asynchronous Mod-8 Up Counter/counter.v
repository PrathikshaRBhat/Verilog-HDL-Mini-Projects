`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.01.2024 16:47:23
// Design Name: 
// Module Name: counter
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


module counter(clk, rst, count);
input clk, rst;
output reg [3:0]count;

always @(posedge clk or negedge rst)
begin
if(!rst)
count <= 4'd0;
else if(count == 4'b1010)
count <= 4'd0;
else
count = count + 1'b1;
end
endmodule

