#include <stdio.h>
#include <math.h>

#define ulong unsigned long long

int square(ulong n) {
	ulong d = floor(sqrt(n));
	int i;
	for (i = -1; i < 2; i++) {
		if (pow((long)i+d,2) == n) {
			return(1);
		}
	}
	return(0);	
}

int main() {

	ulong a = 5;
	ulong ans = 0;
	while(1) {
		if (a > 600000000) { break; }
		ulong d = (3*a + 1)*(a-1);
		if (square(d)) {
			printf("%lld %lld %lld\n", a,a, a+1);
			ans += 3*a + 1;
		}
		d -= 4*a;
		if (square(d)) {
			ans += 3*a - 1;
			printf("%lld %lld %lld\n", a,a, a-1);
		}
		
		a+= 2;
	}
	printf("%lld\n", ans);
	
}