=begin
Primes with runs
Problem 111
Considering 4-digit primes containing repeated digits it is clear that they cannot all be the same: 1111 is divisible by 11, 2222 is divisible by 22, and so on. But there are nine 4-digit primes containing three ones:

1117, 1151, 1171, 1181, 1511, 1811, 2111, 4111, 8111

We shall say that M(n, d) represents the maximum number of repeated digits for an n-digit prime where d is the repeated digit, N(n, d) represents the number of such primes, and S(n, d) represents the sum of these primes.

So M(4, 1) = 3 is the maximum number of repeated digits for a 4-digit prime where one is the repeated digit, there are N(4, 1) = 9 such primes, and the sum of these primes is S(4, 1) = 22275. It turns out that for d = 0, it is only possible to have M(4, 0) = 2 repeated digits, but there are N(4, 0) = 13 such cases.

In the same way we obtain the following results for 4-digit primes.

Digit, d	M(4, d)	N(4, d)	S(4, d)
0	2	13	67061
1	3	9	22275
2	3	1	2221
3	3	12	46214
4	3	2	8888
5	3	1	5557
6	3	1	6661
7	3	9	57863
8	3	1	8887
9	3	7	48073
For d = 0 to 9, the sum of all S(4, d) is 273700.

Find the sum of all S(10, d).
=end


require './euler_lib.rb'

N = 4

h = HandySieve.fetch(6)



def find_n_digit_prime_with_k_digits_d_and_replacing_c(n,k,d,c, arr = nil, &block)
  arr ||= Array.new(n, d)

  if c.empty?
    return if arr[0] == 0
    v = arr.join.to_i
    yield v if miller(v)
    return
  end
  
  b = c.pop
  
  0.upto(9) do |i|
    next if i == 0 and b == 0
    next if i == d
    arr[b] = i
    find_n_digit_prime_with_k_digits_d_and_replacing_c(n,k,d,c,arr, &block)  
  end
  
  c.push b


end


def find_n_digit_prime_with_k_digits_d(n,k,d, &block)
  (0..(n-1)).to_a.combination(n-k) do |c|
    find_n_digit_prime_with_k_digits_d_and_replacing_c(n,k,d,c, &block)
  end  
end


def sum_of_n_digit_primes_with_k_digits_d(n,k,d)
  s = 0

  find_n_digit_prime_with_k_digits_d(n, k, d) do |p|
    s += p
  end
  return s

end


sum = 0  

0.upto(9) do |digit|
  9.downto(1) do |copies|
    v = sum_of_n_digit_primes_with_k_digits_d(10, copies, digit)
    if v > 0
      puts v
      sum += v
      break
    end
    
  end
  
end


puts "Answer = #{sum}"


















exit




def digits_count(n)
  digits = Hash.new
  while n > 0
    d = n % 10
    n -= d
    n /= 10
    digits[d] ||= 0
    digits[d] += 1
  end  
  digits
end


digits = Hash.new

0.upto(9) do |d|
  digits[d] = { max_repeat: 0, sum: 0 }
end

h.primes do |p|
  next if p < 1000
  break if p >= 10_000
  dc = digits_count(p)
  
  dc.each do |dig, copies|
    if digits[dig][:max_repeat] < copies
      digits[dig][:max_repeat] = copies
      digits[dig][:sum] = p
    elsif digits[dig][:max_repeat]  == copies
      digits[dig][:sum] += p
    end    
  end
end


sum = 0
0.upto(9) do |d|
  sum += digits[d][:sum]
end

puts 
puts "Answer = #{sum}"
