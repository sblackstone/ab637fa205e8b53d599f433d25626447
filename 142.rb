=begin
Find the smallest x + y + z with integers x > y > z > 0 such that x + y, x - y,   
                                                                  x + z, x - z,   
                                                                  y + z, y - z are all perfect squares.

x + y is square
x - y is square


=end
require 'pp'

@track = Hash.new


@squares = Hash.new(false)
0.upto(1000) do |i|
  @squares[i**2] = true
end


1.upto(1000) do |i|
  (i+1).upto(1000) do |j|
    s1 = i**2
    s2 = j**2
    diff = s2 - s1
    if (diff) % 2 == 0
      @track[s2 - (diff/2)] ||= Array.new
      @track[s2 - (diff/2)].push(diff/2)
    end
    
  end
end

@track.each do |x,v|
  v.combination(2) do |a|
    y = a.max
    z = a.min
    if @squares[y+z] and @squares[y-z]
      puts "#{x} #{y} #{z} #{x+y+z}"

    end
  end
  
end
