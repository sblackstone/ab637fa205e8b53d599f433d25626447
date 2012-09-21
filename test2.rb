require 'lib'
require 'primes'

Primes.setup(100)

pp Primes.primes

semi = []
Primes.primes.each do |p|
  Primes.primes.each do |q|
    next unless p < q
    semi << p * q
  end
end
semi.sort.uniq.each do |n|  
    sa = 0
    sx = 999999
    1.upto(n-1) do |a|
      next if n.gcd(a) > 1 or (n % a) == 0
      x = 1
      val = modpow(a,x,n)
      while val > 1
        x = x + 1
        val = modpow(a,x,n)
      end
      if x < sx #and x > 2 and x % 2 == 0
        sx = x
        sa = a
      end
      #puts "a: #{a}\tx:#{x}\tn:#{n}"
    end
    puts "Fastest a: #{sa}\tx: #{sx}\tn: #{n}\t #{sa.to_f/n.to_f}"
end
