`timescale 1ns/1ps
module tb;
reg clk, rst, GO; 
reg [15:0] in1, in2;
wire done;
wire [15:0] out;

GCD_Machine main(clk, rst, GO, in1, in2,out, done);

initial
$monitor($time, " input1 = %d, input2 = %d, gcd = %d",in1,in2,out);

always
begin
clk<=0;
#25;
clk<=1;
#25;
end


initial begin
//reset
rst<=1;
GO<=0;

#100;
rst<=0;
in1<=10;
in2<=5;#100;
GO<=1;
while(done==1)begin #50; end
GO<=0;
while(done!=1)begin #50; end
$display ("done = %b out = %d", done,out);


#1000;
rst<=0;
in1<=24;
in2<=11;#100;
GO<=1;
while(done==1)begin #50; end
GO<=0;
while(done!=1)begin #50; end
$display ("done = %b out = %d", done,out);

#1000;
rst<=0;
in1<=48;
in2<=6;

#100;
//gcd(10,5) = 5

GO<=1;
while(done==1)begin #50; end
GO<=0;
while(done!=1)begin #50; end
$display ("done = %b out = %d", done,out);

#1000; 
$finish;
end

endmodule

