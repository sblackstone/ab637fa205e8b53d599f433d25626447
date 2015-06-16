
require 'pp'

def puts_arr(a)
  a.join("").gsub(/0+$/,"").gsub(/^0+/, "").split("").each do |i|
    print i == "1" ? "*" : "."
  end
  puts
  
end

def puts_c_boxes(a, limit = 10)
  ans = []
  c = 0
  c2 = 0
  a.each do |n|
    c2 += 1
    break if c2 > limit
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
  
  return ans.size
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


0.upto(10_000_000) do |i|
  t[i] = (s % 64) + 1
  s = s**2 % 50515093
end

@arr = create_array(t)


c = 0
print "Round 0: "

while true
  c += 1
  0.upto(@arr.size - 1) do |i|
    @arr[i] = 2 if @arr[i] == 1
  end
  
  0.upto(@arr.size-1) do |i|
    if @arr[i] == 2
      @arr[i] = 0
      j = i + 1
      while @arr[j] == 1 || @arr[j] == 2
        j += 1
      end
#      puts "Moving #{i} to #{j}"
      @arr[j] = 1
    end
  end
  while @arr.first == 0
    @arr.shift
  end
  print "Round #{c}: "
  pp puts_c_boxes(@arr)
#  exit if c == 256
end

##







