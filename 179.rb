=begin
Consecutive positive divisors
Problem 179
Find the number of integers 1 < n < 107, for which n and n + 1 have the same number of positive divisors. For example, 14 has the positive divisors 1, 2, 7, 14 while 15 has 1, 3, 5, 15.
=end

require 'pp'
require './primes.rb'

f = File.open('./primes_to_10_8.txt')


MAX = 10**7

def mult(n,p)
  count = 0
  while n % p == 0
    count += 1
    n /= p
  end
  return count
end

@a = Array.new(MAX, 1)

while (pc = f.gets)
   p = pc.to_i
   break if p > MAX
   k = 1
   while p*k < MAX     
     @a[p*k] *= (mult(k*p, p) + 1)
     k += 1
   end 
end


sum = 0
1.upto(MAX-1) do |i|
  if @a[i] == @a[i+1]
    sum += 1
    #puts "#{i} and #{i+1}"
  end
end

puts sum