require 'pp'


@hash = Hash.new(false)

1.upto(1_000_000_000) do |i|
  @hash[i**2] = true
  break if i**2 > 10_000_000_000
end



def square?(n)
  while n % 4 == 0 and n > 1
    n /= 4
  end
  return @hash[n] if n < (1_000_000_000)**2 
  throw "Out of Bounds"
end

iu = 2
iv = 1

n = 3
u = iu
v = iv

sum = 0

while true
  a = 2*(u**2 - v**2)
  b = u**2 + v**2
  c = u**2 + v**2
  puts "#{b} #{c} #{a}"
  nu = iu*u + n*iv * v
  nv = iu*v + iv*u
  u = nu
  v = nv
  sum += (a+b+c) if a+b+c <= 1_000_000_000
  break if a+b+c > 1_000_000_000
end


v = 2

while true
  v += 1
  next unless square?(3*(v**2) - 2)
  u = Math.sqrt((3*(v**2) - 2))
  a =  (u**2 - v**2)
  b =  (u**2 + v**2) / 2 
  c =  (u**2 + v**2) / 2 
  break if a+b+c > 3_000_000_000
  next unless b-a == 1 
  sum += (a+b+c) if a+b+c <= 1_000_000_000
  puts "#{a.to_i} #{b.to_i} #{c.to_i}" if a+b+c <= 1_000_000_000
end
puts
puts sum


