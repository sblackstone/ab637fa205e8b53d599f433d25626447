=begin
If we calculate a**2 mod 6 for 0 <= a <= 5 we get: 0,1,4,3,4,1.

The largest value of a such that a**2 = a mod 6 is 4.
Let's call M(n) the largest value of a < n such that a**2 = a (mod n).

So M(6) = 4.



6 = 2^1 * 3^1

x = 0 mod 2
x = 1 mod 3





=end


require './euler_lib.rb'
require 'pp'
require 'byebug'


def lcm(arr)
  a = arr.first
  1.upto(arr.length - 1) do |i|
    a = a*arr[i] / a.gcd(arr[i])
  end
  return a  
end


def mod_inverse(a,n)# pristine
  t    = 0
  newt = 1
  r    = n
  newr = a % n
  while newr != 0
    q = (r / newr).to_i
    tmp = newt
    newt = t - (q * newt)
    t    = tmp
    tmp = newr
    newr = r - (q * newr)
    r    = tmp    
  end
  return nil if r > 1
  return (t < 0) ? (t + n) : t
end



def crt(mods, remainders)# pristine
  modulus = lcm(mods)  
  n = 0
  0.upto(mods.length - 1) do |i|
    ni = modulus / mods[i]
    n   += (ni)*(mod_inverse(ni, mods[i]))*remainders[i]
  end  
  return n % modulus, modulus  
end

def brute(n)
  max = 1
  1.upto(n-1) do |i|
    max = i if i**2 % n == i
  end
  return max
end


def max_sum_not_exceeding(n, arr, pos = 0, cur_sum = 0)
  if pos == arr.length
    return cur_sum
  else
    a = max_sum_not_exceeding(n, arr, pos+1, cur_sum)
    b = max_sum_not_exceeding(n, arr, pos+1, (cur_sum+arr[pos]) % n)
    return a > b ? a : b
  end
end


def test(mods)
  return 1 if mods.length == 1
  modulus = lcm(mods)  
  v = mods.map {|m| (modulus / m)*mod_inverse((modulus / m), m) }.reject {|x| x <= 0}
  max_sum_not_exceeding(mods.inject(:*), v)  
end


h = HandySieve.new(10**7 + 1)
=begin
primes = Array.new
h.primes { |p| primes << p }

def everything_up_to(n, primes, pos = 0, cur_val = 1, cur_arr = [], &block)
  if pos == primes.length || cur_val > n
    yield cur_val, cur_arr unless cur_val > n
    return
  end
    
  everything_up_to(n, primes, pos+1, cur_val, cur_arr, &block)
  
  p = primes[pos]
  cur_arr.push 1
  while cur_val < n
    cur_val *= p
    cur_arr[-1] *= p
    everything_up_to(n, primes, pos+1, cur_val, cur_arr, &block)
  end
  cur_arr.pop
  
  
end

everything_up_to(10**7, primes) do |n, facts|
  print "#{n}\t"
  pp facts
end

=end

sum_a = 0
2.upto(10**7) do |i|
  #puts i if i % 1000 == 0
  a =  test(h.prime_factors2(i))
  sum_a += a
end
puts "Sum a = #{sum_a}"
puts sum_a == 39782849136421



