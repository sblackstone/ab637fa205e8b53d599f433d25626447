

tt = [2,3,5,7]
n = 10
product = 1

tt.each do |t|
  product *= (1 - 10**t)**-1
end

puts product

