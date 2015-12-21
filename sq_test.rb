def not_a_square_01(n)
end



@brute_hash = Hash.new

def brute_is_square?(n)
  @brute_hash ||= do_brute_is_square?(n)
end


def do_brute_is_square?(n)
  v = Math.sqrt(n).floor
  return v*v == n
end


@lookup = Hash.new(false)

def is_square2?(n)
  case n & 0b1111
  when 0,1,4,9
  else
    return false
  end
  
  if n & 1 == 0
    if n % 4 == 2
      return false
    else
      while n % 4 == 0
        n /= 4
      end
    end
  else
    return false if n % 4 == 3
  end
  return brute_is_square?(n)
end


sum  = 0
sum2 = 0
1.upto(5_000_000) do |i|
 if is_square2?(i) 
   sum  += i 
 end
# sum2 += i if brute_is_square?(i)  
end

puts sum
puts sum2