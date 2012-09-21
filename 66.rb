class IFraction
  attr_accessor :rbottom, :rtop, :ibottom, :itop
  def initialize(n)
    @square = n
    @rtop    = 0
    @itop    = 1
    @rbottom = 1
    @ibottom = 0 
  end

  def value
    top    = @rtop + (@itop * Math.sqrt(@square))
    bottom = @rbottom + (@ibottom * Math.sqrt(@square))
    top / bottom.to_f
  end
  
  def int
    value.floor
  end

  def subtract_int(i)
    @rtop -= i*@rbottom
  end
  
  def flip
    rtmp = @rtop
    @rtop = @rbottom
    @rbottom = rtmp
    itmp = @itop
    @itop = @ibottom
    @ibottom = itmp
  end
  
  def simplify
    @itop = @rtop    
    @rtop *= (@rbottom * -1)
    @ibottom = 0
    @rbottom = @square - @rbottom**2
    gcd = @itop.gcd(@rtop)
    gcd = gcd.gcd(@rtop)
    gcd = gcd.gcd(@rbottom)
    @itop /= gcd
    @ibottom /= gcd
    @rtop /= gcd
    @rbottom /= gcd
  end
  def to_hash
    "#{@itop}:#{@ibottom}:#{@rtop}:#{@rbottom}"  
  end
end


class RFraction
  attr_accessor :rbottom, :rtop
  def initialize
    @rtop    = 0
    @rbottom = 1
  end
  
  def subtract_int(i)
    @rtop -= i*@rbottom
  end

  def add_int(i)
    @rtop += i*@rbottom
  end
  
  def flip
    rtmp = @rtop
    @rtop = @rbottom
    @rbottom = rtmp
  end
  
  def simplify
    gcd = @rbottom.gcd(@rtop)
    @rtop /= gcd
    @rbottom /= gcd
  end
  def to_hash
    "#{@rtop} / #{@rbottom}"  
  end
end


def calc(period)
  blah = RFraction.new  
  tmp = period[0]
  blah.rbottom = period[1]
  blah.rtop = 1
  2.upto(period.size - 1) do |i|
    blah.add_int(period[i])
    blah.flip
    blah.simplify
  end
  blah.add_int(tmp)
  blah.simplify
  blah
end


require 'pp'

@max = -1
@maxd = -1
2.upto(1000) do |d|
  next if Math.sqrt(d) == Math.sqrt(d).floor
  puts "*" * 50
  puts "D = #{d}"
  blarg = IFraction.new(d)
  @seen = Hash.new(false)
  @period = [] 
  while true
    @period.push blarg.int
    blarg.subtract_int(blarg.int)
    blarg.flip
    blarg.simplify
    break if @seen[blarg.to_hash]
    @seen[blarg.to_hash] = true
  end
  @storage = [@period.shift]
  i = 0
  @answer = nil
  while true
    @storage.push(@period[i % @period.size ])
    @answer = calc(@storage)
    if ((@answer.rtop**2 - (d*@answer.rbottom**2)) == 1)
        pp @answer
        if @answer.rtop > @max
          puts "#{@answer.rtop} when d=#{d}"
          @max = @answer.rtop
          @maxd = d
        end
        break
    end
    i+= 1
  end
end
puts 
puts
pp "max = #{@max} maxd = #{@maxd}"

=begin

while @period.size > 0
  blah = RFraction.new
  blah.rbottom = 1
  blah.rtop = 1 
  @period.each do |i|
    blah.add_int(i)
    blah.flip
    blah.simplify
  end
  blah.flip
  if blah.rtop*blah.rtop - d*blah.rbottom*blah.rbottom == 1
   puts "floog"
   @max = blah.rtop if blah.rtop > @max
   @maxd = d
  end
  pp blah
  @period.shift
end

=end