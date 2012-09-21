require 'pp'
require 'bigdecimal'
require 'bigdecimal/util'

=begin
It is well known that if the square root of a natural number is not an integer, then it is irrational. The decimal expansion of such square roots is infinite without any repeating pattern at all.

The square root of two is 1.41421356237309504880..., and the digital sum of the first one hundred decimal digits is 475.

For the first one hundred natural numbers, find the total of the digital sums of the first one hundred decimal digits for all the irrational square roots.
=end

def newton(n, prec)
  nn = BigDecimal.new(n, prec)
  x = BigDecimal.new(n, prec)
  x = x.div(2)
  10.times do |round|
    x = x - ((x**2) - nn) / (2*x)
  end
  return x  
end


@s = 0
2.upto(100) do |i|
  next if Math.sqrt(i) == Math.sqrt(i).round
  x =  newton(i.to_s, 200)
  d =  x.to_digits.split("")
  d[1] = 0
  
  0.upto(100) do |i|
    @s += d[i].to_i
  end
end
puts @s


