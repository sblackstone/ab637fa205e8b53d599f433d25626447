require 'lib'

def isPrime?(n)
  # Fermat's primality test.
  10.times {
    a = rand(n - 1) + 1
    return false if modpow(a,n-1,n) > 1
  }
  true
end


def pan(arr,str)
  if arr.empty? and isPrime?(str.to_i)
    puts str
    exit
  elsif (arr - [2,4,5,6,8]).empty?
    return
  else
    arr.each do |x|
      pan(arr - [x], str+x.to_s)
    end
  end
end

@arr = [7,6,5,4,3,2,1]
while @arr.size > 0
  pan(@arr, "")
  @arr.delete_at(0)
end
