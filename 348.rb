=begin

Sum of a square and a cube
Problem 348
Many numbers can be expressed as the sum of a square and a cube. Some of them in more than one way.

Consider the palindromic numbers that can be expressed as the sum of a square and a cube, both greater than 1, in exactly 4 different ways.
For example, 5229225 is a palindromic number and it can be expressed in exactly 4 different ways:

22852 + 203
22232 + 663
18102 + 1253
11972 + 1563

Find the sum of the five smallest such palindromic numbers.

a^2 + b^3 = n


n - b^3 = a^2

n - a^2 = b^3






=end


require './euler_lib.rb'


@squares = Hash.new
@cubes   = Array.new


0.upto(10**6) do |k|
  @squares[k*k] = true
  @cubes.push k*k*k
end


def reverse(n)
  v = 0

  while n > 0
    d  = n % 10
    v += d
    v *= 10
    n -= d
    n /= 10    
  end
  
  return v / 10  
end


def palindomic(length, &proc)
  if length == 1
    0.upto(9) do |pal|
      yield pal
    end
    return
  end  
  if length % 2 == 0
    start = 10**((length / 2) - 1)
    stop  = 10**(length / 2) - 1    
    
    start.upto(stop) do |k|
      yield (k * 10**(length / 2)) + reverse(k)
    end
  else
    start = 10**(((length - 1) / 2) - 1)
    stop  = 10**((length - 1) / 2) - 1

    start.upto(stop) do |k|
      0.upto(9) do |m|
        yield ((k * 10) + m) * 10**(length / 2) + reverse(k)
      end
    end
  end  
end


def test(n)
  count = 0  
  @cubes.each do |c|
    break if c > n
    if @squares[n - c]
      count += 1
    end    
  end
  return count
end


length = 1
count  = 0
examples = []

while true
  puts "Length = #{length}"
  palindomic(length) do |pal|
    if test(pal) == 4
      examples.push pal
      count += 1
      break if count == 5
    end    
  end
  break if count >= 5
  length += 1
end

pp examples
pp examples.inject(:+)




