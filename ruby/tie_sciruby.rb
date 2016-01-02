require 'distribution'

[3030, 1000, 500, 200, 100, 50, 10].each do |n|
  p = Distribution::Binomial.pdf(n/2, n, 0.5)
  p = (p*100).round(2)
  puts "#{n} : #{p} %"
end
