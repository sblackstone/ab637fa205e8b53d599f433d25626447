#include <iostream>
#include <bitset>
#include <cmath>
#include <vector>


using namespace std;

#define MAX 1000
#define ulong unsigned long long


ulong rmax(ulong a) {
	ulong asquared = a*a;
	ulong t1 = (a+1) % asquared;
	ulong t2 = (a-1) % asquared;
	ulong n = 1;
	ulong max = 0;
	ulong v = (t1+t2) % asquared;
	while (n < asquared) {
		if (v > max) {
			max = v;
		}	
		n += 2;
		v  = (t1+t2) % asquared;
		t1 = (t1*(a+1)) % asquared;
		t2 = (t2*(a-1)) % asquared;

	}
	return(max);
}

int main() {
	ulong total = 0;
	for (ulong i = 3; i <= 1000; i++) {
    total += rmax(i);
	}
	cout << "Total is " << total << endl;
	return(0);
};