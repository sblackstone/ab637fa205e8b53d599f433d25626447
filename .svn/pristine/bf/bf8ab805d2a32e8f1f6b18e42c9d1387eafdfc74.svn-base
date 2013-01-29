require 'lib'
require 'primes'
require 'perm'

Primes.setup(10000)

def prime_permutations_of(i)
  @prime_perm = []
  arr = i.to_s.split("")
  arr.each_permutation do |i|
    @prime_perm << i.to_i  if Primes.isPrime?(i.to_i)
  end
  return @prime_perm
end


@primes = Primes.primes.reject {|x| x < 1000 }

@primes.each do |p|
  perms = prime_permutations_of(p)
  next if perms.size < 2
  perms.each do |second_number|
    next unless second_number > p
    third_number = second_number + (second_number - p)
    if perms.include?(third_number)
      puts "#{p} #{second_number} #{third_number}"
    end
    
  end
  
end
