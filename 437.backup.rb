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
def leg_sym(a,p)
  return leg_sym(a % p, p) if a > p
  if a == -1
    return 1 if p % 4 == 1
    return 3 if p % 4 == 3
    throw "shouldnt happen"
  end
  if a == 2
    return  1 if p % 8 == 1 or p % 8 == 7
    return -1 if p % 8 == 3 or p % 8 == 5
  end
  if a % 2 == 0
    return leg_sym(a / 2, p) * leg_sym(2, p)    
  end
  return 1 if a == 1
  return 0 if a.gcd(p)  == 1
  m = (a % 4 == 1 or p % 4 == 1) ? 1 : -1
  return m*leg_sym(p % a, a)
end
=end

=begin
def leg_sym(a,p)
  if a > p
    return leg_sym(a % p, p)
  end
  
  if a == -1
    return p % 4 == 1 ? 1 : -1
  end
  
  if a == 2
    return (p % 8 == 1 or p % 8 == 7) ? 1 : -1
  end
  
  if a % 2 == 0
    return leg_sym(2,p) * leg_sym(a/2, p)
  end
  
  return 1 if a == 1
  return 0 if a.gcd(p) > 1    
  
  return (-1)**(((a-1)/2)*((p-1)/2)) * leg_sym(p, a)
      
end

=end

=begin
Count = 323
Sum = 1480491

real	0m3.238s
user	0m3.164s
sys	0m0.060s
=end


def candidates(p)
  1.upto(p-1) do |x|
    yield x if (x*x % p) == (x+1)
  end
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


count = 0
sum = 0

f = File.open('./primes_to_10_8.txt')

while (line = f.gets)
  p = line.to_i
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


