`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.01.2024 20:14:18
// Design Name: 
// Module Name: Control_Logic
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


module Control_Logic(
        instrn,
	instrn_opcode,
	address_plus_4,
	branch_address,
	ctrl_in_address,
	alu_result,
	zero_out,
	ctrl_write_en,
	ctrl_write_addr,
	read_data2,
	sign_ext_out,
	ctrl_aluin2,
	ctrl_datamem_write_en,
	datamem_read_data,
	ctrl_regwrite_data
    );

input [31:0] instrn;	 
input [5:0] instrn_opcode;
input [31:0] address_plus_4;
input [31:0] branch_address;
input [31:0] datamem_read_data;
input [31:0] alu_result;
input zero_out;
input [31:0] read_data2;
input [31:0] sign_ext_out;

output wire [31:0] ctrl_in_address;
output wire ctrl_write_en;
output wire [4:0] ctrl_write_addr;
output wire [31:0] ctrl_aluin2;
output wire ctrl_datamem_write_en;
output wire [31:0] ctrl_regwrite_data;

//Select either branch address (for BEQ) or address+4 (for other cases)
assign ctrl_in_address = (instrn_opcode==6'h04 && zero_out) ? branch_address : address_plus_4;

//Write enable for regfile only for R-Type and LW instructions
assign ctrl_write_en = (instrn_opcode==6'h00) || (instrn_opcode==6'h23);

//Write address for regfile selection based on R-Type and I-Type instructions
assign ctrl_write_addr = (instrn_opcode==6'h00) ? instrn[15:11] : instrn[20:16];

//Write data for regfile is from Data mem (LW) or from ALU
assign ctrl_regwrite_data = (instrn_opcode==6'h23) ? datamem_read_data : alu_result;

//Second input of ALU is either from regfile (R_Type) or sign ext unit (LW & SW)
assign ctrl_aluin2 = (instrn_opcode==6'h23 || instrn_opcode==6'h2B) ? sign_ext_out : read_data2;

//Write enable to datamem only for LW instruction
assign ctrl_datamem_write_en = (instrn_opcode==6'h2B); 

endmodule
