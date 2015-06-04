=begin



0: 1
1: 1
42: 2500
246: 84100
287: 84100
728: 722500
Total = 1304

=end

require 'pp'

SIZE = 64_000_000

@sigm = Array.new(SIZE+1, 1)

p = 2

while true
  #puts "P = #{p}"
  while @sigm[p] != 1 
    p += 1
  end
  break if p >= SIZE
  p2 = p*p
  k = 1
  kp = p2
  while kp < SIZE
    k += 1
    kp *= p
  end
  #puts "Max power = #{p} ^ #{k}"
  power = kp / p
  sig_mul = power*power*p2 / (p2-1)
  k.downto(1) do |e|
    c = 1   
    cp = power
    while cp < SIZE
      if c % p > 0
        @sigm[cp] *= sig_mul
      end
      c +=1
      cp += power
    end    
    power /= p
    sig_mul /= p2

  end  
end

total = 0

1.upto(SIZE-1) do |i|
  v = @sigm[i]
  unless v % 4 > 1
    vs = Math.sqrt(v)
    if vs == vs.round 
      #puts "#{i}: #{v}"
      total += i
    end
  end
end


puts total