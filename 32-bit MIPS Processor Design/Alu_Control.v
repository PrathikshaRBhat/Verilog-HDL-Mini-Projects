`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.01.2024 19:47:00
// Design Name: 
// Module Name: Alu_Control
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


module Alu_Control(opcode, func_field, alu_control);
input [5:0] opcode;
input [5:0] func_field;
output reg [2:0] alu_control;
reg [2:0] func_code;

always @ (*)
begin //for r type instructions  , the type of operation is determined by the function field (opcode field will remain as all zeroes).
	case (func_field)
	6'h20: func_code = 3'h0; //ADD
	6'h22: func_code = 3'h1; //SUB
	6'h24: func_code = 3'h2; //AND
	6'h25: func_code = 3'h3; //OR
	6'h27: func_code = 3'h4; //NOR
	6'h2A: func_code = 3'h5; //SLT
	default: func_code = 3'h0;
	endcase

    //for other instructions 
	case (opcode)
	6'h00: alu_control = func_code;
	6'h04: alu_control = 3'h1; //BEQ -SUB
	6'h23: alu_control = 3'h0; //LW -ADD
	6'h2B: alu_control = 3'h0; //SW -ADD
	default: alu_control = 3'h0;
	endcase
end
endmodule

