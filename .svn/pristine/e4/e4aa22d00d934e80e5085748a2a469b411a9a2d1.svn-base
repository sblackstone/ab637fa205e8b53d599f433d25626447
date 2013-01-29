require './primes2.rb'


Primes.setup(10_000_000)

puts "Setup"

@cache = Hash.new(0)

Primes.primes.each do |p|
  next if p.nil?
  digits = p.to_s
  tmp = nil
  0.upto(digits.size - 2) do |a|
    (a+1).upto(digits.size - 1) do |b|
      (b+1).upto(digits.size - 1) do |c|
	if digits[a] == digits[b] and digits[b] == digits[c]
          tmp = digits[a]
          digits[a] = '*'
          digits[b] = '*'
	  digits[c] = '*'
	  @cache[digits] += 1
          if @cache[digits] > 6
            print "#{digits}: #{@cache[digits]}: "
            puts p
	    if @cache[digits] == 8
	      '1'.upto('9') do |r|
	        tmp = digits.clone
                tmp.tr!('*', r)
	        puts tmp if Primes.isPrime?(tmp.to_i)
              end
              exit
	    end
          end
	  digits[a] = tmp
          digits[b] = tmp
 	  digits[c] = tmp
        end
      end
    end
  end
end




