=begin
Writing 1/2 as a sum of inverse squares
Problem 152
There are several ways to write the number 1/2 as a sum of inverse squares using distinct integers.

For instance, the numbers [2,3,4,5,7,12,15,20,28,35] can be used:



In fact, only using integers between 2 and 45 inclusive, there are exactly three ways to do it, the remaining two being: {2,3,4,6,7,9,10,20,28,35,36,45} and {2,3,4,6,7,9,12,15,28,30,35,36,45}.

How many ways are there to write the number 1/2 as a sum of inverse squares using distinct integers between 2 and 80 inclusive?

1/x^2 + 1/y^2 =  1/2

y^2/(x^2)(y^2) + x^2/(x^2)(y^2) = 1/2


x^2 + y^2
---------
(x^2)(y^2) = 1/2
  
  



=end

require './euler_lib.rb'

=begin

denoms = [2,3,4,5,7,12,15,20,28,35]

denoms.map! {|x| x*x}

common_denom = denoms.inject(:*)
nums = denoms.map {|x| common_denom / x }

sum_num = nums.inject(:+)


puts sum_num
puts common_denom

pp Rational(sum_num, common_denom)

=end



denoms = (2..45).to_a.map {|x| x*x}

cd = lcm(denoms[0], denoms[1])

2.upto(denoms.length - 1) do |x|
  cd = lcm(cd, denoms[x])
end


numerators = denoms.map {|x| cd / x }

=begin

Check: We get all the fractions back correctly..
numerators.each do |x|
  pp Rational(x, cd)
end
=end

def ways_to_add_to_n(arr, target, cur_sum = 0, cur_addens = [], &proc)
  if cur_sum == target
    yield cur_addens
    return
  end   
  if cur_sum > target
    puts "too big"
    return
  end
       
  if arr.empty?
    return
  end
  a = arr.shift
  ways_to_add_to_n(arr, target, cur_sum, cur_addens, &proc)
  cur_addens.push a
  ways_to_add_to_n(arr, target, cur_sum + a, cur_addens, &proc)
  cur_addens.pop
  arr.unshift a
end


target = cd / 2

ways_to_add_to_n(numerators, cd / 2) do |ans|
  pp ans
end



