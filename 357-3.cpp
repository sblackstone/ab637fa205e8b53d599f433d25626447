#include <iostream>
#include <bitset>
#include <cmath>
#include <vector>
#include <boost/unordered_map.hpp>
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



int check(ulong n, bitset<MAX_PRIME> *primes, std::vector<ulong> *prime_list, std::vector<ulong> *v3) {
	 v1.clear();
	 v2.clear();
	 divisors(&v1, &v2, v3);
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
	 boost::unordered_map<int, std::vector<ulong> * > divisor_map;
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
				 divisor_map[i-1] = new std::vector<ulong>();
			 }
			 ulong j = i*i;
			 while (j < MAX_PRIME) {
				primes->set(j,0);	
				j += i;
			 }
     }
   }
	 cout << "Primes and candidates init'd" << endl;
	 ulong j;
   for(vector<ulong>::iterator i = prime_list->begin(); i != prime_list->end(); i++) {
		j = *i;
		while (j < MAX_PRIME) {
			if (cand->test(j)) {
				divisor_map[j]->push_back(*i);
			}
			j += *i;
		}
	 }


	 ulong answer = 1;
   for (ulong i=2; i < MAX_PRIME; i++) {
	   if (cand->test(i)) {
	     if (check(i, primes, prime_list, divisor_map[i])) {
				 answer += i;
	     }	
	   }
	 }
	cout << "The answer is :" << answer << endl;

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