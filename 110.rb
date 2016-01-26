=begin
In the following equation x, y, and n are positive integers.


For n = 4 there are exactly three distinct solutions:

What is the least value of n for which the number of distinct solutions exceeds one-thousand?

NOTE: This problem is an easier version of problem 110; it is strongly advised that you solve this one first.


1/x + 1/y = 1/n


n/x + n/y = 1

nx + ny = xy


n(x+y) = xy

xy/n = (x+y)



# Smallest N = (p1^a1)(p2^a2)(p3^a3)

such that..

(2*a1+1)(2*a2+1) > 1000




2*3 = 3*3 = 9

2**2 = 5




=end


require 'pp'

require './euler_lib.rb'


@h = HandySieve.fetch(4)

@primes = []

@h.primes_upto(1_000) do |p|
  @primes.push p
end



@best = 10**20

def search(target, fact_count = 1, cur_val = 1, depth = 0, arr = [])
  
  if (fact_count / 2) > target
    if cur_val < @best
      @best = cur_val
      pp @best
      pp arr
    end
    
    return
  end
  
  return if cur_val > @best
  
  i = 1
  while @primes[depth]**i < @best
    v = (i*2 + 1)
    cur_val    *= @primes[depth]**i
    fact_count *= v
    arr.push i
    search(target, fact_count, cur_val, depth+1, arr)
    arr.pop
    fact_count /= v
    cur_val    /= @primes[depth]**i
    i += 1
  end
  
  
end


search(4_000_000)



