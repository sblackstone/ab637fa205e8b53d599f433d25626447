=begin
Let d(p,n,0) be the multiplicative inverse of n modulo prime p, defined as n × d(p,n,0) = 1 mod p.
Let d(p,n,k) = ∑ni=1d(p,i,k−1) for k ≥ 1.
Let D(a,b,k) = ∑(d(p,p-1,k) mod p) for all primes a ≤ p < a + b.

You are given:

D(101,1,10) = 45
D(103,102,102) = 8334
D(106,103,103) = 38162302
Find D(109,105,105).
    

d(101, 1, 10)



d(5, 4, 3) = d(5,1,2) + d(5,2,2) + d(5,3,2) + d(5,4,2)


d(5,1,2) = d(5,1,1) 
d(5,2,2) = d(5,1,1) + d(5,2,1)
d(5,3,2) = d(5,1,1) + d(5,2,1) + d(5,3,1)
d(5,4,2) = d(5,1,1) + d(5,2,1) + d(5,3,1) + d(5,4,1)


= 4*d(5,1,1) + 3*d(5,2,1) + 2*d(5,3,1) + d(5,4,1)


A = d(5,1,1) = 1
B = d(5,2,1) = d(5,1,0) + d(5,2,0)
C = d(5,3,1) = d(5,1,0) + d(5,2,0) + d(5,3,0)




4A + 3B + 2C + 


=end

require './euler_lib.rb'
@h = HandySieve.fetch(6)

@inv_cache = Hash.new

def inv(p,n)
  @inv_cache["#{p}:#{n}"] ||= do_inv(p,n)
end


def do_inv(p,n)
  ans = extended_gcd(p,n)
  ans[1] % p
end



puts inv(5,1)
exit


@d_cache = Hash.new

def d(p,n,k)
  #puts "d(#{p},#{n},#{k})"
  @d_cache["#{p}:#{n}:#{k}"] ||= do_d(p,n,k)
  return @d_cache["#{p}:#{n}:#{k}"]
end


def do_d(p,n,k)
  return inv(p,n) if k == 0
  sum = 0
  1.upto(n) do |i|
    sum += d(p,i, k - 1)
  end
  sum
end







def D(a,b,k)
  sum = 0
  @h.primes_upto(a+b-1) do |p|
    next if p < a
    sum += d(p,p-1,k) %p 
  end
  sum
end

puts D(101,1,10)



