=begin
Polynomials of Fibonacci numbers
Problem 435
The Fibonacci numbers {fn, n ≥ 0} are defined recursively as fn = fn-1 + fn-2 with base cases f0 = 0 and f1 = 1.

Define the polynomials {Fn, n ≥ 0} as Fn(x) = ∑fixi for 0 ≤ i ≤ n.

For example, F7(x) = x + x2 + 2x3 + 3x4 + 5x5 + 8x6 + 13x7, and F7(11) = 268357683.

Let n = 1015. Find the sum [∑0≤x≤100 Fn(x)] mod 1307674368000 (= 15!).


Power 2 = 170100
Power 3 = 268800
Power 4 = 85050

Power 8 = 56700

=end


require 'pp'
require 'matrix.rb'
require './primes.rb'


Primes.setup(1000)

def lcm(a,b)
  return a*b / a.gcd(b)
end

def brute_pisano(n)  
  cache = Hash.new
  k = 1
  while true
    key = "#{fib(k-1) % n} : #{fib(k) % n}"
    if cache[key]
      return k - cache[key]
    else
      cache[key] = k
    end
    k +=1
  end
end

def calc_pisano(n)
  answer = 1
  Primes.primes.each do |p|
    k = 0
    if n % p
      while n % p == 0
        k += 1
        n /= p
      end
      answer = lcm(answer, brute_pisano(p**k))
      return answer if n == 1
    end    
  end
end


def nCk(n,k)
  return 1 if k == 0 or k == n
  return nCk(n-1, k-1) + nCk(n-1, k)
end

def nCk_mod_m(n,k,m)
  return 1 if k == 0 or k == n
  return ((nCk_mod_m(n-1, k-1, m) % m) + (nCk_mod_m(n-1, k, m) % m)) % m
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


@pisano_cache = Hash.new(false)

def fib_mod_m(n, m)
  @pisano_cache[m] ||= calc_pisano(m)
  return(fib(n % @pisano_cache[m]))
end


@fib_cache = Hash.new
def fib(n)
  @fib_cache[n] ||= do_fib(n)
end


def do_fib(n)
  return 0 if n == 0
  return 1 if n == 1
  return fib(n-1) + fib(n-2)
end

def stupid(n,x)
  sum = 0
  0.upto(n) do |i|
    sum += fib(i) * (x**i)
  end
  sum
end

def Sp(n,p)
  sum = 0
  1.upto(p) do |i|
    0.upto(i-1) do |j|
      sub = (i-j)**p * nCk(n+p -i + 1, n - i) * nCk(p + 1, j)      
      sub *= -1 if j % 2 == 1
      sum += sub      
    end
  end
  sum
end

def Sp_mod_m(n,p, m)
  sum = 0
  1.upto(p) do |i|
    0.upto(i-1) do |j|
      sub = (modpow(i-j, p, m) * nCk_mod_m(n+p -i + 1, n - i, m)  * nCk_mod_m(p + 1, j, m)) % m
      sub *= -1 if j % 2 == 1
      sum = (sum + sub) % m
    end
  end
  sum
end

def smart2(n, max_x, mod)
  sum = 0
  0.upto(n) do |p|
    sum = (sum + Sp_mod_m(max_x, p, mod) * fib_mod_m(p,mod)) % mod
    
  end
  
  return(sum)
end


=begin
puts Sp(1000, 1) % 51
puts Sp2(1000, 1, 51)

if n == 4 and max_x =5, Answer = 3457
 
=end
n = 4
max_x = 5
puts smart2(n, max_x, 1307674368000)




