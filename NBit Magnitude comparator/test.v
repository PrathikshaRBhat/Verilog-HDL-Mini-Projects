`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.12.2023 16:48:39
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
    reg [31:0] ip1;
    reg [31:0] ip2;
    wire ip1_gt_ip2;
    wire ip1_eq_ip2;
    wire ip1_lt_ip2;
    
main uut(ip1,ip2,ip1_gt_ip2,ip1_eq_ip2,ip1_lt_ip2);

initial 
begin
ip1=10; ip2=10;
#10; ip1=100; ip2=120;
#10; ip1=120; ip2=50;
#10; ip1=556; ip2=9807;
#50; $finish; 

end
endmodule

