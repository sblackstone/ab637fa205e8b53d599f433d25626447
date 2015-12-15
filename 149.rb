=begin
Problem 149: Searching for a maximum-sum subsequence
Looking at the table below, it is easy to verify that the maximum possible sum of adjacent numbers in any direction (horizontal, vertical, diagonal or anti-diagonal) is 16 (= 8 + 7 + 1).

−2	5	 3	2
9	 −6	 5	1
3	  2  7	3
−1	8	−4  8
Now, let us repeat the search, but on a much larger scale:

First, generate four million pseudo-random numbers using a specific form of what is known as a "Lagged Fibonacci Generator":

For 1 ≤ k ≤ 55, sk = [100003 − 200003k + 300007k3] (modulo 1000000) − 500000.
For 56 ≤ k ≤ 4000000, sk = [sk−24 + sk−55 + 1000000] (modulo 1000000) − 500000.

Thus, s10 = −393027 and s100 = 86613.

The terms of s are then arranged in a 2000×2000 table, using the first 2000 numbers to fill the first row (sequentially), the next 2000 numbers to fill the second row, and so on.

Finally, find the greatest sum of (any number of) adjacent entries in any direction (horizontal, vertical, diagonal or anti-diagonal).


−2	5	 3	2
9	 −6	 5	1
3	  2  7	3
−1	8	−4  8



How to paremertize solution space?


Vertical   - choose column
Horizontal - choose row

Diagonals

Chose column, choose top or bottom, choose left or right






=end


require 'pp'

class MatrixSum

  def initialize(arr)
    @arr = arr
  end  
  

  
  def calc_diag_values(x,y)
    max_ending_here = 0
    max_so_far = 0

    while x < (@arr.length) and y < (@arr.length)
      max_ending_here = [0, max_ending_here + @arr[x][y]].max
      max_so_far = [max_so_far, max_ending_here].max
      x += 1
      y += 1    
    end    
    max_so_far
  end

  def calc_anti_diag_values(x,y)
    max_ending_here = 0
    max_so_far = 0
    while x >= 0 and y >= 0
      max_ending_here = [0, max_ending_here + @arr[x][y]].max
      max_so_far = [max_so_far, max_ending_here].max
      x -= 1
      y -= 1    
    end    
    max_so_far
  end

  
  
  def max_diagnoal
    max = (-1) * 10**9

    0.upto(@arr.length - 2) do |col|
      max =  [calc_diag_values(col, 0), max].max
      max =  [calc_diag_values(0, col), max ].max
    end

    1.upto(@arr.length - 1) do |col|       
      max = [ calc_anti_diag_values(@arr.length - 1, col), max].max
      max = [ calc_anti_diag_values(col, @arr.length - 1), max].max
    end
    max
  end
  
  
  def output
    @arr.each do |row|
      puts row.join("\t")
    end  
    puts
  end  

  def max_row
    max = (-1) * 10**9
    @arr.each do |row|
      max = [max, kadane(row)].max
    end
    max    
  end
  
  def col_sum(col)
    max_ending_here = 0
    max_so_far = 0
    @arr.each do |x|
      max_ending_here = [0, max_ending_here + x[col]].max
      max_so_far = [max_so_far, max_ending_here].max
    end
    max_so_far      
  end  

  def max_col
    max = (-1) * 10**9
    0.upto(@arr.length - 1) do |c|
      max = [max, col_sum(c)].max
    end
    max
  end
  
  def max_sum
    [max_row, max_col, max_diagnoal].max    
  end
  
  def kadane(arr)
    max_ending_here = 0
    max_so_far = 0
    arr.each do |x|
      max_ending_here = [0, max_ending_here + x].max
      max_so_far = [max_so_far, max_ending_here].max
    end
    max_so_far  
  end

end

a = [ [-2,	5,	 3,	2],
      [9,	 -6,	 5,	1],
      [3,	  2,   7, 3],
      [-1,	8, 	-4, 8]
]

@s_k_cache = Hash.new

def s(k)
  @s_k_cache[k] ||= do_s(k)
end


def do_s(k)
  if k >= 1 and k <= 55
    return ((100_003 - 200_003*k + 300_007 * k**3) % 1_000_000) - 500_000
  else
    return ((s(k-24) + s(k-55) + 1_000_000) % 1_000_000) - 500_000
  end  
end

result = Array.new

0.upto(1999) do |i|
  t = Array.new
  1.upto(2000) do |j|
    t.push s(i*2000 + j)
  end
  result.push t
end
puts "initialized"
m = MatrixSum.new(result)
puts m.max_sum
