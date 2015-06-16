=begin
GCD sequence
Problem 443
Let g(n) be a sequence defined as follows:
g(4) = 13,
g(n) = g(n-1) + gcd(n, g(n-1)) for n > 4.

The first few values are:

n	     4	 5	 6	 7	 8	 9	10	11	12	13	14	15	16	17	18	19	20	...
g(n)	13	14	16	17	18	27	28	29	30	31	32	33	34	51	54	55	60	...
You are given that g(1 000) = 2524 and g(1 000 000) = 2624152.


g(s)   = k
g(s+1) = k + gcd(k, s+1)
g(s+2) = k + gcd(k, s+1) + gcd(k + gcd(k, s+1), s + 2)
g(s+3) = k + gcd(k, s+1) + gcd(k + gcd(k, s+1), s + 2) + gcd(k + gcd(k, s+1) + gcd(k + gcd(k, s+1), s + 2), s + 3)

Find g(10**15).

When n is prime,
g(n) = g(n-1) + 1

When n is co-prime to g(n-1),
g(n) = g(n-1) + 1


=end

require './primes.rb'

Primes.setup(1_000_000)

gn   = 13
n    = 4

while n <= 1_000_000
  n += 1
  gn = gn + n.gcd(gn)
  puts "#{n}: #{gn-1}" if Primes.isPrime?(n)
end

puts gn - 1

