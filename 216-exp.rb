=begin
Investigating the primality of numbers of the form 2n2-1
Problem 216
Consider numbers t(n) of the form t(n) = 2n**2-1 with n > 1.
The first such numbers are 7, 17, 31, 49, 71, 97, 127 and 161.
It turns out that only 49 = 7*7 and 161 = 7*23 are not prime.
For n ≤ 10000 there are 2202 numbers t(n) that are prime.

How many numbers t(n) are prime for n ≤ 50,000,000 ?

2n**2 -1 = p

n**2 = (p + 1) / 2 mod p





=end

require 'pp'
require './primes.rb'

Primes.setup(100_000)

=begin
# brute
def legendre_symbol_brute(a,p)
  return 0 if a % p == 0
  return 1 if a == 1
  return legendre_symbol_brute(a % p, p) if a > p
  1.upto(p-1) do |x|
    if x**2 % p == a
      #puts "#{x}**2 % #{p} == #{a}"
      return 1 
    end
  end
  #puts "#{a} is not a quadratic residue of #{p}"
  return -1
end
=end

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
  Primes.primes.each do |q|
    if a % q == 0
      return legendre_symbol(a/q, p) * legendre_symbol(q,p)
    end    
  end  
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

=begin
2.upto(10) do |k|
  t1,t2 = tshanks(k,13)
  if t1
    puts "#{k}: #{t1} #{t1}**2 % 13 = #{t1**2 % 13}"
    puts "#{k}: #{t2} #{t2}**2 % 13 = #{t2**2 % 13}"
  end
end
=end

@sieve = Array.new(1_000, 1)

@max_prime = 13

Primes.primes.each do |p|
  next if p == 2
  break if p > @max_prime
  puts "#{(p+1)/2}, #{p}"
  a,b = tshanks((p+1)/2, p)
  unless a.nil?
    puts "#{a} #{b}"
  end
  
end


#pp @sieve



