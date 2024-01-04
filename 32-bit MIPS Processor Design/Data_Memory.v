`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.01.2024 17:56:08
// Design Name: 
// Module Name: Data_Memory
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


module Data_Memory(clk,address,write_en,write_data,read_data);
	 
input clk;
input [31:0] address;
input write_en;
input [31:0] write_data;
output wire [31:0] read_data;

//Registers are addressed as per MIPS register table
reg [7:0] data_mem [31:0];
										
initial begin
$readmemh("data_memory.mem", data_mem);
end

assign read_data = {data_mem[address+3],data_mem[address+2],
		     data_mem[address+1],data_mem[address]};


always @ (posedge clk)
begin
data_mem[address]   <= write_en ? write_data[7:0]   : data_mem[address];
data_mem[address+1] <= write_en ? write_data[15:8]  : data_mem[address+1];
data_mem[address+2] <= write_en ? write_data[23:16] : data_mem[address+2];
data_mem[address+3] <= write_en ? write_data[31:24] : data_mem[address+3];
end

endmodule

