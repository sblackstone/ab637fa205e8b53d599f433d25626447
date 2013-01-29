require 'pp'



M = 100


1.upto(M) do |a|
  (a).upto(M) do |b|
    (b).upto(M) do |c|
      @sol = [
        Math.sqrt(a**2 + (b+c)**2),
        Math.sqrt(a**2 + b**2) + c,
        Math.sqrt((a+c)**2 + b**2)
      ].min
      if @sol == @sol.round 
        puts @sol
      end
      
    end
  end
end
