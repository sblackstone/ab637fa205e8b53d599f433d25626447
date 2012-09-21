max = 0
1.upto(100) do |a|
  1.upto(100) do |b|
    val = a**b
    sum = val.to_s.split("").inject(0) {|a,c| a = a + c.to_i }
    max = sum if sum > max
  end
end

puts max
