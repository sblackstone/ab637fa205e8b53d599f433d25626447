require 'pp' 

f = File.open("sudoku.txt")



BOX_MAP = [  0,0,0,1,1,1,2,2,2,
             0,0,0,1,1,1,2,2,2,
             0,0,0,1,1,1,2,2,2,
             3,3,3,4,4,4,5,5,5,
             3,3,3,4,4,4,5,5,5,
             3,3,3,4,4,4,5,5,5,
             6,6,6,7,7,7,8,8,8,
             6,6,6,7,7,7,8,8,8,
             6,6,6,7,7,7,8,8,8
          ]

ROW_MAP = [ 0,0,0,0,0,0,0,0,0,
            1,1,1,1,1,1,1,1,1,
            2,2,2,2,2,2,2,2,2,
            3,3,3,3,3,3,3,3,3,
            4,4,4,4,4,4,4,4,4,
            5,5,5,5,5,5,5,5,5,
            6,6,6,6,6,6,6,6,6,
            7,7,7,7,7,7,7,7,7,
            8,8,8,8,8,8,8,8,8
          ]

COL_MAP = [
            0,1,2,3,4,5,6,7,8,  
            0,1,2,3,4,5,6,7,8,  
            0,1,2,3,4,5,6,7,8,  
            0,1,2,3,4,5,6,7,8,  
            0,1,2,3,4,5,6,7,8,  
            0,1,2,3,4,5,6,7,8,  
            0,1,2,3,4,5,6,7,8,  
            0,1,2,3,4,5,6,7,8,  
            0,1,2,3,4,5,6,7,8
]

MASK_LOOKUP = { 1 => 1, 
                2 => 2, 
                4 => 3, 
                8 => 4, 
                16 => 5, 
                32 => 6, 
                64 => 7, 
                128 => 8, 
                256 => 9 
              }
BIT_MASK = [nil, 1,     2,   4,   8,  16,  32,  64, 128, 256]
INV_MASK = [nil, 510, 509, 507, 503, 495, 479, 447, 383, 255]

class Puzzle
  attr_reader :board
    
  def place(square, value)
    @board[square] = value    
    @col_masks[COL_MAP[square]] =  @col_masks[COL_MAP[square]] & INV_MASK[value]
    @row_masks[ROW_MAP[square]] =  @row_masks[ROW_MAP[square]] & INV_MASK[value]
    @box_masks[BOX_MAP[square]] =  @box_masks[BOX_MAP[square]] & INV_MASK[value]
    @square_deps[square].each  {|i| @square_masks[i] = self.calc_box_mask(i) }     
  end
  
  def unplace(square)
    @col_masks[COL_MAP[square]] =  @col_masks[COL_MAP[square]] | BIT_MASK[@board[square]]
    @row_masks[ROW_MAP[square]] =  @row_masks[ROW_MAP[square]] | BIT_MASK[@board[square]]
    @box_masks[BOX_MAP[square]] =  @box_masks[BOX_MAP[square]] | BIT_MASK[@board[square]]
    @board[square] = 0    
    @square_deps[square].each  {|i| @square_masks[i] = self.calc_box_mask(i) }    
  end
  
  def calc_box_mask(i)
    @col_masks[COL_MAP[i]] & @row_masks[ROW_MAP[i]] & @box_masks[BOX_MAP[i]]
  end
  
  
  def setup_state
    @inv_row_map = Array.new(9)
    @inv_col_map = Array.new(9)
    @inv_box_map = Array.new(9)
    @square_masks = Array.new(81, 511)
    @square_deps = Array.new(81)
    
    0.upto(8) do |i|
      @inv_row_map[i] = Array.new
      @inv_col_map[i] = Array.new
      @inv_box_map[i] = Array.new      
    end    
    0.upto(80) do |i|
      @inv_row_map[ROW_MAP[i]] << i
      @inv_col_map[COL_MAP[i]] << i
      @inv_box_map[BOX_MAP[i]] << i      
    end
    0.upto(80) do |i|
      @square_deps[i] = [@inv_row_map[ROW_MAP[i]], @inv_col_map[COL_MAP[i]], @inv_box_map[BOX_MAP[i]]].flatten.sort.uniq
    end
    

    0.upto(80) do |i|
      if @board[i] > 0
        self.place(i, @board[i])
      end
    end
  end
  
  def to_s
    0.upto(80) do |i|
      if i % 9 == 0
        puts
      end
      print " #{@board[i]} "
    end
    
  end
    
  def initialize(board)
    @col_masks = Array.new(9, 511)
    @row_masks = Array.new(9, 511)
    @box_masks = Array.new(9, 511)
    @board = board
    setup_state
  end

  ## BT  STUFF
  
  def accept
    puts "checking accept"
    0.upto(80) do |i|
      if @board[i] == 0
        puts "Not accepting because #{i} is #{@board[i]}"
      end
      return false if @board[i] == 0
    end
    return true
  end

  def reject
    0.upto(80) do |i|
      return true if @square_masks[i] == 0 &&  @board[i] == 0
    end
    return false
  end
  
  def solve
    puts "start solve"
    placements = Array.new
    while true
      changed = false
      0.upto(80) do |i|
        next unless @board[i] == 0
        v = @square_masks[i]
        c = MASK_LOOKUP[v]
        if v > 0 &&  (v & (v - 1) == 0)
          puts "Placing a #{c} in box #{i}"
          self.place(i, c)
          placements.push [i, c]
          changed = true
        end
      end
      break unless changed              
    end
    self.bt
    while p = placements.pop
      self.unplace(p[0])
    end
  end
  
  def bt
    puts "start bt"
    return if self.reject
    if self.accept
      throw "Done"      
    end
    0.upto(80) do |i|
      if @board[i] == 0
        1.upto(9) do |c|
          if (@square_masks[i] & BIT_MASK[c])  > 0
            self.place(i, c)
            self.solve
            self.unplace(i)
          end  
        end
      end
    end
  end
end




@puzzles = []

0.upto(49) do |puzzle|
  name = f.gets.strip
  puz = ""
  0.upto(8) do |i|
    puz += f.gets.strip
  end  
  @puzzles << puz.split("").map(&:to_i)
end


@puzzles.each do |p|
  @puz = Puzzle.new(p)
  begin
    @puz.solve
  rescue
    @puz.to_s
  end
end


