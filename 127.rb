=begin
The radical of n, rad(n), is the product of distinct prime factors of n. For example, 504 = 23  32  7, so rad(504) = 2  3  7 = 42.

We shall define the triplet of positive integers (a, b, c) to be an abc-hit if:

GCD(a, b) = GCD(a, c) = GCD(b, c) = 1
a < b
a + b = c
rad(abc) < c
For example, (5, 27, 32) is an abc-hit, because:

GCD(5, 27) = GCD(5, 32) = GCD(27, 32) = 1
5  27
5 + 27 = 32
rad(4320) = 30  32
It turns out that abc-hits are quite rare and there are only thirty-one abc-hits for c < 1000, with sum(c) = 12523.

Find sum(c) for c <  120000.


A+B = 120_000

----

rad(abc) = rad(a) * rad(b) * rad(c) < c


C can't be square free...

Choosing amongst valid C:

rad(c-b) * rad(b) * rad(c) < c

rad(a)*rad(b) < c / rad(c)





=end

require 'pp'
require './primes.rb'

ceil = 120000

Primes.setup(ceil+100)

@radicals      = Array.new(ceil+1, 1)
@square_free   = Array.new(ceil+1, true)
@rad_hash      = Hash.new

Primes.primes.each do |p|
  k = 1
  while k*p <= ceil
    @radicals[k*p] *= p
    k += 1
  end
  k = 1
  p2 = p**2
  while k*p2 <= ceil
    @square_free[k*p2] = false
    k += 1
  end
end

1.upto(ceil) do |i|
  r = @radicals[i]
  @rad_hash[r] ||= Array.new
  @rad_hash[r].push i
end

@rad_values = @rad_hash.keys.sort
@rad_values_rev = @rad_values.reverse

def radical_values_lt(k)
  @rad_values.each do |rv|
    break if rv >= k
    yield rv
  end
end

def radical_values_gt(k)
  @rad_values_rev.each do |rv|
    break if rv <= k 
    yield rv
  end
end

sum = 0

1.upto(ceil) do |c|
  unless @square_free[c]
    ratio = c.to_f / @radicals[c]
    radical_values_lt(ratio) do |r1|
      @rad_hash[r1].each do |b|
        a = c - b
        next if a < 0
        next if @radicals[a] * @radicals[b] * @radicals[c] > c
        next if a.gcd(b.gcd(c)) > 1
        next if b <= a 
        #puts "#{a} #{b} #{c}"
        sum += c
      end
    end    
  end
end
puts "Sum = #{sum}"
