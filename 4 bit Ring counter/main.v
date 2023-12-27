`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.12.2023 18:20:09
// Design Name: 
// Module Name: Ring_counter
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


module Ring_counter(clk, clr, q);
    input clk;
    input clr;
    output reg [3:0] q;
    
    always @(posedge clk)
    begin
    if (clr == 1'b1)
    q <= 4'b1000; //count order 0
    
    else
    begin
    q[3]<=q[0];
    q[2]<=q[3];
    q[1]<=q[2];
    q[0]<=q[1];
    end
    end
endmodule

