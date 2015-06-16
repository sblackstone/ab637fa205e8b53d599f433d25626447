primes = Array.new

MAX = 1_000_000
BLOCK_SIZE = 1000
@block = Array.new(BLOCK_SIZE, 0)

0.upto(MAX/BLOCK_SIZE) do |b|
  if (b == 0)
    @block[0] = 1
    @block[1] = 1
  end
  
  first = b*BLOCK_SIZE
  
  primes.each do |p|
  
  end
  
  
end
