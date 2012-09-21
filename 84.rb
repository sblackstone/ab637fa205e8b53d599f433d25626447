require 'pp'

GO    = 0
JAIL  = 10
C1    = 11
E3    = 24
H2    = 39
R1    = 5
G2J   = 30
BLANK = -1

class Card
  attr_reader :action
  def initialize(act)
    @action = act
  end  
end


class Deck
  attr_reader :cards
  def initialize(blanks)
    @pointer = 0
    @cards = Array.new
    blanks.times { add_card(BLANK) }
  end

  def add_card(t)
    @cards << Card.new(t)
  end

  def draw
    @pointer += 1
    return @cards[@pointer % 16].action
  end

  def shuffle
    0.upto(1000) do |i|
      a = rand(@cards.size)
      b = rand(@cards.size)
      tmp = @cards[a] 
      @cards[a] = @cards[b]
      @cards[b] = tmp
    end
  end  
end


class CommunityChest < Deck
  def initialize
    super(14)
    add_card(GO)   
    add_card(JAIL) 
    shuffle
  end  
end

class Chance < Deck
  def initialize
    super(6)
    add_card(GO)  
    add_card(JAIL)
    add_card(C1) 
    add_card(E3) 
    add_card(H2) 
    add_card(R1)  
    add_card("R") # Next RR
    add_card("R") # Next RR
    add_card("U") # Next Ut
    add_card("B") # Back 3
    shuffle
  end

end


class Board
  attr_reader :tracker
  def roll_dice
    a = rand(4) + 1
    b = rand(4) + 1
    add_roll(a,b)
    return a + b
  end

  def add_roll(a,b)
      @rolls = (a == b)  ? @rolls + 1 : 0
  end

  def three_times?
    return @rolls == 3
  end

  def initialize
    #@tracker     = Array.new(40,0)
    @tracker     = Hash.new(0)
    @counter     = 0
    @cc_deck     = CommunityChest.new
    @chance_deck = Chance.new
    @player_loc  = 0
    @rolls       = 0
    @rr          = [5,15,25,35]
    @ut          = [12,28]
  end

  def do_cc
    action = @cc_deck.draw
    move_to(action) if action != BLANK
  end
  
  def move_distance(d)
    @player_loc = (@player_loc + d) % 40
  end
  
  def move_to(sq)
    @player_loc = sq
  end
      
  def do_chance
    action = @chance_deck.draw
    if action == "R"
      while !@rr.include?(@player_loc)
        move_distance(1)
      end
    elsif action == "U"
      while !@ut.include?(@player_loc)
        move_distance(1)
      end
    elsif action == "B"
      move_distance(-3)
      resolve_square
    elsif action != BLANK
      move_to(action)
    end
  end

  def resolve_square
    if @player_loc == G2J 
      move_to(JAIL)
      return
    end
    if [2,17,33].include?(@player_loc)
      do_cc
    elsif [7,22,36].include?(@player_loc)
      do_chance
    end    
  end

  def move
    @tracker[@player_loc] += 1
    @counter = @counter + 1
    roll = roll_dice
    if three_times? 
      @player_loc = JAIL
    else 
      move_distance(roll)
      resolve_square 
    end
    @rolls = 0 if @player_loc == JAIL  
  end
end  



b = Board.new
2_000_000.times { b.move }

0.upto(39) do |i|
  puts "#{i}:\t#{b.tracker[i]}\t#{(b.tracker[i] / 2_000_000.0)*100}%"
end

#pp b.tracker.sort {|x,y| x[1] <=> y[1] }

