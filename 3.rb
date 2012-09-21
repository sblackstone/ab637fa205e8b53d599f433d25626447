
def isPrime?(n)
  2.upto(Math.sqrt(n)) do |i|
    return false if n % i == 0
  end
  return true
end

num = 600851475143

max = 0
2.upto(Math.sqrt(num)) do |x|
  max = x if num % x == 0 and isPrime?(x)
end

puts max




