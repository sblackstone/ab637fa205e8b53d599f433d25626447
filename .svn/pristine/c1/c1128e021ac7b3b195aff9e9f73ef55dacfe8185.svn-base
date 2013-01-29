require 'pp'




INITIAL_POINT = {x: 0, y:0}
  GOAL_POINT    = {x:20, y:20}

@values = Hash.new(0)

def point(x,y)
  {x:x,y:y}
end


def children_of_point(p)
  points = []
  points << { x: p[:x]+1, y: p[:y]   }   unless p[:x] == GOAL_POINT[:x]
  points << { x: p[:x],   y: p[:y]+1 }   unless p[:y] == GOAL_POINT[:y]
  return points  
end

@values[GOAL_POINT] = 0

0.upto(GOAL_POINT[:y]-1) do |y|
  @values[point(GOAL_POINT[:x],y)] = 1
end

0.upto(GOAL_POINT[:x]-1) do |x|
  @values[point(x,GOAL_POINT[:y])] = 1
end

(GOAL_POINT[:x]-1).downto(0) do |x|
  (GOAL_POINT[:y]-1).downto(0) do |y|
    children_of_point(point(x,y)).each do |z|
      @values[point(x,y)] = @values[point(x,y)] + @values[z]
    end
  end
end


pp @values
  
  
