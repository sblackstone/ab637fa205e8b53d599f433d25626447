=begin
Prime triplets
Problem 196
Build a triangle from all positive integers in the following way:

 1
 2  3
 4  5  6
 7  8  9 10
11 12 13 14 15
16 17 18 19 20 21
22 23 24 25 26 27 28
29 30 31 32 33 34 35 36
37 38 39 40 41 42 43 44 45
46 47 48 49 50 51 52 53 54 55
56 57 58 59 60 61 62 63 64 65 66
. . .

Each positive integer has up to eight neighbours in the triangle.

A set of three primes is called a prime triplet if one of the three primes has the other two as neighbours in the triangle.

For example, in the second row, the prime numbers 2 and 3 are elements of some prime triplet.

If row 8 is considered, it contains two primes which are elements of some prime triplet, i.e. 29 and 31.
If row 9 is considered, it contains only one prime which is an element of some prime triplet: 37.

Define S(n) as the sum of the primes in row n which are elements of any prime triplet.
Then S(8)=60 and S(9)=37.

You are given that S(10000)=950007619.

Find  S(5678027) + S(7208785).


row(1) starts with 1
row(k) starts with (k-1)th triangle number + 1 and has k elements.



=end
require './euler_lib.rb'


@h = HandySieve.fetch(7)

def tri(n)
  n*(n+1) / 2
end


def elements_in_row(n) 
  k = tri(n-1) + 1
  i = 1
  k.upto(k+n-1) do |y|
    yield y, i
    i += 1
  end
end


def neighbors(n, row, col)
  
end




elements_in_row(9) do |n, idx|
  puts "N = #{n}"
  

end



=begin

def fast_prime(n)
  return false if n < 2
  return false if n % 2 == 0
  return false if n % 3 == 0
  return false if n % 5 == 0   
  
  @base = [31,73]
  d = n-1
  d >>= 1 while d & 1 == 0
  @base.each do |a|
    return true if a == n
    t = d
    y = ModMath.pow(a,t,n)
    while t != n-1 && y != 1 && y != n-1
      y = (y * y) % n
      t <<= 1
    end
    return false if y != n-1 && t & 1 == 0
  end
  return true
end



def tri(n)
  n*(n+1) / 2
end


def first_in_row(k)
  if k == 1
    return 1
  else
    tri(k-1) + 1   
  end
end

def row(k)
  fir = first_in_row(k)
  fir.upto(fir + (k-1)) do |j|
     yield j if fast_prime(j) 
  end
end

def neighbors_of_n_which_is_in_row_k(n,k)
  fir = first_in_row(k)
  tk  = tri(k)
  puts n - k if n != fir
  puts n - k + 1 if n != tk
  puts n - k + 2 if n != tk
  puts n - 1 if n != fir
  puts n + 1 if n != tk
  puts n + k - 1 if n != fir
  puts n + k 
  puts n + k + 1
end

puts first_in_row(7208785)
exit

#pp eighbors_of_n_which_is_in_row_k(31,8)
row(5678027) do |y|
end


=end