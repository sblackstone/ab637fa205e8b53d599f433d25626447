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
@dsquares = Array.new(10)
@all_squares = Hash.new(false)
while (x**2 < 10**10)
  xsquared = (x**2).to_s
  @all_squares[xsquared] = true
  if xsquared.split("").sort.uniq.size == xsquared.size
    @squares[xsquared.size] ||= Array.new
    @squares[xsquared.size] << xsquared.to_s
  else
    @dsquares[xsquared.size] ||= Array.new
    @dsquares[xsquared.size] << xsquared.to_s    
  end
  x += 1
end

def test_no_dupes(w1, w2)
  ww1 = w1.split("")
  0.upto(@squares[w1.length].length - 1) do |i|
    test = w2.clone
    map = @squares[w1.length][i]
    ww1.each_with_index do |c,i|
      test.tr!(c, map[i].chr)
    end
    return [map.to_i,test.to_i].max if @all_squares[test]
  end
  return false
end


@anagrams.each do |k,v|
  arr = k.split("")
  if arr.size == arr.sort.uniq.size
    v.combination(2).each do |y|
      ans = test_no_dupes(y[0], y[1])
      if (ans)
        puts "#{y[0]} #{y[1]} #{ans}"
      end
    end
  else
    print "\tSPECIAL CASE: "    
    pp v
  end  
end

