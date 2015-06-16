=begin
A number consisting entirely of ones is called a repunit. We shall define R(k) to be a repunit of length k.

For example, R(10) = 1111111111 = 11×41×271×9091, and the sum of these prime factors is 9414.

Find the sum of the first forty prime factors of R(109).



(10**n - 1) / 9



= (10**n/2 + 1)(10**(n/2) - 1) / 9


if n = p*q

R(n) % R(p) == 0
R(n) % R(q) == 0

=end


require './euler_lib.rb'



