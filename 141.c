#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <gmp.h>


#define MAX 1000000



int is_ps(unsigned long long n) {
	unsigned long long k = floor(sqrt(n));
	return(k*k == n);
}

int main() {


	unsigned long long a,b;
	mpz_t a2, b3, v, sum;

	mpz_init(a2);
	mpz_init(b3);
	mpz_init(v);
	mpz_init_set_ui(sum, 0);

	for (b = 1; b < sqrt(MAX); b++) {
		mpz_ui_pow_ui(b3, b, 3);			
		for (a = 1; a < b	; a++) {
			mpz_ui_pow_ui(a2, a, 2);		
			mpz_add(v, a2, b3);
      if (!mpz_divisible_ui_p(v, a)) {
				continue;
      }
			mpz_div_ui(v, v, a);
			if (mpz_perfect_square_p(v)) {
				mpz_add(sum, sum, v);
				printf("%s %llu %llu\n",  mpz_get_str(NULL, 10, v), a, b);
			}


    }

  }



 	
	return(0);
}


