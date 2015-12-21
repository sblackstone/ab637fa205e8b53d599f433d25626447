require './primes.rb'

Primes.setup(1_000_000)


def largest_prime(n)
  largest = 0
  Primes.primes.each do |p|
    if n % p == 0
      largest = p
    end    
  end
  return largest
end

def g(n)
  sum = 0
  0.upto(8) do |i|
    sum += largest_prime(n+i)
  end
  return sum
end

def h(k)
  largest = 0
  2.upto(k) do |n|
    largest = [largest, g(n)].max
  end
  return largest
end

puts g(100)
puts h(100)

