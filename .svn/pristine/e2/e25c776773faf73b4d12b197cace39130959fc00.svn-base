=begin




f(n) = n(n+1)2 = sum of numbers from 1 to n


9*10  + 8*9 + 8*7+ 7*6 + 6*5 + 5*4 + 4*3 + 3*2 + 2*1 
----------------------------------------------------
                     2
                     



777
778
779
788
789
799

7777
6777
5777
4777
3777
2777
1777

7778
6778
5778
4778
3778
2778
1778

7779
6779
5779
4779
3779
2779
1779



-----
-----

333
321
311
310

322
321
320

311
310

300



3333
4333
5333
6333
7333
8333
9333



-----
-----



   
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
  { increasing: Array.new(10,0), 
    decreasing: Array.new(10,0)
  }
end


DIGITS = 100
TOTAL = 10**DIGITS - 1

tracker[0] = tracker[1] = tracker[2] = factory

tracker[3] = factory


1.upto(9) do |n|
  tracker[3][:increasing][10-n] = sum(n)
  tracker[3][:decreasing][n] = sum(n+1)
end

tracker[3][:subtotal] = tracker[3][:increasing].inject(&:+) + tracker[3][:decreasing].inject(&:+)

4.upto(DIGITS) do |digits|
  tracker[digits] = factory
  tracker[digits][:decreasing][1] = digits
  tracker[digits][:increasing][9] = 1
  tracker[digits][:increasing][8] = digits
  2.upto(9) do |n|
    tracker[digits][:decreasing][n] = tracker[digits][:decreasing][n-1] + tracker[digits-1][:decreasing][n]
  end
  7.downto(1) do |n|
    tracker[digits][:increasing][n] = tracker[digits][:increasing][n+1] + tracker[digits-1][:increasing][n]
  end
  tracker[digits][:subtotal] = tracker[digits][:increasing].inject(&:+) + tracker[digits][:decreasing].inject(&:+) 
end
pp tracker


ans = 99
3.upto(DIGITS) do |d|
  ans += tracker[d][:subtotal]
  ans -= 9
end

puts ans
puts TOTAL-ans





