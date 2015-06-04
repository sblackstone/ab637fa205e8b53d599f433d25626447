=begin



=end

require 'pp'

r = 45


1.upto(44) do |z|
  puts "#{z}: #{(r+z)*(r-z)}"
end



@squares = Hash.new(nil)

i = 0
while i**2 < r**2
  @squares[i**2] = i
  i += 1
end

1.upto(r-1) do |z|
  h = r - z
  asquared = 2*r*h - h**2
  if !@squares[asquared].nil?
    puts z
  end
  
end
