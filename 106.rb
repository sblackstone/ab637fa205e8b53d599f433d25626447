require 'pp'

def fact(n)
  n == 0 ? 1 : n*fact(n-1)
end


def nCk(n,k)
  fact(n) / (fact(k) * fact(n-k))
end

def output(combo1,combo2)
  if combo1.first > combo2.first
    t = combo1
    combo1 = combo2
    combo2 = t
  end
  
  puts combo1.join(",") + "  " + combo2.join(",") 

end


def test(combo1, combo2)
  combo1.sort!
  combo2.sort!
  0.upto(combo1.length - 1) do |i|
    return false if combo1[i] > combo2[i]
  end
  return true

end


s = [1,2,3,4,5,6,7,8,9,10,11,12]
n = s.length

dont_test = 0
test = 0

2.upto(n-1) do |subset_size|
  s.combination(subset_size) do |combo1|
    sprime = (s - combo1)
    sprime.combination(subset_size) do |combo2|
      if test(combo1,combo2)  
        output combo1,combo2
        dont_test += 1
      elsif combo1[0] < combo2[0]
        test += 1
      end
    end
  end  
end

puts "Dont test = #{dont_test}"
puts " test = #{test}"




=begin

def sum(n,k)
  sum = 0
  i = k
  while i <= n-k
    sum += nCk(i-1, k-1) * nCk(n-i, k)
    i += 1
  end
  sum
end


puts nCk(7,2)*nCk(5,2) + nCk(7,3)*nCk(4, 3) -  sum(7,2) + sum(7,3)
=end