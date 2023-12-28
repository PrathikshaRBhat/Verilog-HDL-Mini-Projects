`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.12.2023 16:48:57
// Design Name: 
// Module Name: test
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


module test();

reg clk,reset_n;
reg [2:0] no_of_bits;
reg [7:0]ip;
wire [7:0] shift_out;

main uut(clk,reset_n,no_of_bits,ip,shift_out);

initial
forever #10 clk=~clk;

initial 
begin
clk=0;
reset_n=0;
ip=8'b1111_1111;
#10;
reset_n=1;
no_of_bits=3'd1;

#10;
no_of_bits=3'd2;//total 2 bit shift

#100;
reset_n=0;

#10;
reset_n=1;
no_of_bits=3'd4;

end
endmodule

