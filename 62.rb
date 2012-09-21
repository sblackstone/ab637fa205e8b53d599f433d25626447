require 'perm'

@cubes = Hash.new

def make_key(i)
  i.to_s.split("").sort.join("")
end

i = 1
key = ""
while true
 cube = i**3
 key  =  make_key(cube)
 @cubes[key] ||= Hash.new
 @cubes[key][cube] = true
 break if @cubes[key].keys.size == 5
 i = i + 1
end

pp key
pp @cubes[key]
@cubes[key].keys.each do |i|
  puts i**(1.0/3)
  puts i
  puts "*"
end