# Two can be   5,7,11
# Five can be  2,7,11
# Seven can be 2,5,11

# 27 total ways
# 



p = [2,5,7,11]

p.each do |two_slot|
  p.each do |five_slot|
    p.each do |seven_slot|
      next if two_slot   == 2
      next if five_slot  == 5
      next if seven_slot == 7
      next if two_slot   == five_slot
      next if five_slot  == seven_slot
      next if seven_slot == two_slot
      puts "#{two_slot} #{five_slot} #{seven_slot}"
    end
  end
end
