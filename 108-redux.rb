=begin
In the following equation x, y, and n are positive integers.


For n = 4 there are exactly three distinct solutions:

What is the least value of n for which the number of distinct solutions exceeds one-thousand?

NOTE: This problem is an easier version of problem 110; it is strongly advised that you solve this one first.


1     1      n
-  +  -  = 
x     y



n/x + n/y = 1


n + nx/y = x

ny + nx = xy

ny = xy - nx

ny = x(y - n)

x = ny / (y-n)

Let k = y-n
So  y = k+n


x = n(k+n) / k

x = nk + n^2 / k

x = n + n^2/k

=end

require './euler_lib.rb'

@h = HandySieve.fetch(6)


def divisors_of_square(n)
  factorization = Hash.new(0)
  @h.factorize(n).each do |f|
    factorization[f[0]] += 2*f[1]
  end
  @h.divisors(n*n, factorization, &proc)
end


def sols(n)
  d = 0
  divisors_of_square(n) do |k|
    d += 1
  end
  return (d + 1) / 2.0
  
end



n = 1

while sols(n) <= 1000
  puts "#{n} #{sols(n)}"
  n += 1
end

puts n

