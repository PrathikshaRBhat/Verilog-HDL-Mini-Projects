`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.12.2023 18:29:34
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
reg inp, reset, clk;
wire y;

main uut(inp, reset, clk, y);

initial
begin
clk=0;
reset=1;
#10 inp=1'b1;
#10 inp=1'b0;
#10 inp=1'b1;
#10 inp=1'b0;
#10 inp=1'b1;
#10 inp=1'b0;


#50; reset=0;
#10 inp=1'b1;
#10 inp=1'b0;
#10 inp=1'b1;
#10 inp=1'b0;
#10 inp=1'b1;
#10 inp=1'b0;
end


always
#10 clk=~clk;


endmodule

