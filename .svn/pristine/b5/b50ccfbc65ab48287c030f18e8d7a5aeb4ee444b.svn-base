require 'pp'
require 'lib'
@top = 20

@tmp = []
2.upto(@top) do |x|
  @tmp << x
end
@checkable = @tmp.clone
@primes    = @tmp.clone
@primes.reject! {|x| !isPrime?(x) }
@delta = @primes.inject(1) {|a,c| a = a * c }


@tmp.each do |x|
  @tmp.each do |y|
    @checkable.delete(x) if x < y and y % x == 0
  end
end

# Generated Checkables and delta.
def check(n)
  @checkable.each do |x|
    return false if n % x > 0
  end
  return true
end

min = @delta
while true
  min = min + @delta
  puts "checking #{min}"
  break if check(min)
end

puts min