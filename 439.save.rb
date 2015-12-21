=begin
Under The Rainbow
Problem 493
70 colored balls are placed in an urn, 10 for each of the seven rainbow colors.

What is the expected number of distinct colors in 20 randomly picked balls?

Give your answer with nine digits after the decimal point (a.bcdefghij).
a.bcdefghij
5.525443786
6.808364598
6.355969382
5.995481927
5.576642335
982248

66  14
891 55

=end

require 'pp'

def fact_down_to(n, k)
  n < k ? 1 : n*fact_down_to(n-1,k)
end

def fact(n)
  n == 0 ? 1 : n*fact(n-1)
end


def nCk(n,k)
  fact(n) / (fact(k) * fact(n-k))
end

@uniq = nil

def ways_to_add_to_n_using_x(n, x, cur = [], tot = 0)
  if cur.length == x
    if tot == n
      @uniq[cur.count {|x| x > 0}] ||= Array.new
      @uniq[cur.count {|x| x > 0}].push cur.clone.sort unless @uniq[cur.count {|x| x > 0}].include? cur.clone.sort
    end
    return
  end
  0.upto(10) do |i|
    break if tot + i > n
    cur.push i
    ways_to_add_to_n_using_x(n, x, cur, tot + i)
    cur.pop
  end
end


@uniq = Hash.new


ways_to_add_to_n_using_x(20, 7)


total_ways = Hash.new

@uniq.each do |num_colors, patterns|
  ways_to_assign_colors = nCk(7, num_colors)
  total_ways[num_colors] = 0
  patterns.each do |p|
    total_ways[num_colors] += fact(20).to_f / p.reject {|x| x == 0}.map {|x| fact(x) }.inject(:*)
  end
  
end


@ex = 0

@tot = total_ways.values.inject(:+)

total_ways.each do |num_colors, ways|

  @ex += num_colors * (ways.to_f / @tot)

end


pp @ex










exit

@ex = 0
 
@uniq.each do |num_colors ,v|
  ways_to_use_x_colors = 0
  
  
  puts "#{num_colors}: #{ways_to_use_x_colors}"
  
  ways_to_assign_colors = nCk(7, num_colors)
  pp v  
  
  
  @ex += num_colors * (ways_to_use_x_colors.to_f / @tot.to_f)
end

pp @ex
