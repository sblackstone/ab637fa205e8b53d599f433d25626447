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

e.g.

2 = x / (1 - x - x**2)


n(1 - x - x**2) = x
n - nx -nx**2 - x = 0

x = (sqrt(5 n^2+2 n+1)-n-1)/(2 n)

5*n**2 + 2*n + 1 = k^2

5n^2 + 2n + 1 = k*k

5n^2 + 2n + 1 - k*k = 0



if k = 3

5n^2 + 2n + 1 = k*k
5n^2 + 2n - 8 = 0

5 + sqrt(4 - 4*5*-8)




5n^2 + 2n + 1 = k*k
5n^2 + 2n + (1 - k*k) = 0


5n^2 + 2n + 1 = 9
5n^2 + 2n - 8 = 0




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

n - n*x - n*x**2 = x

We want X to be rational...

5n^2 + 2n + 1 is perfect square <=> X is rational <=> n is a fibbonaci golden nugget.

Solutions to y^2 = 5x^2 + 2x + 1

(y^2 - 1) = 5x^2 + 2x

(y+1)(y-1) = 5x^2 + 2x






(-2 + sqrt(4 - (20 * (1 - j*j)))) / 10

(-2 + sqrt(4 - (20 * (1 - j*j)))) / 10

(Math.sqrt(5*j*j - 4) - 1) / 5.0

(5*j^2 - 4) = y**2

5j**2 = y**2 - 4

 j**2 = (y+2)(y-2)
        ----------
            5

 sqrt(y) = 1 mod 5
 

5j^2 -4 = y^2
5j^2 = (y+2)(y-2)
 j^2 = (y+2)(y-2) / 5
 
 
--- APRIL 1 ---


In this equation, n is the value we are trying to reach, e.g. the sum of the series will = n

X is the value we need to plug into s(x) to get n...

n = x / 1 - x - x^2


1/n = (1 - x - x^2) / x


1/n = 1/x - 1 - x

1/n + n/n =


(n+1)/n =  1/x - x

(n+1)/n =  (1-x^2)/x, n=3

4/3 = (1-x^2)/x

4x = 3 - 3x^2
3x^2 + 4x = 3

nx^2 + (n+1)x - n = 0







5*n**2 + 2*n + 1 = 1156


5n^2 + 2n = 1155
n^2 + (2/5)n = (1155 / 5)




y = 1156

# sub 1
y = 1155

# div by 5
231.0 + 0









=end

require 'pp'

=begin
1.upto(100) do |i|
  puts i if i*i % 5 == 1
end
=end



def quad(a,b,c)
  bsquaredminusfourac = b**2 - (4 * a * c)
  negb = b * -1
  twoa = 2 *a
  ans1 = negb + Math.sqrt(bsquaredminusfourac)
  ans2 = negb - Math.sqrt(bsquaredminusfourac)
  return (ans1 / twoa), (ans2 / twoa)
end

def quad2(n)
  bsquaredminusfourac = (n+1)**2 + 4*n**2
  twoa = 2 * n
  ans1 = Math.sqrt(bsquaredminusfourac) - (n+1)
  return (ans1 / twoa)
end



def y_series(&proc) 
  y = 2
  while true
    yield y
    y += 1
  end
end


=begin
  y = 34
  x = 
  
=end

def perfect_square?(n)
  k = Math.sqrt(n).floor
  return k*k == n 
end


=begin
  y         = 1156 / 1
  y - 1     = 1155 / 1
  y / 5     = 1155 / 5
  
  
  + 1/25    = 1155 / 5 = 5775 / 25 + 1/25 = 5776 / 25
  
  
=end

nugget = 1
y = 2

while true
  k = (y**2 - 1)*5 + 1
  if perfect_square?(k)
    sqk = Math.sqrt(k)
    j = (sqk / 5.0) - 0.20
    if j == j.round 
      puts "#{nugget}:\t#{j.round}\t#{y}\t#{sqk / 5.0}"
      nugget += 1
    end    

  end
  y += 1
end  
  
  # is y^2 of the form 5*n**2 + 2*n + 1 ?
  # is y^2 - 1 of the form 5*n**2 + 2*n ?
  
  
  

exit




=begin
exit
n = 1

1.upto(10**9) do |n|
  k = 5*n**2 + 2*n + 1
  m = Math.sqrt(k).floor
  if k == m*m
    puts "#{n}" 
  end
  n += 1
end






exit
=end
def q2(j)
  (Math.sqrt(5*j*j - 4) - 1) / 5.0
end
def q3(y)
  (Math.sqrt(y) - 1) / 5.0
end


nugget = 1
j = 2
while nugget < 15
  n = q2(j)
  if n == n.floor
     puts "#{nugget} #{n} #{5*n**2 + 2*n + 1}"
     nugget += 1
  end
  j += 1
end



