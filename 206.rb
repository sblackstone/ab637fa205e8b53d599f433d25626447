
=begin

Find the unique positive integer whose square has the form 1_2_3_4_5_6_7_8_9_0,
where each “_” is a single digit.



1_2_3_4_5_6_7_8_9_0

If it ends in 0, it must end in 00

1_2_3_4_5_6_7_8_900

and

1_2_3_4_5_6_7_8_9 must be square...


max = 1389026623.1062636
min = 1058921220.685081


Range = 330105403



1_2_3_4_5_6_7_8_9


1389019170 * 1389019170 = 1929374254627488900
1389019170

real	1m43.660s
user	0m30.123s
sys	0m16.723s







=end


def test(n, look_for)
  return true if look_for == 0
  n = (n - (n % 10)) / 10
  if n % 10 != look_for
    return false
  end
  
  return test((n - look_for) / 10, look_for - 1)
end




i = 1058921220

while i <= 1389026623
  v = i*i
  if v % 1000 == 900
    v -= 900
    v /= 1000 
    if test(v, 8)
      puts "#{i} * #{i} = #{i*i}"
      puts i
      exit
    end         
  end
  i += 10
end
