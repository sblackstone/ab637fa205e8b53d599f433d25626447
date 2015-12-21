=begin
n-sequences
Problem 427
A sequence of integers S = {si} is called an n-sequence if it has n elements and each element si satisfies 1 ≤ si ≤ n. Thus there are nn distinct n-sequences in total. For example, the sequence S = {1, 5, 5, 10, 7, 7, 7, 2, 3, 7} is a 10-sequence.

For any sequence S, let L(S) be the length of the longest contiguous subsequence of S with the same value. For example, for the given sequence S above, L(S) = 3, because of the three consecutive 7's.

Let f(n) = ∑ L(S) for all n-sequences S.

For example, f(3) = 45, f(7) = 1403689 and f(11) = 481496895121.

Find f(7 500 000) mod 1 000 000 009.

3:


123
132
231
213
321
312


So

3::  12  12  3
4::  108  120  24  4
5::  1280  1520  280  40  5
6::  18750  23400  3930  510  60  6
7::  326592  423360  65016  7644  840  84  7
8::  6588344  8800008  1241464  132552  13440  1288  112  8


3: 12 3 
4: 24 4 
5: 280 40 5 
6: 510 60 6 
7: 7644 840 84 7 
8: 13440 1288 112 8 
9: 244944 22032 1872 144 9 
10: 423000 34200 2610 180 10

=end

require 'pp'


@all = Array.new

def go(n,state)
  if state.length == n
    @all.push(state.clone)
  else
    1.upto(n) do |i|
      state.push(i)
      go(n,state)
      state.pop
    end    
  end
end


def l(s)
  cur = s[0]
  ccur = 1
  max = 1
  1.upto(s.length - 1) do |i|
    if s[i] == cur
      ccur += 1
    else      
      max = ccur if max < ccur       
      ccur = 1
      cur = s[i]
    end    
  end
  max = ccur if max < ccur       
  return max

end

def fact(n)
  return n == 0 ? 1 : n*fact(n-1)
end


#k > n/2


def sol(n,k)
  total = 0
  0.upto(n-k) do |i|
    sub = 1
    sub *= (n-1) if i > 0
    sub *= n**(i-1) if i > 1    
    sub *= n
    sub *= (n-1) if (n - k  - i) > 0
    sub *= (n)**(n - k -i - 1) if (n - k  - i) > 1
    total += sub
  end
  return total
end

3.upto(10) do |i|
  bottom = (i/2) + 1
  print "#{i}: "
  bottom.upto(10) do |j|
    z = sol(i,j) 
    if z > 0
      print "#{z} "
    end
  end
  puts
end

sol(6,4)
exit




6.upto(6) do |i|  
  @all = Array.new

  go(i,[])

  @h = Hash.new(0)
  @tot = 0


  @all.each do |i|
    z = l(i)
    pp i if z == 4 and i[0] == i[1] and i[1] == i[2] and i[2] == i[3]
      
    @h[z] += 1
    @tot += z
  end
=begin
  puts "#{i}: #{@h[i]} #{i}"
  puts "#{i}: #{@h[i-1]} #{2*i*(i-1)}"
  puts "#{i}: #{@h[1]} #{(i-1)**(i-1) * i}"
=end
  print "#{i}:: "
  1.upto(i) do |ii|
    print " #{@h[ii]} " 
  end
  puts
end

