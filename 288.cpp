#include <iostream>
#include <bitset>
#include <cmath>
#include <vector>

using namespace std;

#define ulong unsigned long long

int main() {
	ulong sn = 290797;
	for (ulong n = 0; n < 10000000; n++) {
		sn = (sn*sn) % 50515093;
	}
	
	return(0);
	
}