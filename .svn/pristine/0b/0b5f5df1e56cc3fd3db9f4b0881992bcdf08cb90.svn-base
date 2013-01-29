require 'lib'


class Problem28
  HEIGHT = 1001
  WIDTH  = 1001

  def initialize
    @arr = Array.new(HEIGHT) { i = Array.new(WIDTH) { i = 0 }}
    @ptrh = HEIGHT / 2
    @ptrw = WIDTH  / 2
    @arr[@ptrh][@ptrw] = 1
  end

  def print
    0.upto(HEIGHT - 1) do |h|
      0.upto(WIDTH - 1) do |w|
        printf " #{@arr[h][w]}"
      end
      puts
    end
  end

  def set(x)
    @arr[@ptrh][@ptrw] = x
  end
  
  def move(direction)
    if direction    == :left
      @ptrw = @ptrw - 1
    elsif direction == :right
      @ptrw = @ptrw + 1
    elsif direction == :up
      @ptrh = @ptrh - 1
    elsif direction == :down
      @ptrh = @ptrh + 1
    end
  end

  def flip(direction)
    return :down   if direction == :right
    return :left   if direction == :down
    return :up     if direction == :left
    return :right  if direction == :up
  end
  
  def sum_of_diag
    sum = 0
    0.upto(HEIGHT - 1) do |x|
      sum = sum + @arr[x][x]
      sum = sum + @arr[x][HEIGHT-1-x]
    end
    return sum - 1 # Off by one b/c center was counted twice.
  end
  
  def fill
    direction = :right
    move_ctr = 1
    moves    = 1
    times    = 1
    2.upto(HEIGHT*WIDTH) do |round|
      move(direction)
      set(round)
      moves = moves - 1
      if moves == 0
        direction = flip(direction)
        if times ==  1
          moves = move_ctr
          times = times - 1
        else
          times = 1
          move_ctr = move_ctr + 1
          moves    = move_ctr
        end
      end
    end
  end

  def run
  end

end

c = Problem28.new
c.fill
c.print
puts c.sum_of_diag