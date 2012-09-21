require 'pp'

# REQUIRES PRIMES TO BE CALLED.

def sigma_p_a(p,a)
  return ((p**(a+1)) - 1) / (p - 1)
end

# Working Sigma..
def sigma_oracle(n)
    return 1 if n == 1
    return n+1 if Primes.isPrime?(n)
    val = n + 1
    2.upto((n/2) + 1).each do |i|
      val = val + i if n % i == 0
    end
    return val
end

def highest_power(n,p)
  a = 0
  while n % p == 0
    a = a + 1
    n = n / p
  end
  return a
end

@shash = {}
def sigma(n)
    return 1 if n == 1
    return n+1 if Primes.isPrime?(n)  
    return @shash[n] if @shash[n]
    Primes.primes.each do |p|
      next unless n % p == 0
      a = highest_power(n,p)
      if n/(p**a) == 1
        return @shash[n] ||= sigma_p_a(p,a)
      else
        return @shash[n] ||= sigma_p_a(p,a)*sigma(n/(p**a))
      end
    end
end


# test harness.
#1.upto(100000) do |i|
#   sigma(i)
#  sigma_oracle(i)
#end
