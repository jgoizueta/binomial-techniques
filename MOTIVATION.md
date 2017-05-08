
After this [curious ballot in Catalonia](http://ccaa.elpais.com/ccaa/2015/12/27/catalunya/1451220474_678536.html) that resulted in a 3030 voters tie, I [read in a newspaper](http://elpais.com/elpais/2015/12/30/opinion/1451494005_530001.html) about it being a very improbable situation with a probability of 0.33 per mille ("according to mathematicians").

I immediately felt that it was not right: it was approximately like considering all voting results equally probable as if
the polling consisted in picking the number of "yes" votes at random (1000/3030 = 0.33...) thus considering results such as 0 or 3030 as likely as any other.

After thinking a little about it, and remembering about the [binomial distribution](https://en.wikipedia.org/wiki/Binomial_distribution)
I regarded it would be more realistic to consider each vote a 'yes/no' independent event with a probability of 0.5.

So we have this distribution/formula $`{\binom {n}{k}}p^{k}(1-p)^{n-k}`$ with
 $`{\binom {n}{k}}={\frac {n!}{k!(n-k)!}}`$

And the probability of tie for N voters w, assuming the 0.5 individual probability would be:

```
N! / ( (N/2)!^2 * 2^N )
```

Note that I actually believe a more realistic model would yield higher probability for the tie; for example as
another crude approximation we could consider N people to have decided previously their votes and the rest deciding with 0.5 probability at the assembly... But this is not about politics or modeling polls accurately, but about computing our estimate with the mentioned formula.

## Limitations

The formula seems easy to compute but it's not so, because it involves huge intermediate results.

For example if we try to compute `(N!/(N/2)!^2)` and then divide by `2^N`, the intermediate values we'll need to handle are aproximately 1.9E910 and 1.3E912. (and then their quotient is 1.9/1.3 * 10^-2, i.e. about 1.5%). But the problem is obtainig the huge partial results.

I first turned to [WolframAlpha](http://www.wolframalpha.com/input/?i=3030!+%2F+((3030%2F2)!%5E2+*+2%5E3030)) to get the result, then tried to reproduce with the calcs I had around, then turned to programming languages.

If we use a calculator it probably will perform computations using a few (12?, 15?) significant digits and possibly with exponential notation (i.e. having a separate power of 10 multiplier applied to the significand) with a maximum exponent of perhaps about 100 or 500.

If we use some form of computer (i.e. a device's calculator or some programming language) it will most probably use 64-bit IEEE floating point for the arithmetic; this limits the maximum number that can be handled to about 1.8E308.

## Solutions

If we can use a [*good* implementation](http://octave.1599824.n4.nabble.com/attachment/3829107/0/loader2000Fast.pdf) of the binomial distribution (one that performs its computation in a way that avoids overflow) you may be able to obtain the result within the limits of IEEE numbers. That is the case with spreadsheets such as **Calc** (from OpenOffice) or **Excel** (`BINOM.DIST`), but not with Apple's Numbers (`BINOMDIST`).

Other systems that have such a function are:
* R (`dbinom` function)
* SciPy (`scipy.stats.binom`)
* SciRuby (`Distribution::Binomial` from the `distribution gem) if using GSL (i.e. having installed rb-gsl gem and GSL library)
* The WP34S and WP31S calculators (`Binomp`)

### Alternatives

If we don't have a binomial distribution function, or it has a naive implementation that doesn't avoid early overflow, we have several ways to work around this problem:

#### A. Exact arithmetic

One is to compute exactly the answer using some kind of CAS (Computer Algebra System) or arbitrary precision integers.
The result will be a fraction with huge integers in the numerator and denominator. This will provide us little information about the result, so we now need to compute or estimate the decimal value of this fraction. It may no be easy, as both the numerator and denominator will overflow the approximate numbers of our calculator/system (some CAS systems will either support arbitrary precision approximate numbers or be smart enough to show us the correct result (examples: Mathematica, Giac, SymPy, Maxima, ...)

If we've obtained the fraction of large integers, ee can do a quick estimate by realizing the numerator has two digits less than the denominator, then taking a few digits from the numerator and dividing them by a few (plus two) of the denominator, like this.

In some cases (HP50G) we'll have to use this estimate or some of the other methods below.

#### B. Extended/arbitrary precision

Another approach is to use higher precision numbers (at least allowing larger base exponents), such as Python's `Decimal`, Julia's BigFloat, Ruby's `Flt`, C libraries such as GMP, MPFR, decNumber, etc.

#### C. Using logarithms

Computing with logarithms not only reduces the magnitude of large numbers, it also simplifies calculations by transforming products into sums, and exponentiation into multiplication.

Some systems provide a `lgamma` function, which is the logarithm of the gamma function. The gamma function allow us to compute the factorial as `n! = gamma(n+1)`, so we can compute the logarithm of our problem as `lgamma(n) - 2*gamma(x) - n*ln(x)`.

This won't overflow because we're now dealing with the logarithms of the huge numbers we had. The final answer can be obtained by computing the exponential function (raising e to the power of the result).

If the `lgamma` is not available all is not lost, we can easily compute the logarithm of the factorial by summing the
logarithm of all the factors:

```
Sum(x=1, n, log(x)) = log(x!)
```

(if we're using a calculator we'll need a programmable one or we'll have to add thousand of terms!)