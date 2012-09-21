require 'pp'

def len(d)
n = 1
c = 0
bases = []
while true
  if n == 0
    ans = 0
    break
  end
  if bases.include?(n) 
    ans = 0
    bases.index(n).upto(bases.size - 1) do |i|
      ans = ans + (bases[i] / d).to_s.length
    end
    break
  end
  bases << n
  if n < d
    n = n * 10
    next
  else
    n = (n % d) * 100
  end
  c = c + 1
end
return ans
end

max = 0
num = 0
1.upto(1000) do |i|
  l = len(i)
  if l > max
    max = l
    num = i
  end
end
puts num
