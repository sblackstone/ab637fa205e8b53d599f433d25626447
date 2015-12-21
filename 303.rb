=begin

For a positive integer n, define f(n) as the least positive multiple of n that, written in base 10, uses only digits ≤ 2.

Thus f(2)=2, f(3)=12, f(7)=21, f(42)=210, f(89)=1121222.

sum f(n)/n from 1 to 100 = 11363107

find 1 to 10000

=end


def f(n)
  k = 0
  while true
    k += 1
    v = n*k
    if v % 10 <= 2
      s = v.to_s
      if s.match /^[0-2]*$/
        return v
      end
      
    end
    
  end
  
  
end


sum = 0

1.upto(1000) do |n|
  v = f(n)
  puts "#{n} #{v} #{v / n}"
end

