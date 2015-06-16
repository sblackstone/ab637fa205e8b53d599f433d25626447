=begin
Double pandigital number divisible by 11
Problem 491
We call a positive integer double pandigital if it uses all the digits 0 to 9 exactly twice (with no leading zero). For example, 40 + 56 + 18 + 17 + 70 + 38 + 23 + 56 + 49 + 29 is one such number.

How many double pandigital numbers are divisible by 11?


A   C   E   G   I   K   M   O   Q   S 
  B   D   F   H   J   L   N   P   R   T



(A + C + E + G + I + K + M + O + Q + S)  -  (B + D + F + H + J + L + N + P + R + T) = 0 mod 11



AB + CD + EF + GH + IJ + KL + MN + OP + QR + ST

How many different ways to pair numbers..


=end


require 'pp'

def stuff(left, cur = [])
  left.combination(2) do |c|
    pp c
  end
      
end





stuff [0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9]

