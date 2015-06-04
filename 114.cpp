#include <iostream>
#include <bitset>
#include <cmath>
#include <vector>
using namespace std;


#define ulong unsigned long long

void prulong_state(vector<ulong>* state) {
	char c = 'B';
	for (vector<ulong>::iterator i = state->begin(); i != state->end(); i++) {
		for (ulong j =0; j < *i; j++) {
			cout << c << " ";
		}
		c = (c == 'R' ? 'B' : 'R');
	}
	cout << endl;
}

void prulong_state2(vector<ulong>* state) {
	for (vector<ulong>::iterator i = state->begin(); i != state->end(); i++) {
		cout << *i << " ";
	}
	cout << endl;
}


ulong cc = 0;

void search(ulong left, vector<ulong>* state, ulong cur = 0) {
//	cout << "left: " << left << endl; 
	ulong min;
  if (state->empty()) {
		min = 0;
  } else {
		min = (cur == 1 ? 3 : 1);	
  }

	if (left == 0) {
		cc++;
		return;
	}
	for (ulong i = min; i <= left; i++) {
		state->push_back(i);
		search(left - i, state, (cur+1) % 2);
		state->pop_back();
	}	
}


int main() {
	vector<ulong> *v = new std::vector<ulong>;
	for (int i =0; i < 25; i++) {
		cc = 0;
		search(i, v, 0);
		cout << cc << endl;
		
	}
	return(0);
}