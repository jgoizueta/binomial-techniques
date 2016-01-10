We define an auxiliar function `D` to compute the logarithm of the factorial:

```
LBL D    42.21.14;
ENTER    36;
ENTER    36;
.00101   48; 0; 0; 1; 0; 1;
+        40;
STO 0    44 0;
0        0;
ENTER    36;
LBL 2    42.21. 2;
RCL 0    45 0;
INT      43 44;
LN       43 12;
+        40;
DSE 0    42. 5. 0;
GTO 2    22 2;
RTN      43 32;
```

Note: register 0 is used as a counter.

Now the desired function of N
can be computed as `EXP(D(N)-2*D(N/2)-N*LN(2))`
with the following program:

```
LBL E   42.21.15;
STO 1   44 1;
GSB D   32 14;
STO 2   44 2;
RCL 1   45 1;
2       2;
/       10;
GDB D   32 14;
2       2;
*       20;
RCL 2   45 2;
x<>y    34;
-
RCL 1   45 1;
2       2;
LN      43 12;
*       20;
-       30;
e^x     12;
RTN     43 32;
```

Note:
Register 1 used for N; Register 2 for temporarily storing `LN(N!)`
