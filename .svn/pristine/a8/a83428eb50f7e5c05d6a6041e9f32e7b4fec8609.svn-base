require 'pp'

class Node
  attr_accessor :value
  def initialize(v)
    @value = v
  end
end


class Array
  def each_permutation(idx = nil, vals = [], &block)
    idx ||= (0..(self.size - 1)).to_a
    if idx.empty?
      yield vals
    else  
      idx.each do |i|
        vals.push(self[i])
        each_permutation(idx - [i], vals, &block)      
        vals.pop 
      end
    end
  end
end


class FiveGon
  attr_accessor :nodes
  def initialize  
    @nodes = []
    0.upto(9) do |i|
      @nodes << Node.new(0)
    end
    @str1 = [ @nodes[0], @nodes[1], @nodes[2] ]
    @str2 = [ @nodes[3], @nodes[2], @nodes[5] ]
    @str3 = [ @nodes[6], @nodes[5], @nodes[4] ]
    @str4 = [ @nodes[8], @nodes[4], @nodes[7] ]
    @str5 = [ @nodes[9], @nodes[7], @nodes[1] ]
    @strs = [@str1, @str2, @str3, @str4, @str5]
  end

  def min_str
    min  = -1
    minv = 999
    0.upto(4) do |i|
      if @strs[i][0].value < minv
        min = i
        minv = @strs[i][0].value
      end
    end
    return min
  end

  def test_assignment
    tests = []
    @strs.each do |str|
      tests << str.map(&:value).inject(:+)
    end
    return tests.uniq.size == 1    
  end


  def string
    min = min_str
    str = ""
    0.upto(4) do |i|
      idx = (min + i) % 5
      str = "#{str}#{@strs[idx][0].value}#{@strs[idx][1].value}#{@strs[idx][2].value}"
    end
    return str
  end
  def string2
    min = min_str
    puts "Starting with string #{min}"
    str = ""
    0.upto(4) do |i|
      idx = (min + i) % 5
      str = "#{str}#{@strs[idx][0].value}#{@strs[idx][1].value}#{@strs[idx][2].value}"
    end
    puts str
    puts "*" * 10
    return str
  end
end



@f = FiveGon.new  
m = 0
@answers = []
((1..10).to_a).each do |a|
  ((1..10).to_a - [a]).each do |b|
    ((1..10).to_a - [a,b]).each do |c|
      abc = a + b + c
      ((1..10).to_a - [a,b,c]).each do |d|
        ((1..10).to_a - [a,b,c,d]).each do |e|
          ((1..10).to_a - [a,b,c,d,e]).each do |f|
            next if abc != d + c + f
            ((1..10).to_a - [a,b,c,d,e,f]).each do |g|
             next if abc != e + f + g    
              ((1..10).to_a - [a,b,c,d,e,f,g]).each do |h|
                ((1..10).to_a - [a,b,c,d,e,f,g,h]).each do |i|
                  next if abc != h + e + i
                  ((1..10).to_a - [a,b,c,d,e,f,g,h,i]).each do |j|
                    next if abc != b + h + j 
                    @f.nodes[0].value = a
                    @f.nodes[1].value = b
                    @f.nodes[2].value = c
                    @f.nodes[3].value = d
                    @f.nodes[4].value = e
                    @f.nodes[5].value = f
                    @f.nodes[6].value = g
                    @f.nodes[7].value = h
                    @f.nodes[8].value = i
                    @f.nodes[9].value = j
                    if @f.test_assignment and @f.string.size == 16
                          @answers << @f.string2
                    end
                    m = m + 1
                    puts m if m % 1000 == 0
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
pp @answers.map(&:to_i).sort
puts "oh and m = #{m}"


#[1,2,3,4,5,6,7,8,9,10].each_permutation do |p|
#  0.upto(9) do |j|
#    @f.nodes[j].value = p[j]

#  end
#end

