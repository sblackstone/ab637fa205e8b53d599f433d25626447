require './primes.rb'

require 'pp'


def digits(n)
  return Math.log10(n).floor + 1
end

def concat(i,j)
  return i*10**digits(j) + j
end

def check(i,j)
   return Primes.isPrime?(concat(i,j)) && Primes.isPrime?(concat(j,i))
end

N=100_000

Primes.setup(N)

@web = Hash.new

Primes.primes.each do |p|
  @web[p] ||= Hash.new(false)
end

puts "Primes Setup complete"

n = Primes.primes.size - 1

0.upto(n) do |i|
  next if i == 5 or i == 2
  (i+1).upto(n) do |j|
    if check(Primes.primes[i],Primes.primes[j])
      @web[Primes.primes[i]][Primes.primes[j]] = true
      @web[Primes.primes[j]][Primes.primes[i]] = true
    end    
  end
end


puts "Setup complete"

SIZE = 4

def check_array(n,array)
  array.each do |x|
    return false if !@web[x][n]
  end
  return true
end

@sets = Array.new
Primes.primes.each do |p|
  @sets.each do |s|
    if check_array(p,s) 
      s << p
      if s.size == SIZE
        pp s
        exit
      end
    end
  end
  @sets << [p]
end

puts "fail"


