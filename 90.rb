require 'pp'

#01, 04, 06, 16, 25, 36, 46, 64, and 81

=begin

  - Atleast 1 die must have a 0

=end

c = 0

def check(a,b,c,d)
  return true if a.include?(c) and b.include?(d)
  return true if b.include?(c) and a.include?(d)
  return false
end

def key(a,b)
  a.sort!
  b.sort!
  a1 = a.join("")
  b1 = b.join("")
  if (b1.to_i > a1.to_i)
    t = b1
    b1 = a1
    a1 = t
  end

  return a1 + "::" + b1

end


@track = Hash.new(0)

[0,1,2,3,4,5,6,7,8,9].combination(6) do |a|
  [0,1,2,3,4,5,6,7,8,9].combination(6) do |b|
    if check(a,b,0,1) and  # 1
       check(a,b,0,4) and  # 4
       (check(a,b,0,9) or check(a,b,0,6)) and  # 06 / 09
       (check(a,b,1,6) or check(a,b,1,9)) and  # 16 / 19
       check(a,b,2,5) and
       (check(a,b,3,6) or check(a,b,3,9)) and  # 36 / 39
       (check(a,b,4,9) or check(a,b,4,6)) and  # 46 / 49              
       (check(a,b,6,4) or check(a,b,9,4)) and  # 64 / 94
       check(a,b,8,1)
         @track[key(a,b)] += 1
     end
   end
end
pp @track
pp @track.keys.size
  