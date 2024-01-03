`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.12.2023 07:19:15
// Design Name: 
// Module Name: Program_Counter
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


module Program_Counter(clk, rst_n, in_address, out_address);
input clk, rst_n;
input [31:0] in_address;
output reg [31:0] out_address;

always @(posedge clk or negedge rst_n)
begin 
if(!rst_n)//reset =0 then output address=0
out_address <= 32'd0;
else
out_address <= in_address;
end

endmodule

