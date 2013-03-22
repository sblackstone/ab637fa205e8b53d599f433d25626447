=begin
Let r be the remainder when (a-1)^n + (a+1)^n is divided by a^2.

For example, if a = 7 and n = 3, then r = 42: 63 + 83 = 728  42 mod 49. And as n varies, so too will r, but for a = 7 it turns out that rmax = 42.

For 3  a  1000, find  rmax.

(a-1)^n + (a+1)^n % a^2


= ((a-1)^n mod n + (a+1)^n mod n) mod n


n=3   6 a +   2 a^3
n=5  10 a +  20 a^3 +   2 a^5
n=7  14 a +  70 a^3 +  42 a^5 +  2 a^7
n=9  18 a + 168 a^3 + 252 a^5 + 72 a^7 + 2a^9
=end



def rmax(a)
  asquared = a**2
  t1 = (a+1) % asquared
  t2 = (a-1) % asquared
  n = 1
  max = 0
  v  = (t1+t2) % asquared

  while n < a**2
    max = v if v > max
    n += 2
    t1 = (t1*(a+1)) % asquared
    t2 = (t2*(a-1)) % asquared
    v  = (t1+t2) % asquared
  end
  return max
end


total = 0

3.upto(1000) do |i|
  puts "#{i}: #{rmax(i)}"
  total += rmax(i)
end

puts "Answer: #{total}"


=begin

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



def rmax(a)
  max = 0
  asquared = a**2
  n = 1
  while n <= a**2
    v = (modpow(a-1,n,asquared) + modpow(a+1,n,asquared)) % asquared
    puts "#{a} #{n} #{v}" if n % 2 == 0
    max = v if v > max
    n += 2
  end
  return max
end

total = 0

3.upto(1000) do |i|
  puts "#{i}: #{rmax(i)}"
  total += rmax(i)
end

puts "Answer: #{total}"
=end


