=begin
An Arithmetic Geometric sequence
Problem 235
Given is the arithmetic-geometric sequence u(k) = (900-3k)r**whichk-1.
Let s(n) = Σk=1...nu(k).

Find the value of r for which s(5000) = -600,000,000,000.

Give your answer rounded to 12 places behind the decimal point.

N = K:  [ A + (k-1)d]  *   r**(k-1)
A = 900 [ 900 + (k-1)d] * r**(k-1)
D = 3   [ 900]


k = 1  (900 - 3)  * 1
k = 2  (900 - 6)  * r
k = 3  (900 - 9)  * r^2
k = 4  (900 - 12) * r^3
k = 5  (900 - 15) * r^4

----

k = 1 to 5: 

Sn  =  897 + 894r + 891r^2 + 888r^3 + 885r^4
rSn =        897r + 894r^2 + 891r^3 + 888r^4 + 885r^5

Sn - rSn = 897 - 3r - 3r^2 - 3r^3 - 3r^4 -885r^5

Sn  = 897 - 3r - 3r^2 - 3r^3 - 3r^4 -885r^5 / (1-r)

             

k = 5000  -4100r^4999



((897 - (900 - 3*ROUNDS) * r**ROUNDS) + (-3 * ((1 - r**ROUNDS)/(1 - r)) + 3)) / (1 - r)

((897 - (-14100) * r**5000) + (-3 * ((1 - r**5000)/(1 - r)) + 3)) / (1 - r)


=end

=begin
ROUNDS = 5000

def u(k,r)
  (900 - 3*k) * r**(k-1)
end


def s2(r)
  sum = 897 - (900 - 3*ROUNDS) * r**ROUNDS
  1.upto(ROUNDS-1) do |k|
    sum -= 3*r**k
  end
  sum / (1-r)
end

def s(r)
  sum = 0
  1.upto(ROUNDS) do |k|
    sum += u(k,r)
  end
  return(sum)
end

def s2_test(r)
  sum = 0
  #sum = 897 - (900 - 3*ROUNDS) * r**ROUNDS
  1.upto(ROUNDS-1) do |k|
    sum -= 3*r**k
  end
  #sum /= (1-r)
  sum
end
=end

=begin

def s2(r)
  ((897 + 14100* r**5000) + (-3 * ((1 - r**5000)/(1 - r)) + 3)) / (1 - r)
end

def s2_dr(r)
  (70500000*r**4999 + (15000*r**4999)/(1 - r) - (3*(1 - r**5000))/(1 - r)^2)/(1 - r) + (900 + 14100*r**5000 - (3 *(1 - r**5000))/(1 - r))/(1 - r)**2
end

=end

ROUNDS = 5000

def s2(r)
  sum = 897 - (900 - 3*ROUNDS) * r**ROUNDS
  1.upto(ROUNDS-1) do |k|
    sum -= 3*r**k
  end
  sum / (1-r)
end


s2(5)