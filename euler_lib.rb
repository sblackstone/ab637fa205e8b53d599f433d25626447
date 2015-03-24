require 'pp'

def extended_gcd(a, b)
    if a % b == 0
        return 0, 1
    else
        x, y = extended_gcd(b, a % b)
        return y, (x - y * (a / b))
    end
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

def legendre_symbol(a,p)
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
  throw new Exception("Need to fix this to call new primes system...")
=begin
  Primes.primes.each do |q|
    if a % q == 0
      return legendre_symbol(a/q, p) * legendre_symbol(q,p)
    end
  end
=end
end

def tshanks(n, p)

  return nil,nil unless legendre_symbol(n,p) == 1
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
  while legendre_symbol(z,p) > -1
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

  def self.fetch(power_of_ten)
    fn = "/tmp/handy_sieve_#{power_of_ten}"
    if File.file? fn
      return Marshal.load(File.read(fn))
    else
      h = HandySieve.new(10**power_of_ten)
      File.open(fn, "w") do |f|
        f.write Marshal.dump(h)
      end
      return h
    end    
  end
  
  def prime_power?(n)
    pf = prime_factors(n)
    return pf.length == 1 && pf.first.last > 1
  end

  def prime?(n)
    @sieve[n] == n
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
    
  def prime_factors(n, arr = [])
    throw "too big" if n > @max
    return arr if n == 1
    t = @sieve[n]
    k = 0
    while n % t == 0
      k += 1
      n /= t
    end
    arr.unshift([t,k])
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
