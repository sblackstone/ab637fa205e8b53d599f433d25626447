=begin

ABC is an integral sided triangle with sides a≤b≤c.
mc is the median connecting C and the midpoint of AB. 
F(n) is the number of such triangles with c≤n for which mc has integral length as well.
F(10)=3 and F(50)=165.

Find F(100_000).

# http://intmstat.com/trigonometric-functions/ABC.png


2a^2 + 2b^2 - c^2 / 4 = n^2

2a^2 + 2b^2 - c^2 = 4n^2


2a^2 + 2b^2 - c^2 = (2n)^2

2a^2 + 2b^2 - 4n^2  = c^2


2(a^2 + b^2 - 2n^2) = c^2




 mc = Math.sqrt((2*a**2 + 2*b**2 - c**2) / 4.0)
 
 
m^2 = 2a**2 + 2**2 - c**2 / 4


(2m)^2 = 2a^2 + 2b^2 - c^2




5 5  6  4.0
5 5  8  3.0
6 8 10  5.0






=end


def brute(n)
  count = 0
  loops = 0
  1.upto(n) do |c|  
    1.upto(c) do |b|
      1.upto(b) do |a|
        loops += 1
        if c < a+b
          mc = Math.sqrt((2*a**2 + 2*b**2 - c**2) / 4.0)
          if mc == mc.round
            count += 1
#            puts "#{a} #{b} #{c} #{mc}"
          else
#            puts "\t\t#{a} #{b} #{c} #{mc}"
            
          end        
        end      
      end
    end
  end
  [count,loops]
end


#puts brute(50)

@sq = Hash.new
@sq2 = Hash.new

1.upto(500) do |k|
  @sq[k*k] = k
  @sq2[2*k*k] = k
end

@sq2.each do |a22,a|
  @sq2.each do |b22, b|
    @sq.each do |c2, c|
    end
  end
end


