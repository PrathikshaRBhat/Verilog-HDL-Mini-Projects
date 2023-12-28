`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.12.2023 16:38:05
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


module main(clk,reset_n,no_of_bits,ip,shift_out);
input clk,reset_n;
input [2:0]no_of_bits;
input [7:0]ip;
output reg [7:0] shift_out;

wire [7:0] data_out;

assign data_out[7:0] = (ip[7:0] >> no_of_bits);

always@(posedge clk or negedge reset_n)
begin
if(reset_n==1'b0)
shift_out <= ip;
else
shift_out <= data_out;
end
endmodule

