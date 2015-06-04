@x_cache = Hash.new

def x(n)
  @x_cache[n] ||= do_x(n)
end


def do_x(n)
  return n if n < 2
  if n % 2 == 0
    k = n / 2    
    k_floor = (k/2.0).floor
    return (3*x(k) + 2*x(k_floor)) % 2**60
  else
    k = (n-1) / 2
    k_floor = (k/2.0).floor
    return (2*x(k) + 3*x(k_floor)) % 2**60
  end
    
end

@y_cache = Hash.new

def y(n,k)
  @y_cache["#{n}:#{k}"] ||= do_y(n,k)
end


def do_y(n,k)
  return x(k) if k >= n
  a = y(n, 2*k)
  b = y(n, 2*k + 1)
  m = [a,b].max
  return 2**60 - 1 - m
end

@a_cache = Hash.new


def a(n)
  @a_cache[n] ||= y(n, 1)
end


=begin
puts x(2)
puts x(3)
puts x(4)

puts y(4,4)
puts y(4,3)
puts y(4,2)
puts y(4,1)

puts a(10)
puts a(10**3)
puts a(10**4)
puts a(10**5)
puts a(10**6)

=end

1.upto(1000) do |i|
  puts "#{i}: #{a(i)}"
end
