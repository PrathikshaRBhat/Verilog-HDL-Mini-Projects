`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.12.2023 11:30:46
// Design Name: 
// Module Name: test
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

module test();
reg clk;
wire [2:0] count;

main uut(clk, count);

always
begin
#10; clk=1'b0;
#10; clk=1'b1;
end

initial begin
clk=0;
end
endmodule

