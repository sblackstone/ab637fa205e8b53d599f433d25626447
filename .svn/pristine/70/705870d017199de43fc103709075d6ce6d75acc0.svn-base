require 'pp'
def digits(k)
  k.to_s.size
end

d = []

1.upto(1000) do |c|
  1.upto(1000) do |n|
    if digits(n**c) == c
      puts "#{n}**#{c} == #{n**c}"
      d << n**c
    end
  end
end

pp d
puts d.size
puts d.uniq.size