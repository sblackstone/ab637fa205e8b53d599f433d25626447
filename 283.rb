
class Triangle
  attr_accessor :a
  attr_accessor :b
  attr_accessor :c
  attr_accessor :s

  def perimeter
    return (@a + @b + @c).to_f
  end

  def area
    Math.sqrt(@s*(@s - @a)*(@s - @b)*(@s - @c))
  end

  def initialize(a,b,c)
    raise "Bad" if a+b < c
    raise "Bad" if a+c < b
    raise "Bad" if b+c < a
    self.a = a
    self.b = b
    self.c = c
    self.s = (self.a + self.b + self.c) * 0.5
  end
  def ratio
    self.area / self.perimeter
  end
end



@nums = Hash.new(true)
@max = 500
sum = 2
c   = 3
@primes = [2]
@prime_hash = Hash.new(false)
while (c < @max)
  if @nums[c]
    @primes << c
    @prime_hash[c] = true
    sum = sum + c
    x = c + c
    while x <= @max
      @nums[x] = false if x % 2 == 1
      x = x + c
    end
  else
    @nums[c] = false
  end
  c = c + 2 
end
puts "Done calculating primes up to #{@max} "


1.upto(1000) do |a|
  (a+1).upto(1000) do |b|
    1.upto(a + b - 1) do |c|  # c < a+b
      next unless a+c > b
      next unless b+c > a
      p = (a+b+c)
      s = p * 0.5
      area = Math.sqrt(s*(s - a)*(s - b)*(s - c)) 
      r = area / p
      if r == r.round and r == 1
        puts [a,b,c,p,area.to_i,r.to_i].join("\t")      
      end
    end
  end
end
