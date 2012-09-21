
def square?(n)
  d = Math.sqrt(n).floor
  (-1).upto(1) do |i|
    return true if ((d+i)**2 == n)
  end
  return false
end


1.upto(1) do |i|
  puts i if i % 3 == 0 and i % 9 > 0
end
puts "yup"

a   = 2

while true
  a += 3
  d = (3*a + 1)*(a-1)
  if square?(d)
    puts "#{a} #{a} #{a+1}"
    puts "-----"
  end
  a += 6
  d = (3*a + 1)*(a-1)
  if square?(d)
    puts "#{a} #{a} #{a+1}"
    puts "-----"
  end

end
