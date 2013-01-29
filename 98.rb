require 'pp'
require 'csv'
CSV.foreach("./98-words.txt") do |row|
  @words = row
end

@words.each_with_index do |w,i|
  @words[i] = w.split("")
end

@anagrams = Hash.new

@words.each do |w|
  key = w.sort.join("")
  @anagrams[key] ||= Array.new
  @anagrams[key] << w.join("")
end


@anagrams.reject! {|k,v| v.size < 2 }

x = 1
@squares = Array.new(10)

while (x**2 < 10**10)
  xsquared = (x**2).to_s
  if xsquared.split("").sort.uniq.size == xsquared.size
    @squares[xsquared.size] ||= Array.new
    @squares[xsquared.size] << xsquared
  end
  x += 1
end

pp @squares


@anagrams.each do |k,v|
  pp v
end

