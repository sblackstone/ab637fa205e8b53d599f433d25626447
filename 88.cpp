#include <iostream>
#include <bitset>
#include <cmath>
#include <vector>

#define ulong unsigned long long

using namespace std;

int arr[12001];


void test(ulong k, ulong k_add, ulong k_mult, std::vector<ulong> *v) {
	ulong min;
	if (k_mult == 1 && k_add == 1) {
	  if (arr[v->size()] > k) {
			arr[v->size()]  = k;
	  }  	
		return;
	}
  if (v->size() > 0) {
		min = v->back();
  } else {
		min = 1;
  }
	for (ulong i=min; i <= k_mult; i++) {
		if (k_mult % i == 0 && k_add >= 1) {
			k_mult /= i;
			k_add -= i;
			v->push_back(i);
			test(k,k_add, k_mult, v);
			v->pop_back();
			k_mult *= i;
			k_add += i;
		}
	}
}

int main() {
  std::vector<ulong> *v = new std::vector<ulong>;
	int i = 0;
	for(i=0; i < 12001; i++) {
		arr[i] = 9999999;
	}

	for (i=0; i < 5000; i++) {
		v->clear();		
		test(i,i,i, v);
	}
	for (i=0; i < 12001; i++) {
	  if (arr[i] < 9999999) {
			cout << i << ": " << arr[i] << endl;
	  }	
	}

	return(0);
	
}