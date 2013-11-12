=begin

131,673,234,103,18
201,96,342,965,150
630,803,746,422,111
537,699,497,121,956
805,732,524,37,331

=end

require 'csv'
require 'pp'

class Node
  attr_reader :value, :row, :col
  attr_accessor :neighbors, :up, :down, :left, :right
    
  def ==(other)
    self.row == other.row and self.col == other.col
  end

  alias eql? == 

  def hash
    @row * 10000 + @col
  end

  def to_s
    "(#{@row},#{@col})"
  end
  
    
  def initialize(value, row, col)
    @value = value
    @neighbors = Array.new
    @row   = row
    @col   = col
    @up    = nil
    @down  = nil
    @left  = nil
    @right = nil
  end
  
end

@matrix = Array.new
row_num = 0
CSV.foreach("./81-matrix.txt") do |row|
 col_num = 0
 row_a = Array.new

 row.each do |x|
   row_a.push Node.new(x.to_i, row_num, col_num)
   col_num += 1
 end
 
 @matrix << row_a
 row_num += 1
end

0.upto(@matrix.length-1) do |row|
  0.upto(@matrix[0].length-1) do |col|
      @matrix[row][col].neighbors.push   @matrix[row+1][col] unless row == @matrix.length-1
      @matrix[row][col].down =           @matrix[row+1][col] unless row == @matrix.length-1    
      @matrix[row][col].neighbors.push   @matrix[row-1][col] unless row == 0
      @matrix[row][col].up =             @matrix[row-1][col] unless row == 0
      @matrix[row][col].neighbors.push   @matrix[row][col+1] unless col == @matrix[0].length - 1
      @matrix[row][col].right =          @matrix[row][col+1] unless col == @matrix[0].length - 1
      @matrix[row][col].neighbors.push  @matrix[row][col-1] unless col == 0
      @matrix[row][col].left =           @matrix[row][col-1]   unless col == 0
  end  
end


def h(node, goal)
  return 0 if node == goal
  sum = 0
  while !node.right.nil?
    sum += 1
    node = node.right
  end
  while node.row < goal.row
    sum += 1
    node = node.down
  end
  while node.row > goal.row
    sum += 1
    node = node.up
  end
  return sum 
end


def a_star(start,goal)
  closedset = Array.new
  openset   = [ start ]
  came_from = Hash.new
  g_scores  = Hash.new
  f_scores  = Hash.new  
  g_scores[start] = 0
  f_scores[start] = g_scores[start] + h(start, goal)
  until openset.empty?
    current = openset.first    
    openset.each do |os|
      if f_scores[os] < f_scores[current]
        current = os
      end
    end
    return came_from if current == goal

    puts "Expanding #{current}"
    # Current is now the item from open set with the lowest f_score..
    openset.delete current    
    closedset.push current
    current.neighbors.each do |neighbor|
      t_g_score = g_scores[current] + neighbor.value
      t_f_score = t_g_score + h(neighbor, goal)
      if closedset.include? neighbor and t_f_score >= f_scores[neighbor]
        next 
      end
      if !openset.include? neighbor or t_f_score < f_scores[neighbor]
        came_from[neighbor] = current
        g_scores[neighbor] = t_g_score
        f_scores[neighbor] = t_f_score
        if !openset.include? neighbor
          openset.push neighbor
        end      
      end
    end
  end
  came_from
end

def reconstruct_path(came_from, current)
  if came_from.keys.include? current
    p = reconstruct_path(came_from, came_from[current])
    return [ p, current.value].flatten
  else
    return [ current.value ]
  end
end

puts "Starting A*"


cf = a_star(@matrix[0][0], @matrix[79][79])

pp reconstruct_path(cf ,  @matrix[79][79] )
pp reconstruct_path(cf ,  @matrix[79][79] ).inject(&:+)



