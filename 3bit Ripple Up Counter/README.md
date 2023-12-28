1. Ripple counter is an asynchronous counter.
2. Upcounter counts the states in ascending order
3. only 1 flipflop is applied with external clock pulse and output of 1 flipflop drives the clock input of next flipflop
4. A 'n' bit ripple counter has up to 2^n states. It is called as mod(n) counter

Truthtable:

counterState    Q2      Q1      Q0
    0           0       0       0
    1           0       0       1
    2           0       1       0
    3           0       1       1
    4           1       0       0
    5           1       0       1
    6           1       1       0
    7           1       1       1
