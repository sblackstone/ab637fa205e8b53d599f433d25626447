require 'pp'

def isPrime?(n)
  # Fermat's primality test.
  return false if n < 2
  7.times {
    a = rand(n - 1) + 1
    return false if modpow(a,n-1,n) > 1
  }
  true
end

def modpow(b,e,m)
  result = 1
  while e > 0
    if (e & 1) == 1
      result = (result * b) % m;
    end
    e = e >> 1;
    b = (b * b) % m;
  end
  return result
end



def primes_and_hash(max)
@max = max
@nums = Hash.new(true)
sum = 2
c = 3
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
  return @primes,@prime_hash
end


def gcd(a,b)
  while b > 0
    t = b
    b = a % b
    a = t
  end
  return a
end

def ppp(p)
  puts "*" * 50
  pp p
  puts "*" * 50
end

def num_to_bin(n)
  res = ""
  c = 1
  while 2**c < n
    c = c + 1
  end
  c.downto(0) do |i|
    if (n - 2**i)  >= 0
      res = res + "1"
      n = n - 2**i
    else
      res = res + "0"
    end
  end
  return res.gsub(/^0/,"")
end

