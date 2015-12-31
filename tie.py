import math
from fractions import Fraction

def prob(n) :
    x = n/2
    a = math.factorial(n)
    b = math.factorial(x)
    b *= b
    c = 2**n
    return Fraction(a,b)/c

for n in [3030, 1000, 500, 200, 100, 50, 10] :
  p = round(prob(n)*100, 2)
  print n, " : ", p, " %"
