=begin

Special subset sums: testing
Problem 105

Let S(A) represent the sum of elements in set A of size n. We shall call it a special sum set if for any two non-empty disjoint subsets, B and C, the following properties are true:

S(B) ≠ S(C); that is, sums of subsets cannot be equal.
If B contains more elements than C then S(B) > S(C).
For example, {81, 88, 75, 42, 87, 84, 86, 65} is not a special sum set because 65 + 87 + 88 = 75 + 81 + 84, whereas {157, 150, 164, 119, 79, 159, 161, 139, 158} satisfies both rules for all possible subset pair combinations and S(A) = 1286.

Using sets.txt (right click and "Save Link/Target As..."), a 4K text file with one-hundred sets containing seven to twelve elements (the two examples given above are the first two sets in the file), identify all the special sum sets, A1, A2, ..., Ak, and find the value of S(A1) + S(A2) + ... + S(Ak).

NOTE: This problem is related to Problem 103 and Problem 106.

=end

require 'pp'


def no_equal_subsets(s)
  track = Hash.new
  2.upto(s.length) do |l|
    s.combination(l) do |c|
      sum = c.inject(:+)
      track[sum] ||= Array.new

      track[sum].each do |m|
        intersection = m & c
        if intersection.length == 0
=begin
          puts "Fail 2:"
          pp m
          pp c
          pp m.inject(:+)
          pp c.inject(:+)
          puts "*" * 25
=end
          return false
        end
        
      end      
      track[sum].push c
    end
  end    
  return true
  
end


def test(s)
  s.sort!
  return false unless s.uniq.size == s.size
  2.upto(s.size) do |n|
    a = s[0,n]
    b = s[s.length - n + 1, n-1]
    unless a.inject(:+) > b.inject(:+)
      puts "Fail 1:"
      pp a
      pp b
      puts "*" * 25
      return false 
    end
  end
  return no_equal_subsets(s)      
end



answer = 0

File.open("p105_sets.txt").each do |line|
  set = line.strip.split(",").map {|x| x.to_i }
  if test(set)
    answer += set.inject(:+)
  end
end

puts answer
