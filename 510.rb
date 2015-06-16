=begin
Tangent Circles
Problem 510
Circles A and B are tangent to each other and to line L at three distinct points.
Circle C is inside the space between A, B and L, and tangent to all three.
Let rA, rB and rC be the radii of A, B and C respectively.

Let S(n) = Σ rA + rB + rC, for 0 < rA ≤ rB ≤ n where rA, rB and rC are integers.
The only solution for 0 < rA ≤ rB ≤ 5 is rA = 4, rB = 4 and rC = 1, so S(5) = 4 + 4 + 1 = 9.
You are also given S(100) = 3072.

Find S(109).




Define circle 1 as x^2 + y^2 = rA



x=0,y=0, x^2 + y^2 = ra




# (2*ra + rb) + ra
# ((3*ra + rb)/2)



=end



ra = 4
rb = 4
rc = 1

print "(x-#{ra}))^2 + (y-#{ra})^2 = #{ra**2}"
print ","
print "(x-#{2*ra + rb})^2 + (y-#{rb})^2 = #{rb**2}"
print ","
puts "(x-#{((3*ra + rb)/2)})^2 + (y-#{rc})^2 = #{rc**2}"

