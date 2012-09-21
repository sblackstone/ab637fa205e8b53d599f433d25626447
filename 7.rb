require 'lib'

x = 0

n = 3

while true
  x = x + 1 if isPrime?(n)
  break if x == 10000
  n = n + 2
end

puts n