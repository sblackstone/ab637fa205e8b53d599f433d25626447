=begin
A triangular pyramid is constructed using spherical balls so that each ball rests on exactly three balls of the next lower level.


Then, we calculate the number of paths leading from the apex to each position:

A path starts at the apex and progresses downwards to any of the three spheres directly below the current position.

Consequently, the number of paths to reach a certain position is the sum of the numbers immediately above it (depending on the position, there are up to three numbers above it).

The result is Pascal's pyramid and the numbers at each level n are the coefficients of the trinomial expansion (x + y + z)n.

How many coefficients in the expansion of (x + y + z)^200000 are multiples of 10^12?


n! / i! j! k!


=end

require './euler_lib.rb'

n = 200000

0.upto(n) do |i|
  0.upto(n) do |j|
    0.upto(n) do |k|
      puts fact(n)/fact(i)*fact(j)*fact(k) if i == 1 and j == 1 and k == 1


    end
  end  
end
