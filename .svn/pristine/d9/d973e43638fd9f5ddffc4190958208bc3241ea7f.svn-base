require 'lib'

@nums = Hash.new(true)
@max = 28123
sum = 2
c   = 3

@primes = [2]
@prime_hash = Hash.new(false)
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
  ans = [1]
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

#@divisors = Hash.new(nil)
def divisors(n)
  #@divisors[n] ||= 
  gen_divisors(n)
end


#@d_of_n_cache = Hash.new(nil)
def d(n)
  #@d_of_n_cache[n] ||= 
  divisors(n).inject(:+)
end

def abundant?(i)
  return false if @prime_hash[i] or ((i % 2 != 0) and (i % 3 != 0))
  return d(i) > i
end

@abund = [12]
12.upto(28123) do |i|
  @abund << i if abundant?(i)
end


@reachable = Hash.new(false)
@abund.each do |i|
  @abund.each do |j|
    @reachable[i+j] = true
  end
end

c = 0
0.upto(28123) do |i|
  c = c + i unless @reachable[i]
end

print c


