=begin
The number 7 is special, because 7 is 111 written in base 2, and 11 written in base 6 
(i.e. 710 = 116 = 1112). In other words, 7 is a repunit in at least two bases b > 1.

We shall call a positive integer with this property a strong repunit. It can be verified that there are 8 strong repunits below 50: {1,7,13,15,21,31,40,43}. 
Furthermore, the sum of all strong repunits below 1000 equals 15864.

Find the sum of all strong repunits below 1012.


a = b1^i + b1^(i-1) + b1^(i-2) ... + 1
a = b2^j + b2^(j-1) + b2^(j-2) ... + 1
 
 - OR -
 

n + 1 = a^i  
n + 1 = b^j 

 
 
=end

require 'pp'


def calc_total(h)
  total = 0
  @h.each do |k,v|
    if v > 1
      puts k
      total += k 
    end
  end
  total
end

def brute(max)
  @h = Hash.new(0)
  2.upto(max) do |base|
    1.upto(max) do |exp|
      value = (base**exp - 1) / (base - 1)
      break if value > max
      @h[value] += 1
    end
  end
  calc_total(@h)  
end

puts brute(10**3)