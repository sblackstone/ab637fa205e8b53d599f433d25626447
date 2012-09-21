count = 0
0.upto(200) do |onep|
  0.upto(100) do |twop|
    next if onep*1 + twop*2 > 200
    0.upto(40) do |fivep|
      next if onep*1 + twop*2 + fivep * 5 > 200
       0.upto(20) do |tenp|
         next if onep*1 + twop*2 + fivep * 5  + tenp*10 > 200
         0.upto(10) do |twentyp|
           next if onep*1 + twop*2 + fivep * 5  + tenp*10 + twentyp*20 > 200
           0.upto(4) do |fiftyp|
             next if onep*1 + twop*2 + fivep * 5  + tenp*10 + twentyp*20 + fiftyp*50 > 200
             0.upto(2) do |hundredp|
               next if onep*1 + twop*2 + fivep * 5  + tenp*10 + twentyp*20 + fiftyp*50 + hundredp*100 > 200
               0.upto(1) do |all|
                 total = onep*1 + twop*2 + fivep*5+tenp*10+twentyp*20+fiftyp*50+hundredp*100+200*all
                 if total == 200
                   count = count + 1
                 end
               end
             end
           end
         end
       end
     end
  end
end
puts count