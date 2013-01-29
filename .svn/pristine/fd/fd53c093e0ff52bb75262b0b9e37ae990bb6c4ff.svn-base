require 'primes'

max = 10000

Primes.setup(max) 

i = 7

while true
  i = i + 2
  next if Primes.isPrime?(i)
  Primes.primes.each do |p|
    raise "not found: #{i}" if p > i
    s = (i - p) / 2.0
    if Math.sqrt(s) == Math.sqrt(s).round
      puts "#{i} = #{p} + 2*#{Math.sqrt(s)}**2"
      break
    end

    
  end
  
end
