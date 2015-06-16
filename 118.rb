=begin

Using all of the digits 1 through 9 and concatenating them freely to form decimal integers, different sets can be formed. Interestingly with the set {2,5,47,89,631}, all of the elements belonging to it are prime.

How many distinct sets containing each of the digits one through nine exactly once contain only prime elements?

=end
require 'pp'

f = File.open("primes_to_10_8.txt")

while (line = f.gets)
  n = line.strip.split("")
  if n.length == n.uniq.length
    pp n
  end
  
end

