require 'pp'

BOX_MAP = [  0,0,0,1,1,1,2,2,2,
             0,0,0,1,1,1,2,2,2,
             0,0,0,1,1,1,2,2,2,
             3,3,3,4,4,4,5,5,5,
             3,3,3,4,4,4,5,5,5,
             3,3,3,4,4,4,5,5,5,
             6,6,6,7,7,7,8,8,8,
             6,6,6,7,7,7,8,8,8,
             6,6,6,7,7,7,8,8,8
           ];

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
    @matrix = Array.new(@rows+1)
    @matrix[0] = Array.new(@constraints)
    @entry = ColumnHeader.new('ENTRY');

    0.upto(@constraints-1) do |i|
      @matrix[0][i] = ColumnHeader.new("Col #{i}")
    end

    1.upto(@rows) do |y|
      @matrix[y] = Array.new(@constraints)
      0.upto(@constraints-1) do |x|
        @matrix[y][x] = Node.new("row: #{y} col: #{x}")
      end
    end
  end
  
  def link_nodes
    0.upto(@rows) do |y|
      0.upto(@constraints-1) do |x|
        @matrix[y][x].col_node = @matrix[0][x]
        @matrix[y][x].down  = @matrix[(y+1) % (@rows + 1)][x]
        @matrix[y][x].up    = @matrix[(y-1) % (@rows + 1)][x]
        @matrix[y][x].left  = @matrix[y][(x-1) % @constraints]
        @matrix[y][x].right = @matrix[y][(x+1) % @constraints]
        @matrix[y][x].col_node.count += 1
      end
    end                  
    @entry.right = @matrix[0][0]
    @entry.left = @matrix[0].last
    @matrix[0][0].left = @entry
    @matrix[0].last.right = @entry
  end
  

  def initialize(constraints, rows)
    @constraints = constraints
    @rows = rows
    create_nodes
    link_nodes
  end
end



m = MatrixX.new(7, 6)

=begin


class SudokuSolver
  
  def col(n)
    n % 9
  end
  
  def row(n)
    (n - col(n)) / 9
  end
  
  def box(n)
    BOX_MAP[n]
  end
  
  
  
  
  def initialize(puzzle)
    @puzzle = puzzle
    @matrix = MatrixX.new(324, 729)
    @solutions = []

    0.upto(80) do |i|
      puts puzzle[i]
    end
    
  end

end

def load_puzzles
  f = File.open("sudoku.txt")
  puzzles = []
  0.upto(49) do |puzzle|
    name = f.gets.strip
    puz = ""
    0.upto(8) do |i|
      puz << f.gets.strip
    end  
    puzzles <<  puz.split("").map(&:to_i)
    break
  end
  return puzzles
end

@puzzles = load_puzzles
s = SudokuSolver.new(@puzzles[0])


exit


=end