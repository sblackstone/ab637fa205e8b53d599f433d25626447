require './primes.rb'

Primes.setup(1_200_000)

@p3_cache = Hash.new(false)
1.upto(1_200_000) do |i|
  @p3_cache[i] = true
end


1.upto(1000) do |i|
  c1 = i**3
  c2 = (i+1)**3
  diff = c2 - c1
  puts "#{c1} #{c2} #{diff}" if Primes.isPrime?(diff) and diff < 1_000_000
end




