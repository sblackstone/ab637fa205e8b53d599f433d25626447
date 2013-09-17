=begin

Arithmetic expressions
Problem 93
By using each of the digits from the set, {1, 2, 3, 4}, exactly once, and making use of the four arithmetic operations (+, −, *, /) and brackets/parentheses, it is possible to form different positive integer targets.

For example,

8 = (4 * (1 + 3)) / 2
14 = 4 * (3 + 1 / 2)
19 = 4 * (2 + 3) − 1
36 = 3 * 4 * (2 + 1)

Note that concatenations of the digits, like 12 + 34, are not allowed.

Using the set, {1, 2, 3, 4}, it is possible to obtain thirty-one different target numbers of which 36 is the maximum, and each of the numbers 1 to 28 can be obtained before encountering the first non-expressible number.

Find the set of four distinct digits, a < b < c < d, for which the longest set of consecutive positive integers, 1 to n, can be obtained, giving your answer as a string: abcd.

=end


require 'pp'

class Frac
  attr_accessor :n, :d
  
  def initialize(n, d = 1)
    @n = n
    @d = d
  end

  def lcm(a,b)
    return a*b / a.gcd(b)
  end

  def simplify
    while @n.gcd(@d) > 1
      g = @n.gcd(@d)
      @n /= g
      @d /= g
    end
    self
  end
  
  def /(other)
    result = Frac.new(self.d, self.n)
    result.n *= other.n
    result.d *= other.d
    result.simplify
  end
  
  def *(other)
    result = Frac.new(self.n, self.d)
    result.n *= other.n
    result.d *= other.d
    result.simplify
  end

  def to_s
    return "(#{@n}/#{d})"
  end
  

  def +(other)
    result = Frac.new(self.n, self.d)
    newd = lcm(@d, other.d)
    result.n = (@n * (newd / @d)) + (other.n * (newd / other.d))
    result.d = newd
    result.simplify
  end

  def -(other)
    result = Frac.new(self.n, self.d)
    newd = lcm(@d, other.d)
    result.n = (@n * (newd / @d)) - (other.n * (newd / other.d))
    result.d = newd
    result.simplify
  end
end
3

@ops = ['+', '-', '/', '*']

def eval_all_op(nums, h, str = nil)
  if nums.size == 1     
    if nums.first.n > 0 and nums.first.d == 1
      #puts "#{str} = #{nums.first}" 
      h[nums.first.n] = true 
    end
    return
  end
  @ops.each do |op|
    a = nums.shift
    b = nums.shift
    s = str.nil? ? "#{a} #{op} #{b}" : "#{str} #{op} #{b}"
    nums.unshift eval("a #{op} b")
    eval_all_op(nums, h, s)
    nums.shift
    nums.unshift b
    nums.unshift a
  end
  
end

def answer_length(ans)
  ans.sort!
  0.upto(ans.length) do |i|
    return i if ans[i] != i+1
  end
end


def eval_set(set)
  h = Hash.new
  set.combination(4) do |c|
    c.permutation do |p|
      eval_all_op(p,h)
      @ops.combination(2) do |o_perm|
        [0,1,2,3].permutation do |p2|  
          eval_all_op([eval("p[p2[0]] #{o_perm[1]} p[p2[1]]"), eval("p[p2[2]] #{o_perm[0]} p[p2[3]]")],h)      
          eval_all_op([eval("p[p2[0]] #{o_perm[0]} p[p2[1]]"), eval("p[p2[2]] #{o_perm[1]} p[p2[3]]")],h)      
          eval_all_op([eval("p[p2[0]] #{o_perm[0]} p[p2[1]]"), eval("p[p2[2]] #{o_perm[0]} p[p2[3]]")],h)      
          eval_all_op([eval("p[p2[0]] #{o_perm[1]} p[p2[1]]"), eval("p[p2[2]] #{o_perm[1]} p[p2[3]]")],h)      

        end
      end  

    end
  end
  h.keys.sort
end


=begin
nums = [2,6,7,9]

nums.map! {|x| Frac.new(x) }

pp eval_set(nums)

exit
=end
cur_answer = nil
max_length = 0

1.upto(9) do |a|
  (a+1).upto(9) do |b|
    (b+1).upto(9) do |c|
      (c+1).upto(9) do |d|
        l = answer_length(eval_set([Frac.new(a), Frac.new(b), Frac.new(c), Frac.new(d)]))
        puts "#{a}#{b}#{c}#{d}: #{l}"
        if l > max_length
          max_length = l
          cur_answer = "#{a}#{b}#{c}#{d}"
        end
      end
    end
  end
end


puts max_length
puts cur_answer
