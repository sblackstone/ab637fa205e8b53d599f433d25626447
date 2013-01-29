require 'lib'

@nums = Hash.new(true)
@max = 1000
sum = 2
c   = 3

@primes = [2]
@prime_hash = Hash.new(false)
while (c < @max)
  if @nums[c]
    @primes << c
    @prime_hash[c] = true
    sum = sum + c
    x = c + c
    while x <= @max
      @nums[x] = false if x % 2 == 1
      x = x + c
    end
  else
    @nums[c] = false
  end
  c = c + 2 
end


maxa = 0
maxb = 0
maxc = 0

-1000.upto(1000) do |a|
  [1,-1].each do |sign|
  @primes.each do |b|
    b = b *sign
    n = 0
    c = 0
    while true
      v = n*n + a*n + b
      break unless @primes.include?(v)
      c = c + 1
      n = n + 1
    end
    if c > maxc
      maxa = a
      maxb = b
      maxc = c
      puts "best: #{a} #{b} produced #{c} primes"
    end
    
  end
end
end
puts maxa
puts maxb
puts maxc
puts maxa * maxb