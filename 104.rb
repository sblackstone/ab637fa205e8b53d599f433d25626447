require 'bigdecimal'
require 'pp'


five = BigDecimal.new("5")
@sq5 = five.sqrt(16)

def fib(n)
  ((1 + @sq5)**n - (1 - @sq5)**n)/(2**n*@sq5)
end

def beginning(n)
  return n.round.to_s[0,9].split("").sort.join("")
end


a  = 0
b  = 1
k  = 0

while true 
  e = a % 10**9
  d = e.to_s.split("").sort.join("")
  if d =="123456789"
    print "Testing #{k}"
    if beginning(a) == "123456789"
      puts "Found: #{k}"
      exit
    else 
      puts "... no"
    end
  end
  c = (a+b)
  a = b
  b = c
  k +=1
end




