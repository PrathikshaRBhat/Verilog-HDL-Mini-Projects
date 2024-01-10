`timescale 1ns/1ps
module controller (clk, rst, go, a_gt_b, a_eq_b, a_lt_b, a_ld, b_ld, a_sel, b_sel , output_en, done);
input clk, rst, go;
input a_gt_b, a_lt_b, a_eq_b;
output reg a_sel, b_sel, a_ld, b_ld, done, output_en;

reg [2:0] cstate, nstate;

parameter S0 = 3'b000;
parameter S1 = 3'b001;
parameter S2 = 3'b010;
parameter S3 = 3'b011;
parameter S4 = 3'b100;
parameter S5 = 3'b101;
parameter S6 = 3'b110;
parameter S7 = 3'b111;

always@(rst or posedge clk)
begin
if(rst == 1)
cstate <= S0;
else
cstate <= nstate;
end

always@(go or a_gt_b or a_lt_b or a_eq_b or cstate )
begin
case(cstate)
S0:
	begin
		if(go == 0)
			nstate <= S0;
		else
			nstate <= S1;
	end

S1: nstate <= S2;
S2: nstate <= S3;
S3: begin
	if(a_gt_b == 1) nstate <= S4;
	else if(a_lt_b == 1) nstate <= S5;
	else nstate <= S7;
    end
S4: nstate <= S6;
S5: nstate <= S6;
S6: nstate <= S3;
S7: nstate <= S0;
default: nstate <= S0;
endcase 
end

always@(go or a_gt_b or a_lt_b or a_eq_b or cstate)
begin
case(cstate)
S0:
	begin
		a_sel <= 0; b_sel <= 0; a_ld <=0; b_ld <= 0; done <= 1; output_en <= 0;
	end

S1:
	begin
		a_sel <= 1; b_sel <= 1; a_ld <=1; b_ld <= 1; done <= 0; output_en <= 0;
	end

S2:
	begin
		a_sel <= 0; b_sel <= 0; a_ld <=0; b_ld <= 0; done <= 0; output_en <= 0;
	end

S3:
	begin
		a_sel <= 0; b_sel <= 0; a_ld <=0; b_ld <= 0; done <= 0; output_en <= 0;
	end

S4:
	begin
		a_sel <= 0; b_sel <= 0; a_ld <=1; b_ld <= 0; done <= 0; output_en <= 0;
	end

S5:
	begin
		a_sel <= 0; b_sel <= 0; a_ld <=0; b_ld <= 1; done <= 0; output_en <= 0;
	end

S6:
	begin
		a_sel <= 0; b_sel <= 0; a_ld <=0; b_ld <= 0; done <= 0; output_en <= 0;
	end

S7:
	begin
		a_sel <= 0; b_sel <= 0; a_ld <=0; b_ld <= 0; done <= 1; output_en <= 1;
	end

default:
	begin
		a_sel <= 0; b_sel <= 0; a_ld <=0; b_ld <= 0; done <= 0; output_en <= 0;
	end
endcase
end

endmodule

