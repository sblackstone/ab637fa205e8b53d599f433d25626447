#include <stdio.h>
#include <stdlib.h>

#define FALSE 0
#define TRUE  1


int is_prime(long n) {
	long i;
	for (i = 2; i < ((long)sqrt(n) + 1); i++) {
		if (n % i == 0) {
			return(FALSE);
		}
	}
	return(TRUE);
}


int main(long argc, char *argv) {
	long  val  = 1;
	long  step = 2;
	float size = 3;
	float diag = 0;
	float result = 0;
	long i = 0;
	long j = 0;
	float count = 0;
	while (TRUE) {
		for (i = 0; i < 4; i++) {
			val += step;
			if (is_prime(val)) {
				count = count + 1;
			}
		};
		diag = size * 2 - 1;
		result = count / diag;
		if (result < 0.1) { break; }
		step = step + 2;
		size = size + 2;
	}
	printf("siz %f\n", size);
}