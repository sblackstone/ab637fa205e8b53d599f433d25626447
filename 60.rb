require './primes.rb'

require 'pp'

def digits(n)
  return Math.log10(n).floor + 1
end

def concat(i,j)
  return i*10**digits(j) + j
end

N=10000

@base = [31,73]

def fast_prime(n)
  return true  if n == 2
  return false if n < 2
  return false if n % 2 == 0
  d = n-1
  d >>= 1 while d & 1 == 0
  @base.each do |a|
    return true if a == n
    t = d
    y = ModMath.pow(a,t,n)              
    while t != n-1 && y != 1 && y != n-1
      y = (y * y) % n
      t <<= 1
    end
    return false if y != n-1 && t & 1 == 0
  end
  return true
end

Primes.setup(N)

def check(i,j)
   fast_prime(concat(i,j)) && fast_prime(concat(j,i))
end

puts "Primes setup complete"

@web = Hash.new

Primes.primes.each do |p|
  @web[p] ||= Hash.new(false)
  @web[p][p] = true
end


num_primes = Primes.primes.size

puts "Processing #{num_primes} primes"

0.upto(num_primes - 1) do |i|
  p = Primes.primes[i]
  puts "Checking #{p}"
  (i+1).upto(num_primes - 1) do |j|
    q = Primes.primes[j]
    if check(p,q)
      @web[p][q] = true
      @web[q][p] = true
    end
  end
end

puts "Setup complete"

SIZE = 5

@web.keys.sort.each do |k|
  print "#{k}: "
  puts "#{@web[k].size}"
end




