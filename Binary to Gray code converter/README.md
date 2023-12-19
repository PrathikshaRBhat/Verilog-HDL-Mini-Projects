Binary to Gray conversion : 

The Most Significant Bit (MSB) of the gray code is always equal to the MSB of the given binary code.
Other bits of the output gray code can be obtained by XORing binary code bit at that index and previous index.

Write the leftmost bit of the binary code as the leftmost bit of the gray code
For each subsequent bit in the binary code, XOR it with the previous bit in the binary code
Write down the result as the next bit in the gray code

In this program user defined primitives is used. The xor gate is defined as user defined primitive and the table is used to define the truthtable
