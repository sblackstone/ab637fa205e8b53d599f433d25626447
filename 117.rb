=begin

Using a combination of black square tiles and oblong tiles chosen from: red tiles measuring two units, green tiles measuring three units, 
and blue tiles measuring four units, it is possible to tile a row measuring five units in length in exactly fifteen different ways.

How many ways can a row measuring fifty units in length be tiled?

=end

require 'pp'

@cache = Hash.new(nil)

@t_cache = Hash.new
def tile(container)
  @t_cache[container] ||= do_tile(container)
end

def do_tile(container)
  return 0 if container < 0
  return 1 if container == 0
  sum = 0
  1.upto(4) do |block_size|
    sum += tile(container  - block_size)
  end
  return sum
end



puts do_tile(50)
