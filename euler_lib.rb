require 'pp'

def extended_gcd(a, b)
    if a % b == 0
        return 0, 1
    else
        x, y = extended_gcd(b, a % b)
        return y, (x - y * (a / b))
    end
end


@fact_cache = Hash.new

def fact(n)
  @fact_cache[n] ||= do_fact(n)
end

def do_fact(n)
  n == 0 ? 1 : n*fact(n-1)
end

def lcm(a,b)
  return a*b / a.gcd(b)
end


def mod_pow(base, power, mod)
  result = 1
  while power > 0
    result = (result * base) % mod if power & 1 == 1
    base = (base * base) % mod
    power >>= 1;
  end
  result
end

def crt(arr)
  product = arr.map {|x| x[1]}.inject(:*)
  sol = 0
  arr.each do |a|
    b,c = extended_gcd(a[1], product / a[1])
    e   = (product / a[1]) * c
    sol += e*a[0]
  end
  return sol % product, product
end

def miller(n)
  return false if n < 2
  return true  if n < 4
  return false if n % 2 == 0
  d = (n-1)
  s = 0
  while (d % 2 == 0)
    s +=1
    d /= 2
  end
  [2,3,5,7,11,13,17,19,23].each do |a|
    x = mod_pow(a,d,n)
    next if x == 1 or x == (n - 1) or n == a
    skip = false
    1.upto(s-1) do |k|
      x = x*x % n
      if x == 1
        return false
      elsif x == (n - 1)
        skip = true
        break
      end
    end
    next if skip
    return false
  end
  return true
end


def legendre_symbol(a,p,hs)
  return 0 if a % p == 0
  return 0 if a == 0
  return 1 if a == 1
  if a > p or a < 0
    return legendre_symbol(a % p, p)
  end

  if a == 2
    return (p % 8 == 1 or p % 8 == 7) ? 1 : -1
  end

  if a == -1
    return p % 4 == 1 ? 1 : -1
  end

  x = Math.sqrt(a).floor
  if (x**2 == a)
    return x % p == 0 ? 0 : 1
  end
  if miller(a)
    ec = (a**((p-1)/2)) % p
    return ec == (p-1) ? -1 : 1
  end
  hs.primes do |q|
    if a % q == 0
      return legendre_symbol(a/q, p, hs) * legendre_symbol(q,p, hs)
    end
  end
end


def tshanks(n, p, hs)

  return nil,nil unless legendre_symbol(n,p, hs) == 1
  q = p - 1
  s = 0
  while q % 2 == 0
    q /= 2
    s += 1
  end
  if s == 1
    return -1*n**((p+1)/4), n**((p+1)/4)
  end

  z = 1
  while legendre_symbol(z,p,hs) > -1
    z +=1
  end

  c = z**q % p
  r = n**((q+1)/2) % p
  t = (n**q) % p
  m = s
  while true
    if t % p == 1
      return r, p - r
    end
    i = 1
    while t**(2**i) % p != 1
      i += 1
    end
    b = c**(2**(m -i-1))
    r = r*b % p
    t = t*b*b % p
    c = b*b % p
    m = i
  end

end


class HandySieve

  @@hs_hash = Hash.new

  def self.fetch(power_of_ten)
    if @@hs_hash[power_of_ten]
      return @@hs_hash[power_of_ten]      
    end    
    fn = "/tmp/handy_sieve_#{power_of_ten}"
    if File.file? fn
      @@hs_hash[power_of_ten] = Marshal.load(File.read(fn))
    else
      h = HandySieve.new(10**power_of_ten)
      File.open(fn, "w") do |f|
        f.write Marshal.dump(h)
    end
      @@hs_hash[power_of_ten] = h
    end    
    return @@hs_hash[power_of_ten]
  end
  
  def prime_power?(n)
    pf = prime_factors(n)
    return pf.length == 1 && pf.first.last > 1
  end

  def prime?(n)
    @sieve[n] == n
  end
  
  def next_prime(n)
    n += 1
    while !prime?(n)
      n += 1
    end
    n    
  end
  
  
  def primes(&proc)
    primes_upto(@max, &proc)
  end
  
  
  def primes_upto(max, &proc)
    2.upto(max) do |i|
      yield i if prime? i
    end    
  end
    
  def totient(n, ans_top = 0, ans_bottom = 1)
    ans_top = n if ans_top == 0
    throw "too big" if n > @max
    return ans_top / ans_bottom if n == 1
    t = @sieve[n]
    while n % t == 0
      n /= t
    end
    return totient(n, ans_top * (t-1), ans_bottom*t)  
  end
  
  def factorize(n, arr = [])
    if n > @max
      if miller(n)
        return [[n, 1]]
      end

      primes do |p|  
        if n % p == 0
          k = 0
          while n % p == 0
            k += 1
            n /= p
          end
          return factorize(n, [[p,k]])
        end        
      end   
      throw ("#{n}: Too big, no small factors")   
    end
    
    return arr if n == 1
    t = @sieve[n]
    k = 0
    if t.nil?
      puts "BAD N: #{n}"
      exit
    end
    
    while n % t == 0
      k += 1
      n /= t
    end
    arr.unshift([t,k])
    return factorize(n, arr)  
  end


  # your solution to 141 has a faster version of this...
  def divisors(n, factorization = nil, cur_dig = 1, cur_prod = 1, &proc)
    if factorization.nil?
      factorization = Hash.new(0)
      factorize(n).each do |f|
        factorization[f[0]] += f[1]
      end
    end
    if cur_dig == factorization.keys.max
      yield cur_prod
      return
    end  
    factorization.each do |p,e|
      if p > cur_dig
        0.upto(e) do |k|
          cur_prod *= p**k
          divisors(n, factorization, p, cur_prod, &proc)
          cur_prod /= p**k
        end        
        break
      end
    end
  end

  def divisors_of_square(n)
    factorization = Hash.new(0)
    factorize(n).each do |f|
      factorization[f[0]] += 2*f[1]
    end
    divisors(n*n, factorization, &proc)
  end

    
  def prime_factors(n, arr = [])
    throw "too big" if n > @max
    return arr if n == 1
    t = @sieve[n]
    k = 0
    while n % t == 0
      k += 1
      n /= t
    end
    arr.unshift(t)
    return prime_factors(n, arr)  
  end

  def setup
    @sieve = Array.new(@max, 0)
    a = 2
    while true
      while @sieve[a] != 0 and a < @max
        a += 1
      end
      break if a >= @max
      #puts a
      k = 1
      while a*k < @max
        @sieve[a*k] = a
        k += 1
      end
    end
  end
  
  def initialize(max)
    @max = max
    setup
  end  
end
