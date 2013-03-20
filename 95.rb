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
@min = 0
1.upto(SIZE-1) do |i|
  h = Hash.new(false)
  j = i
  while !h[j]
    h[j] = true
    j = @sdiv[j]
    break if j > SIZE-1
  end
  if j == i && h.keys.size > @max_length
    @max_length = h.keys.size
    @min = h.keys.min
  end
end

pp @max_length
gpp @min
