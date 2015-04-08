=begin
Let f(N) be the number of points with integer coordinates that are on a circle passing through (0,0), (N,0),(0,N), and (N,N).

It can be shown that f(10000) = 36.

What is the sum of all positive integers N ≤ 1011 such that f(N) = 420 ?


0,N          N,N


0,0          N,0





(x - (n/2))**2 + (y -(n/2))**2 = 2N

which follow from x**2 + y**2 + Dx + Ey + F = 0

and plugging in and solving...



=end

require 'pp'

class Point
  attr_accessor :x, :y
  
  def midpoint(other)
    Point.new((@x + other.x) / 2.0, (@y + other.y) / 2.0)
  end
  
  def gradient(other)
    (other.y - @y.to_f) / (other.x - @x.to_f)
   
  end
  
  
  def initialize(x,y)
    @x = x 
    @y = y
  end
  
end


def equation_of_circle(p, q, r)
  midpoint_pq = p.midpoint(q)
  midpoint_qr = q.midpoint(r)
  gradient_pq = p.gradient(q)
  gradient_qr = q.gradient(r)
  pp midpoint_pq
  pp midpoint_qr
  pp gradient_pq
  pp gradient_qr
end


p = Point.new(0,0)
q = Point.new(4,4)
r = Point.new(0,4)


equation_of_circle(p,q,r)
