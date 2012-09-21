require 'pp'

class Primes
  def self.max
    @@max
  end
  def self.primes
    @@primes
  end
  def self.isPrime?(i)
    @@primes.include?(i)
  end

  def self.setup(max)
    @@max    = max
    @@primes = (0..(max+1)).to_a
    @@primes[0] = nil
    @@primes[1] = nil
    fin = Math.sqrt(@@max)
    2.upto(fin+1) do |i|
      next unless @@primes[i]
      k = 2*i
      while k < @@max+1
        @@primes[k] = nil
        k = k + i
      end
    end
    @@primes.compact!
  end
end


