=begin
A Modified Collatz sequence
Problem 277
A modified Collatz sequence of integers is obtained from a starting value a1 in the following way:

an+1 = an/3 if an is divisible by 3. We shall denote this as a large downward step, "D".

an+1 = (4an + 2)/3 if an divided by 3 gives a remainder of 1. We shall denote this as an upward step, "U".

an+1 = (2an - 1)/3 if an divided by 3 gives a remainder of 2. We shall denote this as a small downward step, "d".

The sequence terminates when some an = 1.

Given any integer, we can list out the sequence of steps.
For instance if a1=231, then the sequence {an}={231,77,51,17,11,7,10,14,9,3,1} corresponds to the steps "DdDddUUdDD".

Of course, there are other sequences that begin with that same sequence "DdDddUUdDD....".
For instance, if a1=1004064, then the sequence is DdDddUUdDDDdUDUUUdDdUUDDDUdDD.
                                                
In fact, 1004064 is the smallest possible a1 > 106 that begins with the sequence DdDddUUdDD.

What is the smallest a1 > 1015 that begins with the sequence "UDDDUdddDDUDDddDdDddDDUDDdUUDd"?
                                                              



 D   n                0 mod 3
 77 d   (n / 3)          2 mod 3
 51 D   (2*(n/3) - 1)/3  0 mod 3
 17 d   (2*(n/3) - 1)/9  2 mod 3
 11 d   ((2*(2*(n/3) - 1)/9) - 1) / 3
U
U
d
D
D

n/3 if an is divisible by 3. We shall denote this as a large downward step, "D".

an+1 = ((4*n + 2)/3) if an divided by 3 gives a remainder of 1. We shall denote this as an upward step, "U".

an+1 = ((2*n - 1)/3) if an divided by 3 gives a remainder of 2. We shall denote this as a small downward step, "d".


  (1/1)n + (0/1)




0  n/3             D  <=>   n/3 + 0
1  ((4*n + 2)/3)   U  <=>  4n/3 + 2/3
2  ((2*n - 1)/3)   d  <=>  2n/3 - 1/3






{an}={231,77,51,17,11,7,10,14,9,3,1} 



Let n = ax + b


f0(ax + b) = ax/3 + b/3

f1(ax + b) = (4(ax + b) + 2) / 3 = (4ax + 4b + 2) / 3 =      4ax / 3    +   (4b + 2) / 3

f2(ax + b) = (2(ax + b) -1) / 3 = (2ax + 2b - 1) / 3





   N   C

0  /3  /3



Let n = (a+b)


((4*(a+b) + 2)/3) 


(4a + 4b + 2) / 3

= 4/3a + 4/3b + 2



Let n = (a+b)

(2*(a+b) - 1) /3

2a + 2b - 1

2/3a





4194304x  = 21110037246199 mod 205891132094649

ax = b mod n








=end


require './euler_lib.rb'





def gen_formulas(str, n = 0)
  templates = Hash.new
  templates['D'] = [Rational(1,3), Rational(1,3), Rational(0,1)]
  templates['U'] = [Rational(4,3), Rational(4,3), Rational(2,3)]
  templates['d'] = [Rational(2,3), Rational(2,3), Rational(-1,3)]

  puts n

  ncoeff = Rational(1,1)
  ccoeff = Rational(0,1)
  
  str.each_char do |ch|
    ncoeff *= templates[ch][0]
    ccoeff *= templates[ch][1] 
    ccoeff +=  templates[ch][2]
    v = ncoeff*n + ccoeff
    #puts "#{ch}\t#{v}\t#{ncoeff}\t#{ccoeff}"
  end  
  
  return [ncoeff, ccoeff]
end


c = gen_formulas('UDDDUdddDDUDDddDdDddDDUDDdUUDd')


cprime = c[1].numerator * (c[0].denominator / c[1].denominator)


m = c[0].denominator
b = -1*cprime
a = c[0].numerator

puts "#{a}x  = #{b} mod #{m}"


e = extended_gcd(a, m)

s = (e[0] * b) % m

while s < 10**15
  s+= m
end


puts s







exit
def mcollatz(n)
  return if n == 1
  
  if n % 3 == 0
    print "D"
    mcollatz(n/3)    
  elsif n % 3 == 1
    print "U"
    mcollatz( (4*n + 2) / 3 )
  elsif n % 3 == 2
    print "d"
    mcollatz( (2*n - 1) / 3 )  
  end
  
  
end


mcollatz(19914)
puts
puts "DdDddUUdDD"