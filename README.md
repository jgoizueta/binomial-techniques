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
