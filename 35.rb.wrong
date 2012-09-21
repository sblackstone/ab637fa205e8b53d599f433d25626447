require 'lib'

@primes,@prime_hash = primes_and_hash(1000000)


def digit_permutation(digits)
  ans = []
  return digits if digits.size == 1
  digits.each_index do |i|
    d = digits[i]
    dtmp = digits.clone
    dtmp.delete_at(i)
    ans << digit_permutation(dtmp).map {|x| "#{d}#{x}"}
  end
  return ans.flatten
end


def digit_permutations(i)
  digit_permutation(i.to_s.split("")).map {|x| x.to_i}
end


def all_prime?(x)
  x.each {|i| return false unless @prime_hash[i]}
  return true
end

@primes = [197]

@primes.each do |p|
  dp = digit_permutations(p)
  pp dp
  pp all_prime?(dp)
end
