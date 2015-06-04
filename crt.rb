require 'pp'
require './primes.rb'

Primes.setup(10**7)

def extended_gcd(a, b)
  if a % b == 0
      return 0, 1
  else
      x, y = extended_gcd(b, a % b)
      return y, (x - y * (a / b))
  end
end

def crt(equations)
  #pp equations
  n = equations.map {|e| e[0]}.inject(&:*)
  s = 0
  equations.each do |e|
    ai = e[1]
    ni = e[0]
    ri,si = extended_gcd(ni, n / ni)    
    ei = si*(n / ni)
    s += ai*ei
  end
  d = (s % n).gcd(n)
  return s / d , n
end


def factor(n)
  h = Hash.new(0)
  Primes.primes.each do |p|
    while n % p == 0
      h[p] += 1
      n /= p
    end
    return h if n == 1
  end
end


def solutions_for_p_e(p,e, &block)
  if p > 2
    yield [p**e, -1]
    yield [p**e,  1]
  else
    if e == 1
      yield [2, 1]
    elsif e == 2
      yield [4, 1]
      yield [4, -1]
    else
      yield [p**e,  1]
      yield [p**e, -1]
      yield [p**e, 1 + 2**(e-1)]
      yield [p**e, -1 - 2**(e-1)]
    end
  end
end


def search(facts, arr = [], &block)
  if facts.keys.empty?
    yield crt(arr)
    return
  end
  
  p = facts.keys.first 
  e = facts[p]
  facts.delete(p)

  solutions_for_p_e(p,e) do |s|
    arr.push s
    search(facts, arr, &block)
    arr.pop
  end
  facts[p] = e
end

def roots_of_1(n, &block)
  f = factor(n)
  search(f) do |eq|
    yield eq[0] % eq[1]
  end
end

def predict(n)
  sum = 0
  c   = 0
  roots_of_1(n) do |a|
    sum += n.gcd(a+1)
  end
  return sum
end

def f(a,b,n,x)
  (a*x + b) % n
end

def test(n, quiet = false)
  puts "N: #{n}" unless quiet
  sum = 0
  1.upto(n-1) do |a|
    0.upto(n-1) do |b|
      qtmp = quiet
      hsh = Hash.new(0)
      0.upto(n-1) do |x|
        v = f(a,b,n,x)
        hsh[x] = f(a,b,n,x)
      end
      not_retraction = false
      0.upto(n-1) do |i|
        not_retraction = true unless hsh[hsh[i]] == i
      end
      unless not_retraction or quiet
        print "\t(#{a},#{b})"
        0.upto(n-1) do |i|
         #print " #{hsh[i]} "
        end
#        print not_retraction ? "N" : "Y"
#        print " "
#        print (a+1)*b % n == 0 ? "Y" : "N"
        puts
      end
      sum +=1 unless not_retraction
      quiet = qtmp
    end
  end
  sum
end

10.upto(100) do |n|
  actual = test(n,true)
  prediction = predict(n)
  puts "#{n}: #{actual}\t#{prediction}\t#{actual-prediction}" #unless actual == prediction
  #puts
end


