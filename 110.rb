=begin
In the following equation x, y, and n are positive integers.


For n = 4 there are exactly three distinct solutions:

What is the least value of n for which the number of distinct solutions exceeds one-thousand?

NOTE: This problem is an easier version of problem 110; it is strongly advised that you solve this one first.


1/x + 1/y = 1/n


n/x + n/y = 1

n + nx/y = x
ny + nx = xy

n(x+y) = xy

n = xy / (x+y)
n(x+y) = xy

nx + ny = xy



xy must be some multiple of n <=> n = k*xy
xy must be greater than n <=> k > 1


===== SOOOO

y =  nx / (x - n) 
x =  ny / (y - n)

=====

x = k*m*(m+n)
y = k*n*(m+n)





=end


require 'pp'

require './primes.rb'

Primes.setup(4_000_000)


@pdivisors = Array.new(4_000_000)

0.upto(4_000_000) {|i| @pdivisors[i] = Array.new }

Primes.primes.each do |p|
  pk = p
  break if p > 4_000_000
  while pk < 4_000_000
    @pdivisors[pk].push p
    pk += p
  end
end


def sigma_n(n)
  sum = 1
  @pdivisors[n].each do |p|
    tn = n
    k = 0
    while tn % p == 0
      tn /= p
      k += 1
    end
    sum *= (k + 1)  
  end
  sum
end


# http://answers.yahoo.com/question/index?qid=20101205221817AA9vNp7
# this function calculates number of divisors in n squared.
def sigma_n2(n)
  sum = 1
  @pdivisors[n].each do |p|
    tn = n
    k = 0
    while tn % p == 0
      tn /= p
      k += 1
    end
    sum *= (2*k + 1)  
  end
  sum
end



def solutions(n)
  (sigma_n2(n) + 1) / 2
end


i = 2
while true
  v = solutions(i)
  puts i
  if v >= 4_000_000
    puts "#{i}: #{v}"
    exit
  end
  i += 1
end
