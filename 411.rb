require 'pp'


class Node
  attr_accessor :x, :y, :dest, :max, :incoming
  def initialize(x,y)
    @x = x
    @y = y
    @dest = Array.new
    @incoming = Array.new
    @max = 0
  end
  
  def <=>(other)
    if self.x == other.x
      return self.y <=> other.y
    else
      return self.x <=> other.x
    end    
  end
    
end



def S(n)
  @stations = Hash.new
  @target = Node.new(n,n)
  @start = Node.new(0,0)
  @stations["0:0"] = @start
  @stations["#{n}:#{n}"] = @target
  0.upto(2*n) do |i|
    v1 = (2**i % n)
    v2 = (3**i % n)
    @stations["#{v1}:#{v2}"] ||= Node.new(v1,v2)
  end  
  @stations = @stations.values
  @stations.sort!
  @stations.each do |from|
    @stations.each do |to|
      if from.x <= to.x and from.y <= to.y and from != to
        from.dest << to
        to.incoming << from
      end
    end
  end
  
  @stations.each do |i|
    max = 0
    i.incoming.each do |j|
      if j.max > max
        max = j.max
      end
    end
    i.max = max + 1        
  end
  return @target.max - 2
end

pp S(10000)
