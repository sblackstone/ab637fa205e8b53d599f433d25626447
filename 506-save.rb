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
=end



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
        puts "#{n}: #{current_v}"
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

puts s(100)
