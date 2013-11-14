=begin

Using a combination of black square tiles and oblong tiles chosen from: red tiles measuring two units, green tiles measuring three units, 
and blue tiles measuring four units, it is possible to tile a row measuring five units in length in exactly fifteen different ways.

How many ways can a row measuring fifty units in length be tiled?

=end

require 'pp'

@cache = Hash.new(nil)

=begin
def tile(block, container) 
  @cache["#{block}:#{container}"] ||= do_tile(block,container)
end


def do_tile(block, container)
  return 2 if block == container
  return 1 if block > container
  sum = 0
  0.upto(container - block) do |leading_blanks|
    sum += tile(block, container - leading_blanks - block)
    sum += 1 if container - leading_blanks - block > block
  end
  sum 
end

puts tile(2,50) + tile(3,50) + tile(4,50)

=end


@t_cache = Hash.new
def tile(container)
  @t_cache[container] ||= do_tile(container)
end

def do_tile(container)
  return 1 if container == 0
  sum = 0
    1.upto(4) do |block_size|
      next if block_size > container
      sum += tile(container  - block_size)
    end
  return sum
end



puts do_tile(50)