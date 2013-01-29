=begin
In the following equation x, y, and n are positive integers.


For n = 4 there are exactly three distinct solutions:

What is the least value of n for which the number of distinct solutions exceeds one-thousand?

NOTE: This problem is an easier version of problem 110; it is strongly advised that you solve this one first.


1/x + 1/y = 1/n






=end

require 'pp'
require './primes.rb'


# n(x+y) = xy
def solutions(n) 
  i = 1
  while true
    xy = n*i
    puts "#{xy} #{xy/n}"
    i +=1
  end
  
end


solutions(4)


=begin
Primes.setup(100)


def solutions(n)
  return 2 if Primes.isPrime?(n)  
  count = 0
  x = n 
  while true
    x += 1
    if (n*x) % (x-n) == 0
      y = (n*x) / (x - n)
      count += 1
      puts "#{x} #{y}"
      break if x == y
    end
  end
  return(count)
end


puts solutions(90)
exit

i = 1
while true
  s = solutions(i)
  print "#{i}: #{s}\n"
  break if i > 100
  i += 1
end
=end