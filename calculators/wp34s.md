
Using double precision:

```
DBLON

<N>
ENTER
ENTER
2
x<>y
y^x
x<>y
ENTER
ENTER
2 /
COMB
x<>y
/
```

Using the `PROB` `Binom` distribution:

```
0.5 STO J
<N> STO K
x Binomp
```

Using LNGamma (Gamma is the actual greek letter)
```
<N>
1 + LNGamma
<N> 2 /
1 + GAMMA
-
<N> 2 LN
-
e^x
```
