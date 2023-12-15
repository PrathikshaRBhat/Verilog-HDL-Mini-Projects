`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.12.2023 19:56:34
// Design Name: 
// Module Name: and_xor
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

//pre processing step
module and_xor(a, b, p, g);
 //very first inputs - and/xor
 input a, b;
 output p, g;
 xor(p, a, b);
 and(g, a, b);

endmodule

