
b = 1
1.upto(100) do |x|
  b = b * x
end
puts b.to_s.split('').inject(0) {|a,c| a = a + c.to_i }
