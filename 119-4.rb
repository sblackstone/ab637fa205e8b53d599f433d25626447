

def digi_sum(n)
  sum = 0
  while n > 0
    sum += n % 10
    n -= n % 10
    n /= 10
  end
  return sum
end

base = 6


25.times do |i|
  puts digi_sum(base**i) 
end
