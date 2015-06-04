#include <iostream>
#include <bitset>
#include <cmath>
#include <vector>

using namespace std;

#define MAX_PRIME 100
#define MAX 10000
#define ulong unsigned long long

int main() {
	int primes[] = {2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97};		
  bitset<MAX> *b;
	b = new std::bitset<MAX>;
  int num_primes = sizeof(primes)/sizeof(int);
	for (int i =0; i < num_primes; i++) {
		for (int j =i+1; j < num_primes; j++) {
			for (int k =j+1; k < num_primes; k++) {
				for (int l =k+1; l < num_primes; l++) {
					int p = primes[i] * primes[j] * primes[k] * primes[l];
					int m = 1;
					while (m*p < MAX) {
						b->set(m*p);
						m += 1;
					}
					// cout << p << endl;
				}
			}
		}
	}
	for (int i=0; i < MAX; i++) {
		if (b->test(i)) {
			cout << i << endl;
		}
	}
  return(0);
}
