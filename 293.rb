=begin
Pseudo-Fortunate Numbers
Problem 293
An even positive integer N will be called admissible, if it is a power of 2 or its distinct prime factors are consecutive primes.
The first twelve admissible numbers are 2,4,6,8,12,16,18,24,30,32,36,48.

If N is admissible, the smallest integer M > 1 such that N+M is prime, will be called the pseudo-Fortunate number for N.

For example, N=630 is admissible since it is even and its distinct prime factors are the consecutive primes 2,3,5 and 7.
The next prime number after 631 is 641; hence, the pseudo-Fortunate number for 630 is M=11.
It can also be seen that the pseudo-Fortunate number for 16 is 3.

Find the sum of all distinct pseudo-Fortunate numbers for admissible numbers N less than 109.
=end

require './euler_lib.rb'


N = 10**9

h = HandySieve.fetch(8)


@admissible = Array.new

@a = Hash.new
@a[2] = Array.new

k = 2
while k < N
  @a[2].push k
  @admissible.push k
  k *= 2
end


last_prime = 2
h.primes do |p|
  next if p == 2
  break unless p**2 < N
  @a[p] = Array.new
  k = p
  while k < N
    @a[last_prime].each do |lpm|
      if lpm*k < N      
        @a[p].push lpm*k 
        @admissible.push lpm*k
      end
    end
    k*= p    
  end
  last_prime = p
end

@fort = Hash.new
pp @admissible.length

@admissible.sort!
@admissible.reverse!

h.primes do |p|
  while !@admissible.empty? and p > (@admissible.last+1)
    #puts "#{@admissible.last}\t#{p}\t #{p - @admissible.last}"
    @fort[p - @admissible.last] = 1
    @admissible.pop
  end
  break if @admissible.empty?
end


pp @admissible.length
puts @fort.keys.inject(:+)