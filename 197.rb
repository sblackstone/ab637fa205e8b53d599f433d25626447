=begin

Investigating the behaviour of a recursively defined sequence
Problem 197
Given is the function f(x) = ⌊2**30.403243784-x**2⌋ × 10-9 ( ⌊ ⌋ is the floor-function),
the sequence un is defined by u0 = -1 and un+1 = f(un).

Find un + un+1 for n = 1012.
Give your answer with 9 digits after the decimal point.

=end

require 'bigdecimal'

PRECISION = 50

BigDecimal.limit(PRECISION)

@div = BigDecimal.new("#{10**9}", PRECISION)
@two = BigDecimal.new("2.0", PRECISION)
@exp = BigDecimal.new("30.403243784", PRECISION)

def f(x)
  e = @exp - x**2
  ans = (@two**e).floor / @div  
end


@un_cache = Hash.new(nil)
@un_cache[0] = BigDecimal.new("-1",PRECISION)

def u(n)
  @un_cache[n] ||= do_u(n)
end

def do_u(n)
  return f(u(n-1))
end


last_even = 0

1.upto(1000) do |k|
  i = k*2
  ui = u(i)
  delta = last_even - ui
  puts "#{i}: #{ui} #{delta}"
  last_even = ui
  break if delta == 0
end

last_odd = 0

1.upto(1000) do |k|
  i = (k*2) + 1
  ui = u(i)
  delta = last_odd - ui
  puts "#{i}: #{ui} #{delta}"
  last_odd = ui
  break if delta == 0
end

puts (last_odd + last_even).to_s("F")

