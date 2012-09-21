require 'pp'
maxp = 1000
answers = Hash.new(0)
1.upto(maxp) do |a|
  1.upto(maxp) do |b|
    c = Math.sqrt(a**2 + b**2)
    next unless c.to_i == c
    next unless a+b > c
    next unless a+c > b
    next unless b+c > a
    p = a+ b+ c
    answers[p] = answers[p] + 1 unless p > 1000
  end
end

max  = -1
maxk = 0
answers.keys.each do |k|
  if answers[k] > max
    max = answers[k]
    maxk = k
  end
end

pp max
pp maxk