require 'primes'
require 'pp'

SIZE = 10**6

Primes.setup(SIZE)

@totients = Array.new(SIZE+1)
@totients[1] = [1,1]
1.upto(SIZE+1) do |i|
  @totients[i] = Array.new(2,1)
end

ptr = 1

Primes.primes.each do |p|
  @totients[p][0] = p - 1
  @totients[p][1] = 1
  ptr2 = p * 2
  while ptr2 <= SIZE
    @totients[ptr2][0] *= (p - 1)
    @totients[ptr2][1] *= p
    ptr2 += p
  end
  
end


1.upto(SIZE) do |i|
  @totients[i][0] *= i unless Primes.isPrime?(i)
end

puts "Complete, checking"

sum = 0
1.upto(SIZE) do |i|
  sum += (@totients[i][0] / @totients[i][1])
end
puts sum - 1 # 1/1 doesn't count.



