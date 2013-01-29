a = 1
b = 1
c = a + b
count = 3
while true 
  s = c.to_s
  if s[0,9].split("").sort.join("") == "123456789"
    puts "#{count} covers start"
    if s[-9,9].split("").sort.join("") == "123456789"
      puts "covers end"
      puts count
      exit
    end
  end
  
   
  count +=1
  #puts s
  a = b
  b = c
  c = a + b  
end
