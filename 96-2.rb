require 'pp' 


@constraint_map = Array.new

0.upto(80) do |i|
  @constraint_map[i] = Array.new
end





exit

BOX_MAP = [
             0,0,0,1,1,1,2,2,2,
             0,0,0,1,1,1,2,2,2,
             0,0,0,1,1,1,2,2,2,
             3,3,3,4,4,4,5,5,5,
             3,3,3,4,4,4,5,5,5,
             3,3,3,4,4,4,5,5,5,
             6,6,6,7,7,7,8,8,8,
             6,6,6,7,7,7,8,8,8,
             6,6,6,7,7,7,8,8,8
           ];

      
          
@reverse_box_map = {}

0.upto(8) do |i|
  @reverse_box_map[i] = Array.new
end

0.upto(80) do |i|
  puts BOX_MAP[i]
  @reverse_box_map[BOX_MAP[i]] << i
end



class Puzzle
  attr_accessor :squares


  def place(box,val)
    @board[box] = val
    @squares[box] = []
    
  end
  
  def remove(box)
  
  end
  
  
  
  def initialize(board)
    @board = board
    @squares = Array.new
    0.upto(80) do |i|
      if @board[i] == 0
        @squares[i] = [1,2,3,4,5,6,7,8,9]
      else
        @squares[i] = []
      end
    end
    
  end
  
end

def puzzle_loader
  f = File.open("sudoku.txt")
  puzzles = []
  0.upto(49) do |puzzle|
    name = f.gets.strip
    puz = ""
    0.upto(8) do |i|
      puz << f.gets.strip
    end  
    puzzles << Puzzle.new(puz.split("").map(&:to_i))
    break
  end
  return puzzles
end


@puzzles = puzzle_loader
pp @puzzles[0]

