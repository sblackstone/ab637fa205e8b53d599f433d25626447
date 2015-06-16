=begin
Numbers for which Euler’s totient function equals 13!
Problem 248
The first number n for which φ(n)=13! is 6227180929.

Find the 150,000th such number.

13! 6227020800

6227180929 = 65529 * 93601


13! = n * (1-1/pa) * (1-1/pb) * (1-1/pc)

n | 13!


phi(n) = (p1^k - p1^(k-1))(p2^l - p2^(l-1))

13! = (p1^k - p1^(k-1)) * (p2^l - p2^(l-1))



phi(n) = 20

25: phi(25) = phi(5^2) = 5^2 - 5^1 
33: phi(11)*phi(3) = 10*2 
44: phi(11)*phi(4) = 10*2 
50: phi(5^2)*phi(2) 
66: phi(11)*phi(6) = phi(11)*phi(2)*phi(3) = 10*1*2 


Divisors 1, 2, 4, 5, 10, 20









=end


require './euler_lib.rb'

=begin
def big_tot(n)
  h = HandySieve.fetch(7)
  t   = n
  tot = n
  h.primes do |p|
    if n % p == 0
      tot *= p-1
      tot /= p
      while t % p == 0
        t /= p
      end      
    end    
    break if t == 1
  end
  tot
end

n = fact(13)
chains = [big_tot(n)]
while chains.last > 1
  chains.push big_tot(chains.last)
end

pp chains.length
pp 2*3**(chains.length - 13)


exit


fact_13     = fact(13)
fact_13_tot = fact_13 

h.primes_upto(13) do |p|
  fact_13_tot *= (p-1)
  fact_13_tot /= p
end

puts fact_13_tot
   



exit

=end



h = HandySieve.fetch(7)


1.upto(200) do |i|
  if h.totient(i) == 20 
    puts i
  end
end


exit
@stuff = Array.new
h.divisors(20) do |d|
  if miller(d+1)
    @stuff.push d
  end
end



pp @stuff.sort


=begin


exit
h.divisors(60) {|x| pp x}
exit


@factors = Hash.new(0)

2.upto(13) do |i|
  h.factorize(i).each do |f|
    @factors[f[0]] += f[1]
  end
  
end

#pp @factors


def all_divisors(cur_dig = 1, cur_prod = 1, &proc)
  if cur_dig == 13
    yield cur_prod
  else  
    @factors.each do |p, e|
      if p > cur_dig
        0.upto(e) do |k|
          cur_prod *= p**k
          all_divisors(p, cur_prod, &proc)
          cur_prod /= p**k
        end      
        break    
      end
    end
  end    
end


@pm1_divides = Array.new

all_divisors do |d|
  if miller(d+1)
    @pm1_divides.push(d+1)
  end
  
end


pp @pm1_divides

=end



