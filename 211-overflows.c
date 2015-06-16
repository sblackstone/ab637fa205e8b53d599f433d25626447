#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define SIZE 1000000

int main() {

	unsigned long long *nums, *sigm;
	unsigned long long i,j,k, total;
	
	nums = malloc(sizeof(unsigned long long) * (SIZE + 1));
	sigm = malloc(sizeof(unsigned long long) * (SIZE + 1));
	
	for (i=0; i < SIZE; i++) {
		nums[i] = i;
		sigm[i] = 1;
	}
	
	i = 2;
	
	while(1) {
		while(nums[i] == 1) {
			i++;
		}
		if (i >= SIZE) {
			break;
		}
		//printf("%llu\n", i);
		k = 1;
		while(i*k < SIZE) {
			j = 0;
			while(nums[i*k] % i == 0) {
				nums[i*k] /= i;
				j++;
			}
			
			
			//sigm[i*k] *= i**(2*j + 2) / (i**2  - 1);
			unsigned long long t = powl(i, 2*j + 2);
			unsigned long long b = powl(i,2) - 1;
			
			sigm[i*k] *= (t / b);
			k++;
		}
	}
	
	total = 0;
	for(i=1; i < SIZE; i++) {
		printf("%llu: %llu\n", i, sigm[i]);

    if (sqrtl(sigm[i]) == floor(sqrtl(sigm[i]))) {
			total += i;
    }	
	}
	printf("%llu", total);
	return(0);
}
