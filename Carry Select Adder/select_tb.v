`timescale 1ns/1ps
module select_tb;
reg [3:0]X,Y;
reg Cin;
wire [3:0]sum;
wire Cout;  


select uut(X,Y,Cin,sum,Cout);
initial begin
$monitor($time,"X=%b(%d),Y=%b(%d),Cin=%b(%d),sum=%b(%d),Cout=%b(%d)",X,X,Y,Y,Cin,Cin,sum,sum,Cout,Cout);
X = 0;
Y = 0;
    
 #10; X=4'b0001; Y=4'b1000;Cin=4'b0001;
 #10; X=4'b0010; Y=4'b0101;Cin=4'b0011;
 #10; X=4'b0011; Y=4'b0100;Cin=4'b0010;
 #10; X=4'b0100; Y=4'b0111;Cin=4'b0001;
 #10; X=4'b0101; Y=4'b0001;Cin=4'b0011;
 #10; X=4'b0110; Y=4'b0100;Cin=4'b0010;
 #10; X=4'b0111; Y=4'b0011;Cin=4'b0001;
 #10; X=4'b0100; Y=4'b1000;Cin=4'b0101;
 #10; X=4'b0101; Y=4'b0001;Cin=4'b0101;
 #10; X=4'b1000; Y=4'b0001;Cin=4'b0001;

$finish;
end
endmodule

