=begin
If we calculate a**2 mod 6 for 0 <= a <= 5 we get: 0,1,4,3,4,1.

The largest value of a such that a**2 = a mod 6 is 4.
Let's call M(n) the largest value of a < n such that a**2 = a (mod n).

So M(6) = 4.

Find sum M(n) for 1 <=  n  <= 10**7.

If n = p^k, then M(n) = 1


a**2 = a mod n
a**2 - a = 0 mod n
a(a-1) = 0 mod n

a(a-1) = nk


n = 3 * 2



brute(6) = 4

   0 1 
-------
0| 0 0 
1| 0 1 


   0 1 2 
--------
0| 0 0 0  
1| 0 1 2 
2| 0 2 1 


           0     1     2     3     4     5

         (0,0) (0,1) (0,2) (1,0) (1,1) (1,2)

0 (0,0)  (0,0) (0,0) (0,0) (0,0) (0,0) (0,0)
1 (0,1)  (0,0) (0,1) (0,2) (0,0) (0,1) (0,2)  
2 (0,2)  (0,0) (0,2) (0,4) (0,0) (0,2) (0,4)
3 (1,0)  (0,0) (0,0) (0,0) (1,0) (1,0) (1,0)
4 (1,1)  (0,0) (0,1) (0,2) (1,0) (1,1) (1,2)
5 (1,2)  (0,0) (0,2) (0,4) (1,0) (1,2) (1,4)




   0 1 2 3 4 5
--------------
0| 0 0 0 0 0 0
1| 0 1 2 3 4 5
2| 0 2 4 0 2 4
3| 0 3 0 3 0 3
4| 0 4 2 0 4 2
5| 0 5 4 3 2 1





Z/6Z = Z/2Z * Z/3Z






6: 4     6  = 3*2    4 = 2*2
10: 6    10 = 5*2    6 = 3*2  
14: 8
15: 10
21: 15
22: 12


e(e-1) = n*k

A start: You can figure it out! Let us start with a product mn of relatively prime integers, neither equal to 1. 
By the Chinese Remainder Theorem, there is an x such that x≡0(modm) and x≡1(modn). Then x2≡x(modmn).

22 = 11 * 2

x = 1 mod 11
x = 0 mod  2

x = 11t + 1
x = 2 q
2x = 11t + 2q





=end

require 'pp'
require './primes.rb'
Primes.setup(10**6)

def brute(n)
  (n-1).downto(1) do |a|
    if (a**2 % n) == a 
      return a
    end
    
  end
end

def extended_gcd(a, b)
    if a % b == 0
        return 0, 1
    else
        x, y = extended_gcd(b, a % b)
        return y, (x - y * (a / b))
    end
end

def crt(arr)
  product = arr.map {|x| x[1]}.inject(:*)
  sol = 0 
  arr.each do |a|
    b,c = extended_gcd(a[1], product / a[1])
    e   = (product / a[1]) * c
    sol += e*a[0]
  end
  return sol % product, product
end

def prime_power?(n)
  max_k = Math.log(n,2).ceil
  2.upto(max_k) do |k|
    m = n**(1.0/k.to_f)
    if m == m.round and n == m**k
      puts "m = #{m} and #{m}**#{k} == #{m**k}"
      return true
    end  
  end
  puts "#{n} is not a prime power"
  return false
end



def slightly_clever(n)
  return 1 if Primes.isPrime? n || prime_power?(n)
  arr = []
  2.upto(n-1) do |d|
    if n % d == 0
      a  = d
      b  = n / d
      if a != b
        v = crt [[0,a],[1,b]]
        arr.push v.first
      end
    end
  end
  arr.empty? ? 1 : arr.max  
end



2.upto(100) do |i|
  a = brute(i)
  b = slightly_clever(i)
  puts "#{i} #{a} #{b}" if a != b
end







exit




def brute(n)
  (n-1).downto(1) do |a|
    if (a**2 % n) == a 
      return a
    end
    
  end
end


def extended_gcd(a, b)
    if a % b == 0
        return 0, 1
    else
        x, y = extended_gcd(b, a % b)
        return y, (x - y * (a / b))
    end
end

def crt(arr)
  pp arr
  product = arr.map {|x| x[1]}.inject(:*)
  sol = 0 
  arr.each do |a|
    b,c = extended_gcd(a[1], product / a[1])
    e   = (product / a[1]) * c
    sol += e*a[0]
  end
  return sol % product, product
end


def factorize(n)
  ans = []
  Primes.primes.each do |p|
    if n % p == 0
      k = 1
      while n % p**(k+1) == 0
        k += 1
      end
      ans.push p**k
    end
  end
  return ans
end


def clever(n)
  ans = []
  f = factorize(n)
  print "Factors: "
  pp f
  f.each do |a|
    arr = [
      [0, a],
      [1, n/a]
    ]
    ans.push crt(arr).first

    arr = [
      [0, n/a],
      [1, a]
    ]
    ans.push crt(arr).first
  end
  pp ans.sort
  ans.max
end


pp clever(210)
pp brute(210)
exit



2.upto(1000) do |i|
  x = brute(i)
  y = clever(i)
  
  puts "#{i}: #{x} #{y}" if x != y
end



