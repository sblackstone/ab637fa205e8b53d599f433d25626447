require 'pp'
require './primes.rb'

f = File.open('./primes_to_10_8.txt')


MAX = 10**6

def mult(n,p)
  count = 0
  while n % p == 0
    count += 1
    n /= p
  end
  return count
end

@a = Array.new(MAX, 0)

while (pc = f.gets)
   p = pc.to_i
   break if p > MAX
   k = 2
   while p*k < MAX     
     @a[p*k] += mult(k*p, p)
     k += 1
   end 
end

puts "done"

sum = 0
1.upto(MAX-1) do |i|
  if @a[i] == 2
    sum += 1
    #puts "#{i}"
  end
end

puts sum