`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.12.2023 07:43:37
// Design Name: 
// Module Name: Register_File
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


module Register_File(clk, rst_n, read_addr1, read_addr2, write_en, write_addr, write_data, read_data1, read_data2);
input clk, rst_n;
input [4:0] read_addr1, read_addr2;
input write_en;
input [4:0] write_addr;
input [31:0] write_data;

output wire [31:0] read_data1, read_data2;
reg [31:0] reg_mem[31:0];

initial begin
$readmemh("reg_memory.mem",reg_mem);
end

//for read operation from register memory
assign read_data1 = reg_mem[read_addr1];
assign read_data2 = reg_mem[read_addr2];

//for write operation to register memory
always@(posedge clk or negedge rst_n)
begin
if(!rst_n)//uf reset 0, no write operation, keep old value
begin
reg_mem[write_addr] <= reg_mem[write_addr];
end

else //else if reset is hight do write operation ony if write enable is high
begin
reg_mem[write_addr] <= write_en ? write_data : reg_mem[write_addr];
end
end

endmodule

