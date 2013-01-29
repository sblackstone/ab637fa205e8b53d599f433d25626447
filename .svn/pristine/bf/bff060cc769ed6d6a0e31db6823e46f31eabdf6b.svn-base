@primes = Hash.new

@fc = Hash.new

def factor_count(n)
  @fc[n] ||= do_factor_count(n)
end

def do_factor_count(n)
  2.upto(Math.sqrt(n)) do |p|
    if n % p == 0
      while n % p == 0
        n = n / p
      end
      return 1 + factor_count(n)
    end
  end
  return 1
end

i = 0
while(true) do 
  if factor_count(i) == 4
    if factor_count(i+1) == 4
      if factor_count(i+2) == 4
        if factor_count(i+3) == 4
          puts i
          exit
        end
      end
    end
  end
  i = i + 1
end

