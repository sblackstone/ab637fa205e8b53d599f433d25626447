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
  
  def pebble_count
    @nodes.flatten.inject(0) {|a,c| a = a + c.pebbles}
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
          print "@ "
        elsif r < @boxr and @nodes[r+1][c].adjacent.include? @nodes[r][c]
          print "^ "
        else
          print "  "
        end
        if (r < @boxr and c < @boxc) and (@nodes[r][c].adjacent.include? @nodes[r+1][c+1] or @nodes[r+1][c+1].adjacent.include? @nodes[r][c])
          print '\ '        
        elsif 
          print "  "
        end
                
      end
      puts
    end
    puts "#{pebble_count} total pebbles"
    puts
  end
  
  
  def find_pebble(node, seen)
    node.adjacent.each do |adj|
      n = rfind_pebble(adj, seen)
      if n
        #puts "Moving from #{n.nodeid} to #{node.nodeid}"

        node.adjacent.reject! {|x| x.nodeid == n.nodeid }
        n.adjacent.push(node)
        n.pebbles -= 1
        node.pebbles += 1
        return node
      end
    end
    return false
  end
  

  def rfind_pebble(node, seen)
    if node.pebbles > 0
      return node
    end
    
    node.adjacent.each do |adj|
      if seen[adj.nodeid].nil?
        seen[adj.nodeid] = true      
        n = rfind_pebble(adj, seen)
        if n
          #puts "Moving from #{n.nodeid} to #{node.nodeid}"
          node.adjacent.reject! {|x| x.nodeid == n.nodeid }
          n.adjacent.push(node)
          n.pebbles -= 1
          node.pebbles += 1
          return node
        end
      end
    end
    return false
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


  def delete_edge(r1,c1,r2,c2)
    nodea = @nodes[r1][c1]
    nodeb = @nodes[r2][c2]
    pp nodea.adjacent.map {|x| x.nodeid }
    pp nodeb.adjacent.map {|x| x.nodeid }

    delete_edge_node(nodea, nodeb)
    delete_edge_node(nodeb, nodea)
  end

  def delete_edge_node(primary, other)
    puts "Primary = #{primary.nodeid}"
    count = primary.adjacent.select {|x| x.nodeid == other.nodeid}.size
    puts "Putting back #{count}"
    primary.pebbles += count
    primary.adjacent.reject! { |x| x.nodeid == other.nodeid }     
  end
  

  def insert_edge(r1,c1,r2,c2)

    if @nodes[r1][c1].pebbles > 0
      @nodes[r1][c1].adjacent.push @nodes[r2][c2]
      @nodes[r1][c1].pebbles -= 1
      puts "Added from A1"
      #puts "Added #{r1},#{c1} #{r2},#{c2}"
      return true
    elsif @nodes[r2][c2].pebbles > 0
      puts "Added from B1"
      @nodes[r2][c2].adjacent.push @nodes[r1][c1]
      @nodes[r2][c2].pebbles -= 1
      #puts "Added #{r1},#{c1} #{r2},#{c2}"
      return true

    elsif find_pebble(@nodes[r1][c1], Hash.new)  
      puts "Added from A2"
      puts @nodes[r1][c1].adjacent.map {|x| x.nodeid}.join(",")
      puts "Stuff = #{@nodes[r2][c2].nodeid}"
      @nodes[r1][c1].adjacent << (@nodes[r2][c2])
      @nodes[r1][c1].pebbles -= 1
      puts @nodes[r1][c1].adjacent.map {|x| x.nodeid}.join(",")

      #puts "Added #{r1},#{c1} #{r2},#{c2}"
      return true

    elsif find_pebble(@nodes[r2][c2], Hash.new)  
      puts "Added from B2"

      @nodes[r2][c2].adjacent.push @nodes[r1][c1]
      @nodes[r2][c2].pebbles -= 1
      return true
    else
      #puts "No pebbles for #{r1},#{c1} #{r2},#{c2}"
      return false
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

boxr = 5
boxc = 5

to_add = (2 * (boxr+1)*(boxc+1) - 3) -  ((boxr+1)*boxc + (boxc+1)*boxr)


f = Framework.new(boxr, boxc)
f.insert_edge(0,0,1,1)
pp f.nodes[0][0].adjacent.map {|x| x.nodeid }
pp f.nodes[1][1].adjacent.map {|x| x.nodeid }

f.insert_edge(0,0,1,1)
pp f.nodes[0][0].adjacent.map {|x| x.nodeid }
pp f.nodes[1][1].adjacent.map {|x| x.nodeid }

f.insert_edge(0,0,1,1)
pp f.nodes[0][0].adjacent.map {|x| x.nodeid }
pp f.nodes[1][1].adjacent.map {|x| x.nodeid }

f.insert_edge(0,0,1,1)
pp f.nodes[0][0].adjacent.map {|x| x.nodeid }
pp f.nodes[1][1].adjacent.map {|x| x.nodeid }


f.delete_edge(0,0,1,1)



f.print_pebbles

exit
f.insert_edges
f.print_pebbles
puts
puts "We need to add #{to_add} lines"
puts


puts f.insert_edge(0,0,1,1)
puts f.insert_edge(0,0,1,1)
puts f.insert_edge(0,0,1,1)
puts f.insert_edge(0,0,1,1)


f.print_pebbles

f.delete_edge(0,0,1,1)
f.print_pebbles









