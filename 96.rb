require 'pp' 

f = File.open("sudoku.txt")



BOX_MAP = [
             [0,0,0,1,1,1,2,2,2],
             [0,0,0,1,1,1,2,2,2],
             [0,0,0,1,1,1,2,2,2],
             [3,3,3,4,4,4,5,5,5],
             [3,3,3,4,4,4,5,5,5],
             [3,3,3,4,4,4,5,5,5],
             [6,6,6,7,7,7,8,8,8],
             [6,6,6,7,7,7,8,8,8],
             [6,6,6,7,7,7,8,8,8]
           ]



class Puzzle

  def initialize(name, board)
    @name = name
    @board = board
    init_state
  end
  
  def place(row,col,val)
    @board[row][col] = val
    @row_const[row].delete(val)
    @col_const[col].delete(val)
    @box_const[BOX_MAP[row][col]].delete(val)
  end
  
  def remove(row,col)
    val = @board[row][col]
    @row_const[row].push(val)
    @col_const[col].push(val)
    @box_const[BOX_MAP[row][col]].push(val)
    @board[row][col] = 0
  end

  def accept
    0.upto(8) do |row|
      0.upto(8) do |col|
        return false if @board[row][col] == 0 && !(@box_const[BOX_MAP[row][col]] & @row_const[row] & @col_const[col]).empty?
      end
    end
    return true
  end


  def reject
    0.upto(8) do |row|
      0.upto(8) do |col|
        return true if @board[row][col] == 0 && (@box_const[BOX_MAP[row][col]] & @row_const[row] & @col_const[col]).empty?
      end
    end
    return false
  end

  def solve
    self.brute
  end
  
  
  def brute
    changes = false
    while true
      0.upto(8) do |i|
        0.upto(8) do |j|
          next unless @board[i][j] == 0
          canidates =  @box_const[BOX_MAP[row][col]] & @row_const[row] & @col_const[col]
          if canidates.size == 1
            self.place(i,j,canidates[0])
            changes = true
          end
        end
      end      
    end    
    
  end
  
  def bt
    return if reject
    if accept
      pp @board
      exit
    end
    0.upto(8) do |row|
      0.upto(8) do |col|
        if @board[row][col] == 0
           canidates =  @box_const[BOX_MAP[row][col]] & @row_const[row] & @col_const[col]
           canidates.each do |val|
             self.place(row,col,val)
             self.bt
             self.remove(row,col)
           end
         end
       end
     end
  end
  
  def init_state
    @row_const = []
    @col_const = []
    @box_const = []
    @squ_const = []

    0.upto(8) do |i|
      @row_const[i] = [1,2,3,4,5,6,7,8,9]
      @col_const[i] = [1,2,3,4,5,6,7,8,9]
      @box_const[i] = [1,2,3,4,5,6,7,8,9]
      @squ_const[i] = []
      0.upto(8) do |j|
        @squ_const[i][j] = [1,2,3,4,5,6,7,8,9]
      end
    end

    0.upto(8) do |row|
      0.upto(8) do |col|
        val = @board[row][col]
        if val > 0
          @row_const[row].delete(val)
          @col_const[col].delete(val)
          @box_const[BOX_MAP[row][col]].delete(val)
        end
      end  
    end

    0.upto(8) do |row|
      0.upto(8) do |col|
        if (@board[row][col] == 0)
          @squ_const[row][col] = @box_const[BOX_MAP[row][col]] & @row_const[row] & @col_const[col]
        else
          @squ_const[row][col] = []
        end
      end
    end
  end
    
end




@puzzles = []

0.upto(49) do |puzzle|
  name = f.gets.strip
  puz = Array.new()
  0.upto(8) do |i|
    puz << f.gets.strip.split("").map(&:to_i)
  end  
  @puzzles << Puzzle.new(name, puz)
  break
end



@p = @puzzles[0]
@p.place(0,0,4)
@p.place(0,1,8)
@p.place(0,3,9)
@p.place(0,5,1)

@p.bt



exit
pp @puzzles[0]
exit


@puzzle = @puzzles['Grid 01']






def reject
  0.upto(8) do |row|
    0.upto(8) do |col|
      return true if @puzzle[row][col] == 0 && (@box_const[@box_map[row][col]] & @row_const[row] & @col_const[col]).empty?
    end
  end
  return false
end

def accept
  0.upto(8) do |row|
    0.upto(8) do |col|
      return false if @puzzle[row][col] == 0 && !(@box_const[@box_map[row][col]] & @row_const[row] & @col_const[col]).empty?
    end
  end
  return true
end

def output
  pp @puzzle
  exit
end

def bt
  return if reject
  output if accept
  0.upto(8) do |row|
    0.upto(8) do |col|
      if @puzzle[row][col] == 0
         canidates =  @box_const[@box_map[row][col]] & @row_const[row] & @col_const[col]
         canidates.each do |val|
           @puzzle[row][col] = val
           @row_const[row].delete(val)
           @col_const[col].delete(val)
           @box_const[@box_map[row][col]].delete(val)
           puts "Adding #{val} in #{row},#{col}"
           bt
           puts "Deleting #{val} in #{row},#{col}"
           @puzzle[row][col] = 0
           @row_const[row].push(val)
           @col_const[col].push(val)
           @box_const[@box_map[row][col]].push(val)
         end
      end      
    end
  end
end




#bt
