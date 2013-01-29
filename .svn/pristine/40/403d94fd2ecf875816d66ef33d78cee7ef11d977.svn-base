require 'lib'


@field = Hash.new(nil)
@field[1] == 1


def collatz(n)
  n % 2 == 0 ? (n / 2) : (3 * n + 1)
end

def chain_length(n)
  return 1 if n == 1
  @field[n] ||= 1 + chain_length(collatz(n))
end

res = 0
max = 0
1.upto(1000000) do |x|
  puts "Working on #{x}" if x % 100000 == 0
  y = chain_length(x)
  if y > max
    max = y
    res = x
  end  
end
puts res
puts max