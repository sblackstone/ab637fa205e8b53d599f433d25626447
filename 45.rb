
@hash = Hash.new(0)

def tri(n) 
  (n * (n+1)) / 2
end

def pent(n)
  n * (3*n - 1) / 2
end

def hex(n)
  n * (2*n -1)
end


i = 2
while true
   i = i + 1
   t = tri(i)
   p = pent(i)
   h = hex(i)
   @hash[t] = @hash[t] + 1
   @hash[p] = @hash[p] + 1
   @hash[h] = @hash[h] + 1
   if @hash[t] > 2 or @hash[p] > 2 or @hash[h] > 2
     puts t
     exit if t > 40755
   end
end
