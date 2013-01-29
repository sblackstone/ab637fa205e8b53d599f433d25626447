count = 0
ans   = 1
d     = 1
1.upto(1000001) do |i|
  break if count > 1000000
  if d - count > 7
    count = count + i.to_s.size
    next
  end
  i.to_s.split("").each do |j|
    count = count + 1
    if count == d
      ans = ans * j.to_i
      d = d * 10
    end
  end
end

puts ans