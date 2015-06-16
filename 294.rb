=begin
Sum of digits - experience #23
Problem 294
For a positive integer k, define d(k) as the sum of the digits of k in its usual decimal representation. Thus d(42) = 4+2 = 6.

For a positive integer n, define S(n) as the number of positive integers k < 10n with the following properties :

k is divisible by 23 and
d(k) = 23.
You are given that S(9) = 263626 and S(42) = 6377168878570056.
Find S(11**12) and give your answer mod 10**9.
=end

require 'pp'


@answers = Hash.new(0)

def gen(target, cur, tot)
  if (target == tot) 
    pp cur
   else
     start = cur.last || 1
     stop  = [target-tot, 9].min
     start.upto(stop) do |i|
       cur.push i
       gen(target, cur, tot + i)
       cur.pop
     end
  end
end


gen(23, [], 0)

