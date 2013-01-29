require 'pp'
require 'csv'

WIDTH  = 80
HEIGHT = 80
START = WIDTH+3
GOAL  = START+WIDTH-1

@f_score = Hash.new
@g_score = Hash.new
@closedset = Hash.new(false)
@openset   = Hash.new(false)
@came_from = Hash.new(nil)

@h_cache = Hash.new(nil)

def h(s,goal)
  @h_cache[s*10000+goal] ||= calc_h3(s,goal)
end

def calc_h3(s,goal)
  return 0 if s == goal
  unless @matrix[s-WIDTH-1].nil?
    lowest = choose_best([ s+1, s-WIDTH-2])
    return @matrix[lowest] + @matrix[s-WIDTH-2] + h(s-WIDTH-1, goal) 
  end
  return @matrix[s-WIDTH-2] + h(s-WIDTH-2, goal) unless @matrix[s-WIDTH-2].nil?
  return @matrix[s+1] + h(s+1, goal)
end

def choose_best(set)
  best = set.first
  set.each do |os|
    if @matrix[os] < @matrix[best]
      best = os
    end
  end
  return best
end

def choose_current
  choose_best(@openset.keys)
end


def neighbor_nodes(s)
  nodes = Array.new
  nodes << (s+1) unless @matrix[s+1].nil?
  nodes << (s+WIDTH+2) unless @matrix[s+WIDTH+2].nil?
  nodes << (s-WIDTH-2) unless @matrix[s-WIDTH-2].nil?
  return nodes  
end

def reconstruct_path(came_from, current_node)
  #puts @matrix[current_node]
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
  @f_score[start] = @g_score[start] + h(start,goal)
  @openset[start] = true
  while !@d.empty?
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
      if !@openset[neighbor] or tentative_g < @g_score[neighbor]
        @openset[neighbor] = true
        @came_from[neighbor] = current
        @g_score[neighbor] = tentative_g
        @f_score[neighbor] = @g_score[neighbor] + h(neighbor,goal)
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

@best = 9999999999
@start = START

while !@matrix[@start].nil?
  @f_score = Hash.new
  @g_score = Hash.new
  @closedset = Hash.new(false)
  @openset   = Hash.new(false)
  @came_from = Hash.new(nil)
  puts "start = #{@start} #{@matrix[@start]}"
  pp a_star(@start, GOAL)
  @start += WIDTH+2
  puts "---"
end


