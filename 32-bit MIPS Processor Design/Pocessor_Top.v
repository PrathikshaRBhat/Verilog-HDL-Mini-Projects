`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.01.2024 18:33:01
// Design Name: 
// Module Name: Processor_Top
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


module Processor_Top(clk,rst_n);

input clk;
input rst_n;

wire [31:0] ctrl_in_address; //input address to PC
wire [31:0] out_address;  //outpt address from PC
wire [31:0] addr_incr;  //increment operation. It is equal to 4 or 0 based on reset value
wire [31:0] address_plus_4;//PC output + 4 (out_address +4)if reset is high
wire [31:0] branch_addr_offset; //output of shift reg, input to calculate BTA
wire [31:0] branch_address; //the brach target address
wire [31:0] instrn; //is the instruction from instruction memory
wire ctrl_write_en; //it enables final_write_en if reset is 1
wire final_write_en; //control signal to write data in reg memory
wire [4:0] ctrl_write_addr; //write register
wire [31:0] ctrl_regwrite_data; //write data
wire [31:0] read_data1; //read data from reg memory
wire [31:0] read_data2;  //read data from reg memory
wire [31:0] sign_ext_out; //output of sign extension 32 bit
wire [31:0] ctrl_aluin2; //output from mux, input to 2nd ALU Input (BTA Alu)
wire [31:0] alu_result; //output to ALU , contains computed address, input to data memory
wire zero_out; //output of ALU indication branch equal (difference zero)
wire [31:0] datamem_read_data; //output of data memory which reads data present in the input address(alu_result)
wire ctrl_datamem_write_en; //control signal to write in data memory

assign addr_incr = (!rst_n) ? 32'd0 : 32'd4;  //if reset 0, no increment to next memory location and if reset 1, pc address is incremented by PC+4
assign final_write_en = (!rst_n) ? 1'b0 : ctrl_write_en;

Program_Counter prg_cntr (.clk(clk), .rst_n(rst_n), .in_address(ctrl_in_address), .out_address(out_address));

//PC Output address is incremented by 4
Adder adder_next_addr (.in1 (out_address), .in2 (addr_incr), .out (address_plus_4));

//to calculate branch target address
Adder adder_branch_addr (.in1 (address_plus_4), .in2 (branch_addr_offset), .out (branch_address));

//fetch instruction from istruction memory
Instruction_Memory instr_mem (.instrn_address (out_address), .instrn (instrn[31:0]));

//register memory unit
Register_File regfile (
.clk (clk),
.rst_n (rst_n),
.read_addr1 (instrn[25:21]), //read register 1
.read_addr2 (instrn[20:16]), //read register 2
.write_en   (final_write_en), //RegWrite
.write_addr (ctrl_write_addr), //write egister
.write_data (ctrl_regwrite_data), //write data
.read_data1 (read_data1),  //read data from reg memory
.read_data2 (read_data2) //read data from reg memory
);

//sign extension 16 to 32 bit
Sign_Extension sign_ext (.bits16_in (instrn[15:0]),.bits32_out (sign_ext_out));

//shift by 2 bits to calculate BTA
Shifter shifter (.indata (sign_ext_out),.shift_amt (2'd2),.shift_left (1'b1), .outdata (branch_addr_offset));


//ALU Top modle computing result address and Zero for BTA
Alu_Top alu (
.opcode (instrn[31:26]),
.func_field (instrn[5:0]),
.A (read_data1),
.B (ctrl_aluin2),
.result (alu_result),
.zero (zero_out)
);

//data memory
Data_Memory data_mem (
.clk (clk),
.address (alu_result),//output from alu input to data memory
.write_en (ctrl_datamem_write_en),
.write_data (read_data2),
.read_data (datamem_read_data)
);

Control_Logic ctrl_logic (
.instrn			  (instrn),
.instrn_opcode   (instrn[31:26]),
.address_plus_4  (address_plus_4),
.branch_address  (branch_address),
.ctrl_in_address (ctrl_in_address),
.alu_result      (alu_result),
.zero_out        (zero_out),
.ctrl_write_en   (ctrl_write_en),
.ctrl_write_addr (ctrl_write_addr),
.read_data2      (read_data2),
.sign_ext_out    (sign_ext_out),
.ctrl_aluin2     (ctrl_aluin2),
.ctrl_datamem_write_en (ctrl_datamem_write_en),
.datamem_read_data (datamem_read_data),
.ctrl_regwrite_data (ctrl_regwrite_data)
);

endmodule
