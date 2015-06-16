=begin

For every integer n>1, the family of functions fn,a,b is defined by fn,a,b(x)≡ax+b mod n for a,b,x integer and 0<a<n, 0≤b<n, 0≤x<n.
We will call fn,a,b a retraction if fn,a,b(fn,a,b(x))≡fn,a,b(x) mod n for every 0≤x<n.
Let R(n) be the number of retractions for n.

You are given that
∑ R(c) for c=C(100 000,k), and 1 ≤ k ≤99 999 ≡628701600 (mod 1 000 000 007).
(C(n,k) is the binomial coefficient).
Find ∑ R(c) for c=C(10 000 000,k), and 1 ≤k≤ 9 999 999.
Give your answer modulo 1 000 000 007.

fn,a,b = ax+b mod n
fn,a,b((ax+b)mod n) = ax+b mod n


ax+b = a(ax+b)+b mod n

a+b = a(a+b)+b mod n

a = a**2 + b mod n


=end

require './primes.rb'


Primes.setup(100_000)
puts "Primes complete"

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


#### MAIN CODE
def f(a,b,n,x)
  ((a*x % n) + b) % n
end

@blarg = []
def brute_a_b(a,b,n)
  h = Hash.new
  0.upto(n-1) do |x|
    t1 = f(a,b,n,x)
    t2 = f(a,b,n,t1)
    h[t1] = t2
    return false if t1 != t2
    #puts "#{a}, #{b}, #{t1} #{t2}"
  end  
  #@blarg.push h.sort.map {|x| "#{x[0]}->#{x[1]}"}.join(" ")
  return true   
end

def brute(n, quiet = false)
  count = 0
  1.upto(n-1) do |a|
    0.upto(n-1) do |b|
      if brute_a_b(a,b,n)
        count += 1
        puts "(#{a},#{b})" unless quiet
      end
    end
  end
  count
end

def predict_a_b_n(a,b,n)
  0.upto(n-1) do |x|
    t1 = (a*x**2 + a*b)  % n
    t2 = a*x % n
    return false if t1 != t2
  end
  return true
end


def predict(n)
  count = 0
  1.upto(n-1) do |a|
    0.upto(n-1) do |b|
      if predict_a_b_n(a,b,n)
        count += 1
      end
    end
  end
  count  
end



1.upto(250) do |n|
  actual = brute(n, true)
  guess  = predict(n)
  puts "#{n}: #{actual} #{guess}" #unless guess == actual
end
