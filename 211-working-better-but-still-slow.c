#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <gmp.h>

#define SIZE 64000000

int main() {

	mpz_t *nums, *sigm, total, m;
	unsigned long long i,j,k;
		
	nums = malloc(sizeof(mpz_t) * (SIZE + 1));
	sigm = malloc(sizeof(mpz_t) * (SIZE + 1));
	
	for (i=0; i < SIZE; i++) {
		mpz_init_set_ui(nums[i], i);
		mpz_init_set_ui(sigm[i], 1);
	}
	i = 2;
	
	while(1) {
		while(mpz_cmp_ui(nums[i],1) == 0) {
			i++;
		}
		if (i >= SIZE) {
			break;
		}
		//printf("%llu\n", i);
		k = 1;
		while(i*k < SIZE) {
			j = 0;
			mpz_init(m);
			mpz_mod_ui(m, nums[i*k], i);
			while(mpz_cmp_ui(m,0) == 0) {
				mpz_div_ui(nums[i*k], nums[i*k], i);
				j++;
				mpz_mod_ui(m, nums[i*k], i);
			}
			mpz_t t1, t2;
			mpz_init_set_ui(t1, i);
			mpz_pow_ui(t1, t1, 2*j + 2);
			mpz_init_set_ui(t2, i);
			mpz_mul(t2, t2, t2);
			mpz_sub_ui(t2, t2, 1);
			mpz_div(t1, t1, t2);
			mpz_mul(sigm[i*k], sigm[i*k], t1);
			k++;
		}
	}

	mpz_init_set_ui(total, 0);
	for(i=1; i < SIZE; i++) {

    if (mpz_perfect_square_p(sigm[i])) {
	    printf("%llu: %s\n", i, mpz_get_str(NULL, 10, sigm[i]));
			mpz_add_ui(total, total, i);
    }	
	}
  printf("Total = %s\n", mpz_get_str(NULL, 10, total));
	return(0);
}
