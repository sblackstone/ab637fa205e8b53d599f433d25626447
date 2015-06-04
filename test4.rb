require 'pp'

def l(s)
  cur = s[0]
  ccur = 1
  max = 1
  1.upto(s.length - 1) do |i|
    if s[i] == cur
      ccur += 1
    else      
      max = ccur if max < ccur       
      ccur = 1
      cur = s[i]
    end    
  end
  max = ccur if max < ccur       
  return max

end

def fact(n)
  n == 0 ? 1 : n*fact(n-1)
end


def sol1(n,k)
  total = 0
  0.upto(n-k) do |i|
    sub = 1
    sub *= (n-1) if i > 0
    sub *= n**(i-1) if i > 1
    sub *= n
    sub *= (n-1) if (n - k  - i) > 0
    sub *= (n)**(n - k -i - 1) if (n - k  - i) > 1
    total += sub
  end
  total -= n*(n-1) if n % 2 == 0 && k == n / 2
  return total
end

 
 
def sol2(n,k)
  total = 0
  0.upto(n-k) do |i|
    sub = 1
    
  end
  
end

k = 2
 
4.upto(10) do |n|
  nk1 = n - k - 1
  guess = n*(n-1)*n**nk1
  guess -= n*(n-1)*(n-1) if nk1 > 0
  guess -= n*(n-1)*n*(nk1-2) if nk1 > 1
  puts "#{n}: #{guess}"
end

 
puts sol1(6,2)
exit

 
=begin
2.upto(6) do |a|
  1.upto(6) do |b|
    1.upto(6) do |c|
      1.upto(6) do |d|
        state = [1,1,a,b,c,d]
        pp state if l(state) > 2
      end
    end
  end
end
=end





1.upto(6) do |a|
  1.upto(6) do |b|
    1.upto(6) do |c|
      1.upto(6) do |d|
        1.upto(6) do |e|
          1.upto(6) do |f|      
            state = [a,b,c,d,e,f]
            pp state if a==b and c ==d and d==e and e != f
          end
        end
      end
    end
  end
end

