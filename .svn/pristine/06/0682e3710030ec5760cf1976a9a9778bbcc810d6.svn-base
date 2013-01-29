SIZE = 10_000_000
require 'pp'

@t_cache = Hash.new(nil)

def transform(n)
  ret = 0
  while n > 0
    ret += (n % 10)**2
    n-= n % 10
    n /= 10
  end
  ret
end



@track = Array.new(SIZE+1, 0)

def search(n) 
  return 1 if n == 1
  return 2 if n == 89
  @track[n] = search(transform(n)) if (@track[n] == 0)
  return @track[n]
end

c = 0
2.upto(SIZE) do |i|
  c +=1 if search(i) == 2
end
puts c




def factorial(n)
  if n == 0
    return 1
  else
    return n * factorial(n-1)
  end
end
