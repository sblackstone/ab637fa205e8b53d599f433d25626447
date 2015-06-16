=begin
For non-negative integers m, n, the Ackermann function A(m, n) is defined as follows:


For example A(1, 0) = 2, A(2, 2) = 7 and A(3, 4) = 125.

Find A(n, n) and give your answer mod 148.

=end


@ack_hash = Hash.new
def ackerman(m,n, d = 0)
  @ack_hash["#{m}:#{n}"] = do_ackerman(m,n,d)
end


def do_ackerman(m,n, d=0)
  print " " * d if d == 2
  puts ("A(#{m}, #{n})") if d ==2
  if m == 0
    print " " * (d+1) if d == 2
    puts (n+1) if d == 2
    return (n+1)  
  end
  return ackerman(m-1, 1, d+1) if m > 0 and n == 0
  return ackerman(m-1, ackerman(m, n-1, d+1), d+1)
end

puts ackerman(3,3)