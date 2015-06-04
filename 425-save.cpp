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

g++ -O3 -L/opt/local/lib/ -lboost_thread-mt -lboost_date_time-mt -lboost_system-mt -I/opt/local/include 425.cpp && time ./a.out

*/

#include <iostream>
#include <bitset>
#include <cmath>
#include <vector>
#include <boost/unordered_map.hpp>
using namespace std;

#define MAX_PRIME 10000000
#define ulong unsigned long long


class Primes {
  private:
    bitset<MAX_PRIME> *b;
  public:
		vector<ulong> *primes;
		boost::unordered_map<int, vector<ulong>*> primes_by_len;
    Primes();
    int is_prime(ulong);
};


int digits_in_num(ulong i)
{
    return i > 0 ? (int) log10 ((double) i) + 1 : 1;
}

Primes::Primes() {
  b =  new std::bitset<MAX_PRIME>;
	primes =  new std::vector<ulong>;
	for (int i=0; i < 50; i++) {
		primes_by_len[i] = new std::vector<ulong>;
	} 
  b->reset();
  b->flip();
  b->set(0,0);
  for (int i=2; i < MAX_PRIME; i++) {
    if (b->test(i)) {
			primes->push_back(i);
			primes_by_len[digits_in_num(i)]->push_back(i);
      ulong j = i*i;
      while (j < MAX_PRIME) {
        b->set(j,0);
        j += i;
      }
    }
  }
	cout << "Primes are setup" << endl;
  return;  
}

int Primes::is_prime(ulong n) {
  return(b->test(n) == 1);
};




ulong power_10_ceil(ulong n) {
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

int main() {
	Primes *p = new Primes();

	int a = 123;
	int final_digits[] = { 1,3,7,9};
	for (int i = 0; i < 3; i++) {
    if (p->is_prime(a*10 + final_digits[i])) {
			cout << a*10 + final_digits[i] << endl;
    }
	}
	ulong power = power_10_ceil(a);
	for (int i = 1; i < 10; i++) {
    if (p->is_prime(a + power*i)) {
			cout << a + (power * i) << endl;
    }   		
	}
	for(vector<ulong>::iterator i = p->primes_by_len[digits_in_num(a)]->begin(); i != p->primes_by_len[digits_in_num(a)]->end(); i++) {
		ulong t1 = a;
		ulong t2 = *i;
		if (t1 > t2) {
			ulong t3 = t1;
			t1 = t2;
			t1 = t3;
		}
		ulong diff = t2 - t1;
    if (diff % 10 == 0 && diff > 0) {
     while (diff % 10 == 0) {
			 diff /= 10; 
     }
		 diff = diff - (diff % 10);
		 if (diff == 0) {   
			 cout << *i << endl;
		 }
   }
	};

  return(0);
}