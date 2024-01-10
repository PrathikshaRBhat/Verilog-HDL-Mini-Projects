`timescale 1ns/1ps
module mux2to1(out, sel, i1, i2);
input [15:0] i1,i2; 
input sel;
output [15:0] out;
assign out = (sel==0)?i1:i2;
endmodule

