#include "fp.h"
#include <stdio.h>
#include <math.h>

#define PRIMES 500000

long concat(int i, int j) {
	return(i * pow(10, floor(log10(j))+1) + j);
}


int main() {
	bool *primes = setup_primes(PRIMES);
	return 1;
	
}
