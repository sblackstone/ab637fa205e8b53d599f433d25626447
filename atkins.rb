require 'pp'

class AtkinsArray < Array
  def flip(n)
    self[n] = (self[n] + 1) % 2
  end

  def flip_solutions(xc, yc, n)
    1.upto(Math.sqrt(n)) do |x|
      fx2 = xc*x*x
      1.upto(Math.sqrt(n)) do |y|
        s = fx2 + y*y*yc
        break if s > n
        flip()
      end
      
    end
    
  end
  
  
end



def atkins(limit)
  s = [1,7,11,13,17,19,23,29, 31,37,41,43,47,49,53,59]
  0.upto(limit / 60) do |w|
    s.each do |x|
      is_prime[60*w + x] = 0
    end
    
  end
  
  
end
