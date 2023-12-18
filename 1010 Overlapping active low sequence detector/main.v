`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.12.2023 11:06:08
// Design Name: 
// Module Name: main
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



module main(inp, reset, clk, y);
input inp, reset, clk;
output reg y;

reg[1:0] cstate, nstate;

parameter s0=2'b00;
parameter s1=2'b01;
parameter s2=2'b10;
parameter s3=2'b11;

always@(clk or inp)
begin
case(cstate)
s0:if(inp==1'b1)
begin
nstate=s1;
y=1'b0;
end
else
begin
nstate = s0;
y=1'b0;
end

s1:if(inp==1'b1)
begin
nstate=s1;
y=1'b0;
end
else
begin
nstate = s2;
y=1'b0;
end

s2:if(inp==1'b1)
begin
nstate=s3;
y=1'b0;
end
else
begin
nstate = s0;
y=1'b0;
end

s3:if(inp==1'b1)
begin
nstate=s1;
y=1'b0;
end
else
begin
nstate = s2;
y=1'b1;
end

default:nstate=s0;
endcase
end

always@(posedge clk)
begin
if(reset)//active low
cstate<=s0;
else
cstate<=nstate;
end
endmodule

