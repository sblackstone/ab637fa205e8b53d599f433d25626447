=begin
Julie proposes the following wager to her sister Louise.
She suggests they play a game of chance to determine who will wash the dishes.
For this game, they shall use a generator of independent random numbers uniformly distributed between 0 and 1.
The game starts with S = 0.
The first player, Louise, adds to S different random numbers from the generator until S > 1 and records her last random number 'x'.
The second player, Julie, continues adding to S different random numbers from the generator until S > 2 and records her last random number 'y'.
The player with the highest number wins and the loser washes the dishes, i.e. if y > x the second player wins.

For example, if the first player draws 0.62 and 0.44, the first player turn ends since 0.62+0.44 > 1 and x = 0.44.
If the second players draws 0.1, 0.27 and 0.91, the second player turn ends since 0.62+0.44+0.1+0.27+0.91 > 2 and y = 0.91. Since y > x, the second player wins.

Louise thinks about it for a second, and objects: "That's not fair".
What is the probability that the second player wins?
Give your answer rounded to 10 places behind the decimal point in the form 0.abcdefghij

Average S after player 1 = e/2


=end


require 'pp'
=begin
def sim
  s = 0
  x = 0 
  while s < 1
    x = rand
    s += x
  end
  return s
  y = 0
  while s < 2
    y = rand
    s += y
  end
  return y > x ? "2" : "1"
end


@results = Hash.new(0)

n = 50000

avg = 0

n.times {
  avg += sim
}

pp (avg / n)

=end


