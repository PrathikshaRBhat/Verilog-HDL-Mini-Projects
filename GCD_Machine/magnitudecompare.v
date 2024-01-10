`timescale 1ns/1ps

module magnitudeCompare(in1, in2, greaterThen, equal, lessThen);
input [15:0] in1, in2;
output equal, lessThen, greaterThen;
assign lessThen = in1<in2?1:0;
assign greaterThen = in1>in2?1:0;
assign equal = in1==in2?1:0;
endmodule

