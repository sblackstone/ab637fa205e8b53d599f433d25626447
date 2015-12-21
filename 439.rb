=begin

Let d(k) be the sum of all divisors of k.
We define the function S(N) = ∑1≤i≤N ∑1≤j≤N d(i·j).
For example, S(3) = d(1) + d(2) + d(3) + d(2) + d(4) + d(6) + d(3) + d(6) + d(9) = 59.

You are given that S(10**3) = 563576517282 and S(10**5) mod 10**9 = 215766508.
Find S(10**11) mod 10**9.




7 11 13 17 18 19 21 23 24

1  2   3  4   5
2  4   6  8   10
3  6   9  12  15
4  8  12  16  20
5  10 15  20  25


1      2       3          2**2        5
2      2**2    3*2        2**3        2*5
3      3*2     3**2       2**2 * 3    3*5
2**2   2**3    2**2 * 3   2**4        2**2*5
5      2*5     3*5        2**2 * 5    5**2



1  (1)       3   (1+2)          4   (1+3)             7   (1+2+4)           6   (1+5)
3  (1+2)     7   (1+2+4)       12   (1+2+3+6)        15   (1+2+4+8)        18   (1+5+2+10)
4  (1+3)    12   (1+2+3+6)     13   (1+3+9)          13   (1+2+3+4+6+12)   28   (1+2+3+4+6+12)   
7  (1+2+4)  15   (1+2+4+8)     28   (1+2+3+4+6+12)   31   (1+2+4+8+16)     42   (1+5+2+4+10+20)
6  (1+5)    18   (1+5+2+10)    24   (1+5+3+15)       42   (1+5+2+4+10+20)  31   (1+5+25)







=end


require './primes.rb'
require 'pp'




def test(n)
  a = Array.new(n**2 + 1,0)
  1.upto(n) do |i|
    1.upto(n) do |j|
      a[i*j] += 1
    end
  end
  1.upto(n**2 + 1) do |k|
    print " #{k} " if a[k] == 0
  end
  puts
  return a
end



1.upto(10) do |i|
  print "#{i}: "
  test(i)
end


exit


Primes.setup(100)
=begin
@answer = Hash.new(0)

def test(n)  
  1.upto(n) do |i|
    yield i if n % i == 0
  end
end

1.upto(10) do |i|
1.upto(10) do |j|
  test(i*j) do |x|
    @answer[x] += 1
  end
end
end
pp @answer.sort

=end



1.upto(5) do |i|
  puts
  1.upto(5) do |j|
    print " #{i*j} "
  end  
end
puts

1.upto(5) do |i|
  puts
  1.upto(5) do |j|
    if i < j 
      print "     "
    else
      print " #{i*j} "
    end
  end  
end
puts
=begin

=end

Primes.setup(10**5)

@dcache = Hash.new
def sum_of_divisors(n)
  @dcache[n] ||= do_sum_of_divisors(n)
end

def do_sum_of_divisors_slow(n)  
  s = 0
  1.upto(n) do |i|
    s += i if n % i == 0
  end
  return s
end

def do_sum_of_divisors(n)  
  s = 0
  return (n+1) if Primes.isPrime?(n)
  return 1 if n == 1
  Primes.primes.each do |p|
    if n % p == 0
      ai = 0
      while n % p == 0
        ai +=1
        n /= p
      end
      return (p**(ai+1) - 1) / (p - 1) * sum_of_divisors(n)
    end
  end
  throw "Out of bounds"
end

def S(n)
  c = 0
  1.upto(n) do |i|
    i.upto(n) do |j|
      if i == j
        c += sum_of_divisors(i*j) 
      else
        c += sum_of_divisors(i*j) * 2
      end
    end
  end
  return c
end

puts S(10**3)