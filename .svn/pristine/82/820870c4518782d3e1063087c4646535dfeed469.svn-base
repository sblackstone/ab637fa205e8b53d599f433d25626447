require 'lib'

@primes,@prime_hash = primes_and_hash(1000000)


def rotations(p)
  ans = []
  0.upto(p.size-1) do |i|
    a   = p.pop
    p = [a,p].flatten
    ans << "#{p.join}"
  end
  return ans
end

def all_prime_rotations(p)
  return true if p.size == 1
  0.upto(p.size-1) do |i|
    a   = p.pop
    p = [a,p].flatten
    return false unless @prime_hash[p.join.to_i]
  end
  return true
end

ans = []
@primes.each do |p|
  break if p > 1000000
  if all_prime_rotations(p.to_s.split(""))
    ans << p
    pp p
  end
end
pp ans
pp ans.size