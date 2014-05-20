
=begin

Twenty-two Foolish Primes
Problem 239
A set of disks numbered 1 through 100 are placed in a line in random order.

What is the probability that we have a partial derangement such that exactly 22 prime number discs are found away from their natural positions?
(Any number of non-prime disks may also be found in or out of their natural positions.)

Give your answer rounded to 12 places behind the decimal point in the form 0.abcdefghijkl.



There are 25 primes less than 100 
There are 22 out of order
There are 3 primes in order


(25 choose 3) ways to choose the smart primes, 97 slots left


There are 22 foolish prime slots to fill..

_ _ 3 _ _ _ _
  2     5   7


  5,7  2,7 
_ _ 3 _ _ _ _
  2     5   7
  ^     ^
  |     |



2 choices for each slot = 4 total combinations

1 way to choose 7 for both = 3 total


------


 
_ _ 3 _ _ _ _ _ _ _ _
  2     5   7       11
  ^     ^   ^
  |     |   |


Choose 3  primes



2 can be 5,7,11
5 can be 2,7,11
7 can be 2,5,11

3*3*3 = 27

3 ways to choose 2 choice
3 ways to choose 7 twice
3 ways to chose 11 twice
1 way to choose 11 three times

---
10

17 ways










1 Prime in correct Slot:


0 fools in prime slots = 3 * 2 * 1 = 6 ways to fill primes * 3! ways to complete = 36


1 fool in prime slot = (3 ways to choose slot)(2 ways to fill it) * (3 ways to fill non-fool slot) * (2 ways to fill non-fool slot) * 3!



2 fool in prime slot = (3 choose 2 ways to choose bad primt slots)
                        3  to fill prime slot with wrong prime
                        3  ways to fill prime slot with composite
                        3! fill the rest                       
                       






=end


require 'pp'

require './primes.rb'


Primes.setup(100)

@fact_cache = Hash.new(nil)

def fact(n)
  @fact_cache[n] ||= do_fact(n)
end


def do_fact(n)
  return n <= 0 ? 1 : n * fact(n-1)
end



fact(100)

def ffact(n,count)
  max = n
  min = (n-count)+1
  ans = 1
  max.downto(min) do |i|
    ans *= i
  end
  ans
end


def nCk(n,k)
  return 1 if k == 0
  fact(n) / (fact(k) * fact(n-k))
end

def brute(disks, fools)
  count = 0
  (1..disks).to_a.permutation.each do |p|
    pcount = 0
    primes_in_place = []
    primes_in_wrong_prime_slot = []
    p.each_with_index do |n,i|
      if n == (i+1) and Primes.isPrime?(n)
        primes_in_place.push(n)
        pcount += 1
      elsif Primes.isPrime?(n) and Primes.isPrime?(i+1)
        primes_in_wrong_prime_slot.push(n)
      end      
    end
    if pcount == (Primes.primes.length - fools)
      count += 1
      #puts "#{primes_in_place.sort.join(":")} - #{primes_in_wrong_prime_slot.length}"
    end
  end
  count  
end


=begin

7, 3 fools, per digit..

 36 3 - 0
216 3 - 1
162 3 - 2
 12 3 - 3

If you have a set of N elements
How many k-sets include j?

(N,k) total sets


(n-1, k-1) include 2






=end
#http://oeis.org/search?q=6+31+134+465&language=english&go=Search
def wtf(n,k)
  sum = 0
  0.upto(k) do |j|
    sum += ((-1)**j)*nCk(k,j)*fact(n-j)
  end
  sum / fact(n-k)
end

def guess(disks, fools)
  total_primes     = Primes.primes.length
  total_composites = disks - total_primes

  primes_in_place      = total_primes - fools
  primes_out_of_place  = fools


  puts "Primes = #{total_primes}"
  puts "Composites = #{total_composites}"
  puts "Primes in place: #{primes_in_place}"
  puts "Primes out of place: #{primes_out_of_place}"
    
  answer = 0
  
  0.upto(fools) do |fools_in_prime_slots|

    composites_remaining = total_composites
    primes_remaining     = primes_out_of_place
    slots_remaining      = disks - primes_in_place


   # Step 1.  How many ways to choose fool-in-prime-slot

   ways_to_choose_fools_in_prime_slots = nCk(primes_remaining, fools_in_prime_slots)
   slots_remaining -= fools_in_prime_slots

   # Step 2.  How many ways to choose primes to fool-in-prime-slot 

   ways_to_fill_fools_in_prime_slots = wtf(primes_remaining, fools_in_prime_slots)
   primes_remaining -= fools_in_prime_slots
   
   # Step 3.  Fill in rest of prime-slots with composites...
   composite_prime_slots = fools - fools_in_prime_slots
   
   ways_to_fill_rest_of_prime_slots = ffact(composites_remaining, composite_prime_slots)
   slots_remaining -= composite_prime_slots
   composites_remaining -= composite_prime_slots
   

   # Step 4.  Fill the rest...
   ways_to_fill_the_rest = ffact(composites_remaining+primes_remaining, slots_remaining)
   
  
   sub_answer = ways_to_choose_fools_in_prime_slots * ways_to_fill_fools_in_prime_slots * ways_to_fill_rest_of_prime_slots * ways_to_fill_the_rest
  
   puts "\tFools in prime slots: #{fools_in_prime_slots} #{sub_answer}"
   answer += sub_answer
  end
  answer * nCk(total_primes, primes_in_place)
end

v = guess(100, 22) / fact(100).to_f
puts v.to_s[0,14]

exit
puts brute(7, 1)
puts guess(7, 1)
puts
puts brute(7, 2)
puts guess(7, 2)
puts
puts brute(7, 3)
puts guess(7, 3)



# 10 choose 2 ways to place 2 primes correctly.
