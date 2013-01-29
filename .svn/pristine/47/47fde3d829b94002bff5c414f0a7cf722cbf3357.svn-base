require 'lib'
require 'primes'
Primes.setup(1_000_000)



@primes = Hash.new

@t = Hash.new

def totient(n)
  @t[n] ||= do_totient(n)
end

def do_totient(n)
  return(n - 1) if Primes.isPrime?(n)
  Primes.primes.each do |p|
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
  end
end

max  = -1
maxn = 0 

2.upto(1_000_000) do |n|
  t = totient(n).to_f
  val = n / t
  #puts "#{n}: #{t}\t#{val}"
  if val > max
    max = val
    maxn = n
  end
end
puts maxn
puts max
exit
