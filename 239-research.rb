require 'pp'




def fact(n)
  return n == 0 ? 1 : n * fact(n-1)
end



def nCk(n,k)
  return 1 if k == 0
  fact(n) / (fact(k) * fact(n-k))
end

def wtf(num_primes,slots)
  return 0 if slots > num_primes
  nums = (0..(num_primes-1)).to_a
  h = Hash.new
  nums.combination(slots) do |c|
    c.permutation do |p|
      bad = false
      0.upto(slots-1) do |s|
        if p[s] == s
          bad = true
          break
        end
      end
      h[p.join(":")] = true unless bad
    end    
  end
  h.keys.length
end


def t(n,k)
  sum = 0
  0.upto(k) do |j|
    sum += ((-1)**j)*nCk(k,j)*fact(n-j)
  end
  sum / fact(n-k)
end

1.upto(10) do |n|
  1.upto(n) do |k|
    puts t(n,k)
  end
  puts
end




def guess(i,j)
  t(i,j)
end


3.upto(7) do |i|
  1.upto(i) do |j|
    puts "#{wtf(i,j)} #{guess(i,j)}"
  end
  puts
end






