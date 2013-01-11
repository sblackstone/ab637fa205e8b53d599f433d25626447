=begin
A bag contains one red disc and one blue disc. In a game of chance a player takes a disc at random and its colour is noted. After each turn the disc is returned to the bag, an extra red disc is added, and another disc is taken at random.

The player pays £1 to play and wins if they have taken more blue discs than red discs at the end of the game.

If the game is played for four turns, the probability of a player winning is exactly 11/120, and so the maximum prize fund the banker should allocate for winning in this game would be £10 before they would expect to incur a loss. Note that any payout will be a whole number of pounds and also includes the original £1 paid to play the game, so in the example given the player actually wins £9.

Find the maximum prize fund that should be allocated to a single game in which fifteen turns are played.
=end

=begin
RBBB = 1/2 * 1/3 * 1/4 * 1/5 = 1/120
BRBB = 1/2 * 2/3 * 1/4 * 1/5 = 2/120
BBRB = 1/2 * 1/3 * 3/4 * 1/5 = 3/120
BBBR = 1/2 * 1/3 * 1/4 * 4/5 = 4/120
BBBB = 1/2 * 1/3 * 1/4 * 1/5 = 1/120
=end


require 'pp'
=begin
[2,3,4,5,6,7,8,9,10,11,12,13,14,15,16].combination(8) do |x|

end
=end

rounds = 15
to_win = (rounds / 2.0).floor + 1
puts "Need #{to_win} to win"
total = 0

arr = []
2.upto(rounds+1) do |x|
  arr.push(x)
end
bottom = arr.inject(1) {|x,y| x*= y}
pp arr

to_win.upto(rounds) do |i|
  arr.combination(i) do |x|
    top = 1
    2.upto(rounds+1) do |y|
      if !x.include?(y)
        top *= (y-1) 
      end
    end
    total += top
    puts "#{top} / #{bottom}"
    puts "*" * 50
  end
end


g = total.gcd(bottom)

while g > 1
  total /= g
  bottom /= g
  g = total.gcd(bottom)

end

  

puts "#{total} / #{bottom}"
puts bottom / total