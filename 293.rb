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


@p = [2, 3, 5, 7,11,13,17,19,23,29]

def search(idx, cur, &proc)
  prime = @p[idx]  
  while true
    cur *= prime
    break if cur > 10**9
    yield cur
    search(idx+1, cur, &proc)
  end  
end


@a = Array.new

search(0,1) do |a|
  @a.push a
end

@a.sort!

@ans = Array.new

p = @a.first + 1

while !@a.empty?
  if miller(p)
    while !@a.empty? and  (p - @a.first)  > 1
      #puts "#{@a.first} #{p} #{p - @a.first}"
      @ans.push p - @a.shift
    end
    break if @a.empty?       
    p = @a.first + 2
    if (p % 2 == 0)
      p += 1
    end
  end
  p += 2  
end

pp @ans.sort.uniq.inject(:+)

#pp @ans






