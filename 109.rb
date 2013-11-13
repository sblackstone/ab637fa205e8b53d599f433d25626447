=begin
In the game of darts a player throws three darts at a target board which is split into twenty equal sized sections numbered one to twenty.


The score of a dart is determined by the number of the region that the dart lands in. A dart landing outside the red/green outer ring scores zero. The black and cream regions inside this ring represent single scores. However, the red/green outer ring and middle ring score double and treble scores respectively.

At the centre of the board are two concentric circles called the bull region, or bulls-eye. The outer bull is worth 25 points and the inner bull is a double, worth 50 points.

There are many variations of rules but in the most popular game the players will begin with a score 301 or 501 and the first player to reduce their running total to zero is a winner. However, it is normal to play a "doubles out" system, which means that the player must land a double (including the double bulls-eye at the centre of the board) on their final dart to win; any other dart that would reduce their running total to one or lower means the score for that set of three darts is "bust".

When a player is able to finish on their current score it is called a "checkout" and the highest checkout is 170: T20 T20 D25 (two treble 20s and double bull).

There are exactly eleven distinct ways to checkout on a score of 6:


D3	
 	
 
D1	D2	 
S2	D2	 
D2	D1	 
S4	D1	 
S1	S1	D2
S1	T1	D1
S1	S3	D1
D1	D1	D1
D1	S2	D1
S2	S2	D1
Note that D1 D2 is considered different to D2 D1 as they finish on different doubles. However, the combination S1 T1 D1 is considered the same as T1 S1 D1.

In addition we shall not include misses in considering combinations; for example, D3 is the same as 0 D3 and 0 0 D3.

Incredibly there are 42336 distinct ways of checking out in total.

How many distinct ways can a player checkout with a score less than 100?
=end

require 'pp'

@singles  = Hash.new
@doubles  = Hash.new
@triples  = Hash.new


1.upto(20) do |i|
  @singles["S#{i}"] = i
  @doubles["D#{i}"] = 2*i
  @triples["T#{i}"] = 3*i
end

@singles["SB"] = 25
@doubles["DB"] = 50


@checkouts = Hash.new


# Single Throw Checkouts
@doubles.each do |k,v|
  @checkouts[k] = v
end

# Double throw checkouts
@doubles.each do |dk, dv|
  @singles.each do |sk, sv|
    @checkouts["#{sk} #{dk}"] = sv + dv
  end
  @triples.each do |tk, tv|
    @checkouts["#{tk} #{dk}"] = tv + dv
  end

  @doubles.each do |d2k, d2v|
    @checkouts["#{dk} #{d2k}"] = d2v + dv  
  end  
end


# Three throw checkouts

# Single Triple
@singles.each do |sk, sv|
  @triples.each do |tk, tv|
    @doubles.each do |dk, dv|
      @checkouts["#{sk} #{tk} #{dk}"] = sv + tv + dv
    end   
  end
end

# Single Double
@singles.each do |sk, sv|
  @doubles.each do |dk, dv|
    @doubles.each do |d2k, d2v|
      @checkouts["#{sk} #{dk} #{d2k}"] = sv + dv + d2v
    end   
  end
end


# Double Triple
@doubles.each do |dk, dv|
  @triples.each do |tk, tv|
    @doubles.each do |d2k, d2v|
      @checkouts["#{dk} #{tk} #{d2k}"] = dv + tv + d2v
    end   
  end
end


# single single
# double double
# triple triple
@singles.each do |sk,sv|
  @singles.each do |s2k, s2v|
    next if sk > s2k
    @doubles.each do |dk, dv|
      @checkouts["#{sk} #{s2k} #{dk}"] = sv + s2v + dv
    end   
  end
end

@doubles.each do |dk, dv|
  @doubles.each do |d2k, d2v|  
    @doubles.each do |d3k, d3v|
      next if dk > d2k
      @checkouts["#{dk} #{d2k} #{d3k}"] = dv + d2v + d3v
    end   
  end
end

@triples.each do |tk,tv|
  @triples.each do |t2k,t2v|
    next if tk > t2k
    @doubles.each do |dk, dv|
      @checkouts["#{tk} #{t2k} #{dk}"] = tv + t2v + dv
    end   
  end
end

puts @checkouts.keys.size
count = 0
@checkouts.each do |k,v|
  if v < 100
    puts k
    count += 1
  end
end

puts "Answer = #{count}"


