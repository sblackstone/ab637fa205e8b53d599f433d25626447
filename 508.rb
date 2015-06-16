=begin
Integers in base i-1
Problem 508
Consider the Gaussian integer i-1. A base i-1 representation of a Gaussian integer a+bi is a finite sequence of digits dn-1dn-2...d1d0 such that:

a+bi = dn-1(i-1)n-1 + dn-2(i-1)n-2 + ... + d1(i-1) + d0
Each dk is in {0,1}
There are no leading zeroes, i.e. dn-1 ≠ 0, unless a+bi is itself 0
Here are base i-1 representations of a few Gaussian integers:

11+24i → 111010110001101
24-11i → 110010110011
8+0i → 111000000
-5+0i → 11001101
0+0i → 0

Remarkably, every Gaussian integer has a unique base i-1 representation!

Define f(a+bi) as the number of 1s in the unique base i-1 representation of a+bi. For example, f(11+24i) = 9 and f(24-11i) = 7.

Define B(L) as the sum of f(a+bi) for all integers a, b such that |a| ≤ L and |b| ≤ L. For example, B(500) = 10795060.

Find B(1015) mod 1 000 000 007.
=end

require 'pp'

=begin

def eval(coeffs)
  if coeffs.class == String
    return eval(coeffs.split("").map{|x| x.to_i })
  end
  # Array of coefficients
  # coeffs[0] = LSD
  b = Complex(1,0)
  t = Complex(0,0)
  coeffs.reverse.each do |i|
    t += i * b
    b *= Complex(-1, 1)
  end
  t
end

#puts eval "111000000"


def gen_coeffs_brute(target, coeffs = [])
  if eval(coeffs) == target
    return coeffs
  end
  if coeffs.length < 100
    0.upto(1) do |i|
      coeffs.unshift(i)
      a = gen_coeffs_brute(target, coeffs)
      return a unless a.nil?      
      coeffs.shift
    end
  end
  return nil
end

#coeffs = gen_coeffs_brute(Complex(-5,0))
#puts "Check #{coeffs.join(",")} = #{eval(coeffs)}"

a = [0]

while true
  pp a
  if a.last == 0
    a[a.length - 1] = 1
  else 
    a.push 0
  end
end

=end

def eval(n, debug=false)
  b = Complex(1,0)
  t = Complex(0,0)
  
  while n > 0
    if n % 2 == 1 
      print "1" if debug
      t += b
      n = (n-1) / 2
    else
      n = n / 2
      print "0" if debug
    end
    b *= Complex(-1, 1)
  end
  puts if debug

  return t
end

def brute(target)
  k = 0
  while eval(k) != target
    k += 1
  end
  return k
  
end

c = 100

@hash = Hash.new

t = 1
while c > 0
  b = eval(t)
  imag = b.imaginary
  real = b.real
  if imag.abs <= 10 and b.real.abs <= 10
    c -=1
    @hash["#{imag} #{real}"] = t
  end  
  t += 1
end

pp @hash












