require 'pp'

arr = [5,2,3,6,8,9,2,4]


def merge(a,b)
  c = Array.new
  while a.size > 0 or b.size > 0
    if a.size == 0
      c.push b.shift
    elsif b.size == 0
      c.push a.shift
    elsif a.first < b.first
      c.push a.shift
    else
      c.push b.shift
    end
  end
  c  
end


def merge_sort(arr)
  return arr if arr.size < 2
  left  = []
  right = []
  middle = arr.size / 2
  arr.each_with_index do |k,i|
    if i < middle
      left.push k
    else
      right.push k
    end
  end
  pp left
  pp right
  return merge(merge_sort(left), merge_sort(right))  
end



pp merge_sort(arr)
