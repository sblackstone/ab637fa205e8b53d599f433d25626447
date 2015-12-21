=begin

It can be verified that there are 23 positive integers less than 1000 that are divisible by at least four distinct primes less than 100.

Find how many positive integers less than 1016 are divisible by at least four distinct primes less than 100.


10**3: 23
10**4: 811
10**5: 9280
10**6: 77579
10**7: 768778
10**8: 7881475

=end

require './primes.rb'
MAX = 10**5
small_primes = [2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97]




