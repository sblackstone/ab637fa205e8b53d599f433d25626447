=begin

Given integers n≥m≥0 and a prime number p, then the power of p dividing (nm) is equal to the number of carries when adding m and n−m in base p.

=end

require 'pp'
require './primes.rb'

Primes.setup(1_000_000)

def adic_represent(n,p)
  arr = []
  while n > 0
    arr.push n % p
    n /= p
  end
  arr
end

def sum_of_digits_in_p_adic(n, p)
  adic_represent(n,p).inject(&:+)
end



def kummer(n,m,p)
  (sum_of_digits_in_p_adic(m,p) + sum_of_digits_in_p_adic(n-m,p)  - sum_of_digits_in_p_adic(n,p)) / (p-1)
end


def n_choose_m_factorization(n,m)
  h = Hash.new
  s = 1
  Primes.primes.each do |p|
    e = kummer(n,m,p)
    if e > 0
      puts "#{p}**#{e}"
      h[p] = e
      s *= p**e
    end
  end
  return h
end


pp n_choose_m_factorization(25,12)

