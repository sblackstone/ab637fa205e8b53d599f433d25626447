=begin
 
 
(a**2)*(r**3) + a = n^2

(a**2)(r**3) = n^2 - a





=end


require 'pp'

MAX = 10**12

@cubes   = Hash.new
@squares = Hash.new

k = 1
while k*k < MAX
  @cubes[k*k*k]    = k
  @squares[k*k]    = k
  k += 1
end



puts sum



=begin

def divisors_of_cube(n, n3, &proc)
  factorization = Hash.new(0)
  @h.factorize(n).each do |f|
    factorization[f[0]] += 3*f[1]
  end
  @h.divisors(n3, factorization, &proc)
end




@h = HandySieve.fetch(7)



MAX = 10**12
1.upto(Math.sqrt(MAX).floor) do |b|
  b3 = b*b*b
  
  divisors_of_cube(b, b3) do |d|
    puts "#{b3}: #{d}"
  end
  
    
end
=end
