max = 0

0.upto(9999) do |n|
  arr = []
  i = 0
  while arr.size < 9
    i = i + 1
    arr << (n * i).to_s.split("")
    arr.flatten!
  end
  arr.delete("0")
  if arr.size == 9 and arr.uniq == arr
    v = arr.join("").to_i
    max = v if v > max
    puts "#{n}, 1 to #{i} yielded #{v}"
  end
end

puts "max: #{max}"