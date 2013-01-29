require 'pp'

class BitBank
  attr_accessor :bitbank
  def initialize(size)
    @bitbank = Array.new((size / 62) + 1, ~0)
  end  
  
  def set(i)
    @bitbank[(i / 62)] |= 1 << (i % 62) 
  end

  def clear(i)
    @bitbank[(i / 62)] &= ~(1 << (i % 62))
  end
  
  def get(i)
    (@bitbank[(i / 62)] & (1 << (i % 62))) > 0
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
    
    return true  if i ==2 || i == 3 || i == 5 || i == 7 || i == 11 || i == 13 || i == 17 || i == 19
    return false if i % 2 == 0
    return false if i % 3 == 0
    return false if i % 5 == 0
    return false if i % 7 == 0
    return false if i % 11 == 0
    return false if i % 13 == 0
    return false if i % 17 == 0
    return false if i % 19 == 0

    return @@bank.get(i)
  end
  
  def self.setup(max)
    @@max = max
    @@bank = BitBank.new(max)    
    @@bank.clear(0)
    @@bank.clear(1)
    puts "Created"
    19.upto(Math.sqrt(max)) do |i|
      if (@@bank.get(i)) 
        j = i**2
        while j <= max
          @@bank.clear(j)
          j += i
        end
      end
    end
  end
end


Primes.setup(100_000_000)

1.upto(100) do |i|
  puts i if Primes.isPrime?(i)
end
