=begin
Criss Cross
Problem 166
A 4x4 grid is filled with digits d, 0 ≤ d ≤ 9.

It can be seen that in the grid

6 3 3 0
5 0 4 3
0 7 1 4
1 2 4 5

the sum of each row and each column has the value 12. Moreover the sum of each diagonal is also 12.

In how many ways can you fill a 4x4 grid with the digits d, 0 ≤ d ≤ 9 so that each row, each column, and both diagonals have the same sum?


A B C D
E F G H
I J K L
M N O P

A+B+C+D = Z
E+F+G+H = Z
I+J+K+L = Z
M+N+O+P = Z

A+E+I+M = Z
B+F+J+N = Z
C+G+K+O = Z
D+H+L+P = Z

A+F+K+P = Z
D+G+J+M = Z


=================================

A+B+C+D = Z
E+F+G+H = Z
I+J+K+L = Z
M+N+O+P = Z

A+E+I+M = Z
B+F+J+N = Z
C+G+K+O = Z
D+H+L+P = Z

A+F+K+P = Z
D+G+J+M = Z


10Z = 3A + 2B + 2C + 3D   +   2E +3F + 3G + 2H    +    2I + 3J + 3K + 2L   +    3M + 2N + 2O + 3P

10Z = 2(B+C+E+H+I+L+N+O) + 3(A+D+F+G+J+K+M+P)




A+B+C+D = Z
E+F+G+H = Z
I+J+K+L = Z
M+N+O+P = Z
A+E+I+M = Z
B+F+J+N = Z
C+G+K+O = Z
D+H+L+P = Z
A+F+K+P = Z
D+G+J+M = Z


===

B+C+D = Z - A
E+I+M = Z - A
F+K+P = Z - A

===

A+C+D = Z - B
F+J+N = Z - B

===

A+B+D = Z - C
G+K+O = Z - C

===

A+B+C = Z - D
H+L+P = Z - D
G+J+M = Z - D

===

B+C+D = 12 - A
A+C+D = 12- B

2c+2d + 2z


=end


