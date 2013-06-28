def fact(n)
  return 1 if n == 0
  return n*fact(n-1)
end

def nCk(n,k)
  return fact(n) / (fact(k)*fact(n-k))
end

require 'pp'



require './primes.rb'


N = 50

nums = Array.new
1.upto(N) do |n|
  1.upto(n) do |k|
    c = nCk(n,k)
    nums.push c
    print " #{c} "
  end
  puts
end

nums.sort!
nums.uniq!


Primes.setup(1000)
puts "Primes configured"

bad = Hash.new(false)

Primes.primes.each do |i|
  k = i**2
  nums.each do |n|
    if n % k == 0
      puts "Removing #{n} because of #{k} (because of #{i})"
      bad[n] = true
    end
  end
end


pp nums.inject(&:+) - bad.keys.inject(&:+)