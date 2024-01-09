module mux2to1( a, b, sel,out);
input a, b, sel;
output out;

assign out = (sel==0)?a:b;

endmodule


module mux(
input [3:0]a,
input [1:0] sel,
output out);
wire [1:0] w;


mux2to1 m1(a[0],a[1],sel[0],w[0]);
mux2to1 m2(a[2],a[3], sel[0],w[1]);
mux2to1 m3(w[0], w[1], sel[1], out);

endmodule
