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

#1000000000000


fact = 1

1.upto(10) do |i|
  while i % 10 == 0
    i /= 10
  end
  fact = (fact * (i % 100000 )) % 100000
  while fact % 10 == 0
    fact /= 10
  end
end

puts fact