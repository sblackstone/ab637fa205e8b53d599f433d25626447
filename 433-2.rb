j = 5_000_000

def gcd_count(a,b,c = 0)
  return b == 0 ? c : gcd_count(b, a % b, c+1)
end

1.upto(5_000_000) do |i|
  puts gcd_count(j,i)
end
