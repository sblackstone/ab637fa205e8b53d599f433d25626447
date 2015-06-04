=begin
Efficient exponentiation
Problem 122
The most naive way of computing n15 requires fourteen multiplications:

n × n × ... × n = n15

But using a "binary" method you can compute it in six multiplications:

n × n = n2
n2 × n2 = n4
n4 × n4 = n8
n8 × n4 = n12
n12 × n2 = n14
n14 × n = n15

However it is yet possible to compute it in only five multiplications:

n × n = n2
n2 × n = n3
n3 × n3 = n6
n6 × n6 = n12
n12 × n3 = n15

We shall define m(k) to be the minimum number of multiplications to compute nk; for example m(15) = 5.

For 1 ≤ k ≤ 200, find ∑ m(k).


Best way to 1:

n


Best way to 2:

n*n

Best way to 3: 

(n*n) * n

Best way to 4:

(n*n), n**2 * n**2


Best way to 5: 

  



=end

require 'pp'


@best_way_cache = Hash.new(9999)

def best_way(n, cur)
  if cur.last == n
    if cur.length < @best_way_cache[n] - 1
      @best_way_cache[n] = cur.length - 1
      pp cur
    end    
    return
  end
  return if cur.length > @best_way_cache[n]
  0.upto(cur.length - 1) do |i|
    i.upto(cur.length - 1) do |j|
      v = cur[i] + cur[j]
      unless cur.include? v
        cur.push v 
        best_way n,cur
        cur.pop
      end
    end
  end
  
end



best_way(200, [1])
pp @best_way_cache


exit


