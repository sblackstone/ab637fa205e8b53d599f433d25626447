=begin
Modular Cubes, part 1
Problem 271
For a positive number n, define S(n) as the sum of the integers x, for which 1<x<n and
x3≡1 mod n.

When n=91, there are 8 possible values for x, namely : 9, 16, 22, 29, 53, 74, 79, 81.
Thus, S(91)=9+16+22+29+53+74+79+81=363.

Find S(13082761331670030).

= 2 • 3 • 5 • 7 • 11 • 13 • 17 • 19 • 23 • 29 • 31 • 37 • 41 • 43

=end

require './euler_lib.rb'


@h = HandySieve.fetch(7)


pp @h.factorize(1854081073152000)

exit


def brute(n)
  s = 0
  2.upto(n-1) do |x|
    s += x if x**3 % n == 1
  end
  s
end

puts brute(91)


n  = 13082761331670030
an = [2 , 3 , 5 , 7 , 11 , 13 , 17 , 19 , 23 , 29 , 31 , 37 , 41 , 43]

tn = Rational(n)

an.each do |p|
  tn *= (p-1)
  tn /= p
end

tn = tn.to_i

puts tn





=begin
@roots = Hash.new(-1)
0.upto(1_000_000) do |i|
  @roots[i**3] = i
end

puts "roots"
n = 13082761331670030

y = 2

while true
 puts y
 if n*y + 1 > 5_000_000**3
   throw "overflow"
 end
 
 if @roots[n*y + 1] > 0
   d = @roots[n*y + 1]
   break if d > n
   puts d
 end
 y += 1 
  
end

=end

=begin
2.upto(n-1) do |x|
  v = (x - 1)*(x**2 + x + 1) % 91 
  if v == 0
    puts v
    s += x
  end
end
=end

=begin
n = 91

1.upto(n-1) do |x|
  seen = Hash.new(false)
  i = 1
  c = 0
  while !seen[x**i % n] 
    c+= 1
    seen[x**i % n] = 1
    i += 1
  end
  t = (x**4) % n == x 
  print "X=#{x} (#{t}):\t "

  pp seen.keys
end
=end
