p = 3
q = 5
n = p*q

hp = (p + q + Math.sqrt(p**2 + q**2)) / 2

puts Math.sqrt(hp*(hp - p)*(hp-q)*(hp-Math.sqrt(p**2 + q**2)))