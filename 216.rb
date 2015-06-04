=begin
Investigating the primality of numbers of the form 2n2-1
Problem 216
Consider numbers t(n) of the form t(n) = 2n**2-1 with n > 1.
The first such numbers are 7, 17, 31, 49, 71, 97, 127 and 161.
It turns out that only 49 = 7*7 and 161 = 7*23 are not prime.
For n ≤ 10000 there are 2202 numbers t(n) that are prime.

How many numbers t(n) are prime for n ≤ 50,000,000 ?

Primes end in 1,3,7,9

Square end in 0,1,4,6,9,or 25

Twice squares end in 0,2, or 8

(Twice squares - 1) end in 9, 1, 7




Primes end in 1,3,7,9

Primes - 1 end in 0, 2, 6, 8


2n**2 - 1 = p

2n**2 = p - 1

2n**2 - p = 1


2(n+1)**2 - 1 - 2n**2 - 1 


=end

require 'pp'
require './primes.rb'
Primes.setup(100)
yup  = 0
nope = 0
vt   = 7
va   = 6
n    = 2
while n <= 10_000
  #puts "#{n} #{vt}"
  print "#{n}\t"
  if miller(vt)
    puts "#{vt}"
    yup += 1
  else
    puts "\t#{vt}"
    nope += 1
  end
  va += 4
  vt += va 
  n += 1
end

puts "va = #{va}"

puts "#{yup} #{nope}"

#puts "#{yup} #{nope}"