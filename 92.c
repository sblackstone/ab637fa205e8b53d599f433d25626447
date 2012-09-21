#include <stdio.h>
#include <stdlib.h>
#include <math.h>


int transform(int n) {
	int ret = 0;
	while (n > 0) {
		int m10 = n % 10;
		ret += m10 * m10;
		n-= m10;
		n/= 10;
	}  
	return(ret);
}

int track[10000000] = { 0 };

int trace(int n) {
	if (n==1) return 1;
	if (n==89) return 2;
  if (track[n] == 0) {
		track[n] = trace(transform(n));
  }
	return(track[n]);
}

int main() {
	int i;
	int c = 0;
	for (i=2; i < 10000000; i++) {
		if (trace(i)== 2) c++;
	}
	printf("c = %i\n", c);

}