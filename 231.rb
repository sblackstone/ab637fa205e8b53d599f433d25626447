=begin
The binomial coefficient 10C3 = 120.
120 = 23 × 3 × 5 = 2 × 2 × 2 × 3 × 5, and 2 + 2 + 2 + 3 + 5 = 14.
So the sum of the terms in the prime factorisation of 10C3 is 14. 

Find the sum of the terms in the prime factorisation of 20000000C15000000.



nCk = n! / k!(n-k)!

=end


n = 20_000_000
k = 15_000_000

nmk = n - k 



require './primes.rb'
require 'pp'

f = File.open('./primes_to_10_8.txt')


def vp(n,base)
  tmp = n
  index = 0
  result = 0
  while (tmp != 0)
    result += tmp % base
    tmp = tmp / base
    index += 1
  end
  return((n-result) / (base -1))
end



sum = 0
while (p = f.gets)
  p = p.to_i
  p_in_nf   = vp(n, p)
  p_in_kf   = vp(k, p)
  p_in_nmkf = vp(nmk, p)
  sum += p * (p_in_nf - p_in_kf - p_in_nmkf)
  break if p > n
  #puts p
end

puts sum

=begin
Primes.setup(100)


Primes.primes.each do |p|
  puts "#{p}: #{vp(5, p)}"
end

=end