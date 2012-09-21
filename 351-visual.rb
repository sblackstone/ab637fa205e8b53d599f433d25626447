#351
require 'pp'

ROWS = 5
COLS = 100
ORGIN_Y = 0
ORGIN_X = COLS / 2



d = Array.new()

0.upto(ROWS) do |i|
  d[i] = Hash.new(0)
end
d[ORGIN_Y][ORGIN_X] = 1

puts "INITIALIZED"

@vectors = Array.new

1.upto(ROWS) do |row|
  col = ORGIN_X-row
  while col <= ORGIN_X+row
    d[row][col] = 1
    col += 2
  end
end


1.upto(ROWS) do |row|
  col = ORGIN_X-row
  while col <= ORGIN_X+row
    rise = row - ORGIN_Y
    run  = col - ORGIN_X
    if rise == 0 and run == 0
      rise = 1
    else
      gcd = rise.gcd(run)
      rise /= gcd
      run /= gcd
    end
    @vectors << [rise,run]
    col += 2
  end
end

@vectors.uniq!

puts "Found: #{@vectors.size} vectors"

@vectors.each do |v|
  rise = v[0]
  run = v[1]
  seen = false
  k = ORGIN_X
  l = ORGIN_Y
  while true
    k += run
    l += rise
    break if l > ROWS || k < 0 || k > ORGIN_X+ROWS
    if d[l][k] == 1 and !seen
      seen = true
      d[l][k] = 3
    end
    if d[l][k] == 1 and seen
      d[l][k] = 4
    end
  end
end



d.each do |row|
  row.each do |col|
    print col == 0 ? "." : col
  end
  puts
end

puts "Working on the answer"

sum = 0
ROWS.downto(0) do |row|
  (ORGIN_X-row).upto(ORGIN_X+row) do |col|
    sum += 1 if d[row][col] == 4 || d[row][col] == 1
  end
end
puts (sum - ROWS) * 6
