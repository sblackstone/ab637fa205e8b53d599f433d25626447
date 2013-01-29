require 'rubygems'
require 'bitset'
require 'pp'

MAX_PRIMES = 10_000_000

@b = Bitset.new(MAX_PRIMES)

2.upto(MAX_PRIMES-1) do |i|
  @b.set(i)
end

2.upto(MAX_PRIMES-1) do |i|
  if @b.set?(i) 
    j = i*i
    while j < MAX_PRIMES
      @b.clear(j)
      j += i
    end
  end
end


