from decimal import *

def fact(x):
    fact = 1
    while x > 1 :
        fact *= x
        x -= 1
    return fact

def prob(n) :
    n = Decimal(n)
    x = n/2
    a = fact(n)
    b = fact(x)
    b *= b
    c = Decimal(2)**n
    return a/b/c

for n in [3030, 1000, 500, 200, 100, 50, 10] :
  p = round(prob(n)*100, 2)
  print n, " : ", p, " %"
