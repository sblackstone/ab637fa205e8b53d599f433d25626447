require 'pp'

class Node
  attr_accessor :up, :down, :left, :right, :desc, :value, :col_node
  def initialize(desc)
    @desc = desc
    @up = nil
    @down = nil
    @left = nil
    @right = nil
    @value = nil
    @col_node = nil
  end

  def cover
    self.col_node.left.right = self.col_node.right
    self.col_node.right.left = self.col_node.left
    row = self.col_node.down
    while row != self.col_node
      col = row.right
      while col != row
        col.col_node.count -= 1
        col.up.down = col.down
        col.down.up = col.up
        col = col.right
      end      
      row = row.down
    end
  end
  
  def uncover
    row = self.col_node.up
    while row != self.col_node
      col = row.left
      while col != row
        col.col_node.count += 1
        col.up.down = col
        col.down.up = col
        col = col.left
      end      
      row = row.up
    end
    self.col_node.left.right = self.col_node
    self.col_node.right.left = self.col_node
  end

  def to_s
    desc
  end
  
end

class ColumnHeader < Node
  attr_accessor :count
  def initialize(desc)
    @count = -1
    super(desc)
  end
  
end


class MatrixX
  attr_accessor :matrix, :entry

  def create_nodes
    @matrix = Array.new(@height+1)
    @matrix[0] = Array.new(@width)
    @entry = ColumnHeader.new('ENTRY');

    0.upto(@width-1) do |i|
      @matrix[0][i] = ColumnHeader.new("Col #{i}")
    end

    1.upto(@height) do |y|
      @matrix[y] = Array.new(@width)
      0.upto(@width-1) do |x|
        @matrix[y][x] = Node.new("row: #{y} col: #{x}")
      end
    end
  end
  
  def link_nodes
    0.upto(@height) do |y|
      0.upto(@width-1) do |x|
        @matrix[y][x].col_node = @matrix[0][x]
        @matrix[y][x].down  = @matrix[(y+1) % (@height + 1)][x]
        @matrix[y][x].up    = @matrix[(y-1) % (@height + 1)][x]
        @matrix[y][x].left  = @matrix[y][(x-1) % @width]
        @matrix[y][x].right = @matrix[y][(x+1) % @width]
        @matrix[y][x].col_node.count += 1
      end
    end                  
    @entry.right = @matrix[0][0]
    @entry.left = @matrix[0].last
    @matrix[0][0].left = @entry
    @matrix[0].last.right = @entry
  end
  

  def initialize(width, height)
    @width = width
    @height = height
    create_nodes
    link_nodes
  end


end


m = MatrixX.new(9,9)



f = m.entry.right
puts f.count

f.cover
f = m.entry.right.right
c = f
while c
  puts c
  c = c.down
  break if c == f
end

