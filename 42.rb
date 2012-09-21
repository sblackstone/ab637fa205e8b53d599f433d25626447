require 'pp'


@tri = []

1.upto(50) do |i|
 @tri << (i * (i+1)) / 2
end


txt = ""
File.open("words.txt","r") do |f|
  while (line = f.gets)
    txt = txt + line.gsub(/\"/,"")
  end
end

@words = txt.split(",")

@words.map! do |word| 
  @tri.include?(word.split("").map {|x| x.ord - "A".ord + 1}.inject(:+))
end

puts @words.reject {|x| !x }.count