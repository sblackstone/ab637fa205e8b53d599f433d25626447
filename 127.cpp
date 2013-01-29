#include <iostream>
#include <bitset>
#include <cmath>
#include <vector>

using namespace std;

#define MAX 120000
#define ulong unsigned long long


ulong gcd(ulong i, ulong j) {
	if (i == 0) { 
		return(j);
	}
  while (j != 0) {
	  if (i > j) {
			i = i - j;
	  } else {
			j = j - i;
	  }
  }
	return(i);
}


int main() {
	ulong a,b,c,max,add;
	max = 0;
  
	for (a=2; a < MAX; a++) {
    if (a % 2 == 0) {
			add = 2;
    } else {
			add = 1;
    }
		for (b=a+1; a+b < MAX; b+= add) {
	    if (gcd(a,b) == 1) {
				c = a + b;
				if (gcd(a,c) == 1 && gcd(b,c) == 1) {
          if (a*b*c > max) {
						max = a*b*c;
          }
				}		
	    }
		}
	}
	cout << "max: " << max << endl;	
	return(0);
}
