require 'pp'


class Point
  attr_accessor :x, :y
  def initialize(x,y)
    @x = x
    @y = y
  end  
  
  def ==(other)
    self.x == other.x && self.y == other.y
  end
  
end

class Line
  attr_accessor :p1,:p2
  
  def initialize(p1,p2)
    @p1 = p1
    @p2 = p2
  end
  
  def in_segment(p3)
    maxx = [p1.x, p2.x].max
    minx = [p1.x, p2.x].min
    maxy = [p1.y, p2.y].max
    miny = [p1.y, p2.y].min
    return minx <= p3.x && maxx >= p3.x && miny <= p3.y && maxy >= p3.y
  end
  
  def rise
    (p2.y - p1.y) 
  end
  
  def run
    (p2.x - p1.x)
  end
  
  def slope
    self.rise.to_f / self.run
  end
  
  # Ax + By = C, return A,B,C
  def matrix_row
    return [ self.run, self.rise * -1, (p1.y * self.run  - self.rise*p1.x)]
  end
    
end


class System
  attr_accessor :eq1, :eq2

  def initialize(eq1, eq2)
    @eq1 = eq1
    @eq2 = eq2
  end
  
  def solve
    a,b,e = @eq1.matrix_row
    c,d,f = @eq2.matrix_row
    #puts [a,b,c,d,e,f]
    begin
      y = (e*d - b*f) / (a*d - b*c)
      x = (a*f - e*c) / (a*d - b*c)
      return Point.new(x,y)
    rescue
      return false
    end
  end
  
  
end

=begin
p1 = Point.new(0,10)
p2 = Point.new(10,0)
l1 = Line.new(p1,p2)

p3 = Point.new(0,2)
p4 = Point.new(0,5)
l2 = Line.new(p3,p4)

s1 = System.new(l1,l2)
pp s1.solve


exit
=end

f = File.open("triangles.txt")

@triangles = []
while (line = f.gets)
  @triangles.push(line.strip.split(",").map(&:to_f))
  #break
end

@origin = Point.new(0,0)

@triangles.each do |triangle|
  #triangle = [-3,3,
  #             1,6,
  #             3,1]
  #[1,3,5].each {|x| triangle[x] -= 4 }
  #pp triangle
  #triangle = [193.0, 737.0, 842.0, -808.0, 520.0, 282.0]
  @solutions = []
  @point1 =  Point.new(triangle[0],triangle[1])
  @point2 =  Point.new(triangle[2],triangle[3])
  @point3 =  Point.new(triangle[4],triangle[5])
  
  @edges = [
     Line.new(@point1,@point2),
     Line.new(@point2,@point3),
     Line.new(@point3,@point1) 
  ]
  
  @origins = [
    Line.new(@origin , Point.new(@edges[0].run, @edges[0].rise)),
    Line.new(@origin , Point.new(@edges[1].run, @edges[1].rise)),
    Line.new(@origin , Point.new(@edges[2].run, @edges[2].rise)),
  ]

  yes = 0
  no = 0
  0.upto(2) do |x|
    0.upto(2) do |y|   
      s = System.new(@edges[x], @origins[y])
      sol = s.solve
      if sol and @edges[x].in_segment(sol)
        yes = yes + 1
      else
        no = no +1
      end      
    end
  end
  print "#{yes}, #{no}: "
  pp triangle
  if yes == 0
    #pp triangle
  end



end
