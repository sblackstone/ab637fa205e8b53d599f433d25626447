=begin
Special subset sums: optimum
Problem 103
Let S(A) represent the sum of elements in set A of size n. We shall call it a special sum set if for any two non-empty disjoint subsets, B and C, 
the following properties are true:

S(B) ≠ S(C); that is, sums of subsets cannot be equal.
If B contains more elements than C then S(B) > S(C).
If S(A) is minimised for a given n, we shall call it an optimum special sum set. The first five optimum special sum sets are given below.

n = 1: {1}
n = 2: {1, 2}
n = 3: {2, 3, 4}
n = 4: {3, 5, 6, 7}
n = 5: {6, 9, 11, 12, 13}

It seems that for a given optimum set, A = {a1, a2, ... , an}, the next optimum set is of the form B = {b, a1+b, a2+b, ... ,an+b}, where b is the "middle" element on the previous row.

By applying this "rule" we would expect the optimum set for n = 6 to be A = {11, 17, 20, 22, 23, 24}, with S(A) = 117. 
However, this is not the optimum set, as we have merely applied an algorithm to provide a near optimum set. 
The optimum set for n = 6 is A = {11, 18, 19, 20, 22, 25}, with S(A) = 115 and corresponding set string: 111819202225.

Given that A is an optimum special sum set for n = 7, find its set string.

NOTE: This problem is related to Problem 105 and Problem 106.


{6, 9, 11, 12, 13}


The same element isn't repeated.
The sum of the two smallest elements is greater than the largest single element.
The sum of the three smallest elements is greater than the sum of the largest pair, etc...

Now, no subsets of same size will ever violate rule 2....


The max element of any set can't be larger than sum of first 2...





for n := 2 to n/2

The sum of the n smallest elements is greater than the sum of largest n-1 elements



{a, b, c, d, e }

a < b < c < d < e
a+b   > e
a+b+c > d+e
 


=end

require 'pp'

=begin
opt6 =  [11, 18, 19, 20, 22, 25]


opt7 = opt6.map {|x| x -1}
opt7.unshift 20
pp opt7
=end


def no_equal_subsets(s)
  track = Hash.new
  2.upto(s.length) do |l|
    s.combination(l) do |c|
      sum = c.inject(:+)
      track[sum] ||= Array.new

      track[sum].each do |m|
        intersection = m & c
        if intersection.length == 0
          pp m
          pp c
          return false
        end
        
      end      
      track[sum].push c
    end
  end    
  return true
  
end


def test(s)
  return false unless s.uniq.size == s.size
  s.sort!
  2.upto(s.size / 2) do |n|
    a = s[0,n]
    b = s[s.length - n + 1, n-1]
    return false unless a.inject(:+) < b.inject(:+)
  end
  return no_equal_subsets(s)      
end

pp test [1,2,3,4,5]