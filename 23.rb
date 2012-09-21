require 'lib'

@nums = Hash.new(true)
@max = 28123
sum = 2
c   = 3

@primes = [2]
@prime_hash = Hash.new(false)
@prime_hash[2] = true

while (c < @max)
  if @nums[c]
    @primes << c
    @prime_hash[c] = true
    sum = sum + c
    x = c + c
    while x <= @max
      @nums[x] = false if x % 2 == 1
      x = x + c
    end
  else
    @nums[c] = false
  end
  c = c + 2 
end

puts "Done calculating primes up to #{@max} "


def gen_divisors(n)
  ans = [1,n]
  @primes.each do |i|
    return ans.sort.uniq  if i > (n/2) 
    if n % i == 0
      j = 0
      while i*j < n/2
        j = j + 1
        ans << i*j if n % (i*j) == 0
      end
    end
  end
end

@divisors = Hash.new(nil)
def divisors(n)
  @divisors[n] ||= gen_divisors(n)
end


@d_of_n_cache = Hash.new(nil)
def d_manual(i,exp)
  #puts "Man: #{n}"
  n = i ** exp
  @d_of_n_cache[n] ||= divisors(n).inject(:+)
end

def d(n)
  #puts "n=#{n}"
  return n+1 if @prime_hash[n]
  @primes.each do |i|
    if n % i == 0
      exp = 0
      #puts "Checking largest power of #{i}"
      while n % (i**exp) == 0
        exp = exp + 1
      end
      exp = exp - 1

      #puts "The answer was #{exp}"
      if exp == 1
        return d(i) * d(n / i)
      else
        if (n / i**exp) == 1
          return d_manual(i,exp)
        else
          return d_manual(i,exp) * d(n / (i**exp)) 
        end
      end
    end
  end
end

def abundant?(i)
  return false if @prime_hash[i] or ((i % 2 != 0) and (i % 3 != 0))
  return d(i) > i*2
end

#pp divisors(243)
#exit

#0.upto(10) do |i|
#  puts "#{2**i}: #{d(2**i)}"
#end



@abund = []
12.upto(28123) do |i|
  @abund << i if abundant?(i)
end
puts "got abundant"

@reachable = Hash.new(false)
@abund.each do |i|
  @abund.each do |j|
    @reachable[i+j] = true
  end
end

pp @abund

c = 0
0.upto(28123) do |i|
  c = c + i unless @reachable[i]
end

print c


