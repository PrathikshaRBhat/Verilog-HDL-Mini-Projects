module save_tb;

    reg [3:0] x,y,z;
    wire [4:0] s;
    wire cout;  
    
    // Instantiate the Unit Under Test (UUT)
    save uut (x,y,z,s,cout);

//Stimulus block - all the input combinations are tested here.
//the number of errors are recorded in the signal named "error".
    initial begin
$monitor($time,"x=%b(%d),y=%b(%d),z=%b(%d),s=%b(%d),cout=%b(%d)",x,x,y,y,z,z,s,s,cout,cout);
        // Initialize Inputs
        x = 0;
        y = 0;
        z = 0;

  #20 x= 4'b0010; y=4'b0001; z=4'b0100; 
  #20 x= 4'b0011; y=4'b0010; z=4'b0000; 
  #20 x= 4'b1010; y=4'b0001; z=4'b0010; 
  #20 x= 4'b1101; y=4'b1001; z=4'b0011; 
  #20 x= 4'b0100; y=4'b0101; z=4'b1000; 
        
       #20;$finish;
    end 
    
endmodule
