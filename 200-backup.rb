require './primes.rb'
require 'pp'



MAX = 100**2

Primes.setup(MAX)


# Right is Least signifigant.. (pos = 0)
#
# EXCLUDED MUST BE SORTED!
#

def rotate_digits2(n, pos, excluded = [])
  a = n % 10**(pos + 1)
  r = n % 10**(pos)
  0.upto(9) do |d|
    if excluded.first == d
      excluded.shift
      next
    end
    t = n - a
    t += d* 10**(pos)
    t += r
    yield t
  end
end


=begin
When using prime_proof that uses strings...

real	0m34.648s
user	0m34.586s
sys	0m0.053s
=end


def prime_proof2(n)
  
  puts n
  # if the last digit isn't 1,3,7, or 9, then thats the only digit we need to check.
  if [1,3,7,9].include? n % 10
    rotate_digits2(n, 0, [0,2,4,5,6,8]) do |test|
      return false if Primes.isPrime?(test)
    end
    return true
  end
  
  len = (Math.log(n) / Math.log(10)).floor + 1
  s = n.to_s
  0.upto(len) do |i|
    rotate_digits2(n, i) do |test|
      return false if Primes.isPrime?(test)
    end
  end
  puts "true"
  exit
end


values = Array.new

Primes.primes.each do |p|
  break if p > 100**2
  psquared = p**2
  Primes.primes.each do |q|
    if p != q and q < 100**2 
      n = (p**2 * q**3)
      
      if n.to_s.match /200/ and prime_proof2(n)
        puts "#{n}\t #{p}^2 * #{q}^3"  
        values.push n
      end
    end
  end
end

pp values.length
