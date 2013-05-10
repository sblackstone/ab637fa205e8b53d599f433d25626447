=begin
The radical of n, rad(n), is the product of distinct prime factors of n. For example, 504 = 23 × 32 × 7, so rad(504) = 2 × 3 × 7 = 42.

If we calculate rad(n) for 1 ≤ n ≤ 10, then sort them on rad(n), and sorting on n if the radical values are equal, we get:

Let E(k) be the kth element in the sorted n column; for example, E(4) = 8 and E(6) = 9.

If rad(n) is sorted for 1 ≤ n ≤ 100000, find E(10000).

=end

require './primes.rb'

MAX = 100_000
Primes.setup(100_000)

@track = Hash.new(1)

@track[1] = 1
Primes.primes.each do |p|
  k = 1
  while k*p <= MAX
    @track[k*p] *= p 
    k += 1
  end
end

=begin
1.upto(MAX) do |i|
  puts "#{i}: #{@track[i]}"
end
=end

@stuff =  @track.sort_by {|k,v|  [v,k] }


pp @stuff[10000-1]
