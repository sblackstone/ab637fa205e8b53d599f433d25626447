#include <stdio.h>

#define SIZE 1000000

int sdiv[SIZE];
int hsh[SIZE];

int chain(int n) {
	int i;
	for (i=0; i < SIZE; i++) { hsh[i] = 0; }
	hsh[n] = 1;
	int cur = sdiv[n];
	int min = n;
	int cnt = 1;
	while(cur < SIZE && hsh[cur] != 1) {
		cnt++;
		hsh[cur] = 1;
    if (cur < min) {
			min = cur;
    }
		cur = sdiv[cur];
	} 
  if (cur == n) {
		return(cnt);
  } else {
		return(-1);
  }
}


int main() {
	int i,d,cur;
	int best = 0;
	for (i=1; i < SIZE; i++) {
		sdiv[i] = 0;
	}
	for (d=1; d < SIZE; d++) {
		i = d * 2;
		while (i < SIZE) {
			sdiv[i]+= d;
			i += d;
		}
	}
	for (i=1; i < SIZE ; i++) {
		cur = chain(i);
	}
	printf("%d\n", chain(12496));
	return(0);
	
}