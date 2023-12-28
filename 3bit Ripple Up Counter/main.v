`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.12.2023 11:24:37
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
    input clk,
    //input rst,
    output reg [2:0] count
    );
    
    initial count=3'b0;
    
    always @(negedge clk)
    count[0]<=~count[0];
    
    always@(negedge count[0])
    count[1]<=~count[1];
    
    always@(negedge count[1])
    count[2]<=~count[2];
endmodule

