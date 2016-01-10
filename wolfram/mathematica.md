The `BinomialDistribution` function of Mathematica
can be used for the desired result:

```
PDF[BinomialDistribution[N, 0.5], N/2]
```

Example:

```
Table[
  PDF[BinomialDistribution[n, 0.5], n/2],
  {n, {3030, 1000, 500, 200, 100, 50, 10}}
]
```

We can also compute using the binomial coefficient
function:

```
Table[
  N[Binomial[n, n/2]/2^n],
  {n, {3030, 1000, 500, 200, 100, 50, 10}}
]
```

Exact values (as rational numbers) can also be computed,
with:

```
Table[
  PDF[BinomialDistribution[n, 1/2], n/2],
  {n, {3030, 1000, 500, 200, 100, 50, 10}}
]
```

Or with:

```
Table[
  Binomial[n, n/2]/2^n,
  {n, {3030, 1000, 500, 200, 100, 50, 10}}
]
```
