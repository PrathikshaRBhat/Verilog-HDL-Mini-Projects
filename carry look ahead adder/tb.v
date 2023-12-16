`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.12.2023 23:20:10
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
reg [3:0] A, B;
wire [4:0] sum_out;

main uut(A, B, sum_out);

initial begin
$monitor($time, " A=%d, B=%d, sum=%d",A, B, sum_out);

repeat(10)
begin 
#10; A=$random; B=$random;
end

$finish;
end
endmodule

