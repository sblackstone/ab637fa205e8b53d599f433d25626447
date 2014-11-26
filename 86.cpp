// g++ -O3 -L/opt/local/lib/ -lboost_thread-mt -lboost_date_time-mt -lboost_system-mt -I/opt/local/include 86.cpp && time ./a.out

#include <iostream>
#include <bitset>
#include <cmath>
#include <vector>
#include <boost/unordered_map.hpp>

#define ulong unsigned long long
#define MAX_SQUARE (1000*1000 + 2000*2000)

using namespace std;

boost::unordered_map<ulong, ulong> smap;


void setup_squares() {
	for (ulong i=0; i < MAX_SQUARE; i++) {
		smap[i*i] = i;
	}
}

int is_square(ulong n) {
	if (n > MAX_SQUARE*MAX_SQUARE) {
		exit(1);
	}
	return(smap.count(n));
}

int test3(ulong h) {
	ulong s2 = 0;
	ulong l,w;
	ulong hsquared = h*h;
	for (l=1; l <= h; l++) {
		for (w=l; w <= h; w++) {
			if (is_square((l+w)*(l+w)+hsquared)) {
				s2++;
			}
		}
	}
	return(s2);
}

int main() {
	setup_squares();
	int sum = 0;
	int i = 1;
  while(sum < 1000000) {
		sum += test3(i++);	
		cout << sum << endl;
  }
	cout << i-1 << endl;
}

