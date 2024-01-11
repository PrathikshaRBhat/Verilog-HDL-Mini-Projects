`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.01.2024 20:59:06
// Design Name: 
// Module Name: counter
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


module counter(clk,rst,updown,count);
input clk, rst, updown;
output reg [3:0] count;

always@(posedge clk or negedge rst)
begin
if(!rst)
count <= 0;
else begin
if(updown)begin //if updown=1 do up count
    if(count==4'd15)
        count <= 0;
    else
        count <= count+1;
end
else begin //if updown=0 do down count
    if(count == 0)
        count <= 4'd15;
    else
        count <= count-1;end
end
end
endmodule

