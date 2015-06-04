=begin
N disks are placed in a row, indexed 1 to N from left to right.
Each disk has a black side and white side. Initially all disks show their white side.

At each turn, two, not necessarily distinct, integers A and B between 1 and N (inclusive) are chosen uniformly at random.
All disks with an index from A to B (inclusive) are flipped.

The following example shows the case N = 8. At the first turn A = 5 and B = 2, and at the second turn A = 4 and B = 6.



Let E(N, M) be the expected number of disks that show their white side after M turns.
We can verify that E(3, 1) = 10/9, E(3, 2) = 5/3, E(10, 4) ≈ 5.157 and E(100, 10) ≈ 51.893.

Find E(10**10, 4000).
Give your answer rounded to 2 decimal places behind the decimal point.


Values of A, M=4
0  1
1  2
2  3
3  4
  .. (M+1)
Values of B, M = 4
0  4
1  3
2  2
3  1
  .. (M - K)

=end



require 'pp'

M = 3
ROUNDS = 1


def straights_including(k)
  (k+1) * (M - k)
end

def fact(n)
  return n == 0 ? 1 : n*fact(n-1)
end

def nCk(n,k)
  return fact(n) / (fact(k)*fact(n-k))
end

def doit
  total_straights = M*(M+1)/2
  @ways = Hash.new
  total = 0
  i = 0
  while i <= ROUNDS
    @ways[i] = nCk(ROUNDS, i)
    i += 2
  end
  pp @ways
  0.upto(M-1) do |i|
    s = straights_including(i)
    puts "I=#{i} Straights = #{s}"
    ways_of_hitting = s.to_f 
    ways_of_not_hitting = total_straights - s;
    subtotal = 0
    @ways.each do |win, count|
      puts "#{ways_of_hitting}**#{win} * #{ways_of_not_hitting}**#{ROUNDS-win}"
      s = (ways_of_hitting**win * ways_of_not_hitting**(ROUNDS-win)) / (total_straights)
      total += s*count
    end
  end
  puts total 
end

doit
exit

def test1
  @h = Array.new(M,0)
  @i = (1..M).to_a
  0.upto(M-1) do |a|
    a.upto(M-1) do |b|
      0.upto(M-1) do |i|
        if a <= i and i <= b
          puts "#{i}: #{a} #{b}"
          @h[i] += 1
        end  
      end 
    end
  end
  pp @h
end


def test2(n)
  @a = Array.new(10,0)
  n.times do |i|
    a = rand(M)
    b = rand(M)
    if a > b
      a,b = b,a
    end      
    a.upto(b) do |i|
      @a[i] += 1
    end
  end
  return @a
end

def test3
sum = 0

25.times {
  sum +=   M - test2(ROUNDS).inject(&:+)
}
puts sum / 25.0
end


def test4
t = Array.new(M, ROUNDS)
100_000.times {
  0.upto(M-1) do |mm|
    t[mm] += 1 if test2(ROUNDS)[mm] == 0
  end
}
t.map! {|x| x / 100_000.0}
end

0.upto(7) do |i|
  puts straights_including(i)
end
