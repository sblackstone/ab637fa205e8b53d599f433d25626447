=begin
The number 512 is interesting because it is equal to the sum of its digits raised to some power: 5 + 1 + 2 = 8, and 8^3 = 512. Another example of a number with this property is 614656 = 284.

We shall define an to be the nth term of this sequence and insist that a number must contain at least two digits to have a sum.

You are given that a2 = 512 and a10 = 614656.

Find a30.

(x+y)^k = 10x + y


j = x+y

j^k = 10x + y

logj(j^k) = logj(10x + y)

k = logj(10x + y)



(x+y+z)^k = 100x + 10y + z
(w+x+y+z)^k = 1000w + 100x + 10y + z

248155780267521

=end
require 'pp'

MAX      = 10**15
MAX_BASE = Math.sqrt(MAX).round


def digi_sum(n)
  sum = 0
  while n > 0
    sum += n % 10
    n -= n % 10
    n /= 10
  end
  return sum
end


@arr = Array.new

2.upto(MAX_BASE) do |b|
  be = b*b
  k = 2
  while be <= MAX
    if be % 9 == b % 9 and digi_sum(be) == b
      puts "#{b}**#{k} == #{be}"
      @arr.push be
    end
    k += 1
    be = be * b
  end
end

@arr.sort!
@arr.uniq!

pp @arr
pp @arr.size


exit

@count = 1

def test_if_nth_root2(b,n)
  k = 1
  j = b
  while j < n 
    j *= b
    k += 1
  end
  if j == n
    puts "#{@count}: #{n} = #{b}**#{k}"
    @count += 1  
  end
end

def test_if_nth_root(b,n)
  approx = (Math::log(n)/Math::log(b)).to_i - 3
  approx.upto(approx+6) do |j|  
    if b**j == n
      puts "#{@count}: #{n} = #{b}**#{j}"
      @count += 1  
    end
  end
end

i = 10

while true
  ds = digi_sum(i)  
  if ds > 1 and i % ds == 0
    test_if_nth_root(ds, i)
  end
  i += 1
end

  

