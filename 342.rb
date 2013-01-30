=begin
The totient of a square is a cube
Problem 342
Consider the number 50.
502 = 2500 = 22  54, so φ(2500) = 2  4  53 = 8  53 = 23  53. 1
So 2500 is a square and φ(2500) is a cube.

Find the sum of all numbers n, 1 < n  1010 such that φ(n2) is a cube.

1 φ denotes Euler's totient function.

10**10 = 100_000**2


t(a*b) = t(a)*t(b)*

=end
require './primes.rb'
require 'pp'

Primes.setup(100_000)

@totients = Array.new(100_001)
@cubes = Hash.new(false)

1.upto(100_000) do |i|
  @totients[i] = i
end

i = 1
while i**3 < 10**10
  @cubes[i**3] = true
  i += 1
end



Primes.primes.each do |p|
  i = 1
  while i*p < 100_000
    @totients[i*p] *= (1 - (1.0 / p))
    i += 1
  end
end

sum = 0
1.upto(100_000) do |a|
  stot = @totients[a].to_i * a
  puts "#{a} #{stot}" if @cubes[stot]
  sum += a if @cubes[stot]
end

puts
puts sum
