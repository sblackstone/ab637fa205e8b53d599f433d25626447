=begin
An Arithmetic Geometric sequence
Problem 235
Given is the arithmetic-geometric sequence u(k) = (900-3k)r**whichk-1.
Let s(n) = Σk=1...nu(k).

Find the value of r for which s(5000) = -600,000,000,000.

Give your answer rounded to 12 places behind the decimal point.

a = 897
d = -3
n = 5000





=end

def u(k,r)
  (900 - 3*k) * r**(k-1)
end


def s(r)
  sum = 0
  1.upto(5000) do |k|
    sum += u(k,r)
  end
  return(sum)
end


require 'bigdecimal'



def s(r)
  a   = BigDecimal.new("897.0")
  d   = BigDecimal.new("-3.0")
  n   = BigDecimal.new("5000.0")
  (a / (1 - r)) - (((a + (n - 1)*d)*r**n) / (1-r)) + (d*r*(1 - r**(n - 1)) / (1 - r)**2) + 600_000_000
end

def sr_dr(r)
  a   = BigDecimal.new("897.0")
  d   = BigDecimal.new("-3.0")
  n   = BigDecimal.new("5000.0")
  897/(1 - r)**2 + (14997*r**4999)/(1 - r)**2 + (70500000*r**4999)/(1 - r) + (14100*r**5000)/(1 - r)**2 - (3*(1 - r**4999))/(1 - r)**2 - (6*r*(1 - r**4999))/(1 - r)**3
end



x = BigDecimal.new("-25")

1.upto(5) do |i|
  x = x - (s(x)/sr_dr(x))
  puts "#{i} #{x}"
end
