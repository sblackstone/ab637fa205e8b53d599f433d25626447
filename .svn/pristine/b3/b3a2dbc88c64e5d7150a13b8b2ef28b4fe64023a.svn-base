=begin

The number 145 is well known for the property that the sum of the factorial of its digits is equal to 145:

1! + 4! + 5! = 1 + 24 + 120 = 145

Perhaps less well known is 169, in that it produces the longest chain of numbers that link back to 169; it turns out that there are only three such loops that exist:

169  363601  1454  169
871  45361  871
872  45362  872

It is not difficult to prove that EVERY starting number will eventually get stuck in a loop. For example,

69  363600  1454  169  363601 ( 1454)
78  45360  871  45361 ( 871)
540  145 ( 145)

Starting with 69 produces a chain of five non-repeating terms, but the longest non-repeating chain with a starting number below one million is sixty terms.

How many chains, with a starting number below one million, contain exactly sixty non-repeating terms?

=end


require 'pp'

@fact = Array.new(10)
@fact[0] = 1
@fact[1] = 1

@answers = Hash.new(nil)

1.upto(9) do |i|
  @fact[i] = i * @fact[i-1]
end


@endings = {
  145 => 1,
  169 => 3,
  36301
}

def transform(n)
  ret = 0
  while n > 0
    ret += @fact[n%10]
    n = (n - n % 10) / 10
  end
  ret
end

def chain(i)
  @count = 1
  @seen = Hash.new(nil)
  @seen[i] = true
  i = transform(i)
  while @seen[i].nil?
    @seen[i] = true
    i = transform(i)
    @count += 1
  end
  return @count
end

@cache = Hash.new(nil)

1.upto(1_000_000) do |i|
  @cache[i] = transform(i)
  puts i if @cache[i] == i
end
exit
@count = 0
1.upto(1_000_000) do |i|
  #puts "#{i} #{chain(i)}"
  @count += 1 if chain(i) == 60
end
puts @count


