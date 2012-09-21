require 'pp'
def gcd(a, b)
    while b != 0
       t = b
       b = a % b
       a = t
    end
    return a
end

def extended_gcd(a, b)
    if a % b == 0
        return 0, 1
    else
        x, y = extended_gcd(b, a % b)
        return y, (x - y * (a / b))
    end
end

def test_prime(n)
  # Fermat's primality test.
  10.times {
    a = rand(n - 1) + 1
    return false if modpow(a,n-1,n) > 1
  }
  true
end

def random_prime(min,max)
  loop {
    i = (rand(max - min - 1) + min + 1) | 1
    return(i) if test_prime(i)
  }
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



p = random_prime(10,30)
q = random_prime(10,30)
e = 0
d = 0
n = p * q
totient = (p - 1) * (q - 1)

while d < 1 or e < 1 or e >= totient or gcd(e,totient) > 1
  e = rand(totient)
  d,y = extended_gcd(e,totient)
  d = d % totient
end
puts "*" * 50
puts "p: #{p}"
puts "*" * 50
puts "q: #{q}"
puts "*" * 50
puts "public exponent: #{e}"
puts "*" * 50
puts "private exponent: #{d}"
puts "*" * 50
puts "modulus: #{n}"
puts "*" * 50

message = "We launch at midnight"
message = "AABBCC"
code = []
message.each_byte do |m|
  code << modpow(m,e,n)
end
puts code.join("\n")
puts "*" * 50

code.each do |c|
  print modpow(c,d,n).chr
end
puts "*" * 50