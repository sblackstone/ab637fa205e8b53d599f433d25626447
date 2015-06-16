=begin
Exploring the number of different ways a number can be expressed as a sum of powers of 2.
Problem 169
Define f(0)=1 and f(n) to be the number of different ways n can be expressed as a sum of integer powers of 2 using each power no more than twice.

For example, f(10)=5 since there are five different ways to express 10:

1 + 1 + 8
1 + 1 + 4 + 4
1 + 1 + 2 + 2 + 4
2 + 4 + 4
2 + 8

What is f(1025)?
=end


require './euler_lib.rb'

a = Array.new(85,0)


def eval(arr)
  s = 0
  0.upto(arr.length - 1) do |p|
    s += arr[p] * (2**p)
  end
  s
end

def ways_to_express(n, cur = 0, p = 1)
  if cur == n
    return 1
  end
  if p > n or cur > n
    return 0
  end
  
  total = 0
  0.upto(2) do |j|
    total += ways_to_express(n, cur + (j * p), p*2)
  end
  return total
end

1.upto(100) do |i|
  v = ways_to_express(10**i)
  puts "#{10**i}: #{v}"
end