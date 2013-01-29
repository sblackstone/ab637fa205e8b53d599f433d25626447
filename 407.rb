=begin
If we calculate a2 mod 6 for 0  a  5 we get: 0,1,4,3,4,1.

The largest value of a such that a2  a mod 6 is 4.
Let's call M(n) the largest value of a  n such that a2  a (mod n).
So M(6) = 4.

Find M(n) for 1  n  107.
=end

require 'pp'
require './primes.rb'

Primes.setup(1000)
total = 0

1.upto(1000) do |n|
  idm = []
  0.upto(n-1) do |a|
    if a**2 % n == a
      idm << a
    end
  end
  print idm.max
  total += idm.max
  puts
end

puts total
