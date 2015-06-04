=begin

The hyperexponentiation of a number
Problem 188
The hyperexponentiation or tetration of a number a by a positive integer b, denoted by a↑↑b or ba, is recursively defined by:

a↑↑1 = a,
a↑↑(k+1) = a(a↑↑k).

Thus we have e.g. 3↑↑2 = 33 = 27, hence 3↑↑3 = 327 = 7625597484987 and 3↑↑4 is roughly 103.6383346400240996*10^12.

Find the last 8 digits of 1777↑↑1855.


=end


def mod_pow(base, power, mod)
 result = 1
 while power > 0
   result = (result * base) % mod if power & 1 == 1
   base = (base * base) % mod
   power >>= 1;
 end
 result
end


def h(a,b, n)
    b == 1 ? a : mod_pow(a, h(a,b-1, n), n)
end


puts h(1777,1855, 10**8)



