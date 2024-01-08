`timescale 1ns/1ps
module mux2to1 (
input i0, i1, sel,
output out);
assign out = (sel==0)?i0:i1;
endmodule

module full_adder(
input a, b, cin,
output sum, cout);
assign sum=a^b^cin;
assign cout=(a&b)|(b&cin)|(cin&a);
endmodule
 
module select(
input [3:0]X, Y,
input Cin,
output [3:0] sum,
output Cout);
wire [3:0] A, C1, C2, B;

full_adder FA1(X[0], Y[0], 1'b0, A[0],C1[0]);
full_adder FA2(X[1], Y[1], C1[0], A[1],C1[1]);
full_adder FA3(X[2], Y[2], C1[1], A[2],C1[2]);
full_adder FA4(X[3], Y[3], C1[2], A[3],C1[3]);

full_adder FA5(X[0], Y[0], 1'b1, B[0],C2[0]);
full_adder FA6(X[1], Y[1], C2[0], B[1],C2[1]);
full_adder FA7(X[2], Y[2], C2[1], B[2],C2[2]);
full_adder FA8(X[3], Y[3], C2[2], B[3],C2[3]);

mux2to1 m1(A[0], B[0], Cin, sum[0]);
mux2to1 m2(A[1], B[1], Cin, sum[1]);
mux2to1 m3(A[2], B[2], Cin, sum[2]);
mux2to1 m4(A[3], B[3], Cin, sum[3]);

mux2to1 m5(C1[3], C2[3], Cin, Cout);

endmodule

