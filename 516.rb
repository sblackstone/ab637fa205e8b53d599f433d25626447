=begin
5-smooth numbers are numbers whose largest prime factor doesn't exceed 5.
5-smooth numbers are also called Hamming numbers.
Let S(L) be the sum of the numbers n not exceeding L such that Euler's totient function φ(n) is a Hamming number.
S(100)=3728.

Find S(1012). Give your answer modulo 232.
=end


require './euler_lib.rb'

@h = HandySieve.fetch(6)

def hamming?(n)
  while n % 2 == 0
    n /=2
  end
  while n % 3 == 0
    n /=3
  end
  while n % 5 == 0
    n /=5
  end
  return n == 1

  
end

sum = 0

1.upto(100) do |k|
  t = @h.totient(k)
  sum += k if hamming?(t)
end

puts sum
