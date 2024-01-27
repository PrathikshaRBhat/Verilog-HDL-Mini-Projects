`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.01.2024 16:51:55
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
reg clk, rst;
wire [3:0]count;

counter uut(clk, rst, count);

always #5 clk = ~clk;

initial begin
clk=0;
rst=0;

#20; rst=1;
#150; rst=0;
#30; rst=1;
#200;
end
endmodule

