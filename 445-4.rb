require './primes.rb'
require 'pp'

Primes.setup(100_000)




def extended_gcd(a, b)
  if a % b == 0
      return 0, 1
  else
      x, y = extended_gcd(b, a % b)
      return y, (x - y * (a / b))
  end
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
  d = (s % n).gcd(n)
  return s / d , n
end

def solutions_for_p_e(p,e, &block)
  if p > 2
    yield [p**e, -1]
    yield [p**e,  1]
  else
    if e == 1
      yield [2, 1]
    elsif e == 2
      yield [4, 1]
      yield [4, -1]
    else
      yield [p**e,  1]
      yield [p**e, -1]
      yield [p**e, 1 + 2**(e-1)]
      yield [p**e, -1 - 2**(e-1)]
    end
  end
end

def predict2(e, n)
  sum = 0
  solutions_for_p_e(2,e) do |s|
    eq = crt([s])
    a = eq[0] % eq[1]
    sum += n.gcd(a+1)
  end  
  return sum
end

def predict(n)
  if n.class == Fixnum
    return(predict(factor(n)))
  end
  t = 1
  n.each do |p,e|
    next if e == 0
    if p > 2
      t *= (p**e) + 1
    else
      t*= predict2(e, 2**e)     
    end
  end
  t
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

def f(a,b,n,x)
  (a*x + b) % n
end


def test(n)
  sum = 0
  1.upto(n-1) do |a|
    if a**2 % n == 1
      sum += n.gcd(a+1)
    end
  end
  sum
end


# START NCK GENERATION CODE

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
  cur = predict(fact)
  yield fact,cur
  1.upto(n-2) do |k|
    num = factor(n-k)
    den = factor(k+1)
    num.each do |p,e|
      if fact[p].nil?
        fact[p] = e
        cur *= predict(p**e)
      else
        cur /= predict(p**fact[p])
        fact[p] += e
        cur *= predict(p**fact[p])
      end
    end
    den.each do |p,e|
      cur /= predict(p**fact[p])
      fact[p] -= e
      cur *= predict(p**fact[p])
      fact.delete(p) if fact[p] == 0
    end
    yield fact, cur
  end
end




# If n = 10, 1-4 double and 5 is single
# If n = 11, 1-4 double and 5 is double



# BEGIN TEST AREA

def fact(n)
  return n == 0 ? 1 : n * fact(n-1)
end

def nCk(n,k)
  fact(n) / (fact(k) * fact(n-k))
end

# 3687590023677669006184593797112 for nCk(100, i)

n = 100
sum = 0
nck_series(n) do |pfact,guess|
  puts guess == predict(pfact)
  sum += guess
  sum = sum % 1000000007
end


puts sum
puts 3687590023677669006184593797112
exit
