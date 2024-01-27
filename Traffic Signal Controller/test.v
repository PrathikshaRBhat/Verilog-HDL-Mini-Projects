i`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.01.2024 21:42:06
// Design Name: 
// Module Name: testbench
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

`define TRUE 1'b1   //compiler directive-a statement that causes the compiler to take a specific action during compilation
`define FALSE 1'b0
module testbench;
reg clk, clear;
reg X; //if true indicates that there is car in the country road, otherwise false
wire [1:0] hwy, cntry;

main uut(clk, clear, X, hwy, cntry);

initial
$monitor($time,"highway = %b, country = %b, X=%b",hwy, cntry, X);

//set clock
initial begin
clk = `FALSE; //clk=0
forever #5 clk = ~clk;
end

initial
begin
clear = `TRUE; //clear=1, reset state to s0
repeat (5)@(negedge clk); //instead of writing delay as #5, it can be written like this

clear = `FALSE; //clear=0
X=`FALSE; //X=0
#100 X=`TRUE;
#150 X=`FALSE;

#100 X=`TRUE;
#150 X=`FALSE;

clear = `TRUE; //clear=1, reset state to s0
repeat (5)@(negedge clk); //instead of writing delay as #5, it can be written like this

clear = `FALSE; //clear=0

#100 X=`TRUE;
#150 X=`FALSE;

#100; $stop;
end
endmodule
