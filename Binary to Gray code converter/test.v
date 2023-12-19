`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.12.2023 19:06:06
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
    reg [3:0] Bin;
    wire [3:0] Gray;
   integer i;
   
    main uut(Bin, Gray);
    
    initial
    begin
    for(i=0; i<16; i=i+1)
    #10 {Bin[3], Bin[2], Bin[1], Bin[0]}=i;
    
   #10; $finish;
    end
endmodule

