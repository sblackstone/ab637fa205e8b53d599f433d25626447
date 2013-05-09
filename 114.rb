=begin
A row measuring seven units in length has red blocks with a minimum length of three units placed on it, such that any two red blocks (which are allowed to be different lengths) are separated by at least one black square. There are exactly seventeen ways of doing this.
					
How many ways can a row measuring fifty units in length be filled?

NOTE: Although the example above does not lend itself to the possibility, in general it is permitted to mix block sizes. For example, on a row measuring eight units in length you could use red (3), black (1), and red (4).

A B C
D E F
G H I
J K L
M N O
P Q

[0, 7]           A          
[3, 1, 3]        G
[3, 2, 0, 2]
[3, 3, 0, 1]
[3, 4]
[4, 1, 0, 2]
[4, 2, 0, 1]
[4, 3]
[5, 1, 0, 1]
[5, 2]
[6, 1]
[7]

=end


@cache = Hash.new(nil)
def a(n)
  @cache[n] ||= do_a(n)
end


def do_a(n) 
  return 1 if n < 4
  return 2*a(n-1) - a(n-2) + a(n-4)
end


0.upto(100) do |i|
  puts "#{i}: #{a(i)}"
end



=begin


require 'pp'

def dump_state(state)
  char = "B"
  state.each do |k|
    print char * k
    char = (char == 'R' ? 'B' : 'R')
  end
  puts
end


# [B, R, B, R, B, R]

def search(left, state, cur = 0)
  if left == 0
    dump_state(state)
  end  
  if cur == 0
    min = 0
  else
    min = 3
  end
  min.upto(left) do |i|
    state.push(i)
    search(left - i, state, (cur+1) % 2)
    state.pop
  end
end


search(7,[])
=end
=begin
def search(empty,state)
  if state.empty?
    dump_state [0,empty]
  end
  if empty == 0 
    dump_state(state)
    return
  end

  if empty < 3 and state.length % 2 == 0
    state.push(0)
    state.push(empty)
    dump_state(state)
    state.pop
    state.pop
    return
  end
  
  if state.length % 2 == 0
    min = 3
  else
    min = 1
  end

  min.upto(empty) do |i|
    state.push(i)
    search(empty-i, state)
    state.pop
  end
end

=end


