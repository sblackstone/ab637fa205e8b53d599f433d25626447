=begin
Harshad Numbers
Problem 387
A Harshad or Niven number is a number that is divisible by the sum of its digits. 
201 is a Harshad number because it is divisible by 3 (the sum of its digits.) 
When we truncate the last digit from 201, we get 20, which is a Harshad number. 
When we truncate the last digit from 20, we get 2, which is also a Harshad number. 
Let's call a Harshad number that, while recursively truncating the last digit, always results in a Harshad number a right truncatable Harshad number.

Also: 
201/3=67 which is prime. 
Let's call a Harshad number that, when divided by the sum of its digits, results in a prime a strong Harshad number.

Now take the number 2011 which is prime. 
When we truncate the last digit from it we get 201, a strong Harshad number that is also right truncatable. 
Let's call such primes strong, right truncatable Harshad primes.

You are given that the sum of the strong, right truncatable Harshad primes less than 10000 is 90619.

Find the sum of the strong, right truncatable Harshad primes less than 1014.

211
271
277

=end
require './primes.rb'
Primes.setup(10_000)

def trunc(n)
  return (n - (n % 10)) / 10
end

def sum_of_digits(n)
  return n if n < 10
  return (n%10) + sum_of_digits(trunc(n))
end

def is_harshad?(n)
  return n % sum_of_digits(n) == 0
end

def right_trunc_harshad?(n)
  return true  if n < 10
  return false unless is_harshad? n
  return right_trunc_harshad? trunc(n)
end

def strong_right_trunc_harshad?(n)
  return false unless right_trunc_harshad?(n)
  return Primes.isPrime? n / sum_of_digits(n)
end



def test1
  sum = 0
  Primes.primes.each do |p|
    if p > 10 and strong_right_trunc_harshad? trunc(p)
      puts "#{p}" 
      sum += p    
    end
  end
  puts sum
end


def miller(n)
  return false if n < 2
  return true  if n < 4
  return false if n % 2 == 0
  d = (n-1)
  s = 0
  while (d % 2 == 0) 
    s +=1
    d /= 2
  end
  [2,3,5,7,11,13,17,19,23].each do |a|
    x = ModMath.pow(a,d,n)
    next if x == 1 or x == (n - 1) or n == a
    skip = false
    1.upto(s-1) do |k|
      x = x*x % n
      if x == 1
        return false
      elsif x == (n - 1)
        skip = true
        break
      end
    end
    next if skip
    return false
  end
  return true
  
end






def harshad_tree(n, &proc)
  return if n > 10**14
  return unless is_harshad? n
  0.upto(9) do |i|
    if miller(n*10+i) and n*10+i < 10**14 and miller(n / sum_of_digits(n))
      yield n*10+i
    end
  end
  0.upto(9) do |i|
    harshad_tree(n*10+i, &proc)
  end
end

s = 0
1.upto(9) do |k|
  harshad_tree(k) do |r|
    s+= r
  end
end

puts s



