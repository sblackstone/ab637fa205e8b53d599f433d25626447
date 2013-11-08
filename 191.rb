=begin
A particular school offers cash rewards to children with good attendance and punctuality. If they are absent for three consecutive days or late on more than one occasion then they forfeit their prize.

During an n-day period a trinary string is formed for each child consisting of L's (late), O's (on time), and A's (absent).

Although there are eighty-one trinary strings for a 4-day period that can be formed, exactly forty-three strings would lead to a prize:

OOOO OOOA OOOL OOAO OOAA OOAL OOLO OOLA OAOO OAOA
OAOL OAAO OAAL OALO OALA OLOO OLOA OLAO OLAA AOOO
AOOA AOOL AOAO AOAA AOAL AOLO AOLA AAOO AAOA AAOL
AALO AALA ALOO ALOA ALAO ALAA LOOO LOOA LOAO LOAA
LAOO LAOA LAAO

How many "prize" strings exist over a 30-day period?

Strings with 0 or 1 L and for each AA, the next character is not an A.


Strings with at most AA

# How many ways are there to break up k-As 

Buckets = 6
A's = 4


OAOA, OOAO

AAOAA,   AOAOA
AOAOAO,  AAOAAO
AAOAAOA, AOAOAOA

Max A = 

4  - 3
5  - 4 AAOAA
6  - 4 AAOAAO
7  - 5 AAOAAOA
8  - 6 AAOAAOAA
9  - 6 AAOAAOAAO
10 - 7 AAOAAOAAOA
11 - 8 AAOAAOAAOAA
12 - 8 AAOAAOAAOAAO
                   

# http://oeis.org/A078803
# http://oeis.org/A078802

=end


require 'pp'



@fact_hash = Hash.new
@fact_hash[0] = 1
1.upto(100) do |i|
  @fact_hash[i] = i * @fact_hash[i-1]
end

def fact(n)
  @fact_hash[n] ||= do_fact(n)
end

def do_fact(n)
  return 1 if n <= 0
  return n*fact(n-1)
end

def nCk(n,k)
  return fact(n) / (fact(k)*fact(n-k))
end


def t(n,k)
  s = 0
  c = ((k-1)/2.0).ceil
  0.upto(c) do |j|
    s += nCk(n+1-k, k-j)*nCk(k-j, j)
  end
  return s
end


n = 365
sum = 0
0.upto(n) do |k|
  sum += t(n-1,n-k) * k
end

puts sum

