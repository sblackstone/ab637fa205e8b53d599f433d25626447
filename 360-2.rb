=begin
Given two points (x1,y1,z1) and (x2,y2,z2) in three dimensional space, the Manhattan distance between those points is defined as 
|x1-x2|+|y1-y2|+|z1-z2|.

Let C(r) be a sphere with radius r and center in the origin O(0,0,0).
Let I(r) be the set of all points with integer coordinates on the surface of C(r).
Let S(r) be the sum of the Manhattan distances of all elements of I(r) to the origin O.

E.g. S(45)=34518.

Find S(10**10).

10_000_000_000


x = r sin(t) cos(p)
y = r sin(t) sin(p)
z = r cos(t)

p from 0 to pi (0 to 90 degrees)
t from 0 to pi (0 to 90 degrees)
5_000_000_000

2*x = y**2

0,0,x
0,x,y
0,x,x
x,x,x
x,x,y
x,y,z
 

a**2 = 2r(r-z) - (r-z)**2

a**2 = (r+z)(r-z)




x**2 + y**2 + z**2 = r^2

d = is some square...

d(x/d)**2 + d(y/d)**2 + d(z/d)**2 = d*(r/d)**2


45**2 = x**2 + y**2 + z**2

9*(5**2) = 9(x/9)**2 + 9(y/9)**2 + 9(z/9)**2


27**2 + 36**2 + 0**2 = 45**2

9*(3**2) + 9(4**2) = 9*(5**2)


x**2 + y**2 + z**2 = 10**10

### 10 
0 0 10
0 6 8

### 100 = 2**2 * 5**2
0 0 100
0 28 96
0 60 80
36 48 80
48 60 64

### 1000 = 2**3 * 5**3 
  0 0 1000
  0 280 960
  0 352 936
  0 600 800
 24 640 768
 96 360 928
 96 480 872
152 480 864
168 224 960
168 576 800
192 480 856
192 640 744
224 600 768
280 576 768
352 360 864
360 480 800
424 480 768
480 600 640


10**10 = 2**10 * 5**10


x^2 + y^2 + z^2 = 2**20 * 5**20



45 = (a**2 + b**2 + p**2) / 2p





=end

require 'pp'

r = 45**2
h = Hash.new
1.upto(r) do |i|
  i.upto(r) do |j|
    h[i*j]=true if r % (i*j) == 0
  end
end

s = 0

h.keys.each do |d|
  s += (-1)**((d-1)/2)
end

puts 4*s

0.upto(r) do |a|
  a.upto(r) do |b|
    puts "#{a} #{b}" if a**2 + b**2 == r
  end
end

exit







exit
s = 0

0.upto(5) do |two|
  0.upto(5) do |five|
    d = 2**two * 5**five
    s += (-1)**((d-1)/2)
  end
end
puts 4*s


r = 2**3 * 5**3
rsquared = r**2


s = 0
h = Hash.new(0)
(0).upto(r) do |x|
  x.upto(r) do |y|
    y.upto(r) do |z|
      if (x**2 + y**2 + z**2 == r**2)
        puts "#{x} #{y} #{z}"
        v = (x.abs + y.abs + z.abs)
        s += v
        h[v] += 1
      end
      
    end
  end
end
puts s


=begin
def check_gcd(m,n,p,q)
  g1 = 0
  g2 = 0 
  g3 = 0
  g1 = m.gcd(n) if m > 0 and n > 0
  g2 = n.gcd(p) if n > 0 and p > 0
  g3 = p.gcd(q) if p > 0 and q > 0
  return false if g1 > 1 or g2 > 0 or g3 > 0
  return true
end


0.upto(rsquared) do |m|
  0.upto(rsquared) do |n|
    0.upto(rsquared) do |p|
      0.upto(rsquared) do |q|
        next if !check_gcd(m,n,p,q) or (m+n+p+q) % 2 == 0
        if m**2 + n**2 + p**2 + q**2 == rsquared
          a = m**2 + n**2 - p**2 - q**2
          b = 2*(m*q + n*p)
          c = 2*(n*q - m*p)
          d = m**2 + n**2 + p**2 + q**2
          puts "#{a} #{b} #{c} #{d}"
        end
      end
    end
  end
end

=end


=begin
r = 45
s = 0
h = Hash.new(0)
0.upto(r) do |x|
  x.upto(r) do |y|
    y.upto(r) do |z|
      if x**2 + y**2 + z**2 == r**2
        zeros = [x,y,z].uniq.count

        v = (x.abs + y.abs + z.abs)
        puts "#{x} #{y} #{z}" if v == 75
        h[v] += 6 if zeros == 2
        h[v] += 24 if zeros == 1
        h[v] += 48 if zeros == 0
        s += v
      end  
    end
  end
end
pp h.sort
puts s
=end