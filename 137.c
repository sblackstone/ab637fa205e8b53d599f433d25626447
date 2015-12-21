/*

1 2 25
2 15 1156
3 104 54289
4 714 2550409
5 4895 119814916
6 33552 5628750625
7 229970 264431464441
8 1576239 12422650078084
9 10803704 583600122205489
10 74049690 27416783093579881
11 507544127 1288005205276048900

*/

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <gmp.h>

#define SIZE 1000

int main() {
	mpz_t k,a, t;
	int nugget = 1;

	mpz_init_set_ui(a, 17);	
	mpz_init_set_ui(k, 8);
	mpz_init(t);
	while(1) {
    if (mpz_perfect_square_p(k)) {
			mpz_set(t, a);
			mpz_sub_ui(t, t, 7);
			mpz_div_ui(t, t, 10);
			printf("%i: %s\n", nugget++, mpz_get_str(NULL, 10, t));
    }		
    if (nugget == 16) {
			break;
    }
		mpz_add(k, k, a);
		mpz_add_ui(a, a, 10);
		
	}


  return(0);
}
