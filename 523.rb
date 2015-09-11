require 'pp'


@seen = Hash.new

def sort(arr)
  @seen[arr.join(":")] ||= do_sort(arr)  
end


def do_sort(arr)
  0.upto(arr.length - 2) do |k|
    if arr[k] > arr[k+1]
      arr.unshift arr[k+1]
      arr.delete_at(k+2)
      return(1 + sort(arr))
    end        
  end
  return 0  
end

arr = (1..4).to_a

ways = Hash.new(0.0)
tot = 0

arr.permutation do |p|
  s = p.join(",")

  v = sort(p)
  print s
  print ": "
  pp v
  ways[v] += 1
  tot += 1
end


ev = 0.0
ways.each do |v, c|
  ev += (v * (c / tot))
end

=begin
pp ways
pp tot
pp ev
=end