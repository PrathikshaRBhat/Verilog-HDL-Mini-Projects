`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.12.2023 17:11:00
// Design Name: 
// Module Name: tb
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


module tb();
reg clk, reset;
wire div2, div4, div8, div16, div32;

main uut (clk, reset, div2, div4, div8, div16, div32);

initial
begin
clk=0;
reset=0;
#50 reset = 1;
end

always begin 
#10; clk = ~clk;
end

initial begin
#1000; $finish;
end


endmodule
