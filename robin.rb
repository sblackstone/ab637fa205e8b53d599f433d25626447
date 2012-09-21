require 'sigma'
require 'primes'
Primes.setup(1_000_000)

EG = 0.5772156649015328606065120900824024310421593359399235988057

def f(n)
  Math::E**EG * n * Math.log(Math.log(n))
end


5042.upto(999_999) do |i|
  puts "#{i}\t#{sigma(i)}\t#{f(i)}" if sigma(i) < f(i)
end
