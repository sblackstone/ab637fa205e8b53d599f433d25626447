require './primes.rb'

Primes.setup(44)

a = Array.new(44,0)

Primes.primes.each do |p|
  1.upto(43) do |i|
    while i % p == 0
      a[p] += 1
      i = i / p
    end      
  end
end

Primes.primes.each do |p|
  if a[p] > 0
    puts "#{p}: #{a[p]}"
  end
end




