`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.12.2023 19:58:53
// Design Name: 
// Module Name: main_top
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

//8-bit Kogge-Stone adder
module main_top (x, y, sum, cin, cout);
//kogge stone structural model
 input [7:0] x, y; //input
 output [7:0] sum; //output
 input cin; //carry-in
 output cout; //carry-out
 wire [7:0] G_Z, P_Z, //wires
 G_A, P_A, 
 G_B, P_B,
 G_C, P_C;
 
 
 //carry generation
 //level 1
 gray_cell level_0A(cin, P_Z[0], G_Z[0], G_A[0]);
 black_cell level_1A(G_Z[0], P_Z[1], G_Z[1], P_Z[0], G_A[1], P_A[1]);
 black_cell level_2A(G_Z[1], P_Z[2], G_Z[2], P_Z[1], G_A[2], P_A[2]);
 black_cell level_3A(G_Z[2], P_Z[3], G_Z[3], P_Z[2], G_A[3], P_A[3]);
 black_cell level_4A(G_Z[3], P_Z[4], G_Z[4], P_Z[3], G_A[4], P_A[4]);
 black_cell level_5A(G_Z[4], P_Z[5], G_Z[5], P_Z[4], G_A[5], P_A[5]);
 black_cell level_6A(G_Z[5], P_Z[6], G_Z[6], P_Z[5], G_A[6], P_A[6]);
 black_cell level_7A(G_Z[6], P_Z[7], G_Z[7], P_Z[6], G_A[7], P_A[7]);
 //level 2 
 gray_cell level_1B(cin, P_A[1], G_A[1], G_B[1]);
 gray_cell level_2B(G_A[0], P_A[2], G_A[2], G_B[2]);
 black_cell level_3B(G_A[1], P_A[3], G_A[3], P_A[1], G_B[3], P_B[3]);
 black_cell level_4B(G_A[2], P_A[4], G_A[4], P_A[2], G_B[4], P_B[4]);
 black_cell level_5B(G_A[3], P_A[5], G_A[5], P_A[3], G_B[5], P_B[5]);
 black_cell level_6B(G_A[4], P_A[6], G_A[6], P_A[4], G_B[6], P_B[6]);
 black_cell level_7B(G_A[5], P_A[7], G_A[7], P_A[5], G_B[7], P_B[7]);
 //level 3
 gray_cell level_3C(cin, P_B[3], G_B[3], G_C[3]);
 gray_cell level_4C(G_A[0], P_B[4], G_B[4], G_C[4]);
 gray_cell level_5C(G_B[1], P_B[5], G_B[5], G_C[5]);
 gray_cell level_6C(G_B[2], P_B[6], G_B[6], G_C[6]);
 black_cell level_7C(G_B[3], P_B[7], G_B[7], P_B[3], G_C[7], P_C[7]);
 //level 4
 gray_cell level_7D(cin, P_C[7], G_C[7], cout);
 
 
 //xor with and
 //pre processing step
 and_xor level_Z0(x[0], y[0], P_Z[0], G_Z[0]);
 and_xor level_Z1(x[1], y[1], P_Z[1], G_Z[1]);
 and_xor level_Z2(x[2], y[2], P_Z[2], G_Z[2]);
 and_xor level_Z3(x[3], y[3], P_Z[3], G_Z[3]);
 and_xor level_Z4(x[4], y[4], P_Z[4], G_Z[4]);
 and_xor level_Z5(x[5], y[5], P_Z[5], G_Z[5]);
 and_xor level_Z6(x[6], y[6], P_Z[6], G_Z[6]);
 and_xor level_Z7(x[7], y[7], P_Z[7], G_Z[7]);
 
 
 //outputs
 //compute sum and carry
 //post processing step
 xor(sum[0], cin, P_Z[0]);
 xor(sum[1], G_A[0], P_Z[1]);
 xor(sum[2], G_B[1], P_Z[2]);
 xor(sum[3], G_B[2], P_Z[3]);
 xor(sum[4], G_C[3], P_Z[4]);
 xor(sum[5], G_C[4], P_Z[5]);
 xor(sum[6], G_C[5], P_Z[6]);
 xor(sum[7], G_C[6], P_Z[7]);
endmodule


