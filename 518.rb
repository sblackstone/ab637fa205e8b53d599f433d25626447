=begin
Prime triples and geometric sequences
Problem 518
Let S(n) = a+b+c over all triples (a,b,c) such that:

a, b, and c are prime numbers.
a < b < c < n.
a+1, b+1, and c+1 form a geometric sequence.
For example, S(100) = 1035 with the following triples:

(2, 5, 11), (2, 11, 47), (5, 11, 23), (5, 17, 53), (7, 11, 17), (7, 23, 71), (11, 23, 47), (17, 23, 31), (17, 41, 97), (31, 47, 71), (71, 83, 97)

Find S(108).


(b+1)**2 = (a+1)(c+1)


b**2 + 2b + 1 = ac + a + c + 1

b**2 + 2b - ac - a - c = 0

(2,5,11)


The prime factors of (b+1)**2 are distributed between (a+1) and (c+1)

b = 5

(b+1)^2 = 36


a+1 = 3
c+1 = 12


(b+1)     (c+1)
-----  = ------
(a+1)     (b+1)



(b+1)
-----
(a+1)


=end







require './euler_lib.rb'

count = 0

@h = HandySieve.fetch(6)


def divisors_of_square(n)
  factorization = Hash.new(0)
  @h.factorize(n).each do |f|
    factorization[f[0]] += 2*f[1]
  end
  @h.divisors(n*n, factorization, &proc)
end

LIMIT = 10**5

@h.primes_upto(LIMIT) do |b|
  b1 = (b+1)
  @h.divisors_of_square(b+1) do |a1|
    next unless a1 < b1
    a = a1 - 1
    if @h.prime?(a)
      c1 = b1*b1 / a1
      c = c1 - 1
      if @h.prime?(c) and  b < c and c < LIMIT
        #puts "#{a} #{b} #{c}"
        count += a+b+c
      end
      
    end
    
  end
  
end

puts count






























exit



exit

@h.primes_upto(100) do |a|
  @h.primes_upto(100) do |b|
  next if b <= a
    @h.primes_upto(100) do |c|
    next if c <= b
   
    if b*b + 2*b - a*c - a - c == 0
      count += a+b+c
      puts "#{a} #{b} #{c}"
    end
    
=begin
      a1 = a + 1
      b1 = b + 1
      c1 = c + 1
      r = b1 / a1.to_f
      if b1*b1 == c1*a1
        count += a+b+c
        puts "#{a} #{b} #{c}"
      end
=end
    end
  end
end

puts count