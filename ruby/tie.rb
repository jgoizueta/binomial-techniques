def prob(n)
  x = n/2
  b = (2..x).reduce(:*)
  a = b * ((x+1)..n).reduce(:*)
  b *= b
  c = 2**n
  (a.to_r / b.to_r / c).to_f
end

[3030, 1000, 500, 200, 100, 50, 10].each do |n|
  p = (prob(n)*100).round(2)
  puts "#{n} : #{p} %"
end
