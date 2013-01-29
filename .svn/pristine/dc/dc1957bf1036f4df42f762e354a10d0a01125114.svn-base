require 'pp'

@phash = Array.new(60_000,nil)
@phash[0] = 1
@phash[1] = 1


def pent(i)
   i * (3*i - 1) / 2
end

@pent = []
1.upto(60000) do |i|
  @pent << pent(i)
  @pent << pent(i*-1)
end

def p(k)
  @phash[k] ||= do_p(k)
end


def do_p(k)
  val = 0
  @pent.each_with_index do |pent,track|
    break if pent > k
    if track % 4 < 2
      val = val + p(k - pent) % 1000000
    else 
      val = val - p(k - pent) % 1000000
    end
  end
  val
end


1.upto(60000) do |i|
  next unless i % 5 == 4
  if p(i) % 1_000_000 == 0
    puts p(i)
    puts i
    exit
  end
end
