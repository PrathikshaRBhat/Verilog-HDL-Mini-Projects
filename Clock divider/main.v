`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.12.2023 16:10:26
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


module main(
input clk, reset,
output reg div2, div4, div8, div16, div32);
reg [4:0]count; 

always @(posedge clk)
begin
if(reset == 0)
count = 5'b00000;
else 
count = count+1;
div2 = count[0]; //to divide original clock by 2
div4 = count[1]; //to divide original clock by 4
div8 = count[2]; //to divide original clock by 8
div16 = count[3];  //to divide original clock by 16
div32 = count[4];  //to divide original clock by 32
end
endmodule

