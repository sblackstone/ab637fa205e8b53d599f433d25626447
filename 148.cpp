#include <iostream>
#include <bitset>
#include <cmath>
#include <vector>

using namespace std;


#define ulong unsigned long long

ulong row(ulong n) {
	ulong tmp = n;
	ulong result = 1;
	while (tmp > 0) {
		result *= ((tmp % 7) + 1);
		tmp /= 7;
	}
	return(result);
}


int main() {
	ulong count = 0;
	for (ulong i = 0; i < 1000000000; i++) {
		count += row(i);
	}
	cout << count << endl;
	return(0);
}