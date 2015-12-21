=begin

https://projecteuler.net/problem=172
How many 18-digit numbers n (without leading zeros) are there such that no digit occurs more than three times in n?


first digit: 1-9

A B C D E F G H I J K L M N O P Q R



=end


require 'pp'

@fact_cache = Hash.new(nil)

def fact(n)
  @fact_cache[n] ||= do_fact(n)
end

def do_fact(n)
  n == 0 ? 1 : n * fact(n-1)
end



@total = 0

def handle(cur)
  t = fact(18)
  cur.each do |i|
    t /= fact(i)
  end

  @total += t
=begin  

  Per problem thread suggestion, no need to do this - just multiply by 9/10ths...

  if cur[0] > 0
    cur[0] -= 1
    tprime = fact(17)
    cur.each do |i|
      tprime /= fact(i)
    end
    @total -= tprime    
    cur[0] += 1    
  end
=end
  
  
end



def ways_to_add_to_18(cur = [])
  if cur.length == 10
    if cur.inject(:+) == 18
      handle(cur)
    end
    return
  end  
  0.upto(3) do |i|
    cur.push i  
    ways_to_add_to_18(cur)
    cur.pop
  end
end



ways_to_add_to_18

pp @total * 9 / 10