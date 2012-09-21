require 'lib'

def word_score(w)
  subscore = 0
  0.upto(w.length - 1) do |i|
    subscore = subscore + w[i] - 'A'[0] + 1
  end
  return subscore
end


@line = ""
File.open("names.txt").each_line do |line|
  @line = line
end

@names = @line.split(",")
@names.map! {|x| x.gsub!(/\"/, "")}
@names.sort!

score = 0

count = 0
@names.each do |name|
  count = count + 1
  score = score + word_score(name) * count 
end

puts score

puts word_score("COLIN")