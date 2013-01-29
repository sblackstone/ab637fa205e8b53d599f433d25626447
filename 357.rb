require './primes.rb'

=begin
Consider the divisors of 30: 1,2,3,5,6,10,15,30.
It can be seen that for every divisor d of 30, d+30/d is prime.

Find the sum of all positive integers n not exceeding 100 000 000
such that for every divisor d of n, d+n/d is prime.

=end

p = Primes.setup(10000)


def test(n)
  div = []

  1.upto(n) do |d|
    next unless n % d == 0
    unless Primes.isPrime?(d + (n/d))
      #puts "Failed #{n} for d = #{d} t = #{d + (n/d)}"
      return false
    end
    div << d
  end
  #print "#{n}: "
  #pp div
  return true
end

sum = 0
Primes.primes.each do |p|
  next if p % 4 == 1
  if test(p-1)
    print "\t"
    sum += p-1
  end
  puts p-1
end


puts "Sum: #{sum}"

