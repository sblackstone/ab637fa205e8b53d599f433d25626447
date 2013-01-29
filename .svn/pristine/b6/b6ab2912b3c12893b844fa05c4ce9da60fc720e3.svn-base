require 'pp'
class Card
  attr_reader :rank, :suit
  def initialize(card)
    @rank, @suit = card.split("")
  end
  def to_s
    puts "#{@rank}#{@suit}"
  end
  
end

SUITS = {
  '2' => 2,
  '3' => 3,
  '4' => 4,
  '5' => 5,
  '6' => 6,
  '7' => 7,
  '8' => 8,
  '9' => 9,
  'T' => 10,
  'J' => 11,
  'Q' => 12,
  'K' => 13,
  'A' => 14
}

class Hand
  attr_reader :cards
  attr_reader :suits
  attr_reader :ranks
  attr_reader :hand
  def initialize(hand)
    @hand = hand
    @cards = hand.split(" ").map {|x| Card.new(x) }
    @suits = Hash.new(0)
    @ranks = Hash.new(0)
    @cards.each do |c|
      @suits[c.suit] = @suits[c.suit] + 1
      rval = SUITS[c.rank]
      @ranks[rval] = @ranks[rval] + 1
    end
  end
  
  def to_s
    hand
  end

  def <=>(other)
    #if self.hand_value == other.hand_value and hand_value > -1
      puts self.to_s
      puts other.to_s
      puts
      puts "this: #{self.hand_value}" 
      puts "othe: #{other.hand_value}"
      pp self.tie_breaker_array
      pp other.tie_breaker_array
      puts  hand_value <=> other.hand_value
      puts  tie_breaker_array <=> other.tie_breaker_array
    #end
    
    unless hand_value == other.hand_value
      return hand_value <=> other.hand_value
    else
      return tie_breaker_array <=> other.tie_breaker_array
    end
  end
  

  def sorted_ranks
    ranks = []
    @ranks.each do |k,v|
      ranks << k
    end
    return ranks.sort.reverse
  end
  
  def high_pair_value
    14.downto(2) {|i| return i if @ranks[i] == 2 }
    return 0
  end

  def low_pair_value
    2.upto(14) {|i| return i if @ranks[i] == 2 }  
  end

  def no_pair_values
    vals = []
    @ranks.each {|k,v| vals << k if v == 1 }
    return vals.sort.reverse
  end

  def two_pair_order
    return [high_pair_value,low_pair_value,no_pair_values].flatten
  end

  def single_pair_order
    return [high_pair_value,no_pair_values].flatten
  end

  def three_of_kind_value
    2.upto(14) {|i| return i if @ranks[i] == 3 }
  end
  def four_of_kind_value
    2.upto(14) {|i| return i if @ranks[i] == 4 }
  end
  
  def full_house_values
    [three_of_kind_value, high_pair_value, no_pair_values].flatten
  end
  
  def four_of_kind_values
    [four_of_kind_value,no_pair_values].flatten
  end
  

  def three_of_kind_values
    [three_of_kind_value, no_pair_values].flatten
  end

  def hand_value
    return 10 if royal_flush?
    return  9 if straight_flush?
    return  8 if four_of_a_kind?
    return  7 if full_house?
    return  6 if flush?
    return  5 if straight?
    return  4 if three_of_a_kind?
    return  3 if two_pair?
    return  2 if pair?
    return  1 
  end
  def tie_breaker_array
    return sorted_ranks      if hand_value ==  1 # High Card
    return single_pair_order if hand_value == 2
    return two_pair_order    if hand_value == 3
    return three_of_kind_values if hand_value == 4
    return sorted_ranks if hand_value ==  5 # Straight
    return sorted_ranks if hand_value ==  6 # Flush
    return full_house_values if hand_value == 7
    return four_of_kind_values if hand_value == 8
    return sorted_ranks if hand_value ==  9 # Straight Flush
    return sorted_ranks if hand_value == 10 # Royal Flush <-- probally not needed.
  end
  
  
  def royal_flush?
    return false unless flush? 
    10.upto(14) do |i|
      return false unless @ranks[i] == 1
    end
    return true
  end
  
  def straight?
    2.upto(10) do |i|
      count = 0
      0.upto(4) do |j|
        count = count + 1 if @ranks[i+j] == 1
      end
      return true if count == 5
    end
    return [2,3,4,5,14].map {|x| @ranks[x] }.all? {|y| y == 1 }
  end
    
  def straight_flush?
    straight? and flush?
  end
  
  def flush?
    @suits.values.any? {|x| x == 5 }
  end
  
  def four_of_a_kind?
    @ranks.values.any? {|x| x == 4 }
  end

  def three_of_a_kind?
    @ranks.values.any? {|x| x == 3 }
  end

  def full_house?
    three_of_a_kind? and pair?
  end
  
  def two_pair?
    count = 0
    @ranks.values.each do |v|
      count = count + 1 if v == 2
    end
    return count == 2
  end
  
  def pair?
    @ranks.values.any? {|x| x == 2 }
  end
  
end

count = 0

File.open("poker.txt") do |f|
  while (line = f.gets)
    hand1 = Hand.new(line[0,14])
    hand2 = Hand.new(line[15,14])
    if (hand1 <=> hand2) == 1
      count = count + 1   
      puts "Player 1 won."
    else
      puts "Player 2 won."
    end
    puts "*" * 25
  end
end

puts "Player 1 wins #{count}"

