require 'pp'

NVAL = 100_000_000

def vp(base)
  tmp = NVAL
  index = 0
  result = 0
  while (tmp != 0)
    result += tmp % base
    tmp = tmp / base
    index += 1
  end
  return((NVAL-result) / (base -1))
end

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


@max_prime = 100_000_000
c = 1

f = File.open("primes_to_10_8.txt")

while (line = f.gets) do
  line.strip!
  num = line.to_i
  break if num > @max_prime
  v = vp(num)
  c *= (1 + modpow(num, v*2, 1000000009)) % 1000000009
  c = c % 1000000009
end

puts c