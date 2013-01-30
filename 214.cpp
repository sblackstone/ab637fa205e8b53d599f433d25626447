#include <iostream>
#include <bitset>
#include <cmath>
#include <vector>

using namespace std;

#define MAX_PRIME 40000000
#define ulong unsigned long long


ulong *totients;
bitset<MAX_PRIME> *primes;
vector<ulong> *prime_list;
int *length_cache;

int length(ulong n) {
	if (n == 1) {
		return(1);
	} else {
		if (length_cache[n] == 0) {
			length_cache[n] = 1 + length(totients[n]);
		}
		return(length_cache[n]);
	}
}

int main() {
   primes =  new std::bitset<MAX_PRIME>;
   prime_list =  new std::vector<ulong>;
	 primes->reset();
	 primes->flip();
	 primes->set(0,0);
	 primes->set(1,0);
   for (ulong i=2; i < MAX_PRIME; i++) {
     if (primes->test(i)) {
			 prime_list->push_back(i);
			 ulong j = i*i;
			 while (j < MAX_PRIME) {
				primes->set(j,0);	
				j += i;
			 }
     }
   }
	cout << "Primes and candidates init'd" << endl;

	totients = new ulong[MAX_PRIME];
	length_cache = new int[MAX_PRIME];
	for (ulong i = 0; i < MAX_PRIME; i++) {
		totients[i] = i;	
		length_cache[i] = 0;	
	}
	
	for(vector<ulong>::iterator p = prime_list->begin(); p != prime_list->end(); p++) {
		ulong i = 1;
		while (i*(*p) < MAX_PRIME) {
			totients[i*(*p)] *= (*p - 1);
			totients[i*(*p)] /= (*p);			
			i++;
		}		
	}

	ulong total = 0;

  for(vector<ulong>::iterator p = prime_list->begin(); p != prime_list->end(); p++) {
    if (length(*p) == 25) {
			total += *p;
    }
	}
	cout << "The answer is " << total << endl;

  return(0);
}

