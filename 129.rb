=begin

Previous	
Next
Repunit divisibility
Problem 129
A number consisting entirely of ones is called a repunit. We shall define R(k) to be a repunit of length k; for example, R(6) = 111111.

Given that n is a positive integer and GCD(n, 10) = 1, it can be shown that there always exists a value, k, for which R(k) is divisible by n, and let A(n) be the least such value of k; for example, A(7) = 6 and A(41) = 5.

The least value of n for which A(n) first exceeds ten is 17.

Find the least value of n for which A(n) first exceeds one-million.



Using the pigeon-hole principle it can be easily shown that for each n and b such that n and b are relatively prime there exists a repunit in base b that is a multiple of n. 

To see this consider repunits R1(b),...,Rn(b). 

Assume none of the Rk(b) is divisible by n. 

Because there are n repunits but only n-1 non-zero residues modulo n there exist two repunits Ri(b) and Rj(b) with 1≤i<j≤n such that Ri(b) and Rj(b) have the same residue modulo n. 

It follows that Rj(b) - Ri(b) has residue 0 modulo n, i.e. is divisible by n. 

Rj(b) - Ri(b) consists of j - i ones followed by i zeroes. 

Thus, Rj(b) - Ri(b) = Rj-i(b) x bi . 

Since n divides the left-hand side it also divides the right-hand side and since n and b are relative prime n must divide Rj-i(b) contradicting the original assumption.


# 1     [ 1 ]



# 11    [ 1, 11 ]
# 111   [ 1, 3, 37, 111 ]
# 1111  [ 1, 11, 101, 1111 ]
# 11111 [ 1, 41, 271, 11111 ]


11   = 10 + 1
111  = 10 * (10+1) + 1
1111 = 10 * (10 * (10+1) + 1) + 1

1 -> 11, add 10
11 -> 111, add 100
111 -> 1111, add 1000


11 + 10**1 + 10**2 + 10**3


r(5) =  10**0 + 10**1 + 10**2 + 10**3 + 10**4


10(10**-1 + 10 + 10**2 + 10**3)


(10**k - 1)
-----------
     9
     

j(10**k - 1) / 9 = n

j(10)     
     
     

9n divides (10**k - 1)


9n * j = (10**k - 1)



r(j) 

=end


require './euler_lib.rb'

def a(n)
  k = 1
  r = (10**k - 1) 
#  while r % n > 0
  while k < 50

    k += 1
    r = (10**k - 1)/9
    puts "#{n}\t#{k}\t#{r % n}"
  end        
  k
end

puts a(27)

exit
puts a2(27)

exit

s = 0

1.upto(50) do |i|

  if i % 2 > 0 and i % 5 > 0
    v = a(i)
    
    puts "#{i}: #{v}" 
    s += v
  end
end

puts "Total = #{s}"
