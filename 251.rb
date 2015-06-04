=begin

Cardano Triplets
Problem 251
A triplet of positive integers (a,b,c) is called a Cardano Triplet if it satisfies the condition:


For example, (2,1,5) is a Cardano Triplet.

There exist 149 Cardano Triplets for which a+b+c ≤ 1000.

Find how many Cardano Triplets exist such that a+b+c ≤ 110,000,000.


(a+(b*c**(1/2.0)))**(1/3.0) + (a+b*c**(1/2.0))**(1/3.0), a=2, b=1, c= 5



cuberoot(2 + 1*sqrt(5)) + cuberoot(2 - 1*sqrt(5))





=end


def cuberoot(n)
  n**(1/3.0)
end

def sqrt(n)
  Math.sqrt(n)
end



def c(a,b,c)
  cuberoot(a + (b*sqrt(c))) + cuberoot(a - (b*sqrt(c))) 
end


puts c(2.0,1.0,5.0)

