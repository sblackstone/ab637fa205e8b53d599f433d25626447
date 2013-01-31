=begin
Peter has nine four-sided (pyramidal) dice, each with faces numbered 1, 2, 3, 4.
Colin has six six-sided (cubic) dice, each with faces numbered 1, 2, 3, 4, 5, 6.

Peter and Colin roll their dice and compare totals: the highest total wins. The result is a draw if the totals are equal.

What is the probability that Pyramidal Pete beats Cubic Colin? Give your answer rounded to seven decimal places in the form 0.abcdefg
                                                                                                                            0.5731441
=end

require 'pp'
@pete = Hash.new
@collin = Hash.new

1.upto(36) do |i|
  @pete[i] = 0
  @collin[i] = 0
end



1.upto(4) do |a|
  1.upto(4) do |b|
    1.upto(4) do |c|
      1.upto(4) do |d|
        1.upto(4) do |e|
          1.upto(4) do |f|
            1.upto(4) do |g|
              1.upto(4) do |h|
                1.upto(4) do |i|
                  @pete[a+b+c+d+e+f+g+h+i] += 1
                end
              end
            end
          end
        end
      end
    end
  end
end


1.upto(6) do |a|
  1.upto(6) do |b|
    1.upto(6) do |c|
      1.upto(6) do |d|
        1.upto(6) do |e|
          1.upto(6) do |f|
            @collin[a+b+c+d+e+f] += 1
          end
        end
      end
    end
  end
end


pp @pete
pp @collin

total = 0

6.upto(36) do |i|
  puts "The odds of colin rolling a #{i} is #{@collin[i]} out of #{6**6}"
  odds_pete = 0
  (i+1).upto(36) do |j|
    odds_pete += @pete[j]
  end
  puts "The odds of pete rolling #{i+1} or higher is #{odds_pete} out of #{4**9}"
  puts "---"
  total = total + (@collin[i] * odds_pete)
  
end

puts total.to_f / (4**9 * 6**6)
