=begin
Let pn be the nth prime: 2, 3, 5, 7, 11, ..., and let r be the remainder when (pn1)n + (pn+1)n is divided by pn2.

For example, when n = 3, p3 = 5, and 43 + 63 = 280  5 mod 25.

The least value of n for which the remainder first exceeds 109 is 7037.

Find the least value of n for which the remainder first exceeds 10**10.
=end

require './primes.rb'

CUTOFF = 10**10

Primes.setup(1_000_000)

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

i = 2

while i < Primes.primes.size
  p = Primes.primes[i]
  n = i + 1
  a = modpow(p+1, n, p*p)
  b = modpow(p-1, n, p*p)
  v = (a+b) % (p*p)
  if (v > CUTOFF)
    puts v
    puts p
    puts i
    puts n
    exit
  end
  i += 2
end




