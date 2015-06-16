#include <iostream>
#include <bitset>
#include <cmath>
#include <vector>

using namespace std;

#define MAX_PRIMES 100000000000
#define ulong unsigned long long


class Primes {
private:
	bitset<MAX_PRIMES> *b;
public:
	Primes();
	int is_prime(ulong);
};


Primes::Primes() {
	b =  new std::bitset<MAX_PRIMES>;
	b->reset();
	b->flip();
	b->set(0,0);
	for (ulong i=2; i < MAX_PRIMES; i++) {
		if (b->test(i)) {
			cout << i << endl;
			ulong j = 2;
			while (j*i < MAX_PRIMES) {
				b->set(j*i,0);
				j += 1;
			}
		}
	}
	cout << "Primes are setup" << endl;
	return;
}

int Primes::is_prime(ulong n) {
	return(b->test(n) == 1);
};


int main() {
	Primes *primes = new Primes();
}

