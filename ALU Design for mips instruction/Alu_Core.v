`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.12.2023 15:59:58
// Design Name: 
// Module Name: Alu_Core
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

module Alu_Core(A,B, alu_control,result,zero);

input [31:0] A;
input [31:0] B;
input [2:0] alu_control;
output reg [31:0] result;
output wire zero;

assign zero = !(|result);//oring the entire resut to 1 bit value and then invert.

always @ (*)
begin
	case(alu_control)
	3'h0: result = A + B;
	3'h1: result = A - B;
	3'h2: result = A & B;
	3'h3: result = A | B;
	3'h4: result = ~(A | B);
	3'h5: result = (A < B);
	default: result = A + B;
	endcase
end
endmodule


