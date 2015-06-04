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


=end

require 'pp'

r = 45

total = 0
0.upto(r) do |x|
  x.upto(r) do |y|
    y.upto(r) do |z|
      if (x**2 + y**2 + z**2 == r**2)
        puts "#{x},#{y},#{z}" if z > 0
        total += x.abs + y.abs + z.abs
      end
    end
  end
end
puts "Total: #{total}"
puts "----" * 25


exit

@map = Hash.new(nil)
@squares = Hash.new(false)
@squares[0] = true



1.upto(r) do |x|
  @squares[x**2] = true
  (x).upto(r) do |y|
    @map[x**2 + y**2] ||= []
    @map[x**2 + y**2].push [x,y, x+y]
  end 
end

# front back left right top bottom
extremes = r*6


#equator 
equator = 0
if @map[r**2]
  @map[r**2].each do |a|
    equator += a[2] * 8  # what if x = y?
  end
end
pp "Equator: #{equator}"

slices = 0
1.upto(r-1) do |z|
  h = r - z
  asquared = 2*r*h - h**2
  if @squares[asquared]
    slices += (z + Math.sqrt(asquared)) * 8
  end
  if @map[asquared]
    @map[asquared].each do |sol|
      if sol[0] == sol[1]
        slices += (z + sol[2]) * 8
      else
        slices += (z + sol[2]) * 16
      end
    end
  end
end

puts slices + equator + extremes


