=begin




f(n) = n(n+1)2 = sum of numbers from 1 to n


9*10  + 8*9 + 8*7+ 7*6 + 6*5 + 5*4 + 4*3 + 3*2 + 2*1 
----------------------------------------------------
                     2
                     
                     
Increasing Case:

1  9*10/2 = f(9)   
2  8*9 /2 = f(8)
3  7*8/2  = f(7)
4  6*7/2  = f(6)
5  5*6/2  = f(5)
6  4*5/2  = f(4)
7  3*4/2  = f(3)
8  2*3/2  = f(2)
9  2*1/2  = f(1)

Decreasing Case

1. 2*3/2  = f(2)
2. 3*4/2  = f(3)
3. 4*5/2  = f(4)
4. 5*6/2  = f(5)
5. 6*7/2  = f(6)
6. 7*8/2  = f(7)
7. 8*9/2  = f(8)
8. 9*10/2 = f(9)
9. 10*11/2 = f(10)

Duplicates -

9
------

=end


require 'pp'

def bouncy?(n)
  return false if n < 100
  last = n % 10
  n /= 10
  dir  = nil
  up   = false
  down = false
  (Math::log10(n).floor + 1).times {
    cur = n % 10
    up = true if last < cur
    down = true if last > cur
    return true if (up && down)
    last = cur
    n /= 10
  }
  return (false)
end

c= 0
1.upto(999_999) do |n|
  c+= 1 if bouncy?(n)
end
puts c
puts 999_999 - c
#exit
puts "*" * 50


def sum(n)
  return(n*(n+1) / 2)
end

def inc
  c = 0
  1.upto(9) do |i|
    c += sum(i)
  end
  return c
end

def dec
  c = 0
  2.upto(10) do |i|
    c += sum(i)
  end
  return c
end

tracker = Hash.new

def factory
  { increasing: Array.new(11,0), 
    decreasing: Array.new(11,0),
         dupes: 0
  }
end

def val(stuff)
  count = 100
  count += stuff[:increasing].inject(&:+) 
  count += stuff[:decreasing].inject(&:+)
  count -= stuff[:dupes]
end



tracker[0] = tracker[1] = tracker[2] = factory

tracker[3] = factory


1.upto(9) do |n|
  tracker[3][:increasing][n] = sum(n)
end
2.upto(10) do |n|
  tracker[3][:decreasing][n] = sum(n)
end
tracker[3][:dupes] = 9

puts 10**3 - val(tracker[3])
4.upto(8) do |digits|
  tracker[digits] = Marshal.load(Marshal.dump(tracker[digits-1]))
  1.upto(9) do |n|
    tracker[digits][:increasing][n] = tracker[digits][:increasing][n] * (9-n)
  end
  2.upto(10) do |n|
    tracker[digits][:decreasing][n] = tracker[digits][:decreasing][n] * (10-n)
  end
  tracker[digits][:dupes] += 9
  puts 10**digits - val(tracker[digits])
  puts val(tracker[digits])
  puts "---"
end





