MOD = 1000000007

def calcFast(x)
  return x if x < 10
  nineLength = (x / 9).floor
  leadingDigit = x - (nineLength * 9)
  leadingTerm = (leadingDigit * 10.pow(nineLength))
  ninesTerm   = (10.pow(nineLength) - 1)
  return (leadingTerm + ninesTerm)
end

def calcFastMod(x, m)
  return x if x < 10
  nineLength = (x / 9).floor
  leadingDigit = x - (nineLength * 9)
  leadingTerm = (leadingDigit * 10.pow(nineLength, m)) % m
  ninesTerm   = (10.pow(nineLength, m) - 1) % m
  return (leadingTerm + ninesTerm) % m
end

testSum = ((1..20).map {|x| calcFast(x)}.inject(:+)) % MOD

puts "Expected = #{1074 % MOD} got #{testSum}"

if testSum != 1074 % MOD
  raise "Bad test"
end

def linear
  i = 1
  while i < 21
    yield i, i
    i += 1
  end
end

def fib
  i = 2
  x0 = 0
  x1 = 1
  #yield x0,0
  #yield x1,1
  while i <= 90
    x2 = x0 + x1
    yield x2, i
    x0 = x1
    x1 = x2
    i += 1
  end
end

sum = 0
sum2 = 0

fib do |fib, i|
  #puts "#{i}: val = #{fib} value = #{calcFast(fib)}"
  #sum = (sum + calcFast(fib))
  sum2 = sum2 + calcFastMod(fib, MOD)
end

puts sum % MOD
puts sum2 % MOD
