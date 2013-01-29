require 'lib'

# zero included so we don't have to mess with this array so much.
LOW_NUMBERS = ["zero","one","two","three","four","five","six","seven","eight","nine","ten","eleven","twelve","thirteen","fourteen","fifteen", "sixteen", "seventeen","eighteen","nineteen"]
TYS         = ["twenty","thirty","forty","fifty","sixty","seventy","eighty","ninety"]

def num_2_words(x)
  return "one thousand" if x == 1000
  if x < 20 
    return LOW_NUMBERS[x]
  elsif x < 100 and x % 10 == 0
    return TYS[(x / 10) - 2]
  elsif x < 100
    t = (x / 10).floor
    return("#{TYS[t - 2]} #{num_2_words(x - t * 10)}")
  elsif x >= 100 and x % 100 == 0
     t = (x / 100).floor
    return("#{LOW_NUMBERS[t]} hundred")
  else
    t = (x / 100).floor
    return("#{LOW_NUMBERS[t]} hundred and #{num_2_words(x - t * 100)}")
  end

end

len = 0

1.upto(1000) do |x|
  w = num_2_words(x)
  #puts w
  w.gsub!(/\ /, "")
  len = len + w.size
end

puts len
