BigNumber = require 'bignumber.js'

fact = (x) ->
  f = new BigNumber(1)
  x = new BigNumber(x)
  while x > 1
    f = f.times(x)
    x = x.minus(1)
  f

prob = (n) ->
  two = new BigNumber(2)
  n = new BigNumber(n)
  x = n.div(2)
  a = fact(n)
  b = fact(x)
  b = b.times(b)
  c = two.toPower(n)
  a.div(b).div(c)

for n in [3030, 1000, 500, 200, 100, 50, 10]
  p = prob(n)
  console.log "#{n} #{p.times(100).round(2)}"
