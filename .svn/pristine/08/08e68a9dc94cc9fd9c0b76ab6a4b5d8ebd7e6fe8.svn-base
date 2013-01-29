require 'pp'



def dist(n,k,val,track)
  if n == 0
    @track[val] += 1
    return
  end
  1.upto(k) do |i|
    dist(n-1,k,val+i,track)
  end
end

@track = Hash.new(0)


dist(20,20,0,@track)


pp @track