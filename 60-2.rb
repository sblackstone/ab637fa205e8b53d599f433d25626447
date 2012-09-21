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

N=4000

Primes.setup(N)

@web = Hash.new

Primes.primes.each do |p|
  @web[p] ||= Hash.new(false)
  @web[p][p] = true
end


Primes.primes.each do |p|
  next if p == 2 or p == 5
  Primes.primes.each do |q|
    next if q <= p
    if check(p,q)
      @web[p][q] = true
      @web[q][p] = true
    end
  end
end

puts "Setup complete"

SIZE = 5

def check_answer(answer)
  n = answer.size - 1
  0.upto(n) do |i|
    i.upto(n) do |j|
      return false unless @web[answer[i]][answer[j]]
    end
  end
  return true
end

def matches_in_array(n,array)
  count = 0
  array.each do |x|
    count+=1 if @web[x][n]
  end
  return count
end


#pp matches_in_array(3,[109,673,7,5,23,53,2])

def check_set(arr)
  test = []
  arr.each do |x|
    test << x if matches_in_array(x,arr) >= SIZE
  end
  puts "Checking #{test.size} choose " + SIZE.to_s
  test.permutation(SIZE).each do |p|
    if check_answer(p)
      pp p
      exit
    end
  end
end


@web.each do |k,v|
  puts "Checking #{k}"
  check_set(v.keys)
end

