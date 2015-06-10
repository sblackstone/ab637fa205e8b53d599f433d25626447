=begin

Square on the Inside
Problem 504
Let ABCD be a quadrilateral whose vertices are lattice points lying on the coordinate axes as follows:

A(a, 0), B(0, b), C(−c, 0), D(0, −d), where 1 ≤ a, b, c, d ≤ m and a, b, c, d, m are integers.

It can be shown that for m = 4 there are exactly 256 valid ways to construct ABCD. Of these 256 quadrilaterals, 42 of them strictly contain a square number of lattice points.

How many quadrilaterals ABCD strictly contain a square number of lattice points for m = 100?


Area of Polygon = AB/2 + BC/2 + CD/2 + AD/2



       B
       |
       |
       |
C-----------------A
       |
       |
       |
       D
       
       
       plot A(1, 0), (0, 3), (−2, 0), (0, −4)
       
  
  
A = i + b/2 - 1

i = A - b/2 + 1


1 4 2 3 10.5 9.5


A = ( 1,  0)
B = ( 0,  4)

B = ( 0,  4)
C = (-2,  0)

C = (-2,  0)
D = ( 0, -3)


D = ( 0, -3)
A = ( 1,  0)










=end


require 'pp'


def points_between(x0, y0, x1, y1)
  m = Rational(y1 - y0, x1 - x0)
  
  min_y = [y0,y1].min
  max_y = [y0,y1].max
  
  b = y0 - m*x0
  count = 0  
  min_y.upto(max_y) do |y|
    x = (y-b) / m
    if x == x.round
      #puts "#{x.to_i},#{y}"
      count += 1
    end
  end
  count  
end



def area(a,b,c,d)
  ((a+c) * (b+d)) / 2.0  
end

def ep(x1,y1,x2,y2)
  #(x1-x2).gcd(y1-y2) + 1
  (x1-x2).gcd(y1-y2)

end


def exterior_points(a,b,c,d)
  #ep(a,0,0,b) + ep(0,b, c*-1, 0) + ep(c*-1,0, 0, d*-1) + ep(0,d*-1,a,0) - 4
  ep(a,0,0,b)  + ep(0,b, c*-1, 0) + ep(c*-1,0, 0, d*-1) + ep(0,d*-1,a,0)
end


M = 100

def interior_points(a,b,c,d)
  (((a+c) * (b+d)) / 2.0) - (exterior_points(a,b,c,d) / 2.0) + 1
end


@squares = Hash.new
1.upto(10**6) do |k|
  @squares[k*k] = k
end

count = 0


1.upto(M) do |a|
  puts "A = #{a}"
  1.upto(M) do |b|
    a.upto(M) do |c|
      b.upto(M) do |d|   
        ip = interior_points(a,b,c,d)
        unless @squares[ip.to_i].nil?
          count += 1
          count += 1 unless a == c
          count += 1 unless b == d
          count += 1 unless a == c or b == d
          #puts "#{a} #{b} #{c} #{d}\t#{area(a,b,c,d)}\t#{ip}\t#{exterior_points(a,b,c,d)}"
        end
      end
    end
  end
end

puts count


