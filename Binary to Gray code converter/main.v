`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.12.2023 18:58:54
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
    input [3:0] Bin,
    output [3:0] Gray
    );
    
    udp_xor x1(Gray[0], Bin[0], Bin[1]);
    udp_xor x2(Gray[1], Bin[1], Bin[2]);
    udp_xor x3(Gray[2], Bin[2], Bin[3]);
    udp_xor x4(Gray[3], Bin[3], 0);
    endmodule
    
    primitive udp_xor(y,a,b);
    input a;
    input b;
    output y;
   
table
    00:0;
    01:1;
    10:1;
    11:0;
    endtable
    
endprimitive



