require 'pp'

=begin
A spider, S, sits in one corner of a cuboid room, measuring 6 by 5 by 3, and a fly, F, sits in the opposite corner. 
By travelling on the surfaces of the room the shortest "straight line" distance from S to F is 10 and the path is shown on the diagram.


However, there are up to three "shortest" path candidates for any given cuboid and the shortest route doesn't always have integer length.

By considering all cuboid rooms with integer dimensions, up to a maximum size of M by M by M, there are exactly 2060 cuboids
for which the shortest route has integer length when M=100, 
and this is the least value of M for which the number of solutions first exceeds two thousand; the number of solutions is 1975 when M=99.

Find the least value of M such that the number of solutions first exceeds one million.

1 1 6
1 2 6
1 3 6
1 4 6
1 5 6
1 6 6
2 2 6
2 3 6
2 4 6
2 5 6
2 6 6
3 3 6
3 4 6
3 5 6
3 6 6
4 4 6
4 5 6
4 6 6
5 5 6
5 6 6
6 6 6

=end




@squares = Hash.new
1.upto(50_000) do |i|
  @squares[i**2] = true
end


def isSquare?(n)
  throw "err" if n > 50_000**2
  @squares[n]
end

def test3(h)
  s2 = 0
  hsquared = h*h
  1.upto(h) do |l|
    l.upto(h) do |w|
      v3 = (l+w)*(l+w) + hsquared
      if isSquare?(v3)
        s2 += 1
      end
    end
  end  
  s2
end

s = 0

1.upto(600) { |i| s += test3(i) }

puts s 