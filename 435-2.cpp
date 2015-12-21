/*

The Fibonacci numbers {fn, n ≥ 0} are defined recursively as fn = fn-1 + fn-2 with base cases f0 = 0 and f1 = 1.

Define the polynomials {Fn, n ≥ 0} as Fn(x) = ∑fixi for 0 ≤ i ≤ n.

For example, F7(x) = x + x2 + 2x3 + 3x4 + 5x5 + 8x6 + 13x7, and F7(11) = 268357683.

Let n = 1015. Find the sum [∑0≤x≤100 Fn(x)] mod 1307674368000 (= 15!).

*/

#include <iostream>
#include <bitset>
#include <cmath>
#include <vector>

#define ulong unsigned long long

using namespace std;

/*def gcd(a,b)
  return b == 0 ? a : gcd(b, a % b)
end
*/

ulong gcd(ulong a, ulong b) {
	return b == 0 ? a : gcd(b, a % b);
}

ulong lcm(ulong a, ulong b) {
	return a*b / gcd(a,b);
}

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

ulong nCk(ulong n,ulong k) {
	if (k==0 || n == k) {
		return(1);
	}
	return nCk(n-1, k-1) + nCk(n-1, k);
}

ulong Sp(ulong n, ulong p, ulong m) {
	if (n==1) {
		return(1);
	}
	return (modpow(n,p,m) + Sp(n-1, p, m)) % m;
}

ulong solve(ulong max_power, ulong max_x, ulong mod) {
	ulong answer = 0;
	ulong arr[101];
	for (int i =0; i <= max_x; i++) {
		arr[i] = i;
	}
	ulong fb = 0;
	ulong fa = 1;
	ulong fc = 0;
	for (ulong n=1; n <= max_power; n++) {
    if (n % 1000000 == 0)
		  cout << n << endl;
		for (int i=0; i <= max_x; i++) {
			answer = (answer + (arr[i] * fa % mod)) % mod;
			arr[i] = (arr[i] + ((arr[i] * (i-1)) % mod)) % mod;			
		}
		fc = (fa + fb) % mod;
		fb = fa;
		fa = fc;
	}

	return(answer);
}


/*
ulong solve(ulong max_power, ulong max_x, ulong mod) {
	ulong answer =0;
	ulong fb = 0;
	ulong fa = 1;
	ulong fc = 0;
	for (ulong n=0; n <= max_power; n++) {
		if (n % 10000 == 0) {
			cout << "On # " << n << endl;
		}
		answer =  (answer + fb * Sp(max_x, n, mod)) % mod;
		fc = (fa + fb) % mod;
		fb = fa;
		fa = fc;
	}
	return(answer);
}
*/


int main() {
	//cout << solve(4,5,99999999) << endl;
	cout << solve(1000000000000000,100,1307674368000) << endl;

	return(0);
}


