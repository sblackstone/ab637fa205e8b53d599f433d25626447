#include <iostream>
#include <bitset>
#include <cmath>
#include <vector>

using namespace std;

#define MAX 100000000
#define ulong unsigned long long



class Primes {
private:
	bitset<MAX> *b;
public:
	vector<ulong> *primes;
	Primes();
	int is_prime(ulong);
};


Primes::Primes() {
	b =  new std::bitset<MAX>;
	primes =  new std::vector<ulong>;
	b->reset();
	b->flip();
	b->set(0,0);
	for (ulong i=2; i < MAX; i++) {
		if (b->test(i)) {
			primes->push_back(i);
			ulong j = 2;
			while (j*i < MAX) {
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





class FactFact {
private:
	ulong n;
	Primes *primes;
	ulong *prime_fact;
	ulong *least_fact_cache;
	void add_factors(ulong n);	
	ulong least_factor(ulong n);
	void cache_least_factor();

public:
	FactFact(ulong n);
};

void FactFact::add_factors(ulong n) {
	ulong lf = 0;
  while (n > 1) {
		lf = least_factor(n);
		while (n % lf == 0) {
			prime_fact[lf] += 1;			
			n /= lf;
		}
  }
}

ulong FactFact::least_factor(ulong n) { 
	return(least_fact_cache[n]);
}

void FactFact::cache_least_factor() {
	for(vector<ulong>::iterator i = primes->primes->begin(); i != primes->primes->end(); i++) {
		ulong k = 1;
		ulong prime = *i;
		while (k * prime <= n) {
			if (least_fact_cache[k*prime] == 0) {
				least_fact_cache[k*prime] = prime;
			}
			k++;
		}
	}
}



FactFact::FactFact(ulong nn) {
	primes = new Primes();
	n = nn;
  prime_fact = new ulong[nn+1];
	least_fact_cache = new ulong[nn+1];
	for (ulong i=nn; i > 0; i--) {
		least_fact_cache[i] = 0;
		prime_fact[i] = 0;
	}
	least_fact_cache[1] = 1;
	cache_least_factor();
	for (ulong i=2; i <= 100000000; i++) {
		add_factors(i);		
	}
	exit(0);
	for (ulong i=0; i < nn+1; i++) {
		if (prime_fact[i] > 0) {
			cout << i << ": " << prime_fact[i] << endl;
		}
	}
}


int main() {
	FactFact *f = new FactFact(100000000);
}



/*

ulong FactFact::least_factor(ulong n) {
 if (least_fact_cache[n] == 0) {
	 least_fact_cache[n] = do_least_factor(n);
 }
 return(least_fact_cache[n]);
}

ulong FactFact::do_least_factor(ulong n) {

 if (primes->is_prime(n)) {
	return(n);	
 }
 if (n==0) return 0;  
 if (n%1 || n*n<2) return 1;
 if (n%2==0) return 2;  
 if (n%3==0) return 3;  
 if (n%5==0) return 5;
 for (ulong i=7;i<=sqrt(n);i+=30) {
  if (n%i==0)      return i;
  if (n%(i+4)==0)  return i+4;
  if (n%(i+6)==0)  return i+6;
  if (n%(i+10)==0) return i+10;
  if (n%(i+12)==0) return i+12;
  if (n%(i+16)==0) return i+16;
  if (n%(i+22)==0) return i+22;
  if (n%(i+24)==0) return i+24;
 }
return n;
}
*/