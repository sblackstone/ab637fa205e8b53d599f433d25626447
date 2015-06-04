=begin
If we calculate a**2 mod 6 for 0 <= a <= 5 we get: 0,1,4,3,4,1.

The largest value of a such that a**2 = a mod 6 is 4.
Let's call M(n) the largest value of a < n such that a**2 = a (mod n).

So M(6) = 4.

Find sum M(n) for 1 <=  n  <= 10**7.

  a**2 - a = nk
  a(a-1) = nk
  
  a(a-1)/2  = nk/2
  

=end


def brute(n)
  0.upto(n-1) do |a|
    if (a**2 % n) == a 
      puts a
    end
    
  end
end




require 'pp'

f = File.open("primes_to_10_7.txt")

@max_prime = 10**7

@primes = Array.new
@prime_map = Hash.new(false)

while (line = f.gets) do
  line.strip!
  num = line.to_i
  break if num > @max_prime
  @primes.push(num)
  @prime_map[num] = true
end
puts "Primes loaded"

@prime_powers = Hash.new(false)

@primes.each do |p|
  1.upto(24) do |e|
    break if p**e > @max_prime
    @prime_powers[p**e] = true
  end
     
end

puts brute(10)
puts
puts brute(100)
puts
puts brute(1000)


exit

puts @prime_powers.size

exit
pp @prime_powers
puts "Powers found"

=begin
1.upto(10) do |n|

end
=end


1.upto(10) do |a|
  nk = a*(a-1)
  1.upto(nk - 1) do |d|
    if nk % d == 0
      n = nk / d
      puts "#{a}**2 = #{a} mod #{n} #{(a**2 % n) == a % n}"
    end
    
  end
  
  puts nk
end

