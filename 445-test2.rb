require './primes.rb'

Primes.setup(1_000_000)

### UTIL

def fact(n)
  return n == 0 ? 1 : n * fact(n-1)
end

def nCk(n,k)
  fact(n) / (fact(k) * fact(n-k))
end

def extended_gcd(a, b)
  if a % b == 0
      return 0, 1
  else
      x, y = extended_gcd(b, a % b)
      return y, (x - y * (a / b))
  end
end

def divisors(n)
  d = []
  1.upto(n) do |i|
    if n % i == 0
      d.push i
    end
  end
  d
end

def factor(n)
  h = Hash.new(0)
  Primes.primes.each do |p|
    while n % p == 0
      h[p] += 1
      n /= p
    end
    return h if n == 1
  end
  throw "Could not factor #{n}"
end

def defactor(pfacts)
  n = 1
  pfacts.each do |p,e|
    n *= p**e
  end
  n
end

def totient(n)
  p = 2
  inc = 1
  while p < Math.sqrt(n)
    if n % p == 0
      tmpn = n
      m = 0
      while tmpn % p == 0
        m = m + 1
        tmpn = tmpn / p
      end
      if tmpn == 1
        return p**(m - 1) * totient(p)
      else
        return totient(tmpn) * (p**(m - 1) * totient(p))
      end
    end
    p = p + inc
    inc = 2
  end
  return(n-1)
end


def f(a,b,n,x)
  return(a*x + b)
end


def brute_a_b_n(a,b,n)
  0.upto(n-1) do |x|
    t = a*(a*x + b - x)
    return false if (t % n) > 0
  end
  return true
end


def brute(n)
  sum = 0
  1.upto(n-1) do |a|
    0.upto(n-1) do |b|
      if brute_a_b_n(a,b,n)
        sum += 1
        #puts "(#{a},#{bmate })"
      end
    end
  end
  sum
end



def predict(n)
  f = factor(n)
  t = 1
  f.each do |p,e|
    t *= ((p**e) + 1)
  end
  t - n
end



1.upto(25) do |n|
  actual = brute(n)
  guess  = predict(n)
  puts "#{n}: #{actual} #{guess}" #unless actual == guess
end
