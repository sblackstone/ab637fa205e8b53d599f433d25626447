require 'pp'
SIZE = 1_000_000

@sigm = Array.new(SIZE, 1)

2.upto(SIZE) do |n|
  i = n
  n2 = n**2
  while i < SIZE
    @sigm[i] += n2
    i+= n
  end
end

total = 0

1.upto(SIZE-1) do |i|
  v = @sigm[i]
  next unless v % 4 < 2
  vs = Math.sqrt(v)
  if vs == vs.round
#   puts "#{i}: #{v}"
    total += i
  end
end
puts total