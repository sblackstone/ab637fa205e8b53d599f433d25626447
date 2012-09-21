# largest 4th - 84**4 
# largest 3rd - 369
# largest 2nd - 7072
require 'primes'
SIZE = 50_000_000

Primes.setup(7072)

values = Hash.new(nil)
count = 0
Primes.primes.each do |second|
  break if second**2 >= SIZE
  Primes.primes.each do |third|
    break if third**3 >= SIZE
    break if third**3 + second**2 >= SIZE
    Primes.primes.each do |forth|
      break if forth**4 >= SIZE
      v = second**2 + third**3 + forth**4
      break if v >= SIZE
      #puts "#{second}**2 + #{third}**3 + #{forth}**4 #{v}"
      if values[v].nil?
        values[v] = true
        count += 1
      end
    end
  end
end
puts count

  
  