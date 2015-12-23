=begin
The game Number Mind is a variant of the well known game Master Mind.

Instead of coloured pegs, you have to guess a secret sequence of digits. After each guess you're only told in how many places you've guessed the  digit. 

So, if the sequence was 1234 and you guessed 2036, you'd be told that you have one  digit, however, you would NOT be told that you also have another digit in the wrong place.

For instance, given the following guesses for a 5-digit secret sequence,

90342 ,2 
70794 ,0 
39458 ,2 
34109 ,1 
51545 ,2 
12531 ,1 

The  sequence 39542 is unique.

Based on the following guesses,

5616185650518293 ,2 
3847439647293047 ,1 
5855462940810587 ,3 
9742855507068353 ,3 
4296849643607543 ,3 
3174248439465858 ,1 
4513559094146117 ,2 
7890971548908067 ,3 
8157356344118483 ,1 
2615250744386899 ,2 
8690095851526254 ,3 
6375711915077050 ,1 
6913859173121360 ,1 
6442889055042768 ,2 
2321386104303845 ,0 
2326509471271448 ,2 
5251583379644322 ,2 
1748270476758276 ,3 
4895722652190306 ,1 
3041631117224635 ,3 
1841236454324589 ,3 
2659862637316867 ,2 

Find the unique 16-digit secret sequence.
=end


@guesses = [
[5616185650518293 , 2 ],
[3847439647293047 , 1 ],
[5855462940810587 , 3 ],
[9742855507068353 , 3 ],
[4296849643607543 , 3 ],
[3174248439465858 , 1 ],
[4513559094146117 , 2 ],
[7890971548908067 , 3 ],
[8157356344118483 , 1 ],
[2615250744386899 , 2 ],
[8690095851526254 , 3 ],
[6375711915077050 , 1 ],
[6913859173121360 , 1 ],
[6442889055042768 , 2 ],
[2321386104303845 , 0 ],
[2326509471271448 , 2 ],
[5251583379644322 , 2 ],
[1748270476758276 , 3 ],
[4895722652190306 , 1 ],
[3041631117224635 , 3 ],
[1841236454324589 , 3 ],
[2659862637316867 , 2 ]
]

@guesses2 = [
  [ 90342 ,2  ], 
  [ 70794 ,0  ], 
  [ 39458 ,2  ],
  [ 34109 ,1  ],
  [ 51545 ,2  ],
  [ 12531 ,1  ]
]

require 'pp'
require 'rubygems'
require 'byebug'

class Population
  
  attr_reader :population
  
  POPULATION_SIZE = 2**10
  
  def initialize(guesses)
    @guesses   = guesses
    @fitness_cache = Hash.new
    @length    = guesses.first[0].to_s.length
    @max_score = guesses.inject(0) { |a,c| a += c[1] }
    puts "MAX_SCORE = #{@max_score}"
    puts "POPULATION_SIZE = #{POPULATION_SIZE}"
  end

  def rand_string
    ans = ""
    @length.times { ans += rand(0..9).to_s }
    ans
  end
  
  def breed(a,b)
    cross_over = rand(0..(@length - 1))
    ans = a[0, cross_over] + b[cross_over, b.length]  
  
    if rand < 0.25
      0.upto(ans.length - 1) do |i|
        ans[i] = rand(0..9).to_s if rand < (1.0 / b.length)
      end
    end
    return ans    
  end
  
  
  
    
  def create_next_gen
    new_pop = Hash.new
    ten_percent = (POPULATION_SIZE * 0.10).floor

    keys = @population.to_a.sort {|x,y| x[1] <=> y[1] }.map {|x| x[0] }[-1*ten_percent, ten_percent]

    0.upto(keys.length - 1) do |a|
      (a+1).upto(keys.length - 1) do |b|
        new_str = breed(keys[a],keys[b])
        new_pop[new_str] = fitness(new_str)
      end
    end
    
    @population = new_pop
  end
  
  def generate_population
    @population = Hash.new
    POPULATION_SIZE.times {
      str = rand_string
      @population[str] = fitness(str)
    }    
  end
  
  def compare(str1, str2)
    matches = 0
    0.upto(str1.length - 1) do |i|
      if str1[i] == str2[i]
        matches += 1
      end
    end
    return matches
  end

  def fitness(string)
    @fitness_cache[string] ||= do_fitness(string)
  end
  

  def do_fitness(string)
    score = @max_score
    @guesses.each do |guess|
      matching = compare(string, guess[0].to_s)
      score -= (matching - guess[1]).abs
    end    
    if score == @max_score
      puts "ANSWER = " + string
      exit
    end
    
    score
  end
  
end

p = Population.new(@guesses)

p.generate_population
gen = 1
while true
  puts "Building generation #{gen}"
  puts
  p.create_next_gen
  pp p.population.to_a.sort {|x,y| x[1] <=> y[1] }[-10,10]
  puts
  puts "***"
  puts
  gen += 1
end


#pp p.population
