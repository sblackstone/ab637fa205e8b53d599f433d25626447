=begin
Let E(x0, y0) be the number of steps it takes to determine the greatest common divisor of x0 and y0 with Euclid's algorithm. More formally:
x1 = y0, y1 = x0 mod y0
xn = yn-1, yn = xn-1 mod yn-1
E(x0, y0) is the smallest n such that yn = 0.

We have E(1,1) = 1, E(10,6) = 3 and E(6,10) = 4.

Define S(N) as the sum of E(x,y) for 1 ≤ x,y ≤ N.
We have S(1) = 1, S(10) = 221 and S(100) = 39826.

Find S(5·106).



gcd_count(a,b) = gcd_count(c,b) when a = c mod b and a > c



=end

require 'pp'


def gcd(a,b)
  return b == 0 ? a : gcd(b, a % b)
end

def gcd_count(a,b)
  return b == 0 ? 0 : 1 + gcd_count(b, a % b)
end

=begin
def count_congrunces_manual(x,y,n,target)
  count = 0
  x.upto(y) do |i|
    if i % n == target
      count +=1
    end
  end
  return count
end



def count_congrunces(x,y,n,target)
  while y % n != target
    y -= 1
  end
  while x % n != target
    x += 1
  end
  return ((y - x)  / n) + 1
end


S = 2000
sum = 0
2.upto(S) do |b|
  (b+1).upto(S) do |a|
    break if a % b == 1 and a != b+1
    sum += (gcd_count(a,b)*2 + 1) * count_congrunces(a, S, b, a % b)
  end
end

puts sum + 4*S - 3


exit
=end

S = 20

@a = Array.new(S+1,0)
@a.each_with_index do |v,i|
  @a[i] = Array.new(S+1,0)
  @a[i][0] = nil
end
@a[0] = Array.new(S+1,nil)


@sum = S
@sum += S - 1
@sum += 2*(S - 1)

2.upto(S) do |i|
  (i+1).upto(S) do |j|
    @a[j][i] = gcd_count(j,i)
    @sum += gcd_count(j,i)*2 + 1
  end
end

1.upto(S) do |i|
  1.upto(S) do |j|
    print " #{@a[i][j]} " unless @a[i][j] % 2 > 0
  end
  puts
end

puts "Sum = #{@sum}"

