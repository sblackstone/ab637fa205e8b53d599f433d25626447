require 'pp'

class Array
  def each_permutation(idx = nil, str = "", &block)
    idx ||= (0..(self.size - 1)).to_a
    if idx.empty?
      yield str
    else  
      idx.each do |i|
        each_permutation(idx - [i], str + self[i].to_s, &block)      
      end
    end
  end
end

class String
  def each_permutation(&block)
    self.split(//).each_permutation(nil,"",&block)
  end
end

class Fixnum
  def each_permutation(&block)
    self.to_s.split(//).each_permutation(nil,"",&block)
  end
end