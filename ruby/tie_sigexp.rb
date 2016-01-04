# This uses a base-10 significand-exponent format to
# keep intermediate values.
# This way, intermediate values could be represented as:
def sig_exp_to_s(sig, exp)
  "#{sig}E#{exp}"
end

# Given the decimal logarithm of a quantity x,
# return the significand s and exponent e such
# that x = s*10**e
def log10_sig_exp(l10)
  exp = l10.floor
  sig = 10**(l10 - exp)
  [sig, exp]
end

# Return the base 10 significand and exponent of gamma(x)
def gamma_sig_exp(x)
  l10 = Math.lgamma(x).first/Math.log(10)
  log10_sig_exp(l10)
end

# Return the base 10 significand and exponent of the factorial of x
def fact_sig_exp(n)
  gamma_sig_exp(n + 1)
end

# Return the base 10 significand and exponent of b**x
def power_sig_exp(b, x)
  l10 = x / Math.log(10, b)
  log10_sig_exp(l10)
end

# Compute binary distribution using base-10 logartihmic decomposition
# (i.e. separate base 10 floating point components)
def prob(n)
  n = n
  x = n/2
  as, ae = fact_sig_exp(n)
  bs, be = fact_sig_exp(x)
  bs *= bs
  be *= 2
  cs, ce = power_sig_exp(2, n)

  s = as / bs / cs
  e = ae - be - ce
  s*10**e
end

[3030, 1000, 500, 200, 100, 50, 10].each do |n|
  p = (prob(n)*100).round(2)
  puts "#{n} : #{p} %"
end
