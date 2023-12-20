The priority encoder is a combinational logic circuit that contains 2^n input lines and n output lines and represents the highest priority input among all the input lines. When multiple input lines are active high at the same time, then the input that has the highest priority is considered first to generate the output.

It is used to solve the issues in binary encoders, which generate wrong output when more than one input line is active high. If more than one input line is active high(1) at the same time, then this encoder prioritizes every input level and allocates the priority level to each input.


The output of this encoder corresponds to the input that has the highest priority. To obtain the output, only the input with the highest priority is considered by ignoring all other input lines. This is a type of binary encoder or an ordinary encoder with a priority function. The input that has the larger magnitude or highest priority is encoded first rather than other input lines. Hence, the generated output is based on the priority assigned to the inputs.


The 8 to 3 priority encoder truth table is shown below.


D7  D6	D5	D4	D3	D2	D1	D0	A	B	C
0   0	0	0	0	0	0	1	0	0	0
0   0	0	0	0	0	1	X	0	0	1
0	0	0	0	0	1	X	X	0	1	0
0	0	0	0	1	X	X	X	0	1	1
0   0	0	1	X	X	X	X	1	0	0
0	0	1	X	X	X	X	X	1	0	1
0   1	X	X	X	X	X	X	1	1	0
1	X	X	X	X	X	X	X	1	1	1  
