`timescale 1ns/1ps

module subtractor(X, Y, Difference);
input [15:0] X, Y;
output reg [15:0]Difference;
always@(X or Y)
begin
Difference <= X-Y;
end
endmodule

