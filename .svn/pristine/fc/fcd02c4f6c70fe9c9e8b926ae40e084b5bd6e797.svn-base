require 'pp'
chars = []
@before = Hash.new(nil)

File.open("keylog.txt") do |f|
  while (line = f.gets)
    line = line.strip
    a = line.split('').map(&:to_i)
    @before[a[1]] ||= Array.new
    @before[a[2]] ||= Array.new
    @before[a[1]].push( a[0])
    @before[a[2]] << a[1]
    @before[a[1]].uniq!
    @before[a[2]].uniq!
    @before[a[0]] ||= Array.new
  end  
end

passcode = ""

while @before.keys.size > 0
  shortest_key = @before.keys.first
  @before.each do |k,v|
    if v.size < @before[shortest_key].size
      shortest_key = k
    end
  end

  passcode += shortest_key.to_s 
  @before.each do |k,v|
    @before[k].delete(shortest_key)
  end
  @before.delete(shortest_key)
  pp @before
  pp passcode
  
end


#73162890