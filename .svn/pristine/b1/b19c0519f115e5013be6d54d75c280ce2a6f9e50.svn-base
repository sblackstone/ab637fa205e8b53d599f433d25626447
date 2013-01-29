#include <stdio.h>
#include <stdlib.h>
#include <math.h>


int fact[10] = { 1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880 };

int transform(int n) {
	int ret = 0;
	while (n > 0) {
		ret += fact[n%10];
		n = (n - (n % 10)) / 10;
	}
	return(ret);
}

int main() {
	int *trans = (int *)malloc(10000000*sizeof(int));
	int i;
	for (i=0; i < 10000000; i++) {
		trans[i] = transform(i);
	}
	printf("%i\n", trans[169]);
}