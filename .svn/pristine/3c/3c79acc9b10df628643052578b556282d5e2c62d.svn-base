require 'pp'
require 'csv'

WIDTH  = 80
HEIGHT = 80
START = WIDTH+3
GOAL  = (WIDTH+2)*(HEIGHT+2)-WIDTH-4

@f_score = Hash.new
@g_score = Hash.new
@closedset = Hash.new(false)
@openset   = Array.new
@came_from = Hash.new(nil)

def h(s)
  return 0 if s == GOAL
  guess = 0
  while !@matrix[s+1].nil?
    guess += @matrix[s+1]
    s += 1
  end
  while !@matrix[s+WIDTH+2].nil?
    guess += @matrix[s+WIDTH+2]
    s += WIDTH+2
  end
  return guess
end

def choose_current
  best = 999999999
  @openset.each do |os|
    if os < best
      best = os
    end
  end
  return best
end


def neighbor_nodes(s)
  nodes = Array.new
  nodes << (s+1) unless @matrix[s+1].nil?
  nodes << (s+WIDTH+2) unless @matrix[s+WIDTH+2].nil?
  return nodes  
end

def reconstruct_path(came_from, current_node)
  puts @matrix[current_node]
  p = 0
  if came_from[current_node]
    p = reconstruct_path(came_from, came_from[current_node])
    return(p+@matrix[current_node])
  else
    return @matrix[current_node]
  end
end


def a_star(start, goal)
  @g_score[start] = @matrix[start]  
  @f_score[start] = @g_score[start] + h(start)
  @openset.push(start)
  while !@openset.empty?
    current = choose_current
    if (current == goal)
      return reconstruct_path(@came_from, current)
    end
    @openset.delete(current)
    @closedset[current] = true
    @neighbors = neighbor_nodes(current)
    @neighbors.each do |neighbor|
      next if @closedset[neighbor]
      tentative_g = @g_score[current] + @matrix[neighbor]
      if !@openset.include?(neighbor) or tentative_g < @g_score[neighbor]
        @openset.push(neighbor)
        @came_from[neighbor] = current
        @g_score[neighbor] = tentative_g
        @f_score[neighbor] = @g_score[neighbor] + h(neighbor)
      end
    end    
  end
  return false
end



@matrix = Array.new
@matrix << Array.new(WIDTH+2, nil)
CSV.foreach("./81-matrix.txt") do |row|
 r = row.map {|x| x.to_i }
 r.unshift(nil)
 r.push(nil)
 @matrix << r
end
@matrix << Array.new(WIDTH+2, nil)
@matrix.flatten!
pp a_star(START, GOAL)
