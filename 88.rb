=begin
Product-sum numbers
Problem 88
A natural number, N, that can be written as the sum and product of a given set of at least two natural numbers, {a1, a2, ... , ak} is called a product-sum number: N = a1 + a2 + ... + ak = a1 × a2 × ... × ak.

For example, 6 = 1 + 2 + 3 = 1 × 2 × 3.

For a given set of size, k, we shall call the smallest N with this property a minimal product-sum number. The minimal product-sum numbers for sets of size, k = 2, 3, 4, 5, and 6 are as follows.

k=2: 4 = 2 × 2 = 2 + 2
k=3: 6 = 1 × 2 × 3 = 1 + 2 + 3
k=4: 8 = 1 × 1 × 2 × 4 = 1 + 1 + 2 + 4
k=5: 8 = 1 × 1 × 2 × 2 × 2 = 1 + 1 + 2 + 2 + 2
k=6: 12 = 1 × 1 × 1 × 1 × 2 × 6 = 1 + 1 + 1 + 1 + 2 + 6

Hence for 2≤k≤6, the sum of all the minimal product-sum numbers is 4+6+8+12 = 30; note that 8 is only counted once in the sum.

In fact, as the complete set of minimal product-sum numbers for 2≤k≤12 is {4, 6, 8, 12, 15, 16}, the sum is 61.

What is the sum of all the minimal product-sum numbers for 2≤k≤12000?
=end


require 'pp'

SOLVE_TO = 12_000

MAX_DIVISORS = SOLVE_TO * 2

@divisors = Array.new(MAX_DIVISORS + 1, nil)

0.upto(MAX_DIVISORS) {|i| @divisors[i] = Array.new } 


2.upto(MAX_DIVISORS) do |d|
  m = 1
  while d*m <= MAX_DIVISORS
    @divisors[d*m].unshift d
    m += 1
  end
end

def factorizations(n, cur, &block)
  if @divisors[n].size == 1 or n == 1
    cur.push(n) if n > 1
    yield cur
    cur.pop if n > 1
    return
  end
  @divisors[n].each do |d|
    cur.push(d)
    factorizations(n/d, cur, &block)
    cur.pop
  end
end



@minimal = Hash.new

@track = SOLVE_TO - 1

n = 2

while true
  factorizations(n, []) do |fact|
    next if fact.size == 1
    sum = fact.inject(&:+) 
    size = fact.size + (n-sum)  
    if @minimal[size].nil? and size <= SOLVE_TO
      @minimal[size] = n    
      @track -= 1
    end    
  end
  break if @track == 0
  n += 1
end

pp @minimal.values.uniq.inject(&:+)

