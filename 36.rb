require 'lib'

count = 0
0.upto(1000000) do |i| 
  if i.to_s == i.to_s.reverse
    v = num_to_bin(i)
    count = count + i if v == v.reverse
  end
end

puts count
