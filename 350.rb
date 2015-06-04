=begin

Constraining the least greatest and the greatest least
Problem 350
A list of size n is a sequence of n natural numbers.
Examples are (2,4,6), (2,6,4), (10,6,15,6), and (11).

The greatest common divisor, or gcd, of a list is the largest natural number that divides all entries of the list. 
Examples: gcd(2,6,4) = 2, gcd(10,6,15,6) = 1 and gcd(11) = 11.

The least common multiple, or lcm, of a list is the smallest natural number divisible by each entry of the list. 
Examples: lcm(2,6,4) = 12, lcm(10,6,15,6) = 30 and lcm(11) = 11.

Let f(G, L, N) be the number of lists of size N with gcd ≥ G and lcm ≤ L. For example:

f(10, 100, 1) = 91.


  
   G    L  N
f(10, 100, 2) = 327.

150
200 

gcd = 150
lcm = 1320




Greatest Common divisor of all elements >= G <=> 10  is the largest  number that can commonly divide all the elements.
Least Common Multiple   of all elements <= L <=> 100 is the smallest number that every element can commonly divide.








f(10, 100, 3) = 1135.
f(10, 100, 1000) mod 1014 = 3286053.

Find f(106, 1012, 1018) mod 1014.

=end

def lcm(a,b)
  return a*b / a.gcd(b)
end



def brute(g,l,n, cur = [])
  if cur.size == n
    pp cur
    return 
  end

end


1.upto(100) do |a|
  a.upto(100) do |b|
    match = a.gcd(b) >= 5 and lcm(a,b) <= 100 ? "YES" : "NO"
    puts "#{a} #{b} #{a.gcd(b)} #{lcm(a,b)} #{match}"
  end
  
end

exit
1.upto(2000) do |a|
  (a+1).upto(2000) do |b|
    puts "#{a} #{b}" if a.gcd(b) >= 5 and lcm(a,b) <= 20
  end  
end


  
  