require 'pp'
def fact(i)
  i < 2 ? 1 : i * fact(i-1)
end


def fact_val(i)
  i.to_s.split("").map {|x| fact(x.to_i) }.inject(:+)
end


2.upto(1000000) do |f|
pp "f: #{f} = #{fact_val(f)}" if f == fact_val(f)
end

