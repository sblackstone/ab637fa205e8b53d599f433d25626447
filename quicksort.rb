
require 'pp'

def stupid_quicksort(arr)
  return arr if arr.size < 2
  pivot = arr.pop
  more = []
  less = []
  arr.each do |i|
    if i < pivot 
      more.push i
    else
      less.push i
    end
  end
  return [stupid_quicksort(less), pivot, stupid_quicksort(more)].flatten 
end

#pp stupid_quicksort([5,2,3,6,8,9,2,4])

##########################################################################


def better_quicksort_partition(arr, left, right, pivotIndex)
  pivotValue = arr[pivotIndex]
  arr[right], arr[pivotIndex] = arr[pivotIndex], arr[right]
  storeIndex = left
  left.upto(right-1) do |i|
    if arr[i] <= pivotValue
      arr[i],arr[storeIndex] = arr[storeIndex],arr[i]
      storeIndex += 1
    end
    print "#{i}: "
    pp arr
  end
  arr[storeIndex],arr[right] = arr[right],arr[storeIndex]
  return storeIndex
end

def better_quicksort(arr, left,right)
  if left < right
    pi    = (left+right)/2
    puts pi
    newpi =  better_quicksort_partition(arr, left,right, pi)
    pp newpi
    pp arr
    exit
    better_quicksort(arr, left, newpi -1)
    better_quicksort(arr, newpi+1, right)      
  end
end


arr = [5,2,3,6,8,9,2,4]
better_quicksort(arr, 0, arr.size - 1)
pp arr