require 'pp'

@pents_hash = Hash.new(nil)
@pents = Hash.new(nil)
@rev_pent = Hash.new(nil)

def quad(a,b,c)
  bsquaredminusfourac = b**2 - (4 * a * c)
  negb = b * -1
  twoa = 2 *a
  ans1 = negb + Math.sqrt(bsquaredminusfourac) 
  ans2 = negb - Math.sqrt(bsquaredminusfourac) 
  return (ans1 / twoa), (ans2 / twoa)
end


def reverse_pent(c)
  @rev_pent[c] ||= quad(3,-1,2*c*-1).max.round
end


def isPent?(i)
  i = i.abs
  @pents_hash[i] ||= begin
    k = (Math.sqrt(i*24+1) + 1) / 6.0
    k.round == k
  end
end

def pent(i)
  @pents[i] ||= i * (3*i - 1) / 2
end

def go
  1.upto(2500) do |c|
    c.downto(1) do |d|
      next if c == d
      pc = pent(c)  
      pd = pent(d)
      pa = (pc + pd) / 2.0
      next unless isPent?(pa)
      pb = pc - pa
      a  = reverse_pent(pa)
      b  = reverse_pent(pb)
      if isPent?(pb) 
        puts "#{a},#{b},#{c},#{d}"
        puts "pent(#{a}) + pent(#{b}) = #{pent(a)+pent(b)}"
        puts "pent(#{a}) - pent(#{b}) = #{pent(a)-pent(b)}"
        puts "isPent(#{pent(a)+pent(b)}) = #{isPent?(pent(a)+pent(b))}"
        puts "isPent(#{pent(a)-pent(b)}) = #{isPent?(pent(a)-pent(b))}"
        exit
      end
    end
  end
end

go()