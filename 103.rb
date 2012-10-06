require 'pp'


def check_set(set)
 @indexes = (0..(set.length-1)).to_a
 1.upto(set.length - 1) do |sss|
   @indexes.combination(sss).each do |ss|
     sum1 = 0
     cou1 = 0
     sum2 = 0
     cou2 = 0
     0.upto(set.length-1) do |i|
       if ss.include?(i)
         sum1 += set[i]
         cou1 += 1
       else
         sum2 += set[i]
         cou2 += 1
       end
     end
     return false if sum1 == sum2 
     return false if cou1 > cou2 && sum2 > sum1
     return false if cou2 > cou1 && sum1 > sum2
   end
 end
 return true
end

o6 = [6,9,11,12,13]

o7 = o6.clone
o7.map! {|x| x = x + 7 }
o7.unshift(11)
pp o7
pp o7.inject(&:+)
pp check_set(o7)