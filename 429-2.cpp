#include <iostream>
#include <bitset>
#include <cmath>
#include <vector>

using namespace std;

#define MAX_PRIMES 100000000
#define ulong unsigned long long
#define N_VAL 100000000


class Primes {
private:
	bitset<MAX_PRIMES> *b;
public:
	vector<ulong> *primes;
	Primes();
	int is_prime(ulong);
};


Primes::Primes() {
	b =  new std::bitset<MAX_PRIMES>;
	primes =  new std::vector<ulong>;
	b->reset();
	b->flip();
	b->set(0,0);
	for (ulong i=2; i < MAX_PRIMES; i++) {
		if (b->test(i)) {
			primes->push_back(i);
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

ulong modpow(ulong b, ulong e, ulong m) {
	ulong result = 1;
	while (e > 0) {
		if (e & 1 == 1) {
			result = (result * b) % m;
		}
		e >>= 1;
		b = (b*b) % m;
	}
	return(result);
}


void calc(ulong *prime_fact) {
	ulong c = 1;
	for (int j=100000000; j >= 0; j--) {
    if (prime_fact[j] > 0) {
			c *= (1 + modpow(j, prime_fact[j]*2, 1000000009)) %  1000000009;
			c = c % 1000000009;
    }
	}
	cout << "C: " << c << endl;
}

// LegendresTheorem http://www.cut-the-knot.org/blue/LegendresTheorem.shtml
int vp(ulong base) {
 	ulong tmp = N_VAL;
	ulong index = 0;
	ulong result = 0;
  while (tmp != 0) {
	  result +=  tmp % base;
		tmp = tmp / base;
		++index;
  }  	
	return((N_VAL - result) / (base - 1));
}

int main() {
	Primes *primes = new Primes();
	ulong *prime_fact = new ulong[100000000];
	for(ulong i=0; i< 100000000; prime_fact[i++] = 0);
	for(vector<ulong>::iterator i = primes->primes->begin(); i != primes->primes->end(); i++) {
    if (*i > N_VAL) {
			break;
    }
		prime_fact[*i] = vp(*i);
	}	
	calc(prime_fact);
}

