=begin

Problem 500!!!
Problem 500
The number of divisors of 120 is 16.
In fact 120 is the smallest number having 16 divisors.

Find the smallest number with 2500500 divisors.
Give your answer modulo 500500507.




2**(500500) <= (a1 +1)(a2 + 1)(a3+1)


1 2   [[2, 1]]
2 4   [[2, 1], [3, 1]]
3 8   [[2, 3], [3, 1]]
4 16  [[2, 3], [3, 1], [5, 1]]
5 32  [[2, 3], [3, 1], [5, 1], [7, 1]]
6 64  [[2, 3], [3, 3], [5, 1], [7, 1]]
7 128 [[2, 3], [3, 3], [5, 1], [7, 1], [11, 1]]
8 256 [[2, 3], [3, 3], [5, 1], [7, 1], [11, 1], [13, 1]]  1081080

      [[2, 7], [3, 3], [5, 1], [7, 1], [11, 1]]




Lets use as our example..

7 128 [[2, 3], [3, 3], [5, 1], [7, 1], [11, 1]] = 83160

[2, 1] [3, 1] [ 5,  1 ] [7, 1] [11, 1] [13, 1] [17, 1] = 510510 which has 128 divisors..





(a1 + 1)(a2 + 1)(a3 + 1)(a4 + 1)(a5 + 1)..(an + 1) = 2**(500500)

(an + 1) must be power of 2 for all n..


An = 1, 3, 7, 15, 31




2*3*5*7*11*13

  x4    x9   x25
[2 1] [3 1] [5 1] [7 1] [11 1] [13 1]


[2 3] [ 3 1 ] [ 5 1] [7 1] [11 1]



Minimize 2**a1 * 3**a2 * 5**a3... etc.m



=end


require './euler_lib.rb'
require 'pp'


class Factor
  
  attr_accessor :prime, :exp,  :next_exp, :next_multiply
  
  def initialize(prime, exp)
    @prime = prime
    @exp = exp
    update_cache
  end

  def update_cache
    @next_exp      = 2*@exp + 1
    @next_multiply = @prime**(@next_exp - @exp)
  end
    
  def bump_exp
    @exp = next_exp
    update_cache
  end  
    
end



class Problem500

  attr_accessor :factors  
   
  def initialize(target_factors)
    @h = HandySieve.fetch(7)
    @target_factors = target_factors
    @factors = []
    @log_cur_factors = 0
  end
  
  def modpow(b,e,m)
    result = 1
    while e > 0
      if (e & 1) == 1
        result = (result * b) % m;
      end
      e = e >> 1;
      b = (b * b) % m;
    end
    return result
  end
  
  
  def smallest
    generate

    answer = 1
    @factors.each do |f|
      answer *= modpow(f.prime, f.exp, 500500507)
      answer = answer % 500500507
    end
    
    answer
    
    
    
    #pp @log_cur_factors
    #pp @factors.map {|f| [f.prime, f.exp] }
    #@factors.inject(1) {|a,c| a = a * c.val }
  end
  
  def generate
    @h.primes do |prime|
      @factors.each do |f|
        while f.next_multiply < prime
          @log_cur_factors += 1
          f.bump_exp
          return if @log_cur_factors == @target_factors
        end        
        break if f.prime > 3000
      end
      @factors.push Factor.new(prime, 1)
      @log_cur_factors += 1
      return if @log_cur_factors == @target_factors    
    end
  end
  
  
  
end


  
s = Problem500.new(500_500)
pp s.smallest





=begin

def sigma_0(n)
  @h.factorize(n).map {|x| x[1] + 1 }.inject(:*)
end

def find_smallest(k)
  n = 1 
  while true
    return n if sigma_0(n) == k
    n += 1
  end
end

1.upto(10) do |i|
  print "#{i} #{2**i}: "
  pp @hfactorize(find_smallest(2**i))
end
=end




