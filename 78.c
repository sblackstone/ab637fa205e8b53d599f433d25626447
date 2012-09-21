#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <strings.h>
#define MAXPENT 100000

typedef struct {
	unsigned long long val;
} values;

int pent[MAXPENT];

values phash[MAXPENT];


int pent_val(i) {
	return i * (3*i - 1) / 2;
}


void init_phash() {
	int i;
	for (i = 0; i < MAXPENT; i++) {
		phash[i].val = 0;
	}
	phash[0].val = 1;
	phash[1].val = 1;
}
void init_pent() {
	int i = 0;
	int c = 0;
	for (i = 1; i < MAXPENT/2; i++) {
		pent[c++] = pent_val(i);
		pent[c++] = pent_val(i*-1);
	}
	return;
}

unsigned long long p(int k) {
	if (phash[k].val > 0) return phash[k].val;
	int track = 0;
	unsigned long long t;
	unsigned long long val = 0;
	int i = 0;
	for (i = 0; pent[i] < k; i++) {
		t = p(k - pent[i]);
		if (track < 2)
			val+= t;
		else
			val-= t;
		track = (track + 1) % 4;
	}
	phash[k].val = val;
	return val;
}

int main() {
	init_pent();
	init_phash();
	int i;
	for ( i= 0; i < 50000; i++) {
		printf("%lld\n", p(i));
	}
	
}