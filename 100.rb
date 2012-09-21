require 'bigdecimal'
require 'bigdecimal/util'
require 'pp'
=begin


x**2 - x = y**2 - y

Using diophantine solver - 

http://www.alpertron.com.ar/QUAD.HTM

Xn+1 = 3* Xn + 2 Yn - 2
Yn+1 = 4* Xn + 3 Yn - 3

X0 = 1
Y0 = 1


=end

x = 1
y = 1

while true
  nextx = 3*x + 2*y - 2
  nexty = 4*x + 3*y - 3
  puts "#{nextx} #{nexty}"
  x = nextx
  y = nexty
end
