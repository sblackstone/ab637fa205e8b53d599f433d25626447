=begin

Investigating progressive numbers, n, which are also square
Problem 141
A positive integer, n, is divided by d and the quotient and remainder are q and r respectively. In addition d, q, and r are consecutive positive integer terms in a geometric sequence, 
but not necessarily in that order.

For example, 58 divided by 6 has quotient 9 and remainder 4. It can also be seen that 4, 6, 9 are consecutive terms in a geometric sequence (common ratio 3/2).
We will call such numbers, n, progressive.

Some progressive numbers, such as 9 and 10404 = 102^2, happen to also be perfect squares.
The sum of all progressive perfect squares below one hundred thousand is 124657.

Find the sum of all progressive perfect squares below one trillion (1012).

a < b < c

n^2 = bc + a
n^2 = ac + b <=> n^2 = b(b+1) <=> because b(b+1) is never a square, this can't occur.
n^2 = ab + c <=> n^2 is evenly divisble by b which can't happen...



576081.0
81
360
1600

=====

10**5  = 124657
10**6  = 700738
10**7  = 14253190
10**8  = 171436696
10**9  = 623708737
10**10 = 21630503507
10**11 = 64431087395
10**12 = 878454337159
-----------------



n^2 = bc + a

a*c = b**2

n^2 = sqrt(ac)c + a



b^2 = 0 mod a
b^2 = 0 mod c

n^2 = bc + a





=end



require './euler_lib.rb'
require 'pp'

MAX = 10**5


@squares = Hash.new
@cubes   = Hash.new

2.upto(Math.sqrt(MAX)) do |i|
  @squares[i*i] = i
  @cubes[i*i*i] = i
end


# a + a^2r^3 = 10404
# a^2 * r^3 = n - a

@h = HandySieve.fetch(7)

def divisors_of_square(n)
  factorization = Hash.new(0)
  @h.factorize(n).each do |f|
    factorization[f[0]] += 2*f[1]
  end
  @h.divisors(n*n, factorization, &proc)
end

sum = 0

@squares.each do |b2, b|
  divisors_of_square(b) do |c|
    if b < c
      n = b*c + (b2 / c)
      if @squares[n] and n < MAX
        a = b2 / c
        puts "#{n} #{a} #{b} #{c}" 
        sum += n
      end
    end
  end  
end

puts sum

