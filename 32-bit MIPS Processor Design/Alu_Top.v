`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.12.2023 16:05:37
// Design Name: 
// Module Name: Alu_Top
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

module Alu_Top(opcode,func_field,A,B,result,zero);

input [5:0] opcode;
input [5:0] func_field;
input [31:0] A;
input [31:0] B;
output [31:0] result;
output zero;
wire [2:0] alu_control;

//generate the alu control signalsfrom opcode and functional field as input
Alu_Control alu_ctrlr_inst(opcode, func_field, alu_control);

//do the necessary operations based on alu control signals
Alu_Core alu_core_inst (A,B,alu_control,result,zero);

endmodule


