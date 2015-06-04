=begin
We can easily verify that none of the entries in the first seven rows of Pascal's triangle are divisible by 7:

 	 	 	 	 	 	 1
 	 	 	 	 	 1	 	 1
 	 	 	 	 1	 	 2	 	 1
 	 	 	 1	 	 3	 	 3	 	 1
 	 	 1	 	 4	 	 6	 	 4	 	 1
 	 1	 	 5	 	10	 	10	 	 5	 	 1
1	 	 6	 	15	 	20	 	15	 	 6	 	 1

However, if we check the first one hundred rows, we will find that only 2361 of the 5050 entries are not divisible by 7.

Find the number of entries which are not divisible by 7 in the first one billion (109) rows of Pascal's triangle.

=end

def fact(n)
  return n == 0 ? 1 : n * fact(n-1)
end

def nCk(n,k)
  fact(n) / (fact(k) * fact(n-k))
end

=begin
0.upto(100) do |n|
  
  print "#{n}:\t "
  count = 0
  0.upto(n) do |k|
  if nCk(n,k) % 7 == 0
    #print " X " 
    count += 1
  else
    #print " - "
  end
  #print " #{nCk(n,k)} "
  end
  print "c = #{count}"
  puts
end
exit
=end

=begin

From Lucas' Theorem

http://www.math.hmc.edu/funfacts/ffiles/30002.4-5.shtml

Fun Corollary: If p is prime and N has base p representation (aj,...,a1,a0), 
then there are exactly (1+aj)...(1+a1)(1+a0) values of k for which (N CHOOSE k) is NOT a multiple of p. This is the number of non-multiples of p in the N-th row of
=end

def alt(n)
  return @vp_cache[n] if @vp_cache[n] 
  tmp = n
  result = 1
  while (tmp != 0)
    result *= ((tmp % 7) + 1)
    tmp = tmp / 7
  end
  @vp_cache[n] = result
end


count = 0
0.upto(10**9) do |n|
  count += alt(n)
end

puts count



exit



1.upto(100) do |n|
  0.upto(n) do |k|

  end
end





=begin
Primes.setup(100)


Primes.primes.each do |p|
  puts "#{p}: #{vp(5, p)}"
end

=end