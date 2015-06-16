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




def eval(arr)
  s = 0
  0.upto(arr.length - 1) do |p|
    s += arr[p] * (2**p)
  end
  s
end

def ways_to_express(n, arr = [], i = 0)
  if eval(arr) == n
    #pp arr
    return 1
  end
  if 2**i > n 
    return 0
  end
  
  #pp eval(arr)
  total = 0
  0.upto(2) do |j|
    arr[i]= j
    total += ways_to_express(n, arr, i+1)
  end
  return total
  
end


1.upto(100) do |i|
  a = Array.new(85,0)
  v = ways_to_express(i, a)
  puts "#{i}: #{v}"
end
