require 'pp'


class Node
  attr_accessor :up, :down, :left, :right, :desc, :col_node, :vaporized, :covered, :matrix, :hidden, :row_num, :col_num, :vaporized
  def initialize(desc,matrix)
    @desc = desc
    @up = nil
    @down = nil
    @left = nil
    @right = nil
    @col_node = nil
    @row_num = nil
    @col_num = nil
    @vaporized = false
    @covered = false
    @hidden = false
    @matrix = matrix
  end
  def to_s
    @desc
  end

  def hide
    #puts "Hiding  #{self.desc}"
    if self.hidden
      throw new Exception("already hidden")
    end
    self.down.up = self.up
    self.up.down = self.down
    self.hidden = true
    self.col_node.count -= 1
  end
  
  def unhide
    #puts "Unhiding  #{self.desc}"
    self.down.up = self
    self.up.down = self
    self.hidden = false
    self.col_node.count += 1
  end
  

  def vaporize
    self.up.down    = self.down
    self.down.up    = self.up
    self.left.right = self.right
    self.right.left = self.left
    self.col_node.count = 0
    self.vaporized  = true
  end
  
  def unselect
    j = self.left
    while j != self
      j.col_node.uncover
      j = j.left
    end
  end
  
  def select
    j = self.right
    while j != self
      j.col_node.cover
      j = j.right
    end
  end
  
  
  def d
    return 'VV ' if self.vaporized
    return 'CC ' if self.covered
    return 'CC ' if self.col_node.covered
    return 'HH ' if self.hidden
    return "#{self.desc} " if self.desc > 9
    return "0#{self.desc} " 

  end
  
end

class ColumnHeader < Node
  attr_accessor :count

  def cover
    #puts "Covering #{self.desc}"
    if self.covered
      throw "can't re-cover #{self.desc}"
    end
    self.left.right = self.right
    self.right.left = self.left
    self.covered = true
    i = self.down
    while i != self
      j = i.right
      while j != i
        j.hide
        j = j.right
      end
      i = i.down
    end
  end
  
  def uncover
    #puts "Uncovering #{self.desc}"
    i = self.up
    while i != self
      j = i.left
      while j != i
        j.unhide
        j = j.left
      end
      i = i.up
    end
    self.left.right = self
    self.right.left = self
    self.covered = false
  end
  
  def initialize(desc,matrix)
    @count = -1
    super(desc,matrix)
  end
  
end


class MatrixX
  attr_accessor :matrix, :entry, :solution

  def create_header
    @entry = ColumnHeader.new('ENTRY', self);
    cur = @entry
    0.upto(@constraints-1) do |i|
      cur.right = ColumnHeader.new("C#{i}",self)
      cur.right.left = cur
      cur = cur.right
    end
    @entry.left = cur
    cur.right = @entry
    cur = @entry
  end
  

  def create_nodes
    @matrix = Array.new(@rows)
    @matrix[0] = Array.new(@constraints)
    create_header

    0.upto(@rows-1) do |i|
      @matrix[i] = Array.new(@constraints)
      0.upto(@constraints-1) do |j|
        @matrix[i][j] = Node.new(i*9 + j, self)
        @matrix[i][j].row_num = i
        @matrix[i][j].col_num = j
      end
    end
  end
  
  def link_nodes
    0.upto(@rows-1) do |y|
      0.upto(@constraints-1) do |x|
        @matrix[y][x].hidden = false
        @matrix[y][x].covered = false
        @matrix[y][x].vaporized = false
        @matrix[y][x].down  = @matrix[(y+1) % @rows][x]
        @matrix[y][x].up    = @matrix[(y-1) % @rows][x]
        @matrix[y][x].left  = @matrix[y][(x-1) % @constraints]
        @matrix[y][x].right = @matrix[y][(x+1) % @constraints]
      end
    end                  
    cur = @entry.right
    0.upto(@constraints-1) do |i|
      @matrix[0][i].up = cur
      cur.down = @matrix[0][i]

      @matrix[@rows-1][i].down = cur
      cur.up = @matrix[@rows-1][i]
      0.upto(@rows - 1) do |j|
        @matrix[j][i].col_node = cur
      end
      cur = cur.right
    end
    
  end
  
  def apply_state(state)
    0.upto(@rows-1) do |r|
      0.upto(@constraints-1) do |c|
        if state[r][c] == 0
          @matrix[r][c].vaporize
        end
      end
    end
  end
  
  def output
    puts
    cur = @entry.right
    while cur != @entry
      print "#{cur.desc}  "
      cur = cur.right
    end    
    0.upto(@rows-1) do |r|
      puts
      0.upto(@constraints-1) do |c|
        print @matrix[r][c].d
        print " "
      end
    end
    puts
    puts "*" * 25
    puts
  end
  
  def solve(k, &block)
    @solution = Array.new if k == 0
    if self.entry.right == self.entry
      yield @solution
      return @solution
    end
    best = self.entry.right
    col = best.right
    while col != self.entry
      if col.count < best.count
        best = col
      end
      col = col.right
    end
    col = best

    col.cover
    #puts "Attempting to fulfill #{col.desc}"
    r = col.down
    while r != col
      #puts "Selecting #{r.desc}"
      @solution[k] = r
      r.select
      #self.output
      self.solve(k+1, &block)
      @solution.pop
      r.unselect
      r = r.down
    end
    col.uncover
    return false
  end
  

  def initialize(constraints, rows)
    @constraints = constraints
    @rows = rows
    @solution = []
    create_nodes
    link_nodes
  end
