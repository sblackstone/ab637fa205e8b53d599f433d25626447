require 'pp'

class Integer
   def prime?
     n = self.abs()
     return true if n == 2
     return false if n == 1 || n & 1 == 0

     # cf. http://betterexplained.com/articles/another-look-at-prime-numbers/ and
     # http://everything2.com/index.pl?node_id=1176369

     return false if n > 3 && n % 6 != 1 && n % 6 != 5     # added

     d = n-1
     d >>= 1 while d & 1 == 0
     20.times do                               # 20 = k from above
       a = rand(n-2) + 1
       t = d
       y = ModMath.pow(a,t,n)                  # implemented below
       while t != n-1 && y != 1 && y != n-1
         y = (y * y) % n
         t <<= 1
       end
       return false if y != n-1 && t & 1 == 0
     end
     return true
   end
end
 
module ModMath
   def ModMath.pow(base, power, mod)
     result = 1
     while power > 0
       result = (result * base) % mod if power & 1 == 1
       base = (base * base) % mod
       power >>= 1;
     end
     result
   end
end



class Primes
  def self.max
    @@max
  end
  def self.primes
    @@primes
  end

  def self.isPrime?(i)
    if i > @@max
      return i.prime?
    else
      @@prime_hash[i]
    end
  end

  @@primes_str = Hash.new
  def self.isPrimeStr?(s)
    @@primes_str[s] ||= Primes.isPrime?(s.to_i)
  end

  def self.upto(i)
    set = []
    self.primes.each do |p|
      (p <= i) ? (set << p) : (return set)
    end
  end

  @@pfc = Hash.new
  def self.prime_factor_count(i)
    @@pfc[i] ||= Primes.factors_of(i).size
  end
  
  def self.factors_of(i)
    raise "OUT OF DOMAIN" if i > @@max
    facts = []
    Primes.primes.each do |p|
      break if i == 1
      if i % p == 0
        facts << p
        while i % p != 0
          i = i / p
        end
      end    
    end    
    return facts
  end
  
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

def gcd(a,b)
  while b > 0
    t = b
    b = a % b
    a = t
  end
  return a
end
