#351
require 'pp'

SIZE = 10

@count = Hash.new(0)

y = 2

while (y <= (SIZE*2))
  xs = (y/2) * -1 + 2
  xe = (y/2)
  x = xs
  while x <= xe
    g = x.gcd(y)
    xx = x / g
    yy = y / g
    @count["#{xx}:#{yy}"] += 1
    x += 2
  end
  y += 2
end

pp @count

@sum = 0
@count.each do |k,v|
  @sum += (v - 1)
end

puts @sum * 6
