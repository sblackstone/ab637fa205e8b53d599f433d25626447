require 'pp'

@pfactors = [2,3,5]

def find(len,cur, factors)
  if len == 0 
    f = 1
    0.upto(@pfactors.length - 1) do |i|
      f *= @pfactors[i] if cur[i] > 0
    end
    factors << f
    return
  end
  0.upto(1) do |i|
    cur.push(i)
    find(len-1, cur, factors)
    cur.pop
  end  
end



@f = []
find(3,[], @f)
pp @f.sort