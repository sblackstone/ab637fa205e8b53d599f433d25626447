require 'pp'

values = [
  75,
  95, 64,
  17, 47, 82,
  18, 35, 87, 10,
  20,4, 82, 47, 65,
  19,1, 23, 75,3, 34,
  88,2, 77, 73,7, 63, 67,
  99, 65,4, 28,6, 16, 70, 92,
  41, 41, 26, 56, 83, 40, 80, 70, 33,
  41, 48, 72, 33, 47, 32, 37, 16, 94, 29,
  53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14,
  70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57,
  91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48,
  63, 66,4, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31,
 4, 62, 98, 27, 23,9, 70, 98, 73, 93, 38, 53, 60,4, 23
]

values = []
File.open("triangle.txt","r") do |f|
  while (t = f.gets)
    values << t.split(" ").map(&:to_i)
  end
end
values.flatten!

class Node
  attr_accessor :left
  attr_accessor :right
  attr_accessor :value
  attr_accessor :id
  attr_accessor :row
  attr_accessor :distance_from_bottom
  attr_accessor :hscore_val
  def hscore_gen(i)
    return self.value + distance_from_bottom if i == 0
    lhs = left.hscore(i-1) rescue 0
    rhs = right.hscore(i-1) rescue 0
   self.value + [lhs,rhs,0].max
  end
  def hscore(i = 25)
    self.hscore_val ||= hscore_gen(i)
  end
      

  
  def print_node
    left.print_node unless left.nil?
    right.print_node unless right.nil?
    print self.value
  end

  def ancestors
    [self.left,self.right].compact
  end

  def initialize(val,id)
    self.left = nil 
    self.right = nil
    self.value = val
    self.id = id
  end

end

class Triangle
  attr_accessor :root
  attr_accessor :height
  attr_accessor :nodes
  attr_accessor :goal
  def build_nodes(arr)
    self.goal = Node.new(0,99999999)
    self.goal.distance_from_bottom = 0
    self.nodes = []
    i = 0
    arr.each do |v|
      self.nodes << Node.new(v,i)
      i = i + 1
    end
    nodes.each do |n|
      id = n.id
      r  = row_of(id)
      n.row = r
      n.distance_from_bottom = self.height - r
      if r < self.height
        n.left = nodes[id+r] rescue nil
        n.right = nodes[id+r+1] rescue nil
      else
        n.left  = self.goal
        n.right = self.goal
      end
    end
    self.nodes << self.goal
  end
  
  def root
    nodes[0]
  end
  
  def row_of(n)
    0.upto(1000) do |i|
      return(i) if (i * (i+1) * 0.5) >= n+1
    end
  end

  def initialize(arr)
    self.height = row_of(arr.size) - 1
    build_nodes(arr)
    puts "Built triangle of height #{self.height}"
  end
    
end


@t = Triangle.new(values)


def a_star(start,goal)
  closedset = []
  openset   = [start]

  gscore = Hash.new
  gscore[start] = 0

  hscore = Hash.new
  hscore[start] = start.hscore

  fscore = Hash.new
  fscore[start] = hscore[start]

  came_from = Hash.new

  while openset.size > 0
     x = nil
     maxf = -9999
     openset.each do |i|
       if fscore[i] > maxf
         maxf = fscore[i]
         x = i
       end 
     end
     if x == goal
       return reconstruct(came_from, x)
     end
     openset = openset - [ x ]
     closedset << x
     for y in x.ancestors
       next if closedset.include?(y)
       tentative_g_score = gscore[x] + y.hscore
       tentative_is_better = false
       if !openset.include?(y)
         openset << y
         tentative_is_better = true
       elsif tentative_g_score > gscore[y]
         tentative_is_better = true
       end
       if tentative_is_better == true
         came_from[y] = x
         gscore[y] = tentative_g_score
         hscore[y] = y.hscore
         fscore[y] = gscore[y] + hscore[y]
       end
     end
  end
  return false
end

def reconstruct(came_from, current_node)
  if came_from[current_node]
    return [reconstruct(came_from,came_from[current_node]), current_node]
  else
    return current_node
  end
end

=begin
ans = []
@t.nodes.each do |i|
  next unless i.row == @t.height
  p = a_star(@t.root, i).flatten
  pp p.map(&:value)
  pp p.map(&:value).inject(:+)
  ans << p.map(&:value).inject(:+)
end
pp ans
pp ans.max
=end
p = a_star(@t.root, @t.goal).flatten.map(&:value)
pp p
pp p.inject(:+)