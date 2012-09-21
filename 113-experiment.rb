require 'pp'

tracker3 = Array.new(10,0)
tracker4 = Array.new(10,0)
tracker5 = Array.new(10,0)
1.upto(9) do |digit|
  digit.upto(digit) do |i|
    i.upto(9) do |j|
      j.upto(9) do |k|
        tracker3[digit] += 1
        k.upto(9) do |l|
          tracker4[digit] +=1
          l.upto(9) do |m|
            tracker5[digit] += 1
          end          
        end
      end
    end
  end
end

pp tracker3
pp tracker4
pp tracker5

=begin
tracker3 = Array.new(10,0)
tracker4 = Array.new(10,0)
tracker5 = Array.new(10,0)
tracker_all = Array.new(10,0)

9.downto(1) do |i|
  i.downto(0) do |j|
    j.downto(0) do |k|
      tracker3[i] +=1
      tracker_all[i] +=1
      k.downto(0) do|l|
        tracker4[i] +=1
        tracker_all[i] +=1
        l.downto(0) do |m|
          tracker5[i] += 1
          tracker_all[i] += 1
        end
      end
    end
  end
end

pp tracker3
pp tracker4
pp tracker5
#pp tracker_all
=end