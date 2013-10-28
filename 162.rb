=begin
In the hexadecimal number system numbers are represented using 16 different digits:

0,1,2,3,4,5,6,7,8,9,A,B,C,D,E,F
The hexadecimal number AF when written in the decimal number system equals 10x16+15=175.

In the 3-digit hexadecimal numbers 10A, 1A0, A10, and A01 the digits 0,1 and A are all present.
Like numbers written in base ten we write hexadecimal numbers without leading zeroes.

How many hexadecimal numbers containing at most sixteen hexadecimal digits exist with all of the digits 0,1, and A present at least once?
Give your answer as a hexadecimal number.

(A,B,C,D,E and F in upper case, without any leading or trailing code that marks the number as hexadecimal and without leading zeroes , e.g. 1A3F and not: 1a3f and not 0x1a3f and not $1A3F and not #1A3F and not 0000001A3F)

len 4:   258
len 5:   9928


LEN = len 

Total = 15 * 16**length - 1 // No trailing 0.


Len = 3

Total = 15*16**2 = 3840



Missing 0,1,2: 2197         
Missing 0,1, has 2: 547     
Missing 0,2, has 1: 547
Missing 1,2, has 0: 351
Missing a 0, has 1,2: 84
Missing a 1, has 0,2: 55
Missing a 2, has 1,0: 55



Len = 4
========

Total = 15*16**3 = 61440

Missing 0,1,2: 13**length = 28561


Missing 0,1, has 2:
Missing 0,2  has 1:
  4 2's = (4 choose 4)           = 1
  3 2's = (4 choose 3)*13        = 4 * 13
  2 2's = (4 choose 2)*13*13     = 6 * 13**2
  1 2's = (4 choose 1)*13*13*13  = 4 * 13**3
---------------------------------------------
                                   9855 (x 2)
                                   
                                    

Missing 1,2, has 0:
  3 0's = (3 choose 3)*13        = 13
  2 0's = (3 choose 2)*13*13     = 507
  1 0's = (3 choose 1)*13*13*13  = 6591
---------------------------------------------
                                   7111
                                   

Missing 0, has 1,2: 2354
  sum = 0
  1.upto(length - 1) do |ones|
    (length - ones).downto(1) do |twos|
      sum += nCk(length, ones) * nCk(length - ones,twos) * 13**(length-ones-twos)
    end
  end
  puts sum


Missing a 2, has 1,0: 1723
Missing a 1, has 0,2: 1723

length = 4
sum = 0
1.upto(length - 1) do |zeros|
  (length - zeros).downto(1) do |twos|
    sum += nCk(length - 1, zeros) * nCk(length - zeros,twos) * 13**(length-zeros-twos)
  end
end
puts sum

count = 0
                       




=end
require 'pp'

def fact(n)
  return 1 if n == 0
  return n*fact(n-1)
end

def nCk(n,k)
  return fact(n) / (fact(k)*fact(n-k))
end



def answer(len)
  total = 15*16**(len - 1)  
  total -= 13**len

  sub = 0
  len.downto(1) do |k|
    sub += (nCk(len, k) * 13**(len -k))
  end
  total -= sub*2  

  sub = 0
  (len - 1).downto(1) do |k|
    sub += (nCk(len - 1, k) * 13**(len - k))
  end
  total -= sub

  sub = 0
  1.upto(len - 1) do |ones|
    (len - ones).downto(1) do |twos|
      sub += nCk(len, ones) * nCk(len - ones,twos) * 13**(len-ones-twos)
    end
  end
  total -= sub

  sub = 0
  1.upto(len - 1) do |zeros|
    (len - zeros).downto(1) do |twos|
      sub += nCk(len - 1, zeros) * nCk(len - zeros,twos) * 13**(len-zeros-twos)
    end
  end
  total -= sub*2

end


sum = 0
3.upto(16) do |a|
  v =  answer(a)
  sum += v
  puts "#{a}: #{v}"  
end

puts sum.to_s(16).upcase


