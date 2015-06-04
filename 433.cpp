#include <iostream>
#include <bitset>
#include <cmath>
#include <vector>

using namespace std;

#define ulong unsigned long long
#define S 25000

ulong gcd_count(ulong a, ulong b) {
	return(b == 0 ? 0 : 1 + gcd_count(b, a % b));
}

ulong cc(ulong x, ulong y, ulong n, ulong target) {
	if (y % n != target) {
		if (y % n > target) {
  		y += target - (y % n);
		} else {
			y -= y % n;
			y -= (n - target);

		}
	}
	if (x % n != target) {
    if (x % n > target) {
			x += x %n;
			x += target;
    } else {
			x += target - (x % n);
    }
	}

	return(((y-x)/n) + 1);
}


int main() {
	
	//ulong sum = 4*S - 3;
  ulong sum = 0
	for (ulong b = 2; b <= S; b++) {
		cout << "Testing " << b << endl;
		for(ulong a = b+1; a <= S; a++) {
			if (a%b ==1 && a != b+1){
				break;
			}
			sum++;
			//sum += (gcd_count(a,b)*2 + 1) * cc(a, S, b, a % b);
		}
	}
	cout << "Answer: " << sum << endl;
}

