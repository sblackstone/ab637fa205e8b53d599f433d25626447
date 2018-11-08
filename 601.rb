
def streak_recur(n, k = 0)
 (n + k)  % (k + 1) == 0 ? (1 + streak(n, k+1)) : 0
end

def streak_iter(n)
  result = 1
  k = 1
  while (n + k) % (k+1) == 0
    result += 1
    k += 1
  end
  result
end

def p_brute(s,n)
  result = 0
  3.step(n-1, 2) do |i|
    result += 1 if s == streak(i) 
  end
  result
end


def check(s,n)
  return false if (n+1) % (s+1) == 0 
  return streak_iter(n - s + 1) == s
end


def p(s,n)
  result  = 0
  s.step(n-1, s) do |i|
    result += 1 if check(s, i)
  end
  result
end

def p_fancy(s,n)
  a = (2..(s+1)).to_a
  pp a
  exit
end



puts p(6, 10**6)

#exit


1.upto(31) do |i|
  v = p(i, 4**i)
  puts "%i %i" % [ i, v]
end



=begin
  sol = [1, 2a, 3b, 4c, 5d, 6e, !7f]


=end
