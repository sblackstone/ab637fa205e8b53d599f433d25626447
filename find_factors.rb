require './primes.rb'
require 'pp'

Primes.setup(1000)


def find_factors(n)
  pfactors = []
  Primes.primes.each do |p|
    while n % p == 0
      pfactors << p
      n /= p
    end
    break if n == 1
  end  
  pp pfactors
end

find_factors(30)