require 'pp'
require 'csv'
CSV.foreach("./98-words.txt") do |row|
  @words = row
end

@words.each_with_index do |w,i|
  @words[i] = w.split("")
end

def is_square(n)
    return Math.sqrt(n) == Math.sqrt(n).round
end

def gen_number(word, assignment)
  num = 0
  i = 10**(word.length-1)
  word.each do |l|
    num += i * assignment[l]
    i /= 10
  end
  return(num)
end

@ok = Hash.new(false)
@ok[0] = true
@ok[1] = true
@ok[4] = true
@ok[6] = true
@ok[9] = true
@ok[5] = true
def test(w1, w2) 
  letters = w1.uniq
  h = Hash.new
  [0,1,2,3,4,5,6,7,8,9].permutation(letters.length) do |assignment|
    assignment.each_with_index do |number,i|
      h[letters[i]] = number
    end
    next if h[w1[0]] == 0
    next if h[w2[0]] == 0
    next unless @ok[h[w1.last]]
    next unless @ok[h[w2.last]]
    a = gen_number(w1, h)  
    b = gen_number(w2, h)  
    if is_square(a) and is_square(b)
      puts "#{w1.join('')} #{w2.join('')} #{a} #{b}"
    end
#    pp assignment
#    puts "#{a} #{b}"
  end
end

#puts test("CARE".split(""), "RACE".split(""))
#exit
@anagrams = Hash.new

@words.each do |w|
  key = w.sort.join("")
  @anagrams[key] ||= Array.new
  @anagrams[key] << w
end

@keys = @anagrams.keys.sort {|x,y| y.length <=> x.length }
@keys.each do |k|
  v = @anagrams[k]
  if v.size > 1
    puts k
    0.upto(v.size-1) do |i|
      (i+1).upto(v.size-1) do |j|
        puts "#{v[i].join('')} #{v[j].join('')}"
        test(v[i], v[j])
      end
    end
  end  
end

