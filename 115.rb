=begin

NOTE: This is a more difficult version of problem 114.

A row measuring n units in length has red blocks with a minimum length of m units placed on it, such that any two red blocks (which are allowed to be different lengths) 
are separated by at least one black square.

Let the fill-count function, F(m, n), represent the number of ways that a row can be filled.

For example, F(3, 29) = 673135 and F(3, 30) = 1089155.

That is, for m = 3, it can be seen that n = 30 is the smallest value for which the fill-count function first exceeds one million.

In the same way, for m = 10, it can be verified that F(10, 56) = 880711 and F(10, 57) = 1148904, so n = 57 is the least value for which the fill-count function first exceeds one million.

For m = 50, find the least value of n for which the fill-count function first exceeds one million.

=end

require 'pp'

@t_cache = Hash.new


@f2_cache = Hash.new

def f2(m,n)
  @f2_cache["#{m}:#{n}"] ||= do_f2(m,n)  
end

def do_f2(m,n)
  return 0 if n < 0
  return 1 if n == 0
  sum = 0
    m.upto(n) do |block|
      1.upto(n) do |spaces|
        sum += f2(m, n - block - spaces)
      end
    end
  return sum    
end

def f(m,n)
  s2 = 0
  0.upto(n+1) do |i|
    s2 += f2(m,i)
  end
  return s2
end


n = 50
while true
  ans = f(50,n)
  puts "#{n}: #{ans}"
  break if ans > 10**6
  n += 1
end
