require 'pp'
tracker = {}
count = 0


def check (str,ac,bc)
  return 0 if ac+bc > str.length - 1
  cc = str.length - ac - bc
  a = str[0,ac].to_i
  b = str[ac,bc].to_i
  c = str[ac+bc,cc].to_i
  (a*b == c) ? c : 0
end

def digit_permutation(digits)
  ans = []
  return digits if digits.size == 1
  digits.each_index do |i|
    d = digits.delete_at(i)
    ans << digit_permutation(digits).map {|x| "#{d}#{x}"}
    digits.insert(i,d)
  end
  return ans.flatten
end


digit_permutation([1,2,3,4,5,6,7,8,9]).each do |str|
  count = count + 1
  1.upto(5) do |i|
    1.upto(8-i) do |j|
      k = check(str,i,j)
      tracker[k] = true if k > 0
    end
  end
end


puts tracker.keys.inject(:+)