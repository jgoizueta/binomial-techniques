In Octave/Matlab we can use the `lgamma` function
to compute this:

```
exp(lgamma(N+1)-2*lgamma(N/2+1)-N*log(2))
```
