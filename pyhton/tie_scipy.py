import scipy.stats

for n in [3030, 1000, 500, 200, 100, 50, 10] :
  p = scipy.stats.binom.pmf(n/2, n, 0.5)
  p = round(p*100, 2)
  print n, " : ", p, " %"
