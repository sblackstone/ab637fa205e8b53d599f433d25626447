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
@squares = Hash.new(false)
@dsquares = Array.new(10)

1.upto(10**5) do |i|
  @squares[i**2] = true
  digits = (Math.log(i**2) / Math.log(10)).floor + 1
  @dsquares[digits] ||= Array.new
  @dsquares[digits].push(i**2)
end

def check(word1, square, word2)
  # we assume the digits in square are the same number as the letters in "word"
  track = Hash.new(nil)
  ssquare = square.to_s
  0.upto(ssquare.size - 1) do |i|
    if track[ssquare[i]].nil?
      track[ssquare[i]] = word1[i]
    elsif track[ssquare[i]] != word1[i]
      return -1
    end
    if track[word1[i]].nil?
      track[word1[i]] = ssquare[i]
    elsif track[word1[i]] != ssquare[i]
      return -1
    end
  end
  return false if track[word2[0]] == "0"
  nsquare = ""
  0.upto(word2.size - 1) do |i|
    nsquare += track[word2[i]]
  end
  return @squares[nsquare.to_i] ? nsquare.to_i : -1
end


9.downto(2) do |i|
  @anagrams.each do |k,v|
    if k.size == i
      v.combination(2).each do |y|
        @dsquares[i].each do |square|
          r = check(y[0], square, y[1])
          if r && r > 0
            pp y[0]
            pp y[1]
            pp r
            pp square
            puts "*" * 25
          end
        end        
      end
    end    
  end
end
