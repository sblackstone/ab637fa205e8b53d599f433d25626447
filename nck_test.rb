require 'pp'
require './primes.rb'

Primes.setup(100_000)

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

def puts_n(factors)
  s = 1
  factors.each do |p,e|
    s *= (p**e)
  end
  s
end


def series(n, &block)
  fact = { 1 => 1}
  yield fact
  fact = n_choose_m_factorization(n,1)
  yield fact
  1.upto(n-1) do |k|
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
    end
    yield fact
  end
end

s = 0
series(25) do |k|
 s += 1
 puts s
 #puts puts_n(k)
end
