#include <iostream>
#include <bitset>
#include <cmath>
#include <vector>
#include <map>
using namespace std;

#define ulong unsigned long long


// g++ -O3 -L/opt/local/lib/ -lboost_thread-mt -lboost_date_time-mt -lboost_system-mt -I/opt/local/include 349.cpp && time ./a.out

typedef std::map<ulong, bool> inner_map;
typedef std::map<ulong, inner_map *> outer_map;

class Euler349 {
	public:
		int dir,loc_x,loc_y;
		outer_map *black_squares;
		Euler349();
		void rot_clock();
		void rot_cclock();
		void move_forward();
		bool is_black(ulong x,ulong y);
		void make_move();
};


Euler349::Euler349() {
	dir = 0;
	loc_x = 0;
	loc_y = 0;
	black_squares = new outer_map();
};


void Euler349::make_move() {
	if (is_black(loc_x,loc_y)) {
		(*black_squares)[loc_x]->erase(loc_y);
    if ((*black_squares)[loc_x]->begin() == (*black_squares)[loc_x]->end()) {
			black_squares->erase(loc_x);
    }
		rot_cclock();
	} else {
		if (black_squares->find(loc_x) == black_squares->end()) {
			(*black_squares)[loc_x] = new inner_map();
    }
		(*(*black_squares)[loc_x])[loc_y] = true;
		rot_clock();
	}
	move_forward();
};

bool Euler349::is_black(ulong x,ulong y) {
   if (black_squares->find(x) == black_squares->end()) {
	   return(false);
   }   
	 return((*black_squares)[x]->find(y) != (*black_squares)[x]->end());
};

void Euler349::rot_clock() {
	dir = (dir + 1) % 4;
};

void Euler349::rot_cclock() {
	dir = (dir - 1) % 4;
};

void Euler349::move_forward() {
  switch(dir) {
	  case 0:
		  loc_y += 1;
			break;
		case 1:
			loc_x += 1;
			break;
		case 2:
			loc_y -= 1;
			break;
		case 3:
			loc_x -= 1;
			break;
  }
};



int main() {
	
	Euler349 *e = new Euler349();
	for (ulong i = 0; i < 10000000000; i++) {
		e->make_move();		
	}
	cout << e->loc_x << "," << e->loc_y << endl;
	return(0);
}
