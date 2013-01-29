require 'lib'

@primes,@prime_hash = primes_and_hash(1000000)
puts "generated primes"
def rotations(p)
  ans = []
  0.upto(p.size-1) do |i|
    a   = p.pop
    p = [a,p].flatten
    ans << "#{p.join}"
  end
  return ans
end
def prime_trunc(p)
  pstr1 = p.to_s
  pstr2 = p.to_s
  while pstr1.size > 0
    return false unless @prime_hash[pstr1.to_i]
    return false unless @prime_hash[pstr2.to_i]
    pstr1 = pstr1[1..99]
    pstr2 = pstr2.reverse[1..99].reverse
  end
  puts "yes"
  return true
end

ans = []
@primes.each do |p|
  next if p < 8
  break if ans.size > 11
  if prime_trunc(p)
    ans << p
    pp p
  end
end
puts "---"
pp ans
pp ans.size
pp ans.inject(:+)