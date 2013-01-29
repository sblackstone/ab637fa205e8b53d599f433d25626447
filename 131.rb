=begin

There are some prime values, p, for which there exists a positive integer, n, such that the expression n^3 + n^2*p is a perfect cube.

For example, when p = 19, 8^3 + 8^2*19 = 12^3.

What is perhaps most surprising is that for each prime with this property the value of n is unique, and there are only four such primes below one-hundred.

How many primes below one million have this remarkable property?

  1^3    + 1^2*7      = 8^3    = 2*2*2
  8^3    + 8^2*19     = 12^3   = 2*2*3           8 = 2^3
  27^3   + 27^2*37    = 36^3   = 3*3*2*2        26 = 3^3
  64^3   + 64^2*61    = 80^3   = 5*2*2*2*2      64 = 4^3
  216^3  + 216^2*127  = 252^3  = 63*2*2        216 = 6^3
  1000^3 + 1000^2*331 = 1100^3 = 2*2*5*5*11   1000 = 10^3

   x^3 + x^2*p = y^3
        
   8^2(8 + p) = y^3
      
   x^2(x + p) = y^3
   
   cuberoot(64) * cuberoot(8+19) = y   4 * 3 = 12. check!
       

   cuberoot(x^2) * cuberoot(x+p) = y
   x^2 must be a perfect cube.  <=> x^2 must be a 6th power
   x+p must be a perfect cube.
   x > y
  
   

=end

1.upto(1000) do |x|
  y = ((x)**(2/3.0)) * (x+19)**(1/3.0)
  xx = x**3 + 19*(x**2)
  puts "#{x} #{y} #{xx - y**3}"
end



exit

require './primes.rb'

Primes.setup(1_000_000)

@p6 = Hash.new(false)
@p3 = Hash.new(false)

0.upto(1_000_000) do |j|
  @p3[j**3] = true
end
puts "setup"

Primes.primes.each do |p|
  xprime = 1
  while true
    xsquared = xprime ** 6
    x = xprime ** 3
    if (@p3[x+p])
      puts "p: #{p} x: #{x}"
      break
    end
    break if xprime > p
    xprime += 1
  end
end




=begin
Primes.primes.each do |p|
  1.upto(1000) do |x|
    a = x**3 + (x**2 * p)
    if @pc[a]
      puts "prime: #{p} x=#{x}"
      break
    end
  end
  break if p > 1000
end
=end


