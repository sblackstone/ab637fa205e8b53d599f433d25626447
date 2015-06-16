require 'pp' 

def point(x,y,r)
  r = r.to_f
  a = (2*r*x) / (x**2 + y**2 + 1)
  b = (2*r*y) / (x**2 + y**2 + 1)
  c = 2*r / (x**2 + y**2 + 1) - r
  return a,b,c
end

=begin
-45.upto(45) do |x|
  -45.upto(45) do |y|
    -45.upto(45) do |z|
      if x**2 + y**2 + z**2 == 45**2
        puts "#{x},#{y},#{z}"
      end
      
    end
  end
end

=end


sum = 0

-45.upto(45) do |x|
  -45.upto(45) do |y|
    p = point(x,y,45)
    if p[0] == p[0].round and p[1] == p[1].round and p[2] == p[2].round
      print "(#{x},#{y}): "
      pp point(x,y,45)
      sum += p.map {|x| x.abs}.inject(&:+)
    end
  end
end
puts
puts
puts sum

