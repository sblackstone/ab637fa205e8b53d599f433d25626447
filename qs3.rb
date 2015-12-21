require 'pp'

def partition(arr, left, right, pi)
  pv = arr[pi]
  si = left
  arr[pi],arr[right] = arr[right],arr[pi]
  left.upto(right - 1) do |i|
    if arr[i] <= pv
      arr[si],arr[i] = arr[i],arr[si]
      si += 1
    end
  end
  arr[si],arr[right] = arr[right],arr[si]
  return si
end


def quicksort(arr, left, right)
  if left < right
    pivot = left + ((right - left) / 2)
    puts pivot
    new_pivot = partition(arr, left, right, pivot)

    quicksort(arr, left, new_pivot - 1)
    quicksort(arr, new_pivot + 1, right)
  end
  return arr
end




arr = [5,2,3,6,8,9,2,4]

pp quicksort(arr, 0, 7)