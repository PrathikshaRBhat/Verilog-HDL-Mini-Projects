`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.12.2023 06:46:47
// Design Name: 
// Module Name: Instruction_Memory
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


module Instruction_Memory(instrn_address, instrn);

input[31:0] instrn_address;
output wire [31:0] instrn;
reg[7:0] instrn_mem[31:0]; //8 instruction is stored in instruction memory for 8 address each of 32bit

initial begin
$readmemh("instrn_memory.mem", instrn_mem);//load initial values in instruction memory from memory file
end

assign instrn = {instrn_mem[instrn_address+3],instrn_mem[instrn_address+2],instrn_mem[instrn_address+1],instrn_mem[instrn_address]};

endmodule

