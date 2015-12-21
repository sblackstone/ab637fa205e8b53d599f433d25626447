require 'pp'

MAX = 10_000_000

@test = Array.new(MAX, 0)

a = 2
while true
  while @test[a] != 0 and a < MAX
    a += 1
  end
  break if a >= MAX
  #puts a
  k = 1
  while a*k < MAX
    @test[a*k] = a
    k += 1
  end
  
end


def fact(n)
  return if n == 1
  return [ @test[n], fact(n / @test[n])].flatten.compact
  
end

pp fact(96).inject(:*)