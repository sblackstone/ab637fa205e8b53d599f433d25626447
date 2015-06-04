=begin
Repunit nonfactors
Problem 133
A number consisting entirely of ones is called a repunit. We shall define R(k) to be a repunit of length k; for example, R(6) = 111111.

Let us consider repunits of the form R(10n).

Although R(10), R(100), or R(1000) are not divisible by 17, R(10000) is divisible by 17. Yet there is no value of n for which R(10^n) will divide by 19. 

In fact, it is remarkable that 11, 17, 41, and 73 are the only four primes below one-hundred that can be a factor of R(10^n).

Find the sum of all the primes below one-hundred thousand that will never be a factor of R(10n).




10**10**n 


n = 1: 10**10
n = 2: 10**(10**2) = 10*100
n = 3: 10**(10**3) = 10*1000
n = 4: 10**(10**4) = 10*10000


(10**(10**n) - 1) / 9 = p*k

10**(10**n) - 1 = 9pk


10**(10**n) - 1
----------------  = 0 mod p
      9 


10**(10**n) - 1 = 0 mod p

10**(10**n) = 1 mod p










Because there are n repunits but only n-1 non-zero residues modulo n there exist two repunits Ri(b) and Rj(b) with 1≤i<j≤n such that Ri(b) and Rj(b) have the same residue modulo n. 

It follows that Rj(b) - Ri(b) has residue 0 modulo n, i.e. is divisible by n. 

Rj(b) - Ri(b) consists of j - i ones followed by i zeroes. 

Thus, Rj(b) - Ri(b) = Rj-i(b) x 10i . 

Since n divides the left-hand side it also divides the right-hand side and since n and b are relative prime n must divide Rj-i(b) contradicting the original assumption.









=end





require './euler_lib.rb'

@h = HandySieve.fetch(6)


def test(p)
  v = mod_pow(10, 10**p, p)
  return v == 1
  @seen = Hash.new
  i = 1
  while true
    v = mod_pow(10, 10**i, p)
    return true if v == 1
    return false if @seen[v]
    @seen[v] = true
    i += 1
  end  
end


@h.primes_upto(100_000) do |p|
  puts "#{p}: #{test(p)}"
end


exit
@h.primes_upto(200) do |p|
  print "P=#{p}\t"
  print "#{p%4}\t"
  1.upto(20) do |j|
    print mod_pow(10, 10**j, p)
    print "\t"
  end
  puts  
end
