MAX_M   = 1000
MAX_LEN = 1_500_000
max_len = 0

class SolutionTracker
  attr_reader :solutions
  
  def answer
    count = 0
    0.upto(MAX_LEN) do |i|
      count += 1 if solutions[i] == 1
    end
    return count
  end
  
  
  def add_length(len)
    mult = len
    while mult <= MAX_LEN
      solutions[mult] += 1
      mult = mult + len
    end
  end
  
  def initialize
    @solutions = Array.new(MAX_LEN+1, 0)
  end
  
end

st = SolutionTracker.new

maxm = 0
1.upto(MAX_M) do |m|
  1.upto(m-1) do |n|
    next unless m.gcd(n) == 1
    a = m**2 - n**2
    b = 2 * m * n
    c = m**2 + n**2
    len = a + b + c
    next if a % 2 == 0 and b % 2 == 0 and c % 2 == 0
    break if len > MAX_LEN
    if m > maxm
      maxm = m
    end
    st.add_length(len)
  end
end

puts maxm


puts st.answer
