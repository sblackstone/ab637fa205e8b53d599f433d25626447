/*

Problem 146

The smallest positive integer n for which the numbers n**2+1, n**2+3, n**2+7, n**2+9, n**2+13, and n**2+27 are consecutive primes is 10.

The sum of all such integers n below one-million is 1242490.

What is the sum of all such integers n below 150 million?
 

k +  1 = p
k +  3 = p +   2
k +  7 = p +   6
k +  9 = p +   8
k + 13 = p +  12
k + 27 = p +  26

(k+1)(k+3)(k+7)(k+9)(k+13)(k+27) = p*(p+2)(p+6)(p+8)(p+12)(p+26)


Primes end in 1, 3, 7, 9

If the last digit of a number is 0, its square ends in an even number of 0s (so at least 00) and the digits preceding the ending 0s must also form a square.
If the last digit of a number is 1 or 9, its square ends in 1 and the number formed by its preceding digits must be divisible by four.
If the last digit of a number is 2 or 8, its square ends in 4 and the preceding digit must be even.
If the last digit of a number is 3 or 7, its square ends in 9 and the number formed by its preceding digits must be divisible by four.
If the last digit of a number is 4 or 6, its square ends in 6 and the preceding digit must be odd.
If the last digit of a number is 5, its square ends in 25 and the preceding digits must form a pronic number.

n % 10 -
--------

1,9:  square ends with 1, s+1 ends in 2, even.
3,7:  square ends in 9 and s+1 ends in 0, even
5: square ends in 25, +1 = 26.

So numbers must end in 0!


n^12+60 n^10+1281 n^8+12520 n^6+57819 n^4+112860 n^2+66339


*/

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <gmp.h>

#define MAX 150000000


int main() {
  mpz_t sum, n, n2;
  mpz_init_set_ui(sum, 0);
  mpz_init_set_ui(n, 0);
  mpz_init(n2);
  int flag;
  int addens[6] = {1,2,4,2,4,14};
  while (1) {
    mpz_add_ui(n, n, 10);   
    mpz_mul(n2, n, n);
    flag = 1;
    for (int i = 0; i < 6; i++) {
      mpz_add_ui(n2, n2, addens[i]);
      if (mpz_probab_prime_p(n2, 4) == 0) {
        flag = 0;
        break;
      }
    }
    if (flag) {
      mpz_mul(n2, n, n);
      for (int i = 1; i < 27; i++) {
        mpz_add_ui(n2, n2, 1);
        if (i==1 || i==3 || i==7 || i==9 || i== 13 || i==27) {
          continue;
        }
        if (mpz_probab_prime_p(n2, 4) > 0) {
          flag = 0;
          break;
        }
      }
      if (flag) {
        mpz_add(sum, sum, n);
        printf("%s\n",  mpz_get_str(NULL, 10, n));    
      }

    }
    if (mpz_get_ui(n) > MAX) {
      break;
    }
  }
  printf("%s\n",  mpz_get_str(NULL, 10, sum));    
}
