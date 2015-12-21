N  = 50
h = Hash.new(0)
1.upto(35) do |a|
  1.upto(35) do |b|
    1.upto(35) do |c|
      1.upto(35) do |d|
        aprime = a**2 + b*c
        bprime = a*b + d*b
        cprime = a*c + d*c
        dprime = d**2 + b*c
        if aprime+dprime < N
          h["#{aprime}:#{bprime}#{cprime}:#{dprime}"] += 1 
          puts "#{aprime}\t#{bprime}\n#{cprime}\t#{dprime}"
          puts "#{a}\t#{b}\n#{c}\t#{d}"
          puts "*" * 50
        end
      end
    end
  end
end

h.each do |k,v|
  puts k if v == 2
end
