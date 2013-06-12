=begin
How many reversible numbers are there below one-billion?
Problem 145
Some positive integers n have the property that the sum [ n + reverse(n) ] consists entirely of odd (decimal) digits. For instance, 36 + 63 = 99 and 409 + 904 = 1313. We will call such numbers reversible; so 36, 63, 409, and 904 are reversible. Leading zeroes are not allowed in either n or reverse(n).

There are 120 reversible numbers below one-thousand.

How many reversible numbers are there below one-billion (109)?
=end

def all_odd(n)
  while n > 0
    k = n % 10
    if k % 2 == 0
      return false
    end
    n -= k
    n /= 10
  end
  return true
end

def rev(n)
  rev = 0
  while n > 0
    k = n % 10
    rev = (rev + k)*10
    n -= k
    n /= 10
  end
  return rev / 10
end

@count = 0
def num(len)
  i = 1
  while i < 10
    k = i * 10**(len-1)
    j = 2;
    while j < 10
      0.upto(10**(len-2) - 1) do |l|
        m = k + j + (l*10)
        if all_odd(m+rev(m))
          @count += 2
        end
        
      end
      j += 2
    end
    i += 2;
  end
end

num(2)
num(3)
num(4)
num(5)
num(6)
num(7)
num(8)
puts @count


=begin
def all_odd(n)
  while n > 0
    k = n % 10
    if k % 2 == 0
      return false
    end
    n -= k
    n /= 10
  end
  return true
end

def digits(n)
  return Math.log10(n).floor + 1
end

@ten_k = Array.new(101)
@ten_k[0] = 1
1.upto(100) do |i|
  @ten_k[i] = @ten_k[i-1]*10
end

def first_digit(n)
  #d = 10**(digits(n) - 1)
  d = @ten_k[n.to_s.size - 1]
  (n - (n % d)) / d
end


def rev(n)
  rev = 0
  while n > 0
    k = n % 10
    rev = (rev + k)*10
    n -= k
    n /= 10
  end
  return rev / 10
end

count = 0
10.upto(10**6) do |i|
  next if i % 10 == 0 || i % 2 == 0
  next if ((i % 10) + first_digit(i)) % 2 == 0
  #rev_i = i.to_s.reverse.to_i
  rev_i = rev(i)
  sum = i + rev_i
  if all_odd(sum)
    count += 1
    puts "#{i} #{rev_i}"
  end
end

puts count
=end