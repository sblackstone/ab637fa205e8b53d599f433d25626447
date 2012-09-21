require './primes.rb'

require 'pp'

# 02 04 06 08 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40 42 44 46 48 50 52 54 56 58 60 62 64 66 68 70 62 74 76 78 80
  

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

@ok = Hash.new(false)
@ok[1] = true
@ok[3] = true
@ok[7] = true
@ok[9] = true
@ok[13] = true
@ok[27] = true

def check(n)
  n2 = n*n
  i = 1
  while i < 28
    pri = fast_prime(n2+i)
    return false if (!pri and @ok[i]) || (pri and !@ok[i])
    i+= 2
  end
  return true  
end

x = 2
i = 1
@add = [2,2]
valid = []
while true
  i = (i + 1) % 2 # size of add
  x += @add[i]
  break if x > 10**6
  if x % 7 == 0 || x % 13 == 0
    next
  end
  if check(x)
    valid << x
    pp valid
  end
end
pp valid
pp valid.inject(&:+)


