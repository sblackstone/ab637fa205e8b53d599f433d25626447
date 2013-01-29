#include "fp.h"
#include <stdio.h>

int main() {
	bool *primes = setup_primes(1000);
	for (int i=0;i< 1000;i++) {
		if (fast_prime(i) != primes[i]) {
			printf("%i\n",i);
		}
	}
	return(1);
}