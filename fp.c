#include <stdio.h>
#include <stdlib.h>

long mod_pow(long base, long power, long mod) {
	long result = 1;
	while (power > 0) {
    if (power & 1 == 1) {
			result = (result * base) % mod;	
    }
		base = (base * base) % mod;
		power >>= 1;
		
	}
	return(result);
}

int fast_prime(long n) {
	if (n == 2) return true;
	if (n  < 2) return false;
	if (n % 2 == 0) return false;
	long d = n - 1;
	while (d % 2 == 0) {
		d /= 2;
	}
	int abase[] = {2,3,5,7,11};
	for (int i = 0; i < 5; i++) {
		int a = abase[i];
		if (a==n) { return(true); }
		long t = d;
		long y = mod_pow(a,d,n);
    while (t != (n-1) && y != 1 && y != (n-1)) {
			y = (y*y) % n;
			t *= 2;
    }
    if (y != (n-1) && (t % 2 == 0)) {
			return(false);
    }
	}
	return(true);
}


bool * setup_primes(int size) {
  int i,j;
  bool * primes;
  primes = (bool*)malloc(size);
  for (i=0;i < size; i++) {
    primes[i] = 1;
  }
  primes[0] = 0;
  primes[1] = 0;
  i = 2;
  while (i < size) {
    for (j = i+i; j < size; j+= i) {
      if (j < size) {
        primes[j] = 0;
      }
    }
    i++;
    while (i < size && primes[i] == 0) {
      i++;
    }
  }
	return(primes);
}


