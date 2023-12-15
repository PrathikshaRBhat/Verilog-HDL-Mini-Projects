`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.12.2023 19:34:54
// Design Name: 
// Module Name: black_cell
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


module black_cell(Gkj, Pik, Gik, Pkj, G, P);
 //black cell 
 input Gkj, Pik, Gik, Pkj;
 output G, P;
 wire Y;

    and(Y, Gkj, Pik);
    or(G, Gik, Y);
    and(P, Pkj, Pik);
     
endmodule

