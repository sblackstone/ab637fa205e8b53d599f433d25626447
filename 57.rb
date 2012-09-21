
def sqrt_of_2(depth,num,denom)
  return num,denom if depth == 0
  tmp = num
  num   =   num + (denom * 2)
  denom =   denom + tmp
  return sqrt_of_2(depth-1,num,denom)
end

count = 0

0.upto(10) do |i|
  n,d = sqrt_of_2(i,3,2)
  puts n
  puts d
  puts "---"
  count = count + 1 if d.to_s.size > n.to_s.size
end

puts count