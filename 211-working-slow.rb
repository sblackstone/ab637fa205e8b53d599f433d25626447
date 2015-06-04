=begin

Divisor Square Sum
Problem 211
For a positive integer n, let σ2(n) be the sum of the squares of its divisors. For example,

σ2(10) = 1 + 4 + 25 + 100 = 130.
Find the sum of all n, 0 < n < 64,000,000 such that σ2(n) is a perfect square.


# 1922364685 is correct answer.

=end

require 'pp'

def sigma2_brute(n)
  sum = 0
  1.upto(n) do |i|
    sum += i**2 if n % i == 0
  end
  sum
end


=begin
1.upto(1000) do |i|
   s = sigma2_brute(i)
   v = Math.sqrt(s)
   if v == v.round
     puts "#{i}: #{v}"
   end
     
end

exit
=end

SIZE = 64_000_000

@nums = Array.new(SIZE+1)
@sigm = Array.new(SIZE+1, 1)

1.upto(SIZE) do |i| 
  @nums[i] = i 
end  

i = 2

while true
  while @nums[i] == 1
    i += 1
  end
  #puts "#{i} - #{@nums[i]}"

  break if i >= SIZE
  #puts i
  k = 1
  while i*k < SIZE
    j = 0
    while @nums[i*k] % i == 0
      @nums[i*k] /= i
      j += 1
    end    
    @sigm[i*k] *= i**(2*j + 2) / (i**2  - 1)
    #puts "#{i*k} has #{j} #{i}"      
    k += 1
  end
  
end


total = 0

1.upto(SIZE-1) do |i|
  v = @sigm[i]
  unless v.nil?
    vs = Math.sqrt(v)
    if vs == vs.round
      puts "#{i}: #{v}" 
      total += i
    end
  end
end


puts total