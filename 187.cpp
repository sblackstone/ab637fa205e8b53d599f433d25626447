#include <iostream>
#include <bitset>
#include <cmath>
#include <vector>

using namespace std;


#define MAX_N  100000000
#define MAX_PRIME 1000000000
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
	Primes *p = new Primes();
	ulong total = 0;
	for(vector<ulong>::iterator i = p->primes->begin(); i != p->primes->end(); i++) {
	  for(vector<ulong>::iterator j = i; j != p->primes->end(); j++) {
      if (*i * *j >= MAX_N) {
				break;
      }
			//cout << *i << " x " << *j << " = " << *i * *j << endl;
			total += 1;
    }	
	}
	
  /*
	ulong q;
	while (p->primes->size() > 0) {
		ulong v = *(p->primes->begin());
    if (v*v < MAX_N) {
			total += 1;
    }
		p->primes->erase(p->primes->begin());
	  for(vector<ulong>::iterator i = p->primes->begin(); i != p->primes->end(); i++) {
			q = v * (*i);
			if (q <= MAX_N) {
				total++;
			} else {
				break;
			}
		}
	}
  */
	cout << "Total: " << total << endl;
	return(0);
}