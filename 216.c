#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <gmp.h>


int main() {
	unsigned long long yup, nope, n;
	mpz_t vt, va;
	mpz_init_set_ui(vt, 7);
	mpz_init_set_ui(va, 6);
	yup = 0;
	nope = 0;
	n = 2;
	while (n <= 50000000) {
		//printf("%llu %s\n", n, mpz_get_str(NULL, 10, vt));
    if (mpz_probab_prime_p(vt, 4) > 0) {
			yup++;
    } else {
			nope++;
    }
		mpz_add_ui(va, va, 4);
		mpz_add(vt, vt, va);
		n++;
	}
	printf("%llu %llu\n", yup, nope);
	
}


