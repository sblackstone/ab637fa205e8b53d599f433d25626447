#
# Stephen Blackstone - Ruby Code Sample
#
# Problem Statement - http://projecteuler.net/index.php?section=problems&id=50
#
# The prime 41, can be written as the sum of six consecutive primes:
# 41 = 2 + 3 + 5 + 7 + 11 + 13
#
# This is the longest sum of consecutive primes that adds to a prime below one-hundred.
#
# The longest sum of consecutive primes below one-thousand that adds to a prime, contains 21 terms, and is equal to 953.
#
# Which prime, below one-million, can be written as the sum of the most consecutive primes?
#
#
# Solution:

# Since primes are constant in nature, we define this using class variables for ease of use and reusability.
class Primes
  # Class Accessor function
  def self.primes
    @@primes
  end

  # Test in O(1) if i is prime
  def self.isPrime?(i)
    @@prime_hash[i]
  end

  # Return array of primes < i
  def self.upto(i)
    set = []
    self.primes.each do |p|
      (p <= i) ? (set << p) : (return set)
    end
  end

  # Sieve of Eratosthenes
  # creates an array of primes @@primes
  # creates a hash of true values for primes @@prime_hash
  def self.setup(max)
    @@max = max
    max = max
    nums = Hash.new(true)
    sum = 2
    c = 3
    @@primes = [2]
    @@prime_hash = Hash.new(false)
    @@prime_hash[2] = true
    while (c < max)
      if nums[c]
        @@primes << c
        @@prime_hash[c] = true
        sum = sum + c
        x = c + c
        while x <= max
          nums[x] = false if x % 2 == 1
          x = x + c
        end
      else
        nums[c] = false
      end
      c = c + 2
    end
  end
end


# Need to be able to test primes up to 10**6
Primes.setup(1_000_000)

# We only need to test primes up to 4,000 because the sum of the primes
# upto 4,000 is ~ 1mm which is the upper limit.
primes = Primes.upto(4_000)

# Store the max length found so far.
max_length = 0
max_prime  = 0
max_start  = 0

# For increasing P in primes :  
#  Calculate the sum of all the primes above it.
#  Subtract larget primes off until the result is prime.  
#  The set of primes starting at P is then the values in cur_primes
#
while primes.size > max_length
  cur_primes = primes.clone
  cur_val    = cur_primes.inject(:+)

  while (cur_val > 1_000_000 or !Primes.isPrime?(cur_val)) and cur_primes.size > max_length
    cur_val = cur_val - cur_primes.pop
  end

  if Primes.isPrime?(cur_val) and cur_primes.size > max_length
    max_prime  = cur_val
    max_start  = cur_primes.first
    max_length = cur_primes.size
  end
  primes.shift
end

puts "The answer is #{max_prime} starting at #{max_start} with a length of #{max_length}"

# Output:
#
# stephen-blackstones-power-mac-g5:euler sblackstone$ time ruby 50.rb 
# The answer is 997651 starting at 7 with a length of 543
#
# real	0m3.478s
# user	0m2.944s
# sys	  0m0.137s



