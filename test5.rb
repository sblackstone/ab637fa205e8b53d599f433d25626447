def modpow(b,e,m)
  result = 1
  while e > 0
    if (e & 1) == 1
      result = (result * b) % m;
    end
    e = e >> 1;
    b = (b * b) % m;
  end
  return result
end



1.upto(30) do |i|
  1.upto(30) do |j|
    print "#{modpow(i,j,720)}\t"
  end
  puts
end
