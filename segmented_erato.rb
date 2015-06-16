require 'rubygems'
require 'pp'
require 'malloc'
require 'memory_profiler'




FIXNUM_SIZE = 61

class BitmapSpeed

  def initialize(bits)
    @m = Array.new(bits, 0)
  end


  def fill(i)
    @m.fill(i)
  end
  
  def set(i)
    @m[i] = 1
  end
  def test(i)
    @m[i] == 1
  end
  def clear(i)
    @m[i] = 0
  end
  
end
=begin
class BitmapMemory

  def initialize(bits)
    @m = Array.new((bits / FIXNUM_SIZE.to_f).ceil, 0)
  end

  def set(i)
    @m[(i/FIXNUM_SIZE)] |= 1 << (i % FIXNUM_SIZE)
  end
  def test(i)
    (@m[(i/FIXNUM_SIZE)] >> (i % FIXNUM_SIZE) & 1) > 0
  end
  def clear(i)
    @m[(i/FIXNUM_SIZE)] &= ~(1 << (i % FIXNUM_SIZE))
  end
  
end
=end



def segmented_sieve(limit, segment_size)
  sqrt = Math.sqrt(limit)
  count = (limit < 2) ? 0 : 1
  s = 2
  n = 3
  sieve = BitmapSpeed.new(segment_size + 1)
  is_prime = BitmapSpeed.new(sqrt+1);
  is_prime.fill(1)
  2.upto(sqrt) do |i|
    if is_prime.test(i)
      j = i*i
      while j <= sqrt
        is_prime.clear(j)
        j += i
      end
      
    end    
  end
  
  primes = Array.new
  nextv  = Array.new 
  low = 0
  
  while low <= limit
    sieve.fill(1)
    high = [low+ segment_size -1, limit].min

    while s*s <= high
      if is_prime.test(s)
        primes.push s
        nextv.push s*s - low   
      end                
      s += 1
    end
    
    1.upto(primes.length - 1) do |i|
      j = nextv[i]
      k = primes[i]*2
      while j < segment_size
        sieve.clear(j)
        j += k
      end           
      nextv[i] = j - segment_size

    end
    while n <= high
      if (sieve.test(n - low))
        count += 1
        #puts n
      end      
      n += 2
    end    
    low += segment_size
  end
  

  puts count
  
end

segmented_sieve(10**9, 10**6)
