require 'pp'

def tri(n) 
  (n * (n + 1)) / 2
end

def squ(n)
  n * n
end

def pen(n)
  n * (3 * n - 1) / 2
end

def hex(n)
  n * (2 * n - 1)
end

def hep(n)
  n * (5 * n - 3) / 2
end

def oct(n)
  n * (3*n - 2)
end

def p(k,n)
  return tri(n) if k == 3
  return squ(n) if k == 4
  return pen(n) if k == 5
  return hex(n) if k == 6
  return hep(n) if k == 7
  return oct(n) if k == 8
end

def head(n)
  (n / 100.0).floor
end

def tail(n)
  n % 100
end




@track = Array.new

3.upto(8) do |type|
  @track[type] = Array.new
  n = 1
  #puts "type = #{type}"
  while true
    v = p(type,n)
    @track[type] << v if v > 999 and v < 10_000 and v % 100 > 9
    break if v > 9999
    n += 1
  end
end

STOP = 6

def search(level, levels, solution)
  #print "On level #{level}"
  if level == STOP and tail(solution.last) == head(solution.first)
    pp solution
    pp solution.inject(&:+)
    exit
  end
  return if level == STOP

  @track[levels[level]].each do |pn|
    next if solution.any? {|x| x == pn}
    next if solution.size > 0 and tail(solution.last) != head(pn)
    solution.push(pn)
    pp solution
    search(level+1, levels, solution)
    solution.pop
  end
end


sol = Array.new
[3,4,5,6,7,8].permutation(6).each do |a|
  search(0, a, sol)
end
puts "fail"

=begin
3.upto(STOP-1) do |check|
  puts "bad"
  #exit(check) if !@track[check].any? {|x| x == solution[check-3]}
end
=end
