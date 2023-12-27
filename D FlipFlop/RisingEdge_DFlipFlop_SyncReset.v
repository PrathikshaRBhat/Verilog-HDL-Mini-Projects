`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.12.2023 09:50:39
// Design Name: 
// Module Name: RisingEdge_DFlipFlop_SyncReset
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


module RisingEdge_DFlipFlop_SyncReset(D, clk, rst, Q);
    input D, clk;
    input rst;
    output reg Q;
    
    always @(posedge clk)
        begin
            if(rst==1'b1)
                Q <= 1'b0;
                
            else
                Q <= D;
        end
endmodule

