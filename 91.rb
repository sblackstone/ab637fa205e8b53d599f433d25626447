MAX = 50
count = 0


sum = 0

def check(x1,y1,x2,y2)
  d1 = (x1**2 + y1**2)
  d2 = (x2**2 + y2**2)
  d3 = (x2-x1)**2 + (y2-y1)**2
  if (d1+d2==d3 || d3+d2==d1 || d1+d3==d2)
    puts "(#{x1},#{y1}) (#{x2},#{y2})"
    return 1 
  end
  return 0
end

0.upto(MAX) do |x1|
  0.upto(MAX) do |y1|
    0.upto(MAX) do |x2|
      0.upto(MAX) do |y2|
        next if x1 + y1 == 0 || x2+y2 == 0 || (x1==x2 && y1==y2)
        sum += check(x1,y1,x2,y2)        
      end
    end  
  end
end

puts "Answer = #{sum/2}"


