require 'pp' 

f = File.open("sudoku.txt")

@puzzles = Hash.new(nil)

0.upto(49) do |puzzle|
  name = f.gets.strip
  @puzzles[name] = Array.new()
  0.upto(8) do |i|
    @puzzles[name] << f.gets.strip.split("").map(&:to_i)
  end  
end

@puzzle = @puzzles['Grid 01']

@canidates = Hash.new

0.upto(8) do |i|
  @canidates[i] = Array.new(9)
  0.upto(8) do |j|
    @canidates[i][j] = [1,2,3,4,5,6,7,8,9]
  end
end


0.upto(8) do |row|
  @puzzle[row].each do |k|  
  end
end



