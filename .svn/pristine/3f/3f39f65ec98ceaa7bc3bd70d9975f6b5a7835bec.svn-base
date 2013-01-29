

@sort_strings = Hash.new
def sort_str_of(i)
  str = i.to_s.split("").sort.join("")
  while str.size < 7
    str = "0#{str}"
  end
  str
end

def equal?(a,b)
   sort_str_of(a) == sort_str_of(b)
end


x = 0

while true
  x = x + 1
  next unless equal?(2*x,3*x)
  next unless equal?(2*x,4*x)
  next unless equal?(2*x,5*x)
  next unless equal?(2*x,6*x)
  puts "1x #{1*x} - #{sort_str_of(1*x)}"
  puts "2x #{2*x} - #{sort_str_of(2*x)}"
  puts "3x #{3*x} - #{sort_str_of(3*x)}"
  puts "4x #{4*x} - #{sort_str_of(4*x)}"
  puts "5x #{5*x} - #{sort_str_of(5*x)}"
  puts "6x #{6*x} - #{sort_str_of(6*x)}"
  exit

end
