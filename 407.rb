=begin
If we calculate a**2 mod 6 for 0 <= a <= 5 we get: 0,1,4,3,4,1.

The largest value of a such that a**2 = a mod 6 is 4.
Let's call M(n) the largest value of a < n such that a**2 = a (mod n).

So M(6) = 4.

Find sum M(n) for 1 <=  n  <= 10**7.

If n = p^k, then M(n) = 1


a**2 = a mod n
a**2 - a = 0 mod n
a(a-1) = 0 mod n

a(a-1) = nk


n = 3 * 2



brute(6) = 4

   0 1 
-------
0| 0 0 
1| 0 1 


   0 1 2 
--------
0| 0 0 0  
1| 0 1 2 
2| 0 2 1 


           0     1     2     3     4     5

         (0,0) (0,1) (0,2) (1,0) (1,1) (1,2)

0 (0,0)  (0,0) (0,0) (0,0) (0,0) (0,0) (0,0)
1 (0,1)  (0,0) (0,1) (0,2) (0,0) (0,1) (0,2)  
2 (0,2)  (0,0) (0,2) (0,4) (0,0) (0,2) (0,4)
3 (1,0)  (0,0) (0,0) (0,0) (1,0) (1,0) (1,0)
4 (1,1)  (0,0) (0,1) (0,2) (1,0) (1,1) (1,2)
5 (1,2)  (0,0) (0,2) (0,4) (1,0) (1,2) (1,4)




   0 1 2 3 4 5
--------------
0| 0 0 0 0 0 0
1| 0 1 2 3 4 5
2| 0 2 4 0 2 4
3| 0 3 0 3 0 3
4| 0 4 2 0 4 2
5| 0 5 4 3 2 1





Z/6Z = Z/2Z * Z/3Z






6: 4     6  = 3*2    4 = 2*2
10: 6    10 = 5*2    6 = 3*2  
14: 8
15: 10
21: 15
22: 12


e(e-1) = n*k

A start: You can figure it out! Let us start with a product mn of relatively prime integers, neither equal to 1. 
By the Chinese Remainder Theorem, there is an x such that x≡0(modm) and x≡1(modn). Then x2≡x(modmn).

22 = 11 * 2

x = 1 mod 11
x = 0 mod  2

x = 11t + 1
x = 2 q
2x = 11t + 2q





=end
require './euler_lib.rb'

h = HandySieve.fetch(6)
pp h.prime_power? 2
pp h.prime_power? 4

pp h.prime_power? 3
pp h.prime_power? 9
pp h.prime_power? 27



#h = HandySieve.new(10**8)

#File.open('/tmp/handy_sieve', 'w') {|f| f.write(Marshal.dump(h)) }
