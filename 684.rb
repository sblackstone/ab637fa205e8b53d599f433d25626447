

def calcFast(x)
  return x if x < 10
  tenPower = 1
  nineLength = (x / 9).floor
  result = x - (nineLength * 9)
  result = result * 10**nineLength
  0.upto(nineLength - 1) do |i|
    result += tenPower * 9
    tenPower *= 10
  end
  return result
end


def fibSeq
  i = 2
  x0 = 0
  x1 = 1
  yield x0,0
  yield x1,1
  while true
    x2 = x0 + x1
    yield x2, i
    x0 = x1
    x1 = x2
    i += 1
  end
end

0.upto(100) do |i|
  puts "#{i} #{calcFast(i)}"
end



sum = 0
fibSeq do |fib, i|
  if i > 90
    break
  end

  if i > 1
    puts "Calculating #{i}"
    sum += calcFast(i)
  end
  puts "#{i} #{fib}"
end

puts sum
