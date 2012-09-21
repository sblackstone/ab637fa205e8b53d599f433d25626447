require 'lib'

n = 100


sqofsum = ((n * (n+1) ) / 2) ** 2

sumosq = 0

1.upto(n) do |x|
  sumosq = sumosq + x ** 2
end


pp sqofsum
pp sumosq


pp sqofsum - sumosq