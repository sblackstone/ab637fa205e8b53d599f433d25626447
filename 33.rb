require 'pp'
require 'set'
require 'lib'
def cancel(n,d,c)
  n = n.to_s.delete(c).to_i
  d = d.to_s.delete(c).to_i
  return 1.0 * n / d rescue 0
end

top = 1
bottom = 1
 10.upto(99) do |n|
  (n+1).upto(99) do |d|
    next if n == d # Greater than 1
    next if n % 10 == 0 and d % 10 == 0 # trivial
    nume = [n.to_s[0], n.to_s[1]].to_set
    dene = [d.to_s[0], d.to_s[1]].to_set
    cancel = (dene & nume).to_a
    next if cancel.size != 1 # [89,98], which ever you take out gets you 1.
    value = n.to_f / d
    if value == cancel(n,d,cancel[0])
      top = top * n
      bottom = bottom  * d
      puts "#{n} / #{d}"
    end
  end
end

i = 1000
while i > 1
  i =  gcd(top,bottom)
  top = top / i
  bottom = bottom / i
end
puts top
puts bottom

