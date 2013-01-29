require 'pp'

SIZE = 1_000_000

@sdiv = Hash.new(0)

1.upto(SIZE) do |d|
  i = d*2
  while i < SIZE
    @sdiv[i]+= d
    i+= d
  end
end

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


0.upto(1_000_000) do |i|
  puts "I: #{i}"
  pp chain(i)
end

