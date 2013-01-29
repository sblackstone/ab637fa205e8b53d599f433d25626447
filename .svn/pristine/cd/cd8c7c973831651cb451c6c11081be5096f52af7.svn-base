# 1/2 = x / d <=> 2x = d    x = d / 2
# 1/3 = x / d <=> 2x = d    x = d / 3 


c = 0
2.upto(12_000) do |d|
  n1 = (d / 3) - 1 
  n2 = (d / 2) + 1
  n1.upto(n2) do |n|
    if n.gcd(d) == 1 and n/d.to_f < 0.5 and n/d.to_f > (1/3.0)
      c += 1
    end
  end
end

puts c