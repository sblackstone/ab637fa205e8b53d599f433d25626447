require 'lib'
require 'primes'


class Problem28
  #HEIGHT = 7
  WIDTH  = 5001
  HEIGHT = WIDTH
  def initialize
    #@arr = Array.new(HEIGHT) { i = Array.new(WIDTH) { i = 0 }}
    @ptrh = HEIGHT / 2
    @ptrw = WIDTH  / 2
    #@arr[@ptrh][@ptrw] = 1
  end

  def print
    0.upto(HEIGHT - 1) do |h|
      0.upto(WIDTH - 1) do |w|
        printf " #{@arr[h][w]}\t"
      end
      puts
    end
  end

  def set(x)
    #puts "Setting #{x} at #{@ptrh},#{@ptrw}"
    @arr[@ptrh][@ptrw] = x
  end
  
  def move(direction)
    #puts "Moving: #{direction}"
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
    return :right   if direction == :down
    return :left    if direction == :up
    return :down    if direction == :left
    return :up      if direction == :right
  end
  
  def count_of_diag
    count = 0
    0.upto(HEIGHT - 1) do |x|
      if isPrime?(@arr[x][x])
        #puts @arr[x][x]
        count = count + 1 
      end
      if isPrime?(@arr[x][HEIGHT-1-x])
        #puts @arr[x][HEIGHT-1-x]
        count = count + 1 
      end
    end
    return count
  end
  
  def fill
    direction = :right
    move_ctr = 1
    moves    = 1
    times    = 1
    primes   = -1 # because it does a weird flip at 2 before starting pattern.
    2.upto(HEIGHT*WIDTH) do |round|
      move(direction)
      #set(round)
      if (Math.sqrt(round) == Math.sqrt(round).to_i)
        if Math.sqrt(round) % 2 == 1
          side_len = Math.sqrt(round) * 2 - 1
          puts "Primes = #{primes}"
          puts "Len    = #{side_len}"
          v = primes / side_len
          puts "Rat   = #{v}"
          break if v < 0.1
        end
      end
      
      moves = moves - 1
      if moves == 0
        puts "flipping at #{round}"
        #direction = flip(direction)
        if isPrime?(round)
          primes = primes + 1
          puts "#{round} got added."
        end
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
#puts c.sum_of_diag