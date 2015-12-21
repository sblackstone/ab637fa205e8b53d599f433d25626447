
def modpow(b,e,m)
  result = 1
  while e > 0
    if (e & 1) == 1
      result = (result * b) % m;
    end
    e = e >> 1;
    b = (b * b) % m;
  end
  return result
end


def Sp(n,p,m)
  return 1 if n == 1
  return (modpow(n,p,m) + Sp(n-1, p, m)) % m
end

require 'pp'

def solve(max_power, max_x, mod)

  answer = 0

  arr = Array.new(max_x+1, 0)
  0.upto(max_x) do |i|
    arr[i] = i
  end
   
  fb = 0
  fa = 1


  1.upto(max_power) do |n|
    #puts "#{fa} * #{Sp(max_x, n, mod)} = #{fa * Sp(max_x, n, mod)}"
    print "#{n}: "
    pp arr
    sub = 0
    puts "#{arr.inject(&:+)} * #{fa} = #{arr.inject(&:+)*fa}"
    puts
    0.upto(max_x) do |i|
      answer += (arr[i] * fa)
      arr[i] = arr[i] + (arr[i] * (i-1))
    end

    # Move the fibs forward...
    fc = (fa + fb) % mod
    fb = fa
    fa = fc
  end
  answer
end

puts solve(4,5,90000000)

#puts solve(10**15, 100, 1307674368000)

