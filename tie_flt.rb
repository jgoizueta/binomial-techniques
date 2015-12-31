require 'flt'

def fact(x)
  if x < 1
    Flt::DecNum(0)
  else
    p = x
    loop do
      x -= 1
      if x <= 1
        break
      else
        p *= x
      end
    end
    p
  end
end

def prob(n)
  n = Flt::DecNum(n)
  x = n/2
  a = fact(n)
  b = fact(x)
  b *= b
  c = Flt::DecNum(2)**n
  (a / b / c)
end

[3030, 1000, 500, 200, 100, 50, 10].each do |n|
  p = (prob(n)*100).round(2)
  puts "#{n} : #{p} %"
end
