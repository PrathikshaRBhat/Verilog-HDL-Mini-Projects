`timescale 1ns/1ps
module register(clk, rst, data_in, load,data_out);
input [15:0] data_in;
input rst, clk, load;
output reg [15:0] data_out;
always@(posedge clk)
begin
if(rst==1)
data_out<=0;
else if(load==1)
data_out<=data_in;
end
endmodule


