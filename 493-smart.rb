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

require 'pp'


def fact(n)
  n == 0 ? 1 : n*fact(n-1)
end


def nCk(n,k)
  fact(n) / (fact(k) * fact(n-k))
end



def ways_to_20(arr, sum, &proc)
  if arr.length > 7
    return
  end
  if sum == 20
    yield arr
    return
  end
  

  first_num = arr.empty? ? 1 : arr.last
  first_num.upto(10) do |i|
    arr.push i
    ways_to_20(arr, sum+i, &proc)
    arr.pop
  end
      
end


@colors = Hash.new(0)
@total  = 0.0

ways_to_20([], 0) do |y|
  @colors[y.length] += nCk(7, y.length)
  @total            += nCk(7, y.length)
end

@exp = 0

@colors.each do |k,v|
  @exp += k * v / @total
end

pp @exp
#a.bcdefghij
#5.576642335