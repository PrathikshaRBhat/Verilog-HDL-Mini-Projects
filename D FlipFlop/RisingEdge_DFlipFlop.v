`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.12.2023 09:50:39
// Design Name: 
// Module Name: RisingEdge_DFlipFlop
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


module RisingEdge_DFlipFlop(D,clk,Q);
    input D, clk;
    output reg Q;
    
    always@(posedge clk)
        begin
            Q <= D;
        end
endmodule

