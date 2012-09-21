require 'pp'

def roll(sides, number)   
  Array.new(number,0).map {|x| x = rand(sides)+1 }.inject(:+)
end


def expected(n) 
  mean = 0
  1.upto(n) do |i|
    mean += i * (1.0/n)
  end
  mean
end

puts ex(6)



=begin

@track = Hash.new(0)

0.upto(1_000_000) do |i|
  t = roll(4,1)
  c = roll(6,t)
  o = roll(8,c)
  d = roll(12,o)
  i = roll(20,d)
  @track[i] += 1
end

=end

