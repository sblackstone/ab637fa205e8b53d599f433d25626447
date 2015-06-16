
require 'pp'

total = 0
1.upto(1000) do |s|
  (s+1).upto(1000) do |e|
    sum = 0
    s.upto(e) do |j|
      sum += j**2
    end
    if sum < 10**5 and sum.to_s == sum.to_s.reverse 
      total += sum
      puts "#{sum} = #{s}**2 to #{e}**2"
    end
  end
  
end

puts total
