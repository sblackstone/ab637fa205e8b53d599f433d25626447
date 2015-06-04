=begin



n^15 + 1 = (n+1) (n^4-n^3+n^2-n+1) (n^10-n^5+1)

n^15 + 1




=end

require './euler_lib.rb'
#Primes.setup(10**8)

def s(n, bound)
  v = n**15 + 1
  factors = Array.new
  factors.push (n+1)
  v /= (n+1)
  factors.push (n**4 - n**3 + n**2 - n + 1)
  v /= (n**4 - n**3 + n**2 - n + 1)
  factors.push(n**10 - n**5 + 1)
  v /= (n**10 - n**5 + 1)
  return factors
end

pp s(10, 10**12)
