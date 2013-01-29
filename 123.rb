=begin
Let pn be the nth prime: 2, 3, 5, 7, 11, ..., and let r be the remainder when (pn1)n + (pn+1)n is divided by pn2.

For example, when n = 3, p3 = 5, and 43 + 63 = 280  5 mod 25.

The least value of n for which the remainder first exceeds 109 is 7037.

Find the least value of n for which the remainder first exceeds 10**10.
=end

require './primes.rb'

Primes.setup(1_000_000)

Primes.primes.each_with_index do |p,i|
  n = i + 1
  a = (p+1)**n
  b = (p-1)**n
  v = (a+b) % p**2
  puts n
  if (v > 10**9)
    puts v
    puts p
    puts i
    puts n
    exit
  end
end
