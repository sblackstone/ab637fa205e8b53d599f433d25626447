require './primes.rb'

MAX = 100
Primes.setup(100)

@track = Hash.new(1)


Primes.primes.each do |p|
  k = 1
  while k*p < MAX
    @track[k*p] *= p 
    k += 1
  end
end

@sort = @track.sort_by {|k,v| v }

pp @sort[4]
pp @sort[8]
