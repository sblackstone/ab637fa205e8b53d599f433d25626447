#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <gmp.h>

#define SIZE 1000

int main() {
	
  mpz_t *sigm = malloc(sizeof(mpz_t) * (SIZE + 1));
	mpz_t j2, total;
	mpz_init(j2);
	int k;
	
	for (int n=0; n < SIZE; n++) {
		mpz_init_set_ui(sigm[n], 1);
	}	  

	for (int j = 2; j < SIZE; j++) {
		mpz_set_ui(j2, j);
		mpz_mul(j2, j2, j2);
		k = j;
		while (k < SIZE) {
			mpz_add(sigm[k], sigm[k], j2);
			k += j;
		}
	}

	mpz_init_set_ui(total, 0);
	for (int i = 0; i < SIZE; i++) {
		if (mpz_perfect_square_p(sigm[i])) {
  	 mpz_add_ui(total, total, i);
		 printf("%i: %s\n", i, mpz_get_str(NULL, 10, sigm[i]));
    }
	}
  printf("Total = %s\n", mpz_get_str(NULL, 10, total));

  return(0);
}
