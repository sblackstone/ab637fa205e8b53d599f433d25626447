=begin
(prime-k) factorial
Problem 381
For a prime p let S(p) = (∑(p-k)!) mod(p) for 1 ≤ k ≤ 5.

For example, if p=7,
(7-1)! + (7-2)! + (7-3)! + (7-4)! + (7-5)! = 6! + 5! + 4! + 3! + 2! = 720+120+24+6+2 = 872.
As 872 mod(7) = 4, S(7) = 4.

It can be verified that ∑S(p) = 480 for 5 ≤ p < 100.

Find ∑S(p) for 5 ≤ p < 108.

(p-1)! = (p-1) mod p



(p-1)! = p*k + (p-1)

(p-2)! = (p*k + (p-1)) / (p-2)


6! mod 7 = 6  <=>   6! =    102*7 + 6

(n-1)! = (n-1) mod p
(n-2)! = (n-1)! / (n-1) mod p
(n-3)! = (n-2)! / (n-2) mod p
(n-4)! = (n-3)! / (n-3) mod p
(n-5)! = (n-5)! / (n-5) mod p


6! mod 7 = 6

5! mod 7 = 1










=end

require './euler_lib.rb'



def fact(n)
  return n == 0 ? 1 : n * fact(n-1)
end


def brute(p)
  s = 0
  (p-1).downto(p-5) do |k|
    s += fact(k)
  end
  return s % p  
end


def compute(p)
  sum = (p-1)
  v   = (p-1)
  2.upto(5) do |k|
    r = extended_gcd(p - k + 1, p)
    v = v*r[0] % p
    sum += v % p
  end
  return sum % p
end



@h = HandySieve.fetch(8)

puts "Loaded..."

s  = 0
@h.primes_upto(10**8) do |p|
  if p > 3
    s += compute(p)
  end
end

puts s
