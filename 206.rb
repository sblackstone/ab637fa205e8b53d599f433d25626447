min = 1058921220
max = 1389026623


=begin

1121314151617181900
1929394959697989900
=end

i = 1058921220
i = i - (i % 30)
puts i % 30
while true
  b = (i ** 2).to_s
  if b[0] == "1" && b[2] == "2" && b[4] == "3" && b[6] == "4" && b[8] == "5" && b[10] == "6" && b[12] == "7" && b[14] == "8" && b[16] == "9"
    puts i
    puts b
    exit
  end
  if b[0] == "2"
    puts "ERR!"

    exit
  end  

  i += 30
end

