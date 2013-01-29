require 'pp'
require './primes.rb'

=begin
It is possible to write ten as the sum of primes in exactly five different ways:

7 + 3
5 + 5
5 + 3 + 2
3 + 3 + 2 + 2
2 + 2 + 2 + 2 + 2

What is the first value which can be written as the sum of primes in over five thousand different ways?
=end

Primes.setup(100)
num = Primes.primes.length

@answer = Array.new(num, 0)

@track = Hash.new(nil)

def count
  0.upto(10) do |c|
    0.upto(num) do |n|
      @track[n] = c
      count
      @track[n] = 0
    end
    
  end
  
  
end




