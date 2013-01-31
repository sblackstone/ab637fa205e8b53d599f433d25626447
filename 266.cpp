#include <iostream>
#include <bitset>
#include <cmath>
#include <vector>

using namespace std;

#define MAX_PRIME 100000000
#define ulong unsigned long long


void divisors(vector<ulong> *cur, vector<ulong> *fact, vector<ulong> *pfact) {
  if (cur->size() == pfact->size()) {
		ulong f = 1;
    	for(int i = 0; i < pfact->size(); i++) {
        if (cur->at(i) == 1) {
					f *= pfact->at(i);
        }
	    }
			fact->push_back(f);
			return;
  }
	for (int i=0; i < 2; i++) {
		cur->push_back(i);
		divisors(cur, fact, pfact);
		cur->pop_back();
	}
}


vector<ulong> v1;
vector<ulong> v2;
vector<ulong> v3;

int check(ulong n, bitset<MAX_PRIME> *primes, std::vector<ulong> *prime_list) {
	v1.clear();
	v2.clear();
	v3.clear();
	 ulong k = n;
   for(vector<ulong>::iterator i = prime_list->begin(); i != prime_list->end(); i++) {
	   if (k % *i == 0) {
			 v3.push_back(*i);
			 k /= *i; 
	   }
		 if (k == 1) { break; }
	 }
	
	 divisors(&v1, &v2, &v3);
	 for(vector<ulong>::iterator i = v2.begin(); i != v2.end(); i++) {
      if (!primes->test(*i + n / *i)) {
				return(false);
      }
	 }
	 return(true);
	
}


int main() {
   bitset<MAX_PRIME> *primes;
	 bitset<MAX_PRIME> *cand;
	 vector<ulong> *prime_list;
   primes =  new std::bitset<MAX_PRIME>;
   cand   =  new std::bitset<MAX_PRIME>;
   prime_list =  new std::vector<ulong>;
   cand->reset();
	 primes->reset();
	 primes->flip();
	 primes->set(0,0);
	 primes->set(1,0);
   for (ulong i=2; i < MAX_PRIME; i++) {
     if (primes->test(i)) {
			 prime_list->push_back(i);
			 if (primes->test(((i - 1) >> 1) + 2)) {
			   cand->set(i - 1, 1);				
			 }
			 ulong j = i*i;
			 while (j < MAX_PRIME) {
				primes->set(j,0);	
				j += i;
			 }
     }
   }
	cout << "Primes and candidates init'd" << endl;
	cand->set(1,0);
	for(vector<ulong>::iterator i = prime_list->begin(); i != prime_list->end(); i++) {
		ulong p2 = *i* *i;
		ulong k = 1;
		while (k*p2 < MAX_PRIME) {
			cand->set(k*p2, 0);
			k += 1;
		} 
  }

	cout << "Removed Prime powers" << endl;

	ulong count = 1;
	int loop = 1;
	for(vector<ulong>::iterator i = prime_list->begin(); i != prime_list->end(); i++) {
		ulong n = *i - 1;
		if (cand->test(n)) {
			loop++;
			if (loop % 10000 == 0) {
				cout << "Working on " << n << endl;
			}
			if (check(n, primes, prime_list)) {
				count += n;			
				//cout << "\t";
			}
			//cout << n << endl;	

		}
	}
	cout << count << endl;
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