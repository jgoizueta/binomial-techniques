function prob(n)
  n = BigInt(n)
  two = BigInt(2)
  x = div(n,2)
  a = factorial(n)
  b = factorial(x)
  b *= b
  c = two^n
  return a // b // c
end

for n in [3030, 1000, 500, 200, 100, 50, 10]
  p = float64(round(prob(n)*100, 2))
  println(n, " : ", p, " %")
end
