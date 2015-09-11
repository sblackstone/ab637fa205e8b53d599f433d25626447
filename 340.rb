=begin
For fixed integers a, b, c, define the crazy function F(n) as follows:
F(n) = n - c for all n > b 
F(n) = F(a + F(a + F(a + F(a + n)))) for all n ≤ b.

Also, define S(a, b, c) = .

For example, if a = 50, b = 2000 and c = 40, then F(0) = 3240 and F(2000) = 2040.
Also, S(50, 2000, 40) = 5204240.

Find the last 9 digits of S(217, 721, 127).
=end



class Solver

  def initialize(a,b,c)
    @a = a
    @b = b
    @c = c
  end
  
  def f(n, d = 0)
    print "\t" * d
    puts n
    return (n - @c) if n > @b
    return f(@a + f(@a + f(@a + f(@a + n, d+1), d+2), d+3), d+4)
  end
  

end


def s(a,b,c)
  solver = Solver.new(a,b,c)
  sum = 0
  0.upto(b) do |k|
    sum += solver.f(k)
  end
  sum
end



s = Solver.new(50,2000, 40)

puts s.f(2000)


#puts s(50, 2000, 40)