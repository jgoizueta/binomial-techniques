lfact = (x) ->
  f = 0
  while x > 1
    f += Math.log(x)
    x -= 1
  f

prob = (n) ->
  Math.exp(lfact(n) - 2*lfact(n/2) - n*Math.log(2))

for n in [3030, 1000, 500, 200, 100, 50, 10]
  p = prob(n)
  console.log "#{n} #{(p*100).toFixed(2)}"
