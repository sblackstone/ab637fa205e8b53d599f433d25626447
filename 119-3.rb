MAX_BASE = 100
MAX_VALUE = MAX_BASE**2

def digi_sum(n)
  sum = 0
  while n > 0
    sum += n % 10
    n -= n % 10
    n /= 10
  end
  return sum
end


class PriorityQueue

  def initialize
    @track = Array.new    
  end
  

end



base = 2

while true
  power = 2
  db = digi_sum(base)
  ds = digi_sum(base**2)
  while base**power < MAX_VALUE
    puts ds
    ds = digi_sum(digi_sum(ds)*db)
    power += 1
    
  end
  exit

end
   




=begin

@track = Array.new
@exp = Array.new

2.upto(MAX_BASE) do |b|
  @track[b] = b*b
  @exp[b] = 2
end


@arr = []
while true
  min_base = 2
  2.upto(MAX_BASE) do |b|
    if @track[b] < @track[min_base]
      min_base = b
    end
  end
  break if @track[min_base] > MAX_VALUE
  min = @track[min_base]  
  if min % min_base == 0 and digi_sum(min) == min_base
    @arr.push min
    puts "#{min} #{digi_sum(min)}"
  end
  
  @track[min_base] *= min_base
  @exp[min_base] += 1
end

=end