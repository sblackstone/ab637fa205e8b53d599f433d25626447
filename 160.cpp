#include <iostream>
#include <bitset>
#include <cmath>
#include <vector>

using namespace std;
#define ulong unsigned long long
#define N_VAL 1000000000000

ulong modpow(ulong b, ulong e, ulong m) {
	ulong result = 1;
	while (e > 0) {
		if (e & 1 == 1) {
			result = (result * b) % m;
		}
		e >>= 1;
		b = (b*b) % m;
	}
	return(result);
}


int main() {
	ulong ans = 1;
	for (ulong i=1; i <= N_VAL; i++) {
		ulong j = i;
		ans = (ans * (j % 100000000)) % 100000000;
    while (ans % 10 == 0) {
			ans /= 10;
    }
	} 
	cout << ans << endl;
}

