for (n in c(3030, 1000, 500, 200, 100, 50, 10)) {
  p = dbinom(n/2, n, 0.5)
  cat(n, " : ", round(100*p, 2), " %\n")
}
