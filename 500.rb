=begin

Problem 500!!!
Problem 500
The number of divisors of 120 is 16.
In fact 120 is the smallest number having 16 divisors.

Find the smallest number with 2500500 divisors.
Give your answer modulo 500500507.




2**(500500) <= (a1 +1)(a2 + 1)(a3+1)


1 2 [[2, 1]]
2 4 [[2, 1], [3, 1]]
3 8 [[2, 3], [3, 1]]
4 16 [[2, 3], [3, 1], [5, 1]]
5 32 [[2, 3], [3, 1], [5, 1], [7, 1]]
6 64 [[2, 3], [3, 3], [5, 1], [7, 1]]
7 128 [[2, 3], [3, 3], [5, 1], [7, 1], [11, 1]]
8 256 [[2, 3], [3, 3], [5, 1], [7, 1], [11, 1], [13, 1]]



=end


require './euler_lib.rb'

@h = HandySieve.fetch(7)

def sigma_0(n)
  @h.factorize(n).map {|x| x[1] + 1 }.inject(:*)
end

def find_smallest(k)
  n = 1 
  while true
    return n if sigma_0(n) == k
    n += 1
  end
end

=begin
1.upto(10) do |i|
  f =  @h.factorize(find_smallest(2**i))
  print "#{i} #{2**i} "
  pp f
end
=end



v = 1

@h.primes_upto(100) do |p|
  v *= p
  break if v > 10**7
  puts "#{p} #{v} #{sigma_0(v)}"  
end


