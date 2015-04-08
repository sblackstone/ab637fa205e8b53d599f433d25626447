=begin
Fibonacci golden nuggets
Problem 137
Consider the infinite polynomial series AF(x) = xF1 + x2F2 + x3F3 + ..., where Fk is the kth term in the Fibonacci sequence: 1, 1, 2, 3, 5, 8, ... ; that is, Fk = Fk−1 + Fk−2, F1 = 1 and F2 = 1.

For this problem we shall be interested in values of x for which AF(x) is a positive integer.

Surprisingly AF(1/2)	 = 	(1/2).1 + (1/2)2.1 + (1/2)3.2 + (1/2)4.3 + (1/2)5.5 + ...
 	 = 	1/2 + 1/4 + 2/8 + 3/16 + 5/32 + ...
 	 = 	2
The corresponding values of x for the first five natural numbers are shown below.

x	AF(x)
√2−1	1
1/2	2
(√13−2)/3	3
(√89−5)/8	4
(√34−3)/5	5
We shall call AF(x) a golden nugget if x is rational, because they become increasingly rarer; for example, the 10th golden nugget is 74049690.

Find the 15th golden nugget.


The generating function of the Fibonacci sequence is the power series

s(x)=\sum_{k=0}^{\infty} F_k x^k.
This series is convergent for |x| < \frac{1}{\varphi}, and its sum has a simple closed-form:[31]

s(x)=\frac{x}{1-x-x^2}

n = x / (1 - x - x**2)

1 2 25
2 15 1156
3 104 54289
4 714 2550409
5 4895 119814916
6 33552 5628750625
7 229970 264431464441
8 1576239 12422650078084
9 10803704 583600122205489
10 74049690 27416783093579881
11 507544127 1288005205276048900


--- LETS START OVER ---


n = x / 1 - x - x**2 where n is the value we're trying to find x for such that s(x) = n

n(1 - x - x**2) = x


n - nx - nx^2 - x = 0





=end

require 'pp'

@fib_cache = Hash.new

def fib(n)
  @fib_cache[n] ||= do_fib(n)
end

def do_fib(n)
  n < 3 ? 1 : fib(n-1) + fib(n-2)
end

def f(n)
  fib(2*n) * fib(2*n + 1)
end

nugget = 0
1.upto(100) do |i|
  puts "#{i}: #{f(i)}"
end



=begin
def y_series(&proc)
  c = 0
  y = 4
  @addens = [ 1, 4, 1, 4, 1, 4, 1, 4, 1, 2, 2 ]
  while true
    y += @addens[c]
    yield y
    c = (c+1) % 11
  end    
end

def f(n)
   5*n**2 + 2*n + 1
end

def perfect_square?(n)
  t = Math.sqrt(n).floor
  return n == t*t
end

prev = 1

y_series do |y|
  v = f(y) 
  puts y if perfect_square?(v)

end

=end






