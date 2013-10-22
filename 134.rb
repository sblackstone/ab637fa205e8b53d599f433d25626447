=begin
Prime pair connection
Problem 134
Consider the consecutive primes p1 = 19 and p2 = 23. It can be verified that 1219 is the smallest number such that the last digits are formed by p1 whilst also being divisible by p2.

In fact, with the exception of p1 = 3 and p2 = 5, for every pair of consecutive primes, p2 > p1, there exist values of n for which the last digits are formed by p1 and n is divisible by p2. Let S be the smallest of these values of n.

Find ∑ S for every pair of consecutive primes with 5 ≤ p1 ≤ 1_000_000.



n*p2 = p1

n*p2 % 10**digits(p1) = p1



=end


require './primes.rb'

Primes.setup(1_100_000)

def digits(n)
  return 1 if n < 10
  return 2 if n < 100
  return 3 if n < 1000
  return 4 if n < 10_000
  return 5 if n < 100_000
  return 6 if n < 1_000_000
  return 7 if n < 10_000_000
  return 8 if n < 100_000_000
  return 9 if n < 1_000_000_000
  throw "out of range"
end

def extended_gcd(a, b)
    if a % b == 0
        return 0, 1
    else
        x, y = extended_gcd(b, a % b)
        return y, (x - y * (a / b))
    end
end



s = 0

2.upto(Primes.primes.size - 1) do |i|
 a = Primes.primes[i]
 b = Primes.primes[i+1]
 break if a > 1_000_000
 d = digits(a)
 pow = 10**d
 egcd = extended_gcd(b, pow)
 k = egcd[0]*a % pow
 s += k*b
end

puts s