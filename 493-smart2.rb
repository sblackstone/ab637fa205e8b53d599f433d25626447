=begin
Under The Rainbow
Problem 493
70 colored balls are placed in an urn, 10 for each of the seven rainbow colors.

What is the expected number of distinct colors in 20 randomly picked balls?

Give your answer with nine digits after the decimal point (a.bcdefghij).

a.bcdefghij
5.525443786
0.552544378
5.576642335
4.563042368
# http://www.ltcc.ac.uk/courses/enumerative_combinatorics/l5.pdf needed for lattice paths problem?

=end


require 'polynomial'
require 'pp'


def gbc(m,r)
  nom = Polynomial.from_string("1 - x**#{m}")
  (m-1).downto(m-r+1) do |e|
    nom *= Polynomial.from_string("1 - x**#{e}")
  end
  puts "NOM="
  puts nom.to_s
  den = Polynomial.from_string("1 - x")
  2.upto(r) do |e|
    den *= Polynomial.from_string("1 - x**#{e}")
  end
  puts "DEN="
  puts den.to_s
  ans = nom / den
  pp ans.to_s
end




gbc(4,2)


