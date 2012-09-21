require 'pp'

def popcount(x)
  m1 = 0x55555555
  m2 = 0x33333333
  m4 = 0x0f0f0f0f
  x -= (x >> 1) & m1
  x = (x & m2) + ((x >> 2) & m2)
  x = (x + (x >> 4)) & m4
  x += x >> 8
  return (x + (x >> 16)) & 0x3f
end


@values = Hash.new(0)
@values[0] = 0

1.upto(20) do |i|
  @values[i] = @values[i-1] + popcount(i) 
end

0.upto(20) do |i|
  puts "#{i}: #{@values[i]}"
end
