#include <iostream>

using namespace std;

int main() {
  unsigned long long i=0;
	for(; i < 1000000000000000; i++) {
    if (i % 1000000 == 0)
		cout << i << endl;
    
	}
	return(0);
}