
def B(n)
  a = Array.new
  0.upto(n) do |m|
    a[m] = 1.0 / (m+1)
    m.downto(1) do |j|
      a[j-1] = j * [a[j-1] - a[j]]
    end    
  end
  return a[0]
end

puts B(1)
