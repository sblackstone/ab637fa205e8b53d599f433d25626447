=begin
Efficient exponentiation
Problem 122
The most naive way of computing n15 requires fourteen multiplications:

n × n × ... × n = n15

But using a "binary" method you can compute it in six multiplications:

n × n = n2
n2 × n2 = n4
n4 × n4 = n8
n8 × n4 = n12
n12 × n2 = n14
n14 × n = n15

However it is yet possible to compute it in only five multiplications:

n × n = n2
n2 × n = n3
n3 × n3 = n6
n6 × n6 = n12
n12 × n3 = n15

We shall define m(k) to be the minimum number of multiplications to compute nk; for example m(15) = 5.

For 1 ≤ k ≤ 200, find ∑ m(k).


Best way to 1:

n


Best way to 2:

n*n

Best way to 3: 

(n*n) * n

Best way to 4:

(n*n), n**2 * n**2


Best way to 5: 

  



=end

require 'pp'

=begin
@best = Array.new(201,nil)
@best[0] = 0
@best[1] = 1

@have = { 1 => true }

@loop = 0

while @best.any? {|x| x.nil? }
  @loop += 1
  @have_save = @have.clone
  @have_save.keys.each do |x|
    @have_save.keys.each do |y| 
      @have[x+y] = true
      puts "#{@loop} #{x} #{y}" if x+y == 15
    end    
  end
  @have.keys.each do |i|
    @best[i] ||= @loop
  end
end



pp @best.inject(:+)
=end

=begin
def best(target, cur = nil, depth = 0)
  return if depth > target
  cur.keys.each do |x|
    cur.keys.each do |y|
      if cur[target]
         puts "Found at depth #{depth}"
        return
      end
      
      if cur[x+y].nil? and x+y <= target
        cur[x+y] = true
        best(target, cur, depth + 1)
        cur[x+y] = nil
      end  
    end
  end
end

pp best(4, {1 => true} )
=end


require 'pp'


class Node
  attr_accessor :seen
  def initialize
    @seen = Hash.new
    @seen[1] = true
  end

  def at_goal?(goal)
    @seen.keys.include? goal
  end
  

  def hash
    @seen.hash
  end
  

  def hscore(goal)
     @seen.length + 1
  end
  
  def ancestors
    answer = []
    @seen.keys.each do |x|
      @seen.keys.each do |y|
        next unless x <= y
        if @seen[x+y].nil?
          t =  Marshal.load( Marshal.dump(self) ) 
          t.seen[x+y] = true
          answer.push t
        end        
      end
    end
    answer
    
  end
  
  
end



def a_star(start,goal)
  closedset = []
  openset   = [start]

  gscore = Hash.new
  gscore[start] = 0

  hscore = Hash.new
  hscore[start] = start.hscore(goal)

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
     if x.at_goal? goal
       return reconstruct(came_from, x)
     end
     openset = openset - [ x ]
     closedset << x
     for y in x.ancestors
       next if closedset.include?(y)
       tentative_g_score = gscore[x] + y.hscore(goal)
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
         hscore[y] = y.hscore(goal)
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

n = Node.new

pp a_star n, 4

