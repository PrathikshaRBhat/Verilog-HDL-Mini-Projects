module mux_tb();
reg [3:0] inp;
reg [1:0] sel;
wire out;
integer i;
mux uut(.a(inp), .sel(sel), .out(out));

initial
begin
	$monitor($time, " input=%b, select line=%b, output=%b", inp, sel, out);
	#10;
	inp=4'b1101;
	for(i=0; i<4; i=i+1)
	begin
		sel = i;
		#10;
	end
#20;

	inp=4'b0110;
	
	for(i=0; i<4; i=i+1)
	begin
		sel = i;
		#10;
	end
#20;
end
endmodule
