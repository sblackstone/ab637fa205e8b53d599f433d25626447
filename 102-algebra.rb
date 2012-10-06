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
  puts yes
  puts no
  puts "---"
  if yes == 0
    pp triangle
  end



end
