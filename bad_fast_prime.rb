def fast_prime(n)
  throw new Exception("out of range") if n >= 2_152_302_898_747
  return false if n < 2   
  return true  if n == 2 
  return false if n % 2 == 0
  nprime = n - 1
  s = 1
  d = nprime >> 1
  while d & 1 == 0
    s += 1
    d >>= 1
  end
  puts "n=#{n} s=#{s} d=#{d}"
  a_base = [2,3,5,7,11]
  a_base.each do |a|
    if ModMath.pow(a,d,n) == 1
      puts "a**d mod n == 1"
      next
    end
    if a >= nprime
      puts "#{a} as a is too big"
      next
    end
    flag = false
    0.upto(s-1) do |r|  
      if ModMath.pow(a, 2*r*d, n) != -1
        puts "Passes because a ** " + (2*r*d).to_s + " mod n = -1" 
        flag = true
        break
      end
    end
    return false if !flag
  end
  return true  
end
