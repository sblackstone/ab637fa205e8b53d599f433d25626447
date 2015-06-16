require './primes.rb'

Primes.setup(2_000_000)

def f(x)
  s = 1
  Primes.primes.each do |p|
    break if p > 100
    s *= Math.sin(Math::PI*x / 2) 
  end
  return s
end



t = false
a = 0
1_000_000.upto(1_000_100) do |i|
  f_i = f(i)
  if f_i == -1
    if t == false
      t = true
      a = i
    else
      a.upto(i) do |k|
        puts "#{i}: #{Primes.isPrime?(k)}"        
      end
      exit      
    end
    
  end
  
    
  puts "#{i} #{Primes.isPrime?(i)} #{f(i)}"
      

end
