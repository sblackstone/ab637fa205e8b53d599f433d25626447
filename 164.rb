=begin
Numbers for which no three consecutive digits have a sum greater than a given value
Problem 164
How many 20 digit numbers n (without any leading zero) exist such that no three consecutive digits of n have a sum greater than 9?


abcde

a+b+c < 9
b+c+d < 9
c+d+e < 9



=end
=begin

1344
1.upto(7) do |a|
  1.upto(7) do |b|
    1.upto(7) do |c|
      next if (a+b+c) > 9
      1.upto(7) do |d|
        next if (b+c+d) > 9
        1.upto(7) do |e|
          puts "#{a}#{b}#{c}#{d}#{e}" if c+d+e <= 9        

        end
      end
    end
  end
end  

=end



def search(depth, cur_digits, cur_sum)
end
