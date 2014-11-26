=begin
Pandigital prime sets
Problem 118
Using all of the digits 1 through 9 and concatenating them freely to form decimal integers, different sets can be formed. 

Interestingly with the set {2,5,47,89,631}, all of the elements belonging to it are prime.

How many distinct sets containing each of the digits one through nine exactly once contain only prime elements?



Facts -

Odd Primes end in 1,3,7 or 9 so max number of numbers is 5

2, 3, 7 


=end

require 'pp'

require './primes.rb'



@base = [2, 3, 5, 7, 11, 13, 17, 19, 23]

def fast_prime(n)
  return true  if n == 2 || n == 3 || n == 5 || n == 7
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


def ways_to_9(cur = [], sum = 0, &block)
  return if sum > 9 or cur.length > 12

  if sum == 9
    yield cur
    return
  end
  
  start = cur.empty? ? 1 : cur.last
  
  start.upto(8) do |i|
    sum += i
    cur.push i
    ways_to_9(cur,sum, &block)
    cur.pop 
    sum -= i
  end
end


def primes_matching_pattern(pattern, digits, pos = 0, solution = [], &block)  
  if pos == pattern.length 
    yield solution
    return
  end
  digits.combination(pattern[pos]) do |dcombo|
    diff = digits - dcombo
    dcombo.permutation.each do |p|
     v = p.join("").to_i
     if fast_prime(v)
       solution[pos] = v
       primes_matching_pattern(pattern, diff, pos + 1, solution, &block)
       solution[pos] = nil
     end     
   end
  end
end



ways_to_9 do |i|
  primes_matching_pattern(i, [1,2,3,4,5,6,7,8,9]) do |sol|
    pp sol.sort
  end  
end


