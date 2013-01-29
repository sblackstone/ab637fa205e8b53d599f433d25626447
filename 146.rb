require './primes.rb'

require 'pp'
=begin

The smallest positive integer n for which the numbers n2+1, n2+3, n2+7, n2+9, n2+13, and n2+27 are consecutive primes is 10. The sum of all such integers n below one-million is 1242490.

What is the sum of all such integers n below 150 million?

=end
  

@base = [31,73]

def fast_prime(n)
  return true  if n == 2
  return false if n < 2
  return false if n % 2 == 0
  d = n-1
  d >>= 1 while d & 1 == 0
  @base.each do |a|
    return true if a == n
    t = d
    y = ModMath.pow(a,t,n)              
    while t != n-1 && y != 1 && y != n-1
      y = (y * y) % n
      t <<= 1
    end
    return false if y != n-1 && t & 1 == 0
  end
  return true
end


n = 10
while n < 1_000_000
  
  n += 2
end


