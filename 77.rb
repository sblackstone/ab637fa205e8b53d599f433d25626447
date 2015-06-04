require 'pp'
require './primes.rb'

=begin
It is possible to write ten as the sum of primes in exactly five different ways:

7 + 3
5 + 5
5 + 3 + 2
3 + 3 + 2 + 2
2 + 2 + 2 + 2 + 2

What is the first value which can be written as the sum of primes in over five thousand different ways?
=end


@total = 0
MAX = 500
Primes.setup(1000)

@track = Hash.new(nil)

def sol(n,last_prime)
  @track["#{n}:#{last_prime}"] ||= do_sol(n,last_prime)
end


def do_sol(n,last_prime)
  if n == 0
    return 1
  end  
  total = 0
  Primes.primes.each do |p|
    break if p > n ||  p > last_prime
    m = n - p
    total += sol(m,p)
  end
  return total
end

2.upto(MAX) do |i|
  puts "#{i}: #{sol(i,i)}"
end

