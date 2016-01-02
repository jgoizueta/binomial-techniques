Compute probability of tie result in poll.

Binomial distribution: 2 results (success/failure) per events;
Count number of successes after N events.
Probability of success p; q = 1 - p

Binomial probability of x successes in N trials:

```
N!/(x!*(N-x)!)*p^x*q^(N-x) = (\binom{N}{x}) p^x q^(1-x)
```

Tie probability (x=N/2) with N voters (yes/no voting).
(p = 1/2)

|  N   |         |
|-----:|--------:|
| 3030 | 0.01449 |
| 1000 | 0.02523 |
|  200 | 0.05635 |
|  100 | 0.07959 |

Note:

```
x=N/2, p=q=1/2 => N!/(N/2)!^2 / p^N
```

Computing this for N=3030 requires handling large numbers
(N!/(N/2)!^2) is approximately 1.9E910 and
2^N is approximately 1.3E912.

To compute it in floating point, exponents as large as 912
must be supported. Common IEEE floating point formats
are not apt for this, but it we can use
HP50G XREALs (internal numeric format) or
the LONGFLOAT library, DBL mode can be used on the WP34S,
or numeric types such as Julia BigFloat, Flt for Ruby,
Decimal for Python, etc.)

An alternative way is to compute this exactly using
fractions of arbitrary large integers (as supported by Ruby,
Python, Julia, HP50 an various CASs systems)
and then compute the quotient (which may be tricky
due to overflow, e.g. on the HP50G)

To avoid overflow problems while computing with
standard precision (IEEE floating point)
the techniques of:

Fast and Accurate Computation of Binomial Probabilities
by Catherine Loader (2000) can be used.
Some implementation of this and similar algorithms,
capable of handling large values of N
without extended arithmetic are:

* The `dbinom` function from R
* `scipy.stats.binom` from SciPy
* `Binomp` from the WP34S
* `BINOM.DIST` from Spreasheets such as Calc or Excel.
  Note that  `BINOMDIST` from Numbers
  has narrower limits for its arguments.
* The `Distribution::Binomial`
  of the SciRuby `distribution` gem,
  if the 'GSL' library and the 'rb-gsl' gems
  are installed (otherwise for large numbers the
  result will be NaN)
