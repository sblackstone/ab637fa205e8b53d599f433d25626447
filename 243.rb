require 'pp'
require './primes.rb'

=begin
A positive fraction whose numerator is less than its denominator is called a proper fraction.
For any denominator, d, there will be d−1 proper fractions; for example, with d = 12:
1/12 , 2/12 , 3/12 , 4/12 , 5/12 , 6/12 , 7/12 , 8/12 , 9/12 , 10/12 , 11/12 .

We shall call a fraction that cannot be cancelled down a resilient fraction.
Furthermore we shall define the resilience of a denominator, R(d), to be the ratio of its proper fractions that are resilient; for example, R(12) = 4/11 .
In fact, d = 12 is the smallest denominator having a resilience R(d) < 4/10 .

Find the smallest denominator d, having a resilience R(d) < 15499/94744 .


R(d) = totient(d) / (d-1)

Max when d = prime + 1


1/5 2/5 3/5 4/5 


=end

# totient(n!) 


require './euler_lib.rb'

@h = HandySieve.new(1_000_000_000)


def r(d)
  @h.totient(d) / (d-1).to_f
end




target = 15499.0 / 94744.0


puts "Target = #{target}"

t = 0
d = 0

@h.primes do |p|
  d = p
  res = r(d + 1) 
  break if res < target  
end
puts d
puts d+1
puts r(d+1)
puts r(d+1) - target

