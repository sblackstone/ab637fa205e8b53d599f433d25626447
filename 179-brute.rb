require 'pp'

MAX = 1000

@a = Array.new(MAX+1, 0)

1.upto(MAX) do |i|
  1.upto(i) do |j|
    @a[i] += 1 if i % j == 0  
  end
end

1.upto(MAX-1) do |i|
  puts "#{i}" if @a[i] == @a[i+1]
end
