require 'lib'
require 'primes'
Primes.setup(1_000_000)



@primes = Hash.new

@t = Hash.new

def totient(n)
  @t[n] ||= do_totient(n)
end

def perm?(a,b)
  a.to_s.split("").sort.join("") == b.to_s.split("").sort.join("")
end

def do_totient(n)
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


puts totient(87109)
puts perm?(totient(87109),87109)
#exit
max  = -1
maxn = 0 
k = 0
2.upto(1_000_000) do |n|
  next if n % 10 == 0
  t = totient(n)
  puts "#{n}: #{t}" if perm?(n,t)
  k = k + 1
  val = n / t
  if val > max
    max = val
    maxn = n
  end
end
puts maxn
puts max
exit
