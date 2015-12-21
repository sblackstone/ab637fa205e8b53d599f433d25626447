=begin
Clock sequence
Problem 506
Consider the infinite repeating sequence of digits:
1234321234321234321...

Amazingly, you can break this sequence of digits into a sequence of integers such that the sum of the digits in the n'th value is n.

The sequence goes as follows:
1, 2, 3, 4, 32, 123, 43, 2123, 432, 1234, 32123, ...

Let vn be the n'th value in this sequence. For example, v2 = 2, v5 = 32 and v11 = 32123.

Let S(n) be v1 + v2 + ... + vn. For example, S(11) = 36120, and S(1000) mod 123454321 = 18232686.

Find S(1014) mod 123454321.
=end



=begin

This version is slower...

def seq2(&proc)
  seq_def = [1,2,3,4,3,2,1]
  seq_loc = 0
  while true
    yield seq_def[seq_loc]
    seq_loc = (seq_loc + 1) % 6
  end
  
end


1       =  1
1+2     =  3
1+2+3   =  6
1+2+3+4 = 10
2+3+4   =  9
  3+4   =  7
    4   =  4
    

=end
=begin
require 'pp'

@digits = [
  [1,1] ,
  [2,2] ,
  [3,3] ,
  [4,4] ,
  [3,2] ,
  [1,3] ,
  [4,3] ,
  [2,3] ,
  [4,2] ,
  [1,4] ,
  [3,3] ,
  [4,2] ,
  [3,1] ,
  [2,2] ,
  [1,2]   
]



def v(n)
  f = @digits[n % 15]

end

def seq(&proc)
end


pp v(6)


exit

=end

=begin
12
21
32
32
21
12
23
34
32
23
43
23
32
34
23

1 1 1
2 2 2
3 3 3
4 4 4
5 32 32
6 123 23
7 43 43
8 2123 23
9 432 32
10 1234 34
11 32123 23
12 43212 12
13 34321 21
14 23432 32
15 123432 32
16 1234321 21
17 2343212 12
18 3432123 23
19 4321234 34
20 32123432 32
21 123432123 23
22 43212343 43
23 2123432123 23
24 432123432 32
25 1234321234 34
26 32123432123 23
27 43212343212 12
28 34321234321 21
29 23432123432 32
30 123432123432 32


=end



def v(n)
  return n if n < 5
end





#exit
def seq(&proc)
  dir = -1
  i = 1
  while true
    yield i
    if i == 4 || i == 1
      dir *= -1
    end
    i = i + dir
  end
end

def s(max)
  n           = 1
  current_sum = 0
  current_v   = 0
  total       = 0

  seq do |i|
    if current_sum == n
      if true #current_v > 123454321
        puts "#{n} #{current_v} #{current_v % 100}"
        #puts "[" + current_v.to_s[0].to_s + "," + (current_v % 100).to_s + "] ,"
        #puts current_v % 100
      end
      total = (total + current_v) % 123454321
      current_sum = 0
      current_v = 0 
      n += 1
      break if n == max+1
    end
    current_sum += i
    current_v *= 10;
    current_v += i
  end
  total
end

puts s(1000)
