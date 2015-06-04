=begin

Previous	
 
Sums of totients of powers
Problem 512
Let φ(n) be Euler's totient function.

Let f(n)=(∑ni=1φ(ni)) mod (n+1).

Let g(n)=∑ni=1f(i).

g(100)=2007.

Find g(5×108).

n + n^2 + n^3
n(1+ n + n^2)
n(1 + n(1 + n))


n + n^2 + n^3 + n^4


=end


require './euler_lib.rb'


@h = HandySieve.new(5*(10**8))

puts "Setup Complete"

def f(n)
  n % 2 == 1 ?  @h.totient(n) : 0
end

def g(n)
  i = 1
  s = 0
  while i <= n
    s += f(i)
    i += 2
  end
  s
end

puts g(5*10**8)
