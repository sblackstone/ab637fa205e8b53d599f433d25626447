require 'pp'

def find(n)
  val = n
  k = 2
  count = 1
  coeffs = Array.new(200,0)
  while true
    count += 1
    max_exp = 0
    cur = val
    puts cur
    while k**max_exp < cur
      max_exp += 1
    end
    0.upto(199) {|i| coeffs[i] = 0}
    max_exp.downto(0) do |e|
      place = k**e
      while cur >= place
        coeffs[e] += 1
        cur -= place
      end
    end
    new_num = -1
    0.upto(max_exp) do |e|
      new_num += (k+1)**e * coeffs[e]
    end
    val = new_num
    if new_num == 0
      break
    end
    k += 1
  end
  return count
end


puts find(5) - 1
exit

total = -7

1.upto(7) do |i|
  blarg = find(i)
  total += find(i)
  puts "i=#{i} size=#{blarg.size-1} total=#{total}"

end

puts total

