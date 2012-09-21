require 'pp'

class IFraction
  attr_accessor :rbottom, :rtop, :ibottom, :itop
  def initialize(n)
    @square = n
    @rtop    = 0
    @rbottom = 1
  end

  def value
    top    = @rtop + (@itop * Math.sqrt(@square))
    bottom = @rbottom + (@ibottom * Math.sqrt(@square))
    top / bottom.to_f
  end
    
  def add_int(i)
    @rtop += i * @rbottom
  end
  
  
  def flip
    rtmp = @rtop
    @rtop = @rbottom
    @rbottom = rtmp
  end
  
  def simplify
    gcd = @rtop.gcd(@rbottom)
    @rtop /= gcd
    @rbottom /= gcd
  end

  def to_hash
    "#{@rtop} / #{@rbottom}"  
  end
end

blarg = IFraction.new(0)
blarg.rtop = 0
blarg.rbottom = 1

arr = []
k = 1
i = 0

99.times do |i|
  if i % 3 == 1
    arr << k*2
    k+= 1
  else
    arr << 1
  end
end
arr.reverse!


arr.each do |i|
  blarg.add_int(i)
  blarg.flip
end

blarg.add_int(2)
blarg.simplify
#puts blarg.to_hash
puts blarg.rtop.to_s.split("").inject(0) {|i,j| i = i + j.to_i }