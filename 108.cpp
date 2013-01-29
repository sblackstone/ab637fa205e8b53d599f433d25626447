#include <iostream>
#include <bitset>
#include <cmath>
#include <vector>

using namespace std;

#define ulong unsigned long long


int solutions(ulong n) {
	ulong count = 0;
	ulong x = n;
	ulong y = 0;
	while(1) {
		x+= 1;
		if ((n*x) % (x-n) == 0) {
			y = (n*x) / (x - n);
			count += 1;
			if (x == y) {
				break;
			}
		}
	}	
	return(count);
}

int main() {
	for (int i=0; i < 1300; i++) {
		if (solutions(i) > 100) {
			cout << i << endl;
			exit(0);
		}
	}
}