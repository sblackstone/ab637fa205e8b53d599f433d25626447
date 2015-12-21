=begin

Singleton difference
Problem 136
The positive integers, x, y, and z, are consecutive terms of an arithmetic progression.
 Given that n is a positive integer, the equation, x2 − y2 − z2 = n, has exactly one solution when n = 20:

13**2 − 10**2 − 7**2 = 20

In fact there are twenty-five values of n below one hundred for which the equation has a unique solution.

How many values of n less than fifty million have exactly one solution?


x**2 - y**2 - z**2 = n


(x+y)(x-y) = n - z^2







y = (x-a)


x**2 - (x-a)**2 - (x-2a)**2 = n


(x - a)(x - 5a)

x**2 -5ax - -ax + 5a**2 = -n

x**2 - 6ax + 5a**2 = -n



x^2 - 6ax + 5a^2 = -n


a = 1
b = -6a
c = (5a^2 + n)



(6a + sqrt(36a**2 - 4(5a^2 + n))) / 2



6a + sqrt(36a**2 - 20a**2 + 4n)

6a + sqrt(16a**2 + 4n)

6a + sqrt(4(4a^2 +n))
6a + 2*sqrt(4a^2 + n) / 2


===>   X = 3a +- sqrt(4a^2 + n)   <===

So for given N, how many values of 4a^2 + n are perfect...


4a^2 - n = y^2


4a^2 - y^2 = n





===== NEW THOUGHTS ====

x**2 - y**2 - z**2 = n


z = y + ( x - y)


x**2 - y**2 - z**2 = n


z = y - (x-y)




x**2 - y**2 = n - x^2 + 4xy - 4y^2

n = 4xy - 5y^2

n = y*(4*x - 5*y)




x = 10

y > (10 - y)
y > 5

y > (11 - y)






=end
require 'pp'

@total = 0

@sols = Hash.new(0)
1.upto(10_000) do |x|
  fourx = 4*x
  ((x/2.0).ceil).upto(x) do |y|
    break if fourx < 5*y
    next unless y > (x-y)
    s = y*(fourx - 5*y)
    @total += 1 if @sols[s] == 0 and s < 50_000_000
    @total -= 1 if @sols[s] == 1 and s < 50_000_000
    @sols [s] += 1 
  end  
end

puts @total
exit





