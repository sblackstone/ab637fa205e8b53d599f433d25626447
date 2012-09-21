require 'lib'

nums = Hash.new(true)
max = 2000000
sum = 2
c   = 3
while (c < max)
  if nums[c]
    sum = sum + c
    x = c + c
    while x <= max
      nums[x] = false if x % 2 == 1
      x = x + c
    end
  else
    nums[c] = false
  end
  c = c + 2 
end

puts sum
