#include <stdio.h>


int main() {
	unsigned long long i, j = 0;
	for (i = 1; i <= 1073741824; i++) {
    if ((i ^ (i<<1) ^ (i+ (i<<1))) == 0) {
			j++;
    }		
	}
	
	printf("%lld\n", j);
}

