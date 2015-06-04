=begin
Perfection Quotients
Problem 241
For a positive integer n, let σ(n) be the sum of all divisors of n, so e.g. σ(6) = 1 + 2 + 3 + 6 = 12.

A perfect number, as you probably know, is a number with σ(n) = 2n.

Let us define the perfection quotient of a positive integer as	p(n)	= 	
σ(n)
n
.
Find the sum of all positive integers n ≤ 1018 for which p(n) has the form k + 1⁄2, where k is an integer.


=end


require './euler_lib.rb'

h = HandySieve.fetch(6)

1.upto(1000) do |n|
  s = Rational(0)
  h.divisors(n) do |d|
    s += d
  end
  p = s / n
  puts "#{n}: #{s.to_i} #{p}"
end


=begin
s(n) = nk + n/2

s(n) = (n/2) mod n
2s(n) = n mod n





=end
