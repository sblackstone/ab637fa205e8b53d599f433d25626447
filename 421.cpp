#include <iostream>
#include <bitset>
#include <cmath>
#include <vector>

using namespace std;

#define MAX_PRIME 100000000
#define ulong unsigned long long


class Primes {
  private:
    bitset<MAX_PRIME> *b;
  public:
		vector<ulong> *primes;
    Primes();
    int is_prime(ulong);
};


Primes::Primes() {
  b =  new std::bitset<MAX_PRIME>;
	primes =  new std::vector<ulong>;
  b->reset();
  b->flip();
  b->set(0,0);
  for (int i=2; i < MAX_PRIME; i++) {
    if (b->test(i)) {
			primes->push_back(i);
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


int main() {
  Primes p;
  return(0);
}
