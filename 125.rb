=begin
The palindromic number 595 is interesting because it can be written as the sum of consecutive squares: 62 + 72 + 82 + 92 + 102 + 112 + 122.

There are exactly eleven palindromes below one-thousand that can be written as consecutive square sums, and the sum of these palindromes is 4164. Note that 1 = 02 + 12 has not been included as this problem is concerned with the squares of positive integers.

Find the sum of all the numbers less than 108 that are both palindromic and can be written as the sum of consecutive squares.
=end

require 'pp'

@f = Array.new

def sq(n)
 (2*n**3 + 3*n**2 + n) / 6
end

@h = Array.new

1.upto(10000) do |i|
  (i+1).upto(10000) do |j|
    diff = sq(j) - sq(i-1)
    if diff < 10**8
      if diff.to_s == diff.to_s.reverse
        @h.push diff
      end
    else
      break
    end
  end  
end

puts @h.uniq.inject(&:+)
