=begin

250250
Problem 250
Published on Saturday, 13th June 2009, 12:00 am; Solved by 1799
Find the number of non-empty subsets of {1^1, 2^2, 3^3,..., 250250^250250}, the sum of whose elements is divisible by 250. Enter the rightmost 16 digits as your answer.

=end

require './euler_lib.rb'

@residues = Hash.new

1.upto(250250) do |i|
  r = mod_pow(i,i,250)
  @residues[r] ||= 0
  @residues[r] += 1  
end

total = 0


