In the HP Prime, the `BINOMIAL` function
can be used to compute the result,
but for N=3030 loss of precision occurs
in the HOME environment. The CAS environment
has higher numerical precision ()
(where numerical computations use
  ,,, bits of precision instead of 12 decimal digits)
and can be used for such arguments:

`BINOMIAL(N, 0.5, N/2)`

Surprinsingly, the Prime CAS is less apt for computing
this than the HP50G's.

The CAS can compute exactly with large integers, but
1515! overflows and produces and infinite result.
