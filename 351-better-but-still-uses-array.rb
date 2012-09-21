#351
require 'pp'

ROWS = 1000
COLS = 10000
ORGIN_Y = 0
ORGIN_X = COLS / 2

d = Array.new()

0.upto(ROWS) do |i|
  d[i] = Array.new(COLS,0)
end
d[ORGIN_Y][ORGIN_X] = 1
puts "CREATED"
0.upto(ROWS) do |i|
  0.upto(COLS) do |j|
    if d[i-1][j] == 1
      d[i][j+1] = 1
      d[i][j-1] = 1
    end
  end
end

puts "INITIALIZED"

@vectors = Array.new

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
@vectors.uniq

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
    break if l > ROWS || k < 0 || k > COLS
    if d[l][k] == 1 and !seen
      seen = true
      d[l][k] = 3
    end
    if d[l][k] == 1 and seen
      d[l][k] = 4
    end
  end
end

=begin

d.each do |row|
  row.each do |col|
    print col == 0 ? "." : col
  end
  puts
end
=end
sum = 0
ROWS.downto(0) do |row|
  0.upto(COLS) do |col|
    sum += 1 if d[row][col] == 4 || d[row][col] == 1
  end
end
puts (sum - ROWS) * 6
