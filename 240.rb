=begin
Top Dice
Problem 240
There are 1111 ways in which five 6-sided dice (sides numbered 1 to 6) can be rolled so that the top three sum to 15. Some examples are: 

D1,D2,D3,D4,D5 = 4,3,6,3,5 
D1,D2,D3,D4,D5 = 4,3,3,5,6 
D1,D2,D3,D4,D5 = 3,3,3,6,6 
D1,D2,D3,D4,D5 = 6,6,3,3,3 

In how many ways can twenty 12-sided dice (sides numbered 1 to 12) be rolled so that the top ten sum to 70?
=end

require 'pp'

def brute(dice, sides, top, sum, arr = [])
  count = 0
  return arr.sort.reverse[0,top].inject(&:+) == sum ? 1 : 0 if arr.length == dice    
  sides.downto(1) do |s|
    arr.push s
    count += brute(dice, sides, top, sum, arr)
    arr.pop
  end
  count
end

#puts brute(5,6, 3, 15)



def top_dice(top, sides, sum, arr = [], &block)
  count = 0
  if arr.size == top
    if arr.inject(&:+) == sum
      yield arr
      return 1
    else
      return 0
    end
  end
  sides.downto(1) do |s|
    arr.push s
    count += top_dice(top, s, sum, arr, &block)
    arr.pop
  end
  count
end


def fact(n)
  return n == 0 ? 1 : n*fact(n-1)
end


#puts top_dice(10,12, 70)

s = 0

top_dice(3,6, 15) do |t|
  s += t.last**2
end

puts s
