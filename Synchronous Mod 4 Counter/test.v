`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.01.2024 21:08:19
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
wire [3:0] count;

main uut(.clk(clk), .rst(rst), .count(count));

always #10 clk=~clk;

initial begin
clk=0;
rst=0;
#10; rst=1;
#500; rst=0;
#10; rst=1;
#10;$finish;
end
endmodule

