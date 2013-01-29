#include <iostream>
#include <bitset>
#include <cmath>
#include <vector>

using namespace std;

#define MAX 1000000
#define ulong unsigned long long


/*
Primes::Primes() {
  b->reset();
  b->flip();
  b->set(0,0);
  for (int i=2; i < MAX_PRIME; i++) {
    if (b->test(i)) {
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
*/

int main() {
  bitset<MAX> *b;
  b =  new std::bitset<MAX>;
	b->reset();
	b->flip();	
	ulong i;
	for (i=0; i < MAX; i++) {
		
	}  
}
