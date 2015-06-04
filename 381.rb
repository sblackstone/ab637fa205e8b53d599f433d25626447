=begin
(prime-k) factorial
Problem 381
For a prime p let S(p) = (∑(p-k)!) mod(p) for 1 ≤ k ≤ 5.

For example, if p=7,
(7-1)! + (7-2)! + (7-3)! + (7-4)! + (7-5)! = 6! + 5! + 4! + 3! + 2! = 720+120+24+6+2 = 872.
As 872 mod(7) = 4, S(7) = 4.

It can be verified that ∑S(p) = 480 for 5 ≤ p < 100.

Find ∑S(p) for 5 ≤ p < 108.

=end

require './primes.rb'


def fact(n)
  n == 0 ? 1 : n * fact(n-1)
end


def S(p)
    sum = 0
    5.downto(1) do |k|
      sum += fact(p - k)
    end
    sum % p 
end


tot = 0

Primes.setup(10**8)

Primes.primes.each do |p|
  
  tot += S(p) if p > 3
end


puts tot