=begin
When we calculate 8n modulo 11 for n=0 to 9 we get: 1, 8, 9, 6, 4, 10, 3, 2, 5, 7.
As we see all possible values from 1 to 10 occur. So 8 is a primitive root of 11.
But there is more:
If we take a closer look we see:
1+8=9
8+9=17≡6 mod 11
9+6=15≡4 mod 11
6+4=10
4+10=14≡3 mod 11
10+3=13≡2 mod 11
3+2=5
2+5=7
5+7=12≡1 mod 11.

So the powers of 8 mod 11 are cyclic with period 10, and 8n + 8n+1 ≡ 8n+2 (mod 11).
8 is called a Fibonacci primitive root of 11.
Not every prime has a Fibonacci primitive root.
There are 323 primes less than 10000 with one or more Fibonacci primitive roots and the sum of these primes is 1480491.
Find the sum of the primes less than 100,000,000 with at least one Fibonacci primitive root.




x**n + x**(n+1) = x**(n+2) mod p

x**n(1 + x) = x**(n+2) mod p

(x+1) == (x**(n+2) / x**n) mod p


(x+1) == x**2 mod p


x**n + x**(n+1) - x**(n+2) = kp



=end


require './primes.rb'

Primes.setup(10**2)


=begin
Count = 323
Sum = 1480491

real	0m3.238s
user	0m3.164s
sys	0m0.060s
=end

@squares = Hash.new(false)

1.upto(21000) do |i|
  @squares[i**2] = i
end



def candidates2(p)
  k = 4
  stop = ((2*(p - 1) - 1)**2 - 5) / p.to_f
  while true
    if @squares[k*p + 5]
      yield  (1 + @squares[k*p + 5]) / 2
    end
    k += 4
    break if k > stop
  end
end

def candidates(p)
  t1, t2 = tonelli_shanks(5, p)
  yield ((t1 - 1) / 2) % p if t1
  yield ((t1 + 1)/2) % p if t2
end


def testx(x,prime)
  h = Hash.new(nil)
  h[1] = 0
  k = 1
  1.upto(prime - 2) do |n|
    k = (k*x) % prime
    return false unless h[k].nil?
    h[k] = x
  end
  return true
end

def test(prime)
  candidates(prime) do |x|
    t = testx(x,prime)
    return x if t != false
  end
  return false
end


def euler_criterion(a, p)
  return (a**((p-1)/2) % p == 1)
end

def tonelli_shanks(n,p)
  throw "not residue" unless euler_criterion(n,p)
  q = p - 1
  s = 0
  while q % 2 == 0
    s += 1
    q /= 2
  end
  z = 1
  while euler_criterion(z,p)
    z +=1
  end
  c = z**q % p
  r = n**((q+1)/2)
  t = n**q % p
  m = s
  while true
    return [r, r*-1 + p] if t == 1
    i = 1
    while t**(2**i) % p != 1
      i += 1
    end
    b = c**2**(m - i - 1) % p
    r = r*b % p
    t = (t * b**2) % p
    c = b**2 % p
    m = i
  end
end


puts tonelli_shanks(5, 11)
exit
candidates(11) {|x| pp x}
exit
count = 1
sum = 5

f = File.open('./primes_to_10_8.txt')

while (line = f.gets)
  p = line.to_i
  pm5 = p % 5
  next unless pm5 == 1 or pm5 == 4
  v = test(p)
  if v
    count +=1
    puts p
    sum += p
  else
    puts "not #{p}"
  end
  break if p > 10**4
end

puts "Count = #{count}"
puts "Sum = #{sum}"


