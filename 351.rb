#351
require 'pp'

1.upto(10) do |i|
  if i % 2 == 0
    print " "
  end
  print "* " * 10
  puts
end
