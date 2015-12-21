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
require 'matrix.rb'

class Node
  attr_accessor :adjacent, :pebbles, :nodeid
 
  def initialize
    @nodeid = nil
    @pebbles = 2
    @adjacent = Array.new
  end
end


class Framework
  attr_accessor :nodes, :matrix

  def initialize(boxr, boxc)
    @boxr = boxr
    @boxc = boxc
    setup_nodes
  end
  

  
  def setup_nodes
    @nodes = Array.new
    @matrix = Hash.new
    0.upto(@boxr) do |r|
      @nodes[r] = Array.new
      0.upto(@boxc) do |c|
        @nodes[r][c] = Node.new
        @nodes[r][c].nodeid = "#{r}:#{c}"
        @matrix[@nodes[r][c].nodeid] = Array.new
      end
    end
  end    

  def insert_edge(r1,c1,r2,c2)
    @nodes[r1][c1].adjacent.push @nodes[r2][c2]
    @nodes[r2][c2].adjacent.push @nodes[r1][c1]
    
    @matrix.each do |key, row|
      if key == "#{r1}:#{c1}" || key == "#{r2}:#{c2}"
        row.push r1 - r2
        row.push c1 - c2
      else
        row.push 0
        row.push 0
      end
      
    end
    
  end

  def insert_edges
    # ROW EDGES
    0.upto(@boxr) do |r|
      0.upto(@boxc - 1) do |c|
        insert_edge(r,c,r,c+1)
      end       
    end
    # COL EDGES
    0.upto(@boxc) do |c|
      0.upto(@boxr - 1) do |r|
        insert_edge(r,c,r+1,c)
      end
    end       
  end
end

=begin
0,0   0,1  0,2   0,3

1,0   1,1  1,2   1,3

2,0   2,1  2,2   2,3
=end

boxr = 2
boxc = 3

to_add = (2 * (boxr+1)*(boxc+1) - 3) -  ((boxr+1)*boxc + (boxc+1)*boxr)


f = Framework.new(boxr, boxc)
f.insert_edges

#pp f.matrix


f.matrix.each do |k,r|
  puts r.join(" ")
end

m = Matrix.rows(f.matrix.values)
pp m.rank



def gauss_jordan(m)
  pp m.rows
end






