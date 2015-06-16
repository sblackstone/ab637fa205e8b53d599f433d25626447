=begin

00----01----02----03
|  A  |   B  |  C  |
04----05----06----07
|  D  |   E  |  F  |
08----09----10----11


0,0   0,1  0,2   0,3

1,0   1,1  1,2   1,3

2,0   2,1  2,2   2,3




boxr boxc         nodes         
2     3     (boxr+1)*(boxc+1) 


Edges

Each row has boxc edges 
Each col has boxr edges


(boxr+1)*boxc + (boxc+1)*boxr



Edges needed to add = 

(2 * (boxr+1)*(boxc+1) - 3) -  ((boxr+1)*boxc + (boxc+1)*boxr)



(2*3*4 - 3) - (3*3 + 2*4)


24 - 3 = 21 - (9+8) = 4!! =)



=end
require 'pp'


class Node
  attr_accessor :adjacent, :pebbles, :nodeid
 
  def initialize
    @nodeid = nil
    @pebbles = 2
    @adjacent = Array.new
  end
end


class Framework
  attr_accessor :nodes
  def initialize(boxr, boxc)
    @boxr = boxr
    @boxc = boxc
    setup_nodes
  end
  
  def print_pebbles
    0.upto(@boxr) do |r|
      0.upto(@boxc) do |c|
        print "#{@nodes[r][c].pebbles}"
        if c < @boxc and @nodes[r][c].adjacent.include? @nodes[r][c+1]
          print " > "
        elsif c < @boxc and @nodes[r][c+1].adjacent.include? @nodes[r][c]
          print " < "
        else
          print "   "
        end        
      end
      puts
      0.upto(@boxc) do |c|         
        if r < @boxr    and @nodes[r][c].adjacent.include?   @nodes[r+1][c]
          print "@   "
        elsif r < @boxr and @nodes[r+1][c].adjacent.include? @nodes[r][c]
          print "^   "
        else
          print "    "
        end        
      end
      puts
    end
  end
    
  def setup_nodes
    @nodes = Array.new
    0.upto(@boxr) do |r|
      @nodes[r] = Array.new
      0.upto(@boxc) do |c|
        @nodes[r][c] = Node.new
        @nodes[r][c].nodeid = "#{r}:#{c}"
      end
    end
  end    




  def enlarge_cover(nodea, nodeb)
    seen = Hash.new
    path = Hash.new

    @nodes.flatten.each do |n|
      seen[n.nodeid] = false
      path[n.nodeid] = -1
    end
    if nodea.pebbles > 0
      nodea.pebbles -= 1
      nodea.adjacent.push nodeb
      return true
    end
    if nodeb.pebbles > 0
      nodeb.pebbles -= 1
      nodeb.adjacent.push nodea
      return true
    end
    
    found = find_pebble(nodea, seen, path)
    if found
      rearrange_pebbles(nodea, seen)
      return true
    end
    if !seen[nodeb]
      found = find_pebble(nodeb, seen, path)
      if found
        rearrange_pebbles(nodeb,path)
        return true
      end
    end
    return false    
  end
  

  def find_pebble(v, seen, path)
    seen[v.nodeid] = true
    path[v.nodeid] = -1
    if v.pebbles > 0
      return true
    end
    v.adjacent.each do |adj|
      if !seen[adj.nodeid]
        path[v.nodeid] = adj
        found = find_pebble(adj, seen, path)
        return true if found
      end      
    end
    return false
  end


  def rearrange_pebbles(v, path)
    while path[v.nodeid] != -1
      w = path[v.nodeid]
      pp w
      if path[w.nodeid].nodeid == -1
        w.pebbles -= 1
        w.adjacent.push v
      else
        puts "stuff"      
      end
      v = w
    end      
  end
  

  def insert_edge(r1,c1,r2,c2)
    enlarge_cover(@nodes[r1][c1], @nodes[r2][c2])
  end

  def insert_edges
    # ROW EDGES
    0.upto(@boxr) do |r|
      0.upto(@boxc - 1) do |c|
        insert_edge(r,c,r,c+1)
      end       
    end
    puts
    # COL EDGES
    0.upto(@boxc) do |c|
      0.upto(@boxr - 1) do |r|
        insert_edge(r,c,r+1,c)
      end
    end       
  end
end


boxr = 2
boxc = 3

# edges to add = (2 * (boxr+1)*(boxc+1) - 3) -  ((boxr+1)*boxc + (boxc+1)*boxr)

f = Framework.new(boxr, boxc)
#f.insert_edge(1,1,2,1)
f.insert_edges
f.insert_edge(0,0,1,1)
f.print_pebbles




