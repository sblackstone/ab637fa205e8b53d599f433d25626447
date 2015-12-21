
=begin
def leg_sym(a,p)
  return leg_sym(a % p, p) if a > p
  if a == -1
    return 1 if p % 4 == 1
    return 3 if p % 4 == 3
    throw "shouldnt happen"
  end
  if a == 2
    return  1 if p % 8 == 1 or p % 8 == 7
    return -1 if p % 8 == 3 or p % 8 == 5
  end
  if a % 2 == 0
    return leg_sym(a / 2, p) * leg_sym(2, p)    
  end
  return 1 if a == 1
  return 0 if a.gcd(p)  == 1
  m = (a % 4 == 1 or p % 4 == 1) ? 1 : -1
  return m*leg_sym(p % a, a)
end
=end

=begin
def leg_sym(a,p)
  if a > p
    return leg_sym(a % p, p)
  end
  
  if a == -1
    return p % 4 == 1 ? 1 : -1
  end
  
  if a == 2
    return (p % 8 == 1 or p % 8 == 7) ? 1 : -1
  end
  
  if a % 2 == 0
    return leg_sym(2,p) * leg_sym(a/2, p)
  end
  
  return 1 if a == 1
  return 0 if a.gcd(p) > 1    
  
  return (-1)**(((a-1)/2)*((p-1)/2)) * leg_sym(p, a)
      
end