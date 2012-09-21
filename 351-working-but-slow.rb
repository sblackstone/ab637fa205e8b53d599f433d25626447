#351
require 'pp'

ROWS = 1000
COLS = 100
ORGIN_Y = 0
ORGIN_X = 50

d = Array.new()

0.upto(ROWS) do |i|
  d[i] = Array.new(COLS,0)
end
d[ORGIN_Y][ORGIN_X] = 1

0.upto(ROWS) do |i|
  0.upto(COLS) do |j|
    if d[i-1][j] == 1
      d[i][j+1] = 1
      d[i][j-1] = 1
    end
  end
end


ROWS.downto(0) do |row|
  0.upto(COLS) do |col|
    if d[row][col] == 1
      rise = row - ORGIN_Y
      run  = col - ORGIN_X
      if rise == 0 and run == 0
        rise = 1
      else
        gcd = rise.gcd(run)
        rise /= gcd
        run /= gcd
      end
      seen = false
      k = ORGIN_X
      l = ORGIN_Y
      while k != col || l != row
        k += run
        l += rise
        if d[l][k] == 1 and !seen
          seen = true
          d[l][k] = 3
        end
        if d[l][k] == 1 and seen
          d[l][k] = 4
        end
        
      end
    end
  end  
end


d.each do |row|
  row.each do |col|
    print col == 0 ? "." : col
  end
  puts
end

sum = 0
ROWS.downto(0) do |row|
  0.upto(COLS) do |col|
    sum += 1 if d[row][col] == 4 || d[row][col] == 1
  end
end
puts (sum - ROWS) * 6
