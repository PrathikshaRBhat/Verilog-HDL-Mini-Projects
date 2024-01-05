`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.01.2024 16:29:23
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
//compiler directive
`define TRUE 1'b1
`define FALSE 1'b0

module main(clk, clear, X, hwy, cntry);
input clk, clear, X;
output reg [1:0] hwy, cntry;
    
    //internal state variables
    reg [2:0] state;
    reg [2:0] next_state;
    
    parameter S0=3'd0;
    parameter S1 = 3'd1;
    parameter S2 = 3'd2;
    parameter S3 = 3'd3;
    parameter S4 = 3'd4;
    
    parameter RED = 2'd0,
            YELLOW = 2'd1,
            GREEN = 2'd2;
    
    parameter Y2R_delay =3; //3 delay unit from yellow to red
    parameter R2G_delay = 2; //2 delay unit from red to green

    
       
    //state change only at posege of clk
    always @(posedge clk)
    if(clear)
    state<=S0;
    else
    state <= next_state;
    
    
    always @(state)
    begin
    hwy = GREEN; //0 //default values
    cntry = RED; //2
   
    case(state)  //state defination
    S0:     ;
    S1: hwy = YELLOW;   
    S2: hwy = RED; 
    S3: begin
            hwy = RED;
            cntry = GREEN;
        end
    S4: begin
            hwy = RED;
            cntry = YELLOW;
        end
    endcase
 end
 
 
 //logic - what happens in each state
 always@(state or X)
 begin
  case(state)
    S0: if(X)
        next_state = S1;
        else
        next_state = S0;
    
    S1: begin //delaying
        repeat (Y2R_delay)@(posedge clk) next_state=S1;
        next_state = S2;
        end
        
    S2: begin //delaying
        repeat (R2G_delay)@(posedge clk)next_state=S2;
        next_state = S3;
        end
    
    S3: if(X)
        next_state = S3;//same state if car present
        else
        next_state = S4;//next state if no car      
 
    S4: begin //delaying
        repeat (Y2R_delay)@(posedge clk)next_state=S4;
        next_state = S0;
        end
    default: next_state = S0;
    endcase
    end
 
endmodule

