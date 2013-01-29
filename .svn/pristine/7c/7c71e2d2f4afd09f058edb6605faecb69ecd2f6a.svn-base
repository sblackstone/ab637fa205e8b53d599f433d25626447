
def pal_cycle(i, depth = 0)
  v = i + i.to_s.reverse.to_i
  return 1 if v.to_s == v.to_s.reverse
  return 0 if depth >= 51
  return 1 + pal_cycle(v, depth + 1)
end


count = 0
0.upto(10000) do |i|
  count = count + 1 if pal_cycle(i) > 50
end
  
puts count