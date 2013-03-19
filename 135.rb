require 'pp'
count = 0
@track = Hash.new(0)
1.upto(1_000_000) do |j|
  puts j
  k = j/3
  while true  
    n = (3*k-j)*(j+k)
    break if n > 1_000_000  
    count += 1
    @track[n] += 1 
    k += 1
  end
end


count = 0
1.upto(1_000_000) do |i|
  if @track[i] == 10
    count +=1
    puts i
  end
end
puts count
=begin


(j+2k)**2 - (j+k)**2 - (j)**2 = n






j=6
k=3

12  9  6

34  27 20
=end