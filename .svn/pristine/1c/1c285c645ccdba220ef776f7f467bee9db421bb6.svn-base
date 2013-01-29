#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <strings.h>
#define TENM 10000000

int totients[TENM];


int totient(int n) {
	if (totients[n] == 0) 
		totients[n] = do_totient(n);
	return totients[n];
}

void bsort(char* buf) {
	int i,j;
	char t;
	for (i = 0; i < strlen(buf); i++) {
		for (j = i+1; j < strlen(buf); j++) {
			if (buf[i] > buf[j]) {
				t = buf[i];
				buf[i] = buf[j];
				buf[j] = t;		
			}
		}
	}
	return;
}

int perm(int a, int b) {
	char bufa[8];
	char bufb[8];
	sprintf(bufa,"%d",a);
	sprintf(bufb,"%d",b);
	bsort(bufa);
	bsort(bufb);
	return(strcmp(bufa,bufb));
};

int do_totient(int n) {
	int p    = 2;
	int inc  = 1;
	int tmpn = 0;
	int m    = 0;
	int val  = 0;
	while (p < sqrt(n)) {
		if (n % p == 0) {
			tmpn = n;
			m = 0;
			while (tmpn % p == 0) {
				m = m + 1;
				tmpn = tmpn / p;
			}
			val = pow(p, m - 1) * (p - 1); //totient(p);
			if (tmpn == 1) {
				return val;
			} else {
				return totient(tmpn) * val;
			}
		}
		p = p + inc;
		inc = 2;
	}
	return(n-1);
}

int main(int argc, char* argv) {
	int i = 0;
	int t = 0;
	float f;
	float min = 99999;
	bzero(totients, TENM);	
	for (i = 3; i < TENM; i += 2) {
		t = totient(i);
		f = i / (float)t;
		if ( f < min && perm(i, t) == 0) {
  		  min = f;
	      printf("%d\t%d\t%f\n", i,t,f); 

		}
	}
}


/*

printf("%i")
printf("%d %d", min, minn, totients[minn]);

*/