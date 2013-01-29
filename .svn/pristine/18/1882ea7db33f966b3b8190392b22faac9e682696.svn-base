require 'lib'

@primes = [2,3,5,7,11,13,17]
@count = 0

def pan(arr,str)
  if str.size > 3
    i = str[-3,3].to_i
    p = @primes[str.size - 4]
    return unless i % p == 0
  end
  if str.size == 10
    @count = @count + str.to_i
    return
  end
  arr.each do |x|
    pan(arr - [x], str+x.to_s)
 end
end

pan([9,8,7,6,5,4,3,2,1,0], "")
puts @count