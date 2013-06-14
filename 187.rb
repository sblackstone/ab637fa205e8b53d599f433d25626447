require 'pp'
require './primes.rb'

MAX = 10**8

@primes = Array.new
f = File.open('./primes_to_10_8.txt')

while (pc = f.gets)
   p = pc.to_i
   @primes.push p
end

puts "load"

sum = 0
0.upto(@primes.size - 1) do |i|
  break if @primes[i] > MAX
  i.upto(@primes.size - 1) do |j|
    if @primes[i]*@primes[j] < MAX
      sum += 1
    else 
      break
    end
  end
end


puts sum
=begin


def primes_less_than(n)
  return 0 if n <= 2 
  return @primes.size if n > @primes.size and n <= MAX
  inf = 0
  sup = @primes.size - 1
  while sup - inf > 1
    med = inf + ((sup-inf) / 2)
    if @primes[med] >= n
      sup = med
    else
      inf = med
    end
  end
  if sup - inf == 1 and (@primes[sup] - n)  <= (@primes[inf] - n)
    inf = sup
  end
  return inf + 1
end

s = 0

@primes.each do |p|
  break if p > Math.sqrt(MAX)
  mp = MAX / p
  s += primes_less_than(mp+1) - primes_less_than(p) 
  puts "#{p} #{mp}: #{primes_less_than(mp)} #{primes_less_than(p)}"
end
puts s

=end