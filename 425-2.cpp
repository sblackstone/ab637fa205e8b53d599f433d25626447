/*
Two positive numbers A and B are said to be connected (denoted by "A ↔ B") if one of these conditions holds:
(1) A and B have the same length and differ in exactly one digit; for example, 123 ↔ 173.
(2) Adding one digit to the left of A (or B) makes B (or A); for example, 23 ↔ 223 and 123 ↔ 23.

We call a prime P a 2's relative if there exists a chain of connected primes between 2 and P and no prime in the chain exceeds P.

For example, 127 is a 2's relative. One of the possible chains is shown below:
2 ↔ 3 ↔ 13 ↔ 113 ↔ 103 ↔ 107 ↔ 127
However, 11 and 103 are not 2's relatives.

Let F(N) be the sum of the primes ≤ N which are not 2's relatives.
We can verify that F(10**3) = 431 and F(10**4) = 78728.

Find F(10**7).

g++ -g -O3 -L/opt/local/lib/ -lboost_thread-mt -lboost_date_time-mt -lboost_system-mt -I/opt/local/include 425-2.cpp && time ./a.out

*/

#include <iostream>
#include <bitset>
#include <cmath>
#include <vector>
#include <boost/unordered_map.hpp>
using namespace std;

#define MAX_PRIME 10000000
#define slong long long


class Primes {
  private:
    bitset<MAX_PRIME> *b;
  public:
		vector<slong> *primes;
		boost::unordered_map<int, vector<slong>*> primes_by_len;
    Primes();
    int is_prime(slong);
};


int digits_in_num(slong i)
{
    return i > 0 ? (int) log10 ((double) i) + 1 : 1;
}

Primes::Primes() {
  b =  new std::bitset<MAX_PRIME>;
	primes =  new std::vector<slong>;
	for (int i=0; i <= digits_in_num(MAX_PRIME); i++) {
		primes_by_len[i] = new std::vector<slong>;
	} 
  b->reset();
  b->flip();
  b->set(0,0);
  for (int i=2; i < MAX_PRIME; i++) {
    if (b->test(i)) {
			primes->push_back(i);
			primes_by_len[digits_in_num(i)]->push_back(i);
      slong j = i*i;
      while (j < MAX_PRIME && j > 0) {
        b->set(j,0);
        j += i;
      }
    }
  }
	cout << "Primes are setup" << endl;
  return;  
}

int Primes::is_prime(slong n) {
  return(b->test(n) == 1);
};

int off_by_one(slong a, slong b) {
	int diff = abs(a-b);
	if (diff == 0) return(false);
  
  if (diff % 10 == 0) { 
    while (true) {
			diff = diff / 10;
			if (diff % 10 > 0) {
				break;
      }
    }	
		diff = diff - (diff % 10);
		return(diff == 0);
	} else {
		return (a - (a % 10) == b - (b % 10));
	}
}


int main() {
	Primes *p;
	p = new Primes();
	for (int i=100; i < 999; i++) {
		for (int j=i; j < 999; j++) {
		  if (off_by_one(i,j)) {
				cout << i << " " << j << endl;
		  }	
		}
	}
}





/*
slong power_10_ceil(slong n) {
	if (n < 10) return(10);
	if (n < 100) return(100);
	if (n < 1000) return(1000);
	if (n < 10000) return(10000);
	if (n < 100000) return(100000);
	if (n < 1000000) return(1000000);
	if (n < 10000000) return(10000000);
	if (n < 100000000) return(100000000);
	if (n < 1000000000) return(1000000000);
}


typedef boost::unordered_map<int, vector<slong>*> _smap;


_smap search_space;

void blarg(slong a, Primes *p) {
	search_space[a] = new std::vector<slong>;
	int final_digits[] = { 1,3,7,9};
	slong v;
	for (int i = 0; i < 3; i++) {
		v = a*10 + final_digits[i];
    if (v < MAX_PRIME && p->is_prime(v)) {
			  search_space[v] = 0;
			  search_space[a]->push_back(v);
			  //cout << a*10 + final_digits[i] << endl;
    }
	}
	slong power = power_10_ceil(a);
	for (int i = 1; i < 10; i++) {
		v = a + power*i;
    if (v < MAX_PRIME && p->is_prime(v)) {
				search_space[v] = 0;
				search_space[a]->push_back(v);
				//cout << a + (power * i) << endl;	
    }   		
	}
	for(vector<slong>::iterator i = p->primes_by_len[digits_in_num(a)]->begin(); i != p->primes_by_len[digits_in_num(a)]->end(); i++) {
		slong t1 = a;
		slong t2 = *i;
		if (t1 > t2) {
			slong t3 = t1;
			t1 = t2;
			t1 = t3;
		}
		slong diff = t2 - t1;
    if (diff % 10 == 0 && diff > 0) {
     while (diff % 10 == 0) {
			 diff /= 10; 
     }
		 diff = diff - (diff % 10);
		 if (diff == 0) {   
			if (*i < MAX_PRIME && p->is_prime(*i)) {
				search_space[a]->push_back(*i);
				search_space[*i] = 0;
				 //cout << *i << endl;				
			}
		 }
   }
	};
	
}

int main() {
	Primes *p = new Primes();
	slong count = 0;
	blarg(2, p);
	blarg(3, p);
	blarg(5, p);
	blarg(7, p);
  while(1) {
		int count = 0;
		for (_smap::iterator map_it = search_space.begin(); map_it != search_space.end(); map_it++) {
      if (map_it->second == 0) {
				cout << "processing " << map_it->first << endl;
				blarg(map_it->first, p);
				count ++;
	    }
//			cout << map_it->first << endl;	
//			cout << map_it->second << endl;	
      if (count == 0) {
				break;
      } 
		}
  }
/*
  for(vector<slong>::iterator i = p->primes->begin(); i != p->primes->end(); i++) {
		count++;
    if (count % 1000 == 0) {
			cout << count << endl;
    }
		blarg(*i,p);
	}	
  return(0);
*/
//}
