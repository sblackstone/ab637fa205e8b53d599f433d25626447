=begin
Number Rotations
Problem 168
Consider the number 142857. We can right-rotate this number by moving the last digit (7) to the front of it, giving us 714285.
It can be verified that 714285=5×142857.
This demonstrates an unusual property of 142857: it is a divisor of its right-rotation.

Find the last 5 digits of the sum of all integers n, 10 < n < 10100, that have this property.


 ((n - (n % 10)) / 10) + 10**(5) * (n % 10)

 or
 
  (((n - (n mod 10)) / 10) + 10**(floor(log10(n))) * (n mod 10)) 
  
  
  
  
  dabc = k * abcd 
  
  
  
CASE N % 10:


0 -  The rotated number would be smaller than the original, cannot be 0.
1 -  Works 142857
2 -  Works 205128



=end


require 'pp'

#return ((n - (n % 10)) / 10) + (10**((Math.log(n) / Math.log(10)).floor) * (n % 10))


def rotate(n)
  digits = (Math.log(n) / Math.log(10)).floor + 1

  
  return ((n - (n % 10)) / 10) + 10**(digits - 1) * (n % 10)


#  k = n % 10
#  n -= k
#  n /= 10
#  n += (10**(digits-1) * k)
#  return n
end






10.upto(10**8) do |i|
  r = rotate(i) 
  if r % i == 0 and r.to_s.split("").uniq.length > 1
    puts "#{i} #{r} #{r / i.to_f}"
  end
  
end
