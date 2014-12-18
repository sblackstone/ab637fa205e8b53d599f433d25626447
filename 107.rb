=begin
A	-	16	12	21	-	-	-
B	16	-	-	17	20	-	-
C	12	-	-	28	-	31	-
D	21	17	28	-	18	19	23
E	-	20	-	18	-	-	11
F	-	-	31	19	-	-	27
G	-	-	-	23	11	27	-

=end


require 'csv'
require 'pp'


class NetworkMatrix
  attr_accessor :matrix
  def vertex_count
    return @matrix.first.length
  end
  
  def cost
    cost = 0
    0.upto(@matrix.length - 1) do |i|
      i.upto(@matrix.length - 1) do |j|
        cost += @matrix[i][j] unless @matrix[i][j].nil?
      end
      
    end
    cost
    
  end
  
  
  def initialize(fn)
    @matrix = Array.new
    CSV.foreach(fn) do |r|
      @matrix.push r.map {|x| x == "-" ? nil : x.to_i } unless r.empty?
    end
  end
      
end

n = NetworkMatrix.new('./p107_network.txt')



@verts = Array.new(n.vertex_count, false)

@verts[0] = true
min_sum = 0
while @verts.any? {|x| !x }
  min = 9999
  min_u = nil
  min_v = nil
  0.upto(@verts.length - 1) do |u_vert|
    next unless @verts[u_vert]
    0.upto(@verts.length - 1) do |v_vert|
      val = n.matrix[u_vert][v_vert]      
      if !val.nil? && val < min and !@verts[v_vert]
        min = val
        min_u = u_vert
        min_v = v_vert
      end      
    end    
  end
  @verts[min_v] = true
  min_sum += min  
end

pp n.cost
pp min_sum
pp n.cost - min_sum

pp @verts
@edges = Array.new

