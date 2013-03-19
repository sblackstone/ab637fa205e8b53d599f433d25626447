=begin
 
 28433 * 2^7830457+1 mod 10**10
  
=end

digits = 10

c = 1
eprime = 0
b = 2
e = 7830457

while eprime < e
  eprime += 1
  c = (b*c) % 10**digits
end


c = (c * 28433) % 10**digits

puts (c + 1) % 10**digits