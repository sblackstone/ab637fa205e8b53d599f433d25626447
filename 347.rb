=begin

Largest integer divisible by two primes
Problem 347
The largest integer ≤ 100 that is only divisible by both the primes 2 and 3 is 96, as 96=32*3=2^5*3. 

For two distinct primes p and q let M(p,q,N) be the largest positive integer ≤N only divisible by both p and q and M(p,q,N)=0 if such a positive integer does not exist.

E.g. M(2,3,100)=96.
M(3,5,100)=75 and not 90 because 90 is divisible by 2 ,3 and 5.
Also M(2,73,100)=0 because there does not exist a positive integer ≤ 100 that is divisible by both 2 and 73.

Let S(N) be the sum of all distinct M(p,q,N). S(100)=2262.

Find S(10 000 000).

=end

require './euler_lib.rb'

h = HandySieve.fetch(7)


def find_max(p,q,n)
  max_a = Math::log(n, p).ceil
  max_b = Math::log(n, q).ceil
  max = 0
  1.upto(max_a) do |a|
    r = p**a
    1.upto(max_b) do |b|
      r *= q
      if r <= n and r > max
        max = r
      end      
    end
  end
  max
end


N = 10000000

sum = 0

h.primes_upto(N) do |p|
  h.primes_upto(N) do |q|
    break if p*q > N
    next if q <= p
    max = find_max(p,q, N)
    sum += max
    #puts "#{p},#{q},#{max}" if max > 0
  end

end

puts "Total = #{sum}"
