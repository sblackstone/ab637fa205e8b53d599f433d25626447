
def fact(i)
  i == 0 ? 1 : i * fact(i - 1)
end


def nCr(n,r)
  return fact(n) / (fact(r) * fact(n-r))
end


count = 0
1.upto(100) do |n|
  1.upto(n-1) do |r|
    count = count + 1 if nCr(n,r) > 1_000_000
  end
end

puts count