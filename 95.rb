require 'pp'

SIZE = 1_000_000

@sdiv = Array.new(SIZE,0)

1.upto(SIZE) do |d|
  i = d*2
  while i < SIZE
    @sdiv[i]+= d
    i+= d
  end
end


@max_length = 0
@max_i = 0
@min = 0
1.upto(SIZE-1) do |i|
  h = Hash.new(false)
  j = i
  while !h[j]
    begin

    h[j] = true
    j = @sdiv[j]
    break if j > 1_000_000
    rescue
      pp i
      pp j
    end
  end
  if j == i && h.keys.size > @max_length
    @max_length = h.keys.size
    @max_i = i   
    @min = h.keys.min
  end
end

pp @max_length
pp @max_i
pp @min
=begin
puts @sdiv[12496]

exit
def chain(n)
  hsh = Hash.new(false)
  hsh[n] = true
  cur = @sdiv[n]
  return 999999 if cur > SIZE
  while hsh[cur] != true
    hsh[cur] = true
    cur = @sdiv[cur]
  end
  return cur != n ? 999999 : hsh.keys
  pp hsh.keys
    
end


pp chain(12496)
exit


0.upto(1_000_000) do |i|
  puts "I: #{i}"
  pp chain(i)
end

=end