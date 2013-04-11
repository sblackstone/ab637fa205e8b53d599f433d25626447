=begin
For some positive integers k, there exists an integer partition of the form   4t = 2t + k,
where 4t, 2t, and k are all positive integers and t is a real number.

The first two such partitions are 41 = 21 + 2 and 41.5849625... = 21.5849625... + 6.

Partitions where t is also an integer are called perfect.
For any m ≥ 1 let P(m) be the proportion of such partitions that are perfect with k ≤ m.
Thus P(6) = 1/2.

In the following table are listed some values of P(m)

   P(5) = 1/1
   P(10) = 1/2
   P(15) = 2/3
   P(20) = 1/2
   P(25) = 1/2
   P(30) = 2/5
   ...
   P(180) = 1/4
   P(185) = 3/13

Find the smallest m for which P(m) < 1/12345


4**t - 2**t = k

2*t = log2(k + 2**t)

t = ((-1 + Math.sqrt(4*k + 1))/2) + 1

=end
=begin
@squares = Hash.new(false)
@powers  = Hash.new(false)

1.upto(20000) do |i|
  @squares[i**2] = true
  @powers[2**i] = true
end


yea = 0
nay = 0
tot = 0
k = 1


while true
  fourk1 = 4*k + 1
  if @squares[fourk1] and Math.sqrt(fourk1) % 2 == 1
    tot += 1
    twot = (Math.sqrt(fourk1) - 1)/2 + 1
    puts "#{twot} #{k}"
    if (@powers[twot.to_i])
      yea += 1
    end  
    puts "#{yea} / #{tot}"
  end
  break if yea/tot.to_f < (1/12345.0)
  k += 1
end
puts k
=end

i = 3
@powers = Hash.new(false)
1.upto(20000) do |i|
  @powers[2**i] = true
end


tot = 0.0
yes = 0
k = 0
cutoff = 1.0 / 12345
while true
  fourk1 = i**2 
  if ((fourk1 - 1) % 4) == 0
    tot += 1
    k = (fourk1 - 1) / 4
    twot = (i - 1)/2 + 1
    if @powers[twot.to_i]
      yes += 1
    end
    if yes/tot < cutoff
      puts "#{k}: #{yes} / #{tot} #{yes/tot}"
      exit  
    end
  end
  i += 2
end

