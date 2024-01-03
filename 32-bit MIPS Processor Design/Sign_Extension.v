`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.01.2024 20:31:15
// Design Name: 
// Module Name: Sign_Extensions
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


module Sign_Extension(bits16_in, bits32_out);

input [15:0] bits16_in;
output wire [31:0] bits32_out;

assign bits32_out = {{16{bits16_in[15]}} , bits16_in[15:0]};  //output 32 bit is appended by the sign of input bit before the actual 16 bits. The sign of input bit is at index 15[MSB]
endmodule

