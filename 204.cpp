#include <iostream>
#include <bitset>
#include <cmath>
#include <vector>

using namespace std;

#define MAX_PRIME 1000000000
#define ulong unsigned long long

#define HAM_TYPE 100

int main() {
   bitset<MAX_PRIME> *primes, *sieve;
	 vector<ulong> *prime_list;
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
   sieve  =  new std::bitset<MAX_PRIME>;
	 sieve->reset();
	 sieve->flip();
	 
	 ulong j;
   for(vector<ulong>::iterator i = prime_list->begin(); i != prime_list->end(); i++) {
    if (*i > HAM_TYPE) {
			j = *i;
			while (j < MAX_PRIME) {
				sieve->set(j,0);
				j+= *i;
			}   
    }
	};
	
	ulong sum = 0;
	for (j=0; j < MAX_PRIME; j++) {
		if (sieve->test(j)) {
			sum += 1;
		}
	}
	cout << "Answer is " << sum << endl;
	
  return(0);
}


/*

570 = 2 • 3 • 5 • 19
586 = 2 • 293
598 = 2 • 13 • 23
606 = 2 • 3 • 101
618 = 2 • 3 • 103
642 = 2 • 3 • 107
646 = 2 • 17 • 19
												658 = 2 • 7 • 47


*/