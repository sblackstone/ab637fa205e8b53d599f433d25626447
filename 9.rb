require 'lib'

n=0

1.upto(400) do |a|
  1.upto(400) do |b|
      c2 = a**2 + b ** 2
      c = Math.sqrt(c2)
      if a + b + c == 1000
      puts a
      puts b
      puts c
      puts a * b * c
      exit
      end
  end
end


