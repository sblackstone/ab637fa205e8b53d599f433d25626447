#include <stdio.h>
#include <stdlib.h>
#include <gmp.h>

int main() {
	const int seq_def[] = { 1, 2, 3, 4, 3, 2 };
	int sec_loc = 0;
	int i = 0;
	int n = 1;
	int current_sum = 0;
	mpz_t current_v, total;
  mpz_init (current_v);
  mpz_init (total);

	while(1) {
		i = seq_def[sec_loc];	
		if (current_sum == n) {
			//printf("%s\n", mpz_get_str(NULL, 10,current_v));		
			mpz_add(total, total, current_v);
			mpz_mod_ui(total, total, 123454321);
			current_sum = 0;
			mpz_init(current_v);
			n++;
			if (n == 1000000) {
				break;
			}
		}
		current_sum += i;
		mpz_mul_ui(current_v, current_v, 10);
		mpz_add_ui(current_v, current_v, i);
		sec_loc++;
		sec_loc = sec_loc % 6;
	}
	printf("Total = %s\n", mpz_get_str(NULL, 10, total));
	return(0);
}