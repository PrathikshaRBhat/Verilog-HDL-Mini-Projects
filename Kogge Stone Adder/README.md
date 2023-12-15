Kogge stone adder has 3 steps invloved
1. Pre processing block
2. Carry generation block
3. Post processing block

    STEP 1:  Pre processing block
    Propagated signal Pi = Ai XOR Bi
    Generated Signal Gi = Ai AND Bi

    STEP 2:  Carry generation block
    2a. Black cell: produce both propagated and generated signal
        P = Pi AND Pj (Pj is previous value of Pi)
        G = Gi OR (Pi AND Gj) (Gj is previous value of Gi)

    2b. Gray cell: produce only generated signal
         G = Gi OR (Pi AND Gj) (Gj is previous value of Gi)

    STEP 3: Post processing block
    Computing the final sum and carry bits
        Si = Pi XOR Ci-1
        Ci = Gi