end


def dupe_digits(n)
  seen = 0
  while n > 0
    d = n % 10
    return false if d == 0
    if seen & (1 << d) > 0
      return false
    else
      seen |= (1 << d)
    end
    n = (n - d) / 10
  end
  true
end

f = File.open('./primes_to_10_8.txt')

primes = Array.new

while (p = f.gets)
  p = p.to_i
  primes.push p if dupe_digits(p)
  break if p > 10**7
end


#s = Array.new(9)


m = MatrixX.new(9, primes.length)

m.create_header
m.link_nodes

s = Array.new(primes.length)

0.upto(primes.length-1) do |i|
  s[i] = Array.new(9, 0)
  primes[i].to_s.split("").each do |d|
    s[i][d.to_i - 1] = 1
  end
  
end


m.apply_state(s)

solutions = Hash.new

sol = m.solve(0) do |answer|
  pp answer.map {|x| x.row_num }.join(":")
  solutions[answer.map {|x| x.row_num }.join(":")] = true
end



=begin

m = MatrixX.new(324, 729)
@sum = 0
0.upto(49) do |puz|

  m.create_header
  m.link_nodes
  m.apply_state(s)


  puts "Applying initial state"

  0.upto(80) do |box|
    1.upto(9) do |val|
      row = box*9 + (val-1)
      if @puzzles[puz][box] == val 
        #puts "Row #{row} covers #{val} in box #{box}"
        m.solution.push(m.matrix[row][box])
        m.matrix[row][box].col_node.cover
        m.matrix[row][box].select
      end
    end
  end

  puts "Beginning solve"

  #m.output
  sol = m.solve(0)
  sol.map! {|x| x.row_num }
  0.upto(80) do |box|
    1.upto(9) do |val|
      row = box*9 + (val-1)
      if sol.include?(row)
        @puzzles[puz][box] = val
      end
    end
  end

  @sum += @puzzles[puz][0]*100
  @sum += @puzzles[puz][1]*10
  @sum += @puzzles[puz][2] 



end
puts @sum
exit
=end
=begin
m.apply_state(state)
m.output
t = m.entry.right.down
t.col_node.cover
t.select
m.output
t.unselect
t.col_node.uncover
m.output
=end

=begin
m = MatrixX.new(state.first.length, state.length)
m.apply_state(state)
pp m.solve(0)
exit
=end

=begin
Grid 00
483921657
960345821
251076493
548132076
729564038
136098245
372689514
814250769
695417382

exit


state2 = [
[1,0,0,1,0,0,1],
[1,0,0,1,0,0,0],
[0,0,0,1,1,0,1],  
[0,0,1,0,1,1,0],
[0,0,1,0,0,1,1],
[0,1,0,0,0,0,1]
]

=end
