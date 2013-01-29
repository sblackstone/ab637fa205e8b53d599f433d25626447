#include <iostream>
#include <bitset>
#include <cmath>
#include <vector>

using namespace std;

#define MAX 1000
#define ulong unsigned long long



class Primes {
  private:
    bitset<MAX> *b;
  public:
		vector<ulong> *primes;
    Primes();
    int is_prime(ulong);
};


Primes::Primes() {
  b =  new std::bitset<MAX>;
	primes =  new std::vector<ulong>;
  b->reset();
  b->flip();
  b->set(0,0);
  for (int i=2; i < MAX; i++) {
    if (b->test(i)) {
			primes->push_back(i);
      ulong j = i*i;
      while (j < MAX) {
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



ulong calc(ulong n) {
	cout << "calculating " << n << endl;
	ulong j = n-1;
	for (; (j*j) % n != j; j--);
	return(j);
}



int main() {
	ulong *ans;
	Primes p;
	ans = new ulong[MAX];
	for(ulong j=0; j < MAX; j++) { ans[j] = 0; }
	ans[1] = 1;
  for(vector<ulong>::iterator i = p.primes->begin(); i != p.primes->end(); i++) {
		ulong j = *i;
    while (j < MAX) {
			ans[j] = 1;
			j *= *i;
    }
  }
	ulong total = 0;
	for (ulong i = 1; i < MAX; i++) {
		if (ans[i] == 0) {
			total += calc(i);
		} else {
			total += ans[i];
		}
	}
	cout << total << endl;
}
