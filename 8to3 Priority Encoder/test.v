`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.12.2023 18:53:02
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
reg [7:0] ip;reg En;
wire [2:0] out;

main1 uut(ip, En,  out);

initial
begin
En=1;
ip=8'b00000000;
#10; ip=8'b00000001;
#10; ip=8'b0000001x;
    #10; ip=8'b000001xx;
    #10; ip=8'b00001xxx;
    #10; ip=8'b0001xxxx;
    #10; ip=8'b001xxxxx;
    #10; ip=8'b01xxxxxx;
    #10; ip=8'b1xxxxxxx; #10;
    end
endmodule

