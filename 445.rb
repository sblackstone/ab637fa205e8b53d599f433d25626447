

require 'pp'

require './primes.rb'
Primes.setup(10_000_000)



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
  return h
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

######################################################################


# a-value generation
######################################################################

def solutions_for_p(p)
  yield [p, 1]
  yield [p, 0]
end

def crt(equations)
  n = equations.map {|e| e[0]}.inject(&:*)
  s = 0
  equations.each do |e|
    ai = e[1]
    ni = e[0]
    ri,si = extended_gcd(ni, n / ni)
    ei = si*(n / ni)
    s += ai*ei
  end
  return s , n
end

def search(facts, arr = [], &block)
  if facts.keys.empty?
    yield crt(arr)
    return
  end

  p = facts.keys.first
  e = facts[p]
  facts.delete(p)

  solutions_for_p(p**e) do |s|
    arr.push s
    search(facts, arr, &block)
    arr.pop
  end
  facts[p] = e
end

def valid_a(pfacts)
  search(pfacts) do |k|
    a = k[0] % k[1]
    yield a if a > 0
  end

end



######################################################################
# Test Code
######################################################################

def f(a,b,n,x)
  return ((a*x % n) + b) % n
end


def test2(a,b,n)
  0.upto(n-1) do |x|
    f1 = f(a,b,n,x)
    f2 = f(a,b,n,f1)
    return false if f1 != f2
  end  
  true
end

def test(n, quiet = false)
  h = Hash.new(0)
  puts "N: #{n}" unless quiet
  count = 0
  1.upto(n-1) do |a|
    0.upto(n-1) do |b|
      if test2(a,b,n)
        h[a] += 1
        puts "\t(#{a},#{b})" unless quiet 
        count += 1
      end
    end
  end
  puts unless quiet
  pp h unless quiet
  puts unless quiet
  puts "Count = #{count}" unless quiet
  puts unless quiet
  count
end

def predict_fast(input)
  if input.class == Fixnum
    n = input
    pfacts = factor(input)
  else
    pfacts = input
    n = defactor(pfacts)
  end
  sum = 0
  valid_a(pfacts) do |a|
    d = a.gcd(n)
    sum += d
  end
  sum  
end


def solve(f)
  guess = 1
  f.each do |p,e|
    guess *= ((p**e) + 1)
  end
  guess - defactor(f)
end

######################################################################
# nCk Generation
######################################################################

def sum_of_digits_in_p_adic(n, p)
  s = 0
  while n > 0
    s += n % p
    n /= p
  end
  s
end

def kummer(n,m,p)
  (sum_of_digits_in_p_adic(m,p) + sum_of_digits_in_p_adic(n-m,p)  - sum_of_digits_in_p_adic(n,p)) / (p-1)
end

def n_choose_m_factorization(n,m)
  return {1 => 1} if n == m
  h = Hash.new
  s = 1
  Primes.primes.each do |p|
    break if p > n
    e = kummer(n,m,p)
    if e > 0
      #puts "#{p}**#{e}"
      h[p] = e
      s *= p**e
    end
  end
  return h
end

def nck_series(n, &block)
  fact = n_choose_m_factorization(n,1)
  yield fact
  1.upto(n-2) do |k|
    num = factor(n-k)
    den = factor(k+1)
    num.each do |p,e|
      if fact[p].nil?
        fact[p] = e
      else
        fact[p] += e
      end
    end
    den.each do |p,e|
      fact[p] -= e
      fact.delete(p) if fact[p] == 0
    end
    yield fact
  end
end



######################################################################
# Main
######################################################################


s = 0
n_choose_m_factorization(10, 3).each do |p,e|
  s += p*e
end
puts s



exit
sum = 0
count = 0
nck_series(100_000) do |f|
  count += 1
  sum += solve(f) %  1_000_000_007
  sum = sum %  1_000_000_007
  puts count if count % 1000 == 0
end
puts sum


=begin
sum  = 0
1.upto(99_999) do |m|
  puts m
  f = n_choose_m_factorization(100_000, m)
  sum += solve(f) %  1_000_000_007
  sum = sum  %  1_000_000_007
end

puts sum


exit
=end
=begin
puts solve(factor(1))
exit
sum = 0
c = 0
2.upto(10**7) do |i|
  c += 1
  sum += (solve(factor(i)) % 1_000_000_007)
  sum = sum % 1_000_000_007
  puts c if c % 1_000 == 0
end

puts sum % 1_000_000_007
=end
