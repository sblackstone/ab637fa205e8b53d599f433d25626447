=begin

A row of five black square tiles is to have a number of its tiles replaced with coloured oblong tiles chosen from red (length two), green (length three), or blue (length four).

If red tiles are chosen there are exactly seven ways this can be done.

If green tiles are chosen there are three ways.
 
And if blue tiles are chosen there are two ways.
	
Assuming that colours cannot be mixed there are 7 + 3 + 2 = 12 ways of replacing the black tiles in a row measuring five units in length.

How many different ways can the black tiles in a row measuring fifty units in length be replaced if colours cannot be mixed and at least one coloured tile must be used?

NOTE: This is related to problem 117.


lb 0 

=end

require 'pp'

@cache = Hash.new(nil)

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

a = tile(2,50)
b = tile(3,50)
c = tile(4,50)


puts a+b+c
