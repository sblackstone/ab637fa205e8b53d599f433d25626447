puts 1.upto(1000).inject(0) { |a,c| a = a + c**c }.to_s[-10,10]


