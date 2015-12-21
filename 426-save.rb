
require 'pp'

def puts_arr(a)
  a.join("").gsub(/0+$/,"").gsub(/^0+/, "").split("").each do |i|
    print i == "1" ? "*" : "."
  end
  puts
  
end

def puts_c_boxes(a)
  ans = []
  c = 0
  a.each do |n|
    if n == 1
      c += 1
    else
      ans.push c if c > 0
      c = 0
    end
  end
  if c > 0
    ans.push c
  end
  
  return ans
end


def create_array(config)
  @arr = Array.new
  @cur = 0
  i = 0
  config.each do |i|
    @cur = (@cur + 1) % 2
    i.times do 
      @arr.push @cur
    end
  end
  return @arr
end


t = Array.new
s = 290797


0.upto(10) do |i|
  t[i] = (s % 64) + 1
  s = s**2 % 50515093
end
pp t
@arr = create_array(t)


c = 0
print "Round 0: "
puts_arr(@arr)
while true
  c += 1
  @tmp = @arr.clone

  0.upto(@tmp.size-1) do |i|
    if @tmp[i] == 1
      @arr[i] = 0
      j = i + 1
      while @arr[j] == 1
        j += 1
      end
      @arr[j] = 1
    end
  end
  while @arr.first == 0
    @arr.shift
  end
  print "Round #{c}: "
  pp puts_c_boxes(@arr)
  exit if c == 256
end

##







