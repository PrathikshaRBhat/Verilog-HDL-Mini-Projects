`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.12.2023 22:49:42
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
input[3:0] A, B,
output [4:0] sum_out);

wire [3:0] sum, generator, propagator;
wire [4:0] carry;

full_adder fa1(A[0], B[0], carry[0], sum[0],);
full_adder fa2(A[1], B[1], carry[1], sum[1],);
full_adder fa3(A[2], B[2], carry[2], sum[2],);
full_adder fa4(A[3], B[3], carry[3], sum[3],);

and a1(generator[0], A[0], B[0]);
and a2(generator[1], A[1], B[1]);
and a3(generator[2], A[2], B[2]);
and a4(generator[3], A[3], B[3]);

xor x1(propagator[0], A[0], B[0]);
xor x2(propagator[1], A[1], B[1]);
xor x3(propagator[2], A[2], B[2]);
xor x4(propagator[3], A[3], B[3]);

wire w0, w1, w2, w3;
assign carry[0] = 1'b0;

and an1(w0, propagator[0], carry[0]);
or o1(carry[1], generator[0], w0);

and an2(w1, propagator[1], carry[1]);
or o2(carry[2], generator[1], w1);

and an3(w2, propagator[2], carry[2]);
or o3(carry[3], generator[2], w2);

and an4(w3, propagator[3], carry[3]);
or o4(carry[4], generator[3], w3);

assign sum_out = {carry[4],sum};

endmodule


module full_adder(
input a, b,cin,
output sum, cout);
assign sum = a^b^cin;
assign carry = (a&b)|(b&cin)|(cin&a);
endmodule

