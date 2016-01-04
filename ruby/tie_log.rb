def gamma_log(x)
  Math.lgamma(x).first
end

def fact_log(n)
  gamma_log(n + 1)
end

def power_log(b, x)
  x * Math.log(b)
end

def prob(n)
  n = n
  x = n/2
  a = fact_log(n)
  b = fact_log(x)
  b *= 2
  c = power_log(2, n)

  p = a - b - c
  Math.exp(p)
end

[3030, 1000, 500, 200, 100, 50, 10].each do |n|
  p = (prob(n)*100).round(2)
  puts "#{n} : #{p} %"
end
