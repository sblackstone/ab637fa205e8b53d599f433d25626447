#include <iostream>
#include <bitset>
#include <cmath>
#include <vector>

using namespace std;

#define MAX_PRIME 1000000
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


class Euler357 {
  private:
    Primes p;
  public:
    Euler357();
    int test(ulong);
    ulong test_all();
};

Euler357::Euler357() {


};


ulong Euler357::test_all() {
  ulong sum = 0;

	for(vector<ulong>::iterator i = p.primes->begin(); i != p.primes->end(); i++) {
    if (*i % 4 != 1 && *i % 9 != 1 && *i % 25 != 1 && *i % 49 != 1 && *i % 121 != 1 && *i % 169 != 1 && *i % 289 != 1) {
			if (test(*i-1)) {
				//cout << i-1 << endl;
		    sum += *i-1;
			}	else {
				//cout << "\t" << i-1 << endl;
			}
			cout << "test" << endl;
    } else {
			cout << "skip" << endl;
    }
		//cout << *i << endl;
	}
  return(sum);
}

int Euler357::test(ulong n) {
  for (ulong i=1; i <= n; i++) {
    if (n % i == 0) {
      if (!p.is_prime(i + n/i)) {
        return(false);
      }
    }
  }
  return(true);
};




int main() {
  Euler357 e;
	cout << e.test_all() << endl;
  return(0);
}
