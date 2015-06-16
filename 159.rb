=begin

Digital root sums of factorisations
Problem 159
A composite number can be factored many different ways. For instance, not including multiplication by one, 24 can be factored in 7 distinct ways:

24 = 2x2x2x3
24 = 2x3x4
24 = 2x2x6
24 = 4x6
24 = 3x8
24 = 2x12
24 = 24
Recall that the digital root of a number, in base 10, is found by adding together the digits of that number, and repeating 
that process until a number is arrived at that is less than 10. Thus the digital root of 467 is 8.

We shall call a Digital Root Sum (DRS) the sum of the digital roots of the individual factors of our number.
The chart below demonstrates all of the DRS values for 24.

Factorisation	Digital Root Sum
2x2x2x3
9
2x3x4
9
2x2x6
10
4x6
10
3x8
11
2x12
5
24
6
The maximum Digital Root Sum of 24 is 11.
The function mdrs(n) gives the maximum Digital Root Sum of n. So mdrs(24)=11.
Find ∑mdrs(n) for 1 < n < 1,000,000.






=end

@dig_root_cache = Hash.new

def dig_root(n)
  @dig_root_cache[n] ||= do_dig_root(n)
end


def do_dig_root(n)
  return n if n < 10
  r = n % 10
  n = (n - r) / 10
  return dig_root(r + dig_root(n))
end


1.upto(1_000_000) do |i|
  dig_root(i)
end

@dig_root_cache = @dig_root_cache.sort_by {|key,value| value }.reverse


@dig_root_fact_sum = Hash.new


def dig_root_fact_sum(n)
  @dig_root_fact_sum[n] ||= do_dig_root_fact_sum(n)
end

def do_dig_root_fact_sum(n)
  return 0 if n == 1
  @dig_root_cache.each do |k,v|
    if n % k == 0
      t = 0
      while n % k == 0
        t += k 
        n /= k
      end          
      return t + dig_root_fact_sum(n)
    end    
  end 
end


count = 0

2.upto(999_999) do |i|
  puts "#{i}"
  count += dig_root_fact_sum(i)
end

puts count


