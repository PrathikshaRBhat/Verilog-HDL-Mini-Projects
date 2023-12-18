Carry Look Ahead Adder ( CLA Adder )
The Carry Look Ahead Adder is a parallel adder that uses a lookahead logic to determine the carry signal for each bit position.

The lookahead logic generates the carry signals for each bit position based on the inputs and the carry signals from the previous bit positions.

This reduces the propagation delay of the carry signal and improves the overall speed of the adder.


The CLA is typically implemented using full adders (FAs) and carry lookahead units (CLUs). The FA is a combinational logic circuit that adds three inputs: two binary digits and a carry input.

The output of the FA is a sum bit and a carry output. The CLU is a combinational logic circuit that generates the carry signals for each bit position based on the inputs and the carry signals from the previous bit positions.


The carry look-ahead logic uses two terms to calculate the carry output: the generate (G) term and the propagate (P) term.

Generate Term (G): The generate term (G) represents the condition when the input bits generate a carry output. It is calculated as the logical AND of the input bits.G_i = (A_i AND B_i). For each bit position, G_i is the carry generated by the two input bits A_i and B_i.
Propagate Term (P): The propagate term (P) represents the condition when the input bits propagate a carry output. It is calculated as the logical OR of the input bits.P_i = (A_i OR B_i). For each bit position, P_i is the carry propagated by the two input bits A_i and B_i.
Using these generate and propagate terms, the carry look-ahead logic computes the carry output (C_i+1) for each bit position i based on the input bits (A_i, B_i) and the carry input (C_i). The carry output (C_i+1) can be calculated as:

C_i+1 = G_i + P_i*C_i

This formula can be understood as the sum of two terms. The first term (G_i) represents the carry generated by the input bits, and the second term (P_i*C_i) represents the carry propagated from the previous stage (C_i). Therefore, the carry output for a given bit position can be computed without waiting for the carry input from the previous stage.

Finally, the sum output (S_i) can be obtained by taking the exclusive OR (XOR) of the input bits (A_i, B_i) and the carry input (C_i). It can be represented as:

S_i = A_i XOR B_i XOR C_i