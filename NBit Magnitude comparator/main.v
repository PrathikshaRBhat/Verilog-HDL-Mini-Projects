`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.12.2023 16:42:12
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


module main(ip1,ip2,ip1_gt_ip2,ip1_eq_ip2,ip1_lt_ip2);
     parameter n=32;
    input [n-1:0] ip1;
    input [n-1:0] ip2;
    output reg ip1_gt_ip2=0;
    output reg ip1_eq_ip2=0;
    output reg ip1_lt_ip2=0;
    
   
    
    always @(ip1 or ip2)
    begin
    if(ip1>ip2)
        begin
        ip1_gt_ip2=1;
        ip1_eq_ip2=0;
        ip1_lt_ip2=0;
        end
     
     else if(ip1<ip2)
     begin
        ip1_gt_ip2=0;
        ip1_eq_ip2=0;
        ip1_lt_ip2=1;
      end
      
     else
        begin
        ip1_gt_ip2=0;
        ip1_eq_ip2=1;
        ip1_lt_ip2=0;
      end
   end  

endmodule

