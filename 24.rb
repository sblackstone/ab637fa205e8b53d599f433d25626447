count = 0
(0..9).to_a.each do |a|
  ((0..9).to_a - [a]).each do |b|
    ((0..9).to_a - [a,b]).each do |c|
      ((0..9).to_a - [a,b,c]).each do |d|
        ((0..9).to_a - [a,b,c,d]).each do |e|
          ((0..9).to_a - [a,b,c,d,e]).each do |f|
            ((0..9).to_a - [a,b,c,d,e,f]).each do |g|
              ((0..9).to_a - [a,b,c,d,e,f,g]).each do |h|
                ((0..9).to_a - [a,b,c,d,e,f,g,h]).each do |i|
                  ((0..9).to_a - [a,b,c,d,e,f,g,h,i]).each do |j|
                    count = count + 1
                    if count == 1000000
                      puts "#{a}#{b}#{c}#{d}#{e}#{f}#{g}#{h}#{i}#{j}"                  
                      exit
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end