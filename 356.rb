=begin


Previous	
Next
Largest roots of cubic polynomials
Problem 356
Let an be the largest real root of a polynomial g(x) = x3 - 2n·x2 + n.
For example, a2 = 3.86619826...

Find the last eight digits of.

Note:  represents the floor function.


g(x) = x^3 - (2^n)(x^2) + n

a =    1
b = -2^n
c =    0
d =    n

delta = 18abcd -4b^3d + b^2c^2 - 4ac^3 - 27a^2d^2



=end

require 'pp'
require 'bigdecimal'


class ComplexBigDecimal
  def initialize(a,b)
    
  end
  
end




def descrim(a,b,c,d)
  18*a*b*c*d - 4*(b**3)*d + (b**2)*(c**2) - 4*a*(c**3) - 27*(a**2)*(d**2)
end


def coeff(n)
  return 1, (-1 * 2**n), 0, n
end


1.upto(30) do |n|
  a,b,c,d = coeff(n)
  puts "#{n}: #{descrim(a,b,c,d)}"
end




exit
a,b,c,d = coeff(2)

d = descrim(a,b,c,d)

d0 = b**2 - 3*a*c
d1 = 2*b**3 - 9*a*b*c + 27*a**2*d



sq = 27*a*a*d
sq = sq.sqrt(50)
sq += d1
sq /= 2
c = sq**(1/3.0)


r1 = (b + sq  + (d0 / c)) / 3*a

puts r1
