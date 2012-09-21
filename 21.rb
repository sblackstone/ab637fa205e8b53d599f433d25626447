require 'lib'


def gen_divisors(n)
  ans = []
  1.upto(n/2) do |i|
    ans << i if n % i == 0 
  end
  return ans
end

@divisors = Hash.new(nil)
def divisors(n)
  @divisors[n] ||= gen_divisors(n)
end

@d_of_n_cache = Hash.new(nil)

def d(n)
  @d_of_n_cache[n] ||= divisors(n).inject(0) {|a,c| a = a + c }
end

@nums = []
1.upto(9999) do |i|
  @nums << i if d(d(i)) == i and d(i) != i
end
pp @nums 
pp @nums.sort.uniq.inject(:+)
