require 'lib'

@nums = Hash.new(true)
@max = 12375
sum = 2
c   = 3

@primes = [2]

while (c < @max)
  if @nums[c]
    @primes << c
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


def prime_factors(n)
  raise "ERR" if n > @max
  fact  = []
  i     = 0
  p     = @primes[i]
  return [n] if @nums[n] and (n % 2 == 1 or n == 2)
  while p <= Math.sqrt(n)
    fact << p if n % p == 0   
    i = i + 1
    p = @primes[i]
  end
  return(fact)
end

def divisor_count(n,teh_primes)
  value = 1
  return 2 if @nums[n] and (n % 2 == 1 or n == 2)
  teh_primes.each do |p| 
    k = 0
    while n % (p ** k) == 0
      k = k + 1
    end
    value = value * k
  end
  return value
end

n = 0
t = 0
d = 0
maxa = 0
maxb = 0

while true
  n = n + 1    
  a = n
  b = n + 1
  a = a / 2 if a % 2 == 0
  b = b / 2 if b % 2 == 0
  t = (a * b)
  maxa = a if a > maxa
  maxb = b if b > maxb
  pr = prime_factors(a)
  pr << prime_factors(b)
  pr = pr.flatten.sort.uniq
  d = divisor_count(t, pr)
  break if d > 500
end
puts "#{t} has #{d} divisors."
