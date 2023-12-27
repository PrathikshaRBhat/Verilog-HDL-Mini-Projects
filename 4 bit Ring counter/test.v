`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.12.2023 18:24:12
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
    
    reg clk;
    reg clr;
    wire [3:0]q;
    
    Ring_counter uut(clk, clr, q);
    
    
    //program to generate clk
    always
    begin
    #10 clk=1'b0;
    #10 clk=1'b1;
    end
    
    initial 
    begin
    clk=0;
    clr=0;
    #25; clr=1'b1;
    #25; clr=0;
    #150; clr=1'b1;
    #100;
    $finish;
    
    end
    
endmodule

