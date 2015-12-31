def prob(n)
  n = n
  x = n/2
  b = (2..x).reduce(:*).to_f
  a = b * ((x+1)..n).reduce(:*).to_f
  b *= b
  c = 2.0**n
  (a / b / c).to_f
end

[3030, 1000, 500, 200, 100, 50, 10].each do |n|
  p = (prob(n)*100).round(2)
  puts "#{n} : #{p} %"
end
